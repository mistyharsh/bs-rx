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

(* OPERATOR: withLatestFrom *)
external withLatestFrom2 : 'b observable -> ('a, ('a * 'b)) operator = "withLatestFrom"
  [@@bs.module "rxjs/operators"]

external withLatestFrom3 : ('b, 'c) chain2 -> ('a, ('a * 'b * 'c)) operator = "withLatestFrom"
  [@@bs.module "rxjs/operators"]

external withLatestFrom4 :
  ('b, 'c, 'd) chain3 -> ('a, ('a * 'b * 'c * 'd)) operator = "withLatestFrom"
  [@@bs.module "rxjs/operators"]

external withLatestFrom5 :
  ('b, 'c, 'd, 'e) chain4 -> ('a, ('a * 'b * 'c * 'd * 'e)) operator = "withLatestFrom"
  [@@bs.module "rxjs/operators"]
