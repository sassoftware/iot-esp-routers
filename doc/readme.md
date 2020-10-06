# Running the ESP Routers Project

## Download Files from GitLab

All files required to execute the ESP Router example are available in the [files](files) directory of this page. Download the following files:

- [test_data.csv](files/test_data.csv) – Input data for source_project model
- [source_project.xml](files/source_project.xml) – Source model for router
- [destination_project.xml](files/destination_project.xml) – Destination model for router
- [router.xml](files/router.xml) – Router xml file
- [run_source_project.sh](files/run_source_project.sh) – Startup script to execute source_project model
- [run_destination_project.sh](files/run_destination_project.sh) – Startup script to execute destination_project model
- [run_router.sh](files/run_router.sh) – Startup script to execute ESP Router

## Create Server Directory

Create a server directory for the project’s files. The following is an example of the command to create a directory:

~~~bash
mkdir /home/zestem/router
~~~

## Edit Startup Scripts

You must edit the startup scripts, `run_source_project.sh`, `run_destination_project.sh`, and `run_router.sh` to specify the correct server directories on your system.

### Edit run_source_project.sh

1.	Open `run_source_project.sh` with a text editor. The following is a listing of the file:
	
    ~~~bash
    # Copyright © 2020, SAS Institute Inc., Cary, NC, USA.  All Rights Reserved.
    # SPDX-License-Identifier: Apache-2.0

    # Register (DateFlux) ESP environment
    export DFESP_HOME=/opt/sas/viya/home/SASEventStreamProcessingEngine/6.2

    export PATH=$DFESP_HOME/bin:$PATH
    export LD_LIBRARY_PATH=$DFESP_HOME/lib:$DFESP_HOME/lib/tk:/opt/sas/viya/home/SASFoundation/sasexe:$DFESP_HOME/ssl/lib

    export PROJDIR=/home/zestem/router

    dfesp_xml_server -http 61002 -pubsub 61003 -model file:///home/zestem/router/source_project.xml
    ~~~

2.	Go to the `export PROJDIR=` line and edit the value to be the directory you created. The following is an example.

    ~~~bash
    export PROJDIR=/home/zestem/router
    ~~~
    
3.	Go to the last line (command to start XML Server) and edit the -model parameter to include the full path to the model’s xml file. Ensure there are the correct number of forward slashes (/) at the beginning of the filename. The following is an example:

    ~~~bash
    -model file:///home/zestem/router/source_project.xml
    ~~~
    
4.	Save your changes.

### Edit run_destination_project.sh

1.	Open `run_destination_project.sh` with a text editor. The following is a listing of the file:
	
    ~~~bash
    # Copyright © 2020, SAS Institute Inc., Cary, NC, USA.  All Rights Reserved.
    # SPDX-License-Identifier: Apache-2.0

    # Register (DateFlux) ESP environment
    export DFESP_HOME=/opt/sas/viya/home/SASEventStreamProcessingEngine/6.2

    export PATH=$DFESP_HOME/bin:$PATH
    export LD_LIBRARY_PATH=$DFESP_HOME/lib:$DFESP_HOME/lib/tk:/opt/sas/viya/home/SASFoundation/sasexe:$DFESP_HOME/ssl/lib

    export PROJDIR=/home/zestem/router

    dfesp_xml_server -http 61002 -pubsub 61003 -model file:///home/zestem/router/destination_project.xml
    ~~~

2.	Go to the `export PROJDIR=` line and edit the value to be the directory you created. The following is an example.

    ~~~bash
    export PROJDIR=/home/zestem/router
    ~~~
    
3.	Go to the last line (command to start XML Server) and edit the -model parameter to include the full path to the model’s xml file. Ensure there are the correct number of forward slashes (/) at the beginning of the filename. The following is an example:

    ~~~bash
    -model file:///home/zestem/router/destination_project.xml
    ~~~
    
4.	Save your changes.

### Edit run_router.sh

1.	Open `run_router.sh` with a text editor. The following is a listing of the file:
	
    ~~~bash
    # Copyright © 2020, SAS Institute Inc., Cary, NC, USA.  All Rights Reserved.
    # SPDX-License-Identifier: Apache-2.0

    # Register (DateFlux) ESP environment
    export DFESP_HOME=/opt/sas/viya/home/SASEventStreamProcessingEngine/6.2

    export PATH=$DFESP_HOME/bin:$PATH
    export LD_LIBRARY_PATH=$DFESP_HOME/lib:$DFESP_HOME/lib/tk:/opt/sas/viya/home/SASFoundation/sasexe:$DFESP_HOME/ssl/lib

    export PROJDIR=/home/zestem/router

    dfesp_xml_server -http 61002 -pubsub 61003 -model file:///home/zestem/router/router.xml
    ~~~

2.	Go to the `export PROJDIR=` line and edit the value to be the directory you created. The following is an example.

    ~~~bash
    export PROJDIR=/home/zestem/router
    ~~~
    
3.	Go to the last line (command to start XML Server) and edit the -model parameter to include the full path to the router’s xml file. Ensure there are the correct number of forward slashes (/) at the beginning of the filename. The following is an example:

    ~~~bash
    -model file:///home/zestem/router/router.xml
    ~~~
    
4.	Save your changes.

## Upload Files

Upload all the files to the directory you created. Change the permission of the three startup scripts so they are executable. The following is an example of the command to do this:

~~~bash
chmod 777 /home/zestem/router/run_source_project.sh
~~~

## Execute Project

1.	Change directories to the directory containing the files you uploaded. The following is an example:

    ~~~bash
	cd /home/zestem/router
	~~~
	
2.	Type the following to execute the startup script and start the source_project model:

    ~~~bash
	./run_source_project.sh
	~~~

    The terminal should display information about the model executing on the ESP XML Server.
    
3.	Start a new session and type the following to execute the startup script and start the destination_project model:
    
    ~~~bash
	./run_destination_project.sh
    ~~~

    The terminal should display information about the model executing on the ESP XML Server.
    
4.	Start a new session and type the following to execute the router:

    ~~~bash
	./run_router.sh
	~~~
	
    The terminal should display information about the router executing on the ESP XML Server.
    
## View Results

There are four files created in the directory you specified as the project directory:

- [test.json](files/output/test.json) – Created by the router. Output of Compute 1 window of source_project. Can be viewed with a browser.
- [output1.csv](files/output/output1.csv) – Created by Compute 1 window of destination_project. Can be viewed with Excel or a text editor.
- [output2.csv](files/output/output2.csv) – Created by Compute 2 window of destination_project. Can be viewed with Excel or a text editor.
- [output3.csv](files/output/output3.csv) – Created by Compute 3 window of destination_project. Can be viewed with Excel or a text editor.

    



