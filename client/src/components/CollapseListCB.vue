<script>

export default{
  props: {
    title: String,
    params: Object,
    func:Function
    },
  data(){
    return{
      state:0
    }
  },
  methods:{
  }

}
</script>

<template>
    <div class="main_collapse">
        <a class="title_collapse">{{ title }}</a>
       <label class="params_collapse"  v-for="cats in this.$store.state.categories">
            <!-- <a class="params_a"> <input type="checkbox" @click="this.func(cats.id)"> id = {{ cats.id }}, name = {{ cats.name }}</a> -->
             <a class="params_a"> <a><input type="checkbox" @click="this.func(cats.id)"></a><a>{{ cats.name }}</a></a>
        </label>
            
            
    </div>
</template>

<style>
  .main_collapse{
    display: block;
    position: relative;
  }

  .title_collapse{
    padding-top: 10px;
    margin: 5px 20px;
    display: flex;
    font-weight: 700;
    color: #4e4e4e;
    font-size: 16px;
    
  }
  .params_a{
    margin: 8px 20px;
    display: flex;
    vertical-align: center;
  }
  .params_a:hover{
    background-color: #fff7da;
  }
  .params_collapse{
    cursor: pointer;
    display: flex;
    font-size: 14px;
    
  }

  .params_collapse:hover{
    background-color: #fff7da;
  }

  .params_a input[type=checkbox] {
    width: 16px;
    height: 16px;
    margin: 1px 10px 2px 0px;
  }


</style>