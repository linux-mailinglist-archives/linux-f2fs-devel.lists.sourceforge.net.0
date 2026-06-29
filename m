Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ccimMShvQmpR7AkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2026 15:12:08 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7956DADC3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2026 15:12:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=JdE4ng8b;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=XVW9COJU;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="Q 5cda6h";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=EeJtOsMd;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3gdVaZYUXWm32/b3H377KSLLkZpKdLNCccxdH+3S6aI=; b=JdE4ng8bI/9EJ5pZbTti15Ipd1
	ct9beLn3K0x2NFquwMT9HlqE71moxMW0QCvqrg/UiQchVVr9PTx4P2dzVzZXrDAHOELCFGk6E/QHT
	hGrkGPlV1IgY6O5HKcVRS9uDbx8BUGoZKzNJdCMaCQ74FRfTkOB/XKnDBwBEpe4J47XQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1weBm8-00005Y-Nt;
	Mon, 29 Jun 2026 13:11:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1weBm7-00005D-0c
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jun 2026 13:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8osxHJht8lF5woeFpJjMQy4ObRVMCwwM7OdtzE5HXjQ=; b=XVW9COJUTcgjqJ1lhCTyT7iQH0
 xjQMeff8/QXGN9yMC/kdjGZyOI8ruodMgP4LbbwZDcClgbPPW3qccx9zxv9BuRMgGnJCSxK4d+R6x
 sIulNJ5hq95PTO/2EJXN8MMUhth3ey2T7ND4gbGYAOrx/E+zAwn5e2lJoRciARhadCCM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8osxHJht8lF5woeFpJjMQy4ObRVMCwwM7OdtzE5HXjQ=; b=Q
 5cda6hXyQFe8mReAChu69HAJ7jg9/4MY6U3ksnH9K0FurTf9Yjy+UVu4GAn8hvRP3gm65EfRSQy/G
 vNvzCDiQLAGzR3LnhK/IWfeDOJvb62VNCdwsctAf5sMwbzPLJeOO4Maxu8J3AUm1SeW5aK0V2yEir
 0Unn0s8LSCSmsUkc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1weBm5-0006Ir-GZ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jun 2026 13:11:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 494F06001D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Jun 2026 13:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095DC1F000E9;
 Mon, 29 Jun 2026 13:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782738695;
 bh=8osxHJht8lF5woeFpJjMQy4ObRVMCwwM7OdtzE5HXjQ=;
 h=From:To:Cc:Subject:Date;
 b=EeJtOsMdvYq7arIDkbtKxC2lNZt6KMUZ+9w6slClR+voaJvaVvjzb6V9LZdvCHAG1
 9y1Mrn+pxIHIoy52+agT5BFeqQICiT+1uwmr8Vy7PL1MlObtg5O3yPWrD2xg3nAdrl
 rvIAL7oKe+P7G5eBcZSI0R+/o4gTfF8v52Ornm52awrarJLwJVv8odooBqzvjst5WM
 TctHq/MMCHzjt1ieur6zRZfmk1dkvzjFBY18h6nx0IdRik6nXnbp6w5HrxL1ITmQ2K
 sjerr01aMeTC0K6cCPFvDafVCGPhJD9pz4/9wLKHlhx7YlEAekat3uFowiMWRYcXhH
 ytCEwerjC9yWA==
To: jaegeuk@kernel.org
Date: Mon, 29 Jun 2026 13:11:27 +0000
Message-ID: <20260629131127.422074-1-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Instead of allocating f2fs_gc_kthread dynamically, embed it
 in f2fs_sb_info. This simplifies lifetime management and prepares for fixing
 race conditions during teardown. - __sbi_store - remount|shutdown -
 f2fs_stop_gc_thread
 - access sbi->gc_thread - sbi->gc_thread = NULL - access
 sbi->gc_thread->f2fs_gc_task
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1weBm5-0006Ir-GZ
Subject: [f2fs-dev] [PATCH] f2fs: embed f2fs_gc_kthread in f2fs_sb_info
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
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:stable@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF7956DADC3

Instead of allocating f2fs_gc_kthread dynamically, embed it in
f2fs_sb_info. This simplifies lifetime management and prepares for
fixing race conditions during teardown.

- __sbi_store			- remount|shutdown
				 - f2fs_stop_gc_thread
 - access sbi->gc_thread
				  - sbi->gc_thread = NULL
 - access sbi->gc_thread->f2fs_gc_task

Fixes: 52190933c37a ("f2fs: sysfs: introduce critical_task_priority")
Fixes: 7950e9ac638e ("f2fs: stop gc/discard thread after fs shutdown")
Cc: stable@kernel.org
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/debug.c   |  4 ----
 fs/f2fs/f2fs.h    | 29 ++++++++++++++++++++++++++++-
 fs/f2fs/gc.c      | 35 +++++++++++++----------------------
 fs/f2fs/gc.h      | 27 +--------------------------
 fs/f2fs/segment.c |  9 ++++-----
 fs/f2fs/super.c   |  4 ++--
 fs/f2fs/sysfs.c   | 22 +++++++++++-----------
 7 files changed, 59 insertions(+), 71 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index af88db8fdb71..ff379aff4472 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -352,10 +352,6 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
 get_cache:
 	si->cache_mem = 0;
 
-	/* build gc */
-	if (sbi->gc_thread)
-		si->cache_mem += sizeof(struct f2fs_gc_kthread);
-
 	/* build merge flush thread */
 	if (SM_I(sbi)->fcc_info)
 		si->cache_mem += sizeof(struct flush_cmd_control);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d1da8e8afca3..d662f6d282d5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1761,6 +1761,33 @@ struct decompress_io_ctx {
 #define MAX_COMPRESS_LOG_SIZE		8
 #define MAX_COMPRESS_WINDOW_SIZE(log_size)	((PAGE_SIZE) << (log_size))
 
+struct f2fs_gc_kthread {
+	struct task_struct *f2fs_gc_task;
+	wait_queue_head_t gc_wait_queue_head;
+
+	/* for gc sleep time */
+	unsigned int urgent_sleep_time;
+	unsigned int min_sleep_time;
+	unsigned int max_sleep_time;
+	unsigned int no_gc_sleep_time;
+
+	/* for changing gc mode */
+	bool gc_wake;
+
+	/* for GC_MERGE mount option */
+	wait_queue_head_t fggc_wq;		/*
+						 * caller of f2fs_balance_fs()
+						 * will wait on this wait queue.
+						 */
+
+	/* for gc control for zoned devices */
+	unsigned int no_zoned_gc_percent;
+	unsigned int boost_zoned_gc_percent;
+	unsigned int valid_thresh_ratio;
+	unsigned int boost_gc_multiple;
+	unsigned int boost_gc_greedy;
+};
+
 struct f2fs_sb_info {
 	struct super_block *sb;			/* pointer to VFS super block */
 	struct proc_dir_entry *s_proc;		/* proc entry */
@@ -1898,7 +1925,7 @@ struct f2fs_sb_info {
 						 * semaphore for GC, avoid
 						 * race between GC and GC or CP
 						 */
-	struct f2fs_gc_kthread	*gc_thread;	/* GC thread */
+	struct f2fs_gc_kthread gc_thread;	/* GC thread */
 	struct atgc_management am;		/* atgc management */
 	unsigned int cur_victim_sec;		/* current victim section num */
 	unsigned int gc_mode;			/* current GC state */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 287ced326253..bf3d9e460ec1 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -31,9 +31,9 @@ static unsigned int count_bits(const unsigned long *addr,
 static int gc_thread_func(void *data)
 {
 	struct f2fs_sb_info *sbi = data;
-	struct f2fs_gc_kthread *gc_th = sbi->gc_thread;
-	wait_queue_head_t *wq = &sbi->gc_thread->gc_wait_queue_head;
-	wait_queue_head_t *fggc_wq = &sbi->gc_thread->fggc_wq;
+	struct f2fs_gc_kthread *gc_th = &sbi->gc_thread;
+	wait_queue_head_t *wq = &sbi->gc_thread.gc_wait_queue_head;
+	wait_queue_head_t *fggc_wq = &sbi->gc_thread.fggc_wq;
 	unsigned int wait_ms;
 	struct f2fs_gc_control gc_control = {
 		.victim_segno = NULL_SEGNO,
@@ -193,13 +193,9 @@ static int gc_thread_func(void *data)
 
 int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 {
-	struct f2fs_gc_kthread *gc_th;
+	struct f2fs_gc_kthread *gc_th = &sbi->gc_thread;
 	dev_t dev = sbi->sb->s_bdev->bd_dev;
 
-	gc_th = f2fs_kmalloc(sbi, sizeof(struct f2fs_gc_kthread), GFP_KERNEL);
-	if (!gc_th)
-		return -ENOMEM;
-
 	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
 	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
 	gc_th->boost_gc_multiple = BOOST_GC_MULTIPLE;
@@ -221,16 +217,14 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 
 	gc_th->gc_wake = false;
 
-	sbi->gc_thread = gc_th;
-	init_waitqueue_head(&sbi->gc_thread->gc_wait_queue_head);
-	init_waitqueue_head(&sbi->gc_thread->fggc_wq);
-	sbi->gc_thread->f2fs_gc_task = kthread_run(gc_thread_func, sbi,
+	init_waitqueue_head(&gc_th->gc_wait_queue_head);
+	init_waitqueue_head(&gc_th->fggc_wq);
+	gc_th->f2fs_gc_task = kthread_run(gc_thread_func, sbi,
 			"f2fs_gc-%u:%u", MAJOR(dev), MINOR(dev));
 	if (IS_ERR(gc_th->f2fs_gc_task)) {
 		int err = PTR_ERR(gc_th->f2fs_gc_task);
 
-		kfree(gc_th);
-		sbi->gc_thread = NULL;
+		gc_th->f2fs_gc_task = NULL;
 		return err;
 	}
 
@@ -241,14 +235,11 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 
 void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi)
 {
-	struct f2fs_gc_kthread *gc_th = sbi->gc_thread;
+	struct f2fs_gc_kthread *gc_th = &sbi->gc_thread;
 
-	if (!gc_th)
-		return;
 	kthread_stop(gc_th->f2fs_gc_task);
+	gc_th->f2fs_gc_task = NULL;
 	wake_up_all(&gc_th->fggc_wq);
-	kfree(gc_th);
-	sbi->gc_thread = NULL;
 }
 
 static int select_gc_type(struct f2fs_sb_info *sbi, int gc_type)
@@ -796,7 +787,7 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 	if (one_time) {
 		p.one_time_gc = one_time;
 		if (has_enough_free_secs(sbi, 0, NR_PERSISTENT_LOG))
-			valid_thresh_ratio = sbi->gc_thread->valid_thresh_ratio;
+			valid_thresh_ratio = sbi->gc_thread.valid_thresh_ratio;
 	}
 
 retry:
@@ -1807,9 +1798,9 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 
 			if (f2fs_sb_has_blkzoned(sbi) &&
 					!has_enough_free_blocks(sbi,
-					sbi->gc_thread->boost_zoned_gc_percent))
+					sbi->gc_thread.boost_zoned_gc_percent))
 				window_granularity *=
-					sbi->gc_thread->boost_gc_multiple;
+					sbi->gc_thread.boost_gc_multiple;
 
 			end_segno = start_segno + window_granularity;
 		}
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 6c4d4567571e..b015742fb455 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -45,32 +45,7 @@
 
 #define NR_GC_CHECKPOINT_SECS (3)	/* data/node/dentry sections */
 
-struct f2fs_gc_kthread {
-	struct task_struct *f2fs_gc_task;
-	wait_queue_head_t gc_wait_queue_head;
-
-	/* for gc sleep time */
-	unsigned int urgent_sleep_time;
-	unsigned int min_sleep_time;
-	unsigned int max_sleep_time;
-	unsigned int no_gc_sleep_time;
-
-	/* for changing gc mode */
-	bool gc_wake;
-
-	/* for GC_MERGE mount option */
-	wait_queue_head_t fggc_wq;		/*
-						 * caller of f2fs_balance_fs()
-						 * will wait on this wait queue.
-						 */
 
-	/* for gc control for zoned devices */
-	unsigned int no_zoned_gc_percent;
-	unsigned int boost_zoned_gc_percent;
-	unsigned int valid_thresh_ratio;
-	unsigned int boost_gc_multiple;
-	unsigned int boost_gc_greedy;
-};
 
 struct gc_inode_list {
 	struct list_head ilist;
@@ -197,6 +172,6 @@ static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
 {
 	if (f2fs_sb_has_blkzoned(sbi))
 		return !has_enough_free_blocks(sbi,
-				sbi->gc_thread->boost_zoned_gc_percent);
+				sbi->gc_thread.boost_zoned_gc_percent);
 	return has_enough_invalid_blocks(sbi);
 }
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 70944f9dd6c5..dae5bfe87dc4 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -452,15 +452,14 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 	f2fs_submit_merged_write(sbi, DATA);
 	f2fs_submit_all_merged_ipu_writes(sbi);
 
-	if (test_opt(sbi, GC_MERGE) && sbi->gc_thread &&
-				sbi->gc_thread->f2fs_gc_task) {
+	if (test_opt(sbi, GC_MERGE) && sbi->gc_thread.f2fs_gc_task) {
 		DEFINE_WAIT(wait);
 
-		prepare_to_wait(&sbi->gc_thread->fggc_wq, &wait,
+		prepare_to_wait(&sbi->gc_thread.fggc_wq, &wait,
 					TASK_UNINTERRUPTIBLE);
-		wake_up(&sbi->gc_thread->gc_wait_queue_head);
+		wake_up(&sbi->gc_thread.gc_wait_queue_head);
 		io_schedule();
-		finish_wait(&sbi->gc_thread->fggc_wq, &wait);
+		finish_wait(&sbi->gc_thread.fggc_wq, &wait);
 	} else {
 		struct f2fs_gc_control gc_control = {
 			.victim_segno = NULL_SEGNO,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index fa04325717de..d789aa8644b6 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2954,11 +2954,11 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 	if ((flags & SB_RDONLY) ||
 			(F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_OFF &&
 			!test_opt(sbi, GC_MERGE))) {
-		if (sbi->gc_thread) {
+		if (sbi->gc_thread.f2fs_gc_task) {
 			f2fs_stop_gc_thread(sbi);
 			need_restart_gc = true;
 		}
-	} else if (!sbi->gc_thread) {
+	} else if (!sbi->gc_thread.f2fs_gc_task) {
 		err = f2fs_start_gc_thread(sbi);
 		if (err)
 			goto restore_opts;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 47b378ccf07a..d9f81edca04a 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -75,7 +75,7 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 static unsigned char *__struct_ptr(struct f2fs_sb_info *sbi, int struct_type)
 {
 	if (struct_type == GC_THREAD)
-		return (unsigned char *)sbi->gc_thread;
+		return (unsigned char *)&sbi->gc_thread;
 	else if (struct_type == SM_INFO)
 		return (unsigned char *)SM_I(sbi);
 	else if (struct_type == DCC_INFO)
@@ -664,20 +664,20 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			sbi->gc_mode = GC_NORMAL;
 		} else if (t == 1) {
 			sbi->gc_mode = GC_URGENT_HIGH;
-			if (sbi->gc_thread) {
-				sbi->gc_thread->gc_wake = true;
+			if (sbi->gc_thread.f2fs_gc_task) {
+				sbi->gc_thread.gc_wake = true;
 				wake_up_interruptible_all(
-					&sbi->gc_thread->gc_wait_queue_head);
+					&sbi->gc_thread.gc_wait_queue_head);
 				wake_up_discard_thread(sbi, true);
 			}
 		} else if (t == 2) {
 			sbi->gc_mode = GC_URGENT_LOW;
 		} else if (t == 3) {
 			sbi->gc_mode = GC_URGENT_MID;
-			if (sbi->gc_thread) {
-				sbi->gc_thread->gc_wake = true;
+			if (sbi->gc_thread.f2fs_gc_task) {
+				sbi->gc_thread.gc_wake = true;
 				wake_up_interruptible_all(
-					&sbi->gc_thread->gc_wait_queue_head);
+					&sbi->gc_thread.gc_wait_queue_head);
 			}
 		} else {
 			return -EINVAL;
@@ -934,14 +934,14 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	if (!strcmp(a->attr.name, "gc_boost_gc_multiple")) {
 		if (t < 1 || t > SEGS_PER_SEC(sbi))
 			return -EINVAL;
-		sbi->gc_thread->boost_gc_multiple = (unsigned int)t;
+		sbi->gc_thread.boost_gc_multiple = (unsigned int)t;
 		return count;
 	}
 
 	if (!strcmp(a->attr.name, "gc_boost_gc_greedy")) {
 		if (t > GC_GREEDY)
 			return -EINVAL;
-		sbi->gc_thread->boost_gc_greedy = (unsigned int)t;
+		sbi->gc_thread.boost_gc_greedy = (unsigned int)t;
 		return count;
 	}
 
@@ -989,8 +989,8 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		if (sbi->cprc_info.f2fs_issue_ckpt)
 			set_user_nice(sbi->cprc_info.f2fs_issue_ckpt,
 					PRIO_TO_NICE(sbi->critical_task_priority));
-		if (sbi->gc_thread && sbi->gc_thread->f2fs_gc_task)
-			set_user_nice(sbi->gc_thread->f2fs_gc_task,
+		if (sbi->gc_thread.f2fs_gc_task)
+			set_user_nice(sbi->gc_thread.f2fs_gc_task,
 					PRIO_TO_NICE(sbi->critical_task_priority));
 		return count;
 	}
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
