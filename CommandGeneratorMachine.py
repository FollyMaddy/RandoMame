import FilterMachine
import Config


def generate_command_list(machine_list):
    item_list = []

    check_machine_description = True

    if Config.loose_search is True:
        machine_list = FilterMachine.loose_search_machine_list(machine_list)
        check_machine_description = False

    if Config.multi_search is True:
        machine_list = FilterMachine.multi_search_machine_list(machine_list)
        check_machine_description = False

    for machine in machine_list:
        item = FilterMachine.get(machine, check_machine_description, None)
        if item is None:
            continue

        item_list.append(item)

    return item_list
