// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 <0.9.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract MultiSender{
       
       address[] public recipient_address;
       uint[] public recipient_token;

       function Add_recipient(address _recipient_address,uint _recipient_token) public
       {        
       recipient_address.push(_recipient_address);
       recipient_token.push(_recipient_token);
       }

       function transfer_multiple_tokens(IERC20 _token_address,address _owner) public returns(bool)
       {
           for(uint i=0;i<recipient_address.length;i++)
           {
            transfer_token(_token_address,_owner,recipient_address[i],recipient_token[i]);
           }
           return true;
       }

       function transfer_token(IERC20 token,address _owner,address _to,uint _amount) private returns(bool)
        {
        bool sent = token.transferFrom(_owner,_to,_amount);
        require(sent, "Token transfer failed");
        return sent;
        }

}

