
import { connect } from "react-redux";

function errorMessage(message) {
    if ("Network request failed" == message) {
        return "网络异常,请稍后尝试!"
    } else if (message && message != " ") {
        return message;
    } else {
        return "网络异常,请稍后尝试!"
    }
}

class UserBusiness {
    status = {
        success: 0,//成功状态码,
        failed: 99,//错误状态码,
    }

     
   
    /**
     * @param {*} phoneNumber 手机号码
     * @param {*} code   验证码类型
     * @memberof 获取验证码
     */
    getSecurityCode = (phoneNumber, code, resolve) => {

        this.dispatch(getMobilecode(phoneNumber, code)).then((res) => {
            const obiect = res.data || {};
            console.log('获取验证码=', obiect);
            if (obiect.status == 0) {
                resolve({ status: this.status.success, data: { message: "验证码发送成功" } });
            } else {
                resolve({ status: this.status.failed, data: { message: errorMessage(obiect.message) } });
            }
        }).catch((error) => {
            resolve({ status: this.status.failed, data: { message: "网络异常,请稍后尝试!" } });

        });
    } 

} 

export default connect(new UserBusiness())