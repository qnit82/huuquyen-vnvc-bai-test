import * as signalR from "@microsoft/signalr";
import { setBetData, spinSuccess } from "@/redux/stores/slotSlice";
import { useDispatch, useSelector } from 'react-redux';

import SignUpComponent from '@/components/SignUpComponent';
import { signIn } from '@/redux/stores/accountSlice';
import '@/styles/layout.css';
import { Collapse, Layout, Menu, theme, Typography } from 'antd';
import { Footer } from 'antd/es/layout/layout';
import { useEffect } from 'react';

import { Link, Outlet } from 'react-router-dom';

import UserApi from '@/services/api/UserApi';
import Util from "@/utils/Util";


const { Header, Content } = Layout;
const { Title } = Typography;
const { Panel } = Collapse;

const MasterLayout = () => {
    const dispatch = useDispatch();
    let isSignedIn = useSelector((state: any) => state.account.signedIn);

    useEffect(() => {
        getUserIdentity();
        const connection = new signalR.HubConnectionBuilder()
            .withUrl(`${Util.coreApi}/RoosterLotteryHub`)
            .withAutomaticReconnect()
            .build();

        connection.start()
            .then(() => console.log("SignalR Connected"))
            .catch((err) => console.error("SignalR Connection Error: ", err));

        connection.on("ReceiveBetMessage", (data) => {
            console.log("===ReceiveBetMessage: ", data);
            dispatch(setBetData(data));
        });

        connection.on("ReceiveMessageSpinSlot", (data) => {
            console.log("===ReceiveMessageSpinSlot: ", data);
            dispatch(spinSuccess(data));
        });

        return () => {
            connection.stop().then(() => console.log("SignalR Disconnected"));
        };
    }, [dispatch]);

    const getUserIdentity = async () => {
        let response = await UserApi.getUserInfoAsync();

        if (response && response.data) {
            dispatch(signIn());
        }
    }

    const {
        token: { colorBgContainer, borderRadiusLG },
    } = theme.useToken();

    return !isSignedIn ? <SignUpComponent /> : (
        <Layout className="layout-container">
            <Header className="header">
                <div className="logo">
                    <div className="logo" style={{ width: '65px', height: "65px", margin: '0 auto' }}>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" width="65" height="65">
                            <circle cx="50" cy="50" r="40" fill="#FFD700" stroke="#DAA520" strokeWidth="5" />
                            <ellipse cx="50" cy="55" rx="20" ry="15" fill="#FF6347" />
                            <circle cx="50" cy="35" r="12" fill="#FF6347" />
                            <circle cx="45" cy="25" r="5" fill="#FF4500" />
                            <circle cx="50" cy="23" r="4" fill="#FF4500" />
                            <circle cx="55" cy="25" r="5" fill="#FF4500" />
                            <polygon points="50,33 53,35 50,37" fill="#FFA500" />
                            <circle cx="47" cy="33" r="2" fill="#000" />
                        </svg>
                    </div>
                </div>

                <Menu
                    mode="horizontal"
                    defaultSelectedKeys={['1']}
                    className="menu"
                    items={[
                        { key: '1', label: <Link to="/betting">Betting</Link> },
                        { key: '2', label: <Link to="/bet-history">Bet History</Link> },
                    ]}
                />

            </Header>

            {/* Main Content */}
            <Content className="content">
                <Outlet />
            </Content>

            <Footer className='footer'>
                <div style={{ fontSize: '16px', marginBottom: '10px' }}>
                    Rooster Lottery ©{new Date().getFullYear()} Powered by Quyen Huu
                </div>
                <div style={{ fontSize: '14px' }}>
                    All rights reserved.
                </div>
            </Footer>

        </Layout>
    );
};

export default MasterLayout;
