<script>
export default {
  props: {
    title: String,
    obj: Object,
  }
}
</script>

<template>
	<!-- ОН ЕЩЁ НЕ КОЛЛАПС, НО ОБЯЗАТЕЛЬНО БУДЕТ -->
	<div class="main_categ">
		<a class="title_categ">{{ title }}</a>
		<label class="params_categ" v-for="elems in obj">
			<a class="params_a">
				<!-- <a><input type="checkbox" @click="this.func(elems.id)" /></a> -->
        <a><input type="checkbox" @click="$emit('catFunc', elems.id)" /></a>
				<a>{{ elems.name }} <a class="count_coteg">({{ elems.count }})</a></a>
        
			</a>
		</label>
	</div>
</template>

<style>
  .main_categ{
    display: block;
    position: relative;
  }

  .title_categ{
    padding-top: 10px;
    margin: 5px 20px;
    display: flex;
    font-weight: 700;
    color: #4e4e4e;
    font-size: 16px;
  }

  .count_coteg{
    color: #a0a2a5;
  }

  .params_a{
    margin: 8px 20px;
    display: flex;
    vertical-align: center;
  }

  .params_a:hover{
    background-color: #fff7da;
  }

  .params_categ{
    cursor: pointer;
    display: flex;
    font-size: 14px;
  }

  .params_categ:hover{
    background-color: #fff7da;
  }

  .params_a input[type=checkbox] {
    width: 16px;
    height: 16px;
    margin: 1px 10px 2px 0px;
  }

</style>