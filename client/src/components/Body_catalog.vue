<script>
import Bilet from "@/components/Bilet"
import BiletObj from "@/components/BiletObj"
import CatalogPages from "@/components/CatalogPages"
export default{
  components:{
        Bilet,BiletObj,CatalogPages
    },
  data(){
    return{
    }
  },
  created(){
    this.$store.commit('loadPage',1)

  }
  // methods:{
  //   async loadpage(n){
  //     location.href="#"
  //     this.$store.commit('loadPage',n)
  //   }
  //}
    //!!!!СДЕЛАТЬ МЕТОД ДЛЯ СОЗДАНИЯ BILET и сунуть его в V-FOR!!!!
}
</script>

<template>
      <div class="body-catalog">
      <div class="catalog_sort">
        <div>
          Сортировка: 
          <select class="catalog_select">
            <option>Сначала недорогие</option>
            <option>Сначала дорогие</option>
            <option>Сначала популярные</option>
            <option>По скидке(%)</option>
            <option>Сначала обсуждаемые</option>
            <option>Сначала с лучшей оценкой</option>
          </select>
        </div>
        <div style="margin-left:40px">
          Группировка: 
          <select class="catalog_select" >
            <option>Отсутсвует</option>
            <option>По производителю</option>
            <option>По наличию</option>
            <option>По категории</option>
          </select>
        </div>
      </div>


      <CatalogPages/>
      <div v-for="prdct in this.$store.state.products">
        <BiletObj 
        :product = "prdct"
        />
        
      </div>
      <CatalogPages/>
    </div>
</template>

<style>
.body-catalog{
    /* background-color: rgb(243, 91, 91); */
    width: 100%;
  }


  .catalog_sort{
    width: 848px;
    height: 48px;
    background-color:#fff;
    border-radius:8px;
    box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.16);
    display: flex;
    align-items: center;
    padding: 0 16px;
  }

  .catalog_select{
    border-width: 0px;
    color:#0d61af;
    transition: all 0.5s ease;
    
  }

  .catalog_select:hover {
    color: #8e0b0b;
}
</style>