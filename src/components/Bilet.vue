<script>
export default{
    props: {
    name: String,
    voblers: String, // TEMP
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
            <div class="info_vobles">
                {{ voblers }}
            </div>
            <div>
                {{ stats }}
            </div>
            <div>
                AVAIBLE
            </div>


            </div>
            <div>BOUGHT INFO</div>

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
    height:22px;
    margin-bottom: 12px;
    margin-top: 8px;
  }


</style>
