


<script>
export default{
    props: {
    product: Object
    },
    methods:{
    href(link,add){
      if(add)
       location.href='https://www.dns-shop.ru'+link+add;
      else location.href='https://www.dns-shop.ru'+link
    },
    log(){
      console.log(JSON.stringify(this.product))
    },
    delslash(){   
      return this.product.string_agg.replaceAll("\\\\",", ").replaceAll("\\",", ").replaceAll("NULL","").replaceAll(", ,",",")
    }
  }
    
  
}

</script>

<template>
     <div class="bilet_border">
        <div class="bilet_content">
            <div class ="bilet_img"><img :src="product.logourl" width="160" height="160" /></div>
            <div class="bilet_info">
            <div class="info_name" @click="href(product.itemlink)">
            {{ product.name +'[' + delslash() + ']' }} <!-- ТУТ НЕХВАТАЕТ ПАРАМЕТРОВ ТОВАРА! НУЖЕН СЕЛЕКТ -->
            </div>
            <div class="info_vobles" @click="log()">
                Скидка: 
            </div>
            <div>
                
                STATS: <a class="bilet_stars" @click="href(product.itemlink,'opinion')">
                  <a v-for="i in Number(product.rating[0])"> <img src="./img/full_star.svg"/> </a> 
                  <a v-if="Number(product.rating[2])>= 5"> <img src="./img/half_star.svg"/> </a>
                  <a v-else-if="Number(product.rating[0])!= 5"> <img src="./img/empty_star.svg"/> </a>
                  <a v-if="Number(product.rating[0] < 4)" v-for="i in 4-Number(product.rating[0])"> <img src="./img/empty_star.svg"/> </a>  
                  {{ product.rating }}
              </a>
            </div>
            <div class="bilet_avaible">
                AVAIBLE
                <a v-if="product.itemcount > 0">В наличии {{ product.itemcount }}шт. </a>
                <a v-else>Нет в наличии</a>
            </div>


            </div>
            
          <div class="bought_info">
            <div class="price">
              <span class="old_price">{{ product.price }}</span><br>

              {{ product.price }}₽ <!-- СКИДКИ НЕТ В ВЫБОРКЕ! СКИДКИ ВООБЩЕ В БД НЕТ, НО КАК ПОЯВИТСЯ ТУТ ВСТАВИТЬ {{ (product.price * product.discont).toFixed() }} -->
            </div>
            <div class="credit_price">от {{ (product.price/11).toFixed() }}₽/ мес.</div> <!-- Рассрочка пока считается просто делением на 11 и округлением -->
            
            <button class="like_button buttons">ᅠ</button>
            <button @click="href(product.itemlink)" class ="buy_button buttons">КУПИТЬ</button>
          </div>

        </div>
    </div>
</template>


<style>


  .bilet_border{
    display: flex;
    flex-direction: column;
    margin-top: 12px;
    margin-right: 20px;
    height: 224px;
    width: 880px;
    gap: 10px;
    background-color:#fff;
    border-radius:8px;
    box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.16);
    
  }

  .bilet_content{
    margin: 16px 24px;
    display: flex;
    box-sizing: border-box;
  }
  .bilet_img{
    margin-bottom: 16px;
    margin-right: 16px;
  }

  .bilet_info{
    width: 519px;
    height: 146px;
  }

  .info_name{
    cursor: pointer;
    height:72px;
    transition: all 0.3s ease;
   
  }

  .info_name:hover{
    color:#fc5808;
  }


  .info_vobles{
    height:18px;
    margin-bottom: 12px;
    margin-top: 8px;
    background-color: #fff0ef;
    width: fit-content;
    border-radius: 4px;
    font-style: normal;
    font-weight: 400;
    font-size: 12px;
    line-height: 14px;
    padding: 4px;
    color: #FF6558;

    display: flex;
    align-items: center;

  }

  .bought_info{
    text-align: right;
  }

  .buttons {
	background: rgb(255, 255, 255);
	border-radius: 8px;
	transition: all 0.3s ease;
  border: 1px solid #D9D9D9;
  cursor: pointer;
}
  .buy_button {
	width: 89px;
  height: 44px;
  margin-left: 4px;
  
}

.buy_button:hover{
	/* background-color: #FC8507; */
  background-image: linear-gradient(#f7a15b, #FC8507);
  color:#fff;
}

.like_button {
  width: 44px;
  height: 44px;
  color:#D9D9D9;
  font-size: small;
  margin:none;
  background-image: url(./img/heartlike2.svg);
  padding: 2px;
  background-size: cover;
}


.like_button:hover{
	background-color: #f3f1f1;
}

.price{
  color:#FC8507;
  font-size: 18px;
}

.old_price{
  text-decoration: line-through;
  color:gray;
  font-size: 12px;
}

.bilet_stars{
  cursor: pointer;
  width: 105px;
  height: 24px;
  padding: 4px 7px 4px 3px;
  align-items: center;
  gap: 2px;
  border-radius: 8px;
  border: 1px solid var(--grey-grey-20, #EEE);
  transition: all 0.3s ease;

}

.bilet_stars:hover{
  border: 1px solid var(--grey-grey-20, #fc8507);
  color:#fc5808;
}

.bilet_avaible{
  font-size: 14px;
  margin-top: 12px;

}

</style>
