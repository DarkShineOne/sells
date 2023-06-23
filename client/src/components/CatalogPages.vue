<script>

export default{
  methods:{
    async loadpage(n){
      location.href="#"
      this.$store.commit('loadPage',n)
    }
  }
}

</script>


<template>

<div class="catalog_pages">
    <button class="buttons" @click=" this.$store.commit('decrimentPage');loadpage(this.$store.state.page)" :disabled="this.$store.state.page == 1">PREV</button>
    ТУТ БУДУТ ЦИФРЫ СТРАНИЦ, НО ПОКА ИХ НЕТ
    <button class="buttons" :style="{'margin-left': 'auto', 'margin-right': '0em'}" @click=" this.$store.commit('incrementPage');loadpage(this.$store.state.page)">NEXT</button>
</div>

</template>


<style>

.catalog_pages{
    margin-top: 12px;
    width: 848px;
    height: 48px;
    background-color:#fff;
    border-radius:8px;
    box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.16);
    display: flex;
    align-items: center;
    padding: 0 16px;
  }
</style>