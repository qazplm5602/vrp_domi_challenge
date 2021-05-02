# vrp_domi_challenge

### 설치방법

1. resources 폴더 안에 해당 파일을 넣으세요.
2. cfg에 입력해주세요.
```
start <Your Resource Name> / ensure <Your Resource Name>
```
3. 해당 파일안에 있는 sql 파일을 불러와 쿼리를 실행시키세요.
4. vrp - modules - identity.lua 에 175 줄 쯤에서 `` vRPclient.notify(player,{lang.money.paid({cfg.new_identity_cost})}) `` 가 있는 부분 밑에 추가해주세요
```
TriggerClientEvent('domi_challenge:city',player)
```
5. 끝
