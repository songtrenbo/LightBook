import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import Endpoints from '../constants/Endpoints';
import { Catalog } from '../model/catalog.model';
import { PagedResponse } from '../model/paged-response';

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'Application/json' }),
};
const apiUrl = `${Endpoints.urlBackend}/Catalog`;

@Injectable({
  providedIn: 'root',
})
export class CatalogService {
  constructor(private httpClient: HttpClient) {}

  getCatalog(catalogId: number | null): Observable<Catalog[]> {
    return this.httpClient.get<Catalog[]>(`${apiUrl}?Id=${catalogId}`).pipe();
  }
  getAdminCatalogs(limit: number, page: number,search: String): Observable<PagedResponse<Catalog>>{
    return this.httpClient.get<PagedResponse<Catalog>>(apiUrl+"?limit="+limit+"&page="+page+"&search="+search);
  }
  createCatalog(catalog:Catalog){
    const httpOptions = {
      headers: new HttpHeaders({ 'Content-Type': 'Application/json', Authorization: 'Bearer '+ JSON.parse(localStorage.getItem('Token')!).accessToken }),
    };
    return this.httpClient.post(`${apiUrl}`,catalog,httpOptions);
  }
}
