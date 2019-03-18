open Rx

(* OPERATOR: buffer *)
external buffer : 'a observable -> ('b, 'b array) operator = "buffer"
  [@@bs.module "rxjs/operators"]

(* OPERATOR: bufferTime *)
external bufferTime : int -> 'a observable -> ('a, 'a array) operator = "bufferTime"
  [@@bs.module "rxjs/operators"]

(* OPERATOR: bufferCount *)
external bufferCount : int -> ?startBuffer:int -> unit -> ('a , 'a array) operator = "bufferCount"
  [@@bs.module "rxjs/operators"]

(* OPERATOR: catchError *)
external _catchError : ('err -> 'a observable -> 'b observable [@bs.uncurry]) -> ('a, 'b) operator = "catchError"
  [@@bs.module "rxjs/operators"]

let catchError selector stream = stream |> _catchError selector

(* OPERATOR: combineAll *)
external combineAll : unit -> ('a observable, 'a array) operator = "combineAll" [@@bs.module "rxjs/operators"]

(* OPERATOR: debounceTime *)
external _debounceTime : int -> ?scheduler:scheduler -> unit -> ('a, 'a) operator = "debounceTime"
  [@@bs.module "rxjs/operators"]

let debounceTime timerInMs ?scheduler () stream = stream |> _debounceTime timerInMs ?scheduler ()


(* OPERATOR: distinctUntilChanged *)
external _distinctUntilChanged : ?compare:('a -> 'a -> bool [@bs.uncurry]) -> unit -> ('a, 'a) operator = "distinctUntilChanged"
  [@@bs.module "rxjs/operators"]

let distinctUntilChanged ?compare () stream = stream |> _distinctUntilChanged ?compare ()

(* OPERATOR: elementAt *)
external _elementAt : int -> ?default:'a -> unit -> ('a, 'a) operator = "elementAt"
  [@@bs.module "rxjs/operators"]

let elementAt index ?default () stream = stream |> _elementAt index ?default ()

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

(* OPERATOR: mapTo *)
external mapTo : 'b -> ('a, 'b) operator = "mapTo"
  [@@bs.module "rxjs/operators"]

(* OPERATOR: mergeAll *)
external mergeAll : ?concurrent:int -> unit -> ('a observable, 'a) operator = ""
  [@@bs.module "rxjs/operators"]

(* OPERATOR: mergeMap *)
external _mergeMap : ('a -> 'b observable [@bs.uncurry]) -> ('a, 'b) operator = "mergeMap"
  [@@bs.module "rxjs/operators"]

external _mergeMapArray : ('a -> 'b array [@bs.uncurry]) -> ('a, 'b) operator = "mergeMap"
  [@@bs.module "rxjs/operators"]

external _mergeMapPromise : ('a -> 'b Js.Promise.t [@bs.uncurry]) ->  ('a, 'b) operator = "mergeMap"
  [@@bs.module "rxjs/operators"]

let mergeMap project stream = stream |> _mergeMap project
let mergeMapArray project stream = stream |> _mergeMapArray project
let mergeMapPromise project stream = stream |> _mergeMapPromise project

(* OPERATOR: reduce *)
external _reduce : ('acc -> 'a -> int -> 'acc [@bs.uncurry]) -> 'acc -> ('a, 'acc) operator = "reduce"
  [@@bs.module "rxjs/operators"]

let reduce accumulator seed stream = stream |> _reduce accumulator seed

(* OPERATOR: scan *)
external _scan : ('acc -> 'a -> int -> 'acc [@bs.uncurry]) -> 'acc -> ('a, 'acc) operator = "scan"
  [@@bs.module "rxjs/operators"]

let scan accumulator seed stream = stream |> _scan accumulator seed

(* OPERATOR: startWith *)


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
  [@@bs.module "rxjs/operators"]

external _withLatestFrom3 : 'b observable -> 'c observable -> ('a, ('a * 'b * 'c)) operator = "withLatestFrom"
  [@@bs.module "rxjs/operators"]

external _withLatestFrom4 :
  'b observable -> 'c observable -> 'd observable -> ('a, ('a * 'b * 'c * 'd)) operator = "withLatestFrom"
  [@@bs.module "rxjs/operators"]

external _withLatestFrom5 :
  'b observable -> 'c observable -> 'd observable -> 'e observable ->
  ('a, ('a * 'b * 'c * 'd * 'e)) operator = "withLatestFrom"
  [@@bs.module "rxjs/operators"]

let withLatestFrom2 stream sourceStream
  = sourceStream |> _withLatestFrom2 stream

let withLatestFrom3 stream1 stream2 sourceStream
  = sourceStream |> _withLatestFrom3 stream1 stream2

let withLatestFrom4 stream1 stream2 stream3 sourceStream =
  sourceStream |> _withLatestFrom4 stream1 stream2 stream3

let withLatestFrom5 stream1 stream2 stream3 stream4 sourceStream =
  sourceStream |> _withLatestFrom5 stream1 stream2 stream3 stream4
