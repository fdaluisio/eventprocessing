################################################################################
#  Licensed to the Apache Software Foundation (ASF) under one
#  or more contributor license agreements.  See the NOTICE file
#  distributed with this work for additional information
#  regarding copyright ownership.  The ASF licenses this file
#  to you under the Apache License, Version 2.0 (the
#  "License"); you may not use this file except in compliance
#  with the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
# limitations under the License.
################################################################################

FROM icr.io/cpopen/ibm-eventautomation-flink/ibm-eventautomation-flink@sha256:6293f90840e67bed7338ab0591512296cf41886708a29378c53ef1cc5b5426d4

RUN mkdir /opt/flink/usrlib
ADD flink-sql-runner/target/flink-sql-runner-example-*.jar /opt/flink/usrlib/sql-runner.jar
ADD sql-scripts /opt/flink/usrlib/sql-scripts
