<template>
 <div class="container">
  <h1>Latest Post</h1>
  <hr>
    <div class="post-container">
      <div class = "post"
      v-for ="post in posts"
      v-bind:item = "post"
      v-bind:key="post.idgoods"
      >
      {{ `${post.name}` }}
        <p class = "text">{{post.manufacturer}}</p>
      </div>
    </div>
 </div>
</template>

<script>
import PostService from '@/PostService';

export default {
  name: 'PostComponent',
  data(){
    return{
    posts: []
    }
  },
  async created(){
    try{
      this.posts = await Promise.resolve(PostService.getPost())
    } catch(err){
      this.error = err.message;
    }
  }
}
</script>

<style scoped>
div.container { max-width: 800px; margin: 0 auto; }

p.error { border: 1px solid #ff5b5f; background-color: #ffc5c1; padding: 10px; margin-bottom: 15px; }

div.post { position: relative; border: 1px solid #5bd658; background-color: 3bcffb8; padding: 10px 10px 30px 10px; margin-bottom: 15px; }
</style>
