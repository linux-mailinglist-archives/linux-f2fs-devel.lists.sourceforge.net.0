Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j0NzJvbQQ2rfjAoAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2026 16:21:42 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A13676E55F0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2026 16:21:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=G0JeHRT6;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=DvT0d1xx;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="F IvXyyF";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=pF95xzaD;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QUIwRuROv1vxfVYMvsH7I+HdB0KwsaXZ7Cly/uuMkeI=; b=G0JeHRT6Iep4B/UE3CmK0p4g0S
	UmzXzjnzEnwR3ygcJr4B2uz8NCHDtNoAr45Hz+5ZAvMfhxITU164ddVfMIfDRzYslxCeKG4XXC59l
	hUq0l7IzP9//7qAHneDFwqQe3trPiUJiNxH+xYgbhZGukKivoCmvoUGhOShIeE3f9uGI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1weZLC-0003sK-8h;
	Tue, 30 Jun 2026 14:21:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rollkingzzc@gmail.com>) id 1weZL4-0003s9-AD
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jun 2026 14:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f7XDMgvV8qwVho+dZrmsYZDrNL7qc6m/q87WoFpPEDE=; b=DvT0d1xxNdnseD8y4myGPhkz4Y
 8M3D/Umh0/RfNJF1DIys4viQTAwHztdXXlz6Y812a59Tw16g9UO/1ipNYvFXcbdYbqG3PWyaGPIYF
 SdubhE6uwpXQPZhpO4FVTdSevjJIMbh1cUuDd3ehac+VDQ9cm0Dm6yY2iTltq2cRiLoA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=f7XDMgvV8qwVho+dZrmsYZDrNL7qc6m/q87WoFpPEDE=; b=F
 IvXyyFf7OBGAWB2uQFtR5Ec8yZzypY/NrXIi4o48GQP3sJ5lznGY2x16mN8LE7VVpkqMluE0qV9k3
 coG+vN8fabIu3SIiMwcmzWl6yLvEQrplRQz0RcP1Gv/5vIHEWH0xMi6besWpT/HWRje32s49WhnnZ
 dxl6snBooE/+ND5Q=;
Received: from mail-pj2-f4.google.com ([74.125.227.132])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1weZKs-0004Hw-TM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jun 2026 14:21:25 +0000
Received: by mail-pj2-f4.google.com with SMTP id
 98e67ed59e1d1-37dedd6fd32so86566a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Jun 2026 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782829253; x=1783434053; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f7XDMgvV8qwVho+dZrmsYZDrNL7qc6m/q87WoFpPEDE=;
 b=pF95xzaD0M0v45VHv+VXPiwQl7gTO1G6qCI2NoHpJjHWvXzdXmLJtfHYjzsmTZSbCR
 O7BL4hzMiTpDoG268SQ/1udhEtLexXGgZyt9P/lrTTA1pIebK1M67rN3xkNHMFPJmymk
 AGcJYrfg32pI1KVcCxoJG01v03GFInQt1eJ+vnelcl7OBVoS7aK4P8WNadteXpzuw2i0
 dIWdUl9OphC21o3yIhcwRMbjz9nSXCxvI1jYOM3FtQLeuU/Pkv/afSBZm5WRvC3KPb8j
 QVwJJ5SrWPpfLv3IvhmtIxfWbaVc8mpmqdzWou1thZu3uwnAvet76v8GN/72cw/5gXAG
 5S+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782829253; x=1783434053;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f7XDMgvV8qwVho+dZrmsYZDrNL7qc6m/q87WoFpPEDE=;
 b=cNV9kKR3lxS2wUWXez3hZ6YQV6zCaYBtvMnVz2lANmQHVe6AXp0AMrlOTe8XQNxmJA
 Xyx4ddqR1UwQEllftkB12UjJOPkoj5dGRyuurtCbyB3WNOjNZbGPkwhc/1Dl1Dg5wYko
 29OFEcIdYVSzqG8rfjdiSW1JPVedzfi5dJux5QvgpdHjM/CVrNEd8YH/mwVbLrs4zcPo
 +oa6tTWZcVMk3WX/c3mxXNWlTd99dDXFBTHvr/AjL/kjxXkl9l5/MK3yhrZjltwLgIVh
 eRv7PuXD3eWd6lBD9vxjfswzCMWtdccf80j4NcYIrYELbPccmr2KeJ9w829OOaKj0iD5
 K4wA==
X-Gm-Message-State: AOJu0YwdUFU5AhQODW1CqMxj4khicRStD5Sgm/2iqjOrGNUr23P4OGsP
 LXgfhU0TyJmTgD6MEId4wnKYs9h589bmmDZkVzk2rxDvs4e6Xfum5Thg
X-Gm-Gg: AfdE7cmymcIex05OmxFSv3WhgLmv4+vtGeSlysMVe9E6gvVWQV3ya9f+bwHfjpAvMkK
 omZhTbMA5H2ziskRxeG2VhYAsdwu4/VHtF0ggiNC0HKz/GNfFL2B5ot5fZXeb7HfS1JCOQyF2CW
 UuGB9KeblXHYoeNCfKjZR17F45lM+2yYc0Jr6NHU2L5TPu/9J9rpEvAcXDoGfUPqKAUh3AQ/nsE
 Ol0CRp39gQ9Zjfyhnr1gqK1/mcIBCNzTdMgEkgJ6ygJntgziShK6RSYV4/TIAMayz45xWBubICF
 o/JMr8vuN/9H6J1oF0+FUOacsyrp9vTfnQTbf4/YRycjBHYi5o4gzAqBjHOb8a7aIS+NdghgFCv
 dZTiWO0nQBFBzvA+i8hSM827FuJhaGXzAqpvhbTMhx1IPAl1LQzhp+QR904/BwVuo2Mpm/SWJ3a
 P+vOW1yZGejhnEpAwdjGudlz6dJ5bgnFeTsTJl0LMeEqrcPLVstsli/L4QTyYf6vV0FjE=
X-Received: by 2002:a17:90a:c10e:b0:37d:9874:9363 with SMTP id
 98e67ed59e1d1-3808bd3faa8mr584567a91.2.1782829252642; 
 Tue, 30 Jun 2026 07:20:52 -0700 (PDT)
Received: from localhost ([111.228.63.84]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c9bbff28998sm1681302a12.22.2026.06.30.07.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 07:20:52 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 30 Jun 2026 22:20:46 +0800
Message-Id: <20260630142046.3145107-1-rollkingzzc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [74.125.227.132 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [rollkingzzc(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [74.125.227.132 listed in wl.mailspike.net]
X-Headers-End: 1weZKs-0004Hw-TM
Subject: [f2fs-dev] [PATCH v7] f2fs: protect gc task pointer during teardown
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RECEIVED_SPAMHAUS_PBL(0.00)[111.228.63.84:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[74.125.227.132:received,172.30.29.66:received];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A13676E55F0

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
it under gc_task_lock, and by making sysfs users that dereference the
task hold the same lock.

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

Add gc_task_lock to struct f2fs_gc_kthread and use f2fs_update_gc_task()
to publish the GC task only after the new kthread has been created and
its nice value has been set. The start path uses kthread_create() so the
task is not woken until after f2fs_gc_task is visible to waiters. The
stop path updates f2fs_gc_task to NULL under the same lock before
kthread_stop(), so later readers see that no new foreground GC work
should be handed to the background thread.

f2fs_balance_fs() also rechecks f2fs_gc_task after prepare_to_wait(). If
the GC task has already been withdrawn, the caller removes its wait entry
without waking the GC thread or sleeping for new foreground GC work. Thus
shutdown drains already queued waiters and stops accepting new foreground
GC work once the task pointer is withdrawn.

Task pointer users are protected separately from the embedded container
lifetime. A sysfs critical_task_priority store now checks f2fs_gc_task
and calls set_user_nice() under gc_task_lock. Boolean running-state
checks that do not dereference the task_struct use READ_ONCE().

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

 fs/f2fs/f2fs.h    | 15 +++++++++++++++
 fs/f2fs/gc.c      | 22 +++++++++++++---------
 fs/f2fs/segment.c | 16 ++++++++++------
 fs/f2fs/super.c   |  5 +++--
 fs/f2fs/sysfs.c   | 15 +++++++++------
 5 files changed, 50 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8011bbdf2c68..1aa8f8adddaa 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -19,6 +19,7 @@
 #include <linux/sched.h>
 #include <linux/cred.h>
 #include <linux/sched/mm.h>
+#include <linux/spinlock.h>
 #include <linux/vmalloc.h>
 #include <linux/bio.h>
 #include <linux/blkdev.h>
@@ -1750,6 +1751,7 @@ struct decompress_io_ctx {
 
 struct f2fs_gc_kthread {
 	struct task_struct *f2fs_gc_task;
+	spinlock_t gc_task_lock;		/* protects f2fs_gc_task */
 	wait_queue_head_t gc_wait_queue_head;
 
 	/* for gc sleep time */
@@ -1775,6 +1777,19 @@ struct f2fs_gc_kthread {
 	unsigned int boost_gc_greedy;
 };
 
+static inline struct task_struct *
+f2fs_update_gc_task(struct f2fs_gc_kthread *gc_th, struct task_struct *task)
+{
+	struct task_struct *old_task;
+
+	spin_lock(&gc_th->gc_task_lock);
+	old_task = READ_ONCE(gc_th->f2fs_gc_task);
+	WRITE_ONCE(gc_th->f2fs_gc_task, task);
+	spin_unlock(&gc_th->gc_task_lock);
+
+	return old_task;
+}
+
 struct f2fs_sb_info {
 	struct super_block *sb;			/* pointer to VFS super block */
 	struct proc_dir_entry *s_proc;		/* proc entry */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index e8244b92d8ce..7253a920153b 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -194,6 +194,7 @@ static int gc_thread_func(void *data)
 int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_gc_kthread *gc_th = &sbi->gc_thread;
+	struct task_struct *task;
 	dev_t dev = sbi->sb->s_bdev->bd_dev;
 
 	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
@@ -219,26 +220,29 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 
 	init_waitqueue_head(&gc_th->gc_wait_queue_head);
 	init_waitqueue_head(&gc_th->fggc_wq);
-	gc_th->f2fs_gc_task = kthread_run(gc_thread_func, sbi,
-			"f2fs_gc-%u:%u", MAJOR(dev), MINOR(dev));
-	if (IS_ERR(gc_th->f2fs_gc_task)) {
-		int err = PTR_ERR(gc_th->f2fs_gc_task);
+	task = kthread_create(gc_thread_func, sbi, "f2fs_gc-%u:%u",
+			      MAJOR(dev), MINOR(dev));
+	if (IS_ERR(task)) {
+		int err = PTR_ERR(task);
 
-		gc_th->f2fs_gc_task = NULL;
 		return err;
 	}
 
-	set_user_nice(gc_th->f2fs_gc_task,
-			PRIO_TO_NICE(sbi->critical_task_priority));
+	set_user_nice(task, PRIO_TO_NICE(sbi->critical_task_priority));
+	f2fs_update_gc_task(gc_th, task);
+	wake_up_process(task);
 	return 0;
 }
 
 void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_gc_kthread *gc_th = &sbi->gc_thread;
+	struct task_struct *task;
 
-	kthread_stop(gc_th->f2fs_gc_task);
-	gc_th->f2fs_gc_task = NULL;
+	task = f2fs_update_gc_task(gc_th, NULL);
+	if (!task)
+		return;
+	kthread_stop(task);
 	wake_up_all(&gc_th->fggc_wq);
 }
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 0b706568b034..e6e67c233e27 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -425,6 +425,8 @@ int f2fs_commit_atomic_write(struct inode *inode)
  */
 void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 {
+	struct f2fs_gc_kthread *gc_th = &sbi->gc_thread;
+
 	if (f2fs_cp_error(sbi))
 		return;
 
@@ -452,14 +454,16 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 	f2fs_submit_merged_write(sbi, DATA);
 	f2fs_submit_all_merged_ipu_writes(sbi);
 
-	if (test_opt(sbi, GC_MERGE) && sbi->gc_thread.f2fs_gc_task) {
+	if (test_opt(sbi, GC_MERGE) && READ_ONCE(gc_th->f2fs_gc_task)) {
 		DEFINE_WAIT(wait);
 
-		prepare_to_wait(&sbi->gc_thread.fggc_wq, &wait,
-					TASK_UNINTERRUPTIBLE);
-		wake_up(&sbi->gc_thread.gc_wait_queue_head);
-		io_schedule();
-		finish_wait(&sbi->gc_thread.fggc_wq, &wait);
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
index e9ecd67a3f3b..140fffe93ea4 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2943,11 +2943,11 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 	if ((flags & SB_RDONLY) ||
 			(F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_OFF &&
 			!test_opt(sbi, GC_MERGE))) {
-		if (sbi->gc_thread.f2fs_gc_task) {
+		if (READ_ONCE(sbi->gc_thread.f2fs_gc_task)) {
 			f2fs_stop_gc_thread(sbi);
 			need_restart_gc = true;
 		}
-	} else if (!sbi->gc_thread.f2fs_gc_task) {
+	} else if (!READ_ONCE(sbi->gc_thread.f2fs_gc_task)) {
 		err = f2fs_start_gc_thread(sbi);
 		if (err)
 			goto restore_opts;
@@ -5051,6 +5051,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 		spin_lock_init(&sbi->inode_lock[i]);
 	}
 	mutex_init(&sbi->flush_lock);
+	spin_lock_init(&sbi->gc_thread.gc_task_lock);
 
 	/* set a block size */
 	if (unlikely(!sb_set_blocksize(sb, F2FS_BLKSIZE))) {
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index be92c05a5420..c83cd1d3ede2 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -664,7 +664,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			sbi->gc_mode = GC_NORMAL;
 		} else if (t == 1) {
 			sbi->gc_mode = GC_URGENT_HIGH;
-			if (sbi->gc_thread.f2fs_gc_task) {
+			if (READ_ONCE(sbi->gc_thread.f2fs_gc_task)) {
 				sbi->gc_thread.gc_wake = true;
 				wake_up_interruptible_all(
 					&sbi->gc_thread.gc_wait_queue_head);
@@ -674,7 +674,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			sbi->gc_mode = GC_URGENT_LOW;
 		} else if (t == 3) {
 			sbi->gc_mode = GC_URGENT_MID;
-			if (sbi->gc_thread.f2fs_gc_task) {
+			if (READ_ONCE(sbi->gc_thread.f2fs_gc_task)) {
 				sbi->gc_thread.gc_wake = true;
 				wake_up_interruptible_all(
 					&sbi->gc_thread.gc_wait_queue_head);
@@ -981,17 +981,20 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	}
 
 	if (!strcmp(a->attr.name, "critical_task_priority")) {
+		int nice;
+
 		if (t < NICE_TO_PRIO(MIN_NICE) || t > NICE_TO_PRIO(MAX_NICE))
 			return -EINVAL;
 		if (!capable(CAP_SYS_NICE))
 			return -EPERM;
 		sbi->critical_task_priority = t;
+		nice = PRIO_TO_NICE(sbi->critical_task_priority);
 		if (sbi->cprc_info.f2fs_issue_ckpt)
-			set_user_nice(sbi->cprc_info.f2fs_issue_ckpt,
-					PRIO_TO_NICE(sbi->critical_task_priority));
+			set_user_nice(sbi->cprc_info.f2fs_issue_ckpt, nice);
+		spin_lock(&sbi->gc_thread.gc_task_lock);
 		if (sbi->gc_thread.f2fs_gc_task)
-			set_user_nice(sbi->gc_thread.f2fs_gc_task,
-					PRIO_TO_NICE(sbi->critical_task_priority));
+			set_user_nice(sbi->gc_thread.f2fs_gc_task, nice);
+		spin_unlock(&sbi->gc_thread.gc_task_lock);
 		return count;
 	}
 
-- 
2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
