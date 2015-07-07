#!/bin/bash
function kill_children {
    pkill -P $$;
    wait;
}
trap "kill_children" EXIT
cmd=$1
shift
for host in web01 web02 web03 web04 #web05 web06 web07 web08;
do
	ssh $host $cmd $* &
#	echo $host $cmd $* &
done
wait
