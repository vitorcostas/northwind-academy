with 
    stg_funcionarios as (
        select *
        from {{ ref('stg_erp__funcionarios') }}
    )

    , joined as (
        select
        funcionarios.PK_FUNCIONARIO
        , funcionarios.NOME_FUNCIONARIO as nome_funcionario
        , gerentes.NOME_FUNCIONARIO as nome_gerente
        , funcionarios.FUNCAO_FUNCIONARIO
        , funcionarios.DT_NASCIMENTO
        , funcionarios.DT_CONTRACAO
        , funcionarios.CIDADE_FUNCIONARIO
        , funcionarios.PAIS_FUNCIONARIO
        from stg_erp__funcionarios as funcionarios
        left join stg_funcionarios as gerentes
            on funcionarios.fk_gerente = gerentes.PK_FUNCIONARIO
    )

select *
from joined