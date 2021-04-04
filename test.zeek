global realtion :table[addr] of set[string] =table();
event http_header(c: connection, is_orig: bool, name: string, value: string){
      if( name=="USER-AGENT"){
          if( c$id$orig_h in realtion ){
               add realtion[c$id$orig_h][value];}
          else{
               realtion[c$id$orig_h]=set(value);}
        }
}
event http_done(){
       for( x in realtion ){
           if( |realtion[x]| >= 3){
               print x," is a proxy";
            }
        }
}
