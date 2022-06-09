import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import Endpoints from '../constants/Endpoints';
import { Book } from '../model/book.model';

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'Application/json' }),
};
const apiUrl = `${Endpoints.urlBackend}/Book`;

@Injectable({
  providedIn: 'root',
})
export class BookService {
  passenger: any;
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
}
