import { store } from '@/redux/stores/store';
import CounterView from '@/views/CounterView';
import { Provider } from 'react-redux';
import { Route, BrowserRouter as Router, Routes } from 'react-router-dom';
import BetHistoryView from './views/bet-views/BetHistoryView';
import BettingView from './views/bet-views/BettingView';
import MasterLayout from './views/layout/MasterLayout';

function App() {
  return (
    <Provider store={store}>
      <Router>
        <Routes>
          <Route path="/" element={<MasterLayout />} >
            {/* <Route path="/" element={<HomeView />} /> */}
            <Route path="/" element={<BettingView />} />
            <Route path="/betting" element={<BettingView />} />
            <Route path="/bet-history" element={<BetHistoryView />} />
            <Route path="/counter-view/:paramA?/:paramB?" element={<CounterView />} />
          </Route>
        </Routes>
      </Router>
    </Provider>
  );
}

export default App;
