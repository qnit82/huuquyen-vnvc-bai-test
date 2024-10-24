
import { BaseType } from './BaseType';
export type BetType = BaseType & {
    slotId?: number;
    betNumber?: number;
    betTime?: Date;
    spined?: boolean;
    isWinner?: boolean;
};