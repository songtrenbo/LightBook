import { CartDetail } from './cartDetail';

export class Cart {
  id: number;
  totalPrice: number;
  userID: number;
  cartDetails: CartDetail[];
}
