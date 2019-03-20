open Rx

(* OPERATOR: buffer *)
external buffer : 'a observable -> ('b, 'b array) operator = ""
  [@@bs.module "rxjs/operators"]

(* OPERATOR: bufferTime *)
external bufferTime : int -> 'a observable -> ('a, 'a array) operator = ""
  [@@bs.module "rxjs/operators"]

(* OPERATOR: bufferCount *)
external bufferCount : int -> ?startBuffer:int -> unit -> ('a , 'a array) operator = ""
  [@@bs.module "rxjs/operators"]

(* OPERATOR: bufferWhen *)
external bufferWhen : (unit -> 'b observable) -> ('a, 'a array) operator = ""
  [@@bs.module "rxjs/operators"]

(* OPERATOR: catchError *)
external catchError : ('err -> 'a observable -> 'b observable [@bs.uncurry]) -> ('a, 'b) operator = ""
  [@@bs.module "rxjs/operators"]

(* OPERATOR: combineAll *)
external combineAll : unit -> ('a observable, 'a array) operator = ""
  [@@bs.module "rxjs/operators"]

(* OPERATOR: debounce *)
external debounce : ('a -> 'b observable [@bs.uncurry]) -> ('a, 'a) operator = ""
  [@@bs.module "rxjs/operators"]

external debouncePromise : ('a -> 'b Js.Promise.t [@bs.uncurry]) -> ('a, 'a) operator = "debounce"
  [@@bs.module "rxjs/operators"]

(* OPERATOR: debounceTime *)
external debounceTime : int -> ?scheduler:scheduler -> unit -> ('a, 'a) operator = ""
  [@@bs.module "rxjs/operators"]

(* OPERATOR: distinctUntilChanged *)
external distinctUntilChanged : ?compare:('a -> 'a -> bool [@bs.uncurry]) -> unit -> ('a, 'a) operator = ""
  [@@bs.module "rxjs/operators"]

(* OPERATOR: elementAt *)
external elementAt : int -> ?default:'a -> unit -> ('a, 'a) operator = ""
  [@@bs.module "rxjs/operators"]

(* OPERATOR: filter *)
external filter : ('a -> bool [@bs.uncurry]) -> ('a, 'a) operator = ""
  [@@bs.module "rxjs/operators"]

external filteri : ('a -> int -> bool [@bs.uncurry]) -> ('a, 'a) operator = "filter"
  [@@bs.module "rxjs/operators"]


(* OPERATOR: map *)
external map : ('a -> 'b [@bs.uncurry]) -> ('a, 'b) operator = ""
  [@@bs.module "rxjs/operators"]

external mapi : ('a -> int -> 'b [@bs.uncurry]) -> ('a, 'b) operator = "map"
  [@@bs.module "rxjs/operators"]

(* OPERATOR: mapTo *)
external mapTo : 'b -> ('a, 'b) operator = "mapTo"
  [@@bs.module "rxjs/operators"]

(* OPERATOR: mergeAll *)
external mergeAll : ?concurrent:int -> unit -> ('a observable, 'a) operator = ""
  [@@bs.module "rxjs/operators"]

(* OPERATOR: mergeMap *)
external mergeMap : ('a -> 'b observable [@bs.uncurry]) -> ('a, 'b) operator = ""
  [@@bs.module "rxjs/operators"]

external mergeMapArray : ('a -> 'b array [@bs.uncurry]) -> ('a, 'b) operator = "mergeMap"
  [@@bs.module "rxjs/operators"]

external mergeMapPromise : ('a -> 'b Js.Promise.t [@bs.uncurry]) ->  ('a, 'b) operator = "mergeMap"
  [@@bs.module "rxjs/operators"]

(* OPERATOR: reduce *)
external reduce : ('acc -> 'a -> int -> 'acc [@bs.uncurry]) -> 'acc -> ('a, 'acc) operator = "reduce"
  [@@bs.module "rxjs/operators"]

(* OPERATOR: scan *)
external scan : ('acc -> 'a -> int -> 'acc [@bs.uncurry]) -> 'acc -> ('a, 'acc) operator = "scan"
  [@@bs.module "rxjs/operators"]

(* OPERATOR: switchMap *)
external switchMap : ('a -> 'b observable [@bs.uncurry]) -> ('a, 'b) operator = "switchMap"
  [@@bs.module "rxjs/operators"]

external switchToArray : ('a -> 'b array [@bs.uncurry]) -> ('a, 'b) operator = "switchMap"
  [@@bs.module "rxjs/operators"]

external switchToPromise : ('a -> ('b, 'e) Js.promise [@bs.uncurry]) -> ('a, 'b) operator = "switchMap"
  [@@bs.module "rxjs/operators"]

(* OPERATOR: take *)
external take : int -> ('a, 'a) operator = "take"
  [@@bs.module "rxjs/operators"]

(* OPERATOR: takeLast *)
external takeLast : int -> ('a, 'a) operator = "takeLast"
  [@@bs.module "rxjs/operators"]

(* OPERATOR: takeUntil *)
external takeUntil : 'any observable -> ('a, 'a) operator = "takeUntil"
  [@@bs.module "rxjs/operators"]

(* OPERATOR: takeWhite *)
external takeWhile : ('a -> int -> bool [@bs.uncurry]) -> ?inclusive:bool -> unit -> ('a, 'a) operator = "takeWhile"
  [@@bs.module "rxjs/operators"]

(* OPERATOR: withLatestFrom *)
external withLatestFrom2 :
  'b observable
    -> ('a, ('a * 'b)) operator = "withLatestFrom"
  [@@bs.module "rxjs/operators"]

external withLatestFrom3 :
  'b observable
    -> 'c observable -> ('a, ('a * 'b * 'c)) operator = "withLatestFrom"
  [@@bs.module "rxjs/operators"]

external withLatestFrom4 :
  'b observable -> 'c observable -> 'd observable
    -> ('a, ('a * 'b * 'c * 'd)) operator = "withLatestFrom"
  [@@bs.module "rxjs/operators"]

external withLatestFrom5 :
  'b observable -> 'c observable -> 'd observable -> 'e observable
    -> ('a, ('a * 'b * 'c * 'd * 'e)) operator = "withLatestFrom"
  [@@bs.module "rxjs/operators"]

external withLatestFrom6 :
  'b observable -> 'c observable -> 'd observable -> 'e observable -> 'f observable
    -> ('a, ('a * 'b * 'c * 'd * 'e * 'f)) operator = "withLatestFrom"
  [@@bs.module "rxjs/operators"]
