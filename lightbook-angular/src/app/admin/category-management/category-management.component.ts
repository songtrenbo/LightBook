import { CategoryService } from 'src/app/service/category.service';
import { Component, OnInit } from '@angular/core';
import { Category } from 'src/app/model/category.model';
import { PagedResponse } from 'src/app/model/paged-response';
import { ActivatedRoute, Router } from '@angular/router';
import { FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-category-management',
  templateUrl: './category-management.component.html',
  styleUrls: ['./category-management.component.css']
})
export class CategoryManagementComponent implements OnInit {
  categories: Category[] = [];
  p: number = 1;
  limit: number = 6;
  total: number = 0;
  search: String ='';
  searchForm: FormGroup;
  constructor(private categoryService: CategoryService,
              private router: Router,
              private route: ActivatedRoute) {
                route.params.subscribe(val => {
                  this.getCategories();
                  this.initForm();
                });
              }

  ngOnInit(): void {
    this.getCategories();
    this.initForm();
  }

  private initForm() {
    let search= '';

    this.searchForm = new FormGroup({
      'search': new FormControl(search),
    });

    this.searchForm.valueChanges.subscribe(form => {
      this.search = form.search;
      this.getCategories();
    })
  }

  getCategories() {
    this.categoryService.getAdminCategories(this.limit,this.p,this.search)
        .subscribe((res: PagedResponse<Category>)=>{
          this.categories=res.items;
          this.total = res.totalItems;
        })
  }

  pageChangeEvent(event: number){
    this.p = event;
    this.getCategories();
  }

  onNewCategory() {
    this.router.navigate(['admin/category-create']);
    }
}
