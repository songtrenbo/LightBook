import { Category } from './../model/category.model';
import { PagedResponse } from 'src/app/model/paged-response';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import Endpoints from '../constants/Endpoints';

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
  getAdminCategories(limit: number, page: number, search: String): Observable<PagedResponse<Category>>{
    return this.httpClient.get<PagedResponse<Category>>(apiUrl+"?limit="+limit+"&page="+page+"&search="+search);
  }
  getAdminCategoriesById(id: number): Observable<PagedResponse<Category>>{
    return this.httpClient.get<PagedResponse<Category>>(apiUrl+"?id="+id);
  }
  getById(id: number): Observable<Category> {
    return this.httpClient.get<Category>(`${apiUrl}/${id}`).pipe();
  }
  createCategory(category:Category){
    const httpOptions = {
      headers: new HttpHeaders({ 'Content-Type': 'Application/json', Authorization: 'Bearer '+ JSON.parse(localStorage.getItem('Token')!).accessToken }),
    };
    return this.httpClient.post(`${apiUrl}`,category,httpOptions);
  }
  editCategory(category:Category){
    const httpOptions = {
      headers: new HttpHeaders({ 'Content-Type': 'Application/json', Authorization: 'Bearer '+ JSON.parse(localStorage.getItem('Token')!).accessToken }),
    };
    return this.httpClient.put(`${apiUrl}`,category,httpOptions);
  }
}
