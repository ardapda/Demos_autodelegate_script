#!/bin/bash
# set -x

KEYNAME="<your_key_name_here>"
VALIDATOR="<your_validator_address_here_desmosvaloper1xxxyyy.....>"
ADDRESS="<your_bank/wallet_address_here_desmos1xxxyyy.....>"
CHAINID="morpheus-apollo-1"
BINARY="<your_directory_to_the_build/bin>"

# Withdraw 
${BINARY}desmos tx distribution withdraw-rewards "${VALIDATOR}" --from "${KEYNAME}" --commission --chain-id=${CHAINID} --gas="400000" --fees="400udaric" -y

# Grab current account funds formated as "12345udaric"
FUNDS=$(${BINARY}desmos query bank balances ${ADDRESS} --output json | jq -r '.balances | map(select(.denom == "udaric")) | .[].amount + "udaric"')

# Give some time to the blockchain to execute the txs
sleep 15

# Delegate it back
${BINARY}desmos tx staking delegate "${VALIDATOR}" "${FUNDS}" --from "${KEYNAME}" --chain-id=${CHAINID} --gas="400000"   --fees="400udaric" -y


# //------------------------------------
# Edit your crontab for automatic execution. Below is an example for every hour.
# crontab -l
# crontab -e
# 0 */1 * * * /autodelegate.sh
