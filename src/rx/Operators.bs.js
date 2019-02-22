// Generated by BUCKLESCRIPT VERSION 4.0.18, PLEASE EDIT WITH CARE

import * as Curry from "bs-platform/lib/es6/curry.js";
import * as Caml_option from "bs-platform/lib/es6/caml_option.js";
import * as Operators from "rxjs/operators";

function catchError(selector, stream) {
  return Curry._1(Operators.catchError(Curry.__2(selector)), stream);
}

function debounceTime(timerInMs, scheduler, param, stream) {
  return Curry._1(Operators.debounceTime(timerInMs, scheduler !== undefined ? Caml_option.valFromOption(scheduler) : undefined), stream);
}

function filter(predicate, stream) {
  return Curry._1(Operators.filter(Curry.__1(predicate)), stream);
}

function filteri(predicate, stream) {
  return Curry._1(Operators.filter(Curry.__2(predicate)), stream);
}

function map(project, stream) {
  return Curry._1(Operators.map(Curry.__1(project)), stream);
}

function mapi(project, stream) {
  return Curry._1(Operators.map(Curry.__2(project)), stream);
}

function switchMap(project, stream) {
  var operator = Operators.switchMap(Curry.__1(project));
  return Curry._1(operator, stream);
}

function switchToArray(project, stream) {
  return Curry._1(Operators.switchMap(Curry.__1(project)), stream);
}

function switchToPromise(project, stream) {
  return Curry._1(Operators.switchMap(Curry.__1(project)), stream);
}

export {
  catchError ,
  debounceTime ,
  filter ,
  filteri ,
  map ,
  mapi ,
  switchMap ,
  switchToArray ,
  switchToPromise ,
  
}
/* rxjs/operators Not a pure module */
