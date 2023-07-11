
<script lang="js" src="./Sidebar.js">
</script>

<template>
  <div class="sidebar">
    <div class="side_sticky">
      <form class="sidebar_search sidebar_element" @submit.prevent>
        <input @change="findCategory" v-model="findText" class="search_element" placeholder="Поиск" />
      </form>
      <CategoriesList class="sidebar_element_cat" @catFunc="subCatDraw" />

      <SubCatList v-if="this.subcatAvaible" v-for="(SubCatOb,index) in this.$store.getters.getSubCats" class="sidebar_element_cat"
        :SubCatObj="[SubCatOb,index]" @subCatFunc="subCatSelect" />
    </div>
  </div>
</template>

<style>
.sidebar {
  margin-right: 20px;
  width: 278px;
  border-radius: 8px;
}

.side_sticky {
  position: -webkit-sticky;
  position: sticky;
  top: 12px;
  bottom: 25px;
  max-height: 95vh;
  overflow-y: auto;
  overflow-x: hidden;
}

.side_sticky::-webkit-scrollbar {
  display: none;
}

.sidebar_element {
  margin-top: 10px;
  margin-right: 20px;
  width: 278px;
  z-index: 10;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.16);
  align-items: center;
}

.sidebar_element_cat {
  margin-top: 10px;
  margin-right: 20px;
  width: 278px;
  z-index: 10;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.16);
  align-items: center;


}

.sidebar_search {
  margin-top: 0px;
  height: 48px;
  display: flex;

}

.search_element {
  background: #f2f2f2;
  border: none;
  border-radius: 8px;
  color: #333;
  height: 34px;
  outline: none;
  padding: 0 80px 0 12px;
  transition: background .3s;
  width: 156px;
  margin-left: auto;
  margin-right: auto;
}
</style>
