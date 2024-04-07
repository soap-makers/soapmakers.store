/**
 * @name Excessive Memory Allocation
 * @description Flags instances of excessive memory allocation that may impact performance.
 */
import cpp

from Allocation a
where a.getSize() > 10000
select a, "Excessive memory allocation detected"
