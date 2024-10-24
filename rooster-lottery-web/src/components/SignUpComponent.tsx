import { Form, Input, Button, Checkbox, DatePicker, notification } from 'antd';
import '@/styles/sign-up.css';
import { useState } from 'react';
import UserApi from '@/services/api/UserApi';
import { signIn, signOut } from '@/redux/stores/accountSlice';
import { useDispatch } from 'react-redux';

const SignUpComponent = () => {
    const dispatch = useDispatch();

    const [step, setStep] = useState(1);
    const [phone, setPhone] = useState('');
    const [fullname, setFullname] = useState('');
    const [dob, setDob] = useState(null);
    const [registered, setRegistered] = useState(false);

    const onFinish = async (values: any) => {
        if (step === 1) {
            const params = { phoneNumber: phone };
            const response = await UserApi.getByPhoneNumberAsync(params);

            if (response && response.data) {
                localStorage.setItem('user', JSON.stringify(response.data));

                setStep(2);
                setRegistered(true);
                setFullname(response.data.fullName);
                setDob(response.data.dateOfBirth);
            } else {
                localStorage.setItem('user', JSON.stringify(response.data));
                setStep(2);
            }
        } else if (step === 2 && registered) {
            dispatch(signIn());
        } else if (step === 2 && !registered) {
            const body = {
                phoneNumber: phone,
                fullName: fullname,
                dateOfBirth: dob
            };

            const response = await UserApi.addAsync(body);

            if (response && response.status) {
                localStorage.setItem('user', JSON.stringify(response.data));
                setRegistered(true);
                dispatch(signIn());
            } else {
                notification.error({
                    message: "Error!",
                    description: response.message,
                });
            }
        }

    };

    const onFinishFailed = (errorInfo: any) => {
        console.log('Failed:', errorInfo);
    };

    const [form] = Form.useForm();
    const handleRememberChange = (value: any) => {
        form.setFieldValue('remember', value);
    };

    return (
        <div className="sign-up-container">
            <div className="sign-up-card">
                <div className="logo" style={{ width: '100px', height: "100px", margin: '0 auto' }}>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" width="100" height="100">
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

                <p className='rooster-lottery'>Welcome To</p>
                <p className='rooster-lottery second'>Rooster Lottery</p>
                <p>Please enter your phone number</p>

                <Form
                    name="signup"
                    initialValues={{ remember: true }}
                    onFinish={onFinish}
                    onFinishFailed={onFinishFailed}
                    className="signup-form"
                >
                    <Form.Item
                        name="phone"
                        rules={[{ required: true, message: 'Please input your phone number!' }]}
                    >
                        <Input
                            placeholder="Phone number"
                            className='phone'
                            value={phone}
                            onChange={(e) => setPhone(e.target.value)}
                        />
                    </Form.Item>

                    {
                        step === 2 && registered && (
                            <>
                                <div className="user-info">
                                    <p><strong>Full name:</strong> {fullname}</p>
                                    <p><strong>Phone number:</strong> {phone}</p>
                                    <p><strong>Date of birth:</strong> {dob}</p>
                                </div>
                            </>
                        )
                    }

                    {
                        step === 2 && !registered && (
                            <>
                                <Form.Item
                                    name="fullname"
                                    rules={[{ required: true, message: 'Please input your full name!' }]}
                                >
                                    <Input
                                        placeholder="Full name"
                                        className='fullname'
                                        value={fullname}
                                        onChange={(e) => setFullname(e.target.value)}
                                    />
                                </Form.Item>

                                <Form.Item
                                    name="dob"
                                    rules={[{ required: true, message: 'Please select your date of birth!' }]}
                                >
                                    <DatePicker
                                        placeholder="Date of birth"
                                        className='dob'
                                        format="DD/MM/YYYY"
                                        value={dob}
                                        onChange={(date) => setDob(date)}
                                    />
                                </Form.Item>
                            </>
                        )
                    }

                    {
                        step === 2 && (
                            <Form.Item name="remember" valuePropName="checked">
                                <Checkbox onChange={(e) => handleRememberChange(e.target.checked)}>Remember login?</Checkbox>
                            </Form.Item>
                        )
                    }

                    <Form.Item>
                        <Button type="primary" htmlType="submit" className="login-form-button">
                            {step === 1 ? 'Continue' : step === 2 && registered ? 'Play' : 'Sign Up'}
                        </Button>
                    </Form.Item>
                </Form>
            </div>
        </div>
    );
};

export default SignUpComponent;
