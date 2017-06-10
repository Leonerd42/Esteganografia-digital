#Esteganografia digital.

Informações do professor. 

  a) A informação está codificada nos bits menos significativos das cores RBG de cada pixel. Cada três pixels representam um byte.

b) Existe um cabeçalho de dados de 15 pixels começando no pixel 0,0 (zero, zero).

c) Os primeiros 6 pixels determinam o valor de X onde começa os pixels codificados.

d) Os 6 pixels seguintes determinam o valor de Y onde começa os pixels codificados.  //Os bytes X e Y estavam invertidos 

e) Os últimos três pixels do cabeçalho informam a direção da leitura.

f) A partir do décimo sexto pixel, seguindo a regra (a),  cada três pixels representa um BYTE, cujo dado está codificado em ASCII.


  A mensagem escondida é: A senha para acesso ao sistema XY120BX.
