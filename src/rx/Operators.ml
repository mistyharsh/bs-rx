open Rx

(* OPERATOR: catchError *)
external _catchError : ('err -> 'a observable -> 'b observable [@bs.uncurry]) -> ('a, 'b) operator = "catchError"
  [@@bs.module "rxjs/operators"]

let catchError selector stream = stream |> _catchError selector

(* OPERATOR: debounceTime *)
external _debounceTime : int -> ?scheduler:scheduler -> unit -> ('a, 'a) operator = "debounceTime"
  [@@bs.module "rxjs/operators"]


let debounceTime timerInMs ?scheduler () stream = stream |> _debounceTime timerInMs ?scheduler ()

(* OPERATOR: filter *)
external _filter : ('a -> bool [@bs.uncurry]) -> ('a, 'a) operator = "filter"
  [@@bs.module "rxjs/operators"]

external _filteri : ('a -> int -> bool [@bs.uncurry]) -> ('a, 'a) operator = "filter"
  [@@bs.module "rxjs/operators"]

let filter predicate stream = stream |> _filter predicate
let filteri predicate stream = stream |> _filteri predicate


(* OPERATOR: map *)
external _map : ('a -> 'b [@bs.uncurry]) -> ('a, 'b) operator = "map"
  [@@bs.module "rxjs/operators"]

external _mapi : ('a -> int -> 'b [@bs.uncurry]) -> ('a, 'b) operator = "map"
  [@@bs.module "rxjs/operators"]

let map project stream = stream |> _map project
let mapi project stream =  stream |> _mapi project


(* OPERATOR: switchMap *)
external _switchMap : ('a -> 'b observable [@bs.uncurry]) -> ('a, 'b) operator = "switchMap"
  [@@bs.module "rxjs/operators"]

external _switchToArray : ('a -> 'b array [@bs.uncurry]) -> ('a, 'b) operator = "switchMap"
  [@@bs.module "rxjs/operators"]

external _switchToPromise : ('a -> ('b, 'e) Js.promise [@bs.uncurry]) -> ('a, 'b) operator = "switchMap"
  [@@bs.module "rxjs/operators"]

let switchMap project stream =
  let operator = _switchMap project in
  operator stream

let switchToArray project stream = stream |> _switchToArray project
let switchToPromise project stream = stream |> _switchToPromise project

(* OPERATOR: take *)
external _take : int -> ('a, 'a) operator = "take"
  [@@bs.module "rxjs/operators"]

let take count stream = stream |> _take count

(* OPERATOR: withLatestFrom *)
external _withLatestFrom2 : 'b observable -> ('a, ('a * 'b)) operator = "withLatestFrom"
  [@@bs.module "rxjs/operator"]

let withLatestFrom stream sourceStream = sourceStream |> _withLatestFrom2 stream
