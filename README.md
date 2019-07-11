# crawler
计算机应用编程实验2

## 实验涉及内容

- Linux Socket编程
- 页面url提取
- BloomFilter url去重
- Libevent异步IO库并发抓取
- PageRank 计算权重最高的十个页面


## 代码运行
make

./crawler url.txt

gcc pagerank.c -o pagerank 

./pagerank url.txt top10.txt
