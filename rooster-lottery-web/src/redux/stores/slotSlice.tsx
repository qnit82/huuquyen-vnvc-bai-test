import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { SlotType } from '@/types/SlotType';
import { BetType } from '@/types/BetType';

interface SlotState {
  spinSuccess?: SlotType;
  slotData?: SlotType;
  betData?: BetType;
}

const initialState: SlotState = {
  spinSuccess: undefined,
  slotData: undefined,
  betData: undefined,
};

export const slotSlice = createSlice({
  name: 'slot',
  initialState,
  reducers: {
    spinSuccess: (state, action: PayloadAction<SlotType>) => {
      state.slotData = action.payload;
    },
    setSlotData: (state, action: PayloadAction<SlotType>) => {
      state.slotData = action.payload;
    },
    
    setBetData: (state, action: PayloadAction<BetType>) => {
      state.betData = action.payload;
    },
  },
});

export const { spinSuccess, setSlotData, setBetData } = slotSlice.actions;
export default slotSlice.reducer;
