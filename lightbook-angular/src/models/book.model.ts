import {Author} from "./author.model";
import {Category} from "./category.model";
export class Book {
    public id: number;
    public name: string;
    public price: number;
    public review: string;    
    public ratePoint: number;
    public picture: string;
    public chapter: string;
    public categoryId: number;
    public authors: Author[];

    constructor(id: number, name: string, price: number, review: string, ratePoint: number, picture: string, chapter: string, categoryId: number, authors: Author[]) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.review = review;
        this.ratePoint = ratePoint;
        this.picture = picture;
        this.chapter = chapter;
        this.categoryId = categoryId;
        this.authors = authors;
    }
}