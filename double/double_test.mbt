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
test "hash" {
  let d1 = 123.456
  let d2 = 789.012
  let d3 = 123.456
  assert_eq!(d1.hash(), d1.reinterpret_as_int64() |> Hash::hash())
  assert_not_eq!(d1.hash(), d2.hash())
  assert_eq!(d1.hash(), d3.hash())
}

///|
test "is_close" {
  inspect(123.1.is_close(123.0, absolute_tolerance=0.1), content="true")
  inspect(123.1.is_close(123.0, relative_tolerance=0.1), content="true")
  inspect(123.1.is_close(100.0, relative_tolerance=0.1), content="false")
  inspect(@double.infinity.is_close(@double.infinity), content="true")
  inspect(@double.infinity.is_close(@double.neg_infinity), content="false")
  inspect(@double.neg_infinity.is_close(@double.infinity), content="false")
  inspect(@double.neg_infinity.is_close(@double.neg_infinity), content="true")
  inspect(@double.not_a_number.is_close(@double.infinity), content="false")
  inspect(@double.not_a_number.is_close(@double.neg_infinity), content="false")
  inspect(@double.not_a_number.is_close(@double.not_a_number), content="false")
  inspect(@double.not_a_number.is_close(123.0), content="false")
  inspect(123.1.is_close(@double.not_a_number), content="false")
  inspect(@double.infinity.is_close(@double.not_a_number), content="false")
  inspect(@double.neg_infinity.is_close(@double.not_a_number), content="false")
  inspect(0.0.is_close(@double.neg_infinity), content="false")
}

///|
test "abs" {
  inspect(0.0.abs().reinterpret_as_uint64(), content="0")
  inspect((-0.0).abs().reinterpret_as_uint64(), content="0")
  inspect(0.1.abs(), content="0.1")
  inspect((-0.1).abs(), content="0.1")
  inspect((0.0 / 0.0).abs(), content="NaN")
  inspect(@double.not_a_number.abs(), content="NaN")
  inspect((-0.0 / 0.0).abs(), content="NaN")
  inspect(-@double.not_a_number.abs(), content="NaN")
  inspect((1.0 / 0.0).abs(), content="Infinity")
  inspect((-1.0 / 0.0).abs(), content="Infinity")
}

///|
test "panic is_close with invalid relative tolerance" {
  ignore(1.0.is_close(1.0, relative_tolerance=-1.0))
}

///|
test "panic is_close with invalid absolute tolerance" {
  ignore(1.0.is_close(1.0, absolute_tolerance=-1.0))
}

///|
test "panic is_close with invalid relative and absolute tolerances" {
  ignore(1.0.is_close(1.0, relative_tolerance=-1.0, absolute_tolerance=-1.0))
}

///|
test "to_be_bytes with negative number" {
  let d = -123.456
  inspect(
    d.to_be_bytes(),
    content="b\"\\xc0\\x5e\\xdd\\x2f\\x1a\\x9f\\xbe\\x77\"",
  )
}

///|
test "to_le_bytes with infinity" {
  inspect(
    (1.0 / 0.0).to_le_bytes(),
    content="b\"\\x00\\x00\\x00\\x00\\x00\\x00\\xf0\\x7f\"",
  )
}

///|
test "Double::from_int with additional cases" {
  inspect(Double::from_int(0), content="0")
  inspect(Double::from_int(-42), content="-42")
  inspect(Double::from_int(2147483647), content="2147483647")
  inspect(Double::from_int(-2147483648), content="-2147483648")
}
