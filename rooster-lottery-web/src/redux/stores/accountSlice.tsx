import { createSlice } from '@reduxjs/toolkit';

export const accountSlice = createSlice({
  name: 'account',
  initialState: { signedIn: false },
  reducers: {
    signIn: (state) => { state.signedIn = true; },
    signOut: (state) => { state.signedIn = false; },
  },
});

export const { signIn, signOut } = accountSlice.actions;
export default accountSlice.reducer;
