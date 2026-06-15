Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mFuvKXolMGqHOwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 18:16:58 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4E06883BD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 18:16:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=EtkDDljq;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=XZJM0ngX;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=ON9X8rbm;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=ow4m5oIo;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRW/D3v+WXgnMk4sjuRwWD0P1mNaHpPA6Ph6z42s8RA=; b=EtkDDljqgQYbMVNU9InlsSDZJk
	ZUuKEJVemF+YXLhVkvHo6NMJpgGa2xzST4BbPb+b3DLqDAyhbXmY0zUD11CFAfOLylS6/43ntVAiT
	uDNb0/O6j1mnDJGApRRZ4EHhF9Ugo7mWAOMtFY6yCXPoWvNulHYhFHLOMjFJoaBa8EVs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ9zT-0000lC-K7;
	Mon, 15 Jun 2026 16:16:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wZ9zR-0000l4-NN
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 16:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M7fO+rd5Qg4bxMVlllaCNnoylXk3OCeNwY2Wn22hoPc=; b=XZJM0ngX/9n1UncfPqBJ/odZrl
 uKgun746/hUVD4sl8CWCBM5jsuvtAC7fW9ZF5oNgIoblx/MYRUjbP2bnOzXSRVhFyXK81oOfkk9Mw
 qqFfKfpdTGx4DYqKN+jC6Hgurj7P9lwKZnuVFCoJ73mB2g1J+XJ+hhO+0LVoPHTmNnmM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M7fO+rd5Qg4bxMVlllaCNnoylXk3OCeNwY2Wn22hoPc=; b=ON9X8rbmAOzEs4t/WBLyHTG3as
 vHJpnEjXUzyQwAjBx82KReQ8ztAnlgF416m00Fcyb0zpdXy6o7xBxn+wcCluatFE8m092jxx3GOLx
 HN0MPC2HHM6AHXpU1N9zylr5zJoXkpVNe2g9YB855RTLFHIl67H4YF4NIMgwBQLvVFBQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ9zR-00051e-5O for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 16:16:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 20D954435B;
 Mon, 15 Jun 2026 16:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97AA1F000E9;
 Mon, 15 Jun 2026 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781540195;
 bh=M7fO+rd5Qg4bxMVlllaCNnoylXk3OCeNwY2Wn22hoPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ow4m5oIo//4Sq5qpPpnSkk2ohKkGtw0jj4PQBVP7BKlSlClzS4eoK8luw34uHLDDq
 eQ4qvHQGR+ju+20x3U56vX294amgTGkE0eFLhvX3XaCWCGUD5USwQemWKdbbrg1QgG
 pCTyz9+Y/lzSALV6Q/m91KvLhj/nv5XyAvf2ryOGr4II7VQ9TH5LR5utCiylsrVTqb
 0l4XUf9LUuA70qW+myVL0jenSqKV0T/bFQcWKAOZeBktp/vBazUGAC5z/Wt1S6duY3
 9i2L/E//Q/iZN9lkUyLzZRe1Tlwq6j8I1alUk18kbez1Zr3COR2wJ47rrtBMpKfOrD
 GXwZL+oRX3aeA==
Date: Mon, 15 Jun 2026 16:16:33 +0000
To: Zhang Cen <rollkingzzc@gmail.com>
Message-ID: <ajAlYb5mZzNnKaHl@google.com>
References: <20260530143307.3596771-1-rollkingzzc@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260530143307.3596771-1-rollkingzzc@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/30, Zhang Cen wrote: > f2fs_stop_gc_thread() stops the
 background GC task, wakes foreground > GC_MERGE waiters, frees sbi->gc_thread, 
 and then clears the published > pointer. A foreground f2fs_b [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZ9zR-00051e-5O
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: protect published gc_thread during
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 2045gemini@gmail.com, Gao Xiang <xiang@kernel.org>, zerocling0077@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rollkingzzc@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:2045gemini@gmail.com,m:xiang@kernel.org,m:zerocling0077@gmail.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sourceforge.net,gmail.com,kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp,sashiko.dev:url];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC4E06883BD

On 05/30, Zhang Cen wrote:
> f2fs_stop_gc_thread() stops the background GC task, wakes foreground
> GC_MERGE waiters, frees sbi->gc_thread, and then clears the published
> pointer.  A foreground f2fs_balance_fs() caller can already have copied
> that pointer and queued itself on gc_th->fggc_wq, so freeing gc_th at
> stop time can leave finish_wait() operating on a freed waitqueue.
> 
> Keep the allocated GC-thread state until the superblock is destroyed and
> use gc_th->f2fs_gc_task as the running-state marker.  The stop path now
> withdraws the task pointer with xchg(), stops the task, and wakes any
> foreground waiters, but leaves the waitqueue storage valid.  The start
> path reuses a stopped gc_thread object instead of reinitializing its
> waitqueues, and remount restart decisions check the task pointer rather
> than only the object pointer.
> 
> f2fs_balance_fs() also snapshots sbi->gc_thread once and rechecks
> f2fs_gc_task after prepare_to_wait().  If teardown wins the race after
> the first check, the foreground caller removes its wait entry without
> sleeping on a worker that has already been withdrawn.
> 
> Validation reproduced this kernel report:
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

What about dequeuing all the pending work items and stop getting more work
when shutdown was called?

> 
> Fixes: 5911d2d1d1a3 ("f2fs: introduce gc_merge mount option")
> Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
> ---
> v4:
> - Replace the v3 SRCU/refcounted lifetime model with a smaller fix that
>   keeps the existing heap-allocated gc_thread object alive until
>   superblock teardown.
> - Use f2fs_gc_task as the running-state marker and withdraw it with
>   xchg() before waking GC_MERGE waiters.
> - Reuse a stopped gc_thread object across remount restarts so the
>   waitqueues are not reinitialized while old waiters can still finish.
> - Recheck f2fs_gc_task after prepare_to_wait() so a waiter that races
>   with teardown does not sleep after the worker has been withdrawn.
> 
> v3:
> - Add the Fixes tag for the GC_MERGE foreground wait path.
> - Fix checkpatch style issues in the broader lifetime variant.
> 
> v2:
> - Sashiko.dev pointed out that GC_MERGE foreground waiters and
>   GC-thread users needed lifetime-safe access after teardown.
> 
>  fs/f2fs/gc.c      | 48 +++++++++++++++++++++++++++++------------------
>  fs/f2fs/segment.c | 19 ++++++++++++-------
>  fs/f2fs/super.c   |  7 +++++--
>  3 files changed, 47 insertions(+), 27 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index ba93010924c06..20f8394482a09 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -193,12 +193,23 @@ static int gc_thread_func(void *data)
>  
>  int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
>  {
> -	struct f2fs_gc_kthread *gc_th;
> +	struct f2fs_gc_kthread *gc_th = sbi->gc_thread;
> +	struct task_struct *task;
> +	bool allocated = false;
>  	dev_t dev = sbi->sb->s_bdev->bd_dev;
>  
> -	gc_th = f2fs_kmalloc(sbi, sizeof(struct f2fs_gc_kthread), GFP_KERNEL);
> -	if (!gc_th)
> -		return -ENOMEM;
> +	if (gc_th && READ_ONCE(gc_th->f2fs_gc_task))
> +		return 0;
> +
> +	if (!gc_th) {
> +		gc_th = f2fs_kmalloc(sbi, sizeof(*gc_th), GFP_KERNEL);
> +		if (!gc_th)
> +			return -ENOMEM;
> +		init_waitqueue_head(&gc_th->gc_wait_queue_head);
> +		init_waitqueue_head(&gc_th->fggc_wq);
> +		sbi->gc_thread = gc_th;
> +		allocated = true;
> +	}
>  
>  	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
>  	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
> @@ -221,34 +232,35 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
>  
>  	gc_th->gc_wake = false;
>  
> -	sbi->gc_thread = gc_th;
> -	init_waitqueue_head(&sbi->gc_thread->gc_wait_queue_head);
> -	init_waitqueue_head(&sbi->gc_thread->fggc_wq);
> -	sbi->gc_thread->f2fs_gc_task = kthread_run(gc_thread_func, sbi,
> -			"f2fs_gc-%u:%u", MAJOR(dev), MINOR(dev));
> -	if (IS_ERR(gc_th->f2fs_gc_task)) {
> -		int err = PTR_ERR(gc_th->f2fs_gc_task);
> +	task = kthread_run(gc_thread_func, sbi, "f2fs_gc-%u:%u",
> +			   MAJOR(dev), MINOR(dev));
> +	if (IS_ERR(task)) {
> +		int err = PTR_ERR(task);
>  
> -		kfree(gc_th);
> -		sbi->gc_thread = NULL;
> +		if (allocated) {
> +			kfree(gc_th);
> +			sbi->gc_thread = NULL;
> +		}
>  		return err;
>  	}
>  
> -	set_user_nice(gc_th->f2fs_gc_task,
> -			PRIO_TO_NICE(sbi->critical_task_priority));
> +	WRITE_ONCE(gc_th->f2fs_gc_task, task);
> +	set_user_nice(task, PRIO_TO_NICE(sbi->critical_task_priority));
>  	return 0;
>  }
>  
>  void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi)
>  {
>  	struct f2fs_gc_kthread *gc_th = sbi->gc_thread;
> +	struct task_struct *task;
>  
>  	if (!gc_th)
>  		return;
> -	kthread_stop(gc_th->f2fs_gc_task);
> +	task = xchg(&gc_th->f2fs_gc_task, NULL);
> +	if (!task)
> +		return;
> +	kthread_stop(task);
>  	wake_up_all(&gc_th->fggc_wq);
> -	kfree(gc_th);
> -	sbi->gc_thread = NULL;
>  }
>  
>  static int select_gc_type(struct f2fs_sb_info *sbi, int gc_type)
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 788f8b0502492..84307525edd27 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -424,6 +424,8 @@ int f2fs_commit_atomic_write(struct inode *inode)
>   */
>  void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>  {
> +	struct f2fs_gc_kthread *gc_th;
> +
>  	if (f2fs_cp_error(sbi))
>  		return;
>  
> @@ -444,15 +446,18 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>  	if (has_enough_free_secs(sbi, 0, 0))
>  		return;
>  
> -	if (test_opt(sbi, GC_MERGE) && sbi->gc_thread &&
> -				sbi->gc_thread->f2fs_gc_task) {
> +	gc_th = sbi->gc_thread;
> +	if (test_opt(sbi, GC_MERGE) && gc_th &&
> +	    READ_ONCE(gc_th->f2fs_gc_task)) {
>  		DEFINE_WAIT(wait);
>  
> -		prepare_to_wait(&sbi->gc_thread->fggc_wq, &wait,
> -					TASK_UNINTERRUPTIBLE);
> -		wake_up(&sbi->gc_thread->gc_wait_queue_head);
> -		io_schedule();
> -		finish_wait(&sbi->gc_thread->fggc_wq, &wait);
> +		prepare_to_wait(&gc_th->fggc_wq, &wait,
> +				TASK_UNINTERRUPTIBLE);
> +		if (READ_ONCE(gc_th->f2fs_gc_task)) {
> +			wake_up(&gc_th->gc_wait_queue_head);
> +			io_schedule();
> +		}
> +		finish_wait(&gc_th->fggc_wq, &wait);
>  	} else {
>  		struct f2fs_gc_control gc_control = {
>  			.victim_segno = NULL_SEGNO,
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index ccf806b676f53..d6863da05a7c2 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2925,11 +2925,12 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
>  	if ((flags & SB_RDONLY) ||
>  			(F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_OFF &&
>  			!test_opt(sbi, GC_MERGE))) {
> -		if (sbi->gc_thread) {
> +		if (sbi->gc_thread && READ_ONCE(sbi->gc_thread->f2fs_gc_task)) {
>  			f2fs_stop_gc_thread(sbi);
>  			need_restart_gc = true;
>  		}
> -	} else if (!sbi->gc_thread) {
> +	} else if (!sbi->gc_thread ||
> +			!READ_ONCE(sbi->gc_thread->f2fs_gc_task)) {
>  		err = f2fs_start_gc_thread(sbi);
>  		if (err)
>  			goto restore_opts;
> @@ -5451,6 +5452,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>  free_sb_buf:
>  	kfree(raw_super);
>  free_sbi:
> +	kfree(sbi->gc_thread);
>  #ifdef CONFIG_DEBUG_LOCK_ALLOC
>  	lockdep_unregister_key(&sbi->cp_global_sem_key);
>  #endif
> @@ -5535,6 +5537,7 @@ static void kill_f2fs_super(struct super_block *sb)
>  	/* Release block devices last, after fscrypt_destroy_keyring(). */
>  	if (sbi) {
>  		destroy_device_list(sbi);
> +		kfree(sbi->gc_thread);
>  #ifdef CONFIG_DEBUG_LOCK_ALLOC
>  		lockdep_unregister_key(&sbi->cp_global_sem_key);
>  #endif
> -- 
> 2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
