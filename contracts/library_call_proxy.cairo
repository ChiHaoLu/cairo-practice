%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin

@contract_interface
namespace IBalanceContract {
    func increase_balance(amount: felt) {
    }

    func get_balance() -> (res: felt) {
    }
}

// Define a local balance variable in our proxy contract.
@storage_var
func balance() -> (res: felt) {
}

@external
func increase_my_balance{syscall_ptr: felt*, range_check_ptr}(
    class_hash: felt, amount: felt
) {
    // Increase the local balance variable using a function from a
    // different contract class by using a library call.
    IBalanceContract.library_call_increase_balance(
        class_hash=class_hash, amount=amount
    );
    return ();
}