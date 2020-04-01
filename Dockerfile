FROM swr.cn-south-1.myhuaweicloud.com/itim-ms/nginx-itim:1.15.2
MAINTAINER <xianlianglin@sfmail.sf-express.com>
USER root

ENV NG_HOME /usr/share/nginx
ENV NG_LOG_PATH ${NG_HOME}/logs
ENV NG_CONF_PATH /etc/nginx
ENV APP_WORK_PATH ${NG_HOME}/kjsf-h5

RUN mkdir -p ${APP_WORK_PATH} && mkdir -p ${NG_LOG_PATH} && cp -p ${NG_CONF_PATH}/nginx.conf ${NG_CONF_PATH}/nginx.conf.bak

#Copy自定义的NG配置文件替换默认文件
COPY nginx-sit.conf ${NG_CONF_PATH}/nginx.conf

#会自动解压
ADD ./dist.tar.gz ${APP_WORK_PATH}

#EXPOSE 映射端口
EXPOSE 8080

#ENTRYPOINT ["/usr/sbin/nginx"]
#CMD 运行以下命令 
CMD ["nginx", "-g", "daemon off;"]