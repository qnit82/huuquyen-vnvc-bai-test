export type BaseApiResponse<T> = {
    statusCode: number;
    status: boolean;
    message: string;
    data?: T;
    error?: any;
}