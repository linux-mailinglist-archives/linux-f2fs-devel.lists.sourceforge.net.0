Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6572921F087
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2020 14:13:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jvJoW-0003ip-BF; Tue, 14 Jul 2020 12:13:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jvJoV-0003ic-4n
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jul 2020 12:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uJaJMB17KX7fMrHuHNVh8/qLjr0BHLmlrg9QTfLdCFw=; b=F+3zVAppKM8sO7p4PJUz+bo3ue
 Y0zO+Krv0NibWse8qsaIHWIp8aXSaLQsDmEg30HLwfjLYkB4g/22pHW1wTGiGkdKamnvTYaIyOLdx
 MObPes7uX94Efm1Nlh2gV3Yca7vS01gmyK0FDAtTNBAURFYT23I3iyyL3UUb38MrEuqk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uJaJMB17KX7fMrHuHNVh8/qLjr0BHLmlrg9QTfLdCFw=; b=fG5Azwvo7I35Xym4LjkfOZmqBp
 l0s6fb8bGCOw3YIpZL57jkHoaznKjQ79rD54WoNRoUDdpdjquFjFu1HmoUrUlnO/qVoDi3y1JzMl1
 Z3HlGzo10fjfCWEpI9XsbKTR/LkefMUODP7Is7nkTE2ijSbHls/J3MOpirPn84iYVou4=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jvJoS-006tRp-CG
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jul 2020 12:13:35 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C2F02EE3B9B4ED84A2DB;
 Tue, 14 Jul 2020 20:13:23 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 14 Jul
 2020 20:13:19 +0800
To: Sahitya Tummala <stummala@codeaurora.org>
References: <20200710023019.GD2916@codeaurora.org>
 <dcb68985-d621-6ef1-7452-172280148aa1@huawei.com>
 <20200710033905.GE2916@codeaurora.org>
 <1de32d22-caa3-c69c-66c8-e3a8d920ca6c@huawei.com>
 <20200710100752.GF2916@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f02ab4f9-32cf-9495-db2e-09266cce7191@huawei.com>
Date: Tue, 14 Jul 2020 20:13:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200710100752.GF2916@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvJoS-006tRp-CG
Subject: Re: [f2fs-dev] IO hang due to f2fs checkpoint and writeback stuck
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/7/10 18:07, Sahitya Tummala wrote:
> On Fri, Jul 10, 2020 at 04:40:19PM +0800, Chao Yu wrote:
>> On 2020/7/10 11:39, Sahitya Tummala wrote:
>>> Hi Chao,
>>>
>>> On Fri, Jul 10, 2020 at 10:54:13AM +0800, Chao Yu wrote:
>>>> Hi Sahitya,
>>>>
>>>> It looks block plug has already been removed by Jaegeuk with
>>>> below commit:
>>>>
>>>> commit 1f5f11a3c41e2b23288b2769435a00f74e02496b
>>>> Author: Jaegeuk Kim <jaegeuk@kernel.org>
>>>> Date:   Fri May 8 12:25:45 2020 -0700
>>>>
>>>>     f2fs: remove blk_plugging in block_operations
>>>>
>>>>     blk_plugging doesn't seem to give any benefit.
>>>>
>>>> How about backporting this patch?
>>>
>>> Yes, I have noticed that patch. But we have nested pluglists in
>>> the block_operations path. Hence, I was not sure if that patch alone
>>> can help.
>>> 1. At the start of  block_operations
>>> 2. Inside __f2fs_write_data_pages() that gets called from
>>> f2fs_sync_dirty_inodes()->filemap_fdatawrite()
>>
>> Would be more safe to call io_schedule() in f2fs_sync_dirty_inodes()?
>>
>> - io_schedule()
>>  - schedule()
>>   - sched_submit_work()
>>    - blk_schedule_flush_plug()
>>     - blk_flush_plug_list()
>>
> 
> With Jaegeuk's patch, we will only have the plug list in CP path - inside
> __f2fs_write_data_pages(), which can now be flushed as its not nested
> anymore.
> 
>         blk_start_plug(&plug);
>         ret = f2fs_write_cache_pages(mapping, wbc, io_type);
>         blk_finish_plug(&plug);
> 
> Earlier this blk_finish_plug() will not flush the plug list as the bios

Oh, correct, because blk_finish_plug() will check caller passed &plug and
plug assigned in current structure...

void blk_finish_plug(struct blk_plug *plug)
{
	if (plug != current->plug)
		return;
	blk_flush_plug_list(plug, false);

	current->plug = NULL;
}

> are attached to the outer plug from block_operations. So I think Jaegeuk's
> patch alone also can help this issue.
> 
>>>
>>> Do you know the possible path for this issue scenario to happen?> Where does in the CP path before even f2fs_sync_node_pages() is done, the
>>> node pages cab be submitted for io and get attached to CP plug list?
>>
>> Maybe:
>>
>> writeback_inodes_wb
>>  blk_start_plug                     ---plugged
>>   __writeback_inodes_wb
>>    writeback_sb_inodes
>>     __writeback_single_inode
>>      do_writepages
>>       f2fs_write_node_pages
>>        blk_start_plug               ---plugged
>>        f2fs_sync_node_pages
>>         __write_node_page(do_balance=true)  --submit node page to plug
>>          f2fs_balance_fs
>>           f2fs_balance_fs_bg
>>            f2fs_sync_fs
>>             f2fs_write_checkpoint
>>           or
>>           f2fs_gc
>>            f2fs_write_checkpoint
>>        blk_start_plug
>>  blk_finish_plug
>>
> 
> Hmmm, but from ramdumps the CP thread stack is shown as below.
> 
> f2fs_sync_file
> f2fs_do_sync_file
> f2fs_sync_fs
> f2fs_write_checkpoint

Alright, then, I don't think there is another plug in block_operation()'s
caller.

Thanks,

> 
> Thanks,
> 
>> Thanks,
>>
>>>
>>> Thanks,
>>>
>>>>
>>>> On 2020/7/10 10:30, Sahitya Tummala wrote:
>>>>> Hi Chao, Jaegeuk,
>>>>>
>>>>> I have received an issue report that indicates that system is stuck
>>>>> on IO due to f2fs checkpoint and writeback stuck waiting on each other
>>>>> as explained below.
>>>>>
>>>>> WB thread -
>>>>> ----------
>>>>>
>>>>> io_schedule
>>>>> wait_on_page_bit
>>>>> f2fs_wait_on_page_writeback -> It is waiting for node
>>>>> 			node page writeback whose bio is in the
>>>>> 			plug list of CP thread below.
>>>>> f2fs_update_data_blkaddr
>>>>> f2fs_outplace_write_data
>>>>> f2fs_do_write_data_page
>>>>> __write_data_page
>>>>> __f2fs_write_data_pages
>>>>> f2fs_write_data_pages
>>>>> do_writepages
>>>>>
>>>>> CP thread -
>>>>> -----------
>>>>>
>>>>> __f2fs_write_data_pages -> It is for the same inode above that is under WB (which
>>>>> 	is waiting for node page writeback). In this context, there is nothing to
>>>>> 	be written as the data is already under WB. 
>>>>> filemap_fdatawrite
>>>>> f2fs_sync_dirty_inodes -> It just loops here in f2fs_sync_dirty_inodes() until
>>>>> 			f2fs_remove_dirty_inode() has been done by the WB thread above.
>>>>> block_operations
>>>>> f2fs_write_checkpoint
>>>>>
>>>>> The CP thread somehow has the node page bio in its plug list that cannot be submitted 
>>>>> until end of block_operations() and CP thread is blocked on WB of an inode who is again
>>>>> waiting for io pending in CP plug list. Both the stacks are stuck on for each other.
>>>>>
>>>>> The below patch helped to solve the issue, please review and suggest if this seems to 
>>>>> be okay. Since anyways we are doing cond_resched(), I thought it will be good to flush
>>>>> the plug list as well (in this issue case, it will loop for the same inode again and again).
>>>>>
>>>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>>>>> index e460d90..152df48 100644
>>>>> --- a/fs/f2fs/checkpoint.c
>>>>> +++ b/fs/f2fs/checkpoint.c
>>>>> @@ -1071,10 +1071,12 @@ int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type)
>>>>>
>>>>>                 iput(inode);
>>>>>                 /* We need to give cpu to another writers. */
>>>>> -               if (ino == cur_ino)
>>>>> +               if (ino == cur_ino) {
>>>>> +                       blk_flush_plug(current);
>>>>>                         cond_resched();
>>>>> -               else
>>>>> +                } else {
>>>>>                         ino = cur_ino;
>>>>> +                }
>>>>>         } else {
>>>>>                 /*
>>>>>                  * We should submit bio, since it exists several
>>>>>
>>>>> Thanks,
>>>>>
>>>
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
