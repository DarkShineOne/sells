/* eslint-disable no-unused-vars */
import axios from "axios";

const url = 'http://localhost:5000/api/item'

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
    // delete 
    // create?
}

export default PostService;