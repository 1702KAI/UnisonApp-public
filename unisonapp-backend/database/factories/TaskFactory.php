<?php

namespace Database\Factories;

use App\Models\Task;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class TaskFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Task::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'description' => $this->faker->sentence,
            'dueDate' => $this->faker->dateTimeThisMonth,
            'taskType' => $this->faker->randomElement(['High', 'Medium', 'Low']),
            // Set the user_id to the ID of the user with the specified email
            'user_id' => User::where('email', 'imeth@metana.io')->first()->id,
        ];
    }
}
