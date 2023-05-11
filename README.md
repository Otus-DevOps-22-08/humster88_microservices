# humster88_microservices
humster88 microservices repository

DOCKER-1 & DOCKER-2 HOMEWORKS:
- Создание docker host
- Создание своего образа
- Работа с Docker Hub
- Объясните чем отличается контейнер от образа. Объяснение допишите в файл dockermonolith/docker-1.log
- Нужно реализовать в виде прототипа в директории /docker-monolith/infra/
- Поднятие инстансов с помощью Terraform, их количество задается переменной;
- Несколько плейбуков Ansible для установки докера и запуска там образа приложения;
- Шаблон пакера, который делает образ с уже установленным Docker

DOCKER-3 HOMEWORK:
- Научиться описывать и собирать Docker-образы для сервисного приложения
- Научиться оптимизировать работу с Docker-образами
- Запуск и работа приложения на основе Docker-образов, оценка удобства запуска контейнеров при помощи docker run

DOCKER-4 HOMEWORK:
- имя проекта можно задать опцией -p утилиты docker-compose или с помощью переменной среды COMPOSE_PROJECT_NAME
• Разобраться с работой сети в Docker
• none
• host
• bridge
• Установить docker-compose на локальную машину
• Собрать образы приложения reddit с помощью docker-compose
• Запустить приложение reddit с помощью dockercompose
1) Изменить docker-compose под кейс с множеством сетей, сетевых алиасов (стр 18).
2) Параметризуйте с помощью переменных окружений:
• порт публикации сервиса ui
• версии сервисов
• возможно что-либо еще на ваше усмотрение
3) Параметризованные параметры запишите в отдельный файл c расширением .env
4) Без использования команд source и export docker-compose должен подхватить переменные из этого файла. Проверьте
Создайте docker-compose.override.yml для reddit проекта, который позволит
• Изменять код каждого из приложений, не выполняя сборку образа
• Запускать puma для руби приложений в дебаг режиме с двумя воркерами (флаги --debug и -w 2)

MONITORING-1 HOMEWORK:
https://hub.docker.com/repositories/humster88
Prometheus: запуск, конфигурация, знакомство с Web UI
Мониторинг состояния микросервисов
Сбор метрик хоста с использованием экспортера
Задания со *

LOGGING-1 HOMEWORK:
Подготовка окружения
Логирование Docker-контейнеров
Сбор неструктурированных логов
Визуализация логов
Сбор структурированных логов
Распределенный трейсинг
*

GITLAB HOMEWORK:
Подготовить инсталляцию Gitlab CI
Подготовить репозиторий с кодом приложения
Описать для приложения этапы пайплайна
Определить окружения

KUBERNETES-1 HOMEWORK:
Разобрать на практике все компоненты Kubernetes, развернуть их вручную используя kubeadm
Ознакомиться с описанием основных примитивов нашего приложения и его дальнейшим запуском в Kubernetes
Опишите установку кластера k8s с помощью terraform и ansible
В директории kubernetes создайте директории terraform и ansible (все манифесты должны хранится там)

KUBERNETES-2 HOMEWORK:
Развернуть локальное окружение для работы с Kubernetes
Развернуть Kubernetes в Yandex Cloud
Запустить reddit в Kubernetes

KUBERNETES-3 HOMEWORK:
Ingress Controller
Ingress
Secret
TLS
LoadBalancer Service
Network Policies
PersistentVolumes
PersistentVolumeClaims

KUBERNETES-4 HOMEWORK:
Работа с Helm
Развертывание Gitlab в Kubernetes
Запуск CI/CD конвейера в Kubernetes
