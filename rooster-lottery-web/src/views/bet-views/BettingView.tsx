import { Button, Collapse, Input, message, notification, Tabs, Typography } from 'antd';
import React, { useCallback, useEffect, useState } from 'react';

import BetApi from '@/services/api/BetApi';
import SlotApi from '@/services/api/SlotApi';
import '@/styles/betting-view.css';
import { SlotType } from '@/types/SlotType';
import { useSelector } from 'react-redux';

const { Title } = Typography;

type Slot = SlotType & {
    totalBets?: number;
    winningBets?: number;
}

const useSlots = (spined: boolean, slotDate: Date) => {
    const [slots, setSlots] = useState<Slot[]>([]);
    const [slotInactive, setSlotInactive] = useState<Slot | null>(null);

    const getSlotsForDayAsync = useCallback(async () => {
        const params = {
            spined: spined,
            slotDate: slotDate.toISOString().split('T')[0],
        };

        const response = await SlotApi.GetSlotsForDayAsync(params);

        if (response?.status) {
            if (response.data) {
                const _slots = response.data as Slot[];

                let slotData = _slots.map((slotItem: any) => {
                    return {
                        ...slotItem.slot,
                        totalBets: slotItem.totalBets,
                        winningBets: slotItem.winningBets
                    };
                });

                setSlots(slotData);

                const _slotInactive = slotData
                    .filter(s => !s.spined && new Date(s.slotTime).getTime() > new Date().getTime())
                    .sort((a, b) => new Date(a.slotTime).getTime() - new Date(b.slotTime).getTime())[0];

                setSlotInactive(_slotInactive || null);
            }

        } else {
            throw new Error(response.message);
        }

    }, [spined, slotDate]);

    useEffect(() => {
        getSlotsForDayAsync();
    }, [getSlotsForDayAsync]);

    return { slots, slotInactive, refreshSlots: getSlotsForDayAsync };
};

const useCountdown = (slotInactive: Slot | null, onComplete: () => void) => {
    const [timeRemaining, setTimeRemaining] = useState('');

    useEffect(() => {
        if (!slotInactive) return;

        const interval = setInterval(() => {
            const timeRemainingMs = new Date(slotInactive.slotTime).getTime() - new Date().getTime();
            if (timeRemainingMs <= 0) {
                clearInterval(interval);
                onComplete();
            } else {
                const minutes = Math.floor((timeRemainingMs % (1000 * 60 * 60)) / (1000 * 60));
                const seconds = Math.floor((timeRemainingMs % (1000 * 60)) / 1000);
                setTimeRemaining(`${minutes} minutes : ${seconds} seconds`);
            }
        }, 1000);

        return () => clearInterval(interval);
    }, [slotInactive, onComplete]);

    return timeRemaining;
};

const BettingView: React.FC = () => {
    let slotRealtime:any = useSelector((state: any) => state.slot.betData??null);
    let spinSuccess:any = useSelector((state: any) => state.slot.betData??null);

    const [bet, setBet] = useState<string>('');
    const [spined, setSpined] = useState(false);
    const [slotDate, setSlotDate] = useState<Date>(new Date());
    const [hasBet, setHasBet] = useState(false);

    const { slots, slotInactive, refreshSlots } = useSlots(spined, slotDate);  

    const timeRemaining = useCountdown(slotInactive, refreshSlots);

    const handleBetChange = (e: React.ChangeEvent<HTMLInputElement>) => setBet(e.target.value);

    const handleBetSubmit = () => {
        if (bet === '' || isNaN(Number(bet)) || Number(bet) < 0 || Number(bet) > 9) {
            message.error('Please enter a valid bet number (0-9)');
            return;
        }

        const body = {
            slotId: (slotInactive as any)?.id ?? 0,
            betNumber: Number(bet)
        };

        if (slotInactive) {
            const response: any = BetApi.BetAsync(body);

            if (response || response.status) {
                setHasBet(true);
                message.success('You have successfully placed a bet!');
            } else {
                notification.error({
                    message: "Error!",
                    description: response.message,
                })
            }
        } else {
            message.error('Betting slot has expired');
        }

    };

    useEffect(() => {
        console.log("===:spinSuccess ",spinSuccess);
        if (spinSuccess !== null && spinSuccess?.spined) {
            notification.success({
                message: 'Spin Success',
                description: 'Click here to see the spin result',
                onClick: () => {
                    console.log("===: ",spinSuccess?.spined);
                    updateCallbackSpin("2");
                },
            });
        }
    }, [spinSuccess,slotRealtime]);

    const updateCallbackSpin = (key: string) => {
        if (key === "1") {
            setSpined(false);
        } else if (key === "2") {
            setSpined(true);
        }
    }

    const tabItems = [
        {
            key: '1',
            label: 'Unspined Slots',
            children: slots.length > 0 ? (
                <Collapse
                    defaultActiveKey={['0']}
                    items={slots.map((slot: any, index) => ({
                        key: index.toString(),
                        label: `Slot ${index + 1} - ${new Date(slot.slotTime).toLocaleString('en-US', { hour12: false })}`,
                        children: !slot.spined && slot.id === slotInactive?.id ? (
                            <div className='slot-bet'>
                                <div className='open'>
                                    <div className='slot-open'>
                                        <div>
                                            <p>Slot Time: {new Date(slot.slotTime).toLocaleString('en-US', { hour12: false })}</p>
                                            <p>Result Number: {slot.resultNumber !== null ? slot.resultNumber : 'No result yet'}</p>
                                            <p>Spined: {slot.spined ? 'Spined' : 'Not spined'}</p>
                                        </div>
                                        <div className="betting-info-box-2">
                                            {
                                                slotRealtime===null?<p>Total Bets: {slotInactive?.totalBets ?? 0}</p>:<p>Total Bets: {slotRealtime?.totalBets ?? 0}</p>
                                            }
                                            
                                        </div>
                                    </div>

                                    {
                                        /**
                                        * A slot is only allowed to be bet on if its draw time is less than 1 hour away.
                                        * This means if the draw is at 00:00 the next day, betting is allowed from 23:01 to 23:59 the day before.
                                        * If the draw is at 1:00, betting is only allowed from 00:01 to 00:59.
                                        * If the draw is at 2:00, betting is allowed from 01:01 to 01:59.
                                        */

                                        slotInactive && new Date(slot.slotTime).getTime() - new Date().getTime() <= 3600000 && new Date(slot.slotTime).getTime() - new Date().getTime() > 0 && (
                                            <div className="betting-form bet">
                                                <p>Draw Time: {new Date(slot.slotTime).toLocaleString('en-US', { hour12: false })}</p>
                                                <div>Remaining: {timeRemaining}</div>
                                                <Input
                                                    type="number"
                                                    min="0"
                                                    max="9"
                                                    value={bet}
                                                    onChange={handleBetChange}
                                                    placeholder="Enter bet number (0-9)"
                                                    disabled={hasBet}
                                                />
                                                <Button type="primary" onClick={handleBetSubmit} disabled={hasBet}>
                                                    Place Bet
                                                </Button>
                                                {hasBet && <div>You have placed a bet for the current slot.</div>}
                                            </div>
                                        )

                                    }

                                </div>
                            </div>

                        ) : (
                            <div>
                                <p>Slot Time: {new Date(slot.slotTime).toLocaleString('en-US', { hour12: false })}</p>
                                <p>Result Number: {slot.resultNumber !== null ? slot.resultNumber : 'No result yet'}</p>
                                <p>Spined: {slot.spined ? 'Spined' : 'Not spined'}</p>
                            </div>
                        )
                    }))}
                />
            ) : (
                <div className="slot-info center">
                    <div>
                        <p>No data available</p>
                    </div>
                </div>
            )
        },
        {
            key: '2',
            label: 'Spined Slots',
            children: slots.length > 0 ? (
                <Collapse
                    defaultActiveKey={['0']}
                    items={slots.map((slot: any, index) => ({
                        key: index.toString(),
                        label: `Slot ${index + 1} - ${new Date(slot.slotTime).toLocaleString('en-US', { hour12: false })}`,
                        children: (
                            <div className="slot-info">
                                <div>
                                    <p>Slot Time: {new Date(slot.slotTime).toLocaleString('en-US', { hour12: false })}</p>
                                    <p>Result Number: {slot.resultNumber}</p>
                                    <p>Spined: {slot.spined ? 'Spined' : 'Not spined'}</p>
                                </div>

                                <div className="betting-info-box">
                                    <p>Total Bets: {slot.totalBets ?? 0}</p>
                                    <p>Total Winners: {slot.winningBets ?? 0}</p>
                                </div>
                            </div>
                        )
                    }))}
                />
            ) : (
                <div className="slot-info center">
                    <div>
                        <p>No data available</p>
                    </div>
                </div>
            )
        }
    ];

    return (
        <div className='container'>
            <div className="bet-header">
                <Title level={3} className="title">
                    PLACE BET
                </Title>
                <div className="date-picker">
                    <label htmlFor="slotDate">Select Date:</label>
                    <Input
                        type="date"
                        id="slotDate"
                        value={slotDate.toISOString().split('T')[0]}
                        onChange={(e) => {
                            setSlotDate(new Date(e.target.value));
                        }}
                    />
                </div>
            </div>

            <Tabs defaultActiveKey="1" items={tabItems} onChange={updateCallbackSpin} />

        </div>
    );
};

export default BettingView;
