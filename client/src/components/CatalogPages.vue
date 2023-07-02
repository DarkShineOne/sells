<script lang="js" src="@/components/CatalogPages.js">

</script>

<template>
	<div class="catalog_pages">
		<button class="buttons" @click="pageDown()" :disabled="this.$store.getters.getPage == 1">
			PREV
		</button>
		ПРОДУКТОВ:{{ this.$store.getters.getProductCount.count}}
		<button class="buttons" :style="{'margin-left': 'auto', 'margin-right': '0em'}" @click=" pageUp()" :disabled="this.$store.getters.getPage == getMaxPage()">
			NEXT
		</button>
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