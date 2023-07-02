<script lang="js" src="@/components/Body_catalog.js">

</script>

<template>
	<div class="body-catalog">
		<!--
    ВЫНЕСТИ В ОТДЕЛЬНЫЙ VUE ФАЙЛ 
    -->
		<div class="catalog_sort">
			<div>
				Сортировка:
				<span class="catalog_select" @click="showSort_label">
					{{ selectedName[selectedSort] }}
				</span>
			</div>
			<div class="sort_changer" v-if="!hideSort">
				<label class="sort_label" v-for="sort_elem in selectedName">
					<label class="sort_label">
						<input type="radio" :value="selectedName.indexOf(sort_elem)" v-model="selectedSort" required @change="loadPageWithSort" />
						{{ sort_elem }}
					</label>
				</label>
			</div>
		</div>
		<CatalogPages />
		<div v-for="prdct in this.$store.state.products">
			<BiletObj :product="prdct" />
		</div>
		<CatalogPages />
	</div>
</template>



<style>
.body-catalog{
    /* background-color: rgb(243, 91, 91); */
    
    width: 100%;
  }

  .sort_changer{
    background-color:#fff;
    font-size: 16px;
    border-radius:8px;
    border: 1px solid rgba(0,0,0,.08);
    box-shadow: 0px 8px 12px rgba(0, 0, 0, 0.16);
    position: relative;
    height: fit-content;;
    width: 298px;
    top: 150px;
    left: -205px;
     
  }
  
  .sort_label{
    display: flex;
    cursor: pointer;
    vertical-align: center;
    padding: 8px 16px;
    
  }

  .sort_label input[type=radio] {
    width: 16px;
    height: 16px;
    margin: 3px 10px 2px 0px;
    
    /*COLOR NADA*/
  }

  /* .sort_label input[type=radio]:active{
    border: 5px solid #fc8507;
  } */
  
  .sort_label:hover{
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