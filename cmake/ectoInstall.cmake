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
#### install stuff #####

#create an ectoConfig.cmake for easy find_package(ecto)
set(ecto_INCLUDE_DIRS ${CMAKE_INSTALL_PREFIX}/${include_prefix})
set(ecto_LIBRARIES_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(ecto_PYTHONPATH ${CMAKE_INSTALL_PREFIX}/${ecto_PYTHON_INSTALL})
set(ECTO_CONFIG_PATH  ${CMAKE_INSTALL_PREFIX}/${share_prefix})

file(COPY ${ecto_SOURCE_DIR}/cmake/ectoMacros.cmake
    DESTINATION ${ecto_BINARY_DIR}/unix_install/
    )
file(COPY ${ecto_SOURCE_DIR}/cmake/rosbuild_lite.cmake
    DESTINATION ${ecto_BINARY_DIR}/unix_install/rosbuild_lite.cmake
    )

#for client projects using ecto documentation tools
file(COPY ${PROJECT_SOURCE_DIR}/cmake/doc.cmake
  DESTINATION ${CMAKE_BINARY_DIR}/unix_install/)
file(COPY ${PROJECT_SOURCE_DIR}/cmake/git.cmake
  DESTINATION ${CMAKE_BINARY_DIR}/unix_install/)
#install the ectoConfig.cmake and ectoConfig-version.cmake
install(DIRECTORY
  ${ecto_BINARY_DIR}/unix_install/   #last component empty, so we loose the unix_install
  DESTINATION ${share_prefix}/cmake
  COMPONENT main
  )

install(FILES ${ecto_SOURCE_DIR}/cmake/python_path.sh.user.in
  DESTINATION ${share_prefix}/cmake
  COMPONENT main
  )

#regular headers
install(DIRECTORY ${ecto_SOURCE_DIR}/include/ecto
  DESTINATION ${include_prefix}
  COMPONENT main
  FILES_MATCHING PATTERN "*.hpp"
  )

#generated headers
install(DIRECTORY ${PROJECT_BINARY_DIR}/include/ecto
  DESTINATION ${include_prefix}
  COMPONENT main
  FILES_MATCHING PATTERN "*.hpp"
  )

