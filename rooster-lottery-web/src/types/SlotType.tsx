import { BaseType } from "./BaseType";
import { BetType } from "./BetType";

export type SlotType = BaseType & {
    slotTime: Date;
    slotDay: number;
    slotHour: number;
    slotMinute: number;
    spinTime?: Date;
    resultNumber?: number;
    spined?: boolean;
    bets?: BetType[];
};
