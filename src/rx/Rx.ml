type 'a observer

type 'a observable

(* TODO: Pending work *)
type scheduler

type subscription

(*
  Operator is basically a function that takes an observable and translate into new observable
  of possibly different type
*)
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

(* OPERATOR: defer *)
external _defer : (unit -> 'b observable [@bs.uncurry]) -> ('a, 'b) operator = "defer"
  [@@bs.module "rxjs"]

external _deferPromise : (unit -> 'b Js.Promise.t [@bs.uncurry]) -> ('a, 'b) operator = "defer"
  [@@bs.module "rxjs"]

external _deferArray : (unit -> 'b array) -> ('a, 'b) operator = "defer"
  [@@bs.module "rxjs"]

let defer factory stream = stream |> _defer factory
let deferPromise factory stream = stream |> _deferPromise factory
let deferArray factory stream = stream |> _deferArray factory

external empty : 'a observable = "EMPTY"
  [@@bs.module "rxjs"]

(* OPERATOR: merge *)
external merge : 'a observable array -> 'a observable = ""
  [@@bs.module "rxjs"] [@@bs.variadic]

external never : 'a observable = "NEVER"
  [@@bs.module "rxjs"]

(* OPERATOR: of *)
(* Note: No support for scheduler argument *)
external off : 'a array -> 'a observable = "of"
  [@@bs.module "rxjs"] [@@bs.variadic]
