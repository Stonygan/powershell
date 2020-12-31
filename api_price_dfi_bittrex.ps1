
$json = Invoke-RestMethod https://api.defichain.io/v1/listpoolpairs?start=0"&"limit=500"&"network=mainnet"&"including_start=false

$jsonbtc = Invoke-RestMethod https://api.bittrex.com/api/v1.1/public/getmarketsummary?market=btc-dfi
$jsonusdt = Invoke-RestMethod https://api.bittrex.com/api/v1.1/public/getmarketsummary?market=usdt-dfi
$jsoneth = Invoke-RestMethod https://api.bittrex.com/api/v1.1/public/getmarketsummary?market=usdt-eth

$bittrexbtcbid = $jsonbtc.result.bid
$bittrexbtcask = $jsonbtc.result.ask

$bittrexusdtbid = $jsonusdt.result.bid
$bittrexusdtask = $jsonusdt.result.ask

$bittrexeth = $jsoneth.result.last

$eth = $json.4
$ethprice = $eth.'reserveA/reserveB'

$btc = $json.5
$btcprice = $btc.'reserveA/reserveB'

$usdt = $json.6
$usdtprice = $usdt.'reserveA/reserveB'

write-host *******************************************************************
write-host DFI-USDT $usdtprice Bittrex: $bittrexusdtbid - $bittrexusdtask -NoNewline
write-host
write-host DFI-BTC $btcprice Bittrex: $bittrexbtcbid - $bittrexbtcask -NoNewline
Write-Host
write-host DFI-ETH $ethprice -NoNewline
write-host
Write-Host ETH: $bittrexeth
write-host *******************************************************************
write-host
write-host Calculations:
$spreadbtc = $bittrexbtcbid - $btcprice
Write-Host Satoshi-Spread = $spreadbtc -NoNewline
Write-Host
$spreadusdt = $bittrexusdtbid - $usdtprice
Write-Host USDT-Spread = $spreadusdt -NoNewline
$spreadeth = $usdtprice / $bittrexeth
$spreadeth = "{0:N8}" -f $spreadeth
write-host
write-host ETH-Preis Bittrex: $spreadeth -NoNewline
