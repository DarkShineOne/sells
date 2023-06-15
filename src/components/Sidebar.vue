
<script>
export default{

}
</script>

<template>
      <div class="sidebar">
        <div class="sidebar_search sidebar_element">Тут будет поиск и будет он input</div>
        <div class="sidebar_consultant sidebar_element">Тут будет консультант</div>
        <div class="sidebar_parameters sidebar_element">
            Тут будут параметры<br>
            И тут будут будут параметры<br>
            И тут тоже будут параметры<br>
            Тут везде будут параметры
        </div>
        
        
        
        sidebar<br>1<br>2<br>3<br>4<br>5
      </div>
</template>

<style>
  .sidebar{
    margin-right: 20px;
    width: 278px;
    z-index: 10;
    /* background-color: rgb(255, 255, 255); */
    border-radius:8px
  }

  .sidebar_element{
    margin-top: 10px;
    margin-right: 20px;
    width: 278px;
    z-index: 10;
    background-color: rgb(85, 241, 71);
    border-radius:8px;
  }
  .sidebar_search{
    margin-top: 0px;
    height: 48px;
  }

  .sidebar_consultant{
    height:123px;
  }
</style>
