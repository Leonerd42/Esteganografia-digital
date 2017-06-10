  PImage img; //imagem tem 540 por 960 
  int i, pos, aux = 1;  // Posição x e y do pixels e i do for, variavel de posição do pixels no array  e variavel auxiliar 
  int a, b, c; //Variaveis para a leitura dos pixels 
  int p1, p2, p3, by; //Parte 1 do byte, Parte 2 e parte 3 e o byte final
  int aux2 = 1, aux3 = 0;  
  int posx, posy; 
 
void calc(int x, int y){      //Rotina para calcular a posição do pixel no vetor pixels[] através de X e Y encontrados  
  pos = x + (770*y);  
}

void leitura(){                          //rotina para a leitura dos bytes RBG
       a = pixels[i] & 0x000001; 
       b = pixels[i] & 0x000100; 
       c = pixels[i] & 0x010000; }        //Mascarando os bytes. 

void setup() {  
  
     img = loadImage("einstein1.bmp"); 
     image(img,0,0); 
     size(770,700); 

     loadPixels(); 
     calc(0,0); 
 
     for(i=pos;i<(pos+12); i++)
     {
          leitura();        
          switch(aux)
          {
               case 1:    p1 = (b>>1) | (a<<6);      //Parte mais significativa 
                          aux++; 
                          break; 
               case 2:    p2 = (a<<3) | (b>>4) | (c>>11);  //Parte do meio  
                          aux++; 
                          break; 
               case 3:    p3 = (a) | (b>>7) | (c>>14); //Parte menos significativa 
                          by = p3 | p2 | p1;
                          if(aux2 == 1) posy = by;           //Atribuindo o valor de Y para posy
                            else if(aux2 == 3) posx = by;    //Atribuindo o valor de X para posx 
                          aux2++; 
                          if(aux2 > 3) aux = 1;                           
                          println(binary(by),by); 
                          aux = 1; 
                          break; }}
     
     println("Valores de X e Y encontrados acima. Mensagem logo abaixo:\n"); 
     calc(posx,posy); 
     by = 1; //Atribuindo qq valor a by para entrar no for 
     
     for(i=pos;by!=0;i++){  //O loop se mantem até o byte encontrado for 0
      
        leitura();  //Usando a mascara para separar o bit menos significativo de cada byte dentro do pixel        
        switch(aux)
          {
               case 1:    p1 = (b>>1) | (a<<6);               //Mesma rotina que a rotina para encontrar o X e Y
                          aux++; 
                          break; 
               case 2:    p2 = (a<<3) | (b>>4) | (c>>11); 
                          aux++; 
                          break; 
               case 3:    p3 = (a) | (b>>7) | (c>>14); 
                          by = p3 | p2 | p1;
                          //by = (by1>>3);
                          char e = (char)by;
                          println(by,"\t",e,"\t",binary(by),by);                          
                          aux = 1; 
                          break; }}    
}
