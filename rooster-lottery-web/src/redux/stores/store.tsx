import { configureStore } from '@reduxjs/toolkit';
import counterReducer from './counterSlice';
import accountReducer from './accountSlice';
import slotSlice from './slotSlice';

export const store = configureStore({
  reducer: {
    counter: counterReducer,
    account: accountReducer,
    slot: slotSlice
  },
});
