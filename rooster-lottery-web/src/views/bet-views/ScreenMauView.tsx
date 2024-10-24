import { PlusOutlined } from '@ant-design/icons';
import { Collapse, Typography, Button, Input, message } from 'antd';
import React, { useState } from 'react';

const { Title } = Typography;
const { Panel } = Collapse;

const ScreenMauView = () => {
    const [bet, setBet] = useState('');
    const [hasBet, setHasBet] = useState(false);

    const handleBetChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setBet(e.target.value);
    };

    const handleBetSubmit = () => {
        if (bet === '' || isNaN(Number(bet)) || Number(bet) < 0 || Number(bet) > 9) {
            message.error('Vui lòng nhập số cược hợp lệ (0-9)');
            return;
        }
        setHasBet(true);
        message.success('Bạn đã đặt cược thành công!');
    };

    return (
        <div className='container'>
            <style>
                {`
                    .betting-form {
                        display: flex;
                        flex-direction: column;
                        gap: 16px;
                        padding: 16px;
                    }
                    .betting-form input {
                        width: 100%;
                        padding: 8px;
                        border-radius: 4px;
                        border: 1px solid #d9d9d9;
                    }
                    .betting-form button {
                        width: 100%;
                        padding: 8px;
                        border-radius: 4px;
                        background-color: #1890ff;
                        color: white;
                        border: none;
                        cursor: pointer;
                    }
                    .betting-form button:disabled {
                        cursor: not-allowed;
                    }
                `}
            </style>
            {/* Tiêu đề */}
            <Title level={2} className="title">
                CÁCH CHƠI
            </Title>

            {/* Accordion (Collapse) */}

            <Collapse
                accordion
                className="collapse-container"
                expandIcon={({ isActive }) => (
                    <PlusOutlined rotate={isActive ? 45 : 0} />
                )}
            >
                <div className="betting-form">
                    <div>Giờ hiện tại: {new Date().toLocaleTimeString()}</div>
                    <div>Slot tiếp theo: 6:00pm</div>
                    <Input
                        type="number"
                        min="0"
                        max="9"
                        value={bet}
                        onChange={handleBetChange}
                        placeholder="Nhập số cược (0-9)"
                        disabled={hasBet}
                    />
                    <Button type="primary" onClick={handleBetSubmit} disabled={hasBet}>
                        Đặt cược
                    </Button>
                    {hasBet && <div>Bạn đã đặt cược cho slot hiện tại.</div>}
                </div>
            </Collapse>
        </div>
    );
};

export default ScreenMauView;
