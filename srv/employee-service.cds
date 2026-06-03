using emp.app as ea from '../db/employee-dbmodel';
@requires:'authenticated-user'
service EmployeeService {
    @odata.draft.enabled
    entity Employee   as select from ea.EMPLOYEE;

    entity Department as select from ea.DEPARTMENT
}

annotate EmployeeService.Employee with @(UI: {
    LineItem           : [
        {
            $Type: 'UI.DataField',
            Value: NAME,
        },
        {
            $Type: 'UI.DataField',
            Value: EMAIL_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: DEPARTMENT,
        },
        {
            $Type: 'UI.DataField',
            Value: createdBy,
        },
        {
            $Type: 'UI.DataField',
            Value: createdAt,
        }
    ],
    //Facts /grouped data open for end user to enter
    FieldGroup #BasicData: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: NAME,
            },
            {
                $Type: 'UI.DataField',
                Value: EMAIL_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: DEPARTMENT,
            },
        ]
    },
    FieldGroup #Admin    : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: createdBy,
            },
            {
                $Type: 'UI.DataField',
                Value: createdAt,
            },
            {
                $Type: 'UI.DataField',
                Value: modifiedBy,
            },
            {
                $Type: 'UI.DataField',
                Value: modifiedAt,
            }

        ]
    },

    Facets               : [
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#BasicData',
            Label : '基本信息',
            ID    : 'idBasicData'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Admin',
            Label : '系统信息',
            ID    : 'idAdminData'
        },
    ],


}) {
    NAME       @title: '姓名';
    EMAIL_ID   @title: '电子邮箱';
    DEPARTMENT @title: '部署';
    createdBy  @title: '创建者';
    createdAt  @title: '创建时间';
    modifiedBy @title: '修改者';
    modifiedAt @title: '修改时间';


};
