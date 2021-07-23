<template>
	<div class="asugar-header">
		<h1>欢迎来到Augar的博客</h1>
		<div class="block">
			<el-avatar :size="50" :src="user.avatar"></el-avatar>
			<div>{{user.username}}</div>
		</div>
		
		<div class="asugar-route">
		    <span><el-link href="/blogs">主页</el-link></span>
		    <el-divider direction="vertical"></el-divider>
		    <span><el-link type="success" href="/blog/add">发表文章</el-link></span>
			<el-divider direction="vertical"></el-divider>
			<span v-show="!hasLogin"><el-link type="warning" href="/login">登陆</el-link></span>
		    <span v-show="hasLogin"><el-link type="danger" @click="logout">退出</el-link></span>
		  </div>
	</div>
</template>

<script>
	export default {
		name: "Header",
		data() {
			return {
				user: {
					username: '请先登录',
					avatar: 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'
				},
				hasLogin: false
			}
		},
		methods: {
			logout(){
				const _this = this
				_this.$axios.get('/logout').then(res => {
					_this.$store.commit("REMOVE_UserInfo")
					_this.$router.push("/login")
				})
			}
		},
		created(){
			// 自动从会话缓存中更新数据
			if(this.$store.getters.GET_UserInfo.username){
				this.user.username = this.$store.getters.GET_UserInfo.username
				this.user.avatar = this.$store.getters.GET_UserInfo.avatar
				this.hasLogin = true
			}
		}
	}
</script>

<style>
	.asugar-header{
		max-width: 960px;
		margin: 0 auto;
		text-align: center;
	}
	
	.asugar-route{
		margin: 10px 0;
	}
</style>
