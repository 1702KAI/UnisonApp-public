<?php

namespace App\Actions\Fortify;

use App\Models\User;
use App\Models\UserDetails; // Import the UserDetails model
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Laravel\Fortify\Contracts\CreatesNewUsers;
use Laravel\Jetstream\Jetstream;

class CreateNewUser implements CreatesNewUsers
{
    use PasswordValidationRules;

    /**
     * Validate and create a newly registered user.
     *
     * @param  array<string, string>  $input
     */
    public function create(array $input): User
    {
        Validator::make($input, [
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'password' => $this->passwordRules(),
            'country' => ['required', 'string', 'max:255'],
            'birthday' => ['required', 'date'],
            'mobile_number' => ['required', 'string', 'max:255'],
            'city' => ['required', 'string', 'max:255'],
            'address_line1' => ['required', 'string', 'max:255'],
            'address_line2' => ['nullable', 'string', 'max:255'],
            'postal_code' => ['required', 'string', 'max:255'],
            'province_state' => ['required', 'string', 'max:255'],
            'bank' => ['required', 'string', 'max:255'],
            'branch' => ['required', 'string', 'max:255'],
            'account_number' => ['required', 'string', 'max:255'],
            'department_name' => ['required', 'string', 'max:255'],
            'role' => ['required', 'string', 'max:255'],
            // Add validation rules for the additional fields here
        ])->validate();

        // Create a new user
        $user = User::create([
            'first_name' => $input['first_name'],
            'email' => $input['email'],
            'role'  => $input['role'], // Set the default type to user
            'password' => Hash::make($input['password']),
        ]);

        // Create a new UserDetails record and associate it with the user
        UserDetails::create([
            'employee_id' => $user->id,
            'first_name' => $input['first_name'],
            'last_name' => $input['last_name'],
            'country' => $input['country'],
            'birthday' => $input['birthday'],
            'mobile_number' => $input['mobile_number'],
            'city' => $input['city'],
            'address_line1' => $input['address_line1'],
            'address_line2' => $input['address_line2'],
            'postal_code' => $input['postal_code'],
            'province_state' => $input['province_state'],
            'bank' => $input['bank'],
            'branch' => $input['branch'],
            'account_number' => $input['account_number'],
            'department_name' => $input['department_name'],
            'role' => $input['role'],
        ]);

        return $user;
    }
}
