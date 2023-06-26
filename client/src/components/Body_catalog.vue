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
      selectedSort:'Сначала недорогие',
      selectedGroup:String,
      picked:String
    }
  },

  created(){
    this.$store.commit('loadPage',1)

  },

  methods:{
    logSort(){
      console.log("Sorted by:"+this.selectedSort)
      document.getElementsByClassName("testkal")[0].style.visibility="hidden"
    },
    logGroup(){
      console.log("Group by:"+this.selectedGroup)
    },
    showSort(){
      if(document.getElementsByClassName("testkal")[0].style.visibility == "")
        document.getElementsByClassName("testkal")[0].style.visibility="hidden"
      else document.getElementsByClassName("testkal")[0].style.visibility=""
    }
  }
 
}
</script>

<template>
      <div class="body-catalog">
      <div class="catalog_sort">
        <div style="width: 250px;">
          Сортировка: 
          <span  class="catalog_select" @click="showSort">{{ selectedSort }}</span>
        </div>
        <div class="sort_group" style="margin-left:40px">
          Группировка: 
          <select class="catalog_select"  v-model="selectedGroup" required @change="logGroup" >
            <option :selected="true" value="out">Отсутсвует</option>
            <option value="proizv">По производителю</option>
            <option value="nal">По наличию</option>
            <option value="cat">По категории</option>
          </select>
        </div>
        <div class="testkal" style="visibility: hidden;">
          <label class="testkal_label"><input type="radio" value="Сначала недорогие" v-model="selectedSort" required @change="logSort"/>Сначала недорогие</label>
          <label class="testkal_label"><input type="radio" value="Сначала дорогие" v-model="selectedSort" required @change="logSort"/>Сначала дорогие</label>
          <label class="testkal_label"><input type="radio" value="Сначала популярные" v-model="selectedSort" required @change="logSort"/>Сначала популярные</label>
          <label class="testkal_label"><input type="radio" value="По скидке(%)" v-model="selectedSort" required @change="logSort"/>По скидке(%)</label>
          <label class="testkal_label"><input type="radio" value="Сначала обсуждаемые" v-model="selectedSort" required @change="logSort"/>Сначала обсуждаемые</label>
          <label class="testkal_label"><input type="radio" value="Сначала с лучшей оценкой" v-model="selectedSort" required @change="logSort"/>Сначала с лучшей оценкой</label>

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

  .sort_group{
    display: flex;
  }
  .testkal{
    background-color:#fff;
    font-size: 16px;
    border-radius:8px;
    border: 1px solid rgba(0,0,0,.08);
    box-shadow: 0px 8px 12px rgba(0, 0, 0, 0.16);
    position: relative;
    height: fit-content;;
    width: 298px;
    top: 125px;
    left: -495px;
     
  }
  
  .testkal_label{
    display: flex;
    cursor: pointer;
    vertical-align: center;
    padding: 8px 16px;
    
  }

  .testkal_label input[type=radio] {
    width: 16px;
    height: 16px;
    margin: 3px 10px 2px 0px;
    
    /*COLOR NADA*/
  }

  /* .testkal_label input[type=radio]:active{
    border: 5px solid #fc8507;
  } */
  
  .testkal_label:hover{
    background-color: #fff7da;
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
    font-size: 14px;
  }

  .catalog_select{
    cursor: pointer;
    width: 21;
    height: 224;
    border-width: 0px;
    color:#0d61af;
    transition: all 0.5s ease;
    
  }

  .catalog_select:hover {
    color: #fc5808;;
    
}
</style>