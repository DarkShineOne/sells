/* eslint-disable no-unused-vars */
import axios from "axios";

const urlCategory = 'http://localhost:5000/api/category'
const url = 'http://'+document.URL.substr(7).substr(0,document.URL.substr(7).indexOf(":"))+':5000/api/item'



class PostService{
    static getPost(d){
        // eslint-disable-next-line no-async-promise-executor
        return new Promise(async (resolve, reject) => {
            try {
                let res = await axios.get(url+`${d}`,)
                let data = res.data
                resolve(
                    data
                )
            } catch(err) {
                reject(err);
            }
        })
    }

    static getCategory(){
        return new Promise(async (resolve, reject) => {
            try {
                let res = await axios.get(urlCategory)
                let data = res.data
                resolve(
                    data
                )
            } catch(err) {
                reject(err);
            }
        })
    }
}

export default PostService;