<script>
export default{
    props: {
    name: String,
    voblers: String, // TEMP
    v_color: String, // TEMP
    v_text_color: String, //TEMP
    stats: String,
    image: String
    }
}
</script>

<template>
     <div class="bilet_border">
        <div class="bilet_content">
            <div class ="bilet_img"><img :src="image" width="160" height="160" /></div>
            <div class="bilet_info">
            <div class="info_name">
            {{ name }}
            </div>
            <div v-if="voblers" class="info_vobles" :style="{'background-color':v_color, 'color':v_text_color }">
                {{ voblers }}
            </div>
            <div v-else="voblers" class="info_vobles" :style="{'background-color':'#fff'}">
                {{ voblers }}
            </div>
            <div>
                {{ stats }}
            </div>
            <div>
                AVAIBLE
            </div>


            </div>
            
          <div>
            BOUGHT INFO
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
    box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.1);
    
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
    height:72px
  }


  .info_vobles{
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


</style>
