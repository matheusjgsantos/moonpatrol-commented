|Hardware|Address|Usage|
|-----|-----|-----------|
|VDP|0BEh|Data Port|
||0BFh|Register Port|
|PSG|0FFh (Write-only|Data Port)|
|Controller|080h (Write-only)|Strobe Set Port|
||0C0h|Strobe Reset Port|
||0FCh (Read-only)|Controller #1 port|
||0FFh (Read-only)|Controller #2 port|
|Modem|05Eh|Data Port|
||05Fh|Control Port|
||01eh|Auto dialer|
|Expansion Conn #2|04Fh|Data port|
|Memory Map| 07fh|Control Port|
|Network Reset|03Fh|Set and Reset bit 0|
|EOS Enable|03fh|Set bit 1|
|EOS Disable|03Fh|Reset bit 1|
