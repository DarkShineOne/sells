/* eslint-disable no-unused-vars */
import axios from "axios";

const urlSubCat = 'http://' + document.URL.substr(7).substr(0, document.URL.substr(7).indexOf(":")) + ':5000/api/subcategory'
const urlCategory = 'http://' + document.URL.substr(7).substr(0, document.URL.substr(7).indexOf(":")) + ':5000/api/category'
const url = 'http://' + document.URL.substr(7).substr(0, document.URL.substr(7).indexOf(":")) + ':5000/api/item'



class PostService {
    static getPost(d) {
        // eslint-disable-next-line no-async-promise-executor
        return new Promise(async (resolve, reject) => {
            try {
                let res = await axios.get(url + `${d}`,)
                let data = res.data
                resolve(
                    data
                )
            } catch (err) {
                reject(err);
            }
        })
    }

    static getCategory(d) {
        return new Promise(async (resolve, reject) => {
            try {
                let res = await axios.get(urlCategory + `${d}`)
                let data = res.data
                resolve(
                    data
                )
            } catch (err) {
                reject(err);
            }
        })
    }

    static getSubCat(d) {
        return new Promise(async (resolve, reject) => {
            try {
                let res = await axios.get(urlSubCat + `${d}`)
                let data = res.data
                resolve(
                    data
                )
            } catch (err) {
                reject(err);
            }
        })
    }
}

export default PostService;