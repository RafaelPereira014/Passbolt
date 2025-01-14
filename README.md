# Passbolt

## Backup Automático

- Existe um script ***(passbolt_backups.sh)*** configurado para realizar backups automáticos.
- O backup inclui:
  - Base de dados do Passbolt.
  - Chaves de servidor necessárias para a recuperação.

Os backups são armazenados no diretório configurado como `backups`, com cada backup identificado por um carimbo de data/hora.

## Resolução de Problemas

Caso o Passbolt esteja a falhar,reiniciar os containers utilizando os seguintes comandos:

1. **Listar os containers para confirmar o estado atual:**
   ```bash
   docker ps -a
   ```

2. **Reiniciar os containers do Passbolt:**
   ```bash
   docker restart passbolt passbolt_db
   ```

3. **Verificar os logs dos containers, se necessário:**
   ```bash
   docker logs passbolt
   docker logs passbolt_db
   ```
---

