import { Author } from "./author.model";
import { Book } from "./book.model";

export class AuthorBook {
  id: number;
  authorID: number;
  author: Author;
  bookID: number;
  book:Book;
}
