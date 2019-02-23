
type 'a observer

type 'a observable

(* TODO: Pending work *)
type scheduler

type subscription

type ('a, 'b) operator = 'a observable -> 'b observable

external next : 'a observer -> 'a -> unit = "" [@@bs.send]
external error : 'a observer -> 'e -> unit = "" [@@bs.send]
external complete : 'a observer -> unit = "" [@@bs.send]


(* Observable.create(callback) *)
external create : ('a observer -> unit) -> 'a observable = ""
  [@@bs.val][@@bs.scope "Observable"] [@@bs.module "rxjs"]

(* somObservable.subscribe(() => {}) *)
external subscribe : 'a observable -> ('a -> unit) -> subscription = "" [@@bs.send]

(* somObservable.subscribe({ next, error, complete }) *)
external subscribeObs : 'a observable -> 'a observer -> subscription = "subscribe" [@@bs.send]

external unsubscribe : subscription -> unit = "" [@@bs.send]


(* mergeMap operator *)
(* external mergeMap : ('a -> 'b observable [@bs.uncurry]) -> 'a observable -> 'b observable = "mergeMap"
  [@@bs.module "rxjs/operators"]

external mergeToArray : ('a -> 'b array [@bs.uncurry]) -> 'a observable -> 'b observable = "mergeMap"
  [@@bs.module "rxjs/operators"]

external mergeToPromise : ('a -> ('b, 'e) Js.promise [@bs.uncurry]) -> 'a observable -> 'b observable = "mergeMap"
  [@@bs.module "rxjs/operators"] *)
