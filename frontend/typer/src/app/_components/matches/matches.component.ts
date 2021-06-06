import { Component, Injector, ViewChild } from '@angular/core';

import * as services from '../../_services';
import { BaseComponent } from '../common';
import { Match, MatchRound, GroupDetails, MatchGroup } from '../../_models';
import { Router } from '@angular/router';
import { NgbTabset } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-matches',
  templateUrl: './matches.component.html',
  styleUrls: ['./matches.component.scss'],
})
export class MatchesComponent extends BaseComponent {
  @ViewChild('tabs') tabs: NgbTabset;
  private router: Router;
  private matchesService: services.MatchesService;
  private groupsDetailsService: services.GroupsDetailsService;
  matchRounds: MatchRound[] = null;
  groupsDetails: GroupDetails[] = null;
  showSpinner = true;
  anchorApplied = false;
  anchor: string = null;
  selectCurrentRound = false;

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
    this.router = injectorObj.get(Router);
    this.matchesService = injectorObj.get(services.MatchesService);
    this.groupsDetailsService = injectorObj.get(services.GroupsDetailsService);
  }

  getCurrentRoundId(): number {
    if (this.matchRounds && this.matchRounds.length) {
      let prev = null;
      for (const mr of this.matchRounds) {
        if ((!mr.matches || mr.matches.length === 0) && (!mr.groups || mr.groups.length === 0)) {
          return prev;
        }
        prev = mr.id;
      }
    }
    return null;
  }

  applyAnchor(): void {
    if (!this.anchorApplied && this.tabs) {
      if (this.anchor) {
        this.tabs.select(this.anchor);
        this.anchorApplied = true;
      } else if (this.selectCurrentRound) {
        const crId = this.getCurrentRoundId();
        if (crId) {
          this.tabs.select('round-' + crId);
          this.anchorApplied = true;
        }
      }
    }
  }

  actionsOnViewChecked(): void {
    this.applyAnchor();
  }

  actionsOnInit(): void {
    this.groupsDetailsService.getItemsList().subscribe(data => {
      this.groupsDetails = data;

      this.matchesService.getItemsGroupedList().subscribe(resp => {
        this.matchRounds = resp;
        this.setLoaded();
        this.activatedRoute.fragment.subscribe(fragment => {
          if (fragment !== null && fragment !== undefined) {
            if (fragment.indexOf('round') > -1) {
              this.anchor = fragment;
              this.applyAnchor();
            } else {
              setTimeout(() => {
                const navbar = document.querySelector('#navbar');
                if (navbar) {
                  const h = navbar.scrollHeight;
                  const qs = document.querySelector('#' + fragment);
                  if (qs) {
                    document.querySelector('#' + fragment).scrollIntoView({
                      behavior: 'smooth', block: 'center'
                    });
                  }
                }
              }, 1000);
            }
          } else {
            this.selectCurrentRound = true;
          }
        });
      });
    });
  }

  getContext(matches: Match[]): any {
    const ctx = {
      matches: matches
    };
    return ctx;
  }

  getGroupDetails(group: MatchGroup): GroupDetails {
    const groupDetails = this.groupsDetails.find(gd => gd.id === group.id);
    return groupDetails ? groupDetails : null;
  }

  // przekierowanie na stronę ze wszystkimi typami tego meczu
  goToAllMatchPredictions(match: Match): void {
    this.router.navigate(['/', 'predictions', 'match', match.id]);
  }

}
