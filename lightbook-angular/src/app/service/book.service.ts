import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import Endpoints from '../constants/Endpoints';
import { Book } from '../model/book.model';
import { BookUser } from '../model/bookUser.model';

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
}
