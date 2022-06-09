import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import Endpoints from '../constants/Endpoints';
import { Category } from '../model/category.model';

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'Application/json' }),
};
const apiUrl = `${Endpoints.urlBackend}/Category`;

@Injectable({
  providedIn: 'root',
})
export class CategoryService {
  constructor(private httpClient: HttpClient) {}

  getAll(): Observable<Category[]> {
    return this.httpClient.get<Category[]>(`${apiUrl}`).pipe();
  }
  getById(id: number): Observable<Category> {
    return this.httpClient.get<Category>(`${apiUrl}/${id}`).pipe();
  }
}
