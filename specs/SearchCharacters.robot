*Settings*
Documentation       Suite de Teste de busca de personagens na API da Marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/factories/Thanos.py
Library     ${EXECDIR}/resources/factories/Deadpool.py
Library     ${EXECDIR}/resources/factories/Guardians.py
Library     ${EXECDIR}/resources/factories/Xmen.py


#Setando o header para poder usar em toda a aplicação
Suite Setup     Super Setup     "{COLOQUE SEU EMAIl AQUI}" 


*Test Cases*
Deve buscar um personagem pelo id

    ${personagem}       Factory Logan
    ${logan}            POST New Character      ${personagem}
    ${logan_id}         Set Variable            ${logan.json()}[_id]

    ${response}         GET Character By Id     ${logan_id}

    Status Should Be    200                     ${response}


Não deve retornar o personagem pelo Id

    ${personagem}   Get Unique Id
    ${response}     GET Character By Id  ${personagem}

    Status Should Be    404     ${response}
