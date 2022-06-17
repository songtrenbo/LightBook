export class BookCreate {
  id: number;
  name: string;
  price: number;
  review: string;
  ratePoint: number;
  picture: string;
  chapter: string;
  categoryID: number;
  authors: Array<number> ;
}
