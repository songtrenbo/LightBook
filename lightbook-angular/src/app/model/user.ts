import { CartDetail } from './cartDetail';

export class User {
  id: number;
  totalPrice: number;
  userID: number;
  user: User;
  cartDetails: CartDetail[];
}
