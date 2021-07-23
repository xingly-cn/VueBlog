<template>
	<div>
		<!-- 公共Header -->
		<Header></Header>
		<div class="asugar-content">
			<el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
			  
			  <el-form-item label="标题" prop="title">
			    <el-input v-model="ruleForm.title"></el-input>
			  </el-form-item>
			  
			  <el-form-item label="摘要" prop="description">
			      <el-input type="textarea" v-model="ruleForm.description"></el-input>
			  </el-form-item>
			  
			  <el-form-item label="内容" prop="content">
				<mavon-editor v-model="ruleForm.content"></mavon-editor>
			  </el-form-item>

			  <el-form-item>
			    <el-button type="primary" @click="submitForm('ruleForm')">发布</el-button>
			    <el-button @click="resetForm('ruleForm')">重置</el-button>
			  </el-form-item>
			  
			</el-form>
			
		</div>
	</div>
</template>

<script>
  import Header from "../components/Header.vue"
  export default {
	name: "BlogEdit",
	components: {Header},
    data() {
      return {
        ruleForm: {
	      id: '',
          title: '',
          description: '',
		  content: ''
        },
		newFrom: {
			title: '',
			description: '',
			content: ''
		},
        rules: {
          title: [
            { required: true, message: '请输入标题', trigger: 'blur' },
            { min: 1, max: 30, message: '标题长度为1~30', trigger: 'blur' }
          ],
          description: [
            { required: true, message: '请输入摘要', trigger: 'blur' }
          ],
          content: [
            { required: true, message: '请输入内容', trigger: 'blur' }
          ]
        }
      };
    },
    methods: {
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            const _this = this
			this.newFrom.title = this.ruleForm.title
			this.newFrom.description = this.ruleForm.description
			this.newFrom.content = this.ruleForm.content
			var data = this.ruleForm
			if(!this.ruleForm.id) data = this.newFrom
			this.$axios.post('/blog/edit',data).then(res => {
				_this.$alert('操作成功', '提示', {
					confirmButtonText: '确定',
					callback: action => {
						if(_this.ruleForm.id) _this.$router.push("/blog/"+_this.ruleForm.id)
						else _this.$router.push("/blogs")
					}
				});
			})
          } else {
            console.log('提交失败!');
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    },
	created() {
		const blogId = this.$route.params.blogId
		const _this = this
		if(blogId){
			this.$axios.get('/blog/'+blogId).then(res => {
				const blog = res.data.data
				_this.ruleForm.id = blog.id
				_this.ruleForm.title = blog.title,
				_this.ruleForm.description = blog.description,
				_this.ruleForm.content = blog.content
			})
		}
	}
  }
</script>

<style>
	.asugar-content{
		text-align: center;
	}
</style>
