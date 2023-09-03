./sdriver.pl -t trace01.txt -s ./tshref -a "-p"
#
# trace01.txt - Properly terminate on EOF.
#
./sdriver.pl -t trace02.txt -s ./tshref -a "-p"
#
# trace02.txt - Process builtin quit command.
#
./sdriver.pl -t trace03.txt -s ./tshref -a "-p"
#
# trace03.txt - Run a foreground job.
#
tsh> quit
./sdriver.pl -t trace04.txt -s ./tshref -a "-p"
#
# trace04.txt - Run a background job.
#
tsh> ./myspin 1 &
[1] (17743) ./myspin 1 &
./sdriver.pl -t trace05.txt -s ./tshref -a "-p"
#
# trace05.txt - Process jobs builtin command.
#
tsh> ./myspin 2 &
[1] (17760) ./myspin 2 &
tsh> ./myspin 3 &
[2] (17762) ./myspin 3 &
tsh> jobs
[1] (17760) Running ./myspin 2 &
[2] (17762) Running ./myspin 3 &
./sdriver.pl -t trace06.txt -s ./tshref -a "-p"
#
# trace06.txt - Forward SIGINT to foreground job.
#
tsh> ./myspin 4
Job [1] (17777) terminated by signal 2
./sdriver.pl -t trace07.txt -s ./tshref -a "-p"
#
# trace07.txt - Forward SIGINT only to foreground job.
#
tsh> ./myspin 4 &
[1] (17794) ./myspin 4 &
tsh> ./myspin 5
Job [2] (17796) terminated by signal 2
tsh> jobs
[1] (17794) Running ./myspin 4 &
./sdriver.pl -t trace08.txt -s ./tshref -a "-p"
#
# trace08.txt - Forward SIGTSTP only to foreground job.
#
tsh> ./myspin 4 &
[1] (17814) ./myspin 4 &
tsh> ./myspin 5
Job [2] (17816) stopped by signal 20
tsh> jobs
[1] (17814) Running ./myspin 4 &
[2] (17816) Stopped ./myspin 5 
./sdriver.pl -t trace09.txt -s ./tshref -a "-p"
#
# trace09.txt - Process bg builtin command
#
tsh> ./myspin 4 &
[1] (17836) ./myspin 4 &
tsh> ./myspin 5
Job [2] (17838) stopped by signal 20
tsh> jobs
[1] (17836) Running ./myspin 4 &
[2] (17838) Stopped ./myspin 5 
tsh> bg %2
[2] (17838) ./myspin 5 
tsh> jobs
[1] (17836) Running ./myspin 4 &
[2] (17838) Running ./myspin 5 
./sdriver.pl -t trace10.txt -s ./tshref -a "-p"
#
# trace10.txt - Process fg builtin command. 
#
tsh> ./myspin 4 &
[1] (17859) ./myspin 4 &
tsh> fg %1
Job [1] (17859) stopped by signal 20
tsh> jobs
[1] (17859) Stopped ./myspin 4 &
tsh> fg %1
tsh> jobs
./sdriver.pl -t trace11.txt -s ./tshref -a "-p"
#
# trace11.txt - Forward SIGINT to every process in foreground process group
#
tsh> ./mysplit 4
Job [1] (17880) terminated by signal 2
tsh> /bin/ps a
  PID TTY      STAT   TIME COMMAND
13889 pts/4    Ss     0:02 -zsh
15528 pts/0    Ss+    0:00 sh -c "$VSCODE_WSL_EXT_LOCATION/scripts/wslServer.sh" b3e4e68a0bc097f0ae7907b217c1119af9e03435 stable code-server .vscode-server --host=127.0.0.1 --port=0 --connection-token=1249978665-1347515220-171713456-3262918879 --use-host-proxy --without-browser-env-var --disable-websocket-compression --accept-server-license-terms --telemetry-level=all
15529 pts/0    S+     0:00 sh /mnt/c/Users/11413/.vscode/extensions/ms-vscode-remote.remote-wsl-0.78.9/scripts/wslServer.sh b3e4e68a0bc097f0ae7907b217c1119af9e03435 stable code-server .vscode-server --host=127.0.0.1 --port=0 --connection-token=1249978665-1347515220-171713456-3262918879 --use-host-proxy --without-browser-env-var --disable-websocket-compression --accept-server-license-terms --telemetry-level=all
15534 pts/0    S+     0:00 sh /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/bin/code-server --host=127.0.0.1 --port=0 --connection-token=1249978665-1347515220-171713456-3262918879 --use-host-proxy --without-browser-env-var --disable-websocket-compression --accept-server-license-terms --telemetry-level=all
15538 pts/0    Sl+    0:11 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/out/server-main.js --host=127.0.0.1 --port=0 --connection-token=1249978665-1347515220-171713456-3262918879 --use-host-proxy --without-browser-env-var --disable-websocket-compression --accept-server-license-terms --telemetry-level=all
15549 pts/0    Sl+    0:00 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/out/bootstrap-fork --type=ptyHost --logsPath /home/monica/.vscode-server/data/logs/20230611T150922
15563 pts/1    Ssl+   0:01 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node -e const net = require('net'); process.stdin.pause(); const client = net.createConnection({ host: '127.0.0.1', port: 43829 }, () => { client.pipe(process.stdout); process.stdin.pipe(client); }); client.on('close', function (hadError) { console.error(hadError ? 'Remote close with error' : 'Remote close'); process.exit(hadError ? 1 : 0); }); client.on('error', function (err) { process.stderr.write(err && (err.stack || err.message) || String(err)); });
15572 pts/2    Ssl+   0:02 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node -e const net = require('net'); process.stdin.pause(); const client = net.createConnection({ host: '127.0.0.1', port: 43829 }, () => { client.pipe(process.stdout); process.stdin.pipe(client); }); client.on('close', function (hadError) { console.error(hadError ? 'Remote close with error' : 'Remote close'); process.exit(hadError ? 1 : 0); }); client.on('error', function (err) { process.stderr.write(err && (err.stack || err.message) || String(err)); });
15579 pts/0    Sl+    0:01 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/out/bootstrap-fork --type=fileWatcher
15617 pts/0    Sl+    0:29 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/out/bootstrap-fork --type=extensionHost --transformURIs --useHostProxy=true
15632 pts/0    Sl+    0:04 /home/monica/.vscode-server/data/User/globalStorage/llvm-vs-code-extensions.vscode-clangd/install/16.0.2/clangd_16.0.2/bin/clangd
15771 pts/0    Sl+    0:14 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/extensions/ms-python.vscode-pylance-2023.6.10/dist/server.bundle.js --cancellationReceive=file:841d0eb9f751e1a2eff2f29c141003ae47981034a9 --node-ipc --clientProcessId=15617
17697 pts/4    S+     0:00 /usr/bin/python3 ./test.py
17874 pts/4    S+     0:00 sh -c make rtest11>>tshref.sh
17875 pts/4    S+     0:00 make rtest11
17876 pts/4    S+     0:00 /bin/sh -c ./sdriver.pl -t trace11.txt -s ./tshref -a "-p"
17877 pts/4    R+     0:00 /usr/bin/perl ./sdriver.pl -t trace11.txt -s ./tshref -a -p
17878 pts/4    S+     0:00 ./tshref -p
17883 pts/4    R      0:00 /bin/ps a
./sdriver.pl -t trace12.txt -s ./tshref -a "-p"
#
# trace12.txt - Forward SIGTSTP to every process in foreground process group
#
tsh> ./mysplit 4
Job [1] (17901) stopped by signal 20
tsh> jobs
[1] (17901) Stopped ./mysplit 4 
tsh> /bin/ps a
  PID TTY      STAT   TIME COMMAND
13889 pts/4    Ss     0:02 -zsh
15528 pts/0    Ss+    0:00 sh -c "$VSCODE_WSL_EXT_LOCATION/scripts/wslServer.sh" b3e4e68a0bc097f0ae7907b217c1119af9e03435 stable code-server .vscode-server --host=127.0.0.1 --port=0 --connection-token=1249978665-1347515220-171713456-3262918879 --use-host-proxy --without-browser-env-var --disable-websocket-compression --accept-server-license-terms --telemetry-level=all
15529 pts/0    S+     0:00 sh /mnt/c/Users/11413/.vscode/extensions/ms-vscode-remote.remote-wsl-0.78.9/scripts/wslServer.sh b3e4e68a0bc097f0ae7907b217c1119af9e03435 stable code-server .vscode-server --host=127.0.0.1 --port=0 --connection-token=1249978665-1347515220-171713456-3262918879 --use-host-proxy --without-browser-env-var --disable-websocket-compression --accept-server-license-terms --telemetry-level=all
15534 pts/0    S+     0:00 sh /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/bin/code-server --host=127.0.0.1 --port=0 --connection-token=1249978665-1347515220-171713456-3262918879 --use-host-proxy --without-browser-env-var --disable-websocket-compression --accept-server-license-terms --telemetry-level=all
15538 pts/0    Sl+    0:11 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/out/server-main.js --host=127.0.0.1 --port=0 --connection-token=1249978665-1347515220-171713456-3262918879 --use-host-proxy --without-browser-env-var --disable-websocket-compression --accept-server-license-terms --telemetry-level=all
15549 pts/0    Sl+    0:00 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/out/bootstrap-fork --type=ptyHost --logsPath /home/monica/.vscode-server/data/logs/20230611T150922
15563 pts/1    Ssl+   0:01 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node -e const net = require('net'); process.stdin.pause(); const client = net.createConnection({ host: '127.0.0.1', port: 43829 }, () => { client.pipe(process.stdout); process.stdin.pipe(client); }); client.on('close', function (hadError) { console.error(hadError ? 'Remote close with error' : 'Remote close'); process.exit(hadError ? 1 : 0); }); client.on('error', function (err) { process.stderr.write(err && (err.stack || err.message) || String(err)); });
15572 pts/2    Ssl+   0:02 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node -e const net = require('net'); process.stdin.pause(); const client = net.createConnection({ host: '127.0.0.1', port: 43829 }, () => { client.pipe(process.stdout); process.stdin.pipe(client); }); client.on('close', function (hadError) { console.error(hadError ? 'Remote close with error' : 'Remote close'); process.exit(hadError ? 1 : 0); }); client.on('error', function (err) { process.stderr.write(err && (err.stack || err.message) || String(err)); });
15579 pts/0    Sl+    0:01 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/out/bootstrap-fork --type=fileWatcher
15617 pts/0    Sl+    0:29 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/out/bootstrap-fork --type=extensionHost --transformURIs --useHostProxy=true
15632 pts/0    Sl+    0:04 /home/monica/.vscode-server/data/User/globalStorage/llvm-vs-code-extensions.vscode-clangd/install/16.0.2/clangd_16.0.2/bin/clangd
15771 pts/0    Sl+    0:14 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/extensions/ms-python.vscode-pylance-2023.6.10/dist/server.bundle.js --cancellationReceive=file:841d0eb9f751e1a2eff2f29c141003ae47981034a9 --node-ipc --clientProcessId=15617
17697 pts/4    S+     0:00 /usr/bin/python3 ./test.py
17895 pts/4    S+     0:00 sh -c make rtest12>>tshref.sh
17896 pts/4    S+     0:00 make rtest12
17897 pts/4    S+     0:00 /bin/sh -c ./sdriver.pl -t trace12.txt -s ./tshref -a "-p"
17898 pts/4    R+     0:00 /usr/bin/perl ./sdriver.pl -t trace12.txt -s ./tshref -a -p
17899 pts/4    S+     0:00 ./tshref -p
17901 pts/4    T      0:00 ./mysplit 4
17902 pts/4    T      0:00 ./mysplit 4
17905 pts/4    R      0:00 /bin/ps a
./sdriver.pl -t trace13.txt -s ./tshref -a "-p"
#
# trace13.txt - Restart every stopped process in process group
#
tsh> ./mysplit 4
Job [1] (17926) stopped by signal 20
tsh> jobs
[1] (17926) Stopped ./mysplit 4 
tsh> /bin/ps a
  PID TTY      STAT   TIME COMMAND
13889 pts/4    Ss     0:02 -zsh
15528 pts/0    Ss+    0:00 sh -c "$VSCODE_WSL_EXT_LOCATION/scripts/wslServer.sh" b3e4e68a0bc097f0ae7907b217c1119af9e03435 stable code-server .vscode-server --host=127.0.0.1 --port=0 --connection-token=1249978665-1347515220-171713456-3262918879 --use-host-proxy --without-browser-env-var --disable-websocket-compression --accept-server-license-terms --telemetry-level=all
15529 pts/0    S+     0:00 sh /mnt/c/Users/11413/.vscode/extensions/ms-vscode-remote.remote-wsl-0.78.9/scripts/wslServer.sh b3e4e68a0bc097f0ae7907b217c1119af9e03435 stable code-server .vscode-server --host=127.0.0.1 --port=0 --connection-token=1249978665-1347515220-171713456-3262918879 --use-host-proxy --without-browser-env-var --disable-websocket-compression --accept-server-license-terms --telemetry-level=all
15534 pts/0    S+     0:00 sh /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/bin/code-server --host=127.0.0.1 --port=0 --connection-token=1249978665-1347515220-171713456-3262918879 --use-host-proxy --without-browser-env-var --disable-websocket-compression --accept-server-license-terms --telemetry-level=all
15538 pts/0    Sl+    0:11 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/out/server-main.js --host=127.0.0.1 --port=0 --connection-token=1249978665-1347515220-171713456-3262918879 --use-host-proxy --without-browser-env-var --disable-websocket-compression --accept-server-license-terms --telemetry-level=all
15549 pts/0    Sl+    0:00 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/out/bootstrap-fork --type=ptyHost --logsPath /home/monica/.vscode-server/data/logs/20230611T150922
15563 pts/1    Ssl+   0:01 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node -e const net = require('net'); process.stdin.pause(); const client = net.createConnection({ host: '127.0.0.1', port: 43829 }, () => { client.pipe(process.stdout); process.stdin.pipe(client); }); client.on('close', function (hadError) { console.error(hadError ? 'Remote close with error' : 'Remote close'); process.exit(hadError ? 1 : 0); }); client.on('error', function (err) { process.stderr.write(err && (err.stack || err.message) || String(err)); });
15572 pts/2    Ssl+   0:02 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node -e const net = require('net'); process.stdin.pause(); const client = net.createConnection({ host: '127.0.0.1', port: 43829 }, () => { client.pipe(process.stdout); process.stdin.pipe(client); }); client.on('close', function (hadError) { console.error(hadError ? 'Remote close with error' : 'Remote close'); process.exit(hadError ? 1 : 0); }); client.on('error', function (err) { process.stderr.write(err && (err.stack || err.message) || String(err)); });
15579 pts/0    Sl+    0:01 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/out/bootstrap-fork --type=fileWatcher
15617 pts/0    Sl+    0:29 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/out/bootstrap-fork --type=extensionHost --transformURIs --useHostProxy=true
15632 pts/0    Sl+    0:04 /home/monica/.vscode-server/data/User/globalStorage/llvm-vs-code-extensions.vscode-clangd/install/16.0.2/clangd_16.0.2/bin/clangd
15771 pts/0    Sl+    0:14 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/extensions/ms-python.vscode-pylance-2023.6.10/dist/server.bundle.js --cancellationReceive=file:841d0eb9f751e1a2eff2f29c141003ae47981034a9 --node-ipc --clientProcessId=15617
17697 pts/4    S+     0:00 /usr/bin/python3 ./test.py
17920 pts/4    S+     0:00 sh -c make rtest13>>tshref.sh
17921 pts/4    S+     0:00 make rtest13
17922 pts/4    S+     0:00 /bin/sh -c ./sdriver.pl -t trace13.txt -s ./tshref -a "-p"
17923 pts/4    S+     0:00 /usr/bin/perl ./sdriver.pl -t trace13.txt -s ./tshref -a -p
17924 pts/4    S+     0:00 ./tshref -p
17926 pts/4    T      0:00 ./mysplit 4
17927 pts/4    T      0:00 ./mysplit 4
17930 pts/4    R      0:00 /bin/ps a
tsh> fg %1
tsh> /bin/ps a
  PID TTY      STAT   TIME COMMAND
13889 pts/4    Ss     0:02 -zsh
15528 pts/0    Ss+    0:00 sh -c "$VSCODE_WSL_EXT_LOCATION/scripts/wslServer.sh" b3e4e68a0bc097f0ae7907b217c1119af9e03435 stable code-server .vscode-server --host=127.0.0.1 --port=0 --connection-token=1249978665-1347515220-171713456-3262918879 --use-host-proxy --without-browser-env-var --disable-websocket-compression --accept-server-license-terms --telemetry-level=all
15529 pts/0    S+     0:00 sh /mnt/c/Users/11413/.vscode/extensions/ms-vscode-remote.remote-wsl-0.78.9/scripts/wslServer.sh b3e4e68a0bc097f0ae7907b217c1119af9e03435 stable code-server .vscode-server --host=127.0.0.1 --port=0 --connection-token=1249978665-1347515220-171713456-3262918879 --use-host-proxy --without-browser-env-var --disable-websocket-compression --accept-server-license-terms --telemetry-level=all
15534 pts/0    S+     0:00 sh /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/bin/code-server --host=127.0.0.1 --port=0 --connection-token=1249978665-1347515220-171713456-3262918879 --use-host-proxy --without-browser-env-var --disable-websocket-compression --accept-server-license-terms --telemetry-level=all
15538 pts/0    Sl+    0:11 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/out/server-main.js --host=127.0.0.1 --port=0 --connection-token=1249978665-1347515220-171713456-3262918879 --use-host-proxy --without-browser-env-var --disable-websocket-compression --accept-server-license-terms --telemetry-level=all
15549 pts/0    Sl+    0:00 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/out/bootstrap-fork --type=ptyHost --logsPath /home/monica/.vscode-server/data/logs/20230611T150922
15563 pts/1    Ssl+   0:01 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node -e const net = require('net'); process.stdin.pause(); const client = net.createConnection({ host: '127.0.0.1', port: 43829 }, () => { client.pipe(process.stdout); process.stdin.pipe(client); }); client.on('close', function (hadError) { console.error(hadError ? 'Remote close with error' : 'Remote close'); process.exit(hadError ? 1 : 0); }); client.on('error', function (err) { process.stderr.write(err && (err.stack || err.message) || String(err)); });
15572 pts/2    Ssl+   0:02 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node -e const net = require('net'); process.stdin.pause(); const client = net.createConnection({ host: '127.0.0.1', port: 43829 }, () => { client.pipe(process.stdout); process.stdin.pipe(client); }); client.on('close', function (hadError) { console.error(hadError ? 'Remote close with error' : 'Remote close'); process.exit(hadError ? 1 : 0); }); client.on('error', function (err) { process.stderr.write(err && (err.stack || err.message) || String(err)); });
15579 pts/0    Sl+    0:01 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/out/bootstrap-fork --type=fileWatcher
15617 pts/0    Sl+    0:29 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/out/bootstrap-fork --type=extensionHost --transformURIs --useHostProxy=true
15632 pts/0    Sl+    0:04 /home/monica/.vscode-server/data/User/globalStorage/llvm-vs-code-extensions.vscode-clangd/install/16.0.2/clangd_16.0.2/bin/clangd
15771 pts/0    Sl+    0:14 /home/monica/.vscode-server/bin/b3e4e68a0bc097f0ae7907b217c1119af9e03435/node /home/monica/.vscode-server/extensions/ms-python.vscode-pylance-2023.6.10/dist/server.bundle.js --cancellationReceive=file:841d0eb9f751e1a2eff2f29c141003ae47981034a9 --node-ipc --clientProcessId=15617
17697 pts/4    S+     0:00 /usr/bin/python3 ./test.py
17920 pts/4    S+     0:00 sh -c make rtest13>>tshref.sh
17921 pts/4    S+     0:00 make rtest13
17922 pts/4    S+     0:00 /bin/sh -c ./sdriver.pl -t trace13.txt -s ./tshref -a "-p"
17923 pts/4    R+     0:00 /usr/bin/perl ./sdriver.pl -t trace13.txt -s ./tshref -a -p
17924 pts/4    S+     0:00 ./tshref -p
17933 pts/4    R      0:00 /bin/ps a
./sdriver.pl -t trace14.txt -s ./tshref -a "-p"
#
# trace14.txt - Simple error handling
#
tsh> ./bogus
./bogus: Command not found
tsh> ./myspin 4 &
[1] (17962) ./myspin 4 &
tsh> fg
fg command requires PID or %jobid argument
tsh> bg
bg command requires PID or %jobid argument
tsh> fg a
fg: argument must be a PID or %jobid
tsh> bg a
bg: argument must be a PID or %jobid
tsh> fg 9999999
(9999999): No such process
tsh> bg 9999999
(9999999): No such process
tsh> fg %2
%2: No such job
tsh> fg %1
Job [1] (17962) stopped by signal 20
tsh> bg %2
%2: No such job
tsh> bg %1
[1] (17962) ./myspin 4 &
tsh> jobs
[1] (17962) Running ./myspin 4 &
./sdriver.pl -t trace15.txt -s ./tshref -a "-p"
#
# trace15.txt - Putting it all together
#
tsh> ./bogus
./bogus: Command not found
tsh> ./myspin 10
Job [1] (18003) terminated by signal 2
tsh> ./myspin 3 &
[1] (18005) ./myspin 3 &
tsh> ./myspin 4 &
[2] (18007) ./myspin 4 &
tsh> jobs
[1] (18005) Running ./myspin 3 &
[2] (18007) Running ./myspin 4 &
tsh> fg %1
Job [1] (18005) stopped by signal 20
tsh> jobs
[1] (18005) Stopped ./myspin 3 &
[2] (18007) Running ./myspin 4 &
tsh> bg %3
%3: No such job
tsh> bg %1
[1] (18005) ./myspin 3 &
tsh> jobs
[1] (18005) Running ./myspin 3 &
[2] (18007) Running ./myspin 4 &
tsh> fg %1
tsh> quit
./sdriver.pl -t trace16.txt -s ./tshref -a "-p"
#
# trace16.txt - Tests whether the shell can handle SIGTSTP and SIGINT
#     signals that come from other processes instead of the terminal.
#
tsh> ./mystop 2
Job [1] (18032) stopped by signal 20
tsh> jobs
[1] (18032) Stopped ./mystop 2
tsh> ./myint 2
Job [2] (18035) terminated by signal 2
