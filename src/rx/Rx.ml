
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


type any
type anyObs = any observable

external merge2 : 'a observable -> 'b observable -> anyObs = "merge" [@@bs.module "rxjs"]
external merge3 : 'a observable -> 'b observable -> 'c observable -> anyObs = "merge" [@@bs.module "rxjs"]

external merge4 :
  'a observable -> 'b observable -> 'c observable -> 'd observable -> anyObs = "merge"
  [@@bs.module "rxjs"]

external merge5 :
  'a observable -> 'b observable -> 'c observable -> 'd observable -> 'e observable -> anyObs = "merge"
  [@@bs.module "rxjs"]
