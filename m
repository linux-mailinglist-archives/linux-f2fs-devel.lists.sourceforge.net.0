Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4Z94D/7xMGqUZAUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 08:49:34 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AF168CA50
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 08:49:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=UCJkjH44;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=IYmtYE+h;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="G 1IntCk";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=SyVT+5xk;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jLuSZB21fJa44VlgNBAV4eifETOXHJNfOpudefgiE9c=; b=UCJkjH443xqRnMV2bDlyirDPXY
	M7fyNjmA9cUwWYTuiSPgedxjrKZZsj74gm7tbxsLO/OBpa3gDRgYMgz2xHMhhqKOPxli/8BCO/y/H
	Zde0s1Dk3v/C//o0iXTWrsdge+Lhu8tMwz1eCZU4ePxNPVAJNhmeqVaLtXMGZgTXw8DE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZNbv-000291-In;
	Tue, 16 Jun 2026 06:49:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rollkingzzc@gmail.com>) id 1wZNbu-00028p-Hl
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 06:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GCVxv7Lr69nULKT5yqjAycdaU8fM+vHXY3/h+9NHSqs=; b=IYmtYE+hLIazQZiU8HSBqKkYol
 zuSerGwTpFUcMW1P6ify5ThdOztMpVBK930Dpqk0xjAyEwXPwwLJsBDTgM7czMox5ND5iMZ55JEj3
 SdBlSvsHVHC5HDVlv5hLK6ehjexl8OyYZsRhVZYBRLNNj6/4WOapixBFPvzF/KdMKCAI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GCVxv7Lr69nULKT5yqjAycdaU8fM+vHXY3/h+9NHSqs=; b=G
 1IntCkltGWzR4WvqqE+YHCDx+7YkC0wrJjgoom83+vaVdi3xzp36pvyjD83vuBqmgIyVyBypbjnMF
 BdU2ykIek1OSmMacLdgZXFCKWaZDAvNoYzM28+CjeI1U3oRQ/SMPs9H/i9GtuEu/yin1YSnWZ1wcw
 TMhU2dwajLTyvNQc=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZNbs-00033e-HX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 06:49:23 +0000
Received: by mail-pf1-f194.google.com with SMTP id
 d2e1a72fcca58-8423f236418so2248304b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 23:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781592550; x=1782197350; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GCVxv7Lr69nULKT5yqjAycdaU8fM+vHXY3/h+9NHSqs=;
 b=SyVT+5xkCUD28JxUVpu/R2/pY/tMHChkoxj0scz1YfyOcKLXT2oDvHSdualr6DQI6P
 8W0iKgSbjM16KmxsTQxuh8noOL+lH90S/tAMEAtF2hGLMvd6oFxumheoKIiRZnQUIgYn
 o8JZGpD2sJ4l7l/QU1E0x+CjLhC9ojRqhBoPwK9eEWyHoqCYf7rskQQYvP6fYBJSPj45
 t8zHgtbLDZcLO2E66GjcW8pk3cbGzZNCGKKbwaXmEeg68Uda38+joh0sHFxyz+R3tm6F
 kSpi2U306Uf71QL4Zv2ZaBuRr6MxsvhXStrOFy4hy3iCxNxAiCf9R1eWtsaNTxeu1aJH
 lU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781592550; x=1782197350;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GCVxv7Lr69nULKT5yqjAycdaU8fM+vHXY3/h+9NHSqs=;
 b=oqRNbabjwYMb3XinLGtBpDF3A1xHX17NKOih0FP6KqMV0Ww6MZv9DbYyvpOleu61KY
 GZDwCPcqACy8m8r4S1QtgoinPG9LbzRTNgc8hg89xDgcpYn+ssewx1GsgSjjDq2c0AyP
 /DYPM5D0G2wF4QIOdDroL8NePE7fTU1Zri1kA3yzFrEZyYXM29t+7AGbWqypf/PjpaC5
 yfs/HVQRlG7K5ub2N2yTGhd4hVlEckH/sgHy30XrdSOCvGXHZb42FwgeB0jpSCnmiWQn
 zd7soShIUuSnKACWsPN0eaAYgAWLAP69H3PqzKZFL89lKuqB/BmP0R5l0CKn1rJc81ST
 N3+w==
X-Gm-Message-State: AOJu0YxIVf6w5gORO1eCGC5RBj5E2Lyi86eHJEgpfs5o2SyYB/oy5Q5L
 ++d2xEhgMmlSj8QC+scQZu2kZ2I0jk3VYmLTIiGN/haO3O/G6r316iSAV4TmCgy0WCSOTQ==
X-Gm-Gg: Acq92OGSU0aDXE88Wz8EJCYGzAXK7Y/XsKNLRpD2QoxXIpB/ctGBjQuGL/6iM4Qs6EB
 99YNZBlhzpP+nKZqG1mmch4nMrvByWcIqVMerHdWsSxnr8FiLVkAf8OetmIDcfSmDV9VcoE+2Io
 gAwQqZ02VrnvPxzY/Z4hSxVQOTBiJkYk/soe7KLfKbr0xHhJOZYECZKE8Qld4sTSz4zVlB4Q0jA
 Xhhl/vK8CZvcozcw7Hm7NR0vnhggoVJM8+Cj++KDU0FNgEPl1kPf+oek7gkcLax7p9P1P2e1AnU
 elwj6WzimzlQyip7WCAoebc64rHIYSMZXrtSOkr2G5AlaA49GxLnhnzC2JrADfkzp5oAg2oIIlD
 OhkIPbxieLujRuGBWq4yFXhwt8+rKK5G1meU/eHkvewwoLxyVLW3OXA2XpElVEdMwd3/UAXeyP6
 Vqzxveg+ftCnNrsRRTInKn8uni9iQk5Vw62YjEOYN19fj0d+yarD+gEuOU+wgau18OBJifwRibd
 tDhng==
X-Received: by 2002:a05:6a00:2e10:b0:842:2cda:7aa3 with SMTP id
 d2e1a72fcca58-845154f4f82mr2432040b3a.28.1781592550190; 
 Mon, 15 Jun 2026 23:49:10 -0700 (PDT)
Received: from localhost ([111.228.63.84]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8434ac9cfebsm11017535b3a.9.2026.06.15.23.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 23:49:09 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 16 Jun 2026 14:49:04 +0800
Message-Id: <20260616064904.3616123-1-rollkingzzc@gmail.com>
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
 GC_MERGE foreground waiters, frees sbi->gc_thread,
 and then clears the published
 pointer. A foreground f2fs_balance_fs() caller can already ha [...] 
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [rollkingzzc(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wZNbs-00033e-HX
Subject: [f2fs-dev] [PATCH v5] f2fs: protect published gc_thread during
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
Cc: 2045gemini@gmail.com, zerocling0077@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:2045gemini@gmail.com,m:zerocling0077@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	FROM_HAS_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:url,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57AF168CA50

f2fs_stop_gc_thread() stops the background GC task, wakes GC_MERGE
foreground waiters, frees sbi->gc_thread, and then clears the published
pointer. A foreground f2fs_balance_fs() caller can already have copied
that pointer and queued itself on gc_th->fggc_wq, so freeing gc_th at
stop time can leave finish_wait() operating on a freed waitqueue.

The buggy scenario involves two paths, with each column showing the
order within that path:

foreground f2fs_balance_fs() caller:   shutdown path:
  1. observes no checkpoint error        1. sets CP_ERROR_FLAG
  2. snapshots sbi->gc_thread           2. enters f2fs_stop_gc_thread()
  3. queues on gc_th->fggc_wq           3. stops gc_th->f2fs_gc_task
  4. wakes gc_wait_queue_head           4. wakes gc_th->fggc_wq
  5. sleeps for foreground GC           5. frees gc_th
  6. finish_wait() touches fggc_wq

GC_MERGE does not keep independent work_struct items that shutdown can
cancel. Its pending foreground GC requests are waitqueue waiters. Drain
them by withdrawing the GC task pointer, stopping the task, waking
gc_th->fggc_wq, and leaving each waiter to remove its own wait entry
with finish_wait().

Keep the allocated GC-thread state until the superblock is destroyed and
use gc_th->f2fs_gc_task as the running-state marker. The stop path now
withdraws the task pointer under gc_task_lock, stops the task, and wakes
foreground waiters, but leaves the waitqueue storage valid. The start
path reuses a stopped gc_thread object instead of reinitializing its
waitqueues, and remount restart decisions check the task pointer rather
than only the object pointer.

f2fs_balance_fs() also snapshots sbi->gc_thread once and rechecks both
f2fs_cp_error() and f2fs_gc_task after prepare_to_wait(). If shutdown is
visible or the GC task has already been withdrawn, the caller removes its
wait entry without waking the GC thread or sleeping for new foreground GC
work. Thus shutdown drains already queued waiters and stops accepting
new foreground GC work once shutdown is visible to the caller.

Task pointer users are protected separately from the retained container
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
v5:
Explain that GC_MERGE foreground requests are waitqueue waiters, not
independent work items; shutdown drains them by withdrawing the GC task,
waking fggc_wq, and letting waiters dequeue themselves.
Recheck checkpoint error and the GC task pointer after prepare_to_wait() so
shutdown-visible f2fs_balance_fs() callers do not wake or sleep for new
foreground GC work.

v4:
Replace the v3 SRCU/refcounted lifetime model with a smaller fix that
keeps the existing heap-allocated gc_thread object alive until
superblock teardown.
Use f2fs_gc_task as the running-state marker and withdraw it with
xchg() before waking GC_MERGE waiters.
Reuse a stopped gc_thread object across remount restarts so the
waitqueues are not reinitialized while old waiters can still finish.
Recheck f2fs_gc_task after prepare_to_wait() so a waiter that races
with teardown does not sleep after the worker has been withdrawn.

v3:
Fix checkpatch style issues in the broader lifetime variant.

v2:
Sashiko.dev pointed out that GC_MERGE foreground waiters and
GC-thread users needed lifetime-safe access after teardown.

 fs/f2fs/gc.c      | 52 ++++++++++++++++++++++++++++++-----------------
 fs/f2fs/gc.h      | 38 ++++++++++++++++++++++++++++++++++
 fs/f2fs/segment.c | 19 ++++++++++-------
 fs/f2fs/super.c   |  7 +++++--
 fs/f2fs/sysfs.c   | 18 +++++++++++-----
 5 files changed, 101 insertions(+), 33 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index ba93010924c0..190d60b3cfc5 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -193,12 +193,24 @@ static int gc_thread_func(void *data)
 
 int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 {
-	struct f2fs_gc_kthread *gc_th;
+	struct f2fs_gc_kthread *gc_th = READ_ONCE(sbi->gc_thread);
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
+		gc_th->f2fs_gc_task = NULL;
+		spin_lock_init(&gc_th->gc_task_lock);
+		init_waitqueue_head(&gc_th->gc_wait_queue_head);
+		init_waitqueue_head(&gc_th->fggc_wq);
+		allocated = true;
+	}
 
 	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
 	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
@@ -221,34 +233,36 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 
 	gc_th->gc_wake = false;
 
-	sbi->gc_thread = gc_th;
-	init_waitqueue_head(&sbi->gc_thread->gc_wait_queue_head);
-	init_waitqueue_head(&sbi->gc_thread->fggc_wq);
-	sbi->gc_thread->f2fs_gc_task = kthread_run(gc_thread_func, sbi,
-			"f2fs_gc-%u:%u", MAJOR(dev), MINOR(dev));
-	if (IS_ERR(gc_th->f2fs_gc_task)) {
-		int err = PTR_ERR(gc_th->f2fs_gc_task);
+	task = kthread_create(gc_thread_func, sbi, "f2fs_gc-%u:%u",
+			      MAJOR(dev), MINOR(dev));
+	if (IS_ERR(task)) {
+		int err = PTR_ERR(task);
 
-		kfree(gc_th);
-		sbi->gc_thread = NULL;
+		if (allocated)
+			kfree(gc_th);
 		return err;
 	}
 
-	set_user_nice(gc_th->f2fs_gc_task,
-			PRIO_TO_NICE(sbi->critical_task_priority));
+	set_user_nice(task, PRIO_TO_NICE(sbi->critical_task_priority));
+	if (allocated)
+		WRITE_ONCE(sbi->gc_thread, gc_th);
+	f2fs_set_gc_task(gc_th, task);
+	wake_up_process(task);
 	return 0;
 }
 
 void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi)
 {
-	struct f2fs_gc_kthread *gc_th = sbi->gc_thread;
+	struct f2fs_gc_kthread *gc_th = READ_ONCE(sbi->gc_thread);
+	struct task_struct *task;
 
 	if (!gc_th)
 		return;
-	kthread_stop(gc_th->f2fs_gc_task);
+	task = f2fs_detach_gc_task(gc_th);
+	if (!task)
+		return;
+	kthread_stop(task);
 	wake_up_all(&gc_th->fggc_wq);
-	kfree(gc_th);
-	sbi->gc_thread = NULL;
 }
 
 static int select_gc_type(struct f2fs_sb_info *sbi, int gc_type)
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 6c4d4567571e..6df406e98939 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -5,6 +5,9 @@
  * Copyright (c) 2012 Samsung Electronics Co., Ltd.
  *             http://www.samsung.com/
  */
+#include <linux/sched/task.h>
+#include <linux/spinlock.h>
+
 #define GC_THREAD_MIN_WB_PAGES		1	/*
 						 * a threshold to determine
 						 * whether IO subsystem is idle
@@ -47,6 +50,7 @@
 
 struct f2fs_gc_kthread {
 	struct task_struct *f2fs_gc_task;
+	spinlock_t gc_task_lock;		/* protects f2fs_gc_task */
 	wait_queue_head_t gc_wait_queue_head;
 
 	/* for gc sleep time */
@@ -72,6 +76,40 @@ struct f2fs_gc_kthread {
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
 struct gc_inode_list {
 	struct list_head ilist;
 	struct radix_tree_root iroot;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 788f8b050249..5f61627009a5 100644
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
+	gc_th = READ_ONCE(sbi->gc_thread);
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
+		if (!f2fs_cp_error(sbi) && READ_ONCE(gc_th->f2fs_gc_task)) {
+			wake_up(&gc_th->gc_wait_queue_head);
+			io_schedule();
+		}
+		finish_wait(&gc_th->fggc_wq, &wait);
 	} else {
 		struct f2fs_gc_control gc_control = {
 			.victim_segno = NULL_SEGNO,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ccf806b676f5..d6863da05a7c 100644
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
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 352e96ad5c3a..07543df2b5b1 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -12,6 +12,7 @@
 #include <linux/seq_file.h>
 #include <linux/unicode.h>
 #include <linux/ioprio.h>
+#include <linux/sched/task.h>
 #include <linux/sysfs.h>
 
 #include "f2fs.h"
@@ -981,17 +982,24 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	}
 
 	if (!strcmp(a->attr.name, "critical_task_priority")) {
+		struct f2fs_gc_kthread *gc_th;
+		struct task_struct *gc_task;
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
-		if (sbi->gc_thread && sbi->gc_thread->f2fs_gc_task)
-			set_user_nice(sbi->gc_thread->f2fs_gc_task,
-					PRIO_TO_NICE(sbi->critical_task_priority));
+			set_user_nice(sbi->cprc_info.f2fs_issue_ckpt, nice);
+		gc_th = READ_ONCE(sbi->gc_thread);
+		gc_task = gc_th ? f2fs_get_gc_task(gc_th) : NULL;
+		if (gc_task) {
+			set_user_nice(gc_task, nice);
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
