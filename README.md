# stock-market-analytics

## Запуск проекта
1. Запустить комманду bash docker/init.sh
2. Выполнить комманду bash docker/notebooks.sh, перейти по ссылке из командной строки, открыть kafka-spark.ipynb в интерфейсе Jupyter Notebook
3. Выполнить комманду  docker-compose exec -T elasticsearch bin/elasticsearch-setup-passwords auto --batch
4. Пароль для пользователя elastic скопировать из коммандной строки в docker/build/kibana/config/kibana.yml, и в настройки подключения к elasticsearch в Jupyter Notebook
5. Перезапустить Kibana
6. Все нужные данные уже есть в volumes, в репозитории проекта. Чтобы заново засидить все данные можно просто выполнить по очереди все ячейки, в порядке их расположения в ноутбуке. Первые две - отвечают за инициализацию хранилищ данных, их выполнение нужно подождать до конца, прежде, чем запускать остальные ячейки. После их выполнения, запустить три последующих ячейки друг за другом - загрузчики данных, и стриминговый обработчик данных (Spark Streaming).
7. http://172.27.0.99:5601/ - адрес Kibana, можно зайти и настроить свои дешборды, или посмотреть уже готовые
8. Доступы к PostgreSQL: user:stockanalytics, password:stockanalytics, host:172.27.0.55, database:stockanalytics