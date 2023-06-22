<script>
import Bilet from "@/components/Bilet"
import BiletObj from "@/components/BiletObj"
import PostService from "@/PostService"
export default{
  components:{
        Bilet,BiletObj
    },
  data(){
    return{
      products:[]
    }
  },
  async created(){
    try{
      this.products = await Promise.resolve(PostService.getPost(6))
    } catch(err){
      console.log("error")
    }
  }
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
    
      <div v-for="prdct in products">
        

        <BiletObj 
        :product = "prdct"
        />
      </div>
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
