open Rx

external readFile : string -> (string -> string -> unit) -> unit = "readFile" [@@bs.module "fs"]
external readFile2 : string -> string -> (string -> string -> unit) -> unit = "readFile" [@@bs.module "fs"]

external bindNodeCallback1 : 'a -> ('b -> 'c observable [@bs])
  = "bindNodeCallback" [@@bs.module "rxjs"]

external bindNodeCallback2 : 'a -> ('b -> 'c -> 'd observable [@bs])
  = "bindNodeCallback" [@@bs.module "rxjs"]

let bnc1 : (string -> string observable [@bs]) = bindNodeCallback1(readFile)

let bnc2 : (string -> string -> string observable [@bs]) = bindNodeCallback2(readFile2)

let z1 = bnc1 "/home/harshal/ub/bs-marble/README.md" [@bs]
let z2 = bnc2 "/home/harshal/ub/bs-marble/README.md" "utf-8" [@bs]

let _ = subscribe z1 (fun y -> Js.log y)
let _ = subscribe z2 (fun y -> Js.log y)

(* let bnc1Stream = bnc1 "Harshal" *)
