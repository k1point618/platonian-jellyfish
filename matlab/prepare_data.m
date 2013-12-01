function [ output_args ] = prepare_data( dir )


path1 = strcat(dir, '/article_labels.mat')
article_labels = csvread(path1);

news = csvread(strcat(dir, '/news.mat'));

[ news, article_labels ] = sort_by_time( news, article_labels );

next_day_labels = article_labels(:,3) - article_labels(:,2);
after_day_labels = article_labels(:,2) - article_labels(:,1);
long_labels = article_labels(:,3) - article_labels(:,1);

save('data.mat', 'news', 'next_day_labels', 'after_day_labels', 'long_labels');

end
