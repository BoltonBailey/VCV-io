/-
Copyright (c) 2026 Bolton Bailey. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Bolton Bailey
-/
module

public import Init.Data.Nat.Basic

/-!
# Indexed Binary Trees

This file develops basic definitions for binary trees used elsewhere in the project.
The `Skeleton` type captures the unlabeled shape of a binary tree, with simple recursive
functions for counting leaves and measuring depth.

## Main definitions

- `Skeleton` — the inductive type of unlabeled binary tree shapes
- `Skeleton.leafCount` — the number of leaves in a skeleton
- `Skeleton.depth` — the depth (longest root-to-leaf edge count) of a skeleton
-/

@[expose] public section

/-- The unlabeled shape of a binary tree: either a leaf or an internal node with two children. -/
inductive Skeleton : Type
  | leaf : Skeleton
  | internal (left right : Skeleton) : Skeleton
  deriving Repr, DecidableEq

namespace Skeleton

section Count

/-- The number of leaves in a `Skeleton`. -/
def leafCount : Skeleton → Nat
  | Skeleton.leaf => 1
  | Skeleton.internal left right =>
    left.leafCount + right.leafCount

end Count

section Depth

/-- The depth of a `Skeleton`, measured as the maximum number of edges from the root to a leaf. -/
def depth : Skeleton → Nat
  | Skeleton.leaf => 0
  | Skeleton.internal left right =>
    Nat.max left.depth right.depth + 1

end Depth

end Skeleton
