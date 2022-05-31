select u.Id, u.DisplayName, u.Reputation, count(*) as QuestionsAsked
from users u inner join Post p on u.id = p.OwnerUserId and p.posttypeId = 1
where u.reputation > 75000
group by u.Id, u.DisplayName, u.Reputation
order by QuestionsAsked desc
limit 10
