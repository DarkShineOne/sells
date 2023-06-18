
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
    background-color:#fff;
    border-radius:8px;
    box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.1);
  }
  .sidebar_search{
    margin-top: 0px;
    height: 48px;
  }

  .sidebar_consultant{
    height:123px;
  }
</style>
