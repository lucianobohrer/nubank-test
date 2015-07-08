# Projeto de avaliação para Nubank. #

O projeto foi desenvolvido no prazo de duas semanas para avaliação de nível técnico de seleção.

O desafio está contido na url :
[Link do documento](https://docs.google.com/document/d/14g-Fg1vtvSiN8phpVnAONGGnyIFhhQLhadeG3nBRDaw/edit?usp=sharing)

Abaixo algumas informações e constatações sobre o projeto.

### Estrutura ###

O desenvolvimento foi realizado no Swift 1.2, pois muitas bibliotecas e outros recursos não suportam Swift 2.0 .Como o prazo tem um limite , seria um risco migrar toda a estrutura.

Outro item importante na arquitetura foi a escolha para a utilização do UIPageViewController nativo do iOS como base da solução. Essa escolha ocorre por manter uma estrutura baseada em ViewControllers , e ter uma classe responsável por gerar os itens que serão os modelos da lista.

Na questão da lista de faturas superior, usei uma abordagem de criação de UIView customizadas e inseridas em tempo de execução em uma camada superior ao UIPageViewController, contento um componente de Carousel (iCarousel) e uma cor de fundo customizada de uma imagem com o recorte da seta. Assim ela se mantem estática e mudando de cor conforme o movimento do UIPageViewController e servindo de referência para o item selecionado.

### Limitações ###

* Falta do PSD com detalhes de Interface;
* A versão demonstrada segue os Guide Lines do Android, alguns efeitos que são nativos nele são complexos no iOS;
* Pouca variação de resposas do serviço;
* Algumas explicações são específicas do mercado de cartões, algo que dominío pois atuaei em um rede credenciadora;
* Serviço de boleto não entendi o funcionamento ou simular.

### Melhorias ###

Essas melhorias não tiveram tempo para serem executadas :

* Refinar animações e interações;
* Descobrir fontes e tamanhos do PSD;
* Implementar uma interface de erro mais compativel com o padrão;
* Gerar uma interface para visualização do Boleto no Telefone.

### Alguns componentes ###

* [Alamofire](https://github.com/Alamofire/Alamofire)
* [iCarousel](https://github.com/nicklockwood/iCarousel)
* UIColorExtension
* [JSONObjectMapper](https://github.com/Hearst-DD/ObjectMapper)

### Testes ###

O projeto realiza um teste se é possível receber e mapear o objeto do JSON, porém não encontrei muitas oportunidades para realizar uma cobertura de testes. Até por faltar como simular mudanças no serviço sem mudar no código.

Utilizei o XCTest nativo e integrado no XCode, porém não utilizei KIF para teste de interface pois consumiria muito tempo desenhar cenários para uma tela que não tem interação com entrada de dados.

### Video de Execução ###

![Video](https://bytebucket.org/digoreis/nubank/raw/0b554406129437ca786a59596d45de509d271b09/testenubank1.gif?token=18515fefbee48d15ef51b8f741d6f58372a4e123)
