import axios from 'axios'

class AuthService {
  get(){ return this.user }
  set(user){ this.user = user }
  login(user){
    return axios.post('/api/session', user).then((res)=>{
      const user = res.data
      this.set(user)
      return user
    })
  }
  check(){
    return axios.get('/api/session').then((res)=>{
      const user = res.data
      this.set(user)
      return user
    })
  }
  logout(){
    return axios.delete('/api/session').then((res)=>{
      this.set(null)
      return
    }).catch((err)=>{
      console.log(err)
    })
  }
}

module.exports = new AuthService()
