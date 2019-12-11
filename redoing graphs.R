#graphing popular tweets
popular_tweets %>%
  filter(favorite_count >= 10) %>%
ggplot(., aes(x = reply_count, y = favorite_count,  color = hashtag1)) +
  geom_point()+
  xlab(label = "Reply Count")+
  ylab(label= "Favorite Count") +
  ggtitle("Most Popular Tweets by Replies and Favorites")

#user support graph
user_support_graph <-
  user_support %>%
  filter(n>2) %>%
  ggplot(., aes(x =n, y= screen_name))+
  geom_point(col = "red3")+
  xlab(label = "Number of Tweets by Twitter User") +
  ylab(label = "Screen Name")+
  ggtitle("Evaluating Twitter Support By Screen Names")

user_support_graph

#most popular hashtag graph
hashtag_popular <- 
hashes %>%
  filter(n>= 5) %>%
  ggplot(., aes(x= n, y= hashtag1)) +
  geom_point(col = "red3")+
  xlab(label = "Number of Times the Hashtag Was Used") +
  ylab(label = "Most Popular Hashtag") +
  ggtitle("Most Popular Hashtags")

#second most popular hashtag graph
second_popular <- 
  hashes2 %>%
  filter(n>= 5) %>%
  ggplot(., aes(x= n, y= hashtag2)) +
  geom_point(col = "red3")+
  xlab(label = "Number of Times the Hashtag Was Used") +
  ylab(label = "Second Most Popular Hashtag") +
  ggtitle("Second Most Popular Hashtags")

second_popular 

