<template>
  <div class="container">

    <div style="width: 50%; display: flex;background-color:rgba(248,248,248,0.95); border-radius: 10px;">
      <div style="width: 50%; border-radius: 10px;" >
        <img src="../assets/二手交易.png" width="100%" height="100%" style="overflow: hidden;box-sizing: border-box; border-right: #eee solid 1px;padding: 50px">
      </div>

      <div style="flex: 1;width: 50%;padding: 40px;display: flex;flex-direction: column;justify-content: center;" >
        <div style="text-align: center; font-size: 24px; margin-bottom: 30px; color: #333">二手交易平台-后台登录</div>
        <el-form :model="loginForm" :rules="rules" ref="loginForm" >
          <el-form-item  label="用户名" prop="username">
            <el-input v-model="loginForm.username"></el-input>
          </el-form-item>
          <el-form-item  label="密码" prop="password">
            <el-input v-model="loginForm.password"></el-input>
          </el-form-item>
          <el-form-item >
            <el-button type="primary" @click="submitForm('loginForm')">登录</el-button>
            <el-button @click="resetForm('loginForm')">重置</el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>


  </div>
</template>

<script>
  import moment from "moment";
  export default {
    data() {
      return {
        loginForm: {
          username: '',
          password: '',
        },
        rules: {
          username: [{
              required: true,
              message: '请输入用户名',
              trigger: 'blur'
            },
            {
              min: 1,
              max: 8,
              message: '长度在 3 到 8 个字符',
              trigger: 'blur'
            }
          ],
          password: [{
            required: true,
            message: '请输入密码',
            trigger: 'change'
          }]
        }
      }
    },
    created() {
      if(this.$route.params.id == 1){
        this.$store.commit('userInfo','');
        history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function(e) {
            history.pushState(null, null, document.URL);
        });
      }
    },
    methods: {
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            this.$axios.post('/Badmin/selectAdminByUser',{
              username: this.loginForm.username,
              password: this.loginForm.password
            }).then(res => {
              if(res.data.length != 0){
                //存储用户信息
                this.$store.commit('userInfo',res.data);
                this.$message({
                  type: 'success',
                  message: '登录成功！'
                });

                //修改管理员身份信息
                this.$axios.post('/Badmin/updateAdminById',{
                  id:this.$store.state.userInfo.id,
                  logintime: moment().format('YYYY-MM-DD HH:mm:ss'),
                  status:1
                });

                this.$router.push('/index');
                location.reload(true);
                // this.$router.go(0);
              }else{
                this.$message({
                  type: 'warning',
                  message: '用户名或密码出错，请重新输入！'
                });
              }
            })
          } else {
            this.$message({
              type: 'warning',
              message: '请完善登录信息！'
            });
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      },
    }

  }
</script>

<style>
.container {
  height: 100vh;
  overflow: hidden;
  background-image: url("../assets/bk.jpg");
  background-size: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #666;
}
  .Logincontainer{
    display: flex;
    height: 100%;
    background-size: 100%;
    background-image: url(../../static/images/bg.jpg);
  }
  .loginContainer{
    padding-top: 20px;
    width: 500px;
    height: 300px;
    margin: auto;
    border-radius: 5px;
    background-color: rgba(255,255,255,0.7);
  }
  .loginContainer p{
    font-size: 20px;
    font-weight: 800;
    margin: 20px;
    margin-bottom: 40px;
    text-align-last: center;
  }
  .login{
    padding-right: 80px;
    padding-left: 20px;
    text-align: center;
  }
  .login .el-button{
    margin-right: 30px;
    width: 100px;
    margin-top: 20px;
  }
</style>
