import { BookCreate } from './../model/bookCreate.model';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import Endpoints from '../constants/Endpoints';
import { Book } from '../model/book.model';
import { BookUser } from '../model/bookUser.model';
import { PagedResponse } from '../model/paged-response';

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'Application/json'}),
};
const apiUrl = `${Endpoints.urlBackend}/Book`;

@Injectable({
  providedIn: 'root',
})
export class BookService {
  passenger: any;
  token: any;

  constructor(private httpClient: HttpClient) {}

  getBooks(limit: number = 12): Observable<Book[]> {
    return this.httpClient.get<Book[]>(`${apiUrl}?limit=${limit}`);
  }
  getAdminBooks(limit: number,page:number, search:String): Observable<PagedResponse<Book>> {
    return this.httpClient.get<PagedResponse<Book>>(`${apiUrl}?limit=${limit}&page=${page}&search=${search}`);
  }
  getAdminBooksById(id: number): Observable<PagedResponse<Book>> {
    return this.httpClient.get<PagedResponse<Book>>(`${apiUrl}?id=${id}`);
  }
  getBooksByCatalogId(catalogId: number, limit: number = 12) {
    return this.httpClient.get(
      `${apiUrl}?catalogId=${catalogId}&Limit=${limit}`
    );
  }
  getById(id: number): Observable<Book[]> {
    return this.httpClient.get<Book[]>(`${apiUrl}?Id=${id}`).pipe();
  }
  getBookByCategoryId(categoryId: number): Observable<Book> {
    return this.httpClient.get<Book>(`${apiUrl}/category/${categoryId}`).pipe();
  }
  getLibrary(userId: number): Observable<BookUser[]> {
    
    const httpOptions = {
      headers: new HttpHeaders({ 'Content-Type': 'Application/json', Authorization: 'Bearer '+ JSON.parse(localStorage.getItem('Token')!).accessToken }),
    };
    return this.httpClient.get<BookUser[]>(`${apiUrl}/library?userid=${userId}`,httpOptions);
  }

  addToLibrary(bookId:number, userId:number): Observable<any>{
    const httpOptions = {
      headers: new HttpHeaders({ 'Content-Type': 'Application/json', Authorization: 'Bearer '+ JSON.parse(localStorage.getItem('Token')!).accessToken }),
    };
    return this.httpClient.post(`${apiUrl}/${bookId}?userId=${userId}`,"", httpOptions);
  }
  createBook(book:BookCreate){
    const httpOptions = {
      headers: new HttpHeaders({ 'Content-Type': 'Application/json', Authorization: 'Bearer '+ JSON.parse(localStorage.getItem('Token')!).accessToken }),
    };
    return this.httpClient.post(`${apiUrl}`,book,httpOptions);
  }
  editBook(book:BookCreate){
    const httpOptions = {
      headers: new HttpHeaders({ 'Content-Type': 'Application/json', Authorization: 'Bearer '+ JSON.parse(localStorage.getItem('Token')!).accessToken }),
    };
    return this.httpClient.put(`${apiUrl}`,book,httpOptions);
  }
}
