<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTableMessages extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('table_messages', function (Blueprint $table) {
            // $table->id('message_id');
            $table->bigIncrements('message_id');
            $table->string('message');
            $table->integer('from_user_id');
            $table->integer('to_user_id');
            $table->boolean('is_read');
            $table->timestamp('sent_at')->default(DB::raw('CURRENT_TIMESTAMP'));
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('table_messages');
    }
}
