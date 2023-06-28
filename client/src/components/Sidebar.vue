
<script>
import CollapseListCB from "@/components/CollapseListCB"
export default{
  components:{
      CollapseListCB
    },
  methods:{
    addCategory(id){
      this.$store.commit('addCategory',id)
      console.log(id)
      this.$store.commit('loadPage')
    }
  }

}
</script>

<template>
      <div class="sidebar">
        <div class="side_test">
        <div class="sidebar_search sidebar_element"><input class="search_element" placeholder="Поиск(не работает)"></div>
        <CollapseListCB class="sidebar_element" title="Категории" :func="addCategory"/>
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
    align-items: center;
  }

  .sidebar_search{
    margin-top: 0px;
    height: 48px;
    display: flex;
    
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
