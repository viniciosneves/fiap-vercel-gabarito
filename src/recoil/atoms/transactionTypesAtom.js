import { atom } from 'recoil';

export const transactionTypesState = atom({
  key: 'transactionTypesState',
  default: ['Depósito', 'Saque', 'Transferência'],
});