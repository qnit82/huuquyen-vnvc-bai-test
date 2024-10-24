import { useEffect } from 'react';
import { useDispatch } from 'react-redux';
import { useLocation, useParams } from 'react-router-dom';
import { decrement, increment } from '@/redux/stores/counterSlice';

const CounterView = () => {
  const dispatch = useDispatch();
  const location = useLocation();

  const queryParams = new URLSearchParams(location.search);
  const param_A = queryParams.get('a');
  const param_B = queryParams.get('b');

  const { paramA, paramB } = useParams();

  useEffect(() => {

  }, []);

  return (
    <div>
      <h2>Counter View</h2>
      <button onClick={() => dispatch(increment())}>Increment</button>
      <button onClick={() => dispatch(decrement())}>Decrement</button>

      <div className='pdv-10 get-param-seo'>
        <p>Lấy param với url=/counter-view/123-123/456-456</p>
        <p>paramA: <span id='param-a'>{paramA}</span></p>
        <p>paramB: <span id='param-b'>{paramB}</span></p>
        <div className='pdv-10'>
          <a href='javascript:void(0)' id='get-param-a'>Get paramA: <span></span></a>
          <span>{" | "}</span>
          <a href='javascript:void(0)' id='get-param-b'>Get paramB: <span></span></a>
        </div>
      </div>

      <div className='pdv-10 get-param-not-seo'>
        <p>Lấy param với url=/counter-view?a=123-123&b=456-456</p>
        <p>{`paramA: ${param_A}`}</p>
        <p>{`paramB: ${param_B}`}</p>
      </div>
    </div>
  );
};

export default CounterView;
