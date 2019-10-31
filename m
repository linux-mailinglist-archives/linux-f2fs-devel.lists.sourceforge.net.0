Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A916EA938
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2019 03:21:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQ05c-0002Fw-M0; Thu, 31 Oct 2019 02:21:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iQ05b-0002Fi-1V
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 02:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vSKYhu2uHli6FeH0PL1g2yI1phj/k2y6Ngo5LUIb8Tc=; b=N44HM4Grf3wKay0HpEheLINt6q
 O7nbl1Jknv0ZeyteabJJD2z0/2ATAuWmDLH7dNOhzs+uNkKujlPlCzUn4x5oMiARKhvtmzfLP594m
 TybQzbZe1ofmTV+ZeUsyBvAxUAxP2MjmjoLb8VDqEwECLKE/1y3QcWkWWizjEMGIQGOI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vSKYhu2uHli6FeH0PL1g2yI1phj/k2y6Ngo5LUIb8Tc=; b=kwg/xYRybrK6xhMr7QokIRNK9d
 l+7LJTbOfM0k/5KgwK3iHb/5x5vw6Cz4sruYrFf1qoWgr67iFHkqmE3ypBBkCd7eDdsHsC/V3Tfhz
 APu/dZjPQme1mGwNU7W7R+mYTBzAnmvLZ4+mLsURAIjiaa6k/EfgohLxetFCk/TsZCDs=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iQ05Y-009q4W-Hy
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 02:21:31 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 990323473B9ACFDD1725;
 Thu, 31 Oct 2019 10:21:18 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 31 Oct
 2019 10:21:13 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20191022171602.93637-1-jaegeuk@kernel.org>
 <20191022171602.93637-2-jaegeuk@kernel.org>
 <20191027225006.GA321938@sol.localdomain>
 <da214cdc-0074-b7bf-7761-d4c4ad3d4f6a@huawei.com>
 <20191030025512.GA4791@sol.localdomain>
 <97c33fa1-15af-b319-29a1-22f254a26c0a@huawei.com>
 <20191030170246.GB693@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <55f1c893-09c5-5a8e-d493-8cae51b9e2a6@huawei.com>
Date: Thu, 31 Oct 2019 10:21:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191030170246.GB693@sol.localdomain>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iQ05Y-009q4W-Hy
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: support data compression
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/10/31 1:02, Eric Biggers wrote:
> On Wed, Oct 30, 2019 at 04:43:52PM +0800, Chao Yu wrote:
>>>>>>  static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
>>>>>>  {
>>>>>> -	/*
>>>>>> -	 * We use different work queues for decryption and for verity because
>>>>>> -	 * verity may require reading metadata pages that need decryption, and
>>>>>> -	 * we shouldn't recurse to the same workqueue.
>>>>>> -	 */
>>>>>
>>>>> Why is it okay (i.e., no deadlocks) to no longer use different work queues for
>>>>> decryption and for verity?  See the comment above which is being deleted.
>>>>
>>>> Could you explain more about how deadlock happen? or share me a link address if
>>>> you have described that case somewhere?
>>>>
>>>
>>> The verity work can read pages from the file which require decryption.  I'm
>>> concerned that it could deadlock if the work is scheduled on the same workqueue.
>>
>> I assume you've tried one workqueue, and suffered deadlock..
>>
>>> Granted, I'm not an expert in Linux workqueues, so if you've investigated this
>>> and determined that it's safe, can you explain why?
>>
>> I'm not familiar with workqueue...  I guess it may not safe that if the work is
>> scheduled to the same cpu in where verity was waiting for data? if the work is
>> scheduled to other cpu, it may be safe.
>>
>> I can check that before splitting the workqueue for verity and decrypt/decompress.
>>
> 
> Yes this is a real problem, try 'kvm-xfstests -c f2fs/encrypt generic/579'.
> The worker thread gets deadlocked in f2fs_read_merkle_tree_page() waiting for
> the Merkle tree page to be decrypted.  This is with the v2 compression patch;
> it works fine on current mainline.

Oh, alright...

Let me split them, thanks very much for all the comments and test anyway.

Thanks,

> 
> INFO: task kworker/u5:0:61 blocked for more than 30 seconds.
>       Not tainted 5.4.0-rc1-00119-g464e31ba60d0 #13
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> kworker/u5:0    D    0    61      2 0x80004000
> Workqueue: f2fs_post_read_wq f2fs_post_read_work
> Call Trace:
>  context_switch kernel/sched/core.c:3384 [inline]
>  __schedule+0x299/0x6c0 kernel/sched/core.c:4069
>  schedule+0x44/0xd0 kernel/sched/core.c:4136
>  io_schedule+0x11/0x40 kernel/sched/core.c:5780
>  wait_on_page_bit_common mm/filemap.c:1174 [inline]
>  wait_on_page_bit mm/filemap.c:1223 [inline]
>  wait_on_page_locked include/linux/pagemap.h:527 [inline]
>  wait_on_page_locked include/linux/pagemap.h:524 [inline]
>  wait_on_page_read mm/filemap.c:2767 [inline]
>  do_read_cache_page+0x407/0x660 mm/filemap.c:2810
>  read_cache_page+0xd/0x10 mm/filemap.c:2894
>  f2fs_read_merkle_tree_page+0x2e/0x30 include/linux/pagemap.h:396
>  verify_page+0x110/0x560 fs/verity/verify.c:120
>  fsverity_verify_bio+0xe6/0x1a0 fs/verity/verify.c:239
>  verity_work fs/f2fs/data.c:142 [inline]
>  f2fs_post_read_work+0x36/0x50 fs/f2fs/data.c:160
>  process_one_work+0x225/0x550 kernel/workqueue.c:2269
>  worker_thread+0x4b/0x3c0 kernel/workqueue.c:2415
>  kthread+0x125/0x140 kernel/kthread.c:255
>  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> INFO: task kworker/u5:1:1140 blocked for more than 30 seconds.
>       Not tainted 5.4.0-rc1-00119-g464e31ba60d0 #13
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> kworker/u5:1    D    0  1140      2 0x80004000
> Workqueue: f2fs_post_read_wq f2fs_post_read_work
> Call Trace:
>  context_switch kernel/sched/core.c:3384 [inline]
>  __schedule+0x299/0x6c0 kernel/sched/core.c:4069
>  schedule+0x44/0xd0 kernel/sched/core.c:4136
>  io_schedule+0x11/0x40 kernel/sched/core.c:5780
>  wait_on_page_bit_common mm/filemap.c:1174 [inline]
>  wait_on_page_bit mm/filemap.c:1223 [inline]
>  wait_on_page_locked include/linux/pagemap.h:527 [inline]
>  wait_on_page_locked include/linux/pagemap.h:524 [inline]
>  wait_on_page_read mm/filemap.c:2767 [inline]
>  do_read_cache_page+0x407/0x660 mm/filemap.c:2810
>  read_cache_page+0xd/0x10 mm/filemap.c:2894
>  f2fs_read_merkle_tree_page+0x2e/0x30 include/linux/pagemap.h:396
>  verify_page+0x110/0x560 fs/verity/verify.c:120
>  fsverity_verify_bio+0xe6/0x1a0 fs/verity/verify.c:239
>  verity_work fs/f2fs/data.c:142 [inline]
>  f2fs_post_read_work+0x36/0x50 fs/f2fs/data.c:160
>  process_one_work+0x225/0x550 kernel/workqueue.c:2269
>  worker_thread+0x4b/0x3c0 kernel/workqueue.c:2415
>  kthread+0x125/0x140 kernel/kthread.c:255
>  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> 
> Showing all locks held in the system:
> 1 lock held by khungtaskd/21:
>  #0: ffffffff82250520 (rcu_read_lock){....}, at: rcu_lock_acquire.constprop.0+0x0/0x30 include/trace/events/lock.h:13
> 2 locks held by kworker/u5:0/61:
>  #0: ffff88807b78eb28 ((wq_completion)f2fs_post_read_wq){+.+.}, at: set_work_data kernel/workqueue.c:619 [inline]
>  #0: ffff88807b78eb28 ((wq_completion)f2fs_post_read_wq){+.+.}, at: set_work_pool_and_clear_pending kernel/workqueue.c:647 [inline]
>  #0: ffff88807b78eb28 ((wq_completion)f2fs_post_read_wq){+.+.}, at: process_one_work+0x1ad/0x550 kernel/workqueue.c:2240
>  #1: ffffc90000253e50 ((work_completion)(&ctx->work)){+.+.}, at: set_work_data kernel/workqueue.c:619 [inline]
>  #1: ffffc90000253e50 ((work_completion)(&ctx->work)){+.+.}, at: set_work_pool_and_clear_pending kernel/workqueue.c:647 [inline]
>  #1: ffffc90000253e50 ((work_completion)(&ctx->work)){+.+.}, at: process_one_work+0x1ad/0x550 kernel/workqueue.c:2240
> 2 locks held by kworker/u5:1/1140:
>  #0: ffff88807b78eb28 ((wq_completion)f2fs_post_read_wq){+.+.}, at: set_work_data kernel/workqueue.c:619 [inline]
>  #0: ffff88807b78eb28 ((wq_completion)f2fs_post_read_wq){+.+.}, at: set_work_pool_and_clear_pending kernel/workqueue.c:647 [inline]
>  #0: ffff88807b78eb28 ((wq_completion)f2fs_post_read_wq){+.+.}, at: process_one_work+0x1ad/0x550 kernel/workqueue.c:2240
>  #1: ffffc9000174be50 ((work_completion)(&ctx->work)){+.+.}, at: set_work_data kernel/workqueue.c:619 [inline]
>  #1: ffffc9000174be50 ((work_completion)(&ctx->work)){+.+.}, at: set_work_pool_and_clear_pending kernel/workqueue.c:647 [inline]
>  #1: ffffc9000174be50 ((work_completion)(&ctx->work)){+.+.}, at: process_one_work+0x1ad/0x550 kernel/workqueue.c:2240
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
