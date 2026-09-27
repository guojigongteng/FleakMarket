<template>
  <div class="Footer">
     <el-row class="row-info">
         <el-col :span="4" :offset="4" style="border: 0;"><span @click="message('联系我们','sdut.edu.cn')">联系我们</span></el-col>
         <el-col :span="4"><span @click="message('关于网站','二手交易市场是一个服务于全体师生的二手商品交易平台站。')">关于网站</span></el-col>
         <el-col :span="4"><span @click="message('隐私声明','本站承诺不会主动泄露任何个人隐私')">隐私声明</span></el-col>
         <el-col :span="4"><span @click="message('意见反馈','山东理工大学计科2101')">意见反馈</span></el-col>
     </el-row>
      <el-row>
        <el-col style="border-bottom: 1px solid #E7E7E7;" :span="16" :offset="4"></el-col>
      </el-row>


     <el-row class="copyright">
       <el-col>Copyright © sdut.edu.cn</el-col>
     </el-row>
  </div>
</template>

<script>
  export default {
    data() {
      return {

      }
    },
    created() {

    },
    methods:{
      message(title,message){
        this.$notify({
          title: title,
          message: message,
          position: 'bottom-right'
        });
      }
    }
  }

</script>

<style scoped="scoped">

  ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
  }

  .Footer{
    width: 100%;
    padding: 0;
    bottom: 0;
    position: relative;
    background-color: #FCFCFC;
    border-top: 1px solid #E5E9EF;
  }
  .row-info{
    padding: 30px 0;
    color: #616161;
    text-align-last: center;
  }
  .row-info div{
    border-left: 1px solid #E0E0E0;
  }
  .row-info span{
    transition: color 0.1s;
  }
  .row-info span:hover{
    color: #FF8800;
    cursor: pointer;
  }
  .qrcode{
    text-align-last: center;
    padding: 40px 0;
    padding-bottom: 15px;
    color: #555555;
  }
  .qrcode img{
    height: 150px;
  }
  .phone{
    margin-top: 50px;
    color: #FF6700;
    height: 120px;
    text-align-last: center;
    padding-top: 20px;
    border-left: 1px solid #E0E0E0;
  }
  .phone p{
    font-size: 22px;
    line-height: 5px;
  }
  .phone span{
    font-size: 12px;
    color: #666666;
    line-height: 0;
  }

  .Friendshiplink{
    text-align-last: center;
    color: #666666;
  }
  .Friendshiplink ul{
    margin-top: 40px;
    line-height: 70px;
    height: 150px;
  }
  .Friendshiplink li a{
    color: #666666;
    line-height: 40px;
    width: 40px;
    text-decoration: none;
    transition: color 0.1s;
  }
  .Friendshiplink li a img{
    width: 23%;
    margin: 13px 20px;
  }

  .copyright{
    padding: 7px 0;
    color: #666666;
    font-size: 12px;
    text-align-last: center;
    background-color: #FCFCFC;
  }
</style>
