# Скрипт для обработки результатов исследования применения кластерного анализа методом К средних 
# в украинских научных публикациях по психологии

# Расшифорвка названий полей

id = list(
"author" = "Перечень авторов",
"title" = "Название публикации",
"year" = "Год публикации",
"k-means" = "Использование метода К средних",
"levels_num" = "Количество переменных, использованных для разбиения на кластеры",
"tests_num" = "Количество тестов, упомянутых в работе и для кластеризации в частности",
"ierarch" = "Примение в качестве обоснования для выделения групп иерархического кластерного анализа",
"normalize" = "Применение предварительной нормализации данных",
"raw_desc" = "Описание исходных данных",
"fa_pca" = "Предварительное преобразование данных с применением метода главных компонент или эксплораторного факторного анализа",
"descriptive" = "Применение описательной статистики в анализе результатов",
"t_student" = "Применение критерия Стьюдента для обоснования валидности кластеров",
"anova" = "Применение дисперсионного анализа для обоснования валидности кластеров",
"fishers_phi" = "Применение критерия углового преобразования Фишера для обоснования валидности кластеров",
"u_mw" = "Применение критерия U Манна-Уитни для обоснования валидности кластера",
"h_k_w" = "Применение H критерия Краскала-Уоллиса для обоснования валидности кластеров",
"post_fa" = "Применение факторного анализа к результатам кластеризации",
"cluster_num" = "Количество кластеров, выбранное исследователями",
"sample" = "Размер выборки в исследовании",
"external_vaildation" = "Внешняя валидация кластеров",
"soft" = "Описание использованного для анализа ПО",
"argument" = "Наличие аргументации по количеству выделенных кластеров",
"full_citation" = "Библиографическое описание публикации",
"extra" = "Дополнительные примечания")

# Чтение базы данных

data <- read.csv('2015.11.05 - Cluster.csv', header=T,sep="\t")

# Количество публикаций за период
table(data$year)

# Количество переменных для кластеризации и выборка
lev_sample <- data[c("sample","levels_num")]
lev_sample <- rbind(lev_sample,c(917,29))
lev_sample <- rbind(lev_sample,c(240,NA))
lev_sample <- rbind(lev_sample,c(138,NA))

# Количество тестов, переменных и выборок в статьях
summary(data$tests_num)
summary(lev_sample$levels_num)
summary(lev_sample$sample)

# Количество работ, соответствующее критерию Формана

sum(lev_sample$sample > 5*2^lev_sample$levels_num,na.rm=T)
sum(lev_sample$sample > 5*2^lev_sample$levels_num,na.rm=T)/nrow(lev_sample)
sum(lev_sample$sample > 2^lev_sample$levels_num,na.rm=T)
sum(lev_sample$sample > 2^lev_sample$levels_num,na.rm=T)/nrow(lev_sample)

# График количества переменных и размера выборок

plot(lev_sample$levels_num, lev_sample$sample, xlab="Количество переменных", ylab="Размер выборки")
lines(0:max(lev_sample$levels_num,na.rm=T),2^(0:max(lev_sample$levels_num,na.rm=T)),col="red")
lines(0:max(lev_sample$levels_num,na.rm=T),5*2^(0:max(lev_sample$levels_num,na.rm=T)),col="blue",lty=2)

points(lev_sample$levels_num[lev_sample$sample > 5*2^lev_sample$levels_num],lev_sample$sample[lev_sample$sample > 5*2^lev_sample$levels_num],pch=19,col="gray")
points(lev_sample$levels_num[lev_sample$sample < 2^lev_sample$levels_num],lev_sample$sample[lev_sample$sample < 2^lev_sample$levels_num],pch=19)

# Количество кластеров в исследованиях

clust_sample <- data[c("sample","cluster_num")]
clust_sample <- rbind(clust_sample,c(917,2))
clust_sample <- rbind(clust_sample,c(240,4))
clust_sample <- rbind(clust_sample,c(138,4))

table(clust_sample$cluster_num)
format(prop.table(table(clust_sample$cluster_num))*100,nsmall=1,digits=1)

# Наличие обоснования числа кластеров

sum(!is.na(data$argument))

# График количества кластеров и размеров выборок

clust_sample <- clust_sample[clust_sample$cluster_num %in% 2:4,]

boxplot(clust_sample$sample~clust_sample$cluster_num, xlab="Количество кластеров", ylab="Размер выборки")

# Применяемое программное обеспечение (удалены версии программных продуктов)

format(table(gsub('[[:digit:]]+', '', data$soft),useNA="ifany")/nrow(data)*100,nsmall=1,digits=1)

# Таблица методов, применяемых для анализа результатов кластеризации

temp <- cbind(unlist(id[names(data[13:19])]),colSums(data[13:19]),colSums(data[13:19])/nrow(data)*100)
temp <- as.data.frame(temp)
temp[,3] <- as.numeric(as.character(temp[,3]))
names(temp) <- c("Метод", "Количество работ", "Процент работ")
format(temp,digits=1,nsmall=1)
