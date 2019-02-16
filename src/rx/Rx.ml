
open Observer

type observable

type subscription



external create : ('any observer -> unit) -> observable = "create"
  [@@bs.val][@@bs.scope "Observable"] [@@bs.module "rxjs"]
