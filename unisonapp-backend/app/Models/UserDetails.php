<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserDetails extends Model
{
    use HasFactory;

    protected $fillable = [
        'employee_id',
        'first_name',
        'last_name',
        'email',
        'country',
        'birthday',
        'mobile_number',
        'city',
        'address_line1',
        'address_line2',
        'postal_code',
        'province_state',
        'bank',
        'branch',
        'account_number',
        'department_name',
        'role',
    ];
}
