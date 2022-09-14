create table attachment
(
    id            bigint                  not null comment '主键id'
        primary key,
    origin_name   varchar(255) default '' not null comment '原文件名',
    new_file_name varchar(255) default '' not null comment '新文件名',
    url           varchar(255) default '' not null comment '链接',
    tenant_id     varchar(32)             not null comment '租户号',
    created_by    varchar(32)             not null comment '创建人工号',
    created_time  datetime                not null comment '创建时间'
)
    comment '附件表' charset = utf8;

create table baseline_year
(
    id           bigint           not null comment '主键'
        primary key,
    org_id       bigint           not null comment '组织id',
    year         int(4)           not null comment '年份',
    revision     int(10)          not null comment '乐观锁',
    created_by   varchar(32)      not null comment '创建人工号',
    created_time datetime         not null comment '创建时间',
    updated_by   varchar(20)      not null comment '更新人工号',
    updated_time datetime         not null comment '更新时间',
    tenant_id    varchar(32)      not null comment '租户号',
    delete_flag  bigint default 0 not null comment '逻辑删除'
)
    comment '组织基线年' charset = utf8;

create table carbon_inventory
(
    id           bigint(64)                      not null comment '主键id'
        primary key,
    org_id       bigint(64)                      not null comment '组织id',
    org_name     varchar(300)   default ''       not null comment '组织名称',
    year         int(4)                          not null comment '年份',
    quarter      int(2)                          not null comment '季度',
    status       int(2)                          not null comment '状态',
    scope_one    decimal(24, 6) default 0.000000 not null comment '范围一排放',
    scope_two    decimal(24, 6) default 0.000000 not null comment '范围二排放',
    scope_three  decimal(24, 6) default 0.000000 not null comment '范围三排放',
    deadline     datetime                        null comment '截止日期',
    unit         varchar(20)    default ''       not null comment '碳盘查二氧化碳当量单位',
    tenant_id    varchar(32)                     not null comment '租户号',
    revision     int(10)                         not null comment '乐观锁',
    created_by   varchar(32)                     not null comment '创建人工号',
    created_time datetime                        not null comment '创建时间',
    updated_by   varchar(20)                     not null comment '更新人工号',
    updated_time datetime                        not null comment '更新时间',
    delete_flag  bigint         default 0        not null comment '逻辑删除'
)
    comment '碳盘查总报告' charset = utf8;

create table carbon_inventory_task
(
    id            bigint            not null comment '主键id'
        primary key,
    year          int(4)            not null comment '年份',
    quarter       int(2)            not null comment '季度',
    org_id        bigint            not null comment '组织id',
    is_root       int               null comment '是否是根节点',
    deadline      datetime          not null comment '截止日期',
    report_status int(2)  default 0 not null comment '报告状态',
    task_status   int(2)  default 0 null comment '任务状态',
    created_by    varchar(32)       not null comment '创建人id',
    created_time  datetime          not null comment '创建时间',
    updated_by    varchar(32)       not null comment '更新人id',
    updated_time  datetime          not null comment '更新时间',
    tenant_id     varchar(32)       not null comment '租户号',
    revision      int(10) default 1 not null comment '乐观锁',
    delete_flag   bigint  default 0 not null comment '逻辑删除'
)
    comment '碳盘查任务' charset = utf8;

create table cec_message
(
    id           bigint                      not null comment '主键id'
        primary key,
    content      varchar(1000) default '0.0' not null comment '消息内容',
    type         varchar(10)   default ''    not null comment '消息类型',
    org_id       decimal(24, 6)              not null comment '组织id',
    tenant_id    varchar(32)                 not null comment '租户号',
    created_by   varchar(32)                 not null comment '创建人工号',
    created_time datetime                    not null comment '创建时间'
)
    comment '消息通知' charset = utf8;

create table custom_factor
(
    id            bigint                          not null comment '主键id'
        primary key,
    type          varchar(100)   default ''       not null comment '自定义碳排因子类型',
    org_id        bigint                          not null comment '组织id',
    factor        decimal(24, 6) default 0.000000 not null comment '因子数值',
    factor_name   varchar(30)    default ''       not null comment '因子名称',
    factor_unit   varchar(30)    default ''       not null comment '排放因子单位',
    fuel_unit     varchar(30)    default ''       not null comment '燃料单位',
    source_desc   varchar(255)   default ''       not null comment '来源描述',
    attachment_id bigint                          null comment '证明文件id',
    tenant_id     varchar(32)                     not null comment '租户号',
    created_by    varchar(32)                     not null comment '创建人工号',
    created_time  datetime                        not null comment '创建时间'
)
    comment '自定义碳排放因子表' charset = utf8;

create table dynamic_message
(
    id           bigint                  not null comment '主键id'
        primary key,
    year         int(4)                  null comment '年份',
    quarter      int(2)                  null comment '季度',
    org_id       bigint                  not null comment '组织id',
    content      varchar(200)            not null comment '内容',
    url          varchar(300) default '' not null comment 'url',
    created_by   varchar(32)             not null comment '创建人id',
    created_time datetime                not null comment '创建时间',
    tenant_id    varchar(32)             not null comment '租户号',
    revision     int(10)      default 1  not null comment '乐观锁',
    delete_flag  bigint       default 0  not null comment '逻辑删除'
)
    comment '动态' charset = utf8;

create table emission_reduction_target
(
    id                   bigint                          not null comment '主键'
        primary key,
    org_id               bigint                          not null comment '组织id',
    year                 int(4)                          not null comment '年份',
    carbon_emission      decimal(24, 6) default 0.000000 not null comment '二氧化碳排放减少量',
    carbon_emission_unit varchar(30)    default ''       not null comment '二氧化碳排放单位',
    reduction_ratio      decimal(10, 4)                  null comment '计划减碳比例',
    revision             int(10)                         not null comment '乐观锁',
    created_by           varchar(32)                     not null comment '创建人工号',
    created_time         datetime                        not null comment '创建时间',
    updated_by           varchar(20)                     not null comment '更新人工号',
    updated_time         datetime                        not null comment '更新时间',
    tenant_id            varchar(32)                     not null comment '租户号',
    delete_flag          bigint         default 0        not null comment '逻辑删除'
)
    comment '组织减排目标' charset = utf8;

create table exchange_rate
(
    id           bigint            not null comment '主键id'
        primary key,
    rate         decimal(10, 6)    not null comment '汇率',
    year         int(4)            not null comment '年份',
    created_by   varchar(32)       not null comment '创建人工号',
    created_time datetime          not null comment '创建时间',
    updated_by   varchar(32)       not null comment '更新人工号',
    updated_time datetime          not null comment '更新时间',
    tenant_id    varchar(32)       not null comment '租户号',
    revision     int(10) default 1 not null comment '乐观锁',
    delete_flag  bigint  default 0 not null comment '逻辑删除'
)
    comment '美元与人民币汇率信息' charset = utf8;

create table fixed_combustion
(
    id                   bigint                          not null comment '主键'
        primary key,
    inventory_id         bigint                          not null comment '碳盘查报告id',
    quantity             decimal(24, 6) default 0.000000 not null comment '数量',
    type                 varchar(30)    default ''       not null comment '燃料类型',
    fuel_unit            varchar(30)    default ''       not null comment '燃料单位',
    carbon_emission      decimal(24, 6) default 0.000000 not null comment '二氧化碳排放',
    carbon_emission_unit varchar(30)    default ''       not null comment '二氧化碳排放单位',
    data_source          varchar(200)   default ''       not null comment '数据来源',
    revision             int(10)                         not null comment '乐观锁',
    created_by           varchar(32)                     not null comment '创建人工号',
    created_time         datetime                        not null comment '创建时间',
    updated_by           varchar(20)                     not null comment '更新人工号',
    updated_time         datetime                        not null comment '更新时间',
    tenant_id            varchar(32)                     not null comment '租户号',
    delete_flag          bigint         default 0        not null comment '逻辑删除',
    attachment_id        bigint                          null comment '附件id'
)
    comment '固定燃烧排放' charset = utf8;

-- create table flyway_schema_history
-- (
--     installed_rank int                                 not null
--         primary key,
--     version        varchar(50)                         null,
--     description    varchar(200)                        not null,
--     type           varchar(20)                         not null,
--     script         varchar(1000)                       not null,
--     checksum       int                                 null,
--     installed_by   varchar(100)                        not null,
--     installed_on   timestamp default CURRENT_TIMESTAMP not null,
--     execution_time int                                 not null,
--     success        tinyint(1)                          not null
-- );

create index flyway_schema_history_s_idx
    on flyway_schema_history (success);

create table fugitive_emission
(
    id                   bigint                          not null comment '主键'
        primary key,
    inventory_id         bigint                          not null comment '碳盘查报告id',
    fugitive_type        varchar(30)    default ''       not null comment '逸散类型',
    quantity             decimal(24, 6) default 0.000000 not null comment '数量',
    type                 varchar(30)    default ''       not null comment '气体类型',
    fuel_unit            varchar(30)    default ''       not null comment '燃料单位',
    factor_unit          varchar(30)    default ''       not null comment '排放因子单位',
    carbon_emission      decimal(24, 6) default 0.000000 not null comment '二氧化碳排放',
    carbon_emission_unit varchar(30)    default ''       not null comment '二氧化碳排放单位',
    factor               decimal(24, 6) default 0.000000 not null comment '排放因子',
    description          varchar(500)   default ''       not null comment '描述',
    revision             int(10)                         not null comment '乐观锁',
    created_by           varchar(32)                     not null comment '创建人工号',
    created_time         datetime                        not null comment '创建时间',
    updated_by           varchar(20)                     not null comment '更新人工号',
    updated_time         datetime                        not null comment '更新时间',
    tenant_id            varchar(32)                     not null comment '租户号',
    delete_flag          bigint         default 0        not null comment '逻辑删除',
    data_source          varchar(200)   default ''       not null comment '数据来源'
)
    comment '逸散排放' charset = utf8;

create table mid_attachment
(
    id            bigint auto_increment comment '主键id'
        primary key,
    item_id       bigint      null comment '排放项id',
    attachment_id bigint      null comment '证明文件id',
    created_by    varchar(32) not null comment '创建人工号',
    created_time  datetime    not null comment '创建时间'
)
    comment '附件-排放文件中间表' charset = utf8;

create index mid_attachment_item_id_index
    on mid_attachment (item_id);

create table mid_factor
(
    id        bigint auto_increment comment '主键id'
        primary key,
    item_id   bigint null comment '排放项id(排放源id)',
    factor_id bigint null comment '排放因子id'
)
    comment '排放源-排放因子关联中间表' charset = utf8;

create table mobile_combustion
(
    id                   bigint                          not null comment '主键'
        primary key,
    inventory_id         bigint                          not null comment '碳盘查报告id',
    mobile_type          varchar(40)                     null comment '移动燃烧排放类型',
    quantity             decimal(24, 6) default 0.000000 not null comment '数量',
    type                 varchar(30)    default ''       not null comment '燃烧类型',
    fuel_unit            varchar(30)    default ''       not null comment '燃料单位',
    carbon_emission      decimal(24, 6) default 0.000000 not null comment '二氧化碳排放',
    carbon_emission_unit varchar(30)    default ''       not null comment '二氧化碳排放单位',
    data_source          varchar(200)   default ''       not null comment '数据来源',
    revision             int(10)                         not null comment '乐观锁',
    created_by           varchar(32)                     not null comment '创建人工号',
    created_time         datetime                        not null comment '创建时间',
    updated_by           varchar(20)                     not null comment '更新人工号',
    updated_time         datetime                        not null comment '更新时间',
    tenant_id            varchar(32)                     not null comment '租户号',
    delete_flag          bigint         default 0        not null comment '逻辑删除'
)
    comment '移动燃烧' charset = utf8;

create table notice
(
    id           bigint            not null comment '主键id'
        primary key,
    task_id      bigint            null comment '任务id',
    year         int               null comment '年份',
    quarter      int(2)            null comment '季度',
    org_id       bigint            not null comment '组织id',
    status       int(2)  default 0 not null comment '通知状态',
    content      varchar(200)      not null comment '内容',
    url          varchar(300)      not null comment 'url',
    created_by   varchar(32)       not null comment '创建人id',
    created_time datetime          not null comment '创建时间',
    updated_by   varchar(32)       not null comment '更新人id',
    updated_time datetime          not null comment '更新时间',
    tenant_id    varchar(32)       not null comment '租户号',
    revision     int(10) default 1 not null comment '乐观锁',
    delete_flag  bigint  default 0 not null comment '逻辑删除'
)
    comment '通知' charset = utf8;

create table org_info
(
    id                 bigint                     not null comment '主键id'
        primary key,
    org_name           varchar(100) default '0.0' not null comment '组织名称',
    type               int(2)       default 0     not null comment '组织类型',
    address            varchar(300) default ''    not null comment '省市区',
    street             varchar(300) default ''    not null comment '街道',
    principal          varchar(40)  default ''    not null comment '组织负责人',
    email              varchar(50)  default ''    not null comment '电子邮箱',
    phone_number       varchar(50)  default ''    not null comment '联系电话',
    created_by         varchar(32)  default ''    not null comment '创建人工号',
    shareholding_ratio varchar(10)  default 'N/A' not null comment '上级组织控股比例,%',
    created_time       datetime                   not null comment '创建时间',
    updated_by         varchar(32)  default ''    not null comment '更新人工号',
    updated_time       datetime                   not null comment '更新时间',
    tenant_id          varchar(32)                not null comment '租户号',
    revision           int(10)      default 1     not null comment '乐观锁',
    delete_flag        bigint       default 0     not null comment '逻辑删除',
    constraint org_info_tenant_id_org_name_uindex
        unique (tenant_id, org_name)
)
    comment '组织信息' charset = utf8;

create table org_info_history
(
    id           bigint                   not null comment '主键id'
        primary key,
    year         int(4)      default 1970 not null comment '年份',
    quarter      int(2)      default 0    not null comment '季度',
    detail       json                     not null comment '具体数据',
    created_by   varchar(32) default ''   not null comment '创建人工号',
    created_time datetime                 not null comment '创建时间',
    updated_by   varchar(32) default ''   not null comment '更新人工号',
    updated_time datetime                 not null comment '更新时间',
    tenant_id    varchar(32)              not null comment '租户号',
    revision     int(10)     default 1    not null comment '乐观锁'
)
    comment '组织历史数据' charset = utf8;

create table org_operation_info
(
    id                     bigint            not null comment '主键id'
        primary key,
    org_id                 bigint            not null comment '组织id',
    year                   int(4)            not null comment '年份',
    quarter                int(2)            not null comment '季度',
    output_value           decimal(12, 6)    null comment '产值',
    output_value_unit      varchar(10)       null comment '产值单位',
    revenue                decimal(12, 6)    null comment '营收',
    revenue_unit           varchar(10)       null comment '营收单位',
    industrial_output      decimal(12, 6)    null comment '工业增加值',
    industrial_output_unit varchar(10)       null comment '工业增加值单位',
    area                   decimal(12, 6)    null comment '占地面积',
    area_unit              varchar(10)       null comment '占地面积单位',
    employee_num           int(10)           null comment '员工数量',
    created_by             varchar(32)       not null comment '创建人工号',
    created_time           datetime          not null comment '创建时间',
    updated_by             varchar(32)       not null comment '更新人工号',
    updated_time           datetime          not null comment '更新时间',
    tenant_id              varchar(32)       not null comment '租户号',
    revision               int(10) default 1 not null comment '乐观锁',
    delete_flag            bigint  default 0 not null comment '逻辑删除'
)
    comment '组织运营信息' charset = utf8;

create table org_operation_message
(
    id           bigint           not null comment '主键id'
        primary key,
    year         int(4)           not null comment '年份',
    quarter      int(2)           not null comment '季度',
    org_id       bigint           not null comment '组织id',
    user_id      bigint           not null comment '用户id',
    content      varchar(200)     not null comment '内容',
    status       int(2)           not null comment '通知状态',
    created_time datetime         not null comment '创建时间',
    updated_time datetime         not null comment '更新时间',
    tenant_id    varchar(32)      not null comment '租户号',
    delete_flag  bigint default 0 not null comment '逻辑删除'
)
    comment '待更新的运营信息' charset = utf8;

create table org_operation_message_schedule
(
    id           bigint           not null comment '主键id'
        primary key,
    year         int(4)           not null comment '年份',
    quarter      int(2)           not null comment '季度',
    org_id       bigint           not null comment '组织id',
    next_time    datetime         not null comment '下次任务时间',
    created_time datetime         not null comment '创建时间',
    updated_time datetime         null comment '更新时间',
    tenant_id    varchar(32)      not null comment '租户号',
    delete_flag  bigint default 0 not null comment '逻辑删除'
)
    comment '待更新的运营信息通知定时任务' charset = utf8;

create table org_tree
(
    id              bigint            not null comment '主键id'
        primary key,
    ancestor_org_id bigint  default 0 not null comment '父组织id或祖先组织id',
    ancestor_type   int(2)  default 0 not null comment '父组织或祖先组织类型',
    level           int(10) default 0 not null comment '层级关系',
    org_id          bigint  default 0 not null comment '组织id',
    type            int(2)  default 0 not null comment '组织类型',
    is_root         int(1)  default 0 not null comment '是否是根节点',
    created_by      varchar(32)       not null comment '创建人工号',
    created_time    datetime          not null comment '创建时间',
    updated_by      varchar(32)       not null comment '更新人工号',
    updated_time    datetime          not null comment '更新时间',
    tenant_id       varchar(32)       not null comment '租户号',
    revision        int(10) default 1 not null comment '乐观锁'
)
    comment '组织关系树' charset = utf8;

create table org_tree_history
(
    id           bigint                   not null comment '主键id'
        primary key,
    year         int(4)      default 1970 not null comment '年份',
    quarter      int(2)      default 0    not null comment '季度',
    detail       json                     not null comment '具体数据',
    created_by   varchar(32) default ''   not null comment '创建人工号',
    created_time datetime                 not null comment '创建时间',
    updated_by   varchar(32) default ''   not null comment '更新人工号',
    updated_time datetime                 not null comment '更新时间',
    tenant_id    varchar(32)              not null comment '租户号',
    revision     int(10)     default 1    not null comment '乐观锁'
)
    comment '组织关系树' charset = utf8;

create table outsourcing_energy
(
    id                   bigint                          not null comment '主键'
        primary key,
    inventory_id         bigint                          not null comment '碳盘查报告id',
    quantity             decimal(24, 6) default 0.000000 not null comment '数量',
    type                 varchar(30)    default ''       not null comment '能源类型',
    fuel_unit            varchar(30)    default ''       not null comment '燃料单位',
    carbon_emission      decimal(24, 6) default 0.000000 not null comment '二氧化碳排放',
    carbon_emission_unit varchar(30)    default ''       not null comment '二氧化碳排放单位',
    data_source          varchar(200)   default ''       not null comment '数据来源',
    revision             int(10)                         not null comment '乐观锁',
    created_by           varchar(32)                     not null comment '创建人工号',
    created_time         datetime                        not null comment '创建时间',
    updated_by           varchar(20)                     not null comment '更新人工号',
    updated_time         datetime                        not null comment '更新时间',
    tenant_id            varchar(32)                     not null comment '租户号',
    delete_flag          bigint         default 0        not null comment '逻辑删除',
    region               varchar(30)    default ''       not null comment '区域'
)
    comment '外购能源' charset = utf8;

create table process_emission
(
    id                   bigint                          not null comment '主键'
        primary key,
    inventory_id         bigint                          not null comment '碳盘查报告id',
    process              varchar(30)    default ''       not null comment '制程',
    quantity             decimal(24, 6) default 0.000000 not null comment '数量',
    type                 varchar(30)    default ''       not null comment '气体类型',
    fuel_unit            varchar(30)    default ''       not null comment '燃料单位',
    carbon_emission      decimal(24, 6) default 0.000000 not null comment '二氧化碳排放',
    carbon_emission_unit varchar(30)    default ''       not null comment '二氧化碳排放单位',
    factor               decimal(24, 6) default 0.000000 not null comment '排放因子',
    factor_unit          varchar(30)    default ''       not null comment '排放因子单位',
    description          varchar(500)   default ''       not null comment '描述',
    data_source          varchar(200)   default ''       not null comment '数据来源',
    revision             int(10)                         not null comment '乐观锁',
    created_by           varchar(32)                     not null comment '创建人工号',
    created_time         datetime                        not null comment '创建时间',
    updated_by           varchar(20)                     not null comment '更新人工号',
    updated_time         datetime                        not null comment '更新时间',
    tenant_id            varchar(32)                     not null comment '租户号',
    delete_flag          bigint         default 0        not null comment '逻辑删除'
)
    comment '制程排放' charset = utf8;

create table summary_scope_three
(
    id                    bigint                          not null comment '主键'
        primary key,
    inventory_id          bigint                          not null comment '碳盘查报告id',
    scope_three_type_enum int(2)                          not null comment '类别（1~15类）',
    group_enum            int(2)                          null comment '具体板块',
    quantity              decimal(24, 6) default 0.000000 not null comment '数量',
    fuel_unit             varchar(30)    default ''       not null comment '燃料单位',
    factor_unit           varchar(30)    default ''       not null comment '排放因子单位',
    factor                decimal(24, 6) default 0.000000 not null comment '排放因子',
    carbon_emission       decimal(24, 6) default 0.000000 not null comment '二氧化碳排放',
    carbon_emission_unit  varchar(30)    default ''       not null comment '二氧化碳排放单位',
    source                varchar(400)   default ''       null comment '排放因子来源',
    detail                varchar(500)   default ''       not null comment '其他属性',
    revision              int(10)                         not null comment '乐观锁',
    created_by            varchar(32)                     not null comment '创建人工号',
    created_time          datetime                        not null comment '创建时间',
    updated_by            varchar(20)                     not null comment '更新人工号',
    updated_time          datetime                        not null comment '更新时间',
    tenant_id             varchar(32)                     not null comment '租户号',
    delete_flag           bigint         default 0        not null comment '逻辑删除'
)
    comment '范围三排放清单' charset = utf8;

create table sys_permission
(
    id              bigint                  not null comment '主键id'
        primary key,
    permission_name varchar(50)  default '' not null comment '权限名称',
    permission_code varchar(100) default '' null comment '权限标识',
    parent_id       bigint                  null comment '父权限id'
)
    comment '权限表' charset = utf8;

create table sys_role
(
    id            bigint      not null comment '主键id'
        primary key,
    role_name     varchar(50) null comment '角色类型',
    role_org_type int(2)      not null comment '角色组织类型'
)
    comment '角色表' charset = utf8;

create table sys_role_permission
(
    id            bigint not null comment '主键id'
        primary key,
    permission_id bigint not null comment '权限id',
    role_id       bigint not null comment '角色id'
)
    comment '角色-权限表' charset = utf8;

create table sys_user
(
    id             bigint                  not null comment '主键id'
        primary key,
    account_number varchar(50)             not null comment '账号',
    user_name      varchar(50)  default '' not null comment '用户名',
    password       varchar(200) default '' not null comment '密码',
    salt           varchar(50)  default '' not null comment '盐值',
    org_id         bigint                  null comment '所属组织id',
    created_by     varchar(32)  default '' not null comment '创建人id',
    created_time   datetime                not null comment '创建时间',
    updated_by     varchar(32)  default '' not null comment '更新人id',
    updated_time   datetime                not null comment '更新时间',
    revision       int(10)      default 1  not null comment '乐观锁',
    delete_flag    bigint       default 0  not null comment '逻辑删除',
    constraint uindex
        unique (account_number, delete_flag)
)
    comment '用户表' charset = utf8;

create table sys_user_role
(
    id      bigint not null comment '主键id'
        primary key,
    user_id bigint not null comment '用户id',
    role_id bigint not null comment '角色id'
)
    comment '用户-角色表' charset = utf8;

create table tb_custom_emission_factor
(
    id                           bigint                          not null comment '主键'
        primary key,
    category1                    bigint                          not null comment '分类1',
    category2                    bigint                          not null comment '分类2',
    factor_name                  varchar(40)                     not null comment '因子名称',
    emission_gas_type            varchar(40)                     not null comment '排放气体类型',
    protocol_version             varchar(100)                    not null comment '协议版本',
    carbon_emission_unit         varchar(30)    default ''       not null comment '排放气体单位',
    fuel_unit                    varchar(30)    default ''       not null comment '活动数据单位',
    factor                       decimal(24, 6) default 0.000000 not null comment '排放因子数值',
    density                      decimal(24, 6) default 0.000000 not null comment '密度',
    density_unit                 varchar(30)    default ''       not null comment '密度单位',
    density_source               varchar(200)   default ''       not null comment '密度来源',
    heat_value                   decimal(24, 6) default 0.000000 not null comment '热值',
    heat_value_unit              varchar(30)    default ''       not null comment '热值单位',
    heat_value_source            varchar(200)   default ''       not null comment '热值来源',
    car_con_per_heat_value       decimal(24, 6) default 0.000000 not null comment '单位热值含碳量',
    ca_con_per_heat_value_unit   varchar(30)    default ''       not null comment '单位热值含碳量单位',
    ca_con_per_heat_value_source varchar(200)   default ''       not null comment '单位热值含碳量来源',
    carbon_oxidation_rate        decimal(24, 6) default 0.000000 not null comment '碳氧化率',
    carbon_oxidation_rate_source varchar(200)   default ''       not null comment '碳氧化率来源',
    country                      varchar(30)    default ''       not null comment '国家',
    region                       varchar(30)    default ''       not null comment '地区',
    industry                     varchar(30)    default ''       not null comment '行业',
    source                       varchar(200)   default ''       not null comment '来源',
    year                         int(4)         default 1970     not null comment '年份',
    org_id                       bigint                          not null comment '组织id',
    revision                     int(10)                         not null comment '乐观锁',
    created_by                   varchar(32)                     not null comment '创建人工号',
    created_time                 datetime                        not null comment '创建时间',
    updated_by                   varchar(20)                     not null comment '更新人工号',
    updated_time                 datetime                        not null comment '更新时间',
    tenant_id                    varchar(32)                     not null comment '租户号',
    delete_flag                  bigint         default 0        not null comment '逻辑删除',
    emission_factor_type_enum    int(2)         default 1        not null comment '因子类型',
    attachment_id                bigint                          null comment '附件id'
)
    comment '自定义因子库' charset = utf8;

create table tb_inventory_status
(
    id           bigint(64)       not null comment '主键id'
        primary key,
    org_id       bigint(64)       not null comment '组织id',
    year         int(4)           not null comment '年份',
    quarter      int(2)           not null comment '季度',
    status       int(2)           not null comment '状态',
    tenant_id    varchar(32)      not null comment '租户号',
    revision     int(10)          not null comment '乐观锁',
    created_by   varchar(32)      not null comment '创建人工号',
    created_time datetime         not null comment '创建时间',
    updated_by   varchar(20)      not null comment '更新人工号',
    updated_time datetime         not null comment '更新时间',
    delete_flag  bigint default 0 not null comment '逻辑删除',
    constraint uindex
        unique (org_id, year, quarter)
)
    comment '碳排报告状态表' charset = utf8;

create table tb_sys_emission_factor
(
    id                           bigint                          not null comment '主键'
        primary key,
    category1                    varchar(20)                     not null comment '分类1',
    category2                    varchar(20)                     null comment '分类2',
    factor_name                  varchar(40)                     not null comment '因子名称',
    emission_gas_type            varchar(40)                     not null comment '排放气体类型',
    protocol_version             varchar(100)                    not null comment '协议版本',
    carbon_emission_unit         varchar(30)    default ''       not null comment '排放气体单位',
    fuel_unit                    varchar(30)    default ''       not null comment '活动数据单位',
    factor                       decimal(24, 6) default 0.000000 not null comment '排放因子数值',
    factor_unit                  varchar(40)                     null comment '排放因子单位',
    density                      decimal(24, 6) default 0.000000 not null comment '密度',
    density_unit                 varchar(30)    default ''       not null comment '密度单位',
    density_source               varchar(200)   default ''       not null comment '密度来源',
    heat_value                   decimal(24, 6) default 0.000000 not null comment '热值',
    heat_value_unit              varchar(30)    default ''       not null comment '热值单位',
    heat_value_source            varchar(200)   default ''       not null comment '热值来源',
    ca_con_per_heat_value        decimal(24, 6) default 0.000000 not null comment '单位热值含碳量',
    ca_con_per_heat_value_unit   varchar(30)    default ''       not null comment '单位热值含碳量单位',
    ca_con_per_heat_value_source varchar(200)   default ''       not null comment '单位热值含碳量来源',
    carbon_oxidation_rate        decimal(24, 6) default 0.000000 not null comment '碳氧化率',
    carbon_oxidation_rate_source varchar(200)   default ''       not null comment '碳氧化率来源',
    country                      varchar(30)    default ''       not null comment '国家',
    region                       varchar(30)    default ''       not null comment '地区',
    industry                     varchar(30)    default ''       not null comment '行业',
    source                       varchar(500)   default ''       not null comment '来源',
    year                         int(4)         default 1970     not null comment '年份',
    revision                     int(10)                         not null comment '乐观锁',
    created_by                   varchar(32)                     not null comment '创建人工号',
    created_time                 datetime                        not null comment '创建时间',
    updated_by                   varchar(20)                     not null comment '更新人工号',
    updated_time                 datetime                        not null comment '更新时间',
    delete_flag                  bigint         default 0        not null comment '逻辑删除',
    org_id                       bigint                          null comment '组织id',
    attachment_id                bigint                          null comment '文件id',
    emission_factor_type_enum    int(2)                          not null comment '因子类型'
)
    comment '系统因子库' charset = utf8;

create table transport_emission
(
    id                   bigint                          not null comment '主键'
        primary key,
    inventory_id         bigint                          not null comment '碳盘查报告id',
    type                 varchar(30)    default ''       not null comment '分类',
    transportation_mode  varchar(30)    default ''       not null comment '交通运输方式',
    vehicle_type         varchar(30)    default ''       not null comment '车辆类型',
    quantity             decimal(24, 6) default 0.000000 not null comment '数量',
    fuel_unit            varchar(30)    default ''       not null comment '燃料单位',
    factor_unit          varchar(30)    default ''       not null comment '排放因子单位',
    use_default_factor   int(2)         default 0        not null comment '是否使用默认碳排放因子',
    carbon_emission      decimal(24, 6) default 0.000000 not null comment '二氧化碳排放',
    carbon_emission_unit varchar(30)    default ''       not null comment '二氧化碳排放单位',
    factor               decimal(24, 6) default 0.000000 not null comment '排放因子',
    description          varchar(500)   default ''       not null comment '描述',
    revision             int(10)                         not null comment '乐观锁',
    created_by           varchar(32)                     not null comment '创建人工号',
    created_time         datetime                        not null comment '创建时间',
    updated_by           varchar(20)                     not null comment '更新人工号',
    updated_time         datetime                        not null comment '更新时间',
    tenant_id            varchar(32)                     not null comment '租户号',
    delete_flag          bigint         default 0        not null comment '逻辑删除'
)
    comment '交通运输排放' charset = utf8;


# 美元兑换
INSERT INTO cec.exchange_rate (id, rate, year, created_by, created_time, updated_by, updated_time, tenant_id, revision,
                               delete_flag)
VALUES (1479393590265384960, 6.381000, 2021, '', '2022-01-07 18:04:55', '', '2022-01-07 18:04:55', 'fii', 3, 0);

# 权限
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (111, '碳盘查', 'carbon_inventory', null);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (222, '报告查看', 'carbon_inventory:view', 111);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (333, '报告编辑', 'carbon_inventory:update', 111);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (444, '报告提交', 'carbon_inventory:submit', 111);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (555, '碳盘查管理', 'carbon_manager', null);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (666, '发起碳盘查', 'carbon_manager:start', 555);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (777, '修改截止时间', 'carbon_manager:update_deadline', 555);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (888, '查看报告', 'carbon_manager:view', 555);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (999, '组织信息', 'org_info', null);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (1111, '组织树（全）', 'org_info:org_structure', 999);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (1112, '动态', 'carbon_inventory:dynamic_message', 111);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (1113, '通知', 'carbon_inventory:notice', 111);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (2222, '账号与权限管理', 'org_info:authority', 999);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (3333, '新建账号', 'org_info:authority:new_account', 2222);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (4444, '编辑账号', 'org_info:authority:update_account', 2222);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (5551, '动态', 'carbon_manager:dynamic_message', 555);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (5552, '通知', 'carbon_manager:notice', 555);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (5555, '组织信息维护', 'org_info:info_maintenance', 999);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (6666, '编辑基础信息', 'org_info:info_maintenance:edit_basic_info', 5555);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (7777, '更新运营信息', 'org_info:info_maintenance:update_oper_info', 5555);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (9990, '基础信息（全）', 'org_info:base_info', 999);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (9991, '运营信息（全）', 'org_info:org_operation_info:all', 999);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (9992, '运营信息（自己+下属）', 'org_info:org_operation_info:sub', 999);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (9993, '运营信息（自己）', 'org_info:org_operation_info:self', 999);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (9994, '组织树（全）', 'carbon_manager:org_tree:all', 555);
INSERT INTO cec.sys_permission (id, permission_name, permission_code, parent_id)
VALUES (9995, '组织树（本组织+下属）', 'carbon_manager:org_tree:sub', 555);


# 角色
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (1, 555, 11);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (2, 666, 11);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (3, 777, 11);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (4, 888, 11);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (5, 999, 11);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (7, 2222, 11);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (8, 3333, 11);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (9, 4444, 11);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (10, 5555, 11);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (11, 6666, 11);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (12, 7777, 11);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (13, 555, 22);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (14, 888, 22);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (15, 999, 22);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (17, 555, 33);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (18, 888, 33);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (19, 999, 33);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (24, 555, 44);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (25, 888, 44);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (26, 999, 44);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (27, 2222, 44);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (28, 3333, 44);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (29, 4444, 44);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (30, 5555, 44);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (31, 6666, 44);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (32, 7777, 44);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (33, 555, 55);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (34, 888, 55);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (35, 999, 55);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (37, 555, 66);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (38, 888, 66);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (39, 999, 66);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (44, 111, 77);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (45, 222, 77);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (46, 333, 77);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (47, 444, 77);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (48, 999, 77);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (49, 2222, 77);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (50, 3333, 77);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (51, 4444, 77);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (52, 5555, 77);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (53, 6666, 77);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (54, 7777, 77);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (55, 111, 88);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (56, 222, 88);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (57, 333, 88);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (59, 444, 88);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (60, 999, 88);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (62, 555, 99);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (63, 888, 99);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (64, 999, 99);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (68, 9990, 11);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (69, 9990, 22);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (70, 9990, 33);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (71, 9990, 44);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (72, 9990, 55);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (73, 9990, 66);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (74, 9990, 77);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (75, 9990, 88);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (76, 9990, 99);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (77, 9991, 11);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (79, 9991, 33);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (80, 9992, 44);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (82, 9992, 66);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (83, 9993, 77);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (85, 9993, 99);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (86, 9994, 11);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (87, 9994, 22);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (88, 9994, 33);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (89, 9995, 44);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (90, 9995, 55);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (91, 9995, 66);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (92, 1111, 11);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (93, 1111, 22);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (94, 1111, 33);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (95, 1111, 44);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (96, 1111, 55);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (97, 1111, 66);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (98, 1111, 77);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (99, 1111, 88);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (100, 1111, 99);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (101, 5551, 11);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (102, 5551, 22);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (103, 5551, 33);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (104, 5551, 44);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (105, 5551, 55);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (106, 5551, 66);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (107, 5551, 99);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (108, 5552, 11);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (109, 5552, 22);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (110, 5552, 33);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (111, 5552, 99);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (112, 1112, 77);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (113, 1112, 88);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (114, 1113, 77);
INSERT INTO cec.sys_role_permission (id, permission_id, role_id)
VALUES (115, 1113, 88);

# 角色
INSERT INTO cec.sys_role (id, role_name, role_org_type)
VALUES (11, '管理员', 1);
INSERT INTO cec.sys_role (id, role_name, role_org_type)
VALUES (22, '用户', 1);
INSERT INTO cec.sys_role (id, role_name, role_org_type)
VALUES (33, '主管', 1);
INSERT INTO cec.sys_role (id, role_name, role_org_type)
VALUES (44, '管理员', 2);
INSERT INTO cec.sys_role (id, role_name, role_org_type)
VALUES (55, '用户', 2);
INSERT INTO cec.sys_role (id, role_name, role_org_type)
VALUES (66, '主管', 2);
INSERT INTO cec.sys_role (id, role_name, role_org_type)
VALUES (77, '管理员', 3);
INSERT INTO cec.sys_role (id, role_name, role_org_type)
VALUES (88, '用户', 3);
INSERT INTO cec.sys_role (id, role_name, role_org_type)
VALUES (99, '主管', 3);

## 用户角色
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1, 11111, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1481545726214410240, 1481545725996306432, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1481545992766623744, 1481545992724680704, 88);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1481546178792394752, 1481546178742063104, 88);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1481862985721974784, 1481862985617117184, 44);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1481900808336445440, 1481900808294502400, 22);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1482168079483015168, 1482168077759156224, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1482881351232393216, 1482881351152701440, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1482911390061694976, 1482911390023946240, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1483709720165486592, 1483709720098377728, 88);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1483988467254956032, 1483988467217207296, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1483988987755499520, 1483988987734528000, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1484056907558817792, 1484056907466543104, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1484339956993363968, 1484339956913672192, 66);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1485499720473382912, 1485499720406274048, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1485501628755873792, 1485501628730707968, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1485501854325542912, 1485501854300377088, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1485505619858427904, 1485505619829067776, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1485505880064659456, 1485505880043687936, 44);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1485506406592417792, 1485506406554669056, 44);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1485787396237824000, 1485787396162326528, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1485787527926386688, 1485787527892832256, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1485787600567537664, 1485787600533983232, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1490866898424958976, 1490866898341072896, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1490872548634791936, 1490872547317780480, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1491682453180518400, 1491682453117603840, 99);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1494135918251085824, 1490590134683439104, 88);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1496723793408823296, 1496723793341714432, 33);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1501829475330035712, 1501829475204206592, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1501830439621496832, 1501830439596331008, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1501835021927976960, 1501835021902811136, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1501845132478124032, 1501845132448763904, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1504323169006260224, 1481532236233838592, 88);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1506076440578363392, 1506076440511254528, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1514882912577785856, 1514882911676010496, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1514883128529915904, 1514883128458612736, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1514886138802868224, 1514886138710593536, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1514886224421195776, 1514886224383447040, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1514909970976608256, 1514909970087415808, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1514910447034306560, 1514910446992363520, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1514942793422868480, 1514942792525287424, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1514943054790922240, 1514943054748979200, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1514952260856188928, 1514952260826828800, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515338310585815040, 1515338310548066304, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515861994220163072, 1515861994111111168, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515863260442791936, 1515863260409237504, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515870007920300032, 1515870007878356992, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515875010852556800, 1515875009992724480, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515875303023579136, 1515875302998413312, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515875350016561152, 1515875349987201024, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515875386574114816, 1515875386548948992, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515875449908105216, 1515875449878745088, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515880969624752128, 1515880968613924864, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515881218099515392, 1515881218065960960, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515881345665077248, 1515881345635717120, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515881378649083904, 1515881378623918080, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515896510057943040, 1515896509118418944, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515896592840921088, 1515896592027226112, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515896722080010240, 1515896721291481088, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515896757119225856, 1515896756322308096, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515896813171904512, 1515896812379181056, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515957559696166912, 1515929961779826688, 88);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1515969874659250176, 1515969874629890048, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516241866151038976, 1516241865094074368, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516241898430402560, 1516241897478295552, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516241926301552640, 1516241925303308288, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516243867106676736, 1516243867047956480, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516259285074579456, 1516259285036830720, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516260578023313408, 1516260577004097536, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516260612764733440, 1516260611833597952, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516260640589746176, 1516260639633444864, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516260704158617600, 1516260703219093504, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516262831220199424, 1516262831199227904, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516262882151632896, 1516262882126467072, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516262929496936448, 1516262929471770624, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516262976653496320, 1516262976628330496, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516294365729918976, 1516294365662810112, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516309962299674624, 1516309962240954368, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516311703594340352, 1516311703564980224, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516312637468708864, 1516312637443543040, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516349783822962688, 1516349783739076608, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516362518824620032, 1516362518774288384, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1516586650933792768, 1516586650900238336, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1518976421752606720, 1518976421685497856, 44);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1519859015721553920, 1519859015608307712, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522031775612801024, 1522031774480338944, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522040646980997120, 1522040646859362304, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522049592814866432, 1522049591531409408, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522049824281726976, 1522049824223006720, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522049862739300352, 1522049862697357312, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522049922197753856, 1522049922155810816, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522106105663197184, 1522106105617059840, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522124428207591424, 1522124426508898304, 11);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522385699012218880, 1522385698894778368, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522396675254128640, 1522396675170242560, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522397863101992960, 1522397863047467008, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522400043968106496, 1522400039505367040, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522468872253476864, 1522468872169590784, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522506648793518080, 1522506648718020608, 44);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522516714993094656, 1522516714938568704, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522764372814991360, 1522764372735299584, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522776158444326912, 1522776158322692096, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522778321501425664, 1522778321451094016, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522778970150539264, 1522778970096013312, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522779819752951808, 1522779819694231552, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522780159189585920, 1522780159139254272, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522780506150801408, 1522780506092081152, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522781417002635264, 1522781416956497920, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522811215708033024, 1522811215561232384, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1522829920034754560, 1522829919959257088, 77);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1523319661377228800, 1523319661322702848, 44);
INSERT INTO cec.sys_user_role (id, user_id, role_id)
VALUES (1530109620922748928, 1530109620847251456, 77);

# 用户
INSERT INTO cec.sys_user (id, account_number, user_name, password, salt, org_id, created_by, created_time, updated_by,
                          updated_time, revision, delete_flag)
VALUES (1522049824223006720, 'admin', '管理员', 'b2042c185ac3d37c9b50b3b1bb1c3ec7b0f52f9b1106b5586257d6e2ef087092',
        'qHDeI964rO0cg3YsJ2w7', 1522069238142078976, '', '2022-05-05 11:05:31', '', '2022-05-05 11:05:31', 1, 0);
## 碳排因子
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953855631233024, '能源', '固定燃烧排放', '无烟煤', 'CO2e', 'AR4', 't', 't', 1.970000, 't/t', 0.000000, '', '',
        20908.000000, 'kJ/kg', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 27.400000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 94.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:40', '1514943054748979200',
        '2022-04-15 21:08:40', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953856012914688, '能源', '固定燃烧排放', '烟煤', 'CO2e', 'AR4', 't', 't', 1.860000, 't/t', 0.000000, '', '',
        20908.000000, 'kJ/kg', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 26.100000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 93.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:40', '1514943054748979200',
        '2022-04-15 21:08:40', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953856302321664, '能源', '固定燃烧排放', '褐煤', 'CO2e', 'AR4', 't', 't', 2.060000, 't/t', 0.000000, '', '',
        20908.000000, 'kJ/kg', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 28.000000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 96.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:40', '1514943054748979200',
        '2022-04-15 21:08:40', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953856591728640, '能源', '固定燃烧排放', '洗精煤', 'CO2e', 'AR4', 't', 't', 2.450000, 't/t', 0.000000, '', '',
        26344.000000, 'kJ/kg', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 25.410000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 100.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:41', '1514943054748979200',
        '2022-04-15 21:08:41', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953856868552704, '能源', '固定燃烧排放', '洗中煤', 'CO2e', 'AR4', 't', 't', 0.780000, 't/t', 0.000000, '', '',
        8363.000000, 'kJ/kg', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 25.410000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 100.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:41', '1514943054748979200',
        '2022-04-15 21:08:41', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953857145376768, '能源', '固定燃烧排放', '煤泥', 'CO2e', 'AR4', 't', 't', 1.170000, 't/t', 0.000000, '', '',
        12545.000000, 'kJ/kg', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 25.410000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 100.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:41', '1514943054748979200',
        '2022-04-15 21:08:41', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953857430589440, '能源', '固定燃烧排放', '焦炭', 'CO2e', 'AR4', 't', 't', 2.850000, 't/t', 0.000000, '', '',
        28435.000000, 'kJ/kg', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 29.420000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 93.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:41', '1514943054748979200',
        '2022-04-15 21:08:41', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953857833242624, '能源', '固定燃烧排放', '原油', 'CO2e', 'AR4', 't', 't', 3.020000, 't/t', 0.000000, '', '',
        41816.000000, 'kJ/kg', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 20.080000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 98.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:41', '1514943054748979200',
        '2022-04-15 21:08:41', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953858122649600, '能源', '固定燃烧排放', '燃料油', 'CO2e', 'AR4', 't', 't', 3.170000, 't/t', 0.000000, '', '',
        41816.000000, 'kJ/kg', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 21.100000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 98.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:41', '1514943054748979200',
        '2022-04-15 21:08:41', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953858391085056, '能源', '固定燃烧排放', '汽油', 'CO2e', 'AR4', 't', 't', 2.920000, 't/t', 775.000000, '',
        'GB 17930-2016 《车用汽油》', 43070.000000, 'kJ/kg', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',
        18.900000, 'tC/TJ', '《省级温室气体清单编制指南》', 98.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:41', '1514943054748979200',
        '2022-04-15 21:08:41', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953858667909120, '能源', '固定燃烧排放', '一般煤油', 'CO2e', 'AR4', 't', 't', 3.030000, 't/t', 840.000000, '',
        'GB 253-2008 《煤油》', 43070.000000, 'kJ/kg', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',
        19.600000, 'tC/TJ', '《省级温室气体清单编制指南》', 98.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:41', '1514943054748979200',
        '2022-04-15 21:08:41', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953858940538880, '能源', '固定燃烧排放', '柴油', 'CO2e', 'AR4', 't', 't', 3.100000, 't/t', 845.000000, '',
        'GB 19147-2016 《车用柴油》', 42652.000000, 'kJ/kg', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',
        20.200000, 'tC/TJ', '《省级温室气体清单编制指南》', 98.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:41', '1514943054748979200',
        '2022-04-15 21:08:41', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953859208974336, '能源', '固定燃烧排放', '液化天然气', 'CO2e', 'AR4', 't', 't', 2.580000, 't/t', 0.000000, '', '',
        46900.000000, 'kJ/kg', 'IPCC 第2 卷表1.2《缺省净发热值（NCVs）和95%置信区间的下限和上限》的上限值', 15.320000, 'tC/TJ', '《省级温室气体清单编制指南》',
        98.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:41', '1514943054748979200',
        '2022-04-15 21:08:41', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953859481604096, '能源', '固定燃烧排放', '液化石油气', 'CO2e', 'AR4', 't', 't', 3.100000, 't/t', 0.000000, '', '',
        50179.000000, 'kJ/kg', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 17.200000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 98.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:41', '1514943054748979200',
        '2022-04-15 21:08:41', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953859741650944, '能源', '固定燃烧排放', '炼厂干气', 'CO2e', 'AR4', 't', 't', 3.040000, 't/t', 0.000000, '', '',
        46055.000000, 'kJ/kg', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 18.200000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 99.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:41', '1514943054748979200',
        '2022-04-15 21:08:41', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953860010086400, '能源', '固定燃烧排放', '乙烷', 'CO2e', 'AR4', 't', 't', 3.280000, 't/t', 0.000000, '', '',
        48800.000000, 'kJ/kg', 'IPCC 第2 卷表1.2《缺省净发热值（NCVs）和95%置信区间的下限和上限》的上限值', 18.700000, 'tC/TJ',
        'IPCC 第2 卷表1.3《碳含量的缺省值》的上限值', 98.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:41', '1514943054748979200',
        '2022-04-15 21:08:41', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953860303687680, '能源', '固定燃烧排放', '沥青', 'CO2e', 'AR4', 't', 't', 3.260000, 't/t', 0.000000, '', '',
        41200.000000, 'kJ/kg', 'IPCC 第2 卷表1.2《缺省净发热值（NCVs）和95%置信区间的下限和上限》的上限值', 22.000000, 'tC/TJ', '《省级温室气体清单编制指南》',
        98.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:41', '1514943054748979200',
        '2022-04-15 21:08:41', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953860572123136, '能源', '固定燃烧排放', '润滑油', 'CO2e', 'AR4', 't', 't', 3.040000, 't/t', 0.000000, '', '',
        42300.000000, 'kJ/kg', 'IPCC 第2 卷表1.2《缺省净发热值（NCVs）和95%置信区间的下限和上限》的上限值', 20.000000, 'tC/TJ', '《省级温室气体清单编制指南》',
        98.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:42', '1514943054748979200',
        '2022-04-15 21:08:42', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953860848947200, '能源', '固定燃烧排放', '石油焦', 'CO2e', 'AR4', 't', 't', 4.140000, 't/t', 0.000000, '', '',
        41900.000000, 'kJ/kg', 'IPCC 第2 卷表1.2《缺省净发热值（NCVs）和95%置信区间的下限和上限》的上限值', 27.500000, 'tC/TJ', '《省级温室气体清单编制指南》',
        98.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:42', '1514943054748979200',
        '2022-04-15 21:08:42', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953861121576960, '能源', '固定燃烧排放', '天然气', 'CO2e', 'AR4', 't', 'm³', 0.002200, 't/m³', 0.000000, '', '',
        38931.000000, 'kJ/m3', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 15.320000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 99.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:42', '1514943054748979200',
        '2022-04-15 21:08:42', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953861390012416, '能源', '固定燃烧排放', '焦炉煤气', 'CO2e', 'AR4', 't', 'm³', 0.000890, 't/m³', 0.000000, '', '',
        17981.000000, 'kJ/m3', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 13.580000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 99.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:42', '1514943054748979200',
        '2022-04-15 21:08:42', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953861654253568, '能源', '固定燃烧排放', '高炉煤气', 'CO2e', 'AR4', 't', 'm³', 0.000170, 't/m³', 0.000000, '', '',
        3763.000000, 'kJ/m3', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 12.200000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 99.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:42', '1514943054748979200',
        '2022-04-15 21:08:42', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953861922689024, '能源', '固定燃烧排放', '发生炉煤气', 'CO2e', 'AR4', 't', 'm³', 0.000230, 't/m³', 0.000000, '', '',
        5227.000000, 'kJ/m3', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 12.200000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 99.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:42', '1514943054748979200',
        '2022-04-15 21:08:42', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953862316953600, '能源', '固定燃烧排放', '重油催化裂解煤气', 'CO2e', 'AR4', 't', 'm³', 0.000850, 't/m³', 0.000000, '', '',
        19235.000000, 'kJ/m3', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 12.200000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 99.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:42', '1514943054748979200',
        '2022-04-15 21:08:42', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953862585389056, '能源', '固定燃烧排放', '重油热裂解煤气', 'CO2e', 'AR4', 't', 'm³', 0.001600, 't/m³', 0.000000, '', '',
        35544.000000, 'kJ/m3', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 12.200000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 99.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:42', '1514943054748979200',
        '2022-04-15 21:08:42', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953862849630208, '能源', '固定燃烧排放', '焦炭制气', 'CO2e', 'AR4', 't', 'm³', 0.000720, 't/m³', 0.000000, '', '',
        16308.000000, 'kJ/m3', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 12.200000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 99.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:42', '1514943054748979200',
        '2022-04-15 21:08:42', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953863113871360, '能源', '固定燃烧排放', '压力水化煤气', 'CO2e', 'AR4', 't', 'm³', 0.000670, 't/m³', 0.000000, '', '',
        15054.000000, 'kJ/m3', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 12.200000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 99.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:42', '1514943054748979200',
        '2022-04-15 21:08:42', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953863445221376, '能源', '固定燃烧排放', '水煤气', 'CO2e', 'AR4', 't', 'm³', 0.000460, 't/m³', 0.000000, '', '',
        10454.000000, 'kJ/m3', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 12.200000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 99.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '', 2018, 3, '1514943054748979200', '2022-04-15 21:08:42', '1514943054748979200',
        '2022-04-15 21:08:42', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953863713656832, '能源', null, '压缩天然气', 'CO2e', 'AR4', 'kg', 't', 2542.040000, 'kg/t', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:42', '1514943054748979200', '2022-04-15 21:08:42', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953863977897984, '能源', null, '液化天然气', 'CO2e', 'AR4', 'kg', 'L', 1.153870, 'kg/L', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:42', '1514943054748979200', '2022-04-15 21:08:42', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953864246333440, '能源', null, '液化石油气', 'CO2e', 'AR4', 'kg', 'kWh', 0.230290, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:42', '1514943054748979200', '2022-04-15 21:08:42', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953864510574592, '能源', null, '天然气', 'CO2e', 'AR4', 'kg', 'kWh', 0.183850, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:42', '1514943054748979200', '2022-04-15 21:08:42', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953864779010048, '能源', null, '矿物柴油', 'CO2e', 'AR4', 'kg', 'L', 2.686970, 'kg/L', 0.000000, '', '', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3, '1514943054748979200',
        '2022-04-15 21:08:43', '1514943054748979200', '2022-04-15 21:08:43', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953865043251200, '能源', null, '燃料油', 'CO2e', 'AR4', 'kg', 'L', 3.177990, 'kg/L', 0.000000, '', '', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3, '1514943054748979200',
        '2022-04-15 21:08:43', '1514943054748979200', '2022-04-15 21:08:43', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953865311686656, '能源', null, '矿物汽油', 'CO2e', 'AR4', 'kg', 'L', 2.314950, 'kg/L', 0.000000, '', '', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3, '1514943054748979200',
        '2022-04-15 21:08:43', '1514943054748979200', '2022-04-15 21:08:43', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953865588510720, '能源', null, '汽油（生物燃料混合物）', 'CO2e', 'AR4', 'kg', 'L', 2.209040, 'kg/L', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:43', '1514943054748979200', '2022-04-15 21:08:43', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953865861140480, '能源', null, '瓦斯油', 'CO2e', 'AR4', 'kg', 'L', 2.758210, 'kg/L', 0.000000, '', '', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3, '1514943054748979200',
        '2022-04-15 21:08:43', '1514943054748979200', '2022-04-15 21:08:43', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953866133770240, '能源', null, '柴油（生物燃料混合物）', 'CO2e', 'AR4', 'kg', 'L', 2.594110, 'kg/L', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:43', '1514943054748979200', '2022-04-15 21:08:43', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953866406400000, '能源', null, '石油焦炭', 'CO2e', 'AR4', 'kg', 't', 3393.760000, 'kg/t', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:43', '1514943054748979200', '2022-04-15 21:08:43', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953866804858880, '能源', null, '焦炭', 'CO2e', 'AR4', 'kg', 't', 3094.600000, 'kg/t', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:43', '1514943054748979200', '2022-04-15 21:08:43', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953867069100032, '运输', '里程·重量', '乘用车-汽油', 'CO2e', 'AR4', 'kg', 'km', 0.256800, 'kg/km', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:43', '1514943054748979200', '2022-04-15 21:08:43', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953867354312704, '运输', '里程·重量', '乘用车-柴油', 'CO2e', 'AR4', 'kg', 'km', 0.173360, 'kg/km', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:43', '1514943054748979200', '2022-04-15 21:08:43', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953867618553856, '运输', '里程·重量', '重型货车/铰接式货车-柴油', 'CO2e', 'AR4', 'kg', 't km', 0.113600, 'kg/t km', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'DEFRA 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:43', '1514943054748979200', '2022-04-15 21:08:43', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953867899572224, '运输', '里程·重量', '重型货车/未铰接货车（总重3.5-7.5t）-柴油', 'CO2e', 'AR4', 'kg', 't km', 0.486740,
        'kg/t km', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '',
        '英国环境、食品和农村事务部(Defra)-2019', 2018, 3, '1514943054748979200', '2022-04-15 21:08:43', '1514943054748979200',
        '2022-04-15 21:08:43', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953868163813376, '运输', '里程·重量', '轻型货车(平均载重量<1.25t)-汽油', 'CO2e', 'AR4', 'kg', 't km', 0.811500, 'kg/t km',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'DEFRA 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:43', '1514943054748979200', '2022-04-15 21:08:43', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953868432248832, '运输', '里程·重量', '轻型货车-柴油', 'CO2e', 'AR4', 'kg', 't km', 0.256800, 'kg/t km', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:43', '1514943054748979200', '2022-04-15 21:08:43', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953868704878592, '运输', '里程·重量', '航空货机', 'CO2e', 'AR4', 'kg', 't km', 5.833300, 'kg/t km', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2020', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:43', '1514943054748979200', '2022-04-15 21:08:43', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953868964925440, '运输', '里程·重量', '海运货船', 'CO2e', 'AR4', 'kg', 't km', 0.016142, 'kg/t km', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2021', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:44', '1514943054748979200', '2022-04-15 21:08:44', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953869233360896, '能源', '移动燃烧排放', '汽油', 'CO2e', 'AR4', 't', 't', 2.920000, 't/t', 775.000000, '',
        'GB 17930-2016 《车用汽油》', 43070.000000, 'kJ/kg', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',
        18.900000, 'tC/TJ', '《省级温室气体清单编制指南》', 98.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '英国环境、食品和农村事务部(Defra)-2022', 2018, 3, '1514943054748979200', '2022-04-15 21:08:44',
        '1514943054748979200', '2022-04-15 21:08:44', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953869497602048, '能源', '移动燃烧排放', '喷气煤油', 'CO2e', 'AR4', 't', 't', 3.020000, 't/t', 840.000000, '',
        'GB 253-2008 《煤油》', 43070.000000, 'kJ/kg', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',
        19.500000, 'tC/TJ', '《省级温室气体清单编制指南》', 98.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '英国环境、食品和农村事务部(Defra)-2023', 2018, 3, '1514943054748979200', '2022-04-15 21:08:44',
        '1514943054748979200', '2022-04-15 21:08:44', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953869766037504, '能源', '移动燃烧排放', '柴油', 'CO2e', 'AR4', 't', 't', 3.100000, 't/t', 845.000000, '',
        'GB 19147-2016 《车用柴油》', 42652.000000, 'kJ/kg', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',
        20.200000, 'tC/TJ', '《省级温室气体清单编制指南》', 98.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '英国环境、食品和农村事务部(Defra)-2024', 2018, 3, '1514943054748979200', '2022-04-15 21:08:44',
        '1514943054748979200', '2022-04-15 21:08:44', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953870034472960, '能源', '移动燃烧排放', '液化石油气', 'CO2e', 'AR4', 't', 't', 3.100000, 't/t', 0.000000, '', '',
        50179.000000, 'kJ/kg', 'GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值', 17.200000, 'tC/TJ',
        '《省级温室气体清单编制指南》', 98.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '英国环境、食品和农村事务部(Defra)-2025', 2018, 3, '1514943054748979200', '2022-04-15 21:08:44',
        '1514943054748979200', '2022-04-15 21:08:44', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953870298714112, '能源', '移动燃烧排放', '液化天然气', 'CO2e', 'AR4', 't', 't', 2.680000, 't/t', 0.000000, '', '',
        46900.000000, 'kJ/kg', 'IPCC 第2 卷表1.2《缺省净发热值（NCVs）和95％置信区间的下限和上限》的上限值', 15.900000, 'tC/TJ',
        '《2006 年IPCC 国家温室气体清单指南》第2 卷表3.2.1 《道路运输缺省CO2 排放因子和不确定性范围》', 98.000000, '《省级温
室气体清单编制指南》', '中国', '', '', '英国环境、食品和农村事务部(Defra)-2026', 2018, 3, '1514943054748979200', '2022-04-15 21:08:44',
        '1514943054748979200', '2022-04-15 21:08:44', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953870567149568, '外购电力', null, '中国华北电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.884300, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '华北', '', '中国气候变化信息网《2011 年和 2012 年中国区域电网平均二氧化碳排放因子》',
        2012, 3, '1514943054748979200', '2022-04-15 21:08:44', '1514943054748979200', '2022-04-15 21:08:44', 0, null,
        -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953870831390720, '外购电力', null, '中国东北电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.776900, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '东北', '', '中国气候变化信息网《2011 年和 2012 年中国区域电网平均二氧化碳排放因子》',
        2012, 3, '1514943054748979200', '2022-04-15 21:08:44', '1514943054748979200', '2022-04-15 21:08:44', 0, null,
        -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953871225655296, '外购电力', null, '中国华东电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.703500, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '华东', '', '中国气候变化信息网《2011 年和 2012 年中国区域电网平均二氧化碳排放因子》',
        2012, 3, '1514943054748979200', '2022-04-15 21:08:44', '1514943054748979200', '2022-04-15 21:08:44', 0, null,
        -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953871489896448, '外购电力', null, '中国华中电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.525700, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '华中', '', '中国气候变化信息网《2011 年和 2012 年中国区域电网平均二氧化碳排放因子》',
        2012, 3, '1514943054748979200', '2022-04-15 21:08:44', '1514943054748979200', '2022-04-15 21:08:44', 0, null,
        -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953871758331904, '外购电力', null, '中国西北电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.667100, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '西北', '', '中国气候变化信息网《2011 年和 2012 年中国区域电网平均二氧化碳排放因子》',
        2012, 3, '1514943054748979200', '2022-04-15 21:08:44', '1514943054748979200', '2022-04-15 21:08:44', 0, null,
        -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953872026767360, '外购电力', null, '中国南方电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.527100, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '南方', '', '中国气候变化信息网《2011 年和 2012 年中国区域电网平均二氧化碳排放因子》',
        2012, 3, '1514943054748979200', '2022-04-15 21:08:44', '1514943054748979200', '2022-04-15 21:08:44', 0, null,
        -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953872311980032, '外购电力', null, '全球平均电力', 'CO2e', 'AR4', 'kg', 'kWh', 0.520000, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '全球', '', '', '国际能源署（IEA）-2011', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:44', '1514943054748979200', '2022-04-15 21:08:44', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953872580415488, '外购电力', null, '巴西电网', 'CO2e', 'AR4', 'g', 'kWh', 99.800000, 'g/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '巴西', '', '', '国际能源署（IEA）-2020', 2020, 3,
        '1514943054748979200', '2022-04-15 21:08:44', '1514943054748979200', '2022-04-15 21:08:44', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953872844656640, '外购电力', null, '中国平均电力', 'CO2e', 'AR4', 'g', 'kWh', 616.000000, 'g/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '', '国际能源署（IEA）-2020', 2020, 3,
        '1514943054748979200', '2022-04-15 21:08:44', '1514943054748979200', '2022-04-15 21:08:44', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953873108897792, '外购电力', null, '中国平均电力', 'CO2e', 'AR4', 't', 'MWh', 0.583900, 't/MWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '', '中国生态环境部《企业温室气体排放核算方法与报告指南 发电设施（2021年修订版）》',
        2021, 3, '1514943054748979200', '2022-04-15 21:08:44', '1514943054748979200', '2022-04-15 21:08:44', 0, null,
        -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953873377333248, '外购电力', null, '捷克共和国', 'CO2e', 'AR4', 'g', 'kWh', 495.600000, 'g/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '捷克共和国', '', '', '国际能源署（IEA）-2020', 2020, 3,
        '1514943054748979200', '2022-04-15 21:08:45', '1514943054748979200', '2022-04-15 21:08:45', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953873645768704, '外购电力', null, '匈牙利电网', 'CO2e', 'AR4', 'g', 'kWh', 253.900000, 'g/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '匈牙利', '', '', '国际能源署（IEA）-2020', 2020, 3,
        '1514943054748979200', '2022-04-15 21:08:45', '1514943054748979200', '2022-04-15 21:08:45', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953873918398464, '外购电力', null, '印度电网', 'CO2e', 'AR4', 'g', 'kWh', 751.900000, 'g/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '印度', '', '', '国际能源署（IEA）-2020', 2020, 3,
        '1514943054748979200', '2022-04-15 21:08:45', '1514943054748979200', '2022-04-15 21:08:45', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953874186833920, '外购电力', null, '墨西哥电网', 'CO2e', 'AR4', 'g', 'kWh', 456.300000, 'g/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '墨西哥', '', '', '国际能源署（IEA）-2020', 2020, 3,
        '1514943054748979200', '2022-04-15 21:08:45', '1514943054748979200', '2022-04-15 21:08:45', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953874451075072, '外购电力', null, '新加坡电网', 'CO2e', 'AR4', 'g', 'kWh', 389.100000, 'g/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '新加坡', '', '', '国际能源署（IEA）-2020', 2020, 3,
        '1514943054748979200', '2022-04-15 21:08:45', '1514943054748979200', '2022-04-15 21:08:45', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953874719510528, '外购电力', null, '中国台湾电力', 'CO2e', 'AR4', 'g', 'kWh', 559.000000, 'g/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '台湾', '', '国际能源署（IEA）-2020', 2020, 3,
        '1514943054748979200', '2022-04-15 21:08:45', '1514943054748979200', '2022-04-15 21:08:45', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953874983751680, '外购电力', null, '美国AKGD电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.473987, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:45', '1514943054748979200', '2022-04-15 21:08:45', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953875260575744, '外购电力', null, '美国AKMS电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.238986, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:45', '1514943054748979200', '2022-04-15 21:08:45', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953875654840320, '外购电力', null, '美国AZNM电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.466092, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:45', '1514943054748979200', '2022-04-15 21:08:45', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953875914887168, '外购电力', null, '美国CAMX电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.226151, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:45', '1514943054748979200', '2022-04-15 21:08:45', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953876179128320, '外购电力', null, '美国ERCT电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.424564, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:45', '1514943054748979200', '2022-04-15 21:08:45', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953876443369472, '外购电力', null, '美国FRCC电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.424641, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:45', '1514943054748979200', '2022-04-15 21:08:45', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953876707610624, '外购电力', null, '美国HIMS电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.507571, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:45', '1514943054748979200', '2022-04-15 21:08:45', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953876971851776, '外购电力', null, '美国HIOA电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.763164, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:45', '1514943054748979200', '2022-04-15 21:08:45', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953877240287232, '外购电力', null, '美国MROE电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.766431, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:45', '1514943054748979200', '2022-04-15 21:08:45', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953877504528384, '外购电力', null, '美国MROW电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.566654, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:46', '1514943054748979200', '2022-04-15 21:08:46', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953877772963840, '外购电力', null, '美国NEWE电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.239333, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:46', '1514943054748979200', '2022-04-15 21:08:46', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953878041399296, '外购电力', null, '美国NWPP电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.291805, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:46', '1514943054748979200', '2022-04-15 21:08:46', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953878305640448, '外购电力', null, '美国NYCW电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.271184, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:46', '1514943054748979200', '2022-04-15 21:08:46', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953878569881600, '外购电力', null, '美国NYLI电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.541172, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:46', '1514943054748979200', '2022-04-15 21:08:46', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953878842511360, '外购电力', null, '美国NYUP电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.115284, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:46', '1514943054748979200', '2022-04-15 21:08:46', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953879110946816, '外购电力', null, '美国RFCE电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.326530, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:46', '1514943054748979200', '2022-04-15 21:08:46', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953879379382272, '外购电力', null, '美国RFCM电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.599263, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:46', '1514943054748979200', '2022-04-15 21:08:46', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953879643623424, '外购电力', null, '美国RFCW电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.532557, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:46', '1514943054748979200', '2022-04-15 21:08:46', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953880033693696, '外购电力', null, '美国RMPA电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.581530, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:46', '1514943054748979200', '2022-04-15 21:08:46', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953880297934848, '外购电力', null, '美国SPNO电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.531452, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:46', '1514943054748979200', '2022-04-15 21:08:46', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953880557981696, '外购电力', null, '美国SPSO电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.531942, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:46', '1514943054748979200', '2022-04-15 21:08:46', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953880830611456, '外购电力', null, '美国SRMV电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.389366, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:46', '1514943054748979200', '2022-04-15 21:08:46', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953881103241216, '外购电力', null, '美国SRMW电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.760593, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:46', '1514943054748979200', '2022-04-15 21:08:46', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953881371676672, '外购电力', null, '美国SRSO电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.468801, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:46', '1514943054748979200', '2022-04-15 21:08:46', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953881648500736, '外购电力', null, '美国SRTV电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.470890, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:47', '1514943054748979200', '2022-04-15 21:08:47', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953881925324800, '外购电力', null, '美国SRVC电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.339144, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:47', '1514943054748979200', '2022-04-15 21:08:47', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953882210537472, '外购电力', null, '美国平均电力', 'CO2e', 'AR4', 'kg', 'kWh', 0.432220, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:47', '1514943054748979200', '2022-04-15 21:08:47', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953882478972928, '外购电力', null, '美国AKGD电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.473934, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:47', '1514943054748979200', '2022-04-15 21:08:47', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953882743214080, '外购电力', null, '美国AKMS电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.238959, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:47', '1514943054748979200', '2022-04-15 21:08:47', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953883011649536, '外购电力', null, '美国AZNM电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.466033, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:47', '1514943054748979200', '2022-04-15 21:08:47', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953883280084992, '外购电力', null, '美国CAMX电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.226138, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:47', '1514943054748979200', '2022-04-15 21:08:47', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953883548520448, '外购电力', null, '美国ERCT电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.424519, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:47', '1514943054748979200', '2022-04-15 21:08:47', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953883812761600, '外购电力', null, '美国FRCC电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.424596, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:47', '1514943054748979200', '2022-04-15 21:08:47', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953884077002752, '外购电力', null, '美国HIMS电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.507462, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:47', '1514943054748979200', '2022-04-15 21:08:47', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953884471267328, '外购电力', null, '美国HIOA电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.763005, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:47', '1514943054748979200', '2022-04-15 21:08:47', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953884739702784, '外购电力', null, '美国MROE电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.766287, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:47', '1514943054748979200', '2022-04-15 21:08:47', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953885008138240, '外购电力', null, '美国MROW电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.566542, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:47', '1514943054748979200', '2022-04-15 21:08:47', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953885272379392, '外购电力', null, '美国NEWE电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.239280, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:47', '1514943054748979200', '2022-04-15 21:08:47', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953885536620544, '外购电力', null, '美国NWPP电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.291757, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:47', '1514943054748979200', '2022-04-15 21:08:47', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953885805056000, '外购电力', null, '美国NYCW电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.271169, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:48', '1514943054748979200', '2022-04-15 21:08:48', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953886065102848, '外购电力', null, '美国NYLI电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.541092, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:48', '1514943054748979200', '2022-04-15 21:08:48', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953886329344000, '外购电力', null, '美国NYUP电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.115279, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:48', '1514943054748979200', '2022-04-15 21:08:48', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953886593585152, '外购电力', null, '美国RFCE电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.326493, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:48', '1514943054748979200', '2022-04-15 21:08:48', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953886853632000, '外购电力', null, '美国RFCM电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.599169, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:48', '1514943054748979200', '2022-04-15 21:08:48', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953887117873152, '外购电力', null, '美国RFCW电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.532462, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:48', '1514943054748979200', '2022-04-15 21:08:48', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953887386308608, '外购电力', null, '美国RMPA电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.581428, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:48', '1514943054748979200', '2022-04-15 21:08:48', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953887650549760, '外购电力', null, '美国SPNO电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.531351, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:48', '1514943054748979200', '2022-04-15 21:08:48', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953887914790912, '外购电力', null, '美国SPSO电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.531871, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:48', '1514943054748979200', '2022-04-15 21:08:48', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953888183226368, '外购电力', null, '美国SRMV电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.389321, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:48', '1514943054748979200', '2022-04-15 21:08:48', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953888451661824, '外购电力', null, '美国SRMW电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.760441, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:48', '1514943054748979200', '2022-04-15 21:08:48', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953888841732096, '外购电力', null, '美国SRSO电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.468731, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:48', '1514943054748979200', '2022-04-15 21:08:48', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953889105973248, '外购电力', null, '美国SRTV电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.470812, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:48', '1514943054748979200', '2022-04-15 21:08:48', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953889374408704, '外购电力', null, '美国SRVC电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.339101, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:48', '1514943054748979200', '2022-04-15 21:08:48', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953889655427072, '外购电力', null, '美国平均电力', 'CO2e', 'AR5', 'kg', 'kWh', 0.432157, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:48', '1514943054748979200', '2022-04-15 21:08:48', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953889928056832, '外购电力', null, '加拿大平均电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.130000, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:48', '1514943054748979200', '2022-04-15 21:08:48', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953890192297984, '外购电力', null, '加拿大-纽芬兰与拉布拉多电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.040313, 'kg/kWh', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '纽芬兰与拉布拉多', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:49', '1514943054748979200', '2022-04-15 21:08:49', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953890452344832, '外购电力', null, '加拿大-爱德华王子岛电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.014072, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '爱德华王子岛', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:49', '1514943054748979200', '2022-04-15 21:08:49', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953890716585984, '外购电力', null, '加拿大-新斯科舍电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.673730, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '新斯科舍', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:49', '1514943054748979200', '2022-04-15 21:08:49', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953890980827136, '外购电力', null, '加拿大-新不伦瑞克省电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.311692, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '新不伦瑞克省', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:49', '1514943054748979200', '2022-04-15 21:08:49', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953891245068288, '外购电力', null, '加拿大-魁北克电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.001230, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '魁北克', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:49', '1514943054748979200', '2022-04-15 21:08:49', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953891505115136, '外购电力', null, '加拿大-安大略省电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.017298, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '安大略省', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:49', '1514943054748979200', '2022-04-15 21:08:49', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953891781939200, '外购电力', null, '加拿大-马尼托巴湖电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.001932, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '马尼托巴湖', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:49', '1514943054748979200', '2022-04-15 21:08:49', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953892050374656, '外购电力', null, '加拿大- 萨斯喀彻温省电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.657210, 'kg/kWh', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '萨斯喀彻温省', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:49', '1514943054748979200', '2022-04-15 21:08:49', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953892314615808, '外购电力', null, '加拿大-亚伯达电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.753980, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '亚伯达', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:49', '1514943054748979200', '2022-04-15 21:08:49', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953892583051264, '外购电力', null, '加拿大-不列颠哥伦比亚电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.009284, 'kg/kWh', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '不列颠哥伦比亚', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:49', '1514943054748979200', '2022-04-15 21:08:49', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953892847292416, '外购电力', null, '加拿大-育空电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.051080, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '育空', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:49', '1514943054748979200', '2022-04-15 21:08:49', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953893237362688, '外购电力', null, '加拿大-西北地区和努纳武特电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.176210, 'kg/kWh', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '西北地区和努纳武特', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:49', '1514943054748979200', '2022-04-15 21:08:49', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953893501603840, '外购电力', null, '加拿大平均电力', 'CO2e', 'AR5', 'kg', 'kWh', 0.130000, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:49', '1514943054748979200', '2022-04-15 21:08:49', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953893770039296, '外购电力', null, '加拿大-纽芬兰与拉布拉多电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.040282, 'kg/kWh', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '纽芬兰与拉布拉多', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:49', '1514943054748979200', '2022-04-15 21:08:49', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953894030086144, '外购电力', null, '加拿大-爱德华王子岛电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.014067, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '爱德华王子岛', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:49', '1514943054748979200', '2022-04-15 21:08:49', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953894298521600, '外购电力', null, '加拿大-新斯科舍电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.673490, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '新斯科舍', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:50', '1514943054748979200', '2022-04-15 21:08:50', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953894566957056, '外购电力', null, '加拿大-新不伦瑞克省电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.311620, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '新不伦瑞克省', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:50', '1514943054748979200', '2022-04-15 21:08:50', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953894827003904, '外购电力', null, '加拿大-魁北克电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.001226, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '魁北克', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:50', '1514943054748979200', '2022-04-15 21:08:50', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953895091245056, '外购电力', null, '加拿大-安大略省电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.017265, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '安大略省', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:50', '1514943054748979200', '2022-04-15 21:08:50', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953895355486208, '外购电力', null, '加拿大-马尼托巴湖电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.001929, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '马尼托巴湖', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:50', '1514943054748979200', '2022-04-15 21:08:50', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953895615533056, '外购电力', null, '加拿大- 萨斯喀彻温省电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.656700, 'kg/kWh', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '萨斯喀彻温省', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:50', '1514943054748979200', '2022-04-15 21:08:50', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953895879774208, '外购电力', null, '加拿大-亚伯达电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.753770, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '亚伯达', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:50', '1514943054748979200', '2022-04-15 21:08:50', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953896139821056, '外购电力', null, '加拿大-不列颠哥伦比亚电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.009270, 'kg/kWh', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '不列颠哥伦比亚', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:50', '1514943054748979200', '2022-04-15 21:08:50', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953896408256512, '外购电力', null, '加拿大-育空电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.050762, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '育空', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:50', '1514943054748979200', '2022-04-15 21:08:50', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953896668303360, '外购电力', null, '加拿大-西北地区和努纳武特电网', 'CO2e', 'AR5', 'kg', 'kWh', 0.175580, 'kg/kWh', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '加拿大', '西北地区和努纳武特', '', 'Canada NIR 2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:50', '1514943054748979200', '2022-04-15 21:08:50', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953896928350208, '外购电力', null, '澳大利亚新南威尔士州和首都领地电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.810000, 'kg/kWh',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '澳大利亚', '新南威尔士州和首都领地', '',
        '澳大利亚环境与能源部-2019', 2019, 3, '1514943054748979200', '2022-04-15 21:08:50', '1514943054748979200',
        '2022-04-15 21:08:50', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953897192591360, '外购电力', null, '澳大利亚维多利亚州电网', 'CO2e', 'AR4', 'kg', 'kWh', 1.020000, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '澳大利亚', '维多利亚州', '', '澳大利亚环境与能源部-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:50', '1514943054748979200', '2022-04-15 21:08:50', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953897586855936, '外购电力', null, '澳大利亚昆士兰电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.810000, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '澳大利亚', '昆士兰', '', '澳大利亚环境与能源部-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:50', '1514943054748979200', '2022-04-15 21:08:50', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953897846902784, '外购电力', null, '澳大利亚南澳大利亚州电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.440000, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '澳大利亚', '南澳大利亚州', '', '澳大利亚环境与能源部-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:50', '1514943054748979200', '2022-04-15 21:08:50', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953898106949632, '外购电力', null, '澳大利亚西澳大利亚州SWIS电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.690000, 'kg/kWh', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '澳大利亚', '西澳大利亚州SWIS', '', '澳大利亚环境与能源部-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:50', '1514943054748979200', '2022-04-15 21:08:50', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953898379579392, '外购电力', null, '澳大利亚塔斯马尼亚岛电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.150000, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '澳大利亚', '塔斯马尼亚岛', '', '澳大利亚环境与能源部-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:51', '1514943054748979200', '2022-04-15 21:08:51', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953898643820544, '外购电力', null, '澳大利亚北领地电网', 'CO2e', 'AR4', 'kg', 'kWh', 0.630000, 'kg/kWh', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '澳大利亚', '北领地', '', '澳大利亚环境与能源部-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:51', '1514943054748979200', '2022-04-15 21:08:51', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953898908061696, '外购热能', null, '平均热能排放', 'CO2e', 'AR4', 'kg', 'kWh', 0.176060, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '全球', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:51', '1514943054748979200', '2022-04-15 21:08:51', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953899172302848, '外购热能', null, '平均热能排放', 'CO3e', 'AR5', 'kg', 'mmBTU', 66.398500, 'kg/mmBTU', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '全球', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:51', '1514943054748979200', '2022-04-15 21:08:51', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953899436544000, '外购热能', null, '热能-北京', 'CO2e', 'AR4', 't', 'GJ', 0.100427, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '北京', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:51', '1514943054748979200', '2022-04-15 21:08:51', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953899704979456, '外购热能', null, '热能-天津', 'CO2e', 'AR4', 't', 'GJ', 0.110557, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '天津', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:51', '1514943054748979200', '2022-04-15 21:08:51', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953899969220608, '外购热能', null, '热能-河北', 'CO2e', 'AR4', 't', 'GJ', 0.190557, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '河北', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:51', '1514943054748979200', '2022-04-15 21:08:51', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953900233461760, '外购热能', null, '热能-山西', 'CO2e', 'AR4', 't', 'GJ', 0.140606, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '山西', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:51', '1514943054748979200', '2022-04-15 21:08:51', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953900497702912, '外购热能', null, '热能-内蒙古', 'CO2e', 'AR4', 't', 'GJ', 0.170813, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '内蒙古', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:51', '1514943054748979200', '2022-04-15 21:08:51', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953900761944064, '外购热能', null, '热能-辽宁', 'CO2e', 'AR4', 't', 'GJ', 0.150632, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '辽宁', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:51', '1514943054748979200', '2022-04-15 21:08:51', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953901026185216, '外购热能', null, '热能-吉林', 'CO2e', 'AR4', 't', 'GJ', 0.130659, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '吉林', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:51', '1514943054748979200', '2022-04-15 21:08:51', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953901294620672, '外购热能', null, '热能-黑龙江', 'CO2e', 'AR4', 't', 'GJ', 0.170732, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '黑龙江', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:51', '1514943054748979200', '2022-04-15 21:08:51', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953901554667520, '外购热能', null, '热能-上海', 'CO2e', 'AR4', 't', 'GJ', 0.100469, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '上海', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:51', '1514943054748979200', '2022-04-15 21:08:51', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953901940543488, '外购热能', null, '热能-江苏', 'CO2e', 'AR4', 't', 'GJ', 0.110526, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '江苏', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:51', '1514943054748979200', '2022-04-15 21:08:51', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953902204784640, '外购热能', null, '热能-浙江', 'CO2e', 'AR4', 't', 'GJ', 0.120630, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '浙江', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:51', '1514943054748979200', '2022-04-15 21:08:51', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953902469025792, '外购热能', null, '热能-安徽', 'CO2e', 'AR4', 't', 'GJ', 0.110514, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '安徽', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:51', '1514943054748979200', '2022-04-15 21:08:51', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953902733266944, '外购热能', null, '热能-福建', 'CO2e', 'AR4', 't', 'GJ', 0.130493, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '福建', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:52', '1514943054748979200', '2022-04-15 21:08:52', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953902997508096, '外购热能', null, '热能-江西', 'CO2e', 'AR4', 't', 'GJ', 0.150674, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '江西', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:52', '1514943054748979200', '2022-04-15 21:08:52', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953903257554944, '外购热能', null, '热能-山东', 'CO2e', 'AR4', 't', 'GJ', 0.120572, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '山东', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:52', '1514943054748979200', '2022-04-15 21:08:52', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953903517601792, '外购热能', null, '热能-河南', 'CO2e', 'AR4', 't', 'GJ', 0.130650, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '河南', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:52', '1514943054748979200', '2022-04-15 21:08:52', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953903777648640, '外购热能', null, '热能-湖北', 'CO2e', 'AR4', 't', 'GJ', 0.160552, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '湖北', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:52', '1514943054748979200', '2022-04-15 21:08:52', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953904037695488, '外购热能', null, '热能-湖南', 'CO2e', 'AR4', 't', 'GJ', 0.130508, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '湖南', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:52', '1514943054748979200', '2022-04-15 21:08:52', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953904297742336, '外购热能', null, '热能-广东', 'CO2e', 'AR4', 't', 'GJ', 0.110503, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '广东', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:52', '1514943054748979200', '2022-04-15 21:08:52', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953904557789184, '外购热能', null, '热能-广西', 'CO2e', 'AR4', 't', 'GJ', 0.170821, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '广西', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:52', '1514943054748979200', '2022-04-15 21:08:52', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953904834613248, '外购热能', null, '热能-海南', 'CO2e', 'AR4', 't', 'GJ', 0.030028, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '海南', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:52', '1514943054748979200', '2022-04-15 21:08:52', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953905094660096, '外购热能', null, '热能-重庆', 'CO2e', 'AR4', 't', 'GJ', 0.130655, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '重庆', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:52', '1514943054748979200', '2022-04-15 21:08:52', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953905363095552, '外购热能', null, '热能-四川', 'CO2e', 'AR4', 't', 'GJ', 0.150528, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '四川', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:52', '1514943054748979200', '2022-04-15 21:08:52', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953905648308224, '外购热能', null, '热能-贵州', 'CO2e', 'AR4', 't', 'GJ', 0.150752, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '贵州', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:52', '1514943054748979200', '2022-04-15 21:08:52', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953905912549376, '外购热能', null, '热能-云南', 'CO2e', 'AR4', 't', 'GJ', 0.180878, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '云南', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:52', '1514943054748979200', '2022-04-15 21:08:52', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953906306813952, '外购热能', null, '热能-陕西', 'CO2e', 'AR4', 't', 'GJ', 0.130624, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '陕西', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:52', '1514943054748979200', '2022-04-15 21:08:52', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953906579443712, '外购热能', null, '热能-甘肃', 'CO2e', 'AR4', 't', 'GJ', 0.120542, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '甘肃', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:52', '1514943054748979200', '2022-04-15 21:08:52', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953906843684864, '外购热能', null, '热能-青海', 'CO2e', 'AR4', 't', 'GJ', 0.160268, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '青海', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:53', '1514943054748979200', '2022-04-15 21:08:53', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953907116314624, '外购热能', null, '热能-宁夏', 'CO2e', 'AR4', 't', 'GJ', 0.130656, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '宁夏', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:53', '1514943054748979200', '2022-04-15 21:08:53', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953907380555776, '外购热能', null, '热能-新疆', 'CO2e', 'AR4', 't', 'GJ', 0.130563, 't/GJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '新疆', '', 'GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）', 2011, 3,
        '1514943054748979200', '2022-04-15 21:08:53', '1514943054748979200', '2022-04-15 21:08:53', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953907661574144, '运输', '里程·重量', '轻型汽油货车运输（载重2t）', 'CO2e', 'AR4', 'kg', 't km', 0.288200, 'kg/t km',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '', '碳排放交易网', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:53', '1514943054748979200', '2022-04-15 21:08:53', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953907921620992, '运输', '里程·重量', '中型汽油货车运输（载重8t）', 'CO2e', 'AR4', 'kg', 't km', 0.103400, 'kg/t km',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '', '碳排放交易网', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:53', '1514943054748979200', '2022-04-15 21:08:53', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953908185862144, '运输', '里程·重量', '重型汽油货车运输(载重10t)', 'CO2e', 'AR4', 'kg', 't km', 0.140200, 'kg/t km',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '', '碳排放交易网', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:53', '1514943054748979200', '2022-04-15 21:08:53', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953908450103296, '运输', '里程·重量', '重型汽油货车运输（载重18t）', 'CO2e', 'AR4', 'kg', 't km', 0.095850, 'kg/t km',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '', '碳排放交易网', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:53', '1514943054748979200', '2022-04-15 21:08:53', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953908714344448, '运输', '里程·重量', '轻型柴油货车运输（载重2t）', 'CO2e', 'AR4', 'kg', 't km', 0.246100, 'kg/t km',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '', '碳排放交易网', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:53', '1514943054748979200', '2022-04-15 21:08:53', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953908978585600, '运输', '里程·重量', '中型柴油货车运输（载重8t）', 'CO2e', 'AR4', 'kg', 't km', 0.166300, 'kg/t km',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '', '碳排放交易网', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:53', '1514943054748979200', '2022-04-15 21:08:53', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953909238632448, '运输', '里程·重量', '重型柴油货车运输（载重10t）', 'CO2e', 'AR4', 'kg', 't km', 0.177200, 'kg/t km',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '', '碳排放交易网', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:53', '1514943054748979200', '2022-04-15 21:08:53', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953909502873600, '运输', '里程·重量', '重型柴油货车运输（载重18t）', 'CO2e', 'AR4', 'kg', 't km', 0.121100, 'kg/t km',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '', '碳排放交易网', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:53', '1514943054748979200', '2022-04-15 21:08:53', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953909762920448, '运输', '里程·重量', '重型柴油货车运输（载重30t）', 'CO2e', 'AR4', 'kg', 't km', 0.072690, 'kg/t km',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '', '碳排放交易网', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:53', '1514943054748979200', '2022-04-15 21:08:53', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953910022967296, '运输', '里程·重量', '重型柴油货车运输(载重46t)', 'CO2e', 'AR4', 'kg', 't km', 0.057770, 'kg/t km',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '', '碳排放交易网', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:53', '1514943054748979200', '2022-04-15 21:08:53', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953910287208448, '运输', '里程·重量', '电力机车运输', 'CO2e', 'AR4', 'kg', 't km', 0.010940, 'kg/t km', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '', '碳排放交易网', 2019, 3, '1514943054748979200',
        '2022-04-15 21:08:53', '1514943054748979200', '2022-04-15 21:08:53', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953910677278720, '运输', '里程·重量', '内燃机车运输', 'CO2e', 'AR4', 'kg', 't km', 0.009634, 'kg/t km', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '', '碳排放交易网', 2019, 3, '1514943054748979200',
        '2022-04-15 21:08:53', '1514943054748979200', '2022-04-15 21:08:53', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953910941519872, '运输', '里程·重量', '铁路运输-中国市场平均', 'CO2e', 'AR4', 'kg', 't km', 0.010130, 'kg/t km', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '', '碳排放交易网', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:54', '1514943054748979200', '2022-04-15 21:08:54', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953911201566720, '运输', '里程·重量', '液货船运输（载重2000t）', 'CO2e', 'AR4', 'kg', 't km', 0.018390, 'kg/t km',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '', '碳排放交易网', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:54', '1514943054748979200', '2022-04-15 21:08:54', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953911465807872, '运输', '里程·重量', '干散货船运输(载重2500t)', 'CO2e', 'AR4', 'kg', 't km', 0.014710, 'kg/t km',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '', '碳排放交易网', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:54', '1514943054748979200', '2022-04-15 21:08:54', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953911734243328, '运输', '里程·重量', '集装箱船运输（载重200TEU）', 'CO2e', 'AR4', 'kg', 't km', 0.011820, 'kg/t km',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '', '碳排放交易网', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:54', '1514943054748979200', '2022-04-15 21:08:54', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953911998484480, '运输', '里程·重量', '飞机', 'CO2e', 'AR4', 'kg', 't mile', 1.318653, 'kg/t mile', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:54', '1514943054748979200', '2022-04-15 21:08:54', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953912262725632, '运输', '里程·重量', '飞机', 'CO2e', 'AR4', 'kg', 't km', 5.833300, 'kg/t km', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:54', '1514943054748979200', '2022-04-15 21:08:54', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953912526966784, '商务旅行', '里程', '短途航空（<300里）', 'CO2e', 'AR4', 'kg', 'mile', 0.227011, 'kg/mile', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:54', '1514943054748979200', '2022-04-15 21:08:54', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953912795402240, '商务旅行', '里程', '中途航空（300-2300里）', 'CO2e', 'AR4', 'kg', 'mile', 0.137156, 'kg/mile',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:54', '1514943054748979200', '2022-04-15 21:08:54', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953913055449088, '商务旅行', '里程', '长途航空（>2300里）', 'CO2e', 'AR4', 'kg', 'mile', 0.167421, 'kg/mile', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '美国环境保护局（EPA）-2018', 2018, 3,
        '1514943054748979200', '2022-04-15 21:08:54', '1514943054748979200', '2022-04-15 21:08:54', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953913323884544, '商务旅行', '里程', '国内航班（普通舱）', 'CO2e', 'AR4', 'kg', 'km', 0.134830, 'kg/km', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:54', '1514943054748979200', '2022-04-15 21:08:54', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953913592320000, '商务旅行', '里程', '国际航班（普通舱）', 'CO2e', 'AR4', 'kg', 'km', 0.095580, 'kg/km', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:54', '1514943054748979200', '2022-04-15 21:08:54', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953913852366848, '商务旅行', '里程', '短途航空', 'CO2e', 'AR4', 'kg', 'km', 0.083700, 'kg/km', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:54', '1514943054748979200', '2022-04-15 21:08:54', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953914108219392, '废弃物', '重量', '危险废弃物焚烧', 'CO2e', 'AR4', 'kg', 't', 21.353800, 'kg/t', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:54', '1514943054748979200', '2022-04-15 21:08:54', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953914372460544, '废弃物', '重量', '非危险废弃物焚烧', 'CO2e', 'AR4', 'kg', 't', 21.353800, 'kg/t', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:54', '1514943054748979200', '2022-04-15 21:08:54', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953914632507392, '废弃物', '重量', '非危险废弃物填埋', 'CO2e', 'AR4', 'kg', 't', 586.513800, 'kg/t', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:54', '1514943054748979200', '2022-04-15 21:08:54', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953915018383360, '废弃物', '重量', '非危险废弃物回收利用', 'CO2e', 'AR4', 'kg', 't', 21.353800, 'kg/t', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', '英国环境、食品和农村事务部(Defra)-2019', 2019, 3,
        '1514943054748979200', '2022-04-15 21:08:54', '1514943054748979200', '2022-04-15 21:08:54', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953915278430208, '设施排放', '花费', '教育行业', 'CO2e', 'AR4', 'kg', 'm²', 50.350000, 'kg/m²', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:55', '1514943054748979200', '2022-04-15 21:08:55', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953915538477056, '设施排放', '花费', '食品销售行业', 'CO2e', 'AR4', 'kg', 'm²', 65.962500, 'kg/m²', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:55', '1514943054748979200', '2022-04-15 21:08:55', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953915811106816, '设施排放', '花费', '餐饮服务行业', 'CO2e', 'AR4', 'kg', 'm²', 66.325000, 'kg/m²', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:55', '1514943054748979200', '2022-04-15 21:08:55', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953916071153664, '设施排放', '花费', '健康关怀行业', 'CO2e', 'AR4', 'kg', 'm²', 47.767500, 'kg/m²', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:55', '1514943054748979200', '2022-04-15 21:08:55', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953916331200512, '设施排放', '花费', '住宿行业', 'CO2e', 'AR4', 'kg', 'm²', 43.347500, 'kg/m²', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:55', '1514943054748979200', '2022-04-15 21:08:55', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953916591247360, '设施排放', '花费', '商品行业', 'CO2e', 'AR4', 'kg', 'm²', 27.550000, 'kg/m²', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:55', '1514943054748979200', '2022-04-15 21:08:55', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953916851294208, '设施排放', '花费', '办公室行业', 'CO2e', 'AR4', 'kg', 'm²', 30.577500, 'kg/m²', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:55', '1514943054748979200', '2022-04-15 21:08:55', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953917115535360, '设施排放', '花费', '公共场所行业', 'CO2e', 'AR4', 'kg', 'm²', 58.585000, 'kg/m²', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:55', '1514943054748979200', '2022-04-15 21:08:55', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953917379776512, '设施排放', '花费', '公共秩序与安全行业', 'CO2e', 'AR4', 'kg', 'm²', 24.567500, 'kg/m²', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:55', '1514943054748979200', '2022-04-15 21:08:55', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953917644017664, '设施排放', '花费', '宗教场地行业', 'CO2e', 'AR4', 'kg', 'm²', 60.057500, 'kg/m²', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:55', '1514943054748979200', '2022-04-15 21:08:55', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953917908258816, '设施排放', '花费', '仓库行业', 'CO2e', 'AR4', 'kg', 'm²', 21.585000, 'kg/m²', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:55', '1514943054748979200', '2022-04-15 21:08:55', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953918172499968, '设施排放', '花费', '其他行业', 'CO2e', 'AR4', 'kg', 'm²', 36.632500, 'kg/m²', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:55', '1514943054748979200', '2022-04-15 21:08:55', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953918436741120, '设施排放', '花费', '空', 'CO2e', 'AR4', 'kg', 'm²', 6.230000, 'kg/m²', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:55', '1514943054748979200', '2022-04-15 21:08:55', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953918705176576, '设施排放', '花费', '制造行业', 'CO2e', 'AR4', 'kg', 'm²', 187.817500, 'kg/m²', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:55', '1514943054748979200', '2022-04-15 21:08:55', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953918969417728, '分行业排放', '花费', '农业，狩猎，林业和渔业', 'CO2e', 'AR4', 'kg', 'USD', 2.090000, 'kg/USD', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:55', '1514943054748979200', '2022-04-15 21:08:55', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953919367876608, '分行业排放', '花费', '采矿业', 'CO2e', 'AR4', 'kg', 'USD', 1.780000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:56', '1514943054748979200', '2022-04-15 21:08:56', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953919636312064, '分行业排放', '花费', '食品、饮料和烟草', 'CO2e', 'AR4', 'kg', 'USD', 0.890000, 'kg/USD', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:56', '1514943054748979200', '2022-04-15 21:08:56', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953919908941824, '分行业排放', '花费', '纺织原料及纺织制品', 'CO2e', 'AR4', 'kg', 'USD', 0.940000, 'kg/USD', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:56', '1514943054748979200', '2022-04-15 21:08:56', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953920168988672, '分行业排放', '花费', '皮革和鞋类', 'CO2e', 'AR4', 'kg', 'USD', 0.870000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:56', '1514943054748979200', '2022-04-15 21:08:56', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953920429035520, '分行业排放', '花费', '木材、木材及软木产品', 'CO2e', 'AR4', 'kg', 'USD', 0.940000, 'kg/USD', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:56', '1514943054748979200', '2022-04-15 21:08:56', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953920693276672, '分行业排放', '花费', '纸浆，纸，印刷和出版', 'CO2e', 'AR4', 'kg', 'USD', 0.640000, 'kg/USD', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:56', '1514943054748979200', '2022-04-15 21:08:56', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953920953323520, '分行业排放', '花费', '焦炭，精炼石油和核燃料', 'CO2e', 'AR4', 'kg', 'USD', 1.880000, 'kg/USD', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:56', '1514943054748979200', '2022-04-15 21:08:56', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953921213370368, '分行业排放', '花费', '化学品及化学品产品', 'CO2e', 'AR4', 'kg', 'USD', 1.120000, 'kg/USD', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:56', '1514943054748979200', '2022-04-15 21:08:56', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953921473417216, '分行业排放', '花费', '橡胶和塑料', 'CO2e', 'AR4', 'kg', 'USD', 1.060000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:56', '1514943054748979200', '2022-04-15 21:08:56', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953921737658368, '分行业排放', '花费', '非金属矿物', 'CO2e', 'AR4', 'kg', 'USD', 2.440000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:56', '1514943054748979200', '2022-04-15 21:08:56', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953922001899520, '分行业排放', '花费', '基本金属和金属制品', 'CO2e', 'AR4', 'kg', 'USD', 1.540000, 'kg/USD', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:56', '1514943054748979200', '2022-04-15 21:08:56', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953922266140672, '分行业排放', '花费', '机器(未算在其他分类中', 'CO2e', 'AR4', 'kg', 'USD', 0.710000, 'kg/USD', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:56', '1514943054748979200', '2022-04-15 21:08:56', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953922530381824, '分行业排放', '花费', '光电设备', 'CO2e', 'AR4', 'kg', 'USD', 0.810000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:56', '1514943054748979200', '2022-04-15 21:08:56', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953922794622976, '分行业排放', '花费', '运输设备', 'CO2e', 'AR4', 'kg', 'USD', 0.750000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:56', '1514943054748979200', '2022-04-15 21:08:56', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953923058864128, '分行业排放', '花费', '制造业与回收', 'CO3e', 'AR5', 'kg', 'USD', 0.720000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 4 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:56', '1514943054748979200', '2022-04-15 21:08:56', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953923318910976, '分行业排放', '花费', '零售业(汽车及电单车除外);家居用品修理', 'CO2e', 'AR4', 'kg', 'USD', 0.220000, 'kg/USD',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '',
        'GHG Protocal Scope 3 Evaluator', 1970, 3, '1514943054748979200', '2022-04-15 21:08:56', '1514943054748979200',
        '2022-04-15 21:08:56', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953923708981248, '分行业排放', '花费', '电、气、水供应', 'CO2e', 'AR4', 'kg', 'USD', 4.870000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:57', '1514943054748979200', '2022-04-15 21:08:57', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953923973222400, '分行业排放', '花费', '建筑', 'CO2e', 'AR4', 'kg', 'USD', 0.690000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:57', '1514943054748979200', '2022-04-15 21:08:57', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953924237463552, '分行业排放', '花费', '汽车及摩托车的销售、保养及修理;燃料零售', 'CO2e', 'AR4', 'kg', 'USD', 0.210000, 'kg/USD',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '',
        'GHG Protocal Scope 3 Evaluator', 1970, 3, '1514943054748979200', '2022-04-15 21:08:57', '1514943054748979200',
        '2022-04-15 21:08:57', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953924510093312, '分行业排放', '花费', '批发贸易及代销贸易（汽车、摩托车除外）', 'CO2e', 'AR4', 'kg', 'USD', 0.230000, 'kg/USD',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '',
        'GHG Protocal Scope 3 Evaluator', 1970, 3, '1514943054748979200', '2022-04-15 21:08:57', '1514943054748979200',
        '2022-04-15 21:08:57', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953924774334464, '分行业排放', '花费', '旅馆及餐饮业', 'CO2e', 'AR4', 'kg', 'USD', 0.460000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:57', '1514943054748979200', '2022-04-15 21:08:57', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953925038575616, '分行业排放', '花费', '内陆运输', 'CO2e', 'AR4', 'kg', 'USD', 0.780000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:57', '1514943054748979200', '2022-04-15 21:08:57', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953925307011072, '分行业排放', '花费', '水路运输', 'CO2e', 'AR4', 'kg', 'USD', 1.930000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:57', '1514943054748979200', '2022-04-15 21:08:57', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953925567057920, '分行业排放', '花费', '航空运输', 'CO2e', 'AR4', 'kg', 'USD', 1.640000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:57', '1514943054748979200', '2022-04-15 21:08:57', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953925843881984, '分行业排放', '花费', '其他支援及辅助运输活动;旅行社的活动', 'CO2e', 'AR4', 'kg', 'USD', 0.420000, 'kg/USD',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '',
        'GHG Protocal Scope 3 Evaluator', 1970, 3, '1514943054748979200', '2022-04-15 21:08:57', '1514943054748979200',
        '2022-04-15 21:08:57', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953926129094656, '分行业排放', '花费', '邮政电信', 'CO2e', 'AR4', 'kg', 'USD', 0.300000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:57', '1514943054748979200', '2022-04-15 21:08:57', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953926401724416, '分行业排放', '花费', '金融中介', 'CO2e', 'AR4', 'kg', 'USD', 0.120000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:57', '1514943054748979200', '2022-04-15 21:08:57', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953926665965568, '分行业排放', '花费', '房地产业', 'CO2e', 'AR4', 'kg', 'USD', 0.100000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:57', '1514943054748979200', '2022-04-15 21:08:57', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953926926012416, '分行业排放', '花费', '经营活动租赁', 'CO2e', 'AR4', 'kg', 'USD', 0.210000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:57', '1514943054748979200', '2022-04-15 21:08:57', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953927186059264, '分行业排放', '花费', '公共行政与国防;强制性社会保障', 'CO2e', 'AR4', 'kg', 'USD', 0.260000, 'kg/USD', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:57', '1514943054748979200', '2022-04-15 21:08:57', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953927450300416, '分行业排放', '花费', '教育', 'CO2e', 'AR4', 'kg', 'USD', 0.250000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:57', '1514943054748979200', '2022-04-15 21:08:57', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953927710347264, '分行业排放', '花费', '卫生与社会工作', 'CO2e', 'AR4', 'kg', 'USD', 0.260000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:58', '1514943054748979200', '2022-04-15 21:08:58', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953928092028928, '分行业排放', '花费', '其他社区、社会和个人服务', 'CO2e', 'AR4', 'kg', 'USD', 0.630000, 'kg/USD', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:58', '1514943054748979200', '2022-04-15 21:08:58', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953928352075776, '分行业排放', '花费', '家庭服务业', 'CO2e', 'AR4', 'kg', 'USD', 0.010000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:58', '1514943054748979200', '2022-04-15 21:08:58', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953928607928320, '分行业排放', '花费', '其他', 'CO2e', 'AR4', 'kg', 'USD', 0.630000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:58', '1514943054748979200', '2022-04-15 21:08:58', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953928872169472, '运输', '花费', '航空', 'CO2e', 'AR4', 'kg', 'USD', 1.640000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:58', '1514943054748979200', '2022-04-15 21:08:58', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953929132216320, '运输', '花费', '水运', 'CO2e', 'AR4', 'kg', 'USD', 1.930000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:58', '1514943054748979200', '2022-04-15 21:08:58', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953929392263168, '运输', '花费', '铁路', 'CO2e', 'AR4', 'kg', 'USD', 0.780000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:58', '1514943054748979200', '2022-04-15 21:08:58', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953929652310016, '运输', '花费', '公路', 'CO2e', 'AR4', 'kg', 'USD', 0.780000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:58', '1514943054748979200', '2022-04-15 21:08:58', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953929916551168, '商务旅行', '花费', '汽车', 'CO2e', 'AR4', 'kg', 'USD', 0.780000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:58', '1514943054748979200', '2022-04-15 21:08:58', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953930176598016, '商务旅行', '花费', '公共汽车', 'CO2e', 'AR4', 'kg', 'USD', 0.780000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:58', '1514943054748979200', '2022-04-15 21:08:58', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953930440839168, '商务旅行', '花费', '面包车', 'CO2e', 'AR4', 'kg', 'USD', 0.780000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:58', '1514943054748979200', '2022-04-15 21:08:58', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953930705080320, '商务旅行', '花费', '地铁', 'CO2e', 'AR4', 'kg', 'USD', 0.780000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:58', '1514943054748979200', '2022-04-15 21:08:58', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953930965127168, '商务旅行', '花费', '轮船', 'CO2e', 'AR4', 'kg', 'USD', 0.780000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:58', '1514943054748979200', '2022-04-15 21:08:58', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953931229368320, '商务旅行', '花费', '航空', 'CO2e', 'AR4', 'kg', 'USD', 1.640000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:58', '1514943054748979200', '2022-04-15 21:08:58', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953931493609472, '商务旅行', '花费', '酒店', 'CO2e', 'AR4', 'kg', 'USD', 0.460000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:58', '1514943054748979200', '2022-04-15 21:08:58', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953931770433536, '商务旅行', '里程', '汽车', 'CO2e', 'AR4', 'kg', 'km', 0.220000, 'kg/km', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:58', '1514943054748979200', '2022-04-15 21:08:58', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953932034674688, '商务旅行', '里程', '公共汽车', 'CO2e', 'AR4', 'kg', 'km', 0.120000, 'kg/km', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:59', '1514943054748979200', '2022-04-15 21:08:59', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953932424744960, '商务旅行', '里程', '面包车', 'CO2e', 'AR4', 'kg', 'km', 0.320000, 'kg/km', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:59', '1514943054748979200', '2022-04-15 21:08:59', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953932688986112, '商务旅行', '里程', '地铁', 'CO2e', 'AR4', 'kg', 'km', 0.070000, 'kg/km', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:59', '1514943054748979200', '2022-04-15 21:08:59', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953932953227264, '商务旅行', '里程', '轮船', 'CO2e', 'AR4', 'kg', 'km', 0.000000, 'kg/km', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:59', '1514943054748979200', '2022-04-15 21:08:59', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953933230051328, '商务旅行', '里程', '航空', 'CO2e', 'AR4', 'kg', 'km', 0.180000, 'kg/km', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:59', '1514943054748979200', '2022-04-15 21:08:59', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953933498486784, '商务旅行', '间夜', '酒店', 'CO2e', 'AR4', 'kg', 'room night', 17.980000, 'kg/room night',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '',
        'GHG Protocal Scope 3 Evaluator', 1970, 3, '1514943054748979200', '2022-04-15 21:08:59', '1514943054748979200',
        '2022-04-15 21:08:59', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953933758533632, '能源', '范围三', '天然气', 'CO2e', 'AR4', 'kg', 'MJ', 0.056630, 'kg/MJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:59', '1514943054748979200', '2022-04-15 21:08:59', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953934031163392, '能源', '范围三', '丙烷/丁烷', 'CO2e', 'AR4', 'kg', 'MJ', 0.074000, 'kg/MJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:59', '1514943054748979200', '2022-04-15 21:08:59', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953934291210240, '能源', '范围三', '柴油', 'CO2e', 'AR4', 'kg', 'MJ', 0.086000, 'kg/MJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:59', '1514943054748979200', '2022-04-15 21:08:59', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953934555451392, '能源', '范围三', '重油', 'CO2e', 'AR4', 'kg', 'MJ', 0.088410, 'kg/MJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:59', '1514943054748979200', '2022-04-15 21:08:59', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953934815498240, '能源', '范围三', '生物柴油', 'CO2e', 'AR4', 'kg', 'MJ', 0.108000, 'kg/MJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:59', '1514943054748979200', '2022-04-15 21:08:59', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953935079739392, '能源', '范围三', '乙醇', 'CO2e', 'AR4', 'kg', 'MJ', 0.011600, 'kg/MJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:59', '1514943054748979200', '2022-04-15 21:08:59', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953935348174848, '能源', '范围三', '生物乙醇', 'CO2e', 'AR4', 'kg', 'MJ', 0.152280, 'kg/MJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:59', '1514943054748979200', '2022-04-15 21:08:59', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953935616610304, '能源', '范围三', '无铅汽油', 'CO2e', 'AR4', 'kg', 'MJ', 0.083350, 'kg/MJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:59', '1514943054748979200', '2022-04-15 21:08:59', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953935889240064, '能源', '范围三', '煤油', 'CO2e', 'AR4', 'kg', 'MJ', 0.079860, 'kg/MJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:08:59', '1514943054748979200', '2022-04-15 21:08:59', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953936178647040, '能源', '范围三', '无烟煤', 'CO2e', 'AR4', 'kg', 'MJ', 0.092510, 'kg/MJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:00', '1514943054748979200', '2022-04-15 21:09:00', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953936447082496, '能源', '范围三', '浓缩铀', 'CO2e', 'AR4', 'kg', 'MJ', 0.000026, 'kg/MJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:00', '1514943054748979200', '2022-04-15 21:09:00', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953936837152768, '能源', '范围三', '沼气', 'CO2e', 'AR4', 'kg', 'MJ', 0.097140, 'kg/MJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:00', '1514943054748979200', '2022-04-15 21:09:00', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953937097199616, '能源', '范围三', '甲烷', 'CO2e', 'AR4', 'kg', 'MJ', 0.159450, 'kg/MJ', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:00', '1514943054748979200', '2022-04-15 21:09:00', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953937357246464, '能源', '范围三', '天然气', 'CO2e', 'AR4', 'kg', 'kg', 3.013000, 'kg/kg', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:00', '1514943054748979200', '2022-04-15 21:09:00', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953937617293312, '能源', '范围三', '丙烷/丁烷', 'CO2e', 'AR4', 'kg', 'kg', 3.190000, 'kg/kg', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:00', '1514943054748979200', '2022-04-15 21:09:00', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953937881534464, '能源', '范围三', '柴油', 'CO2e', 'AR4', 'kg', 'kg', 3.684000, 'kg/kg', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:00', '1514943054748979200', '2022-04-15 21:09:00', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953938145775616, '能源', '范围三', '重油', 'CO2e', 'AR4', 'kg', 'kg', 3.642000, 'kg/kg', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:00', '1514943054748979200', '2022-04-15 21:09:00', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953938405822464, '能源', '范围三', '生物柴油', 'CO2e', 'AR4', 'kg', 'kg', 4.049700, 'kg/kg', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:00', '1514943054748979200', '2022-04-15 21:09:00', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953938670063616, '能源', '范围三', '乙醇', 'CO2e', 'AR4', 'kg', 'kg', 3.130000, 'kg/kg', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:00', '1514943054748979200', '2022-04-15 21:09:00', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953938934304768, '能源', '范围三', '生物乙醇', 'CO2e', 'AR4', 'kg', 'kg', 4.096200, 'kg/kg', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:00', '1514943054748979200', '2022-04-15 21:09:00', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953939198545920, '能源', '范围三', '无铅汽油', 'CO2e', 'AR4', 'kg', 'kg', 3.542500, 'kg/kg', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:00', '1514943054748979200', '2022-04-15 21:09:00', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953939462787072, '能源', '范围三', '煤油', 'CO2e', 'AR4', 'kg', 'kg', 3.434130, 'kg/kg', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:00', '1514943054748979200', '2022-04-15 21:09:00', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953939731222528, '能源', '范围三', '无烟煤', 'CO2e', 'AR4', 'kg', 'kg', 2.673530, 'kg/kg', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:00', '1514943054748979200', '2022-04-15 21:09:00', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953939995463680, '能源', '范围三', '浓缩铀', 'CO2e', 'AR4', 'kg', 'kg', 2060.920630, 'kg/kg', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:00', '1514943054748979200', '2022-04-15 21:09:00', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953940272287744, '能源', '范围三', '沼气', 'CO2e', 'AR4', 'kg', 'kg', 2.078870, 'kg/kg', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:01', '1514943054748979200', '2022-04-15 21:09:01', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953940532334592, '能源', '范围三', '甲烷', 'CO2e', 'AR4', 'kg', 'kg', 3.412230, 'kg/kg', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:01', '1514943054748979200', '2022-04-15 21:09:01', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953940792381440, '废弃物', '花费', '纸', 'CO2e', 'AR4', 'kg', 'kg', 0.460000, 'kg/kg', 0.000000, '', '', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:01', '1514943054748979200', '2022-04-15 21:09:01', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953941174063104, '废弃物', '花费', '金属', 'CO2e', 'AR4', 'kg', 'kg', 0.460000, 'kg/kg', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:01', '1514943054748979200', '2022-04-15 21:09:01', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953941434109952, '废弃物', '花费', '塑料', 'CO2e', 'AR4', 'kg', 'kg', 0.040000, 'kg/kg', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:01', '1514943054748979200', '2022-04-15 21:09:01', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953941694156800, '废弃物', '花费', '有机物质', 'CO2e', 'AR4', 'kg', 'kg', 0.040000, 'kg/kg', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:01', '1514943054748979200', '2022-04-15 21:09:01', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953941954203648, '废弃物', '花费', '混合物', 'CO2e', 'AR4', 'kg', 'kg', 0.530000, 'kg/kg', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:01', '1514943054748979200', '2022-04-15 21:09:01', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953942214250496, '下游租赁资产排放', '花费', '内陆运输', 'CO2e', 'AR4', 'kg', 'USD', 0.780000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:01', '1514943054748979200', '2022-04-15 21:09:01', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953942474297344, '下游租赁资产排放', '花费', '水路运输', 'CO2e', 'AR4', 'kg', 'USD', 1.930000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:01', '1514943054748979200', '2022-04-15 21:09:01', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953942759510016, '下游租赁资产排放', '花费', '航空运输', 'CO2e', 'AR4', 'kg', 'USD', 1.640000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:01', '1514943054748979200', '2022-04-15 21:09:01', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953943023751168, '下游租赁资产排放', '花费', '教育', 'CO2e', 'AR4', 'kg', 'USD', 4.870000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:01', '1514943054748979200', '2022-04-15 21:09:01', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953943279603712, '下游租赁资产排放', '花费', '食品销售', 'CO2e', 'AR4', 'kg', 'USD', 4.870000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:01', '1514943054748979200', '2022-04-15 21:09:01', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953943552233472, '下游租赁资产排放', '花费', '餐饮服务', 'CO2e', 'AR4', 'kg', 'USD', 4.870000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:01', '1514943054748979200', '2022-04-15 21:09:01', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953943816474624, '下游租赁资产排放', '花费', '健康关怀', 'CO2e', 'AR4', 'kg', 'USD', 4.870000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:01', '1514943054748979200', '2022-04-15 21:09:01', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953944080715776, '下游租赁资产排放', '花费', '住宿', 'CO2e', 'AR4', 'kg', 'USD', 4.870000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:01', '1514943054748979200', '2022-04-15 21:09:01', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953944349151232, '下游租赁资产排放', '花费', '商品', 'CO2e', 'AR4', 'kg', 'USD', 4.870000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:01', '1514943054748979200', '2022-04-15 21:09:01', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953944613392384, '下游租赁资产排放', '花费', '办公室', 'CO2e', 'AR4', 'kg', 'USD', 4.870000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:02', '1514943054748979200', '2022-04-15 21:09:02', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953944877633536, '下游租赁资产排放', '花费', '公共场所', 'CO2e', 'AR4', 'kg', 'USD', 4.870000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:02', '1514943054748979200', '2022-04-15 21:09:02', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953945141874688, '下游租赁资产排放', '花费', '公共秩序与安全', 'CO2e', 'AR4', 'kg', 'USD', 4.870000, 'kg/USD', 0.000000, '',
        '', 0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:02', '1514943054748979200', '2022-04-15 21:09:02', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953945523556352, '下游租赁资产排放', '花费', '宗教场地', 'CO2e', 'AR4', 'kg', 'USD', 4.870000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:02', '1514943054748979200', '2022-04-15 21:09:02', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953945787797504, '下游租赁资产排放', '花费', '仓库', 'CO2e', 'AR4', 'kg', 'USD', 4.870000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:02', '1514943054748979200', '2022-04-15 21:09:02', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953946052038656, '下游租赁资产排放', '花费', '其他', 'CO2e', 'AR4', 'kg', 'USD', 4.870000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:02', '1514943054748979200', '2022-04-15 21:09:02', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953946312085504, '下游租赁资产排放', '花费', '空', 'CO2e', 'AR4', 'kg', 'USD', 4.870000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:02', '1514943054748979200', '2022-04-15 21:09:02', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1514953946576326656, '下游租赁资产排放', '花费', '制造', 'CO2e', 'AR4', 'kg', 'USD', 4.870000, 'kg/USD', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '', '', '', 'GHG Protocal Scope 3 Evaluator', 1970, 3,
        '1514943054748979200', '2022-04-15 21:09:02', '1514943054748979200', '2022-04-15 21:09:02', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1516233845396082688, '外购电力', null, '美国平均电力', 'CO2e', 'AR4', 'g', 'kWh', 412.800000, 'g/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '美国', '', '',
        'Based on IEA data from  CO2 Emissions from Fuel Combustion © OECD/IEA 2020, www.iea.org/statistics, Licence:  www.iea.org/t&c; as modified by UL E&S. Users are only permitted to disclose those IEA Factors relevant to their emissions calculations in their sustainability reports to third parties for the purposes of emissions audits and/or reporting (e.g. to CDP) and only to the extent they are required to do so by the relevant entity to which they report or which audits them.',
        2020, 3, '1515896721291481088', '2022-04-19 09:54:54', '1515896721291481088', '2022-04-19 09:54:54', 0, null,
        -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1516292284470136832, '外购电力', null, '越南自定义电力', 'CO2e', 'AR4', 'kg', 'kWh', 0.845800, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '越南', '', '', '自定义', 2021, 3, '1516260703219093504',
        '2022-04-19 13:47:07', '1516260703219093504', '2022-04-19 13:47:07', 0, null, -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1516292284814069760, '外购电力', null, '台湾自定义电力', 'CO2e', 'AR4', 'kg', 'kWh', 0.502000, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '台湾', '', '自定义', 2021, 3, '1516260703219093504',
        '2022-04-19 13:47:07', '1516260703219093504', '2022-04-19 13:47:07', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1522751677713747968, '能源', '固定燃烧排放', '2', 'CO₂e', 'AR4', 'kg', 't', 14.670000, 'kg/t', 0.000000, '', '',
        2.000000, 'KJ/t', '23', 1.000000, 'TC/KJ', '32', 2.000000, '23', '中国', '华北', '通用', '', 1971, 1,
        '1522106105617059840', '2022-05-07 09:34:26', '1522106105617059840', '2022-05-07 09:34:26', 1522751677713747968,
        null, -1, 6);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1522755106704068608, '运输', '里程·重量', '乘用车-汽油自定义', 'CO₂e', 'AR4', 't', 'km', 0.000181, 't/km', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '全球', '', '通用', '', 2020, 1, '1522468872169590784',
        '2022-05-07 09:48:04', '1522468872169590784', '2022-05-07 09:48:04', 0, null, -1, 1);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1522760392646987776, '外购电力', null, '中国台湾电力', 'CO2e', 'AR4', 'kg', 'kWh', 0.509000, 'kg/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '台湾', '', '自定义', 2020, 1, '1522124426508898304',
        '2022-05-07 10:09:04', '1522124426508898304', '2022-05-07 10:09:04', 0, null, -1, 3);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1522761763660107776, '运输', '里程·重量', 'se', 'CO₂e', 'AR4', 't', 't', 12.000000, 't/t', 0.000000, '', '', 0.000000,
        '', '', 0.000000, '', '', 0.000000, '', '中国', '华北', '通用', '22', 1972, 1, '1522106105617059840',
        '2022-05-07 10:14:31', '1522106105617059840', '2022-05-07 10:14:31', 1522761763660107776, null, -1, 5);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1522765678417940480, '外购电力', null, '越南电力', 'CO2e', 'AR4', 'g', 'kWh', 454.800000, 'g/kWh', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '越南', '', '',
        'Based on IEA data from  CO2 Emissions from Fuel Combustion © OECD/IEA 2020, www.iea.org/statistics, Licence:  www.iea.org/t&c; as modified by UL E&S. Users are only permitted to',
        2020, 1, '1522124426508898304', '2022-05-07 10:30:04', '1522124426508898304', '2022-05-07 10:30:04', 0, null,
        -1, 2);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1522766728701022208, '运输', '里程·重量', 'q2', 'CO₂e', 'AR6', 'kg', 't', 22.000000, 'kg/t', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '通用', 'we', 1971, 1, '1522106105617059840',
        '2022-05-07 10:34:14', '1522106105617059840', '2022-05-07 10:34:14', 1522766728701022208, null, -1, 4);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1522766906300436480, '外购热能', null, 'q22', 'CO₂e', 'AR6', 'kg', 't', 22.000000, 'kg/t', 0.000000, '', '',
        0.000000, '', '', 0.000000, '', '', 0.000000, '', '中国', '', '通用', 'we', 1971, 1, '1522106105617059840',
        '2022-05-07 10:34:57', '1522106105617059840', '2022-05-07 10:34:57', 1522766906300436480, null, -1, 4);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1522768385673400320, '能源', '固定燃烧排放', 'w', 'CO₂e', 'AR4', 'kg', 'km', 22.000002, 'kg/km', 0.000000, '', '',
        2.000000, 'KJ/km', '1', 1.000000, 'TC/KJ', '1', 3.000000, '1', '中国', '华北', '通用', '', 2023, 1,
        '1522106105617059840', '2022-05-07 10:40:49', '1522106105617059840', '2022-05-07 10:40:49', 1522768385673400320,
        null, -1, 5);
INSERT INTO cec.tb_sys_emission_factor (id, category1, category2, factor_name, emission_gas_type, protocol_version,
                                        carbon_emission_unit, fuel_unit, factor, factor_unit, density, density_unit,
                                        density_source, heat_value, heat_value_unit, heat_value_source,
                                        ca_con_per_heat_value, ca_con_per_heat_value_unit, ca_con_per_heat_value_source,
                                        carbon_oxidation_rate, carbon_oxidation_rate_source, country, region, industry,
                                        source, year, revision, created_by, created_time, updated_by, updated_time,
                                        delete_flag, org_id, attachment_id, emission_factor_type_enum)
VALUES (1522768495941652480, '能源', '固定燃烧排放', 'w', 'CO₂e', 'AR4', 'kg', 'km', 22.000002, 'kg/km', 0.000000, '', '',
        2.000000, 'KJ/km', '1', 1.000000, 'TC/KJ', '1', 3.000000, '1', '中国', '华北', '通用', '', 2023, 1,
        '1522106105617059840', '2022-05-07 10:41:16', '1522106105617059840', '2022-05-07 10:41:16', 1522768495941652480,
        null, -1, 5);