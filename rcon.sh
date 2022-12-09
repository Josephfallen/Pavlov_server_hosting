#!/bin/bash
function slowcat(){ while read; do sleep .15; echo "$REPLY"; done; }
cat $1 | slowcat | nc {SERVER IP} {SERVER RCON PORT}

{RCON PASSWORD CONVERTED TO MD5 HASH}
{RCON CMD}
{RCON CMD}
Disconnect
