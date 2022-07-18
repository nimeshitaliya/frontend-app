import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { catchError, map, Observable, throwError } from 'rxjs';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})

export class AppComponent implements OnInit {
  title = 'poc-app';
  public url: any;
  public isError: Boolean = false;
  public response: any;
  constructor(private http: HttpClient) { }

  ngOnInit(): void {
  }

  async api_call() {
    this.isError = false;
    await (await this.make_call("http://API_SERVER_URL" + this.url)).subscribe((data) => {
      this.response = data;
    }, (err) => {
      this.isError = true;
      this.response = err;
    }
    );
  }

  make_call = async (url: any) => {
    return this.http.get(url);
  }
}
