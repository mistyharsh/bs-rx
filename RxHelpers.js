import { of } from 'rxjs';

// Experiemental
export function offScheduler(scheduler, firstValue, ...args) {
    return of.apply(null, [firstValue, ...args, scheduler]);
}
