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
/// Get the command line arguments passed to the program.
pub fn args() -> Array[String] {
  get_cli_args_internal()
}

///|
/// Get the current time in milliseconds since the Unix epoch.
pub fn now() -> UInt64 {
  now_internal()
}

///|
/// Get the current working directory. On some platforms, this may return `None` if the current directory cannot be determined.
pub fn current_dir() -> String? {
  current_dir_internal()
}
