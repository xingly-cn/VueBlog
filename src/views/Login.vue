<template>
	<div>
		<el-container>
		  <el-header>
			  <img class="asugar-logo" src="https://www.x6d.com/static/images/headtxt.png">
		  </el-header>
		  <el-main>
			<el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="asugar-login">
			  <el-form-item label="账号" prop="username">
			    <el-input v-model="ruleForm.username"></el-input>
			  </el-form-item>
			  <el-form-item label="密码" prop="password">
			    <el-input type="password" v-model="ruleForm.password"></el-input>
			  </el-form-item>
			  <el-form-item label="邮箱" prop="email">
			    <el-input  v-model="ruleForm.email"></el-input>
			  </el-form-item>
			  <el-form-item>
			    <el-button type="primary" @click="submitForm('ruleForm')">立即创建</el-button>
			    <el-button @click="resetForm('ruleForm')">重置</el-button>
			  </el-form-item>
			</el-form>
			  
		  </el-main>
		</el-container>
	</div>
</template>

<script>
  export default {
	name: "Login",
    data() {
      return {
        ruleForm: {
          username: 'asugar',
          password: '123456',
		  email: "111@qq.com"
        },
        rules: {
          username: [
            { required: true, message: '请输入账号', trigger: 'blur' },
            { min: 6, max: 20, message: '长度在 6 到 20 个字符', trigger: 'blur' }
          ],
          password: [
            { required: true, message: '请输入密码', trigger: 'blur' },
            { min: 6, max: 20, message: '长度在 6 到 20 个字符', trigger: 'blur' }
          ]
        }
      };
    },
    methods: {
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
			
          if (valid) {
			const _this = this;
			this.$axios.post('/login',this.ruleForm).then(res => {
				const userInfo = res.data.data;
				_this.$store.commit("SET_UserInfo",userInfo);
				_this.$router.push('/blogs')
			})
          } else {
            console.log('提交失败！');
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    }
  }
</script>
<style>
  .el-header, .el-footer {
    /* background-color: #B3C0D1; */
    color: #333;
    text-align: center;
    line-height: 60px;
  }
  
  .el-aside {
    background-color: #D3DCE6;
    color: #333;
    text-align: center;
    line-height: 200px;
  }
  
  .el-main {
    /* background-color: #E9EEF3; */
    color: #333;
    text-align: center;
    line-height: 160px;
  }
  
  body > .el-container {
    margin-bottom: 40px;
  }
  
  .el-container:nth-child(5) .el-aside,
  .el-container:nth-child(6) .el-aside {
    line-height: 260px;
  }
  
  .el-container:nth-child(7) .el-aside {
    line-height: 320px;
  }
  
  .asugar-logo{
	/* height: 100%; */
	/* margin-top: 4px; */
  }
  
  .asugar-login{
	  max-width: 450px;
	  margin: 0 auto;
	  margin-top: 50px;
  }
</style>
