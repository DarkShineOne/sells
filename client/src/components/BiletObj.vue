


<script>
export default{
    props: {
    product: Object
    }
}

//ЭТО ТЕСТОВАЯ ХУЙНЯ, РАБОТАЕТ ПО ОБЪЕКТУ
</script>

<template>
     <div class="bilet_border1">
        <div class="bilet_content1">
            <div class ="bilet_img1"><img :src="product.logourl" width="160" height="160" /></div>
            <div class="bilet_info1">
            <div class="info_name1">
            {{ product.name }}
            </div>
            <div class="info_vobles">
                Скидка: 
            </div>
            <div>
                STATS
            </div>
            <div>
                AVAIBLE
            </div>


            </div>
            
          <div class="bought_info1">
            <div class="price1">
              <span class="old_price1">{{ product.price }}</span><br>

              69999
            </div>
            <div class="credit_price1">от 6666₽/ мес.</div>
            
            <button class="like_button buttons1">&hearts;</button>
            <button class ="buy_button buttons1">КУПИЦ</button>
          </div>

        </div>
    </div>
</template>

<style>

  .bilet_border1{
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

  .bilet_content1{
    margin: 16px 24px;
    display: flex;
    box-sizing: border-box;
  }
  .bilet_img1{
    margin-bottom: 16px;
    margin-right: 16px;
  }

  .bilet_info1{
    width: 519px;
    height: 146px;
  }

  .info_name1{
    height:72px
  }


  .info_vobles1{
    height:18px;
    margin-bottom: 12px;
    margin-top: 8px;
    background-color: #fff0ef;
    width: fit-content;
    border-radius: 4px;
    font-family: 'PT Sans';
    font-style: normal;
    font-weight: 400;
    font-size: 12px;
    line-height: 14px;
    padding: 4px;
    color: #FF6558;

    display: flex;
    align-items: center;

  }

  .bought_info1{
    text-align: right;
  }

  .buttons1{
	background: rgb(255, 255, 255);
	border-radius: 8px;
	transition: all 0.5s ease;
  border: 1px solid #D9D9D9;
}
  .buy_button1 {
	width: 89px;
  height: 44px;
  margin-left: 4px;
  
}

.buy_button1:hover{
	background-color: #FF6558;
}

.like_button1 {
  width: 44px;
  height: 44px;
}

.like_button1:hover{
	background-color: #7c58ff;
}

.price1{
  color:#FC8507;
  font-size: 18px;
}

.old_price{
  text-decoration: line-through;
  color:gray;
  font-size: 12px;
}

.any_price{
  
}
</style>
