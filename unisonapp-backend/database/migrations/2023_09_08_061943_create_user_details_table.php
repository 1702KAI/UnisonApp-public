<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('user_details', function (Blueprint $table) {
            $table->increments('id');
            $table->string('employee_id')->unique();
            $table->string('first_name');
            $table->string('last_name');
            $table->string('country');
            $table->date('birthday');
            $table->string('mobile_number');
            $table->string('city');
            $table->string('address_line1');
            $table->string('address_line2')->nullable();
            $table->string('postal_code');
            $table->string('province_state');
            $table->string('bank');
            $table->string('branch');
            $table->string('account_number');
            $table->string('department_name');
            $table->string('role');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_details');
    }
};
