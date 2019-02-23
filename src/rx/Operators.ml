open Rx

(* OPERATOR: catchError *)
external _catchError : ('err -> 'a observable -> 'b observable [@bs.uncurry]) -> ('a, 'b) operator = "catchError"
  [@@bs.module "rxjs/operators"]

let catchError selector stream = stream |> _catchError selector

(* OPERATOR: debounceTime *)
external _debounceTime : int -> ?scheduler:scheduler -> unit -> ('a, 'a) operator = "debounceTime"
  [@@bs.module "rxjs/operators"]

let debounceTime timerInMs ?scheduler () stream = stream |> _debounceTime timerInMs ?scheduler ()

(* OPERATOR: defer *)
external _defer : (unit -> 'b observable [@bs.uncurry]) -> ('a, 'b) operator = "defer"
  [@@bs.module "rxjs/operators"]

external _deferPromise : (unit -> 'b Js.Promise.t [@bs.uncurry]) -> ('a, 'b) operator = "defer"
  [@@bs.module "rxjs/operators"]

external _deferArray : (unit -> 'b array) -> ('a, 'b) operator = "defer"
  [@@bs.module "rxjs/operators"]

let defer factory stream = stream |> _defer factory
let deferPromise factory stream = stream |> _deferPromise factory
let deferArray factory stream = stream |> _deferArray factory


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

let switchMap project stream = stream |> _switchMap project
let switchToArray project stream = stream |> _switchToArray project
let switchToPromise project stream = stream |> _switchToPromise project

(* OPERATOR: take *)
external _take : int -> ('a, 'a) operator = "take"
  [@@bs.module "rxjs/operators"]

let take count stream = stream |> _take count

(* OPERATOR: withLatestFrom *)
external _withLatestFrom2 : 'b observable -> ('a, ('a * 'b)) operator = "withLatestFrom"
  [@@bs.module "rxjs/operator"]

external _withLatestFrom3 : 'b observable -> 'c observable -> ('a, ('a * 'b * 'c)) operator = "withLatestFrom"
  [@@bs.module "rxjs/operator"]

external _withLatestFrom4 :
  'b observable -> 'c observable -> 'd observable -> ('a, ('a * 'b * 'c * 'd)) operator = "withLatestFrom"
  [@@bs.module "rxjs/operator"]

external _withLatestFrom5 :
  'b observable -> 'c observable -> 'd observable -> 'e observable ->
  ('a, ('a * 'b * 'c * 'd * 'e)) operator = "withLatestFrom"
  [@@bs.module "rxjs/operator"]

let withLatestFrom2 stream sourceStream = sourceStream |> _withLatestFrom2 stream

let withLatestFrom3 stream1 stream2 sourceStream = sourceStream |> _withLatestFrom3 stream1 stream2

let withLatestFrom4 stream1 stream2 stream3 sourceStream =
  sourceStream |> _withLatestFrom4 stream1 stream2 stream3

let withLatestFrom5 stream1 stream2 stream3 stream4 sourceStream =
  sourceStream |> _withLatestFrom5 stream1 stream2 stream3 stream4
