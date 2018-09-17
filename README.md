# ar-amp-epics-ioc

### Overall

Repository containing the EPICS IOC support to control
the RF Amplifiers by AR.

### Building

In order to build the IOC, from the top level directory, run:

```sh
$ make clean uninstall install
```
### Running

In order to run the IOC, from the top level directory, run:

```sh
$ cd iocBoot/iocARAmp &&
$ ./runARAmp.sh -i "IPADDR" -p "PORT"
```

where `IPADDR` and `PORT` are the IP address and port to connect to
the device, respectively.
The options that you can specify (after `./runARAmp.sh`) are:

- `-i IPADDR`: device IP address to connect to (required)
- `-p PORT`: device port number to connect to  (required)
- `-P PREFIX1`: the value of the EPICS `$(P)` macro used to prefix the PV names
- `-R PREFIX2`: the value of the EPICS `$(R)` macro used to prefix the PV names

In some situations it is desired to run the process using procServ,
which enables the IOC to be controlled by the system. In order to
run the IOC with procServ, instead of the previous command, run:

```sh
$ ./runProcServ.sh -t "TELNET_PORT" -i "IPADDR" -p "PORT" -P "PREFIX1" -R "PREFIX2"
```

where `TELNET_PORT` is the telnet port through which the IOC shell
will be accessible. The other options are as previously described.

