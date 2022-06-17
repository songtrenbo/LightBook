import { Author } from './../model/author.model';
import { PagedResponse } from 'src/app/model/paged-response';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import Endpoints from '../constants/Endpoints';

const apiUrl = `${Endpoints.urlBackend}/Author`;

@Injectable({
  providedIn: 'root'
})
export class AuthorService {

  constructor(private httpClient: HttpClient) { }

  getAll(): Observable<PagedResponse<Author>> {
    return this.httpClient.get<PagedResponse<Author>>(`${apiUrl}?limit=100`);
  }
  getAdminAuthors(limit: number,page:number,search:String): Observable<PagedResponse<Author>> {
    return this.httpClient.get<PagedResponse<Author>>(`${apiUrl}?limit=${limit}&page=${page}&search=${search}`);
  }
  getAuthorById(id: number): Observable<PagedResponse<Author>> {
    return this.httpClient.get<PagedResponse<Author>>(`${apiUrl}?id=${id}`);
  }
  createAuthor(author:Author){
    const httpOptions = {
      headers: new HttpHeaders({ 'Content-Type': 'Application/json', Authorization: 'Bearer '+ JSON.parse(localStorage.getItem('Token')!).accessToken }),
    };
    return this.httpClient.post(`${apiUrl}`,author,httpOptions);
  }
  editAuthor(author:Author){
    const httpOptions = {
      headers: new HttpHeaders({ 'Content-Type': 'Application/json', Authorization: 'Bearer '+ JSON.parse(localStorage.getItem('Token')!).accessToken }),
    };
    return this.httpClient.put(`${apiUrl}`,author,httpOptions);
  }
}
