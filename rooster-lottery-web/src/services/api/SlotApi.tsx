import Network from "../Network";

export default class SlotApi {
    static async GetSlotsForDayAsync(params?:any) {
        let resp = await Network.GetAuthentication("/api/v1/slot/slots",params);
        return resp;
    }

    static async GetSlotBetUserAsync(params?:any) {
        let resp = await Network.GetAuthentication("/api/v1/slot/user-slot-bets",params);
        return resp;
    }
}
