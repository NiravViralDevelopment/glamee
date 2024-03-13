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
        Schema::create('providers', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->string('email')->nullable();
            $table->string('about')->nullable();
            $table->string('address')->nullable();
            $table->string('mobile')->nullable();
            $table->string('profile_url')->nullable();
            $table->foreignId('provider_type_id')->constrained('provider_types')->cascadeOnDelete()->cascadeOnUpdate()->nullable();
            $table->foreignId('city_id')->constrained('cities')->cascadeOnDelete()->cascadeOnUpdate()->nullable();
            $table->string('password');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('providers');
    }
};
