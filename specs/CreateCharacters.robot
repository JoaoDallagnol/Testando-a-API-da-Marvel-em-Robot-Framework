*Settings*
Documentation       Suite de Teste do cadastro de personagens na API da Marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/factories/Thanos.py
Library     ${EXECDIR}/resources/factories/Deadpool.py
Library     ${EXECDIR}/resources/factories/Guardians.py


#Setando o header para poder usar em toda a aplicação
Suite Setup     Super Setup     "{COLOQUE SEU EMAIl AQUI}" 


*Test Cases*
Deve cadastrar um personagem
    ${personagem}       Factory Thanos
    ${response}         POST New Character  ${personagem}

    Status Should Be        200     ${response}


Não deve cadastrar com o mesmo nome
    [Tags]  dup

    #Dado que o personagem ja existe no sistema
    ${personagem}       Factory Deadpool
    POST New Character  ${personagem}


    #Quando faço uma requisição POST para a rota characters
    ${response}     POST New Character  ${personagem}
    
    
    #Então o código de retorno deve ser 409
    Status Should Be  409   ${response}
    Should Be Equal      ${response.json()}[error]      Character already exists :(