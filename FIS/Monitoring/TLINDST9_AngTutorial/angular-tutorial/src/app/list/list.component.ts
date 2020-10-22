import { Component, OnInit } from '@angular/core';
import { Team } from '../team';


@Component({
  selector: 'app-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css']
})
export class ListComponent implements OnInit {

  teams = Team;

  constructor() {}

  ngOnInit(): void {
  }

}
