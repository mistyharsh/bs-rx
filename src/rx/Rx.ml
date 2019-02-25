
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

(* OPERATION: defer *)
external _defer : (unit -> 'b observable [@bs.uncurry]) -> ('a, 'b) operator = "defer"
  [@@bs.module "rxjs"]

external _deferPromise : (unit -> 'b Js.Promise.t [@bs.uncurry]) -> ('a, 'b) operator = "defer"
  [@@bs.module "rxjs"]

external _deferArray : (unit -> 'b array) -> ('a, 'b) operator = "defer"
  [@@bs.module "rxjs"]

let defer factory stream = stream |> _defer factory
let deferPromise factory stream = stream |> _deferPromise factory
let deferArray factory stream = stream |> _deferArray factory

(* OPERATION: merge *)
external merge : 'a observable array -> 'a observable = ""
  [@@bs.module "rxjs"] [@@bs.variadic]
