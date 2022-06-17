import { Book } from './book.model';
import { Cart } from './cart';

export class CartDetail {
  id: number;
  totalPrice: number;
  cartID: number;
  cart: Cart;
  bookID: number;
  book: Book;
}
