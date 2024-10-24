import Network from "../Network";

export default class UserApi {
    static async getUserInfoAsync() {
        let resp = await Network.GetAuthentication("/api/v1/user/info");
        return resp;
    }

    static async getUserAsync(params: any) {
        let resp = await Network.GetAnonymous("/api/v1/user", params);
        return resp;
    }

    static async getUserByIdAsync(params: any) {
        let resp = await Network.GetAnonymous("/api/v1/user/id", params);
        return resp;
    }

    static async getByPhoneNumberAsync(params: any) {
        let resp = await Network.GetAnonymous("/api/v1/user/phone-number", params);
        return resp;
    }

    static async addAsync(body: any): Promise<any> {
        let resp = await Network.PostAnonymous("/api/v1/user/register", body);
        return resp;
    }
}
