open Rx
open Observer

let stream1 = create (fun obs -> ignore(next obs 30))

let subscription1 = subscribe stream1 begin
    fun myVal -> ignore(myVal)
  end

external observer1 : 'any observer = "" [@@bs.val]
let subscription2 = subscribeObs stream1 observer1

let _ = unsubscribe subscription1


let _ = stream1
  |> map (fun item -> item + 3)
  |> mapi (fun item index -> item + index + 4)
  |> map begin fun x -> x + 5 end
  |> switchToArray (fun _ -> [| 10 |])
  |> filteri (fun _x _y -> false)
  |> debounceTime 1000 ~scheduler:true ()
  |> debounceTime 100 ()

