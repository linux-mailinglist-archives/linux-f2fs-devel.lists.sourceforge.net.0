Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFy/Kkr1Gmp4+AgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 May 2026 16:33:46 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C0960D799
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 May 2026 16:33:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rMN5LXJEn6TZK6IpLMkVJHsY8heuLOiQZj/PbHxKd/4=; b=HTABYYpv4wDF6a2vKlHcNDrJBk
	fP+06o2ce6gBUEkQWyvR62eiQT4D3Ds+VA7C5uY1v9YUoWBFa9iuepxM2b3AlLTiuoNRbCYsvM/YS
	3rMMZEuJjyVElmZtVbjtGXRx+vm5qyfYN3EhjaHxPAPGU7aGUb3arcHQe9uuv99xawfY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wTKkj-0003IH-3K;
	Sat, 30 May 2026 14:33:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rollkingzzc@gmail.com>) id 1wTKki-0003IA-4a
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 30 May 2026 14:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9VAOLCzoyEGpuvHPIu3W860b+yu0vzmb8ayENUJBlHM=; b=F6psgPQs8DHlRCwQ6LT4BGabOd
 uplGWEn+J/ii+NGObfl9tlTHAeoCCAi0kcAw9EQNBN7BgdproUEXhWNyC5YYUXRqaM7odyGI4JP+x
 Ety6ZKnZcDsm2T8SJ3TQ97WANTH/Rzi9OXAk03WbHvjN4TW4dETdmSzdkGwmLhtstd9o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9VAOLCzoyEGpuvHPIu3W860b+yu0vzmb8ayENUJBlHM=; b=X
 XG65OYJz7LU+wKPm5haSyOevbfGMwjyhvG+7pcrJPdvMktVKeLM1YsbgrzEhPXCm7Z8OT+gtj4rYW
 pp67Fsf8LO8/t8Iy8LVFfKxu34/ZJjgIyXXv/ob8Vi9RrAfN/PRMI4xY2oqSrSv3y2+rtYgnYqUKn
 lZhuCFLUb/YMgoMo=;
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wTKkd-0005eb-Jt for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 30 May 2026 14:33:25 +0000
Received: by mail-pl1-f196.google.com with SMTP id
 d9443c01a7336-2bf55c39e16so2931945ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 May 2026 07:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780151593; x=1780756393; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9VAOLCzoyEGpuvHPIu3W860b+yu0vzmb8ayENUJBlHM=;
 b=nH6WYmIYSIzO7pyb76RcaR9D715hZ5jAx4mf8BYLO65deFSGqWGY15eLwhk4zTna7m
 18NPgSJ3yF6+T5XSQ5zSJoHS/ekX5XoicWvfhi9z4JMjrnjRspBKbmxEdZMNXD/Ef2yi
 yQE3W1qNQpLzoqWS5N1asnIkhc8djtw9E08paVj0kqVynGPDKm3ln8UpGs2elVz9zxii
 17HBt21Qh9b4qY2owvYRcJs599bJFOhCMClVClmjWZCBx7OX4M4fBqKQHwAQ2gQELYn2
 CjaVMgycz3HmZD379aIHoxsXHZNZk3aZXtn1m/suvcQ6U43E+WUNFrQwSsl77ET0l983
 tXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780151593; x=1780756393;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9VAOLCzoyEGpuvHPIu3W860b+yu0vzmb8ayENUJBlHM=;
 b=BKN+dZz8bKTfj12eBURg/SdGlcmbuLl+CAK/b+YSIyHNLjc2lXg4yapEoNWjjEvvVi
 ERAXMV7sregzVbAFfHqYCpCC8LlKi7iTXviBV2b/3xzNPVfFYkO2wWVqd7c3ef3zxgbe
 XRAYdqkleIzFy36HTL/LQdG7aFtNKRAe1jlunyAc7gKHjEJYDbDdkP03cPzQDPoBDdoY
 r5GeKx3WimuMCOwEj4Etfs1gZ6U/r02USQLkeUEA+wmC8ogES5NoTODPL9byzf2NJDv3
 RsrlXS9oDAyburhC7jfvPik8or0K0Q7quXGJQ6Bp1C83DFWhwyrmZrZW5Urb8H5PNhJE
 U/sw==
X-Forwarded-Encrypted: i=1;
 AFNElJ99WYA7cd5g3K+KdpqhJ8s9N3lX8Ac5JJ8YDBmeRG25C18TBrfgOkCsVt9IUJLcx+cn1Mv59LPyouIOPR4nkzen@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxNv4lUIJH1c5MbW4nVPABEP8JxZIA8daZBjZFuqWMu6KntcMvr
 K7Q2weCWD0h9zAYfI5AcRI7E2Kyxmdkt6NKPwTe+ozobno3qGJ68PFMH
X-Gm-Gg: Acq92OGILg/ig80Fsz0s0jbGcga5GPkEm2gy0yRcv7U32hfJfV/QLG4OQwoRQaz/HKf
 NoJhFIZpD2/hhiYj4OBE+U58X7CssVDuujtOy6PxqnlvQybavzya+nQwTj7zqK8ik4vtuYM6m+f
 Nmtvv2WyPYaISpDNUjmCc/eup6nghOvURu+eXZ2Uc1gEuMQSCK09R9VOWADqJ2k+eK+Q+oyWdJ3
 2qKjODCdlabhVCpL2nMeKIjV7jTVtdC7kvC3/x7r4r9gK1Cmm4epolYpxclNMAs9Nh21uNZR/dO
 8zKVu3w/bkRELxxcWlqUx1lAVgl29CvWqoH3/n/JMj6Y1VohPkusHRVoCRYjWqDStfUhTOCiydh
 XCawOplYeUuRpg5hrXNdPvOXEMdxAhjwjbMn0B6/C8cQZpgUrJVrT1L/QAOyozcbpGf62uGmgXr
 wrsXY4GhwHGJzBBKW1DqWEgZNXQ7ljYE0=
X-Received: by 2002:a17:903:22c3:b0:2c0:b31b:b0b with SMTP id
 d9443c01a7336-2c0b31b0cafmr12670605ad.22.1780151593234; 
 Sat, 30 May 2026 07:33:13 -0700 (PDT)
Received: from localhost ([111.228.63.84]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bf23c2381bsm52939645ad.62.2026.05.30.07.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 07:33:12 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Sat, 30 May 2026 22:33:07 +0800
Message-Id: <20260530143307.3596771-1-rollkingzzc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_stop_gc_thread() stops the background GC task, wakes
 foreground GC_MERGE waiters, frees sbi->gc_thread,
 and then clears the published
 pointer. A foreground f2fs_balance_fs() caller can already ha [...] 
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [rollkingzzc(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.196 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wTKkd-0005eb-Jt
Subject: [f2fs-dev] [PATCH v4] f2fs: protect published gc_thread during
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 2045gemini@gmail.com, Gao Xiang <xiang@kernel.org>, zerocling0077@gmail.com,
 Zhang Cen <rollkingzzc@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sourceforge.net,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:2045gemini@gmail.com,m:xiang@kernel.org,m:zerocling0077@gmail.com,m:rollkingzzc@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: B3C0960D799
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

f2fs_stop_gc_thread() stops the background GC task, wakes foreground
GC_MERGE waiters, frees sbi->gc_thread, and then clears the published
pointer.  A foreground f2fs_balance_fs() caller can already have copied
that pointer and queued itself on gc_th->fggc_wq, so freeing gc_th at
stop time can leave finish_wait() operating on a freed waitqueue.

Keep the allocated GC-thread state until the superblock is destroyed and
use gc_th->f2fs_gc_task as the running-state marker.  The stop path now
withdraws the task pointer with xchg(), stops the task, and wakes any
foreground waiters, but leaves the waitqueue storage valid.  The start
path reuses a stopped gc_thread object instead of reinitializing its
waitqueues, and remount restart decisions check the task pointer rather
than only the object pointer.

f2fs_balance_fs() also snapshots sbi->gc_thread once and rechecks
f2fs_gc_task after prepare_to_wait().  If teardown wins the race after
the first check, the foreground caller removes its wait entry without
sleeping on a worker that has already been withdrawn.

Validation reproduced this kernel report:

BUG: KASAN: slab-use-after-free in finish_wait+0x276/0x290
Write of size 8 at addr ffff8881150819b8 by task dd/802
The buggy address belongs to the object at ffff888115081900 which
belongs to the cache kmalloc-256 of size 256
The buggy address is located 184 bytes inside of freed 256-byte region
Call trace:
  finish_wait()
  f2fs_balance_fs()
  f2fs_write_single_data_page()
  f2fs_write_cache_pages()
  __f2fs_write_data_pages()
  do_writepages()
  filemap_fdatawrite_wbc()
  __filemap_fdatawrite_range()
  file_write_and_wait_range()
  f2fs_do_sync_file()
  f2fs_sync_file()
  do_fsync()
Freed by task stack:
  kfree()
  f2fs_stop_gc_thread()
  f2fs_do_shutdown()
  f2fs_shutdown()
  fs_bdev_mark_dead()

Fixes: 5911d2d1d1a3 ("f2fs: introduce gc_merge mount option")
Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
---
v4:
- Replace the v3 SRCU/refcounted lifetime model with a smaller fix that
  keeps the existing heap-allocated gc_thread object alive until
  superblock teardown.
- Use f2fs_gc_task as the running-state marker and withdraw it with
  xchg() before waking GC_MERGE waiters.
- Reuse a stopped gc_thread object across remount restarts so the
  waitqueues are not reinitialized while old waiters can still finish.
- Recheck f2fs_gc_task after prepare_to_wait() so a waiter that races
  with teardown does not sleep after the worker has been withdrawn.

v3:
- Add the Fixes tag for the GC_MERGE foreground wait path.
- Fix checkpatch style issues in the broader lifetime variant.

v2:
- Sashiko.dev pointed out that GC_MERGE foreground waiters and
  GC-thread users needed lifetime-safe access after teardown.

 fs/f2fs/gc.c      | 48 +++++++++++++++++++++++++++++------------------
 fs/f2fs/segment.c | 19 ++++++++++++-------
 fs/f2fs/super.c   |  7 +++++--
 3 files changed, 47 insertions(+), 27 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index ba93010924c06..20f8394482a09 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -193,12 +193,23 @@ static int gc_thread_func(void *data)
 
 int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 {
-	struct f2fs_gc_kthread *gc_th;
+	struct f2fs_gc_kthread *gc_th = sbi->gc_thread;
+	struct task_struct *task;
+	bool allocated = false;
 	dev_t dev = sbi->sb->s_bdev->bd_dev;
 
-	gc_th = f2fs_kmalloc(sbi, sizeof(struct f2fs_gc_kthread), GFP_KERNEL);
-	if (!gc_th)
-		return -ENOMEM;
+	if (gc_th && READ_ONCE(gc_th->f2fs_gc_task))
+		return 0;
+
+	if (!gc_th) {
+		gc_th = f2fs_kmalloc(sbi, sizeof(*gc_th), GFP_KERNEL);
+		if (!gc_th)
+			return -ENOMEM;
+		init_waitqueue_head(&gc_th->gc_wait_queue_head);
+		init_waitqueue_head(&gc_th->fggc_wq);
+		sbi->gc_thread = gc_th;
+		allocated = true;
+	}
 
 	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
 	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
@@ -221,34 +232,35 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 
 	gc_th->gc_wake = false;
 
-	sbi->gc_thread = gc_th;
-	init_waitqueue_head(&sbi->gc_thread->gc_wait_queue_head);
-	init_waitqueue_head(&sbi->gc_thread->fggc_wq);
-	sbi->gc_thread->f2fs_gc_task = kthread_run(gc_thread_func, sbi,
-			"f2fs_gc-%u:%u", MAJOR(dev), MINOR(dev));
-	if (IS_ERR(gc_th->f2fs_gc_task)) {
-		int err = PTR_ERR(gc_th->f2fs_gc_task);
+	task = kthread_run(gc_thread_func, sbi, "f2fs_gc-%u:%u",
+			   MAJOR(dev), MINOR(dev));
+	if (IS_ERR(task)) {
+		int err = PTR_ERR(task);
 
-		kfree(gc_th);
-		sbi->gc_thread = NULL;
+		if (allocated) {
+			kfree(gc_th);
+			sbi->gc_thread = NULL;
+		}
 		return err;
 	}
 
-	set_user_nice(gc_th->f2fs_gc_task,
-			PRIO_TO_NICE(sbi->critical_task_priority));
+	WRITE_ONCE(gc_th->f2fs_gc_task, task);
+	set_user_nice(task, PRIO_TO_NICE(sbi->critical_task_priority));
 	return 0;
 }
 
 void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_gc_kthread *gc_th = sbi->gc_thread;
+	struct task_struct *task;
 
 	if (!gc_th)
 		return;
-	kthread_stop(gc_th->f2fs_gc_task);
+	task = xchg(&gc_th->f2fs_gc_task, NULL);
+	if (!task)
+		return;
+	kthread_stop(task);
 	wake_up_all(&gc_th->fggc_wq);
-	kfree(gc_th);
-	sbi->gc_thread = NULL;
 }
 
 static int select_gc_type(struct f2fs_sb_info *sbi, int gc_type)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 788f8b0502492..84307525edd27 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -424,6 +424,8 @@ int f2fs_commit_atomic_write(struct inode *inode)
  */
 void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 {
+	struct f2fs_gc_kthread *gc_th;
+
 	if (f2fs_cp_error(sbi))
 		return;
 
@@ -444,15 +446,18 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 	if (has_enough_free_secs(sbi, 0, 0))
 		return;
 
-	if (test_opt(sbi, GC_MERGE) && sbi->gc_thread &&
-				sbi->gc_thread->f2fs_gc_task) {
+	gc_th = sbi->gc_thread;
+	if (test_opt(sbi, GC_MERGE) && gc_th &&
+	    READ_ONCE(gc_th->f2fs_gc_task)) {
 		DEFINE_WAIT(wait);
 
-		prepare_to_wait(&sbi->gc_thread->fggc_wq, &wait,
-					TASK_UNINTERRUPTIBLE);
-		wake_up(&sbi->gc_thread->gc_wait_queue_head);
-		io_schedule();
-		finish_wait(&sbi->gc_thread->fggc_wq, &wait);
+		prepare_to_wait(&gc_th->fggc_wq, &wait,
+				TASK_UNINTERRUPTIBLE);
+		if (READ_ONCE(gc_th->f2fs_gc_task)) {
+			wake_up(&gc_th->gc_wait_queue_head);
+			io_schedule();
+		}
+		finish_wait(&gc_th->fggc_wq, &wait);
 	} else {
 		struct f2fs_gc_control gc_control = {
 			.victim_segno = NULL_SEGNO,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ccf806b676f53..d6863da05a7c2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2925,11 +2925,12 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 	if ((flags & SB_RDONLY) ||
 			(F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_OFF &&
 			!test_opt(sbi, GC_MERGE))) {
-		if (sbi->gc_thread) {
+		if (sbi->gc_thread && READ_ONCE(sbi->gc_thread->f2fs_gc_task)) {
 			f2fs_stop_gc_thread(sbi);
 			need_restart_gc = true;
 		}
-	} else if (!sbi->gc_thread) {
+	} else if (!sbi->gc_thread ||
+			!READ_ONCE(sbi->gc_thread->f2fs_gc_task)) {
 		err = f2fs_start_gc_thread(sbi);
 		if (err)
 			goto restore_opts;
@@ -5451,6 +5452,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 free_sb_buf:
 	kfree(raw_super);
 free_sbi:
+	kfree(sbi->gc_thread);
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 	lockdep_unregister_key(&sbi->cp_global_sem_key);
 #endif
@@ -5535,6 +5537,7 @@ static void kill_f2fs_super(struct super_block *sb)
 	/* Release block devices last, after fscrypt_destroy_keyring(). */
 	if (sbi) {
 		destroy_device_list(sbi);
+		kfree(sbi->gc_thread);
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 		lockdep_unregister_key(&sbi->cp_global_sem_key);
 #endif
-- 
2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
