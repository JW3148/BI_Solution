


/*
T-SQL implement SCD type1 and type2 change
-wrap up in Stored procedure
only type 1 change: update
only type 2 change: insert, update most recent record
type 1 and type 2 together: update existing for type 1 column; then insert type 2 column
*/


/*
select relevent cols
into TEMP_DIM_XXX_MAP
from source 
left join
DIM_XXX
ON Natural key
and active flag=Y

*/

/*
STEP1
insert new records

use Outer join
*/




/*
STEP2

type1 change

update 
with inner join 
on Natural Key
and type 1 col <> type 1 col
*/





/*
STEP3

type2 change

update existing active record
set active flag=N, expiration date=getdate() 
with inner join
on Natural Key
and type 2 col <> type 2 col
WHERE active flag =Y   --existing active record

insert ... , effective date(getdate()), active flag(Y), reason to change(case..)
with inner join
on Natural Key
and type 2 col <> type 2 col
*/