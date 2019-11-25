<?php

use Illuminate\Database\Seeder;

class PostSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $arr = [];
        for($i=0;$i<50;$i++){
        	$tmp = [];
        	$tmp['title'] = str_random(20);
        	$tmp['content'] = '<p><img src="/ueditor/php/upload/image/20170119/1484775656.jpg" title="1484775656.jpg" alt="1.jpg"/></p><p><img src="/ueditor/php/upload/image/20170119/1484775663.jpg" title="1484775663.jpg" alt="2.jpg"/></p><p><img src="/ueditor/php/upload/image/20170119/1484775674.jpg" title="1484775674.jpg" alt="3.jpg"/></p>';
        	$tmp['user_id'] = 1;
        	$tmp['cate_id'] = rand(1,6);
        	$tmp['img'] = '/Upload/2017-01-18/1484775684442938.jpg';
        	$tmp['created_at'] = date('Y-m-d H:i:s');
        	$tmp['updated_at'] = date('Y-m-d H:i:s');
        	$arr[] = $tmp;
        }
        DB::table('posts')->insert($arr);
    }
}
