<script>
export default {
    props: {
        pageNum: ""
    }
}
</script>


<template>
    <div class="pageSelector" v-bind:class="{ PageSelected: pageNum == this.$store.getters.getPage }"
        @click="$emit('selectPg', pageNum)">
        {{ pageNum }}
    </div>
</template>


<style>
.pageSelector {
    width: 45px;
    height: 48px;
    font-size: 16px;
    font-weight: 700;
    color: #8c8c8c;
    display: flex;
    justify-content: center;
    align-items: center;
    border: 3px solid transparent;
    box-sizing: border-box;
    cursor: pointer;
}

.pageSelector:hover {
    color: #FC8507;
    background-color: #FFF7DA;
}

.PageSelected {
    border-bottom: 3px solid #fc8507;
}
</style>