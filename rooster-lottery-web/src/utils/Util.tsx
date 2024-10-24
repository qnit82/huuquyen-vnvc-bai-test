export default class Util {
    static coreApi: string = "http://localhost:5217";

    static getUserInfo() {
        const userInfo = localStorage.getItem('user');
        return userInfo ? JSON.parse(userInfo) : null;
    }

}