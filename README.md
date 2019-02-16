# bs-marblejs
Marblejs bindings for ReasonML.

## Bucklescript language extensions

### `[@bs.val]`
This extension binds JS value to its counterpart in Reason.

### `[@bs.module "semver"]`
Refer to external module. Depending upon `package-specs`, it is either ES module or Common.js module.

### Writing anonymous function
```ocaml
let stream1 = create (fun obs -> ignore(next obs 30))

(* Or you can use begin and end block *)
let subscription1 = subscribe stream1 begin
    fun myVal -> ignore(myVal)
  end

```