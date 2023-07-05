
<script lang="js" src="./App.js">
</script>

<template>
  <div class="main-block">
    <h1 class="title-name">
      Акции
    </h1>
    <div class="work-block">
      <Sidebar />
      <BodyCatalog />
    </div>
  </div>
</template>


<style>
@font-face {
  font-family: "PT Sans";
  src: local("PT Sans"),
    url(PTSans.ttf)
}

html * {
  font-family: "PT Sans";
}

.header {
  height: 145px;
  background-color: beige;
}

.main-block {
  padding: 0px 130px;
}

.title-name {
  margin-block-start: 12px;
  margin-block-end: 12px;
  margin-inline-start: 0px;
  margin-inline-end: 0px;
}

.work-block {
  display: flex;
  box-sizing: border-box;
  /* background-color: rgb(141, 149, 160); */
}
</style>
