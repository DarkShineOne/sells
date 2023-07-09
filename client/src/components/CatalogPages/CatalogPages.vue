<script lang="js" src="./CatalogPages.js">
</script>

<template>
  <div class="catalog_pages">
    <pageNumber pageNum='<<' @selectPg="selectPage(1)" />
    <pageNumber pageNum='<' @selectPg="selectPage(this.$store.getters.getPage-1)" />
    <pageNumber v-for="i in slicePageArray(getMaxPage(this.$store.getters.getProductCount.count),this.$store.getters.getPage)" :pageNum='i' @selectPg="selectPage"/>
    <pageNumber pageNum='>' @selectPg="selectPage(this.$store.getters.getPage+1)" />
    <pageNumber pageNum='>>' @selectPg="selectPage(getMaxPage(this.$store.getters.getProductCount.count).pop())"/>
  </div>
</template>

<style>
.catalog_pages {
  margin-top: 12px;
  width: 848px;
  height: 48px;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.16);
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0 16px;
}
</style>