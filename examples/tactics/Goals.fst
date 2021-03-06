module Goals

open FStar.Tactics

(* A sanity check that we cannot trick the engine into dropping VCs *)

let id x = x
let intro_sq (x:'a) : squash 'a = ()
let elim (#a:Type) (x:False) : a = ()

(* First things first... *)
[@expect_failure] let _ = assert False

[@expect_failure] let _ = assert False by (dismiss ())
[@expect_failure] let _ = assert False by (set_goals [])

(* Leaving an active goal *)
[@expect_failure] let _ = assert False by (()) // original implicit
[@expect_failure] let _ = assert False by (apply (`id)) // new implicit of same type
[@expect_failure] let _ = assert False by (apply (`intro_sq)) // unsquashed new goal
[@expect_failure] let _ = assert False by (apply (`elim)) // a different type

(* Leaving an SMT goal *)
[@expect_failure] let _ = assert False by (smt ())
[@expect_failure] let _ = assert False by (apply (`id); smt ())
[@expect_failure] let _ = assert False by (apply (`intro_sq); smt ())
[@expect_failure] let _ = assert False by (apply (`elim); smt ())

(* Dropping the goal, implicit remains *)
[@expect_failure] let _ = assert False by (dismiss ())
[@expect_failure] let _ = assert False by (apply (`id); dismiss ())
[@expect_failure] let _ = assert False by (apply (`intro_sq); dismiss ())
[@expect_failure] let _ = assert False by (apply (`elim); dismiss ())

(* I know! I'll use the unifier to solve my witness and drop it! *)
(* No, you still need to prove it. *)

[@expect_failure] let _ = assert False by (let g = _cur_goal () in
                                           let e = cur_env () in
                                           let _ = unify_env e (goal_witness g) (`()) in
                                           ())

[@expect_failure] let _ = assert False by (let g = _cur_goal () in
                                           let e = cur_env () in
                                           let _ = unify_env e (goal_witness g) (`()) in
                                           smt ())

[@expect_failure] let _ = assert False by (let g = _cur_goal () in
                                           let e = cur_env () in
                                           let _ = unify_env e (goal_witness g) (`()) in
                                           dismiss ())
