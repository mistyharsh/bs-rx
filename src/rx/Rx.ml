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

(* Observable.create(callback) *)
external create : ('a observer -> unit) -> 'a observable = ""
  [@@bs.val][@@bs.scope "Observable"] [@@bs.module "rxjs"]

(* somObservable.subscribe(() => {}) *)
external subscribe : 'a observable -> ('a -> unit) -> subscription = "" [@@bs.send]

(* somObservable.subscribe({ next, error, complete }) *)
external subscribeObs : 'a observable -> 'a observer -> subscription = "subscribe" [@@bs.send]

external unsubscribe : subscription -> unit = "" [@@bs.send]

(* Observer helper functions *)
external next : 'a observer -> 'a -> unit = "" [@@bs.send]
external error : 'a observer -> 'e -> unit = "" [@@bs.send]
external complete : 'a observer -> unit = "" [@@bs.send]

(* 2-tuple observable and so on *)
(* Note: You cannot have a tuple of size 1 *)
type ('a, 'b) tuple2 = ('a * 'b) observable
type ('a, 'b, 'c ) tuple3 = ('a * 'b * 'c) observable
type ('a, 'b, 'c, 'd ) tuple4 = ('a * 'b * 'c) observable
type ('a, 'b, 'c, 'd, 'e) tuple5 = ('a * 'b * 'c * 'd * 'e) observable
type ('a, 'b, 'c, 'd, 'e, 'f) tuple6 = ('a * 'b * 'c * 'd * 'e * 'f) observable

type ('a, 'b) t2 =
  'a observable -> 'b observable
    -> ('a, 'b) tuple2

type ('a, 'b, 'c ) t3 =
  'a observable -> 'b observable -> 'c observable
    -> ('a, 'b, 'c ) tuple3

type ('a, 'b, 'c, 'd ) t4 =
  'a observable -> 'b observable -> 'c observable -> 'd observable
    -> ('a, 'b, 'c, 'd ) tuple4

type ('a, 'b, 'c, 'd, 'e) t5 =
  'a observable -> 'b observable -> 'c observable -> 'd observable -> 'e observable
    -> ('a, 'b, 'c, 'd, 'e) tuple5

type ('a, 'b, 'c, 'd, 'e, 'f) t6 =
  'a observable -> 'b observable -> 'c observable -> 'd observable -> 'e observable -> 'f observable
    -> ('a, 'b, 'c, 'd, 'e, 'f) tuple6

(* OPERATOR: combineLatest *)
external combineLatest2 : ('a, 'b) t2 = "combineLatest" [@@bs.module "rxjs"]
external combineLatest3 : ('a, 'b, 'c) t3 = "combineLatest" [@@bs.module "rxjs"]
external combineLatest4 : ('a, 'b, 'c, 'd) t4 = "combineLatest" [@@bs.module "rxjs"]
external combineLatest5 : ('a, 'b, 'c, 'd, 'e) t5 = "combineLatest" [@@bs.module "rxjs"]
external combineLatest6 : ('a, 'b, 'c, 'd, 'e, 'f) t6 = "combineLatest" [@@bs.module "rxjs"]

(* OPERATOR: concat *)
external concat : 'a observable array -> 'a observable = ""
  [@@bs.module "rxjs"] [@@bs.variadic]

(* OPERATOR: defer *)
external defer : (unit -> 'a observable [@bs.uncurry]) -> 'a observable = "defer"
  [@@bs.module "rxjs"]

external deferPromise : (unit -> 'a Js.Promise.t [@bs.uncurry]) -> 'a observable = "defer"
  [@@bs.module "rxjs"]

external deferArray : (unit -> 'a array) -> 'a observable = "defer"
  [@@bs.module "rxjs"]

(* OPERATOR: empty *)
external empty : 'a observable = "EMPTY"
  [@@bs.module "rxjs"]

(* OPERATOR: forkJoin *)
(* No support for promise or arrays *)
external forkJoin2 : ('a, 'b) t2 = "forkJoin" [@@bs.module "rxjs"]
external forkJoin3 : ('a, 'b, 'c) t3 = "forkJoin" [@@bs.module "rxjs"]
external forkJoin4 : ('a, 'b, 'c, 'd) t4 = "forkJoin" [@@bs.module "rxjs"]
external forkJoin5 : ('a, 'b, 'c, 'd, 'e) t5 = "forkJoin" [@@bs.module "rxjs"]
external forkJoin6 : ('a, 'b, 'c, 'd, 'e, 'f) t6 = "forkJoin" [@@bs.module "rxjs"]

(* OPERATOR: from *)
(* Note: No support for iterables and schedulers *)
external fromArray : 'a array -> 'a observable = "from" [@@bs.module "rxjs"]
external fromPromise : 'a Js.Promise.t -> 'a observable = "from" [@@bs.module "rxjs"]

(* OPERATOR: interval *)
external interval : int -> int observable = "interval"
  [@@bs.module "rxjs"]

(* OPERATOR: merge *)
external merge : 'a observable array -> 'a observable = ""
  [@@bs.module "rxjs"] [@@bs.variadic]

(* OPERATOR: never *)
external never : 'a observable = "NEVER"
  [@@bs.module "rxjs"]

(* OPERATOR: of *)
(* Note: No support for scheduler argument *)
external off : 'a array -> 'a observable = "of"
  [@@bs.module "rxjs"] [@@bs.variadic]

(* OPERATOR: race *)
external race : 'a observable array -> 'a observable = ""
  [@@bs.module "rxjs"] [@@bs.variadic]

(* OPERATOR: range *)
external range : int -> ?count:int -> unit -> ?scheduler:scheduler -> unit -> int observable = ""
  [@@bs.module "rxjs"]

(* OPERATOR: timer *)
external timer : int -> int -> int observable = "timer"
  [@@bs.module "rxjs"]

(* Not sure if this is the right data type *)
external timerDated : Js.Date.t -> int -> int observable = "timer"
  [@@bs.module "rxjs"]

(* OPERATOR: zip *)
external zip2 : ('a, 'b) t2 = "zip" [@@bs.module "rxjs"]
external zip3 : ('a, 'b, 'c) t3 = "zip" [@@bs.module "rxjs"]
external zip4 : ('a, 'b, 'c, 'd) t4 = "zip" [@@bs.module "rxjs"]
external zip5 : ('a, 'b, 'c, 'd, 'e) t5 = "zip" [@@bs.module "rxjs"]
external zip6 : ('a, 'b, 'c, 'd, 'e, 'f) t6 = "combineLatest" [@@bs.module "rxjs"]
