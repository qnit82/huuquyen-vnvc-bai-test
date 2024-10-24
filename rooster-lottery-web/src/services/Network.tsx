import { BaseApiResponse } from "@/types/BaseApiResponse";
import Util from "@/utils/Util";
import { notification } from "antd";

export default class Network {
    static async AppNetwork(path: string) {
        try {
            let response = await fetch(`${Util.coreApi}${path}`, {
                headers: {
                    "Content-type": "application/json",
                },
            });

            if (response.ok) {
                if (response.status === 200) {
                    return true;
                }

                return false;
            } else {
                return false;
            }
        } catch (error) {
            return false;
        }
    }

    static async GetAnonymous(path: string, params?: any): Promise<any> {
        let urlParams = "";
        if (params) {
            var str = Object.keys(params)
                .map(function (key) {
                    return key + "=" + params[key];
                })
                .join("&");
            urlParams = "?" + str;
        }

        try {
            let response = await fetch(`${Util.coreApi}${path}${urlParams}`, {
                method: "GET",
                headers: {
                    "Content-type": "application/json",
                },
            });

            if (response.ok) {
                if (response.status === 200) {
                    return response.json();
                }

                if (response.status !== 401 && response.status !== 204 && response.status !== 404 && response.status !== 500) {
                    notification.error({
                        message: "Lỗi !",
                        description: `Status code ${response.status}: ${this.apiErrorMessage(response.status)}\n${(await response.text()).toString()}`,
                    });
                }

                return null;
            } else {
                if (response.status !== 401 && response.status !== 204 && response.status !== 404 && response.status !== 500) {
                    notification.error({
                        message: "Lỗi !",
                        description: `Status code ${response.status}: ${this.apiErrorMessage(response.status)}\n${(await response.text()).toString()}`,
                    });
                }

                return null;
            }
        } catch (err: any) {
            notification.error({
                message: "Lỗi !",
                description: `Status: ${0}\n${err.toString()}`,
            });
            return null;
        }
    }

    static async GetAuthentication(path: string, params?: any): Promise<any> {
        let urlParams = "";
        if (params) {
            var str = Object.keys(params)
                .map(function (key) {
                    return key + "=" + params[key];
                })
                .join("&");
            urlParams = "?" + str;
        }

        let access_token = Util.getUserInfo()?.accessToken;

        try {
            let response = await fetch(`${Util.coreApi}${path}${urlParams}`, {
                method: "GET",
                headers: {
                    "Content-type": "application/json",
                    Authorization: `Bearer ${access_token}`,
                },
            });

            if (response.ok) {
                if (response.status === 200) {
                    return response.json();
                }

                if (response.status !== 401 && response.status !== 204 && response.status !== 404 && response.status !== 500) {
                    notification.error({
                        message: "Lỗi !",
                        description: `Status code ${response.status}: ${this.apiErrorMessage(response.status)}\n${(await response.text()).toString()}`,
                    });
                }
                return null;
            } else {
                if (response.status !== 401 && response.status !== 204 && response.status !== 404 && response.status !== 500) {
                    notification.error({
                        message: "Lỗi !",
                        description: `Status code ${response.status}: ${this.apiErrorMessage(response.status)}\n${(await response.text()).toString()}`,
                    });
                }

                return null;
            }
        } catch (err: any) {
            notification.error({
                message: "Lỗi !",
                description: `Status: ${0}\n${err.toString()}`,
            });
            return null;
        }
    }

    private static async PostJsonAnonymous<T>(path: string, body: any, header?: any): Promise<BaseApiResponse<T>> {
        try {
            const response = await fetch(Util.coreApi + path, {
                method: "POST",
                headers: {
                    "Content-type": "application/json",
                    ...header
                },
                body: JSON.stringify(body),
            });

            if (response.ok) {
                if (response.status === 200) {
                    let result = await response.json();
                    result.statusCode = response.status;
                    return result as BaseApiResponse<T>;
                }
                return { status: true, message: "Thực hiện thành công", statusCode: response.status } as BaseApiResponse<T>;

            } else {
                if (response.status === 400) {
                    let result = await response.json();
                    result.statusCode = response.status;
                    return result as BaseApiResponse<T>;
                }
                return { status: false, message: "Fail", statusCode: response.status } as BaseApiResponse<T>;
            }
        } catch (err: any) {
            return { status: false, message: err, statusCode: 500, error: err } as BaseApiResponse<T>;
        }
    }

    public static async PostAuthentication<T>(path: string, body: any): Promise<BaseApiResponse<T>> {
        const access_token = Util.getUserInfo()?.accessToken;
        const header = {
            Authorization: `Bearer ${access_token}`,
        }
        const response = await this.PostJsonAnonymous<T>(path, body, header);
        return response;
    }

    static async PostAnonymous(path: string, body: any) {
        return await this.PostJsonAnonymous(path, body);
    }

    static apiErrorMessage = (api_status: any) => {
        switch (api_status) {
            case 400: //Bad request
                return "Api call error";
            case 401: //Unauthorized
                return "Unauthorized";
            case 403: //Fobiden
                return "Fobiden";
            default:
                return "Network error";
        }
    };
}
