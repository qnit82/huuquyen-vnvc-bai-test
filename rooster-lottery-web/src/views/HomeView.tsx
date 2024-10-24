import { PlusOutlined } from '@ant-design/icons';
import { Button, Collapse, Typography } from 'antd';
import { useSelector } from 'react-redux';
import '@/styles/home-view.css';

const { Title } = Typography;
const { Panel } = Collapse;

const items = [
  {
    key: '1',
    label: 'Mua vé ở đâu',
    content: 'Chi tiết về mua vé...'
  },
  {
    key: '2',
    label: 'Số cách chơi của sản phẩm',
    content: 'Chi tiết về cách chơi...'
  },
  {
    key: '3',
    label: 'Cách chơi',
    content: 'Chi tiết về cách chơi...'
  },
  {
    key: '4',
    label: 'Xem kết quả quay số mở thưởng',
    content: 'Chi tiết về kết quả...'
  },
  {
    key: '5',
    label: 'Chơi thử',
    content: 'Chi tiết về chơi thử...'
  },
  {
    key: '6',
    label: 'Điều kiện dự thưởng',
    content: 'Chi tiết về điều kiện...'
  },
];

const HomeView = () => {
  const counter = useSelector((state: any) => state.counter.value);
  const isSignedIn = useSelector((state: any) => state.account.signedIn);

  return (
    <div className='container'>
      <style></style>
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
        style={{ backgroundColor: '#f7f7f7', borderRadius: '8px' }}
      >
        {items.map(item => (
          <Panel header={item.label} key={item.key} className='panel'>
            <p className='panel-content'>{item.content}</p>
          </Panel>
        ))}
      </Collapse>

      <Button type='primary' className='button'>Hello</Button>
      <h2>Home View</h2>
      <p>Counter: {counter}</p>
      <p>{isSignedIn ? 'Signed In' : 'Not Signed In'}</p>
    </div>
  );
};

export default HomeView;
