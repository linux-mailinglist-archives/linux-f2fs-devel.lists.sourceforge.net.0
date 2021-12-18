Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBD347996F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Dec 2021 08:38:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1myUIY-0003rv-S0; Sat, 18 Dec 2021 07:38:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1myUIW-0003ro-RA
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Dec 2021 07:38:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GavzeK3f/3Qpd3SHTj9Cv/zAbtDcYsDonSxMjKtS7bY=; b=TP0aceDLNhu3OIH2NPqBjZFPaE
 geRAikkcVMirjWXjOvTIEo06l6zGykAQ7CrkzURyCz5xSRtl5Nx43awwrSDLWkAx3OvPY7z3eiKQD
 tA18IyCuMkup+fHf4hB8HrmT6x32sQBzTgl5I6fkIVWkxSizGdfBoW1Mx0HJe92bOKv0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GavzeK3f/3Qpd3SHTj9Cv/zAbtDcYsDonSxMjKtS7bY=; b=Gd1OqftPpqDs8cMA2OiwxvKrCn
 HrFNYc7GqP1XIOZQQf6xocAUu0cNaVjQRXlt2G44xv7R21jsiiTjRQzrXJyUzby/tLHOGuffh+NBe
 4ehiz3uKVbmYwVnxWbFEKZ8MxUdSBDjM0Zq9FoAg1iavuFsw99ozwhEo5pv0BfCEl1sE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1myUIW-001deY-0Z
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Dec 2021 07:38:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C0CD460AEB;
 Sat, 18 Dec 2021 07:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D79C36AE1;
 Sat, 18 Dec 2021 07:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639813101;
 bh=fH1OnEnXUbgxZhJkzTcwSewhsxEfWwqPzAzWjmmKyho=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cZcWMw9OQ17Dea+KB4gce6g5fMbtqFR7BgMXyAxxvLcUP5MzLhWEzpLoxot15qIJG
 RspSwWVipmyER1Wh00wXgq+pvbw35amY3RACVMtyQrVIUNh7TbdDTbe4CTdROzku6x
 7ddi6lSK/sOjxpFjUx78EReW97QyZQFRccXfV4FlnGGSFvepsKnNGM3s7nOwMWAJ4b
 470bGpnKmJPCAqcRbAGgku9Rh1FB/QiF3D+L23RIN4BRcpNSx+6zw3tJbNYifghzlP
 yn7FKq+7/0rBozp3iMBl844Sui4fDFE0DkIwOG/6K2Dy3SA82HBBaadorzZ1gy6mu1
 94q5CMMLA4RYw==
Message-ID: <f5a8634a-9e4b-c13b-65aa-0595cb8b73e6@kernel.org>
Date: Sat, 18 Dec 2021 15:38:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <1636438608-27597-1-git-send-email-niuzhiguo84@gmail.com>
 <YZU0TFBH6k2Q6fJZ@google.com>
 <e28d4963-d816-b568-dec8-60a79a9fe88d@kernel.org>
 <e25053e9-f97e-6a2f-3bac-acfcd689fdcb@kernel.org>
 <00db09fe-122a-2c2c-1c6c-b6987db3d78b@kernel.org>
 <YbzCB4ZmeFsWs1rq@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YbzCB4ZmeFsWs1rq@google.com>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/12/18 0:59, Jaegeuk Kim wrote: > On 12/17, Chao Yu
 wrote: >> On 2021/11/20 9:50, Chao Yu wrote: >>> On 2021/11/18 14:46, Chao
 Yu wrote: >>>> On 2021/11/18 0:56, Jaegeuk Kim wrote: >>>>> On 11/ [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1myUIW-001deY-0Z
Subject: Re: [f2fs-dev] [PATCH Vx 1/1] f2fs: Avoid deadlock between
 writeback and checkpoint
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
Cc: Jing.Xia@unisoc.com, niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/12/18 0:59, Jaegeuk Kim wrote:
> On 12/17, Chao Yu wrote:
>> On 2021/11/20 9:50, Chao Yu wrote:
>>> On 2021/11/18 14:46, Chao Yu wrote:
>>>> On 2021/11/18 0:56, Jaegeuk Kim wrote:
>>>>> On 11/09, niuzhiguo84@gmail.com wrote:
>>>>>> From: Zhiguo Niu <zhiguo.niu@unisoc.com>
>>>>>>
>>>>>> There could be a scenario as following:
>>>>>> The inodeA and inodeB are in b_io queue of writeback
>>>>>> inodeA : f2fs's node inode
>>>>>> inodeB : a dir inode with only one dirty pages, and the node page
>>>>>> of inodeB cached into inodeA
>>>>>>
>>>>>> writeback:
>>>>>>
>>>>>> wb_workfn
>>>>>> wb_writeback
>>>>>> blk_start_plug
>>>>>>             loop {
>>>>>>             queue_io
>>>>>>             progress=__writeback_inodes_wb
>>>>>>                     __writeback_single_inode
>>>>>>                             do_writepages
>>>>>>                                     f2fs_write_data_pages
>>>>>>                                     wbc->pages_skipped +=get_dirty_pages
>>>>>>                             inode->i_state &= ~dirty
>>>>>>                     wrote++
>>>>>>                     requeue_inode
>>>>>>             }
>>>>>> blk_finish_plug
>>>>>>
>>>>>> checkpoint:
>>>>>>
>>>>>> f2fs_write_checkpoint
>>>>>> f2fs_sync_dirty_inodes
>>>>>> filemap_fdatawrite
>>>>>> do_writepages
>>>>>> f2fs_write_data_pages
>>>>>>             f2fs_write_single_data_page
>>>>>>                     f2fs_do_write_data_page
>>>>>>                             set_page_writeback
>>>>>>                             f2fs_outplace_write_data
>>>>>>                                     f2fs_update_data_blkaddr
>>>>>>                                             f2fs_wait_on_page_writeback
>>>>>>                     inode_dec_dirty_pages
>>>>>>
>>>>>> 1. Writeback thread flush inodeA, and push it's bio request in task's plug;
>>>>>> 2. Checkpoint thread writes inodeB's dirty page, and then wait its node
>>>>>>         page writeback cached into inodeA which is in writeback task's plug
>>>>>> 3. Writeback thread flush inodeB and skip writing the dirty page as
>>>>>>         wb_sync_req[DATA] > 0.
>>>>>> 4. As none of the inodeB's page is marked as PAGECACHE_TAG_DIRTY, writeback
>>>>>>         thread clear inodeB's dirty state.
>>>>>> 5. Then inodeB is moved from b_io to b_dirty because of pages_skipped > 0
>>>>>>         as checkpoint thread is stuck before dec dirty_pages.
>>>>>>
>>>>>> This patch collect correct pages_skipped according to the tag state in
>>>>>> page tree of inode
>>>>>>
>>>>>> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
>>>>>> Signed-off-by: Jing Xia <jing.xia@unisoc.com>
>>>>>> ---
>>>>>>      fs/f2fs/data.c | 4 +++-
>>>>>>      1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>>>>> index f4fd6c246c9a..e98628e3868c 100644
>>>>>> --- a/fs/f2fs/data.c
>>>>>> +++ b/fs/f2fs/data.c
>>>>>> @@ -3237,7 +3237,9 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
>>>>>>      	return ret;
>>>>>>      skip_write:
>>>>>> -	wbc->pages_skipped += get_dirty_pages(inode);
>>>>>> +	wbc->pages_skipped +=
>>>>>> +		mapping_tagged(inode->i_mapping, PAGECACHE_TAG_DIRTY) ?
>>>>>
>>>>> Is there any race condition to get 0, if there's any dirty page? IOWs, it
>>>>
>>>> Quoted from Jing Xia's explanation:
>>>>
>>>> [T:writeback]				[T:checkpoint]
>>>
>>> My bad, [1] should be here:
>>>
>>> bio contains NodeA was plugged in writeback threads
>>>
>>> Thanks,
>>>
>>>> 					- do_writepages  -- sync write inodeB, inc wb_sync_req[DATA]
>>>> 					 - f2fs_write_data_pages
>>>> 					  - f2fs_write_single_data_page -- write last dirty page
>>>> 					   - f2fs_do_write_data_page
>>>> 					    - set_page_writeback  -- clear page dirty flag and
>>>> 					    PAGECACHE_TAG_DIRTY tag in radix tree
>>>> 					    - f2fs_outplace_write_data
>>>> 					     - f2fs_update_data_blkaddr
>>>> 					      - f2fs_wait_on_page_writeback -- wait NodeA to writeback here
>>
>> Jaegeuk,
>>
>> checkpoint() will stuck on waiting NodeA to writeback.
>>
>>>> 					   - inode_dec_dirty_pages
>>>
>>>> bio contains NodeA was plugged in writeback threads
>>>
>>> [1]
>>>
>>> Thanks,
>>>
>>>> - writeback_sb_inodes
>>>>      - writeback_single_inode
>>>>       - do_writepages
>>>>        - f2fs_write_data_pages -- skip writepages due to wb_sync_req[DATA]
>>>>         - wbc->pages_skipped += get_dirty_pages() -- PAGECACHE_TAG_DIRTY is not set but get_dirty_pages() returns one
>>>>      - requeue_inode -- requeue inode to wb->b_dirty queue due to non-zero.pages_skipped
>>
>> Meanwhile, kworker plugged NodeA, and then loop writebacking inode due to
>> inode will be requeued all the time.
> 
> I'm thinking that this will be released after finishing node writes in a
> different context. Then, this loop can happen in that time period which
> is NOT forever. But, if we want to avoid this temporary loop, we may be

I doubt it may break due to below condition in writeback_sb_inodes():

		if (need_resched()) {
			/*
			 * We're trying to balance between building up a nice
			 * long list of IOs to improve our merge rate, and
			 * getting those IOs out quickly for anyone throttling
			 * in balance_dirty_pages().  cond_resched() doesn't
			 * unplug, so get our IOs out the door before we
			 * give up the CPU.
			 */
			if (current->plug)
				blk_flush_plug(current->plug, false);
			cond_resched();
		}

But as Zhiguo Niu and Jing Xia reported, blk_flush_plug was not executed...

> able to decrease the dirty count before f2fs_update_data_blkaddr().

I guess there is one simple way, we can force flushing plugged bio via
blk_flush_plug(current->plug, false) once we skip writeback in writepages()
due to sbi->wb_sync_req[DATA/NODE] is valid.

Thoughts?

Thanks,

> 
>>
>> Thanks,
>>
>>>>
>>>>> seems the current condition is just requeuing the inode as dirty, but next
>>>>> flushing time will remove it from dirty list. Is this giving too much overheads?
>>>>
>>>> I prefer to let writeback thread call blk_flush_plug() after skipping
>>>> writepages() due to wb_sync_req[DATA/NODE] check condition, thoughts?
>>>>
>>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>>> index 9f754aaef558..b6e1ed73f8f5 100644
>>>> --- a/fs/f2fs/data.c
>>>> +++ b/fs/f2fs/data.c
>>>> @@ -3087,6 +3087,8 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>>>>      			/* give a priority to WB_SYNC threads */
>>>>      			if (atomic_read(&sbi->wb_sync_req[DATA]) &&
>>>>      					wbc->sync_mode == WB_SYNC_NONE) {
>>>> +				if (current->plug)
>>>> +					blk_flush_plug(current->plug, false);
>>>>      				done = 1;
>>>>      				break;
>>>>      			}
>>>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>>>> index 556fcd8457f3..dd9a817d8dab 100644
>>>> --- a/fs/f2fs/node.c
>>>> +++ b/fs/f2fs/node.c
>>>> @@ -1946,6 +1946,8 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>>>>      			if (atomic_read(&sbi->wb_sync_req[NODE]) &&
>>>>      					wbc->sync_mode == WB_SYNC_NONE) {
>>>>      				done = 1;
>>>> +				if (current->plug)
>>>> +					blk_flush_plug(current->plug, false);
>>>>      				break;
>>>>      			}
>>>>
>>>>
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>>> +		get_dirty_pages(inode) : 0;
>>>>>>      	trace_f2fs_writepages(mapping->host, wbc, DATA);
>>>>>>      	return 0;
>>>>>>      }
>>>>>> -- 
>>>>>> 2.28.0
>>>>
>>>>
>>>> _______________________________________________
>>>> Linux-f2fs-devel mailing list
>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>>>
>>>
>>>
>>> _______________________________________________
>>> Linux-f2fs-devel mailing list
>>> Linux-f2fs-devel@lists.sourceforge.net
>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
