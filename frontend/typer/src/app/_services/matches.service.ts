import { Injectable } from '@angular/core';

import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

import { BaseApiService } from './base-api.service';

import { Match, Round, MatchRound } from '../_models';

@Injectable()
export class MatchesService extends BaseApiService<Match> {
  protected url = '/matches/';

  // wywoływane po otrzymaniu odpowiedzi - wspólny kod
  protected afterRequestCommon(resp): Match {
    return new Match(resp);
  }

  getItemsGroupedList(): Observable<any> {
    this.beforeRequest();
    const url = this.getUrl('list') + 'grouped/';
    return this.http
      .get(url, {headers: this.headers})
      .pipe(
        map(resp => {
          const matchRounds = [];
          Object.keys(resp).forEach(roundId => {
            const roundDict = resp[roundId];
            if (roundDict && 'round' in roundDict) {
              const matchRound = new MatchRound(roundDict['round']);
              if ('groups' in roundDict) {
                const groupsDict = roundDict['groups'];
                const matchGroups = [];
                Object.keys(groupsDict).forEach(groupId => {
                  const groupDict = groupsDict[groupId];
                  if (groupDict && 'group' in groupDict) {
                    const group = groupDict['group'];
                    const matchGroup = new MatchRound(groupDict['group']);
                    if ('matches' in groupDict) {
                      const matches = groupDict['matches'];
                      if (matches) {
                        const matchObjs = [];
                        matches.forEach(match => {
                          matchObjs.push(new Match(match));
                        });
                        matchGroup.matches = matchObjs;
                      }
                    }
                    matchGroups.push(matchGroup);
                  }
                });
                matchRound.groups = matchGroups;
              } else if ('matches' in roundDict) {
                const matches = roundDict['matches'];
                if (matches) {
                  const matchObjs = [];
                  matches.forEach(match => {
                    matchObjs.push(new Match(match));
                  });
                  matchRound.matches = matchObjs;
                }
              }
              matchRounds.push(matchRound);
            }
          });
          return matchRounds;
        }
      )
    );
  }
}
