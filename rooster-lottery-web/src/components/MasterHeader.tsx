import { Breadcrumb } from 'antd';
import { Link } from 'react-router-dom';

const MasterHeader = () => {
  return (
    <Breadcrumb style={{ margin: '16px 0' }}>
      <Breadcrumb.Item>App</Breadcrumb.Item>
      <Breadcrumb.Item>
        <Link to="/">Home</Link>
      </Breadcrumb.Item>
      <Breadcrumb.Item>
        <Link to="/counter-view">Counter</Link>
      </Breadcrumb.Item>
      <Breadcrumb.Item>
        <Link to="/account-view">Account</Link>
      </Breadcrumb.Item>
    </Breadcrumb>
  );
};

export default MasterHeader;
