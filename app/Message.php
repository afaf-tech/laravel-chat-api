<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    //
    protected $table = 'table_messages';

    protected $fillable = [
        'message', 'from_user_id', 'to_user_id',
    ];

    public $timestamps = false;
}
