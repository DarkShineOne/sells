<script lang="js" src="./CategoriesList.js">

</script>

<template>
  <div class="main_categ">
    <span class="title_categ" @click="this.collapsed = !this.collapsed" v-if="collapsed"><span
        class="categ_check_mark">&or;</span> Категория</span>
    <span class="title_categ" @click="this.collapsed = !this.collapsed" v-else><span
        class="categ_check_mark">&and;</span>Категория</span>
    <div class="categ_default" v-bind:class="{ categ_scroll: collapsed }">
      <label class="params_categ" v-for="elems in this.$store.getters.getCategories">
        <span class="params_a">
          <span><input type="checkbox" :checked="categoryActive(elems.id)"
              @click="selectCategory(elems.id); $emit('catFunc', elems.id)" /></span>
          <span>{{ elems.name }} <span class="count_coteg">({{ elems.count }})</span></span>
        </span>
      </label>
    </div>
  </div>
</template>

<style>
.main_categ {
  display: block;
  position: relative;
}

.categ_default {
  overflow: hidden;
  min-height: 250px;
}

.categ_scroll {
  overflow: scroll;
  height: 250px;
  scroll-behavior: smooth;
  overflow-x: hidden;
}

.categ_check_mark {
  margin-right: 10px;
  transform: scaleX(1.5) scaleY(0.8);
  font-weight: 5;
  color: #afafaf;
}

.title_categ {
  padding-top: 10px;
  margin: 5px 20px;
  display: flex;
  font-weight: 700;
  color: #4e4e4e;
  font-size: 16px;
  cursor: pointer;
}

.count_coteg {
  color: #a0a2a5;
}

.params_a {
  margin: 8px 20px;
  display: flex;
  vertical-align: center;
}

.params_a:hover {
  background-color: #fff7da;
}

.params_categ {
  cursor: pointer;
  display: flex;
  font-size: 14px;
}

.params_categ:hover {
  background-color: #fff7da;
}

.params_a input[type=checkbox] {
  width: 16px;
  height: 16px;
  margin: 1px 10px 2px 0px;
}
</style>