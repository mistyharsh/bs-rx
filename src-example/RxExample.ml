open Rx
open Operators

let stream1 = create (fun obs -> ignore(next obs 20))


let subscription1 = subscribe stream1 begin
    fun myVal -> ignore(myVal)
  end

let x = map (fun item -> item + 20) stream1


external scheduler : scheduler = "" [@@bs.val]
(* external observer1 : 'any observer = "" [@@bs.val]
let subscription2 = subscribeObs stream1 observer1 *)

(* let _ = unsubscribe subscription1 *)

(* let x = map (fun item -> item + 4); *)

let opr1 = map (fun item -> item + 5)
let _ = catchError (fun _err _caught -> stream1)

let y = opr1 stream1
  |> mapi (fun item index -> item + index + 4)
  |> map begin fun x -> x + 5 end
  |> switchMap (fun _x -> stream1)
  |> switchToArray (fun _ -> [| 10 |])
  |> filteri (fun _x _y -> false)
  |> debounceTime 1000 ~scheduler ()
  |> debounceTime 100 ()
  |> catchError (fun _err _caught -> stream1)
  |> take 100
  |> withLatestFrom2 stream1
  |> withLatestFrom3 stream1 stream1
  |> withLatestFrom4 stream1 stream1 stream1
  |> withLatestFrom5 stream1 stream1 stream1 stream1
  |> deferArray begin fun () -> [| 10; 20 |] end
