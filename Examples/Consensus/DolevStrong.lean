/-
Copyright (c) 2026 Bolton Bailey. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Bolton Bailey
-/
import Mathlib.Data.Finset.Card
import Mathlib.Data.Set.Basic
import Mathlib.Tactic.Common

/-!
# The Dolev-Strong Byzantine broadcast protocol

This file formalizes the Dolev-Strong broadcast protocol and proves that it solves Byzantine
broadcast under lockstep synchrony, following the exposition in Ren Ling's *Consensus
Algorithms* (Algorithm 2, Lemmas 2.2.1-2.2.3, Theorems 2.2.4-2.2.5).

TODO(agent): My first attempt at carrying out this autoformalization did not include some of the features I wanted. In particular

I'd like there to be more use of the VCVio monad effect system. In particular participants in Dolev-Strong are supposed to have access to signature chaining system. I'd like access to this system to be provided in the form of a monad that gives oracle access to the signature chaining, and I'd like the messages sent by participants to be able to include arbitrary numbers of these signatures.

-/
