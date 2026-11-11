// Copyright 2018-2026 the Deno authors. MIT license.
// merge-guard trial fixture: depends on a symbol the base branch is about
// to rename. This PR is green on its own head; the merged result is dark.

import { greet } from "./a.ts";

console.log(greet("merge-guard"));
