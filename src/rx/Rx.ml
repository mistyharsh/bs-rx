
open Observer

type 'a observable

type subscription


(* Observable.create(callback) *)
external create : ('a observer -> unit) -> 'a observable = ""
  [@@bs.val][@@bs.scope "Observable"] [@@bs.module "rxjs"]

(* somObservable.subscript(() => {}) *)
(* somObservable.subscript({ next, error, complete }) *)
external subscribeObs : 'a observable -> 'a observer -> subscription = "subscribe" [@@bs.send]
external subscribe : 'a observable -> ('a -> unit) -> subscription = "" [@@bs.send]

external unsubscribe : subscription -> unit = "" [@@bs.send]


(* Operators *)
external map : ('a -> 'b [@bs.uncurry]) -> 'a observable -> 'b observable = "" [@@bs.module "rxjs/operators"]
external mapi : ('a -> int -> 'b [@bs.uncurry]) -> 'a observable -> 'b observable = "map" [@@bs.module "rxjs/operators"]
