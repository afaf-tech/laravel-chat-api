<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Message;
use DB;
class MessageController extends Controller
{
    //
    public function list(Request $request, $id_user){
        $myId = $request->user()->id;
        if($myId == $id_user){
            return response([
                'status' => 'Not Found',
                'message' => "No Messages Found!, You dont have any message sent to you yourself!"
            ], 404);
        }
        $affected = DB::table('table_messages')
              ->where('to_user_id', $myId)
              ->where('from_user_id', $id_user)
              ->update(['is_read' => 1]);
        $check = DB::table('table_messages as m')
                ->select('m.message_id', 'm.message','m.sent_at', DB::raw('(CASE
                WHEN m.from_user_id = "'.$id_user.'" THEN u.name ELSE "you" END) AS sender'), 'm.is_read')
                ->leftJoin('users as u', 'u.id', '=', 'm.to_user_id')
                ->where('m.to_user_id', $id_user)
                ->orWhere('m.to_user_id', $myId)->get();
        if(!$check){
            return response([
                'status' => 'Not Found',
                'message' => "No Messages Found"
            ], 404);
        }
        return response([
            'status'=> 'OK',
            'data'=> $check
        ], 200);
    }

    public function send(Request $request){

        $validator = \Validator::make($request->all(),  [
            'message' => 'required',
            'to_user_id' => 'required',
        ]);

        $myId = $request->user()->id;
        if($myId == $request->to_user_id){
            return response([
                'status' => 'Unavailable',
                'message' => "You cant send any messages to you yourself!"
            ], 503);
        }

        if ($validator->fails()) {
            return response([
                'status'=>"Error Request",
                'error' => $validator->messages()
            ],422) ;
        }

        $insert = new Message;
        $insert->from_user_id = $request->user()->id;
        $insert->message = $request->message;
        $insert->to_user_id = $request->to_user_id;
        $insert->save();
        return response([
            'status'=> 'OK',
            'message'=> 'message successfully sent!',
            'data'=> $insert
        ], 200);
    }
}
