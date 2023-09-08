<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;


class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    public function login(Request $request)
    {
        // validate the request
       $request->validate([
           'email' => 'required|email',
           'password' => 'required',
       ]);

       // attempt to log the user in
       $user = User::where('email', $request->email)->first();

       // check if the user exists and match the password
       if(!$user || !Hash::check($request->password, $user->password)){
           throw ValidationException::withMessages([
               'email' => ['The provided credentials are incorrect.'],
           ]);
       }

       // create a token for the user
       return $user ->createToken ($request->email)->plainTextToken;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}




