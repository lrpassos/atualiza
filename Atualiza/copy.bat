cd..
cd..
cd..

net use p: /del

net use q: /del

net use p: \\192.168.2.240\Arquivo_dados\

net use q: \\192.168.2.118\m$


copy \\192.168.2.240\Arquivo_dados\dumpgeral.dmp  \\192.168.2.118\m$\talisma\

net use p: /del

net use q: /del




exit