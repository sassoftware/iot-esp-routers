# Copyright � 2020, SAS Institute Inc., Cary, NC, USA.  All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

# Register (DateFlux) ESP environment
export DFESP_HOME=/opt/sas/viya/home/SASEventStreamProcessingEngine/6.2

export PATH=$DFESP_HOME/bin:$PATH
export LD_LIBRARY_PATH=$DFESP_HOME/lib:$DFESP_HOME/lib/tk:/opt/sas/viya/home/SASFoundation/sasexe:$DFESP_HOME/ssl/lib

export PROJDIR=/home/zestem/router

dfesp_xml_server -http 61006 -pubsub 61007 -model file:///home/zestem/router/destination_project.xml

