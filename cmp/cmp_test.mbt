// Copyright 2025 International Digital Economy Academy
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

///|
test "maximum_by_key" {
  assert_eq!(@cmp.maximum_by_key(1, -2, @int.abs), -2)
  assert_eq!(@cmp.maximum_by_key(-2, 1, @int.abs), -2)
  assert_eq!(@cmp.maximum_by_key(-2, 2, @int.abs), 2)
}

///|
test "minimum_by_key" {
  assert_eq!(@cmp.minimum_by_key(1, -2, @int.abs), 1)
  assert_eq!(@cmp.minimum_by_key(-2, 1, @int.abs), 1)
  assert_eq!(@cmp.minimum_by_key(-2, 2, @int.abs), -2)
}
