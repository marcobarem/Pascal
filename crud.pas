program CRUDPascal;

type
  TUser = record
    id: Integer;
    name: string[50];
  end;

var
  users: array[1..100] of TUser;
  count, i: Integer;

procedure CreateUser();
var
  newUser: TUser;
begin
  writeln('Digite o ID do usuário:');
  readln(newUser.id);
  writeln('Digite o nome do usuário:');
  readln(newUser.name);

  inc(count); 
  users[count] := newUser;
  writeln('Usuário criado com sucesso!');
end;

procedure ReadUsers();
begin
  if count = 0 then
    writeln('Nenhum usuário cadastrado.')
  else
  begin
    writeln('Lista de usuários:');
    for i := 1 to count do
      writeln('ID: ', users[i].id, ' | Nome: ', users[i].name);
  end;
end;

procedure UpdateUser();
var
  idToUpdate, index: Integer;
  updatedName: string;
begin
  writeln('Digite o ID do usuário que deseja atualizar:');
  readln(idToUpdate);
  index := -1;
  
  for i := 1 to count do
  begin
    if users[i].id = idToUpdate then
    begin
      index := i;
      break;
    end;
  end;

  if index = -1 then
    writeln('Usuário não encontrado!')
  else
  begin
    writeln('Digite o novo nome:');
    readln(updatedName);
    users[index].name := updatedName;
    writeln('Usuário atualizado com sucesso!');
  end;
end;

procedure DeleteUser();
var
  idToDelete, index: Integer;
begin
  writeln('Digite o ID do usuário que deseja excluir:');
  readln(idToDelete);
  index := -1;

  for i := 1 to count do
  begin
    if users[i].id = idToDelete then
    begin
      index := i;
      break;
    end;
  end;

  if index = -1 then
    writeln('Usuário não encontrado!')
  else
  begin
    for i := index to count - 1 do
      users[i] := users[i + 1];
    dec(count);
    writeln('Usuário excluído com sucesso!');
  end;
end;

var
  option: Integer;

begin
  count := 0;
  repeat
    writeln('1. Criar Usuário');
    writeln('2. Listar Usuários');
    writeln('3. Atualizar Usuário');
    writeln('4. Deletar Usuário');
    writeln('5. Sair');
    writeln('Escolha uma opção:');
    readln(option);

    case option of
      1: CreateUser();
      2: ReadUsers();
      3: UpdateUser();
      4: DeleteUser();
    end;
  until option = 5;
end.

