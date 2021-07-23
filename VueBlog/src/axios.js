import axios from 'axios';
import Element from 'element-ui'

axios.defaults.baseURL = "http://175.27.243.243:8081"

// 前置拦截
axios.interceptors.request.use(config =>{
	return config;
})

// 后置拦截
axios.interceptors.response.use(
  response => {
	if(response.data.code === 200){
		return response
	}else{
		Element.Message.error(response.data.msg);
		return Promise.reject(response.data.msg);
	}
  }
)