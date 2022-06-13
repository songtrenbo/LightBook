import { Book } from "./book.model";

export class BookUser {
  id: number;
  userID: number;
  bookID: number;
  book:Book;
}
