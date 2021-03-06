module LowStar.ImmutableBuffer

include LowStar.Monotonic.Buffer

module P = FStar.Preorder
module G = FStar.Ghost
module U32 = FStar.UInt32
module Seq = FStar.Seq

module HS = FStar.HyperStack
module HST = FStar.HyperStack.ST

private let immutable_preorder (a:Type0) :srel a = fun s1 s2 -> Seq.equal s1 s2

type ibuffer (a:Type0) = mbuffer a (immutable_preorder a) (immutable_preorder a)

unfold let inull (#a:Type0) :ibuffer a = mnull #a #(immutable_preorder a) #(immutable_preorder a)

unfold let igsub (#a:Type0) = mgsub #a #(immutable_preorder a) #(immutable_preorder a) (immutable_preorder a)

unfold let igsub_inj (#a:Type0) = mgsub_inj #a #(immutable_preorder a) #(immutable_preorder a) (immutable_preorder a) (immutable_preorder a)

inline_for_extraction
type ipointer (a:Type0) = b:ibuffer a{length b == 1}

inline_for_extraction
type ipointer_or_null (a:Type0) = b:ibuffer a{if g_is_null b then True else length b == 1}

inline_for_extraction let isub (#a:Type0) = msub #a #(immutable_preorder a) #(immutable_preorder a) (immutable_preorder a)

inline_for_extraction let ioffset (#a:Type0) = moffset #a #(immutable_preorder a) #(immutable_preorder a) (immutable_preorder a)

private let cpred (#a:Type0) (s:Seq.seq a) :spred a = fun s1 -> Seq.equal s s1

unfold let libuffer (a:Type0) (len:nat) (s:Seq.seq a) =
  b:lmbuffer a (immutable_preorder a) (immutable_preorder a) len{witnessed b (cpred s)}

unfold let libuffer_or_null (a:Type0) (len:nat) (r:HS.rid) (s:Seq.seq a) =
  b:lmbuffer_or_null a (immutable_preorder a) (immutable_preorder a) len r{(not (g_is_null b)) ==>
                                                                           witnessed b (cpred s)}

let igcmalloc (#a:Type0) (r:HS.rid) (init:a) (len:U32.t)
  :HST.ST (b:libuffer a (U32.v len) (Seq.create (U32.v len) init){frameOf b == r /\ recallable b})
          (requires (fun _       -> malloc_pre r len))
          (ensures  (fun h0 b h1 -> alloc_post_mem_common b h0 h1 (Seq.create (U32.v len) init)))
  = let b = mgcmalloc r init len in
    witness_p b (cpred (Seq.create (U32.v len) init));
    b

inline_for_extraction
let igcmalloc_partial (#a:Type0) (r:HS.rid) (init:a) (len:U32.t)
  :HST.ST (b:libuffer_or_null a (U32.v len) r (Seq.create (U32.v len) init){recallable b})
          (requires (fun _       -> malloc_pre r len))
          (ensures  (fun h0 b h1 -> alloc_partial_post_mem_common b h0 h1 (Seq.create (U32.v len) init)))
  = igcmalloc r init len

let imalloc (#a:Type0) (r:HS.rid) (init:a) (len:U32.t)
  :HST.ST (b:libuffer a (U32.v len) (Seq.create (U32.v len) init){frameOf b == r /\ freeable b})
          (requires (fun _       -> malloc_pre r len))
          (ensures  (fun h0 b h1 -> alloc_post_mem_common b h0 h1 (Seq.create (U32.v len) init)))
  = let b = mmalloc r init len in
    witness_p b (cpred (Seq.create (U32.v len) init));
    b

inline_for_extraction
let imalloc_partial (#a:Type0) (r:HS.rid) (init:a) (len:U32.t)
  :HST.ST (b:libuffer_or_null a (U32.v len) r (Seq.create (U32.v len) init){(not (g_is_null b)) ==> freeable b})
          (requires (fun _       -> malloc_pre r len))
          (ensures  (fun h0 b h1 -> alloc_partial_post_mem_common b h0 h1 (Seq.create (U32.v len) init)))
  = imalloc r init len

let ialloca (#a:Type0) (init:a) (len:U32.t)
  :HST.StackInline (libuffer a (U32.v len) (Seq.create (U32.v len) init))
                   (requires (fun _       -> alloca_pre len))
                   (ensures  (fun h0 b h1 -> alloc_post_mem_common b h0 h1 (Seq.create (U32.v len) init) /\
		                          frameOf b == HS.get_tip h0))
  = let b = malloca init len in
    witness_p b (cpred (Seq.create (U32.v len) init));
    b

let ialloca_of_list (#a:Type0) (init: list a)
  :HST.StackInline (b:libuffer a (normalize_term (List.Tot.length init)) (Seq.seq_of_list init))
                   (requires (fun _      -> alloca_of_list_pre init))
                   (ensures (fun h0 b h1 -> alloc_post_mem_common b h0 h1 (Seq.seq_of_list init) /\
		                         frameOf b == HS.get_tip h0))
  = let b = malloca_of_list init in
    witness_p b (cpred (Seq.seq_of_list init));
    b

let igcmalloc_of_list (#a:Type0) (r:HS.rid) (init:list a)
  :HST.ST (b:libuffer a (normalize_term (List.Tot.length init)) (Seq.seq_of_list init){frameOf b == r /\ recallable b})
          (requires (fun _       -> gcmalloc_of_list_pre r init))
          (ensures  (fun h0 b h1 -> alloc_post_mem_common b h0 h1 (Seq.seq_of_list init)))
  = let b = mgcmalloc_of_list r init in
    witness_p b (cpred (Seq.seq_of_list init));
    b

inline_for_extraction
let igcmalloc_of_list_partial (#a:Type0) (r:HS.rid) (init:list a)
  :HST.ST (b:libuffer_or_null a (normalize_term (List.Tot.length init)) r (Seq.seq_of_list init){recallable b})
          (requires (fun _       -> gcmalloc_of_list_pre r init))
          (ensures  (fun h0 b h1 -> alloc_partial_post_mem_common b h0 h1 (Seq.seq_of_list init)))
  = igcmalloc_of_list r init

let witness_contents (#a:Type0) (b:ibuffer a) (s:Seq.seq a)
  :HST.ST unit (requires (fun h0        -> Seq.equal (as_seq h0 b) s))
                 (ensures  (fun h0 _ h1 -> h0 == h1 /\ witnessed b (cpred s)))
  = witness_p b (cpred s)

let recall_contents (#a:Type0) (b:ibuffer a) (s:Seq.seq a)
  :HST.ST unit (requires (fun h0      -> (recallable b \/ live h0 b) /\ witnessed b (cpred s)))
               (ensures  (fun h0 _ h1 -> h0 == h1 /\ live h0 b /\ as_seq h0 b == s))
  = recall_p b (cpred s)
