<template>
	<div>
		<!-- 公共Header -->
		<Header></Header>
		<div class="asugar-blog">
			<h2 style="text-align: center;">{{blog.title}}</h2>
			<el-link icon="el-icon-edit" v-if="hasLogin">
				<router-link :to="{name: 'BlogEdit',params: {blogId: blog.id}}">
					编辑
				</router-link>
			</el-link>
			<el-divider></el-divider>
			<div class="markdown-body" v-html="blog.content"></div>
		</div>
		
	</div>
</template>


<script>
	import Header from "../components/Header.vue"
	import "github-markdown-css"
	export default {
		name: "BlogDetail",
		components: {Header},
		data(){
			return {
				blog: {
					id: '',
					title: '暂无标题',
					content: '暂无内容'
				},
				hasLogin: false
			}
		},
		created() {
			const blogId = this.$route.params.blogId
			const _this = this
			this.$axios.get('/blog/'+blogId).then(res => {
				const blog = res.data.data
				_this.blog.id = blog.id
				_this.blog.title = blog.title
				var MardownIt = require("markdown-it")
				var md = new MardownIt()
				var content = md.render(blog.content)
				_this.blog.content = content
				_this.hasLogin = (blog.userId === _this.$store.getters.GET_UserInfo.id)
			})
		}
	}
</script>

<style>
	.asugar-blog{
		box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
		width: 100%;
		min-height: 700px;
		padding: 20px;
		margin-top: 50px;
	}
</style>
