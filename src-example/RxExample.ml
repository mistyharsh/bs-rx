open Rx
open Observer

let y = create (fun obs ->
  let _y = next obs 20 in
  ())

