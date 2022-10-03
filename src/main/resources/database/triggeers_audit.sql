drop table employee_audit;
CREATE TABLE `employee_audit` (
`audit_id` int(11) NOT NULL AUTO_INCREMENT,
`employee_master_id` int(11) DEFAULT NULL,
`audit_tbl` VARCHAR(100)  DEFAULT NULL,
`audit_col` varchar(100) DEFAULT NULL,
`old_val` varchar(100) DEFAULT NULL,
`new_val` varchar(100) DEFAULT NULL,
`when_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`audit_id`)
) AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

drop trigger if exists employee_trg;

delimiter //
create trigger employee_trg
after update on employee_master
for each row
begin
insert into employee_audit ( employee_master_id, audit_tbl,audit_col, old_val, new_val )
select new.employee_master_id, 'employee_master','CURRENT_TOTAL_COMPENSATION',old.CURRENT_TOTAL_COMPENSATION,new.CURRENT_TOTAL_COMPENSATION from dual where ifNull(new.CURRENT_TOTAL_COMPENSATION,0)<> ifnull(old.CURRENT_TOTAL_COMPENSATION,0)
union all
select new.employee_master_id, 'employee_master','NEW_TOTAL_COMPENSATION',old.NEW_TOTAL_COMPENSATION,new.NEW_TOTAL_COMPENSATION from dual where ifnull(new.NEW_TOTAL_COMPENSATION,0) <> ifnull(old.NEW_TOTAL_COMPENSATION,0)
union all
select new.employee_master_id, 'employee_master','TOTAL_COMPENSATION_INCREASE',old.TOTAL_COMPENSATION_INCREASE,new.TOTAL_COMPENSATION_INCREASE from dual where ifnull(new.TOTAL_COMPENSATION_INCREASE,0) <> ifnull(old.TOTAL_COMPENSATION_INCREASE,0)
;

end ;


drop trigger if exists bonus_master_trg;

delimiter //
create trigger bonus_master_trg
after update on bonus_master
for each row
begin
insert into employee_audit ( employee_master_id, audit_tbl,audit_col, old_val, new_val )
select new.employee_master_id, 'bonus_master','BONUS_AMOUNT_INCREASE',old.BONUS_AMOUNT_INCREASE,new.BONUS_AMOUNT_INCREASE from dual where ifnull(new.BONUS_AMOUNT_INCREASE,0) <> ifnull(old.BONUS_AMOUNT_INCREASE,0)
union all
select new.employee_master_id, 'bonus_master','LAST_BONUS_INCREASE',old.LAST_BONUS_INCREASE,new.LAST_BONUS_INCREASE from dual where ifnull(new.LAST_BONUS_INCREASE,0) <> ifnull(old.LAST_BONUS_INCREASE,0)
union all
select new.employee_master_id, 'bonus_master','BONUS_INCREASE_ELIGIBLE',old.BONUS_INCREASE_ELIGIBLE,new.BONUS_INCREASE_ELIGIBLE from dual where ifnull(new.BONUS_INCREASE_ELIGIBLE,0) <> ifnull(old.BONUS_INCREASE_ELIGIBLE,0)
union all
select new.employee_master_id, 'bonus_master','BONUS_PERCENT_INCREASE',old.BONUS_PERCENT_INCREASE,new.BONUS_PERCENT_INCREASE from dual where ifnull(new.BONUS_PERCENT_INCREASE,0) <> ifnull(old.BONUS_PERCENT_INCREASE,0)
union all
select new.employee_master_id, 'bonus_master','BONUS_TARGET_PERCENT',old.BONUS_TARGET_PERCENT,new.BONUS_TARGET_PERCENT from dual where ifnull(new.BONUS_TARGET_PERCENT,0) <> ifnull(old.BONUS_TARGET_PERCENT,0)
union all
select new.employee_master_id, 'bonus_master','BONUS_TARGET_AMOUNT',old.BONUS_TARGET_AMOUNT,new.BONUS_TARGET_AMOUNT from dual where ifnull(new.BONUS_TARGET_AMOUNT,0) <> ifnull(old.BONUS_TARGET_AMOUNT,0)
union all
select new.employee_master_id, 'bonus_master','BONUS_PRORATION_FACTOR',old.BONUS_PRORATION_FACTOR,new.BONUS_PRORATION_FACTOR from dual where ifnull(new.BONUS_PRORATION_FACTOR,0) <> ifnull(old.BONUS_PRORATION_FACTOR,0)
union all
select new.employee_master_id, 'bonus_master','CURRENT_ANNUAL_BONUS',old.CURRENT_ANNUAL_BONUS,new.CURRENT_ANNUAL_BONUS from dual where ifnull(new.CURRENT_ANNUAL_BONUS,0) <> ifnull(old.CURRENT_ANNUAL_BONUS,0)
union all
select new.employee_master_id, 'bonus_master','CURRENT_COMPA_RATIO',old.CURRENT_COMPA_RATIO,new.CURRENT_COMPA_RATIO from dual where ifnull(new.CURRENT_COMPA_RATIO,0) <> ifnull(old.CURRENT_COMPA_RATIO,0)
union all
select new.employee_master_id, 'bonus_master','NEW_ANNUAL_BONUS',old.NEW_ANNUAL_BONUS,new.NEW_ANNUAL_BONUS from dual where ifnull(new.NEW_ANNUAL_BONUS,0) <> ifnull(old.NEW_ANNUAL_BONUS,0)
union all
select new.employee_master_id, 'bonus_master','NEW_COMPA_RATIO',old.NEW_COMPA_RATIO,new.NEW_COMPA_RATIO from dual where ifnull(new.NEW_COMPA_RATIO,0) <> ifnull(old.NEW_COMPA_RATIO,0)
;
end ;

drop trigger if exists basepay_master_trg;

delimiter //
create trigger basepay_master_trg
after update on basepay_master
for each row
begin
insert into employee_audit ( employee_master_id, audit_tbl,audit_col, old_val, new_val )
select new.employee_master_id, 'basepay_master','BASEPAY_AMOUNT_INCREASE',old.BASEPAY_AMOUNT_INCREASE,new.BASEPAY_AMOUNT_INCREASE from dual where ifnull(new.BASEPAY_AMOUNT_INCREASE,0) <> ifnull(old.BASEPAY_AMOUNT_INCREASE,0)
union all
select new.employee_master_id, 'basepay_master','LAST_BASEPAY_INCREASE',old.LAST_BASEPAY_INCREASE,new.LAST_BASEPAY_INCREASE from dual where ifnull(new.LAST_BASEPAY_INCREASE,0) <> ifnull(old.LAST_BASEPAY_INCREASE,0)
union all
select new.employee_master_id, 'basepay_master','BASEPAY_INCREASE_ELIGIBLE',old.BASEPAY_INCREASE_ELIGIBLE,new.BASEPAY_INCREASE_ELIGIBLE from dual where ifnull(new.BASEPAY_INCREASE_ELIGIBLE,0) <> ifnull(old.BASEPAY_INCREASE_ELIGIBLE,0)
union all
select new.employee_master_id, 'basepay_master','BASEPAY_PERCENT_INCREASE',old.BASEPAY_PERCENT_INCREASE,new.BASEPAY_PERCENT_INCREASE from dual where ifnull(new.BASEPAY_PERCENT_INCREASE,0) <> ifnull(old.BASEPAY_PERCENT_INCREASE,0)
union all
select new.employee_master_id, 'basepay_master','BASEPAY_PRORATION_FACTOR',old.BASEPAY_PRORATION_FACTOR,new.BASEPAY_PRORATION_FACTOR from dual where ifnull(new.BASEPAY_PRORATION_FACTOR,0) <> ifnull(old.BASEPAY_PRORATION_FACTOR,0)
union all
select new.employee_master_id, 'basepay_master','CURRENT_COMPA_RATIO',old.CURRENT_COMPA_RATIO,new.CURRENT_COMPA_RATIO from dual where ifnull(new.CURRENT_COMPA_RATIO,0) <> ifnull(old.CURRENT_COMPA_RATIO,0)
union all
select new.employee_master_id, 'basepay_master','EFFECTIVE_DATE',old.EFFECTIVE_DATE,new.EFFECTIVE_DATE from dual where ifnull(new.EFFECTIVE_DATE,0) <> ifnull(old.EFFECTIVE_DATE,0)
union all
select new.employee_master_id, 'basepay_master','NEW_ANNUAL_BASEPAY',old.NEW_ANNUAL_BASEPAY,new.NEW_ANNUAL_BASEPAY from dual where ifnull(new.NEW_ANNUAL_BASEPAY,0) <> ifnull(old.NEW_ANNUAL_BASEPAY,0)
union all
select new.employee_master_id, 'basepay_master','NEW_COMPA_RATIO',old.NEW_COMPA_RATIO,new.NEW_COMPA_RATIO from dual where ifnull(new.NEW_COMPA_RATIO,0) <> ifnull(old.NEW_COMPA_RATIO,0);
end ;
//

drop trigger if exists basepay_budget_master_trg;

delimiter //
create trigger basepay_budget_master_trg
after update on basepay_budget_master
for each row
begin
insert into employee_audit ( employee_master_id, audit_tbl,audit_col, old_val, new_val )
select new.employee_master_id, 'basepay_budget_master','DIRECT_REPORTS_BUDGET_TOTAL',old.DIRECT_REPORTS_BUDGET_TOTAL,new.DIRECT_REPORTS_BUDGET_TOTAL from dual where ifnull(new.DIRECT_REPORTS_BUDGET_TOTAL,0) <> ifnull(old.DIRECT_REPORTS_BUDGET_TOTAL,0)
union all
select new.employee_master_id, 'basepay_budget_master','DIRECT_REPORTS_BUDGET_ALLOCATED',old.DIRECT_REPORTS_BUDGET_ALLOCATED,new.DIRECT_REPORTS_BUDGET_ALLOCATED from dual where ifnull(new.DIRECT_REPORTS_BUDGET_ALLOCATED,0) <> ifnull(old.DIRECT_REPORTS_BUDGET_ALLOCATED,0)
union all
select new.employee_master_id, 'basepay_budget_master','ALL_REPORTS_BUDGET_TOTAL',old.ALL_REPORTS_BUDGET_TOTAL,new.ALL_REPORTS_BUDGET_TOTAL from dual where ifnull(new.ALL_REPORTS_BUDGET_TOTAL,0) <> ifnull(old.ALL_REPORTS_BUDGET_TOTAL,0)
union all
select new.employee_master_id, 'basepay_budget_master','ALL_REPORTS_BUDGET_ALLOCATED',old.ALL_REPORTS_BUDGET_ALLOCATED,new.ALL_REPORTS_BUDGET_ALLOCATED from dual where ifnull(new.ALL_REPORTS_BUDGET_ALLOCATED,0) <> ifnull(old.ALL_REPORTS_BUDGET_ALLOCATED,0)
union all
select new.employee_master_id, 'basepay_budget_master','ALL_REPORTS_BUDGET_REMAINING',old.ALL_REPORTS_BUDGET_REMAINING,new.ALL_REPORTS_BUDGET_REMAINING from dual where ifnull(new.ALL_REPORTS_BUDGET_REMAINING,0) <> ifnull(old.ALL_REPORTS_BUDGET_REMAINING,0)
union all
select new.employee_master_id, 'basepay_budget_master','DIRECT_REPORTS_BUDGET_REMAINING',old.DIRECT_REPORTS_BUDGET_REMAINING,new.DIRECT_REPORTS_BUDGET_REMAINING from dual where ifnull(new.DIRECT_REPORTS_BUDGET_REMAINING,0) <> ifnull(old.DIRECT_REPORTS_BUDGET_REMAINING,0)
;
end ;
//
drop trigger if exists bonus_budget_master_trg;

delimiter //
create trigger bonus_budget_master_trg
after update on bonus_budget_master
for each row
begin
insert into employee_audit ( employee_master_id, audit_tbl,audit_col, old_val, new_val )
select new.employee_master_id, 'bonus_budget_master','DIRECT_REPORTS_BUDGET_TOTAL',old.DIRECT_REPORTS_BUDGET_TOTAL,new.DIRECT_REPORTS_BUDGET_TOTAL from dual where ifnull(new.DIRECT_REPORTS_BUDGET_TOTAL,0) <> ifnull(old.DIRECT_REPORTS_BUDGET_TOTAL,0)
union all
select new.employee_master_id, 'bonus_budget_master','DIRECT_REPORTS_BUDGET_ALLOCATED',old.DIRECT_REPORTS_BUDGET_ALLOCATED,new.DIRECT_REPORTS_BUDGET_ALLOCATED from dual where ifnull(new.DIRECT_REPORTS_BUDGET_ALLOCATED,0) <> ifnull(old.DIRECT_REPORTS_BUDGET_ALLOCATED,0)
union all
select new.employee_master_id, 'bonus_budget_master','ALL_REPORTS_BUDGET_TOTAL',old.ALL_REPORTS_BUDGET_TOTAL,new.ALL_REPORTS_BUDGET_TOTAL from dual where ifnull(new.ALL_REPORTS_BUDGET_TOTAL,0) <> ifnull(old.ALL_REPORTS_BUDGET_TOTAL,0)
union all
select new.employee_master_id, 'bonus_budget_master','ALL_REPORTS_BUDGET_ALLOCATED',old.ALL_REPORTS_BUDGET_ALLOCATED,new.ALL_REPORTS_BUDGET_ALLOCATED from dual where ifnull(new.ALL_REPORTS_BUDGET_ALLOCATED,0) <> ifnull(old.ALL_REPORTS_BUDGET_ALLOCATED,0)
union all
select new.employee_master_id, 'bonus_budget_master','ALL_REPORTS_BUDGET_REMAINING',old.ALL_REPORTS_BUDGET_REMAINING,new.ALL_REPORTS_BUDGET_REMAINING from dual where ifnull(new.ALL_REPORTS_BUDGET_REMAINING,0) <> ifnull(old.ALL_REPORTS_BUDGET_REMAINING,0)
union all
select new.employee_master_id, 'bonus_budget_master','DIRECT_REPORTS_BUDGET_REMAINING',old.DIRECT_REPORTS_BUDGET_REMAINING,new.DIRECT_REPORTS_BUDGET_REMAINING from dual where ifnull(new.DIRECT_REPORTS_BUDGET_REMAINING,0) <> ifnull(old.DIRECT_REPORTS_BUDGET_REMAINING,0)
;
end ;
//