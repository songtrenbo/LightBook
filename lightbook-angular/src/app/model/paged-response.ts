import { Book } from './book.model';
export class PagedResponse<T>{
  currentPage: number;
  totalItems: number;
  totalPages: number;
  items: Array<T>;
}
