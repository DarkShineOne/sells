
<script>
export default{
  methods:{
    
  }

}
</script>

<template>
      <div class="sidebar">
        <div class="side_test">
        <div class="sidebar_search sidebar_element"><input class="search_element" placeholder="Поиск"></div>
        <div class="sidebar_parameters sidebar_element">
            Тут будут параметры но сперва категории<br>
            И тут будут будут параметры<br>
            Но сперва их нужно получить из БД<br>
            
        </div>
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

  .side_test{
    position: sticky;
    position: -webkit-sticky;
    top:12px;
    bottom: 25px;
    
  }

  .sidebar_element{
    margin-top: 10px;
    margin-right: 20px;
    width: 278px;
    z-index: 10;
    background-color:#fff;
    border-radius:8px;
    box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.16);
    display: flex;
    align-items: center;
  }
  .sidebar_search{
    margin-top: 0px;
    height: 48px;
    
  }


  .search_element{
    background: #f2f2f2;
    border: none;
    border-radius: 8px;
    color: #333;
    height: 34px;
    outline: none;
    padding: 0 80px 0 12px;
    transition: background .3s;
    width:156;
    margin-left: auto;
    margin-right: auto;
  }
</style>
