<template>
	<div class="asugar-blogs">
		<!-- 公共Header -->
		<Header></Header>
		<!-- 文章列表 -->
		<div class="block">
		  <el-timeline>
		    <el-timeline-item :timestamp="blog.created" placement="top" v-for="blog in blogs">
		      <el-card>
		        <h4>
				  <router-link :to="{name: 'BlogDetail',params: {blogId: blog.id}}">
					{{blog.title}}
				  </router-link>
				</h4>
		        <p>{{blog.description}}</p>
		      </el-card>
		    </el-timeline-item>
		  </el-timeline>
		</div>
		<!-- 分页 -->
		<el-pagination class="asugar-page"
		  background
		  layout="prev, pager, next"
		  :current-page="curPage"
		  :page-size="pageSize"
		  :total="total"
		  @current-change=page
		>
		</el-pagination>
	</div>
</template>

<script>
	import Header from "../components/Header.vue";
	export default {
		name: "Blogs",
		components: {Header},
		data() {
			return {
				blogs: {},
				curPage: 1,
				total: 0,
				pageSize: 5
			}
		},
		methods: {
			page(curPage){
				const _this = this;
				_this.$axios.get("/blogs?curPage="+curPage).then(res => {
					_this.blogs = res.data.data.records
					_this.curPage = res.data.data.current
					_this.total = res.data.data.total
					_this.pageSize = res.data.data.size
				})
			}
		},
		created(){
			this.page(1)
		}
	}
</script>

<style>
	.asugar-page{
		margin: 0 auto;
		text-align: center;
	}

</style>
