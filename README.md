# Cardapio Interativo 

Obs: Recomendo colocar no modo Raw (ou Code) para melhor visualização dos textos e códigos.
     
Obs2: Para visualização das imagens desativar o modo Raw (ou Code) e colocar no modo Preview que elas irão aparecer.


Instruções de instalação do Flutter

Para instalar o Flutter, siga os passos abaixo:

1. Verifique se seu computador atende aos requisitos mínimos do Flutter.
2. Baixe o instalador do Flutter para sua plataforma.
3. Execute o instalador e siga as instruções.

Requisitos mínimos

• Sistema operacional: Windows 7 SP1 ou mais recente (64 bits), macOS 10.10 ou mais recente, Linux Ubuntu 16.04 ou mais recente
• Memória RAM: 4 GB ou mais
• Espaço em disco: 400 MB (não inclui o espaço em disco necessário para IDE/ferramentas)

Baixe o instalador

Acesse a página de instalação do Flutter e selecione a plataforma do seu computador.

• Para Windows, clique em Download for Windows.
• Para macOS, clique em Download for macOS.
• Para Linux, clique em Download for Linux.

Execute o instalador

Após o download, execute o instalador. Siga as instruções na tela para concluir a instalação.

Verifique a instalação

Após a instalação, abra um terminal e digite o seguinte comando:

flutter doctor

Este comando irá verificar se o Flutter está instalado corretamente. Se tudo estiver OK, você verá uma mensagem como a seguinte:

[✓] Flutter (Channel stable, 2.10.3, on macOS 12.3.1 x64, locale pt_BR)
[✓] Android toolchain - develop for Android devices (Android SDK version 32.0.0)
[✓] Android Studio (version 2023.1)
[✓] VS Code (version 1.66.2)
[✓] Connected devices (2 available)

Observações

• Se você estiver usando um emulador Android, certifique-se de que ele esteja instalado e funcionando corretamente.
• Se você estiver usando o Visual Studio Code como IDE, instale o plugin do Flutter.



Passo a passo do desenvolvimento do projeto

O projeto foi desenvolvido seguindo os seguintes passos:

1. Inicialmente, foi criada uma lista de pratos com seus nomes, descrições e preços.
2. Em seguida, foram criadas as telas de restaurante, pratos e favoritos.
3. A tela de restaurante exibe uma lista de pratos.
4. A tela de pratos exibe os detalhes de um prato, incluindo seu nome, descrição e preço.
5. A tela de favoritos exibe uma lista de pratos favoritos do usuário.
6. Para obter o cardápio de pratos, foi utilizada a estratégia de JSON estático ("mock").
7. Para permitir que o usuário marque seus pratos preferidos, foi utilizado um botão de favoritos.
8. Para persistir localmente anotações sobre os pratos, foi utilizado um arquivo JSON.

Detalhes de cada etapa

1. Criação da lista de pratos

A lista de pratos foi criada utilizando a classe List<Prato> do Flutter. Cada prato na lista é representado por um objeto da classe Prato, que possui os atributos nome, descricao e preco.

2. Criação das telas

As telas do projeto foram criadas utilizando o sistema de layout do Flutter. A tela de restaurante é uma tela simples que exibe uma lista de pratos. A tela de pratos exibe os detalhes de um prato, incluindo seu nome, descrição e preço. A tela de favoritos exibe uma lista de pratos favoritos do usuário.

3. Acessando o cardápio de pratos

Para acessar o cardápio de pratos, foi utilizada a estratégia de JSON estático ("mock"). O cardápio de pratos é representado por um arquivo JSON que contém uma lista de objetos Prato.

4. Permitindo que o usuário marque seus pratos preferidos

Para permitir que o usuário marque seus pratos preferidos, foi utilizado um botão de favoritos. Quando o usuário clica no botão de favoritos, o prato é adicionado à lista de favoritos do usuário.

5. Persistindo localmente anotações sobre os pratos

Para persistir localmente anotações sobre os pratos, foi utilizado um arquivo JSON. O arquivo JSON contém uma lista de objetos Prato, onde cada objeto possui os atributos nome, descricao, preco e anotacoes.



Trechos de código relevantes.

Tela Restaurantes
1. Importações e Inicialização do Modelo:
 • Importações relevantes e inicialização do modelo.
    import '/backend/backend.dart';
    import 'restaurantes_model.dart';
    
    late RestaurantesModel _model;
    
    // ... (restante do código)

2. AppBar e Navegação:
 • Código relacionado à AppBar, título da tela e botão de navegação para a tela de Favoritos.
    AppBar(
      // ...
      title: Text(
        'Restaurantes',
        style: FlutterFlowTheme.of(context).displaySmall.override(
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        // Ícone de navegação para a tela de Favoritos
      ],
    ),

3. Recuperação de Dados e Construção da Lista de Restaurantes:
 • Código que recupera dados de restaurantes e constrói a lista.
    StreamBuilder<List<RestaurantesRecord>>(
      stream: queryRestaurantesRecord(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // Indicador de carregamento
        }
        // Construção da lista de restaurantes
      },
    ),

4. Construção do Item da Lista:
 • Código que constrói cada item na lista de restaurantes.
    ListView.builder(
      // ...
      itemBuilder: (context, listViewIndex) {
        final listViewRestaurantesRecord =
            listViewRestaurantesRecordList[listViewIndex];
        return Padding(
          // Construção do item da lista
        );
      },
    ),

5. Navegação para a Tela de Pratos:
 • Código que navega para a tela de Pratos ao tocar em um restaurante.
    InkWell(
      onTap: () async {
        context.pushNamed(
          'Pratos',
          queryParameters: {
            'refRestaurante': serializeParam(
              listViewRestaurantesRecord.reference,
              ParamType.DocumentReference,
            ),
          }.withoutNulls,
        );
      },
      child: Container(
        // ...
      ),
    ),


Tela Pratos
1. Importações e Inicialização do Modelo:
 • Importações relevantes e inicialização do modelo.
    import '/backend/backend.dart';
    import 'pratos_model.dart';
    
    late PratosModel _model;
    
    // ... (restante do código)

2. AppBar e Navegação:
 • Código relacionado à AppBar, título da tela, botão de navegação para a tela anterior e botão de navegação para a tela de Favoritos.
    AppBar(
      // ...
      title: Row(
        // ...
      ),
      actions: [
        // Ícone de navegação para a tela de Favoritos
      ],
    ),

3. Recuperação de Dados e Construção da Lista de Pratos:
 • Código que recupera dados dos pratos associados ao restaurante e constrói a lista.
    StreamBuilder<RestaurantesRecord>(
      stream: RestaurantesRecord.getDocument(widget.refRestaurante!),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // Indicador de carregamento
        }
        // Construção da lista de pratos
      },
    ),

4. Construção do Item da Lista de Pratos:
 • Código que constrói cada item na lista de pratos.
    ListView.builder(
      // ...
      itemBuilder: (context, listViewIndex) {
        final listViewPratosRecord = listViewPratosRecordList[listViewIndex];
        return Padding(
          // Construção do item da lista de pratos
        );
      },
    ),

5. Navegação para a Tela de Produto:
 • Código que navega para a tela de Produto ao tocar em um prato.
    InkWell(
      onTap: () async {
        context.pushNamed(
          'Produto',
          queryParameters: {
            'refprato': serializeParam(
              listViewPratosRecord.reference,
              ParamType.DocumentReference,
            ),
          }.withoutNulls,
        );
      },
      child: Container(
        // ...
      ),
    ),

6. Exibição de Preço do Prato:
 • Código que exibe o preço do prato no item da lista.
    Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 4, 8),
      child: Text(
        'R\$${listViewPratosRecord.preco.toString()}',
        textAlign: TextAlign.end,
        style: FlutterFlowTheme.of(context).bodyMedium.override(
          fontFamily: 'Readex Pro',
          fontWeight: FontWeight.w600,
        ),
      ),
    ),


Tela Favoritos
1. Importações e Inicialização do Modelo:
 • Importações relevantes e inicialização do modelo.
    import '/backend/backend.dart';
    import 'favoritos_model.dart';
    
    late FavoritosModel _model;
    
    // ... (restante do código)

2. AppBar e Navegação:
 • Código relacionado à AppBar, título da tela e botão de navegação para a tela anterior.
    AppBar(
      // ...
      title: Row(
        // ...
      ),
      leading: FlutterFlowIconButton(
        // Botão de navegação para a tela anterior
      ),
    ),

3. Recuperação de Dados e Construção da Lista de Favoritos:
 • Código que recupera dados dos pratos favoritos e constrói a lista.
    Builder(
      builder: (context) {
        final favoritos = FFAppState().favoritos.toList();
        return ListView.builder(
          // ...
          itemBuilder: (context, favoritosIndex) {
            final favoritosItem = favoritos[favoritosIndex];
            return Padding(
              // Construção do item da lista de favoritos
            );
          },
        );
      },
    ),

4. Construção do Item da Lista de Favoritos:
 • Código que constrói cada item na lista de pratos favoritos.
    StreamBuilder<PratosRecord>(
      stream: PratosRecord.getDocument(favoritosItem),
      builder: (context, snapshot) {
        // Customize o que seu widget parece quando está carregando.
        if (!snapshot.hasData) {
          // Indicador de carregamento
        }
        final menuItemPratosRecord = snapshot.data!;
        return Container(
          // Construção do item da lista de favoritos
        );
      },
    ),

5. Remoção de Prato dos Favoritos:
 • Código que remove um prato dos favoritos ao tocar no ícone de lixeira.
    FlutterFlowIconButton(
      // ...
      onPressed: () async {
        setState(() {
          FFAppState().removeFromFavoritos(menuItemPratosRecord.reference);
        });
      },
    ),


Tela Produto
1. Importações e Inicialização do Modelo:
 • Importações relevantes e inicialização do modelo.
    import '/backend/backend.dart';
    import 'produto_model.dart';
    
    late ProdutoModel _model;
    
    // ... (restante do código)

2. AppBar e Navegação:
 • Código relacionado à AppBar, título da tela e botões de navegação.
    AppBar(
      // ...
      leading: InkWell(
        // Botão de navegação para a tela anterior
      ),
      title: Text(
        // Título da tela
      ),
      actions: [
        FlutterFlowIconButton(
          // Botão de navegação para a tela de Favoritos
        ),
      ],
    ),

3. Recuperação de Dados e Exibição do Produto:
 • Código que recupera dados do produto e exibe na tela.
    StreamBuilder<PratosRecord>(
      stream: PratosRecord.getDocument(widget.refprato!),
      builder: (context, snapshot) {
        // Customize o que seu widget parece quando está carregando.
        if (!snapshot.hasData) {
          // Indicador de carregamento
        }
        final produtoPratosRecord = snapshot.data!;
        return Scaffold(
          // Exibição dos dados do produto
        );
      },
    ),

4. Exibição da Imagem do Produto:
 • Código que exibe a imagem do produto.
    ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        produtoPratosRecord.img,
        // ...
      ),
    ),

5. Exibição do Preço e Descrição do Produto:
 • Código que exibe o preço e a descrição do produto.
    Text(
      'R\$${produtoPratosRecord.preco.toString()}',
      // ...
    ),
    Text(
      produtoPratosRecord.desc,
      // ...
    ),

6. Botão "Adicionar aos Favoritos":
 • Código do botão que adiciona o produto aos favoritos.
    FFButtonWidget(
      onPressed: () async {
        // Lógica para adicionar aos favoritos
      },
      text: 'Adicionar aos favoritos',
      // ...
    ),



Imagens ilustrativas do projeto em funcionamento.
1. Tela Restaurantes: ![Tela Restaurantes](https://github.com/eduardolopesx02/Cardapio-Interativo-Trabalho-Mobile/assets/143762383/fb2220a3-8e17-4adc-bc7a-601857b16d90)
2. Tela Pratos: ![Tela Pratos](https://github.com/eduardolopesx02/Cardapio-Interativo-Trabalho-Mobile/assets/143762383/429a1550-92dc-43bf-9b5f-2c5d1827c82d)
3. Tela Produto: ![Tela Produto](https://github.com/eduardolopesx02/Cardapio-Interativo-Trabalho-Mobile/assets/143762383/c7c45f7d-b6b6-48cc-b239-6d8c7bc605fb)
4. Confirmação Favoritos: ![Confirmação Favoritos](https://github.com/eduardolopesx02/Cardapio-Interativo-Trabalho-Mobile/assets/143762383/986ca4bb-5392-4579-a6db-bb9933a8f433)
5. Tela Favoritos: ![Tela Favoritos](https://github.com/eduardolopesx02/Cardapio-Interativo-Trabalho-Mobile/assets/143762383/80dc1f97-65f8-4ed8-81da-bba0e9f2a77d)
