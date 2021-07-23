import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
	userInfo: JSON.parse(sessionStorage.getItem("userInfo"))
  },
  mutations: {
	SET_UserInfo: (state,userInfo) => {
		state.userInfo = userInfo;
		sessionStorage.setItem("userInfo",JSON.stringify(userInfo));
	},
	REMOVE_UserInfo: (state) => {
		state.userInfo = {};
		sessionStorage.setItem("userInfo",JSON.stringify(''));
	}
  },
  getters: {
	GET_UserInfo: state =>{
		return state.userInfo;
	}
  },
  actions: {
  },
  modules: {
  }
})
