<x-guest-layout>
    <x-authentication-card>
        <x-slot name="logo">
            <x-authentication-card-logo />
        </x-slot>

        <x-validation-errors class="mb-4" />

        <form method="POST" action="{{ route('register') }}">
            @csrf

            <!-- First Name -->
            <div class="mt-4">
                <x-label for="first_name" value="{{ __('First Name') }}" />
                <x-input id="first_name" class="block mt-1 w-full" type="text" name="first_name" :value="old('first_name')" required />
            </div>

            <!-- Last Name -->
            <div class="mt-4">
                <x-label for="last_name" value="{{ __('Last Name') }}" />
                <x-input id="last_name" class="block mt-1 w-full" type="text" name="last_name" :value="old('last_name')" required />
            </div>

            <!-- Email Address -->
            <div class="mt-4">
                <x-label for="email" value="{{ __('Email') }}" />
                <x-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required />
            </div>


            <!-- Password -->
            <div class="mt-4">
                <x-label for="password" value="{{ __('Password') }}" />
                <x-input id="password" class="block mt-1 w-full" type="password" name="password" required />
            </div>

            <!-- Confirm Password -->
            <div class="mt-4">
                <x-label for="password_confirmation" value="{{ __('Confirm Password') }}" />
                <x-input id="password_confirmation" class="block mt-1 w-full" type="password" name="password_confirmation" required />
            </div>

            <!-- User Details Fields -->
        
            <div class="mt-4">
                <x-label for="country" value="{{ __('Country') }}" />
                <x-input id="country" class="block mt-1 w-full" type="text" name="country" :value="old('country')" required />
            </div>

            <div class="mt-4">
                <x-label for="birthday" value="{{ __('Birthday') }}" />
                <x-input id="birthday" class="block mt-1 w-full" type="date" name="birthday" :value="old('birthday')" required />
            </div>

            <div class="mt-4">
                <x-label for="mobile_number" value="{{ __('Mobile Number') }}" />
                <x-input id="mobile_number" class="block mt-1 w-full" type="text" name="mobile_number" :value="old('mobile_number')" required pattern="[0-9]{10}" placeholder="Enter a 10-digit mobile number"/>
            </div>
            <!-- City -->
            <div class="mt-4">
                <x-label for="city" value="{{ __('City') }}" />
                <x-input id="city" class="block mt-1 w-full" type="text" name="city" :value="old('city')" required />
            </div>

            <!-- Address Line 1 -->
            <div class="mt-4">
                <x-label for="address_line1" value="{{ __('Address Line 1') }}" />
                <x-input id="address_line1" class="block mt-1 w-full" type="text" name="address_line1" :value="old('address_line1')" required />
            </div>

            <!-- Address Line 2 (Optional) -->
            <div class="mt-4">
                <x-label for="address_line2" value="{{ __('Address Line 2') }}" />
                <x-input id="address_line2" class="block mt-1 w-full" type="text" name="address_line2" :value="old('address_line2')" />
            </div>

            <!-- Postal Code -->
            <div class="mt-4">
                <x-label for="postal_code" value="{{ __('Postal Code') }}" />
                <x-input id="postal_code" class="block mt-1 w-full" type="text" name="postal_code" :value="old('postal_code')" required />
            </div>

            <!-- Province/State -->
            <div class="mt-4">
                <x-label for="province_state" value="{{ __('Province/State') }}" />
                <x-input id="province_state" class="block mt-1 w-full" type="text" name="province_state" :value="old('province_state')" required />
            </div>

            <!-- Bank -->
            <div class="mt-4">
                <x-label for="bank" value="{{ __('Bank') }}" />
                <x-input id="bank" class="block mt-1 w-full" type="text" name="bank" :value="old('bank')" required />
            </div>

            <!-- Branch -->
            <div class="mt-4">
                <x-label for="branch" value="{{ __('Branch') }}" />
                <x-input id="branch" class="block mt-1 w-full" type="text" name="branch" :value="old('branch')" required />
            </div>

            <!-- Account Number -->
            <div class="mt-4">
                <x-label for="account_number" value="{{ __('Account Number') }}" />
                <x-input id="account_number" class="block mt-1 w-full" type="text" name="account_number" :value="old('account_number')" required />
            </div>

            <!-- Department Name -->
            <div class="mt-4">
                <x-label for="department_name" value="{{ __('Department Name') }}" />
                <x-input id="department_name" class="block mt-1 w-full" type="text" name="department_name" :value="old('department_name')" required />
            </div>

            <!-- Role -->
            <div class="mt-4">
                <x-label for="role" value="{{ __('User Type') }}" />
                <select id="role" class="block mt-1 w-full" name="role" required>
                    <option value="" selected disabled hidden>{{ __('User Type') }}</option>
                    <option value="1">Intern</option>
                    <option value="2">Full-time</option>
                    <option value="2">Manager</option>
                </select>
            </div>


            <!-- Register Button -->
            <div class="flex items-center justify-end mt-4">
                <a class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" href="{{ route('login') }}">
                    {{ __('Already registered?') }}
                </a>

                <x-button class="ml-4">
                    {{ __('Register') }}
                </x-button>
            </div>
        </form>
    </x-authentication-card>
</x-guest-layout>
