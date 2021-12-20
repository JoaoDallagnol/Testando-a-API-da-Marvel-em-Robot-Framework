*Settings*
Documentation       Suite de Teste de exclusão de personagens na API da Marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/factories/Thanos.py
Library     ${EXECDIR}/resources/factories/Deadpool.py
Library     ${EXECDIR}/resources/factories/Guardians.py
Library     ${EXECDIR}/resources/factories/Xmen.py


#Setando o header para poder usar em toda a aplicação
Suite Setup     Super Setup     jvdallagnol2001@gmail.com


*Test Cases*
Deve remover um personagem pelo id

    ${personagem}       Factory Ciclope
    ${ciclope}          POST New Character          ${personagem}
    ${ciclope_id}       Set Variable                ${ciclope.json()}[_id]

    ${response}         DELETE Character By Id      ${ciclope_id}

    Status Should Be    204                         ${response}

    ${response2}        GET Character By Id         ${ciclope_id}
    Status Should Be    404                         ${response2}

Não deve remover o personagem pelo Id

    ${personagem}   Get Unique Id
    ${response}     GET Character By Id  ${personagem}

    Status Should Be    404     ${response}
