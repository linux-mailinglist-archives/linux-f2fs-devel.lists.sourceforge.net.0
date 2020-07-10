Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0055921B036
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 09:31:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtnVJ-0005G1-KC; Fri, 10 Jul 2020 07:31:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jtnVI-0005Fv-UE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 07:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EWJBoxA0XEgHqWiP+l/gtDl5KNS+ET0MRzulqf8+q6s=; b=X9uM52HuPR8/sk/cDwPauBQWp7
 2WOK0a4VTmRExbpUUC6QTMr/vDDXLyemdmEW7pLxlJJs03/5wHvpGHQKma82jcv+bPfq1B6dnKYGo
 UnwJOogposzgMT7OsVAP6A0irLxqgOT4l//kH82Mcq1ZGccag+diSPsdVLA4cERGvj9s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EWJBoxA0XEgHqWiP+l/gtDl5KNS+ET0MRzulqf8+q6s=; b=fvEjaytEbPSLCO2SlDL5qOibry
 LlLzgxbBLR1kT++nMBlCk5Z4UoauPTX7kWPzDt8a7S9lLmmWJnIPcxKBsZeLC4613NpkJD2YtlUFS
 jmVaMqeWtydv3Ef9d300PjiwytStLXbUBJwV2aoJH3sUCWDsy2xBxLn6ZzZ7AehPiYPE=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtnVG-001k47-R9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 07:31:28 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C4F5854D36CBD665BFCE;
 Fri, 10 Jul 2020 15:31:12 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 10 Jul
 2020 15:31:11 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200709053027.351974-1-jaegeuk@kernel.org>
 <2f4207db-57d1-5b66-f1ee-3532feba5d1f@huawei.com>
 <20200709190545.GA3001066@google.com>
 <ae1a3e8a-6209-8d4b-7235-5c8897076501@huawei.com>
 <20200710032616.GC545837@google.com>
 <01d0db54-eee1-f6cd-76c3-ebe59a7abae4@huawei.com>
 <20200710035053.GH545837@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <77041117-f615-e6e6-591c-b02bf99e58c2@huawei.com>
Date: Fri, 10 Jul 2020 15:31:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200710035053.GH545837@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtnVG-001k47-R9
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't skip writeback of quota data
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/7/10 11:50, Jaegeuk Kim wrote:
> On 07/10, Chao Yu wrote:
>> On 2020/7/10 11:26, Jaegeuk Kim wrote:
>>> On 07/10, Chao Yu wrote:
>>>> On 2020/7/10 3:05, Jaegeuk Kim wrote:
>>>>> On 07/09, Chao Yu wrote:
>>>>>> On 2020/7/9 13:30, Jaegeuk Kim wrote:
>>>>>>> It doesn't need to bypass flushing quota data in background.
>>>>>>
>>>>>> The condition is used to flush quota data in batch to avoid random
>>>>>> small-sized udpate, did you hit any problem here?
>>>>>
>>>>> I suspect this causes fault injection test being stuck by waiting for inode
>>>>> writeback completion. With this patch, it has been running w/o any issue so far.
>>>>> I keep an eye on this.
>>>>
>>>> Hmmm.. so that this patch may not fix the root cause, and it may hiding the
>>>> issue deeper.
>>>>
>>>> How about just keeping this patch in our private branch to let fault injection
>>>> test not be stuck? until we find the root cause in upstream codes.
>>>
>>> Well, I don't think this hides something. When the issue happens, I saw inodes
>>> being stuck due to writeback while only quota has some dirty data. At that time,
>>> there was no dirty data page from other inodes.
>>
>> Okay,
>>
>>>
>>> More specifically, I suspect __writeback_inodes_sb_nr() gives WB_SYNC_NONE and
>>> waits for wb_wait_for_completion().
>>
>> Did you record any callstack after the issue happened?
> 
> I found this.
> 
> [213389.297642]  __schedule+0x2dd/0x780^M
> [213389.299224]  schedule+0x55/0xc0^M
> [213389.300745]  wb_wait_for_completion+0x56/0x90^M
> [213389.302469]  ? wait_woken+0x80/0x80^M
> [213389.303997]  __writeback_inodes_sb_nr+0xa8/0xd0^M
> [213389.305760]  writeback_inodes_sb+0x4b/0x60^M
> [213389.307439]  sync_filesystem+0x2e/0xa0^M
> [213389.308999]  generic_shutdown_super+0x27/0x110^M
> [213389.310738]  kill_block_super+0x27/0x50^M
> [213389.312327]  kill_f2fs_super+0x76/0xe0 [f2fs]^M
> [213389.314014]  deactivate_locked_super+0x3b/0x80^M
> [213389.315692]  deactivate_super+0x3e/0x50^M
> [213389.317226]  cleanup_mnt+0x109/0x160^M
> [213389.318718]  __cleanup_mnt+0x12/0x20^M
> [213389.320177]  task_work_run+0x70/0xb0^M
> [213389.321609]  exit_to_usermode_loop+0x131/0x160^M
> [213389.323306]  do_syscall_64+0x170/0x1b0^M
> [213389.324762]  entry_SYSCALL_64_after_hwframe+0x44/0xa9^M
> [213389.326477] RIP: 0033:0x7fc4b5e6a35b^M

Does this only happen during umount? If so, will below change help?

	if ((S_ISDIR(inode->i_mode) || IS_NOQUOTA(inode)) &&
+			!is_sbi_flag_set(sbi, SBI_IS_CLOSE) &&
			wbc->sync_mode == WB_SYNC_NONE &&
			get_dirty_pages(inode) < nr_pages_to_skip(sbi, DATA) &&
			f2fs_available_free_memory(sbi, DIRTY_DENTS))
		goto skip_write;

> 
>>
>> Still I'm confused that why directory's data written could be skipped, but
>> quota's data couldn't, what's the difference?
> 
> I suspect different blocking timing from cp_error between quota and dentry.
> e.g., we block dir operations right after cp_error, while quota can make

No guarantee that there is no dirty dentry being created after
cp_error, right?

e.g.

Thread A				Thread B
- f2fs_create
- bypass f2fs_cp_error
					- set cp_error
- create dirty dentry

BTW, do you know what __writeback_inodes_sb_nr is waiting for?

> dirty pages in more fine granularity.
> 
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>> Thanks,
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>>>> ---
>>>>>>>  fs/f2fs/data.c | 2 +-
>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>>>>>> index 44645f4f914b6..72e8b50e588c1 100644
>>>>>>> --- a/fs/f2fs/data.c
>>>>>>> +++ b/fs/f2fs/data.c
>>>>>>> @@ -3148,7 +3148,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
>>>>>>>  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
>>>>>>>  		goto skip_write;
>>>>>>>  
>>>>>>> -	if ((S_ISDIR(inode->i_mode) || IS_NOQUOTA(inode)) &&
>>>>>>> +	if (S_ISDIR(inode->i_mode) &&
>>>>>>>  			wbc->sync_mode == WB_SYNC_NONE &&
>>>>>>>  			get_dirty_pages(inode) < nr_pages_to_skip(sbi, DATA) &&
>>>>>>>  			f2fs_available_free_memory(sbi, DIRTY_DENTS))
>>>>>>>
>>>>> .
>>>>>
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
