Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t2E4KGZTQ2rhWwoAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2026 07:25:58 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 915536E079D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2026 07:25:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=XRoIuFqh;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="WhB/mDca";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="j 9jjpv0";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=hmxqMxWQ;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e6+a3WWKIOGVtwvpfrXW+5urR7N3mKRklnu4DAx5nN4=; b=XRoIuFqhBxXSILZrOAYJS+nsUZ
	iJgzn69c56UIdV1vZIRZuFvfi/F37RZw9+jc+1ysf94Gqs6WtjE3BZyHTvhbdaOE+p7eCBr/WXw5l
	I6s6N1aRaP9FkSCvmKnn2W1pSRlnC++Z+27WAqppElLUVJu48ABtmrOehzRWiyUvsGYo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1weQyg-0001qd-VZ;
	Tue, 30 Jun 2026 05:25:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rollkingzzc@gmail.com>) id 1weQyY-0001qT-6e
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jun 2026 05:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T0nHTHMTaczDjmeESFhp8Z52IMkOcrljdDCN0lb0WWY=; b=WhB/mDcaNxmvJkIUqMpgbLjzDL
 A7Np/0ddeHdqOM2VFdpEXrH0+8YkWEzQUWZ5DM23SjAFdmZYaR+tgBRv+u0k9gNRQKSMm4ADV0QF6
 +5DJ2D9BQEQRw0BDKqVKDne34vMeBaZwb8cjnLEM/N9lyt5xXF0jXPT+ubwIsU30Czis=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=T0nHTHMTaczDjmeESFhp8Z52IMkOcrljdDCN0lb0WWY=; b=j
 9jjpv0dM+gdIu7nyjqpWJU5HQQF1XUbRATj4JTgn4zqca2RnYOiY/1tKHRDXULXj0n9WRdwUlz+pM
 X9wnewNLFUMaQpA2/DGa1uitqGK48CwD3AD70HvwXPR4aCNe240OH4BdGNx+nRXr+f1a3U7iG8qKJ
 kBvjJM4pZqRh78Aw=;
Received: from mail-qk1-f194.google.com ([209.85.222.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1weQyV-0006um-5w for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jun 2026 05:25:38 +0000
Received: by mail-qk1-f194.google.com with SMTP id
 af79cd13be357-92e663c828dso24235585a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Jun 2026 22:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782797130; x=1783401930; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T0nHTHMTaczDjmeESFhp8Z52IMkOcrljdDCN0lb0WWY=;
 b=hmxqMxWQm5pFIWvkWLUHe0lBqa8uxdY8KyL8ZuMZmLfM8aJwh4zwlbmvWd4s9r2W8l
 QNgNSLRw7kDwSy9rFK/lgSMAuh0IMLa7B4Y8MUxesPDnp2f+zR6YnP0VkAAKAkBlgk8b
 lrb9ukXh8dprPzv2xCEGCa8LROn8kIEzSGJgUlkIZO05//PFp/pkLtNnWABTCK6oRiFG
 wEa0YAkh6bZPtQSGfiH7OKyLNxUDZyUnfTb9SeoNArM3qfwrn60Npqllvvjf0vslewNy
 GwEww3+iUyPThevLICwrcDdM/AYicCVzFxdoBkXMhPxix4/j21BEcsZJzOKSUIP1D3tI
 9V/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782797130; x=1783401930;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T0nHTHMTaczDjmeESFhp8Z52IMkOcrljdDCN0lb0WWY=;
 b=OJ5zqTbv9769x6DHjvFjGOGEEH1qB/o5LSseqD7fEUtBCtB6WA4xqhudeRrEZIsPR2
 E8+QyrHy2dCq68aWaVYY0sjqg20Vcw2RYXbstf15hvciD+hdj3YSzXMloIKAy00ezD2y
 /He+JXjOfUS/sJo0QJKjuM+rahm/kjUBYBCnsaunDXbg2sxdIHzJ7HLncMH4RU8XuuJ5
 YTkAJfT+CI94D9MoPDBN7Rj4JnQw1ahY/vRcD8lLXa9ZpxP4UpGjYyi3VrvAv+c/YJWy
 RxDv9aMQEUog16O0F+GPv+n7GM9jrIGKFi55r8ly8aBwdGAF1InV9WmcSFX9auMcDimG
 Wm5w==
X-Gm-Message-State: AOJu0YwVQ95KrC+btoPZrzKLU2PRA5NwcD2cbM01xF21Q6xAcjea6EYx
 +UszC0AX7t7GIuWK4e03NUGYzAxlyDzl+1gbVVXXSagx9n9728S6JqqkZu6n26FD4yI=
X-Gm-Gg: AfdE7ckGRCB6tQVOh0F93yodeinJbyMvLwF1obSI//ulQXsyKokZMADyvM+X4tFFI9f
 nMopzrTlxhXcXMEDLwv3HA8fbZ2vq2u3Z1+c4rZ8sPX4Yles0Co0vMtypA2yzY5Gwk6jAHMV2X4
 LefKWeUvA6QD7kPVzQhavVavHyBxegx5gajsGUhXTUXdg5G6GBDlplkvJ+TcV9BfsUcp5vXC+Sj
 oSE/cwlFiwz5EQfwA8uZpPZbZ40Qlyh5vSZE5h3gYzqKYK1AhwipdMEuy/axe2PG/S2D6Gl91pQ
 EvECV6U1Je98QDEffpnvxo4uANkAnTRGsU7gXjQS4MCMMCmptKIjYrA/5I2F31bf8TN1IapByAv
 SFGCamoCRBH7v5/15FdmqQqi56uLvkhGn8u4Yw2pkmtt91A+ud2Vg9TqRXN3a5cZtHkfchVpt93
 6Z2WCra+Y/SkJAADFk8N6/haEjRLaeYx3Yj5eOB2nSkmPRXJRtxpVkKqc1ds1LOVH3h0c=
X-Received: by 2002:a17:903:fa3:b0:2ca:2390:ff13 with SMTP id
 d9443c01a7336-2ca4488914bmr2471015ad.5.1782795566227; 
 Mon, 29 Jun 2026 21:59:26 -0700 (PDT)
Received: from localhost ([111.228.63.84]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c82becsm5470465ad.27.2026.06.29.21.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 21:59:25 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 30 Jun 2026 12:59:19 +0800
Message-Id: <20260630045919.1671833-1-rollkingzzc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch is based on the preceding patch "f2fs: embed
 f2fs_gc_kthread
 in f2fs_sb_info", which gives the GC waitqueues and thread tunables superblock
 lifetime. With that container lifetime fixed, f2f [...] 
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [rollkingzzc(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.194 listed in wl.mailspike.net]
X-Headers-End: 1weQyV-0006um-5w
Subject: [f2fs-dev] [PATCH v6] f2fs: protect gc task pointer during teardown
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 915536E079D

This patch is based on the preceding patch "f2fs: embed
f2fs_gc_kthread in f2fs_sb_info", which gives the GC waitqueues and
thread tunables superblock lifetime. With that container lifetime fixed,
f2fs_gc_task remains the running-state marker and the task_struct pointer
that needs separate lifetime protection.

During shutdown, f2fs_stop_gc_thread() stops the GC task and wakes
GC_MERGE foreground waiters while f2fs_balance_fs() can concurrently
queue on gc_th->fggc_wq. The preceding embedded-gc_thread patch keeps
that waitqueue storage alive for the superblock lifetime; this patch
protects the remaining f2fs_gc_task pointer by publishing and detaching
it under gc_task_lock, and by taking a task_struct reference for sysfs
users that dereference the task.

The buggy scenario involves two paths, with each column showing the
order within that path:

foreground f2fs_balance_fs() caller:   shutdown path:
  1. observes no checkpoint error        1. sets CP_ERROR_FLAG
  2. snapshots sbi->gc_thread           2. enters f2fs_stop_gc_thread()
  3. queues on gc_th->fggc_wq           3. stops gc_th->f2fs_gc_task
  4. wakes gc_wait_queue_head           4. wakes gc_th->fggc_wq
  5. sleeps for foreground GC           5. frees gc_th in the old layout
  6. finish_wait() touches fggc_wq

GC_MERGE does not keep independent work_struct items that shutdown can
cancel. Its pending foreground GC requests are waitqueue waiters. Drain
them by withdrawing the GC task pointer, stopping the task, waking
gc_th->fggc_wq, and leaving each waiter to remove its own wait entry
with finish_wait().

Add gc_task_lock to struct f2fs_gc_kthread and use it to publish the GC
task only after the new kthread has been created and its nice value has
been set. The start path uses kthread_create() so the task is not woken
until after f2fs_gc_task is visible to waiters. The stop path detaches
f2fs_gc_task under the same lock before kthread_stop(), so later readers
see that no new foreground GC work should be handed to the background
thread.

f2fs_balance_fs() also rechecks both f2fs_cp_error() and f2fs_gc_task
after prepare_to_wait(). If shutdown is visible or the GC task has
already been withdrawn, the caller removes its wait entry without waking
the GC thread or sleeping for new foreground GC work. Thus shutdown
drains already queued waiters and stops accepting new foreground GC work
once shutdown is visible to the caller.

Task pointer users are protected separately from the embedded container
lifetime. A sysfs critical_task_priority store now snapshots the GC task
under gc_task_lock and holds a task_struct reference while calling
set_user_nice(). Boolean running-state checks that do not dereference the
task_struct continue to use READ_ONCE().

One observed report was:

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
Assisted-by: Codex:gpt-5.5
Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
---
Based on:
- [PATCH] f2fs: embed f2fs_gc_kthread in f2fs_sb_info

 fs/f2fs/f2fs.h    | 37 +++++++++++++++++++++++++++++++++++++
 fs/f2fs/gc.c      | 12 ++++++++----
 fs/f2fs/segment.c |  2 +-
 fs/f2fs/super.c   |  1 +
 fs/f2fs/sysfs.c   |  6 ++++--
 5 files changed, 51 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9ab196f65643..931d37f64bb3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -17,8 +17,10 @@
 #include <linux/magic.h>
 #include <linux/kobject.h>
 #include <linux/sched.h>
+#include <linux/sched/task.h>
 #include <linux/cred.h>
 #include <linux/sched/mm.h>
+#include <linux/spinlock.h>
 #include <linux/vmalloc.h>
 #include <linux/bio.h>
 #include <linux/blkdev.h>
@@ -430,6 +432,7 @@ struct ckpt_req_control {
 
 struct f2fs_gc_kthread {
 	struct task_struct *f2fs_gc_task;
+	spinlock_t gc_task_lock;		/* protects f2fs_gc_task */
 	wait_queue_head_t gc_wait_queue_head;
 
 	/* for gc sleep time */
@@ -455,6 +458,40 @@ struct f2fs_gc_kthread {
 	unsigned int boost_gc_greedy;
 };
 
+static inline struct task_struct *f2fs_get_gc_task(struct f2fs_gc_kthread *gc_th)
+{
+	struct task_struct *task;
+
+	spin_lock(&gc_th->gc_task_lock);
+	task = READ_ONCE(gc_th->f2fs_gc_task);
+	if (task)
+		get_task_struct(task);
+	spin_unlock(&gc_th->gc_task_lock);
+
+	return task;
+}
+
+static inline void f2fs_set_gc_task(struct f2fs_gc_kthread *gc_th,
+				    struct task_struct *task)
+{
+	spin_lock(&gc_th->gc_task_lock);
+	WRITE_ONCE(gc_th->f2fs_gc_task, task);
+	spin_unlock(&gc_th->gc_task_lock);
+}
+
+static inline struct task_struct *
+f2fs_detach_gc_task(struct f2fs_gc_kthread *gc_th)
+{
+	struct task_struct *task;
+
+	spin_lock(&gc_th->gc_task_lock);
+	task = READ_ONCE(gc_th->f2fs_gc_task);
+	WRITE_ONCE(gc_th->f2fs_gc_task, NULL);
+	spin_unlock(&gc_th->gc_task_lock);
+
+	return task;
+}
+
 /* a time threshold that checkpoint was blocked for, unit: ms */
 #define CP_LONG_LATENCY_THRESHOLD	5000
 
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5a98754354b6..c26fcaffa986 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -197,6 +197,9 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 	struct task_struct *task;
 	dev_t dev = sbi->sb->s_bdev->bd_dev;
 
+	if (READ_ONCE(gc_th->f2fs_gc_task))
+		return 0;
+
 	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
 	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
 	gc_th->boost_gc_multiple = BOOST_GC_MULTIPLE;
@@ -218,16 +221,17 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 
 	gc_th->gc_wake = false;
 
-	task = kthread_run(gc_thread_func, sbi, "f2fs_gc-%u:%u",
-			   MAJOR(dev), MINOR(dev));
+	task = kthread_create(gc_thread_func, sbi, "f2fs_gc-%u:%u",
+			      MAJOR(dev), MINOR(dev));
 	if (IS_ERR(task)) {
 		int err = PTR_ERR(task);
 
 		return err;
 	}
 
-	WRITE_ONCE(gc_th->f2fs_gc_task, task);
 	set_user_nice(task, PRIO_TO_NICE(sbi->critical_task_priority));
+	f2fs_set_gc_task(gc_th, task);
+	wake_up_process(task);
 	return 0;
 }
 
@@ -236,7 +240,7 @@ void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi)
 	struct f2fs_gc_kthread *gc_th = &sbi->gc_thread;
 	struct task_struct *task;
 
-	task = xchg(&gc_th->f2fs_gc_task, NULL);
+	task = f2fs_detach_gc_task(gc_th);
 	if (!task)
 		return;
 	kthread_stop(task);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 877b015e24cd..aeda8351398f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -451,7 +451,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 
 		prepare_to_wait(&gc_th->fggc_wq, &wait,
 				TASK_UNINTERRUPTIBLE);
-		if (READ_ONCE(gc_th->f2fs_gc_task)) {
+		if (!f2fs_cp_error(sbi) && READ_ONCE(gc_th->f2fs_gc_task)) {
 			wake_up(&gc_th->gc_wait_queue_head);
 			io_schedule();
 		}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ec44c5be8ca0..ed1ce1266ce4 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4993,6 +4993,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 		spin_lock_init(&sbi->inode_lock[i]);
 	}
 	mutex_init(&sbi->flush_lock);
+	spin_lock_init(&sbi->gc_thread.gc_task_lock);
 	init_waitqueue_head(&sbi->gc_thread.gc_wait_queue_head);
 	init_waitqueue_head(&sbi->gc_thread.fggc_wq);
 
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 705563dfc560..87aa348f2a2b 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -996,9 +996,11 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		nice = PRIO_TO_NICE(sbi->critical_task_priority);
 		if (sbi->cprc_info.f2fs_issue_ckpt)
 			set_user_nice(sbi->cprc_info.f2fs_issue_ckpt, nice);
-		gc_task = READ_ONCE(sbi->gc_thread.f2fs_gc_task);
-		if (gc_task)
+		gc_task = f2fs_get_gc_task(&sbi->gc_thread);
+		if (gc_task) {
 			set_user_nice(gc_task, nice);
+			put_task_struct(gc_task);
+		}
 		return count;
 	}
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
