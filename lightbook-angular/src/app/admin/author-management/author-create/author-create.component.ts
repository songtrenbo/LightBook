import { PagedResponse } from './../../../model/paged-response';
import { AuthorService } from 'src/app/service/author.service';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router, ActivatedRoute, Params } from '@angular/router';
import { Author } from 'src/app/model/author.model';

@Component({
  selector: 'app-author-create',
  templateUrl: './author-create.component.html',
  styleUrls: ['./author-create.component.css']
})
export class AuthorCreateComponent implements OnInit {
  id: number;
  editMode = false;
  authorForm: FormGroup;

  constructor(private router: Router,
              private route:ActivatedRoute,
              private authorService:AuthorService,) { }

  ngOnInit(): void {
    this.route.params.subscribe((params: Params) => {
      this.id = +params['id'];
      this.editMode = params['id'] != null;
      this.initForm();
    })
  }

  private initForm() {
    let authorName="";

    if(this.editMode){
      this.authorService.getAuthorById(this.id).subscribe((res:PagedResponse<Author>) => {
        authorName = res.items[0].name;
        console.log('authorName',authorName)
        this.authorForm = new FormGroup({
          'name': new FormControl(authorName, Validators.required),
        });
      });
    }

    console.log('authorName',authorName)


    this.authorForm = new FormGroup({
      'name': new FormControl(authorName, Validators.required),
    });
  }

  onSubmit() {
    const formData = this.authorForm.value;
    if(this.editMode){
      const authorEdit = new Author();
      authorEdit.id = this.id;
      authorEdit.name = formData.name;
      console.log(formData);
      const result = this.authorService.editAuthor(authorEdit).subscribe((res:any)=> {
        console.log(res);
      })
      if(result){
        this.router.navigate(['admin/author-management']);
      }
    } else {
      const result = this.authorService.createAuthor(formData).subscribe((res: any)=>{
        console.log(res);
      });
      if(result){
        this.router.navigate(['admin/author-management']);
      }
    }
  }

  onCancel(){
    this.router.navigate(['admin/author-management']);
  }

}
