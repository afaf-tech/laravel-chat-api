<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Message;
use DB;
class MessageController extends Controller
{
    //


    public function all(Request $request){
        $myId = $request->user()->id;

        $check = DB::table('table_messages as m')
                ->select('u.name','m.to_user_id', DB::raw('(CASE
                WHEN m.is_read = 0 THEN  COUNT(m.is_read)  END) AS unread_count'))
                ->leftJoin('users as u', 'u.id', '=', 'm.to_user_id')
                ->groupBy('m.to_user_id', 'u.name', 'm.is_read')
                ->where('m.from_user_id', $myId)
                // ->orderBy('m.sent_at', 'desc')
                ->get();

        if(!$check){
            return response([
                'status' => 'Not Found',
                'message' => "No Data Found"
            ], 404);
        }

        foreach ($check as $key => $value) {
            if(!is_null($value->unread_count)){
                $value->last_message = DB::table('table_messages')->where('to_user_id',$value->to_user_id)->where('from_user_id',$myId)->latest('sent_at')->first();
            }else{
                $value->last_message = DB::table('table_messages')->where('to_user_id',$value->to_user_id)->where('from_user_id',$myId)->latest('sent_at')->first();
                $value->unread_count = 0;
            }
        }


        return response([
            'status'=> 'OK',
            'data'=> $check
        ], 200);
    }

    public function with(Request $request, $id_user){
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

        $fromMe = DB::table('table_messages as m')
                ->select('m.message_id', 'm.message','m.sent_at', DB::raw('(CASE
                WHEN m.from_user_id = "'.$myId.'" THEN u.name ELSE "you" END) AS sender'), 'm.is_read')
                ->join('users as u', function ($join) use ($myId, $id_user) {
                    $join->on('u.id', '=', 'm.to_user_id')
                        ->where('m.to_user_id', '=', $id_user )
                        ->where('m.from_user_id', $myId);
                })->get()->toArray();
        $fromAnotherUser = DB::table('table_messages as m')
                ->select('m.message_id', 'm.message','m.sent_at', DB::raw('(CASE
                WHEN m.to_user_id = "'.$id_user.'" THEN u.name ELSE "you" END) AS sender'), 'm.is_read')
                ->join('users as u', function ($join) use ($myId, $id_user) {
                    $join->on('u.id', '=', 'm.to_user_id')
                        ->where('m.from_user_id', '=', $id_user )
                        ->where('m.to_user_id', $myId);
                })->get()->toArray();
        $result = array_merge( $fromMe, $fromAnotherUser );
        // $result = array_map("unserialize", array_unique(array_map("serialize", $result)));
        sort( $result );
        if(!$result){
            return response([
                'status' => 'Not Found',
                'message' => "No Messages Found"
            ], 404);
        }
        return response([
            'status'=> 'OK',
            'data'=> $result
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
