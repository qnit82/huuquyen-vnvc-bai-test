import SlotApi from '@/services/api/SlotApi';
import { Collapse, List, notification, Typography } from 'antd';
import { useEffect, useState } from 'react';

const { Title } = Typography;
const { Panel } = Collapse;

const BetHistoryView = () => {

    interface BetHistoryItem {
        slotId: string;
        slotTime: string;
        betNumber: number;
        resultNumber: number;
        betTime: string;
        isWinner: boolean;
        spined: boolean;
        spinTime: string;
    }
    
    const [data, setData] = useState<BetHistoryItem[]>([]);
    useEffect(() => {
        getSlotBetUserAsync();
    }, []);

    const getSlotBetUserAsync = async () => {
        //to paginate after basic testing is complete
        const params = {
            page:1,
            pageSize:100
        }
        let response = await SlotApi.GetSlotBetUserAsync(params);
        if(response && response.data){
            setData(response.data);
        }else{
            notification.error({
                message: "Error!",
                description: response.message,
            })
        }
        
    }

    return (
        <div className='container'>
            <style>
                {`
                    .container {
                        padding: 20px;
                    }
                    .title {
                        text-align: center;
                        margin-bottom: 20px;
                    }
                    .bet-history {
                        margin-top: 20px;
                    }
                `}
            </style>
            <Title level={2} className="title">
                BETTING HISTORY
            </Title>
            <Collapse className="bet-history" defaultActiveKey={['1']}>
                <Panel header="Your betting history" key="1">
                    <List
                        dataSource={data}
                        renderItem={item => (
                            <List.Item>
                                <List.Item.Meta
                                    title={`Slot ID: ${item.slotId} - Slot Time: ${item.slotTime}`}
                                    description={`Bet Number: ${item.betNumber} - Result: ${item.resultNumber} - Bet Time: ${item.betTime} - Status: ${item.isWinner ? 'Win' : 'Lose'} - Spined: ${item.spined ? 'Spined' : 'Not Spined'} - Spin Time: ${item.spinTime}`}
                                />
                            </List.Item>
                        )}
                    />
                </Panel>
            </Collapse>
        </div>
    );
};

export default BetHistoryView;
