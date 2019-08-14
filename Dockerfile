ARG image_name
FROM $image_name
ARG test_script_name
ARG folder_scripts=scripts
ARG module
ENV module_env=$module
ARG script_name
ENV script_name_env=$script_name
RUN echo $module_env
USER 1000
COPY ./$folder_scripts/$script_name /
COPY ./$folder_scripts/$test_script_name /
CMD ["sh", "-c", "${module_env} ./$script_name_env"]
