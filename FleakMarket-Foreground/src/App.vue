<template>
  <div id="app">
    <HeaderTop></HeaderTop>
    <main class="route-view">
      <router-view v-if="isRouterAlive" />
    </main>
  </div>
</template>

<script>
import moment from "moment";
import HeaderTop from "./components/Header.vue";
export default {
  name: 'App',
  components: {
    HeaderTop
  },
  provide () {
    return {
      reload: this.reload
    }
  },
  data () {
    return {
      isRouterAlive: true
    }
  },
  created () {
    //在页面加载时读取sessionStorage里的状态信息
    if (sessionStorage.getItem("store") ) {
      this.$store.replaceState(Object.assign({}, this.$store.state,JSON.parse(sessionStorage.getItem("store"))))
    }

    //在页面刷新时将vuex里的信息保存到sessionStorage里
    window.addEventListener("beforeunload",()=>{
      sessionStorage.setItem("store",JSON.stringify(this.$store.state))
    });
    
    
  },
  methods: {
    reload () {
      this.isRouterAlive = false
      this.$nextTick(function () {
        this.isRouterAlive = true
      })
    }
  }
}
</script>

<style>
html,
body,
#app {
  margin: 0;
  padding: 0;
  height: 100%;
}
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.route-view {
  min-height: calc(100vh - 30px);
  padding-top: 30px;
  box-sizing: border-box;
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}

img{
  width: 100%;
  height: 100%;
}
a {
  color: #000000;
  text-decoration: none;
}
input,
button {
  border: 0;
  outline: none;
}
</style>
