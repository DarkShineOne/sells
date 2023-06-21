
<script>
import Sidebar from '@/components/Sidebar'
import Body_catalog from '@/components/Body_catalog'
export default{
  components:{
    Sidebar, Body_catalog
  }

}
</script>

<template>
  <div class="header"></div>
  <div class="main-block">
    <div class="bread-crumb">
      хлебные крошки
    </div>    
    <h1 class="title-name">Категория</h1>
    <div class="work-block">
      <Sidebar/>
      <Body_catalog/>
    </div>
  </div>
</template>

<style>

@font-face {
  font-family:"PT Sans";
  src: local("PT Sans"),
  url(PTSans.ttf)
}

html * {
  font-family:"PT Sans";
}

  .header{
    height: 145px;
    background-color: beige;
  }
  .main-block{
    padding: 0px 130px;
  }

  .title-name{
    margin-block-start:12px;
    margin-block-end: 12px;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
  }
  .work-block {
    display: flex;
    box-sizing: border-box;
    /* background-color: rgb(141, 149, 160); */
  }


</style>
