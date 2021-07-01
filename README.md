# Desmos_autodelegate_script

Here is a quick script to check periodically the staking rewards and delegate them back to your own validator node.

This script should work on all Cosmos SDK based blockchains as some adaptations regarding the fee/token definitions may required.

<h3>Steps to follow</h3>

<ul>
<li>Copy the script to your validator and make it executable<br><code>chmod +x autodelegate.sh</code></li>
<li>Edit the below variables inside autodelegate.sh<br><code>nano autodelegate.sh</code><br>
KEYNAME: Keytoken of the validator, which signs the transactions or such<br>
VALIDATOR: Validator address e.g. desmosvaloper1xxxyyy<br> 
ADDRESS: Public wallet  e.g. desmos1xxxyyy<br>
CHAINID: Definition of chain id e.g. morpheus-apollo-1<br>
BINARY: Place, where the binary is located<br>  
Press <code>ctrl+x,y</code> to exit nano<br>
</li>
<li>Edit your crontab for automatic execution. Below is an exampe for every hour<br>
  <code>crontab -e</code><br>
  <code>0 */1 * * * /autodelegate.sh</code>
</li>
</ul>

<br><br>
Use of this script is at your own risk. No warranty is made as to it's use or performance.
