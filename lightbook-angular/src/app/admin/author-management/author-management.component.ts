import { AuthorService } from 'src/app/service/author.service';
import { Author } from './../../model/author.model';
import { Component, OnInit } from '@angular/core';
import { PagedResponse } from 'src/app/model/paged-response';
import { ActivatedRoute, Router } from '@angular/router';
import { FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-author-management',
  templateUrl: './author-management.component.html',
  styleUrls: ['./author-management.component.css']
})
export class AuthorManagementComponent implements OnInit {
  authors: Author[] = [];
  p: number = 1;
  limit: number = 6;
  total: number = 0;
  search: String ='';
  searchForm: FormGroup;
  constructor(private authorService:AuthorService,
              private router: Router,
              private route: ActivatedRoute) {
    route.params.subscribe(val => {
      this.getAuthors();
      this.initForm();
    });
  }

  ngOnInit(): void {
    this.getAuthors();
    this.initForm();
  }

  private initForm() {
    let search= '';

    this.searchForm = new FormGroup({
      'search': new FormControl(search),
    });

    this.searchForm.valueChanges.subscribe(form => {
      this.search = form.search;
      this.getAuthors();
    })
  }

  getAuthors() {
    this.authorService.getAdminAuthors(this.limit,this.p, this.search)
        .subscribe((res: PagedResponse<Author>)=>{
          this.authors=res.items;
          this.total = res.totalItems;
        })
  }

  pageChangeEvent(event: number){
    this.p = event;
    this.getAuthors();
  }

  onNewAuthor() {
    this.router.navigate(['admin/author-create']);
    }

}
