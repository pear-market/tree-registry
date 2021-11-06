pragma solidity ^0.8.0;

contract PearMarket {
  address[] public suggesters;
  mapping (address => uint) suggesterIndexes;
  mapping (address => string) public suggesterUrls;

  constructor() {
    suggesters.push(address(0));
  }

  function registerSuggester(
    string memory url
  ) public {
    require(suggesterIndexes[msg.sender] == 0);
    suggesters.push(msg.sender);
    suggesterIndexes[msg.sender] = suggesters.length - 1;
    suggesterUrls[msg.sender] = url;
  }

  function updateUrl(string memory url) public {
    require(suggesterIndexes[msg.sender] != 0);
    suggesterUrls[msg.sender] = url;
  }

  function unregisterSuggester() public {
    require(suggesterIndexes[msg.sender] != 0);
    uint index = suggesterIndexes[msg.sender];
    suggesters[index] = address(0);
    suggesterIndexes[msg.sender] = 0;
    suggesterUrls[msg.sender] = '';
  }

  function suggesterInfoByIndex(uint index) public view returns (
    address,
    string memory
  ) {
    address suggester = suggesters[index];
    return (
      suggester,
      suggesterUrls[suggester]
    );
  }

  function suggesterInfo(address suggester) public view returns (
    string memory
  ) {
    return (
      suggesterUrls[suggester]
    );
  }

  function suggesterCount() public view returns (uint) {
    return suggesters.length;
  }
}
