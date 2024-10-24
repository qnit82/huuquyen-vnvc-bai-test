import Network from "../Network";

export default class BetApi {
    static async BetAsync(body:any) {
        let resp = await Network.PostAuthentication("/api/v1/bet/bet",body);
        return resp;
    }
}
