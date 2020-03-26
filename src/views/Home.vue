<template>
  <div class="home">
    <div id="nav">
      <router-link to="/">Home</router-link>|
      <router-link to="/about">About</router-link>
    </div>
    <div @click='handleTest'>测试</div>
    <img alt="Vue logo" src="../assets/logo.png">
    <HelloWorld msg="Welcome to Your Vue.js App"/>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from '@/components/HelloWorld.vue'
import { getIndex } from 'api/index'
import { Toast } from 'mint-ui'
export default {
  name: 'home',
  components: {
    HelloWorld
  },
  async created () {
    try {
      await getIndex({ pageSiza: 100, num: 10 })
    } catch (err) {
      Toast({
        message: '这里是home页面的error提示',
        position: 'bottom',
        duration: 2000
      })
    }
  },
  methods: {
    async handleTest () {
      try {
        await getIndex({ pageSiza: 100, num: 10 })
      } catch (err) {
        Toast({
          message: err,
          position: 'bottom',
          duration: 7000
        })
      }
    }
  }
}
</script>
