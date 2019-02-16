type 'a observer

external next : 'a observer -> 'a -> unit = "" [@@bs.send]
external error : 'a observer -> 'e -> unit = "" [@@bs.send]
external complete : 'a observer -> unit = "" [@@bs.send]
