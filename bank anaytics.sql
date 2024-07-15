create database bank_analytics;
select* FROM fiinance_1;
select* FROM fiinance_2;

##kpi 1
select year(issue_d) as year_of_issue_d,concat(round(sum(loan_amnt)/1000000,2),'M')as total_loan_amnt from fiinance_1
group by year_of_issue_d
order by year_of_issue_d;

##kpi2
select grade,sub_grade,sum(revol_bal) as total_revol_bal from fiinance_1 inner join fiinance_2 on(fiinance_1.id=fiinance_2.id)
 group by grade,sub_grade
 order by grade,sub_grade;
 
 ##kpi3
select verification_status,concat("$",format(round(sum(total_pymnt)/1000000,2),2),"M")as total_payment from
fiinance_1 inner join fiinance_2 on (fiinance_1.id=fiinance_2.id)
group by verification_status
having verification_status in ('verified','not verified');

##kpi4
select addr_state,loan_status,count(last_pymnt_d) as total_count,monthname(last_pymnt_d) as month from fiinance_1 inner join fiinance_2 on(fiinance_1.id=fiinance_2.id)
group by addr_state,loan_status,month
order by addr_state;

##kpi5
select home_ownership,count(last_pymnt_d) as count_of_last_paymnt 
from fiinance_1 inner join fiinance_2 on(fiinance_1.id=fiinance_2.id)
group by  home_ownership;
