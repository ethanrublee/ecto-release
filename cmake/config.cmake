# 
# Copyright (c) 2011, Willow Garage, Inc.
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Willow Garage, Inc. nor the names of its
#       contributors may be used to endorse or promote products derived from
#       this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
# 
set(ecto_CONFIG_DIR ${CMAKE_BINARY_DIR}/cmake/ecto)

set(ecto_PYTHONPATH ${CMAKE_LIBRARY_OUTPUT_DIRECTORY} ${ecto_SOURCE_DIR}/python)
set(ecto_INCLUDE_DIRS ${ecto_SOURCE_DIR}/include ${ecto_BINARY_DIR}/include)
set(ecto_PYTHONLIB ecto_ectomodule)

set(ECTO_CONFIG_PATH ${CMAKE_BINARY_DIR}/cmake/ecto)

file(COPY ${ecto_SOURCE_DIR}/cmake/ectoMacros.cmake
  DESTINATION ${ecto_CONFIG_DIR})
file(COPY ${ecto_SOURCE_DIR}/cmake/rosbuild_lite.cmake
  DESTINATION ${ecto_CONFIG_DIR})

#copy the python_path.sh.user.in for users that are not installing ecto.
file(COPY ${PROJECT_SOURCE_DIR}/cmake/python_path.sh.user.in DESTINATION ${ecto_CONFIG_DIR})
file(COPY ${PROJECT_SOURCE_DIR}/cmake/doc.cmake DESTINATION ${ecto_CONFIG_DIR})
file(COPY ${PROJECT_SOURCE_DIR}/cmake/git.cmake DESTINATION ${ecto_CONFIG_DIR})
#set this back for our libs to pick it up as
set(ecto_LIBRARIES ecto)

configure_file(${ecto_SOURCE_DIR}/cmake/config.hpp.in ${ecto_BINARY_DIR}/include/ecto/config.hpp)
configure_file(${ecto_SOURCE_DIR}/cmake/env.sh.in ${ecto_BINARY_DIR}/env.sh @ONLY@)

set(ECTO_ENV ${ecto_BINARY_DIR}/env.sh)
