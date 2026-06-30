Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ywZrLjyoQ2qUeQoAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2026 13:27:56 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 027E56E3955
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2026 13:27:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=mPtDw5au;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=LahDfFP0;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=D8qorcVk;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=dNPbOkez;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMiNGsyW3L5a6p6MvxBnimOYxID/td+y3zUZDK30uR4=; b=mPtDw5auZ86ALCJqq6j23Dcdyt
	uBmh2jSTQGKga8v3iSbzbPrM952i0hP6PVT++EKY6/01A/FjcQCDWe9gWYWEzJ6BMrmRKvBAoeoCC
	b97ouh9Y1fUmV+oVAbb/g7Z+cZac8UVGbm/nHrNYMVzWUBST8PL4de9WjiqDA1Dggez0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1weWd3-00084R-3T;
	Tue, 30 Jun 2026 11:27:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1weWd1-00084L-7Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jun 2026 11:27:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x6ROe90Mv43ZZv/3gNy3hqVzWNteI7qL1btexIYjHcQ=; b=LahDfFP0OJOkir47DaMx370kBU
 B/9/TixQunquHHpqyzHXJD1v3MirJ5ikXVP2c8OJs0VwIKXF6MI52c7X0AUfGdsROYHQkKiwHWRe3
 c5VDQ/1m2RlMJr2ry69IUpIc+NRhqOvX/cYoLpRf9j7fzFu1Vq1XyGZsGQiVhW4/fWFk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x6ROe90Mv43ZZv/3gNy3hqVzWNteI7qL1btexIYjHcQ=; b=D8qorcVkQCHtatvtgVLAhzxkTe
 p6ZuDceu9EnhIqS9Fua6C1NH7qlKAjmWAADydqxFhK/xhwdVHH/Xzu0sU8cXn1qcqhjuhb5CwTUpJ
 2Wr58mepJLutdR9gMGpzAKgdbfGarAClGgE5Qwee1x3x2xGJCpgtmMSuWBWU+LXkqJLo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1weWcv-0002H7-Dd for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jun 2026 11:27:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 884CA418EC;
 Tue, 30 Jun 2026 11:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4641F000E9;
 Tue, 30 Jun 2026 11:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782818851;
 bh=x6ROe90Mv43ZZv/3gNy3hqVzWNteI7qL1btexIYjHcQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=dNPbOkezvpd/dHhSHlN6hfzDOgMfXjTGstTJhRGlFfPn2Ydu/iduT7VG7giRqp+oY
 tT5DXYmTgH4J3+paDt2Yv5UcxsvBVKCVXFN1ndyXIZoaqmgdAV+lZsPEaHt0OJ0REU
 QvRc+ehnLf9gy+E6QxUI8ql4d1EC8vQbQ7ao+mjsUPea5MdUtWWE1iLrwAsDnuGiYv
 f8w71Hphk37mT3sDRgVc75ybW2VWvUY+17fI58FYkfnPuGLV+kVElSK7nv893v1/31
 inivv0uJQ9wKefqxeYxqTwliUVDQiQlC7m9jPEp9O2XeMCkqv0q+Mo6r82cQYmhO40
 B4Jy4VEZrWOOQ==
Message-ID: <07babbcd-a1d4-4b03-987e-bdd7ed933c33@kernel.org>
Date: Tue, 30 Jun 2026 19:27:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhang Cen <rollkingzzc@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260630045919.1671833-1-rollkingzzc@gmail.com>
Content-Language: en-US
In-Reply-To: <20260630045919.1671833-1-rollkingzzc@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/30/26 12:59, Zhang Cen wrote: > This patch is based on
 the preceding patch "f2fs: embed > f2fs_gc_kthread in f2fs_sb_info", which
 gives the GC waitqueues and > thread tunables superblock lifetime [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1weWcv-0002H7-Dd
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: protect gc task pointer during
 teardown
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rollkingzzc@gmail.com,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 027E56E3955

On 6/30/26 12:59, Zhang Cen wrote:
> This patch is based on the preceding patch "f2fs: embed
> f2fs_gc_kthread in f2fs_sb_info", which gives the GC waitqueues and
> thread tunables superblock lifetime. With that container lifetime fixed,
> f2fs_gc_task remains the running-state marker and the task_struct pointer
> that needs separate lifetime protection.
> 
> During shutdown, f2fs_stop_gc_thread() stops the GC task and wakes
> GC_MERGE foreground waiters while f2fs_balance_fs() can concurrently
> queue on gc_th->fggc_wq. The preceding embedded-gc_thread patch keeps
> that waitqueue storage alive for the superblock lifetime; this patch
> protects the remaining f2fs_gc_task pointer by publishing and detaching
> it under gc_task_lock, and by taking a task_struct reference for sysfs
> users that dereference the task.
> 
> The buggy scenario involves two paths, with each column showing the
> order within that path:
> 
> foreground f2fs_balance_fs() caller:   shutdown path:
>   1. observes no checkpoint error        1. sets CP_ERROR_FLAG
>   2. snapshots sbi->gc_thread           2. enters f2fs_stop_gc_thread()
>   3. queues on gc_th->fggc_wq           3. stops gc_th->f2fs_gc_task
>   4. wakes gc_wait_queue_head           4. wakes gc_th->fggc_wq
>   5. sleeps for foreground GC           5. frees gc_th in the old layout
>   6. finish_wait() touches fggc_wq
> 
> GC_MERGE does not keep independent work_struct items that shutdown can
> cancel. Its pending foreground GC requests are waitqueue waiters. Drain
> them by withdrawing the GC task pointer, stopping the task, waking
> gc_th->fggc_wq, and leaving each waiter to remove its own wait entry
> with finish_wait().
> 
> Add gc_task_lock to struct f2fs_gc_kthread and use it to publish the GC
> task only after the new kthread has been created and its nice value has
> been set. The start path uses kthread_create() so the task is not woken
> until after f2fs_gc_task is visible to waiters. The stop path detaches
> f2fs_gc_task under the same lock before kthread_stop(), so later readers
> see that no new foreground GC work should be handed to the background
> thread.
> 
> f2fs_balance_fs() also rechecks both f2fs_cp_error() and f2fs_gc_task
> after prepare_to_wait(). If shutdown is visible or the GC task has
> already been withdrawn, the caller removes its wait entry without waking
> the GC thread or sleeping for new foreground GC work. Thus shutdown
> drains already queued waiters and stops accepting new foreground GC work
> once shutdown is visible to the caller.
> 
> Task pointer users are protected separately from the embedded container
> lifetime. A sysfs critical_task_priority store now snapshots the GC task
> under gc_task_lock and holds a task_struct reference while calling
> set_user_nice(). Boolean running-state checks that do not dereference the
> task_struct continue to use READ_ONCE().
> 
> One observed report was:
> 
> BUG: KASAN: slab-use-after-free in finish_wait+0x276/0x290
> Write of size 8 at addr ffff8881150819b8 by task dd/802
> The buggy address belongs to the object at ffff888115081900 which
> belongs to the cache kmalloc-256 of size 256
> The buggy address is located 184 bytes inside of freed 256-byte region
> Call trace:
>   finish_wait()
>   f2fs_balance_fs()
>   f2fs_write_single_data_page()
>   f2fs_write_cache_pages()
>   __f2fs_write_data_pages()
>   do_writepages()
>   filemap_fdatawrite_wbc()
>   __filemap_fdatawrite_range()
>   file_write_and_wait_range()
>   f2fs_do_sync_file()
>   f2fs_sync_file()
>   do_fsync()
> Freed by task stack:
>   kfree()
>   f2fs_stop_gc_thread()
>   f2fs_do_shutdown()
>   f2fs_shutdown()
>   fs_bdev_mark_dead()
> 
> Fixes: 5911d2d1d1a3 ("f2fs: introduce gc_merge mount option")
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
> ---
> Based on:
> - [PATCH] f2fs: embed f2fs_gc_kthread in f2fs_sb_info
> 
>  fs/f2fs/f2fs.h    | 37 +++++++++++++++++++++++++++++++++++++
>  fs/f2fs/gc.c      | 12 ++++++++----
>  fs/f2fs/segment.c |  2 +-
>  fs/f2fs/super.c   |  1 +
>  fs/f2fs/sysfs.c   |  6 ++++--
>  5 files changed, 51 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9ab196f65643..931d37f64bb3 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -17,8 +17,10 @@
>  #include <linux/magic.h>
>  #include <linux/kobject.h>
>  #include <linux/sched.h>
> +#include <linux/sched/task.h>
>  #include <linux/cred.h>
>  #include <linux/sched/mm.h>
> +#include <linux/spinlock.h>
>  #include <linux/vmalloc.h>
>  #include <linux/bio.h>
>  #include <linux/blkdev.h>
> @@ -430,6 +432,7 @@ struct ckpt_req_control {
>  
>  struct f2fs_gc_kthread {
>  	struct task_struct *f2fs_gc_task;
> +	spinlock_t gc_task_lock;		/* protects f2fs_gc_task */
>  	wait_queue_head_t gc_wait_queue_head;
>  
>  	/* for gc sleep time */
> @@ -455,6 +458,40 @@ struct f2fs_gc_kthread {
>  	unsigned int boost_gc_greedy;
>  };
>  
> +static inline struct task_struct *f2fs_get_gc_task(struct f2fs_gc_kthread *gc_th)
> +{
> +	struct task_struct *task;
> +
> +	spin_lock(&gc_th->gc_task_lock);
> +	task = READ_ONCE(gc_th->f2fs_gc_task);
> +	if (task)
> +		get_task_struct(task);
> +	spin_unlock(&gc_th->gc_task_lock);
> +
> +	return task;
> +}
> +
> +static inline void f2fs_set_gc_task(struct f2fs_gc_kthread *gc_th,
> +				    struct task_struct *task)
> +{
> +	spin_lock(&gc_th->gc_task_lock);
> +	WRITE_ONCE(gc_th->f2fs_gc_task, task);
> +	spin_unlock(&gc_th->gc_task_lock);
> +}
> +
> +static inline struct task_struct *
> +f2fs_detach_gc_task(struct f2fs_gc_kthread *gc_th)
> +{
> +	struct task_struct *task;
> +
> +	spin_lock(&gc_th->gc_task_lock);
> +	task = READ_ONCE(gc_th->f2fs_gc_task);
> +	WRITE_ONCE(gc_th->f2fs_gc_task, NULL);
> +	spin_unlock(&gc_th->gc_task_lock);
> +
> +	return task;
> +}

How about introduce f2fs_update_gc_task()?

attach w/ f2fs_update_gc_task(, task), deattch w/ f2fs_update_gc_task(, NULL)?

> +
>  /* a time threshold that checkpoint was blocked for, unit: ms */
>  #define CP_LONG_LATENCY_THRESHOLD	5000
>  
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 5a98754354b6..c26fcaffa986 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -197,6 +197,9 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
>  	struct task_struct *task;
>  	dev_t dev = sbi->sb->s_bdev->bd_dev;
>  
> +	if (READ_ONCE(gc_th->f2fs_gc_task))
> +		return 0;

Why we need to check this?

> +
>  	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
>  	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
>  	gc_th->boost_gc_multiple = BOOST_GC_MULTIPLE;
> @@ -218,16 +221,17 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
>  
>  	gc_th->gc_wake = false;
>  
> -	task = kthread_run(gc_thread_func, sbi, "f2fs_gc-%u:%u",
> -			   MAJOR(dev), MINOR(dev));
> +	task = kthread_create(gc_thread_func, sbi, "f2fs_gc-%u:%u",
> +			      MAJOR(dev), MINOR(dev));
>  	if (IS_ERR(task)) {
>  		int err = PTR_ERR(task);
>  
>  		return err;
>  	}
>  
> -	WRITE_ONCE(gc_th->f2fs_gc_task, task);
>  	set_user_nice(task, PRIO_TO_NICE(sbi->critical_task_priority));
> +	f2fs_set_gc_task(gc_th, task);
> +	wake_up_process(task);
>  	return 0;
>  }
>  
> @@ -236,7 +240,7 @@ void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi)
>  	struct f2fs_gc_kthread *gc_th = &sbi->gc_thread;
>  	struct task_struct *task;
>  
> -	task = xchg(&gc_th->f2fs_gc_task, NULL);

I don't see this line in anywhere.

> +	task = f2fs_detach_gc_task(gc_th);
>  	if (!task)
>  		return;
>  	kthread_stop(task);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 877b015e24cd..aeda8351398f 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -451,7 +451,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>  
>  		prepare_to_wait(&gc_th->fggc_wq, &wait,
>  				TASK_UNINTERRUPTIBLE);
> -		if (READ_ONCE(gc_th->f2fs_gc_task)) {
> +		if (!f2fs_cp_error(sbi) && READ_ONCE(gc_th->f2fs_gc_task)) {

It's a corner case, I guess we can skip to check cp_error.

>  			wake_up(&gc_th->gc_wait_queue_head);
>  			io_schedule();
>  		}
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index ec44c5be8ca0..ed1ce1266ce4 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4993,6 +4993,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>  		spin_lock_init(&sbi->inode_lock[i]);
>  	}
>  	mutex_init(&sbi->flush_lock);
> +	spin_lock_init(&sbi->gc_thread.gc_task_lock);
>  	init_waitqueue_head(&sbi->gc_thread.gc_wait_queue_head);
>  	init_waitqueue_head(&sbi->gc_thread.fggc_wq);
>  
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 705563dfc560..87aa348f2a2b 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -996,9 +996,11 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		nice = PRIO_TO_NICE(sbi->critical_task_priority);
>  		if (sbi->cprc_info.f2fs_issue_ckpt)
>  			set_user_nice(sbi->cprc_info.f2fs_issue_ckpt, nice);
> -		gc_task = READ_ONCE(sbi->gc_thread.f2fs_gc_task);
> -		if (gc_task)
> +		gc_task = f2fs_get_gc_task(&sbi->gc_thread);
> +		if (gc_task) {

Can we do like this?

__sbi_store()

spin_lock
check f2fs_gc_task
set_user_nice
spin_unlock

Thanks,

>  			set_user_nice(gc_task, nice);
> +			put_task_struct(gc_task);
> +		}
>  		return count;
>  	}
>  



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
