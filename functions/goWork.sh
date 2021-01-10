#!/usr/bin/env bash

ASI="~/Sites/Rails/asi-ecommerce"
ATL_WP="~/Projects/Wordpress"
ATL_EXTRANET="~/Projects/Extranet"
ATL_AEC="~/Projects/arc-en-ciel"
CONTRATA="~/Sites/Node/contrata"
CONTRATA_NEXT="~/Sites/Rails/contrata"
SSWEB="~/Sites/Rails/squiresoft"
CHAT="~/Sites/Rails/chat-mediosot"

createWindow() {
    session=$1
    window=$2
    shift
    shift
    hasWindow=$(tmux list-windows -t $session | grep "$window")
    if [ -z "$hasWindow" ]; then
        cmd="tmux neww -t $session: -n $window -d"
        if [ $# -gt 0 ]; then
            cmd="$cmd $@"
        fi
        echo "Creating Window(\"$hasWindow\"): $cmd"
        eval $cmd
    fi
}

createSession() {
    session=$1
    window=$2
    shift
    shift
    cmd="tmux new -s $session -d -n $window $@ > /dev/null 2>&1"

    echo "Creating Session: $cmd"
    eval $cmd
}

openSession() {
  cmd="tmux a -t $1"
  echo "Opening Session: $cmd"
  eval $cmd
}

while [ "$#" -gt 0 ]; do
    curr=$1
    shift

    case "$curr" in
    "-s")
        createSession ss primary -c $SSWEB
        createWindow ss ss_pad -c $SSWEB
        createWindow ss ss_server -c $SSWEB "rails s"
        createWindow ss ss_guard -c $SSWEB "bundle exec guard"
        openSession ss
        ;;

    "-asi")
        createSession asi primary -c $ASI
        createWindow asi pad -c $ASI
        createWindow asi server -c $ASI "rails s"
        createWindow asi guard -c $ASI "bundle exec guard"
        openSession asi
        ;;

    "-ctn")
        createSession ctn primary -c $CONTRATA_NEXT
        createWindow ctn pad -c $CONTRATA_NEXT
        createWindow ctn server -c $CONTRATA_NEXT "rails s"
        createWindow ctn guard -c $CONTRATA_NEXT "bundle exec guard"
        openSession ctn
        ;;

    "-ct")
        createSession ct primary -c $CONTRATA
        createWindow ct server -c $CONTRATA/back "npm run server"
        createWindow ct client -c $CONTRATA/front "npm run dev"
        openSession ct
        ;;

    "-cta")
        createSession ct primary -c $CONTRATA
        createWindow ct server -c $CONTRATA/back "npm run server"
        createWindow ct admin -c $CONTRATA/front "npm run serve"
        openSession ct
        ;;

    "-atl")
        createSession atl wordpress -c $ATL_WP
        createWindow atl extranet -c $ATL_EXTRANET
        createWindow atl aec -c $ATL_AEC
        openSession atl
        ;;

    "-chat")
        createSession chat primary -c $CHAT
        createWindow chat pad -c $CHAT
        createWindow chat server -c $CHAT "rails s"
        createWindow chat guard -c $CHAT "bundle exec guard"
        openSession chat
        ;;

    *) echo "Unavailable command... $curr"
    esac
done
