# Kia Sportage: Descrição e Operação

[Início](../../index.md) / [Manual de Serviço e Reparo do Kia Sportage SL](../sportage-482.md) / [Sistema Elétrico do Corpo](sportage-984.md) / [Janelas Elétricas](sportage-1085.md) / Descrição e Operação

## Operação

Função De Segurança Da Janela Eletrônica

Quando todos os interruptores de subida automática (Dianteira, Traseira) das janelas elétricas são operados, a função de segurança é ativada.

1. Condição da função de segurança

   Quando detectar uma força de 100N durante a elevação da janela, a janela é revertida.

2. Distância de reversão da janela (exceto segurando o interruptor de subida automática)

   | – | Quando detectar um engasgo entre 4mm e 250mm do topo da porta. > A janela é revertida até 300mm do topo da porta. |
   | --- | --- |

   | – | Quando detectar um engasgo acima de 250mm do topo da porta. > A janela é revertida até 50mm do posicionamento do engasgo. > A janela é revertida 50mm ou para a posição inferior no caso de 50mm de distância de reversão. |
   | --- | --- |

   | – | Quando detectar um engasgo acima de 300mm do topo da porta. > A janela para no ponto de reversão. |
   | --- | --- |

3. Distância de reversão da janela (segurando o interruptor de subida automática)

   | – | Quando detectar um engasgo enquanto segurando o interruptor de subida automática. > A janela é revertida até 25mm do posicionamento do engasgo. |
   | --- | --- |

   | – | A função de subida automática não está disponível durante os 5 segundos a partir da condição acima. > Enquanto segurando o interruptor de subida automática, a janela opera como função de subida manual. (A função de segurança não está ativada.) |
   | --- | --- |

   | – | Quando detectar um engasgo novamente enquanto segurando o interruptor de subida automática. > A janela é revertida até 25mm do posicionamento do engasgo. |
   | --- | --- |

   | – | Quando segurando o interruptor de subida automática após 5 segundos a partir da condição acima. > A janela é revertida até 25mm do posicionamento do engasgo. |
   | --- | --- |

4. Área sem função de segurança

   A função de segurança não está disponível a partir de 4mm do topo da porta.

Iniciação da Função de Segurança da Janela Eletrônica

1. Contagem de posição e inicialização de posição

   | (1) | Contagem de posição A contagem de posição da janela é implementada pelo uso de um sensor de efeito Hall (HEF) conectado à unidade de captura de temporizador do Controlador, com resolução de 180° elétrico. Mesmo que a bateria seja separada do carro, ela deve manter a informação da posição da janela. |
   | --- | --- |

   | (2) | Inicialização de posição Para a inicialização de posição, o contador de posição detecta o topo mecânico superior e a posição mecânica inferior. O Unidade de Controle do Motor (MCU) permite apenas a atividade do modo manual (sem o algoritmo ASD Anti-Squeeze Detection) antes de ser inicializado. Inicialização significa a condição para mover o sistema da janela com a função anti-empulho integral e funções relacionadas, detectando a distância de viagem da janela (limites mecânicos superiores/inferiores). Condições para inicialização são • contador de posição desinicializado • interruptor de janela subir ativado • condição de bloqueio detectada (sem movimento do motor de mais de 1 contagem durante 1seg/ dependente do SW) Ação do interruptor com condição desinicializada: • Direção superior: Entrada do interruptor manual & automático P/WDW > modo manual; • Direção inferior: Entrada do interruptor manual P/WDW > modo manual, + entrada do software automático > modo automático |
   | --- | --- |

| • | posição do contador desinitializada |
   | • | interruptor de janela de potência Up ativado |
   | • | condição de bloqueio detectada (nenhum movimento do motor de mais de 1 contador durante 1s/ dependente do interruptor) |
   | • | direção Up: entrada manual & automática do interruptor de janela de potência > modo manual; |
   | • | direção Down: entrada manual do interruptor de janela de potência > modo manual, + entrada automática > modo automático |

   | (3) | Re-inicialização Durante a re-inicialização, o contador de posição é definido como "zero" na posição superior do bloco para compensar erros de contagem pelo software, tolerâncias mecânicas ou física. Condições para re-inicialização são: • posição do contador inicializada. • janela na posição superior do bloco (faixa de captura EEPROM programável) • condição de bloqueio detectada (nenhum movimento do motor de mais de 1 contador durante 1s/ dependente do interruptor) |
   | --- | --- |
   | • | posição do contador inicializada. |
   | • | janela na posição superior do bloco (faixa de captura EEPROM programável) |
   | • | condição de bloqueio detectada (nenhum movimento do motor de mais de 1 contador durante 1s/ dependente do interruptor) |

   | (4) | Desinicialização O sistema de inicialização/calibração será perdido nos seguintes casos: • após modificação de parâmetros via diagnóstico • checksum errado do EEPROM ao acordar ou ligar o ECU • movimento fora do intervalo pré-definido de deslocamento da janela (acima da posição superior aprendida, abaixo da posição inferior pré-definida) • desinicialização após um número definido (EEPROM) de inversões sem re-inicialização na posição superior do selo (ativação/desativação controlada pelo valor do EEPROM). Um movimento da janela para baixo ou desligamento da permissão do elevador da janela redefinirá o valor do contador de inversões (ativação pelo bit do EEPROM). • desinicialização após um número definido de movimentos (EEPROM) sem re-inicialização na posição superior do selo (ativação/desativação controlada pelo valor do EEPROM) • procedimento especial de desinicialização: O procedimento especial de desinicialização do elevador da janela funciona da seguinte forma: – sistema inicializado – mova a janela abaixo da posição de parada suave (posição do EEPROM ajustável) – pressione o interruptor MANU-down e mantenha pressionado – aplique sinal de permissão (serial-link = PIN 6) ON > OFF > ON dentro de 2 segundos (tempo do EEPROM ajustável) |

| • | Procedimento especial de desinitialização: O procedimento especial de desinitialização do vidro-lifteador funciona da seguinte forma: |
   | – | Sistema inicializado – Movimente o vidro abaixo da posição de parada suave (posição ajustável no EEPROM) – Pressione o botão MANU-down e mantenha pressionado – Aplicar sinal de permissão (serial-link = PIN 6) ON > OFF > ON dentro de 2 segundos (tempo ajustável no EEPROM) | |
   | – | Sistema inicializado |
   | – | Movimente o vidro abaixo da posição de parada suave (posição ajustável no EEPROM) |
   | – | Pressione o botão MANU-down e mantenha pressionado |
   | – | Aplicar sinal de permissão (serial-link = PIN 6) ON > OFF > ON dentro de 2 segundos (tempo ajustável no EEPROM) |

   | (5) | Função de parada suave Para reduzir o ruído e a tensão mecânica, o movimento do vidro é parado sob controle do ECU antes de atingir a posição inferior. A distância de segurança é de 0 / +10 mm (entre 11,5 V e 14,5 V). Para ativar a função de parada suave no fundo, as posições de referência superior e inferior devem ser inicializadas. Portanto, o vidro é levantado até a posição superior até que a condição de bloqueio seja detectada. Esta posição é considerada a posição de referência superior. Em seguida, o vidro é movido para a posição inferior até que a condição de bloqueio seja detectada (parada mecânica). Esta posição é considerada a posição de referência inferior. A posição de referência inferior é re-inicializada: • Quando o vidro é operado para baixo a partir da posição de parada suave • A cada "9" paradas na posição de parada suave. |
   | --- | --- |
   | • | Quando o vidro é operado para baixo a partir da posição de parada suave |
   | • | A cada "9" paradas na posição de parada suave. |

   | (6) | Proteção térmica A proteção térmica implementada pelo módulo de software evita a destruição do motor durante condições de sobrecarga. A temperatura do motor é estimada pela integração do quadrado da corrente do motor como uma estimativa para a potência de aquecimento integral. Quando a temperatura estimada do motor excede o limite superior programável no EEPROM, o motor é desativado por um tempo de atraso fixo (valor padrão = 30 segundos). A desativação térmica durante a operação do vidro não interromperá a operação devido a razões de segurança. |
   | --- | --- |

   | (7) | Limitador de tempo de operação O tempo máximo de operação do motor do vidro-potência é limitado a 15 segundos (ajustável no EEPROM). |
   | --- | --- |

   | (8) | Número de reversões contínuas O número máximo de reversões contínuas do vidro é 5. Com as condições abaixo, este contador será re-inicializado. • IG OFF • Sinal DOWN ON • VIDRO FECHADO |
   | --- | --- |
   | • | IG OFF |
   | • | Sinal DOWN ON |
   | • | VIDRO FECHADO |
