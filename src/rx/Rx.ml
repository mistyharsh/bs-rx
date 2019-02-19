
open Observer

type 'a observable

(* TODO: Pending work *)
type scheduler

type subscription


(* Observable.create(callback) *)
external create : ('a observer -> unit) -> 'a observable = ""
  [@@bs.val][@@bs.scope "Observable"] [@@bs.module "rxjs"]

(* somObservable.subscript(() => {}) *)
(* somObservable.subscript({ next, error, complete }) *)
external subscribeObs : 'a observable -> 'a observer -> subscription = "subscribe" [@@bs.send]
external subscribe : 'a observable -> ('a -> unit) -> subscription = "" [@@bs.send]

external unsubscribe : subscription -> unit = "" [@@bs.send]

(* debounceTime operator *)
external debounceTime  : int -> ?scheduler:bool -> unit -> ('a observable -> 'a observable) = "debounceTime"
  [@@bs.module "rxjs/operators"]


(* filter operator *)
external filter : ('a -> bool [@bs.uncurry]) -> 'a observable -> 'b observable = "filter"
  [@@bs.module "rxjs/operators"]

external filteri : ('a -> int -> bool [@bs.uncurry]) -> 'a observable -> 'b observable = "filter"
  [@@bs.module "rxjs/operators"]


(* map operator *)
external map : ('a -> 'b [@bs.uncurry]) -> 'a observable -> 'b observable = "map"
  [@@bs.module "rxjs/operators"]

external mapi : ('a -> int -> 'b [@bs.uncurry]) -> 'a observable -> 'b observable = "map"
  [@@bs.module "rxjs/operators"]


(* switchMap operator *)
external switchMap : ('a -> 'b observable [@bs.uncurry]) -> 'a observable -> 'b observable = "switchMap"
  [@@bs.module "rxjs/operators"]

external switchToArray : ('a -> 'b array [@bs.uncurry]) -> 'a observable -> 'b observable = "switchMap"
  [@@bs.module "rxjs/operators"]

external switchToPromise : ('a -> ('b, 'e) Js.promise [@bs.uncurry]) -> 'a observable -> 'b observable = "switchMap"
  [@@bs.module "rxjs/operators"]


(* mergeMap operator *)
external mergeMap : ('a -> 'b observable [@bs.uncurry]) -> 'a observable -> 'b observable = "mergeMap"
  [@@bs.module "rxjs/operators"]

external mergeToArray : ('a -> 'b array [@bs.uncurry]) -> 'a observable -> 'b observable = "mergeMap"
  [@@bs.module "rxjs/operators"]

external mergeToPromise : ('a -> ('b, 'e) Js.promise [@bs.uncurry]) -> 'a observable -> 'b observable = "mergeMap"
  [@@bs.module "rxjs/operators"]
