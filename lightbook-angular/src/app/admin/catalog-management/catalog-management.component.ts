import { CatalogService } from 'src/app/service/catalog.service';
import { Component, OnInit } from '@angular/core';
import { Catalog } from 'src/app/model/catalog.model';
import { PagedResponse } from 'src/app/model/paged-response';
import { ActivatedRoute, Router } from '@angular/router';
import { FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-catalog-management',
  templateUrl: './catalog-management.component.html',
  styleUrls: ['./catalog-management.component.css']
})
export class CatalogManagementComponent implements OnInit {
  catalogs: Catalog[] = [];
  p: number = 1;
  limit: number = 6;
  total: number = 0;
  search: String ='';
  searchForm: FormGroup;
  constructor(private catalogService: CatalogService,
              private router: Router,
              private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.getCatalogs();
    this.initForm();
  }

  private initForm() {
    let search= '';

    this.searchForm = new FormGroup({
      'search': new FormControl(search),
    });

    this.searchForm.valueChanges.subscribe(form => {
      this.search = form.search;
      this.getCatalogs();
    })
  }

  getCatalogs() {
    this.catalogService.getAdminCatalogs(this.limit,this.p,this.search)
        .subscribe((res: PagedResponse<Catalog>)=>{
          this.catalogs=res.items;
          this.total = res.totalItems;
        })
  }

  pageChangeEvent(event: number){
    this.p = event;
    this.getCatalogs();
  }

  onNewCatalog() {
    this.router.navigate(['admin/book-create']);
    }
}
