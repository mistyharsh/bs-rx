open Jest
open Expect
open Rx

let oneObs = create (fun obs ->
  next obs 10;
  complete obs
)

let twoObs = create (fun obs ->
  next obs 100;
  next obs 200;
  complete obs
)

let _ = describe "Expect" begin fun () ->
  test "Sample test" (fun ()  -> expect (1 + 2) |> (toBe 3))
end

let _ = testAsync "Rx.create - Create observable using static method" begin fun finish  ->
  let obs = create (fun obs ->
    next obs 20;
    complete obs
  ) in

  subscribe obs (fun value -> expect value |> toBe 20 |> finish) |> ignore
end

let _ = testAsync "combineLatest2" begin fun finish ->
  let testObs = combineLatest2 twoObs oneObs in

  subscribe testObs (fun value ->
    expect value |> toEqual (200, 10) |> finish) |> ignore
end

let _ = testAsync "combineLatest6" begin fun finish ->
  let testObs = combineLatest6 oneObs oneObs oneObs oneObs oneObs oneObs in

  subscribe testObs (fun value ->
    expect value |> toEqual (10, 10, 10, 10, 10, 10) |> finish) |> ignore
end
