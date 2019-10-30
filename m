Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 582F0EA23C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2019 18:03:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPrN6-00021h-4I; Wed, 30 Oct 2019 17:03:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iPrN4-00021T-Lr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 17:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fvyvxoRwDboaoj51ITGUwr/ZtYUfTwPK1LoJUkOwM6I=; b=jl955BV+qAzIEp8FmZ3Wd47yB2
 0i5KRpJk4i97va1QcIhWXo45mPxst3gaRIEAwjHEPObcKAGfJAV3XqICZi3/SbJ6mF5H+qRRz0IaT
 gPjn6tLxpobIV2C5gMDXqQB8dSoQS0o3onjq3JddU8fHIOL/w3Er349r4OHzS4SDCbc0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fvyvxoRwDboaoj51ITGUwr/ZtYUfTwPK1LoJUkOwM6I=; b=E9mTcr3sUEGXsMpTsGNFZR8j5C
 quBM4p1Tz1fzetqSt7Ol2n/nMOy9Q32zIbDVSotp4rj7rTDCzSTOEm0WS528QgOafRAQJUEhmVfaZ
 sfaspGvlKjG0sYCkrYKB1u6P27JDGOXnVbfFUjqGoP2yebyQY7JZKMROWYg4dWQoRF7I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iPrN2-00B6jB-JS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 17:02:58 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A82020650;
 Wed, 30 Oct 2019 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572454968;
 bh=pDmWHhgixxSGSlKcG7JAEENyJI4HshThaEn6KOyP4vo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qlid3cbSHifQ5VBTBwWCswcADBqOYlpYNTDwf18VN+2n0WwB98+Zk2NE12TtkO7VZ
 RchFjNgMFSiOxgytvgE1gHS8eoJ3KsezXMVzIY3ylNRKv/nww7t/trpPdz5rgY1je/
 OjWRmIQCVFBnYSuVgOMHOUMuDJqxFspxdMM4fUak=
Date: Wed, 30 Oct 2019 10:02:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20191030170246.GB693@sol.localdomain>
Mail-Followup-To: Chao Yu <yuchao0@huawei.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20191022171602.93637-1-jaegeuk@kernel.org>
 <20191022171602.93637-2-jaegeuk@kernel.org>
 <20191027225006.GA321938@sol.localdomain>
 <da214cdc-0074-b7bf-7761-d4c4ad3d4f6a@huawei.com>
 <20191030025512.GA4791@sol.localdomain>
 <97c33fa1-15af-b319-29a1-22f254a26c0a@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <97c33fa1-15af-b319-29a1-22f254a26c0a@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iPrN2-00B6jB-JS
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 30, 2019 at 04:43:52PM +0800, Chao Yu wrote:
> >>>>  static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
> >>>>  {
> >>>> -	/*
> >>>> -	 * We use different work queues for decryption and for verity because
> >>>> -	 * verity may require reading metadata pages that need decryption, and
> >>>> -	 * we shouldn't recurse to the same workqueue.
> >>>> -	 */
> >>>
> >>> Why is it okay (i.e., no deadlocks) to no longer use different work queues for
> >>> decryption and for verity?  See the comment above which is being deleted.
> >>
> >> Could you explain more about how deadlock happen? or share me a link address if
> >> you have described that case somewhere?
> >>
> > 
> > The verity work can read pages from the file which require decryption.  I'm
> > concerned that it could deadlock if the work is scheduled on the same workqueue.
> 
> I assume you've tried one workqueue, and suffered deadlock..
> 
> > Granted, I'm not an expert in Linux workqueues, so if you've investigated this
> > and determined that it's safe, can you explain why?
> 
> I'm not familiar with workqueue...  I guess it may not safe that if the work is
> scheduled to the same cpu in where verity was waiting for data? if the work is
> scheduled to other cpu, it may be safe.
> 
> I can check that before splitting the workqueue for verity and decrypt/decompress.
> 

Yes this is a real problem, try 'kvm-xfstests -c f2fs/encrypt generic/579'.
The worker thread gets deadlocked in f2fs_read_merkle_tree_page() waiting for
the Merkle tree page to be decrypted.  This is with the v2 compression patch;
it works fine on current mainline.

INFO: task kworker/u5:0:61 blocked for more than 30 seconds.
      Not tainted 5.4.0-rc1-00119-g464e31ba60d0 #13
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kworker/u5:0    D    0    61      2 0x80004000
Workqueue: f2fs_post_read_wq f2fs_post_read_work
Call Trace:
 context_switch kernel/sched/core.c:3384 [inline]
 __schedule+0x299/0x6c0 kernel/sched/core.c:4069
 schedule+0x44/0xd0 kernel/sched/core.c:4136
 io_schedule+0x11/0x40 kernel/sched/core.c:5780
 wait_on_page_bit_common mm/filemap.c:1174 [inline]
 wait_on_page_bit mm/filemap.c:1223 [inline]
 wait_on_page_locked include/linux/pagemap.h:527 [inline]
 wait_on_page_locked include/linux/pagemap.h:524 [inline]
 wait_on_page_read mm/filemap.c:2767 [inline]
 do_read_cache_page+0x407/0x660 mm/filemap.c:2810
 read_cache_page+0xd/0x10 mm/filemap.c:2894
 f2fs_read_merkle_tree_page+0x2e/0x30 include/linux/pagemap.h:396
 verify_page+0x110/0x560 fs/verity/verify.c:120
 fsverity_verify_bio+0xe6/0x1a0 fs/verity/verify.c:239
 verity_work fs/f2fs/data.c:142 [inline]
 f2fs_post_read_work+0x36/0x50 fs/f2fs/data.c:160
 process_one_work+0x225/0x550 kernel/workqueue.c:2269
 worker_thread+0x4b/0x3c0 kernel/workqueue.c:2415
 kthread+0x125/0x140 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
INFO: task kworker/u5:1:1140 blocked for more than 30 seconds.
      Not tainted 5.4.0-rc1-00119-g464e31ba60d0 #13
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kworker/u5:1    D    0  1140      2 0x80004000
Workqueue: f2fs_post_read_wq f2fs_post_read_work
Call Trace:
 context_switch kernel/sched/core.c:3384 [inline]
 __schedule+0x299/0x6c0 kernel/sched/core.c:4069
 schedule+0x44/0xd0 kernel/sched/core.c:4136
 io_schedule+0x11/0x40 kernel/sched/core.c:5780
 wait_on_page_bit_common mm/filemap.c:1174 [inline]
 wait_on_page_bit mm/filemap.c:1223 [inline]
 wait_on_page_locked include/linux/pagemap.h:527 [inline]
 wait_on_page_locked include/linux/pagemap.h:524 [inline]
 wait_on_page_read mm/filemap.c:2767 [inline]
 do_read_cache_page+0x407/0x660 mm/filemap.c:2810
 read_cache_page+0xd/0x10 mm/filemap.c:2894
 f2fs_read_merkle_tree_page+0x2e/0x30 include/linux/pagemap.h:396
 verify_page+0x110/0x560 fs/verity/verify.c:120
 fsverity_verify_bio+0xe6/0x1a0 fs/verity/verify.c:239
 verity_work fs/f2fs/data.c:142 [inline]
 f2fs_post_read_work+0x36/0x50 fs/f2fs/data.c:160
 process_one_work+0x225/0x550 kernel/workqueue.c:2269
 worker_thread+0x4b/0x3c0 kernel/workqueue.c:2415
 kthread+0x125/0x140 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Showing all locks held in the system:
1 lock held by khungtaskd/21:
 #0: ffffffff82250520 (rcu_read_lock){....}, at: rcu_lock_acquire.constprop.0+0x0/0x30 include/trace/events/lock.h:13
2 locks held by kworker/u5:0/61:
 #0: ffff88807b78eb28 ((wq_completion)f2fs_post_read_wq){+.+.}, at: set_work_data kernel/workqueue.c:619 [inline]
 #0: ffff88807b78eb28 ((wq_completion)f2fs_post_read_wq){+.+.}, at: set_work_pool_and_clear_pending kernel/workqueue.c:647 [inline]
 #0: ffff88807b78eb28 ((wq_completion)f2fs_post_read_wq){+.+.}, at: process_one_work+0x1ad/0x550 kernel/workqueue.c:2240
 #1: ffffc90000253e50 ((work_completion)(&ctx->work)){+.+.}, at: set_work_data kernel/workqueue.c:619 [inline]
 #1: ffffc90000253e50 ((work_completion)(&ctx->work)){+.+.}, at: set_work_pool_and_clear_pending kernel/workqueue.c:647 [inline]
 #1: ffffc90000253e50 ((work_completion)(&ctx->work)){+.+.}, at: process_one_work+0x1ad/0x550 kernel/workqueue.c:2240
2 locks held by kworker/u5:1/1140:
 #0: ffff88807b78eb28 ((wq_completion)f2fs_post_read_wq){+.+.}, at: set_work_data kernel/workqueue.c:619 [inline]
 #0: ffff88807b78eb28 ((wq_completion)f2fs_post_read_wq){+.+.}, at: set_work_pool_and_clear_pending kernel/workqueue.c:647 [inline]
 #0: ffff88807b78eb28 ((wq_completion)f2fs_post_read_wq){+.+.}, at: process_one_work+0x1ad/0x550 kernel/workqueue.c:2240
 #1: ffffc9000174be50 ((work_completion)(&ctx->work)){+.+.}, at: set_work_data kernel/workqueue.c:619 [inline]
 #1: ffffc9000174be50 ((work_completion)(&ctx->work)){+.+.}, at: set_work_pool_and_clear_pending kernel/workqueue.c:647 [inline]
 #1: ffffc9000174be50 ((work_completion)(&ctx->work)){+.+.}, at: process_one_work+0x1ad/0x550 kernel/workqueue.c:2240


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
