import { Category } from './category.model';
import { AuthorBook } from "./authorBook.model";

export class Book {
  id: number;
  name: string;
  price: number;
  review: string;
  ratePoint: number;
  picture: string;
  chapter: string;
  categoryID: number;
  authorBooks: AuthorBook[];
  category: Category;
}
