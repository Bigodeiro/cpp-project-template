# CPP Project

## Estrutura do Projeto

```text
.
├── include/
│   └── funcoes.hpp
├── src/
│   ├── funcoes.cpp
│   └── main.cpp
├── test/
│   └── main.cpp
├── Makefile
└── README.md
```

- `include/` contém os arquivos de cabeçalho (`.hpp`)
- `src/` contém o código fonte principal (`.cpp`)
- `test/` contém os arquivos de teste
- `Makefile` contém os comandos de compilação

## Compilar o projeto

```bash
make
```

## Executar o programa principal

```bash
make run
```

## Executar os testes

```bash
make test
```

## Limpar arquivos gerados

```bash
make clean
```