Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GR2LiLnF2rBUwgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 08:56:34 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F23D5ED6EC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 08:56:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QIjOStDhOCMAACo/FsCVDHmFzAOpbgmiiXrukM0uNkQ=; b=m/ddef6dkqnjn6yID6o2xNHU+L
	3aTeaJPl1G+C3xpfhgJCVA8swhdRTa9Z3MUD8LpCQ/m/AFVzWQkiNnHsIbUnoCPEzsS6g/gnJAbD8
	gxZwM46IDTWtaOdNlAlbdlqMf21uoQJZp8jS+7ltk2wkPE+6H2cS3WMDxACBYMW740OA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSUf9-00075I-Tu;
	Thu, 28 May 2026 06:56:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rollkingzzc@gmail.com>) id 1wSUf9-000758-96
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 06:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hv5bxsNiGg323Ed+whtFPX08umiutM48iIq29EIeM28=; b=J+8a8Ek4BLKMxFdh9cr9hpb+un
 b6c29sIb/HracVXW1uFAXHQyMzPieNHq9xKBgvvOg2StNixZAaT9Qh/ijsZhWrX2fkSXeOWuqbrSt
 Swe0ABq2iZNsh1xdJAKZU/3Y0pZuHxGXi3TICuOyGOyRxKxcXYn+XL6qfPK6eC6Ji4ig=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hv5bxsNiGg323Ed+whtFPX08umiutM48iIq29EIeM28=; b=T
 LxKId31+66VBDGTQk+fxER3l3gVaY3Y2NxREobePWKq9eDSg/jqhG5DUErPsj64hxGQ5vIDiCKm2l
 u55jXj35ogCIrqcYc88N7bwlXuH382zB4iBr9XjeX4ac3EVODJISRk/uby68Lf75usvTNILddrEcy
 N3hEg7qlX5KdAbJ8=;
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wSUf8-0000Hw-05 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 06:56:15 +0000
Received: by mail-pg1-f195.google.com with SMTP id
 41be03b00d2f7-c8025500cc7so9051617a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 May 2026 23:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779951369; x=1780556169; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hv5bxsNiGg323Ed+whtFPX08umiutM48iIq29EIeM28=;
 b=QSONevQt57bol8SAeCkBvd48MYGSGoUk6YtseMFTbjCRT76yOMmY3Sqjuxwfm/zf6U
 5KCzmox+bO+Km+fjOdrX9usxyNxt2e2eUq4sFnmY4urJuQ/KtBbmIo4pTUpRFn2HX0od
 JBZi5WTrNy3Cp3JMiYMEYl0OyiDkqfbcCeSB72B/6goWd0s3XylRaRfQdKzBT5cb0kts
 861d03eJ/q182i2CoL2Kdjo6zwGz4yPidVvIcB7hkW2flp9mvZwzqqj/SvWYIhglDuAP
 OTSqqh/gyRWdI44eVC/fVKWL6pvbgfAJ6t9Wv9+j/pxecc8viqJ/uTMdT2c5s0/0u4wb
 v9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779951369; x=1780556169;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hv5bxsNiGg323Ed+whtFPX08umiutM48iIq29EIeM28=;
 b=ZDyhxidp/oc4vY62DQjSkCSGvqV7LluhYjLgZcacrdYuf9bsXuX5hOMVhtfarJ5l3r
 Ux/fH7ybxyvxcsMXLkp+MryyQNLyDcr1RQDHJrlXJTqERxgjN0PZT5MIWW0+y+hlZMRA
 GNJOLfG9QDRDN+9PvNN1pVpVUuLAMZqwLcOZLa9pV8ZTg/Hc+hvOI25CwNBhr/J+YJvJ
 kQVsAqLokF9WCYXtvbY5jl1z4b0CANBtVjVLHpE8CHvkrnbnAXV1GRNMidKIKxwbe08n
 0KkEkHpHuUADPMQGzzAd2JlXoj1Huewq/HmDyfT33avq6Ypys/wPMZH2UxvI/GXsRMmU
 hMkA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9LfPBIUy5sSdUtA7pn+UJmrIYwIdU7QMAyEqSRmPvkwULm2jMi5jAuTrByOW7M4OvfIFVblsh02cXE6T8zqDLm@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxJqbsMYYOFX37dElCDXL+Vv8l5I2TcMdWY8/urIw3zchn4GAGM
 4nQXSSXHMkhFH0Ab9sutTXCQQsOwabwT4cZADlLONs1eWPShVJ+4bAIk
X-Gm-Gg: Acq92OENw7VzNY4IYjEhPk8U7zAM+WP2o8z9pQwSksergLbjzUc7v3iEe7pWgq/TXem
 t3ejxAaiiQwAVel1KnisH6YI2MLAMF1eCeDdmNQEm2UYWJu4iHcIw4Gzl52YvGQ3FZU+QcZMOzx
 waeNzUv22LaUyPXDrdNu5Bcq9492D1LBr/Dz736xS7q6CDspGuXOewZlJBy/4+TbY7Ub2agd4Q1
 6iDat2FHMT8tRNwTzHK6xf5Ca8S5rnTwd6SLoyLJNVfm7WuBbCkOtxoB0jK5ZldiB8s6Zmy/jz0
 JKelDLrotNzQbrd9L+WvStIsDki4tdWC08oQiDE6TSn7s6mfl2vyqLKOgXgHbvFwuz9Zg3pAjTv
 3YMefuByEX2k2jVY5UfAjD14FAQf962wkPSqU3mbwTXOLrSQqtT7w7mJXP6aswnOTaUVU3Chvzf
 2NqVoEwNhcqUkJl7DGV/NcF0+N/t9m9aNiamIKQBpQKwkgPfqPxkah
X-Received: by 2002:a05:6a21:9f07:b0:3a2:f2b1:1ac with SMTP id
 adf61e73a8af0-3b328ec89dcmr28275315637.44.1779951368533; 
 Wed, 27 May 2026 23:56:08 -0700 (PDT)
Received: from localhost ([111.228.63.84]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c852054d845sm13811680a12.18.2026.05.27.23.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 23:56:08 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 28 May 2026 14:56:01 +0800
Message-Id: <20260528065601.3257303-1-rollkingzzc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs stores the background GC worker in a heap-allocated
 sbi->gc_thread.
 Foreground GC merge waiters, GC-thread sysfs callbacks, and victim- selection
 readers can still touch waitqueues, policy knobs, [...] 
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 1.0 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [rollkingzzc(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.195 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wSUf8-0000Hw-05
Subject: [f2fs-dev] [PATCH v3] f2fs: protect published gc_thread during
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url]
X-Rspamd-Queue-Id: 9F23D5ED6EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

f2fs stores the background GC worker in a heap-allocated sbi->gc_thread.
Foreground GC merge waiters, GC-thread sysfs callbacks, and victim-
selection readers can still touch waitqueues, policy knobs, or
f2fs_gc_task through that published object, but the dead-device shutdown
path can reach f2fs_stop_gc_thread() under shared s_umount coverage and
free it.

The buggy scenario involves two paths, with each column showing the order
within that path:

f2fs_balance_fs() reader:          dead-device shutdown:
1. sees low free space and         1. enters f2fs_shutdown()
   enters GC_MERGE                 2. calls f2fs_do_shutdown(..., false)
2. borrows sbi->gc_thread          3. calls f2fs_stop_gc_thread()
3. queues on gc_th->fggc_wq        4. stops gc_th->f2fs_gc_task
4. wakes gc_th->gc_wait_queue_head 5. frees gc_th
5. sleeps in io_schedule()         6. clears sbi->gc_thread
6. resumes in finish_wait()

Fix this by making gc_thread a properly published object. Initialize it
fully before publishing it, remove it from sbi->gc_thread with xchg()
before teardown, keep f2fs_gc_task alive until an SRCU grace period has
drained the borrowed readers, and route the waitqueue, scalar, and sysfs
users through shared get/put helpers. Recheck f2fs_gc_task after
prepare_to_wait() in f2fs_balance_fs() so teardown cannot miss an
already-queued foreground waiter.

Validation reproduced this kernel report:
KASAN slab-use-after-free in _raw_spin_lock_irqsave()
Read of size 1
Call trace:
  dump_stack_lvl() (?:?)
  print_address_description() (mm/kasan/report.c:373)
  _raw_spin_lock_irqsave() (?:?)
  print_report() (?:?)
  __virt_addr_valid() (?:?)
  srso_alias_return_thunk() (arch/x86/include/asm/nospec-branch.h:375)
  kasan_addr_to_slab() (mm/kasan/common.c:45)
  kasan_report() (?:?)
  __kasan_check_byte() (mm/kasan/common.c:571)
  lock_acquire() (?:?)
  rcu_is_watching() (?:?)
  prepare_to_wait() (kernel/sched/wait.c:248)
  f2fs_balance_fs() (fs/f2fs/segment.c:448)
  f2fs_write_single_data_page() (fs/f2fs/f2fs.h:4184)
  do_raw_spin_lock() (?:?)
  find_held_lock() (kernel/locking/lockdep.c:5340)
  folio_mkclean() (?:?)
  f2fs_write_cache_pages() (fs/f2fs/data.c:3238)
  __lock_acquire() (kernel/locking/lockdep.c:5077)
  unwind_next_frame() (?:?)
  arch_stack_walk() (?:?)
  __f2fs_write_data_pages() (fs/f2fs/data.c:3565)
  validate_chain() (kernel/locking/lockdep.c:3861)
  insert_work() (kernel/workqueue.c:2220)
  do_writepages() (mm/page-writeback.c:2560)
  filemap_writeback() (mm/filemap.c:371)
  __queue_work() (kernel/workqueue.c:2275)
  file_write_and_wait_range() (?:?)
  f2fs_do_sync_file() (fs/f2fs/file.c:285)
  __lock_release() (kernel/locking/lockdep.c:5511)
  f2fs_sync_file() (fs/f2fs/f2fs.h:3781)
  do_fsync() (fs/sync.c:204)
  __x64_sys_fsync() (?:?)
  do_syscall_64() (arch/x86/entry/syscall_64.c:87)
  entry_SYSCALL_64_after_hwframe() (?:?)
  kasan_save_stack() (mm/kasan/common.c:52)
  kasan_save_track() (mm/kasan/common.c:74)
  __kasan_kmalloc() (?:?)
  f2fs_start_gc_thread() (fs/f2fs/f2fs.h:4203)
  f2fs_fill_super() (fs/f2fs/super.c:4993)

Fixes: 5911d2d1d1a3 ("f2fs: introduce gc_merge mount option")
Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
---
v3:
- Add the Fixes tag for the GC_MERGE foreground wait path.
- Add comments for the gc_thread release/acquire publication pair.
- Fix checkpatch alignment issues and avoid misleading indentation in
  the critical_task_priority sysfs update path.

v2:
- Sashiko.dev pointed out that sysfs critical_task_priority could use
  a stale f2fs_gc_task.
- Sashiko.dev pointed out that GC_MERGE foreground waiters could miss
  teardown wakeups.
- Sashiko.dev pointed out that holding gc_thread_lock across
  kthread_run() could deadlock with reclaim.
- Sashiko.dev pointed out that gc_urgent and gc_idle still touched GC
  state without safe lifetime protection.
- Reset gc_thread_srcu_inited per f2fs_fill_super() attempt so cleanup
  only covers the current SRCU state.

 fs/f2fs/f2fs.h    |  30 +++++++++-
 fs/f2fs/gc.c      |  78 ++++++++++++++++--------
 fs/f2fs/gc.h      |   8 ++-
 fs/f2fs/segment.c |  34 +++++++----
 fs/f2fs/super.c   |  11 ++++
 fs/f2fs/sysfs.c   | 148 ++++++++++++++++++++++++++++++++++------------
 6 files changed, 233 insertions(+), 76 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 91f506e7c9cfb..719c94119b71c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -25,6 +25,7 @@
 #include <linux/quotaops.h>
 #include <linux/part_stat.h>
 #include <linux/rw_hint.h>
+#include <linux/srcu.h>
 
 #include <linux/fscrypt.h>
 #include <linux/fsverity.h>
@@ -156,6 +157,8 @@ typedef u32 block_t;	/*
 			 */
 typedef u32 nid_t;
 
+struct f2fs_gc_kthread;
+
 #define COMPRESS_EXT_NUM		16
 
 enum blkzone_allocation_policy {
@@ -1873,7 +1876,8 @@ struct f2fs_sb_info {
 						 * semaphore for GC, avoid
 						 * race between GC and GC or CP
 						 */
-	struct f2fs_gc_kthread	*gc_thread;	/* GC thread */
+	struct f2fs_gc_kthread	*gc_thread;	/* published GC thread */
+	struct srcu_struct gc_thread_srcu;	/* protects gc_thread readers */
 	struct atgc_management am;		/* atgc management */
 	unsigned int cur_victim_sec;		/* current victim section num */
 	unsigned int gc_mode;			/* current GC state */
@@ -4200,6 +4204,30 @@ extern const struct iomap_ops f2fs_iomap_ops;
 /*
  * gc.c
  */
+static inline struct f2fs_gc_kthread *
+f2fs_get_gc_thread(struct f2fs_sb_info *sbi, int *srcu_idx)
+{
+	struct f2fs_gc_kthread *gc_th;
+
+	*srcu_idx = srcu_read_lock(&sbi->gc_thread_srcu);
+	/*
+	 * Pairs with the release store in f2fs_start_gc_thread() so readers
+	 * see a fully initialized worker after observing sbi->gc_thread.
+	 */
+	gc_th = smp_load_acquire(&sbi->gc_thread);
+	if (!gc_th) {
+		srcu_read_unlock(&sbi->gc_thread_srcu, *srcu_idx);
+		*srcu_idx = -1;
+	}
+
+	return gc_th;
+}
+
+static inline void f2fs_put_gc_thread(struct f2fs_sb_info *sbi, int srcu_idx)
+{
+	srcu_read_unlock(&sbi->gc_thread_srcu, srcu_idx);
+}
+
 int f2fs_start_gc_thread(struct f2fs_sb_info *sbi);
 void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi);
 block_t f2fs_start_bidx_of_node(unsigned int node_ofs, struct inode *inode);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index ba93010924c06..c38dc5e4f66de 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -30,10 +30,10 @@ static unsigned int count_bits(const unsigned long *addr,
 
 static int gc_thread_func(void *data)
 {
-	struct f2fs_sb_info *sbi = data;
-	struct f2fs_gc_kthread *gc_th = sbi->gc_thread;
-	wait_queue_head_t *wq = &sbi->gc_thread->gc_wait_queue_head;
-	wait_queue_head_t *fggc_wq = &sbi->gc_thread->fggc_wq;
+	struct f2fs_gc_kthread *gc_th = data;
+	struct f2fs_sb_info *sbi = gc_th->sbi;
+	wait_queue_head_t *wq = &gc_th->gc_wait_queue_head;
+	wait_queue_head_t *fggc_wq = &gc_th->fggc_wq;
 	unsigned int wait_ms;
 	struct f2fs_gc_control gc_control = {
 		.victim_segno = NULL_SEGNO,
@@ -134,7 +134,7 @@ static int gc_thread_func(void *data)
 				wait_ms = gc_th->max_sleep_time;
 		}
 
-		if (need_to_boost_gc(sbi)) {
+		if (need_to_boost_gc(sbi, gc_th)) {
 			decrease_sleep_time(gc_th, &wait_ms);
 			if (f2fs_sb_has_blkzoned(sbi))
 				gc_boost = true;
@@ -194,6 +194,7 @@ static int gc_thread_func(void *data)
 int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_gc_kthread *gc_th;
+	struct task_struct *task;
 	dev_t dev = sbi->sb->s_bdev->bd_dev;
 
 	gc_th = f2fs_kmalloc(sbi, sizeof(struct f2fs_gc_kthread), GFP_KERNEL);
@@ -219,36 +220,45 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 		gc_th->boost_zoned_gc_percent = 0;
 	}
 
+	gc_th->sbi = sbi;
 	gc_th->gc_wake = false;
+	init_waitqueue_head(&gc_th->gc_wait_queue_head);
+	init_waitqueue_head(&gc_th->fggc_wq);
 
-	sbi->gc_thread = gc_th;
-	init_waitqueue_head(&sbi->gc_thread->gc_wait_queue_head);
-	init_waitqueue_head(&sbi->gc_thread->fggc_wq);
-	sbi->gc_thread->f2fs_gc_task = kthread_run(gc_thread_func, sbi,
-			"f2fs_gc-%u:%u", MAJOR(dev), MINOR(dev));
-	if (IS_ERR(gc_th->f2fs_gc_task)) {
-		int err = PTR_ERR(gc_th->f2fs_gc_task);
+	task = kthread_run(gc_thread_func, gc_th, "f2fs_gc-%u:%u",
+			   MAJOR(dev), MINOR(dev));
+	if (IS_ERR(task)) {
+		int err = PTR_ERR(task);
 
 		kfree(gc_th);
-		sbi->gc_thread = NULL;
 		return err;
 	}
 
-	set_user_nice(gc_th->f2fs_gc_task,
-			PRIO_TO_NICE(sbi->critical_task_priority));
+	get_task_struct(task);
+	WRITE_ONCE(gc_th->f2fs_gc_task, task);
+	set_user_nice(task, PRIO_TO_NICE(sbi->critical_task_priority));
+	/* Publish only after gc_th and its task pointer are fully initialized. */
+	smp_store_release(&sbi->gc_thread, gc_th);
 	return 0;
 }
 
 void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi)
 {
-	struct f2fs_gc_kthread *gc_th = sbi->gc_thread;
+	struct f2fs_gc_kthread *gc_th;
+	struct task_struct *task;
 
+	gc_th = xchg(&sbi->gc_thread, NULL);
 	if (!gc_th)
 		return;
-	kthread_stop(gc_th->f2fs_gc_task);
+
+	task = xchg(&gc_th->f2fs_gc_task, NULL);
+	if (task)
+		kthread_stop(task);
 	wake_up_all(&gc_th->fggc_wq);
+	synchronize_srcu(&sbi->gc_thread_srcu);
+	if (task)
+		put_task_struct(task);
 	kfree(gc_th);
-	sbi->gc_thread = NULL;
 }
 
 static int select_gc_type(struct f2fs_sb_info *sbi, int gc_type)
@@ -795,8 +805,16 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 	p.age_threshold = sbi->am.age_threshold;
 	if (one_time) {
 		p.one_time_gc = one_time;
-		if (has_enough_free_secs(sbi, 0, NR_PERSISTENT_LOG))
-			valid_thresh_ratio = sbi->gc_thread->valid_thresh_ratio;
+		if (has_enough_free_secs(sbi, 0, NR_PERSISTENT_LOG)) {
+			struct f2fs_gc_kthread *gc_th;
+			int srcu_idx;
+
+			gc_th = f2fs_get_gc_thread(sbi, &srcu_idx);
+			if (gc_th) {
+				valid_thresh_ratio = gc_th->valid_thresh_ratio;
+				f2fs_put_gc_thread(sbi, srcu_idx);
+			}
+		}
 	}
 
 retry:
@@ -1776,11 +1794,21 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 			unsigned int window_granularity =
 				sbi->migration_window_granularity;
 
-			if (f2fs_sb_has_blkzoned(sbi) &&
-					!has_enough_free_blocks(sbi,
-					sbi->gc_thread->boost_zoned_gc_percent))
-				window_granularity *=
-					sbi->gc_thread->boost_gc_multiple;
+			if (f2fs_sb_has_blkzoned(sbi)) {
+				struct f2fs_gc_kthread *gc_th;
+				int srcu_idx;
+
+				gc_th = f2fs_get_gc_thread(sbi, &srcu_idx);
+				if (gc_th) {
+					unsigned int boost_percent =
+						gc_th->boost_zoned_gc_percent;
+
+					if (!has_enough_free_blocks(sbi, boost_percent))
+						window_granularity *=
+							gc_th->boost_gc_multiple;
+					f2fs_put_gc_thread(sbi, srcu_idx);
+				}
+			}
 
 			end_segno = start_segno + window_granularity;
 		}
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 6c4d4567571eb..b32d57a70f760 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -45,7 +45,10 @@
 
 #define NR_GC_CHECKPOINT_SECS (3)	/* data/node/dentry sections */
 
+struct f2fs_sb_info;
+
 struct f2fs_gc_kthread {
+	struct f2fs_sb_info *sbi;
 	struct task_struct *f2fs_gc_task;
 	wait_queue_head_t gc_wait_queue_head;
 
@@ -193,10 +196,11 @@ static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
 			limit_free_user_blocks(invalid_user_blocks));
 }
 
-static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
+static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi,
+				    struct f2fs_gc_kthread *gc_th)
 {
 	if (f2fs_sb_has_blkzoned(sbi))
 		return !has_enough_free_blocks(sbi,
-				sbi->gc_thread->boost_zoned_gc_percent);
+				gc_th->boost_zoned_gc_percent);
 	return has_enough_invalid_blocks(sbi);
 }
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 788f8b0502492..cd8d5084c3f31 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -444,16 +444,30 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 	if (has_enough_free_secs(sbi, 0, 0))
 		return;
 
-	if (test_opt(sbi, GC_MERGE) && sbi->gc_thread &&
-				sbi->gc_thread->f2fs_gc_task) {
-		DEFINE_WAIT(wait);
-
-		prepare_to_wait(&sbi->gc_thread->fggc_wq, &wait,
-					TASK_UNINTERRUPTIBLE);
-		wake_up(&sbi->gc_thread->gc_wait_queue_head);
-		io_schedule();
-		finish_wait(&sbi->gc_thread->fggc_wq, &wait);
-	} else {
+	if (test_opt(sbi, GC_MERGE)) {
+		struct f2fs_gc_kthread *gc_th;
+		int srcu_idx;
+
+		gc_th = f2fs_get_gc_thread(sbi, &srcu_idx);
+		if (gc_th) {
+			if (READ_ONCE(gc_th->f2fs_gc_task)) {
+				DEFINE_WAIT(wait);
+
+				prepare_to_wait(&gc_th->fggc_wq, &wait,
+						TASK_UNINTERRUPTIBLE);
+				if (READ_ONCE(gc_th->f2fs_gc_task)) {
+					wake_up(&gc_th->gc_wait_queue_head);
+					io_schedule();
+				}
+				finish_wait(&gc_th->fggc_wq, &wait);
+				f2fs_put_gc_thread(sbi, srcu_idx);
+				return;
+			}
+			f2fs_put_gc_thread(sbi, srcu_idx);
+		}
+	}
+
+	{
 		struct f2fs_gc_control gc_control = {
 			.victim_segno = NULL_SEGNO,
 			.init_gc_type = f2fs_sb_has_blkzoned(sbi) ?
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ccf806b676f53..a1c3784656fb2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4954,11 +4954,13 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	int recovery, i, valid_super_block;
 	struct curseg_info *seg_i;
 	int retry_cnt = 1;
+	bool gc_thread_srcu_inited = false;
 #ifdef CONFIG_QUOTA
 	bool quota_enabled = false;
 #endif
 
 try_onemore:
+	gc_thread_srcu_inited = false;
 	err = -EINVAL;
 	raw_super = NULL;
 	valid_super_block = -1;
@@ -4993,6 +4995,10 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 		spin_lock_init(&sbi->inode_lock[i]);
 	}
 	mutex_init(&sbi->flush_lock);
+	err = init_srcu_struct(&sbi->gc_thread_srcu);
+	if (err)
+		goto free_sbi;
+	gc_thread_srcu_inited = true;
 
 	/* set a block size */
 	if (unlikely(!sb_set_blocksize(sb, F2FS_BLKSIZE))) {
@@ -5454,6 +5460,10 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 	lockdep_unregister_key(&sbi->cp_global_sem_key);
 #endif
+	if (gc_thread_srcu_inited) {
+		cleanup_srcu_struct(&sbi->gc_thread_srcu);
+		gc_thread_srcu_inited = false;
+	}
 	kfree(sbi);
 	sb->s_fs_info = NULL;
 
@@ -5538,6 +5548,7 @@ static void kill_f2fs_super(struct super_block *sb)
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 		lockdep_unregister_key(&sbi->cp_global_sem_key);
 #endif
+		cleanup_srcu_struct(&sbi->gc_thread_srcu);
 		kfree(sbi);
 		sb->s_fs_info = NULL;
 	}
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 352e96ad5c3a5..14f0d3c179789 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -375,12 +375,10 @@ static ssize_t __sbi_show_value(struct f2fs_attr *a,
 	}
 }
 
-static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
-			struct f2fs_sb_info *sbi, char *buf)
+static ssize_t __f2fs_sbi_show(struct f2fs_attr *a,
+			       struct f2fs_sb_info *sbi, char *buf,
+			       unsigned char *ptr)
 {
-	unsigned char *ptr = NULL;
-
-	ptr = __struct_ptr(sbi, a->struct_type);
 	if (!ptr)
 		return -EINVAL;
 
@@ -464,6 +462,29 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 	return __sbi_show_value(a, sbi, buf, ptr + a->offset);
 }
 
+static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
+			     struct f2fs_sb_info *sbi, char *buf)
+{
+	return __f2fs_sbi_show(a, sbi, buf,
+			       __struct_ptr(sbi, a->struct_type));
+}
+
+static ssize_t f2fs_gc_thread_show(struct f2fs_attr *a,
+				   struct f2fs_sb_info *sbi, char *buf)
+{
+	struct f2fs_gc_kthread *gc_th;
+	int srcu_idx;
+	ssize_t ret;
+
+	gc_th = f2fs_get_gc_thread(sbi, &srcu_idx);
+	if (!gc_th)
+		return -EINVAL;
+
+	ret = __f2fs_sbi_show(a, sbi, buf, (unsigned char *)gc_th);
+	f2fs_put_gc_thread(sbi, srcu_idx);
+	return ret;
+}
+
 static void __sbi_store_value(struct f2fs_attr *a,
 			struct f2fs_sb_info *sbi,
 			unsigned char *ui, unsigned long value)
@@ -487,16 +508,47 @@ static void __sbi_store_value(struct f2fs_attr *a,
 	}
 }
 
-static ssize_t __sbi_store(struct f2fs_attr *a,
-			struct f2fs_sb_info *sbi,
-			const char *buf, size_t count)
+static bool f2fs_wake_gc_thread(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_gc_kthread *gc_th;
+	int srcu_idx;
+
+	gc_th = f2fs_get_gc_thread(sbi, &srcu_idx);
+	if (!gc_th)
+		return false;
+
+	gc_th->gc_wake = true;
+	wake_up_interruptible_all(&gc_th->gc_wait_queue_head);
+	f2fs_put_gc_thread(sbi, srcu_idx);
+	return true;
+}
+
+static void f2fs_set_gc_thread_nice(struct f2fs_sb_info *sbi, long priority)
+{
+	struct f2fs_gc_kthread *gc_th;
+	struct task_struct *gc_task;
+	int srcu_idx;
+
+	gc_th = f2fs_get_gc_thread(sbi, &srcu_idx);
+	if (!gc_th)
+		return;
+
+	gc_task = READ_ONCE(gc_th->f2fs_gc_task);
+	if (gc_task)
+		set_user_nice(gc_task, PRIO_TO_NICE(priority));
+
+	f2fs_put_gc_thread(sbi, srcu_idx);
+}
+
+static ssize_t __f2fs_sbi_store(struct f2fs_attr *a,
+				struct f2fs_sb_info *sbi,
+				unsigned char *ptr,
+				const char *buf, size_t count)
 {
-	unsigned char *ptr;
 	unsigned long t;
 	unsigned int *ui;
 	ssize_t ret;
 
-	ptr = __struct_ptr(sbi, a->struct_type);
 	if (!ptr)
 		return -EINVAL;
 
@@ -664,21 +716,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			sbi->gc_mode = GC_NORMAL;
 		} else if (t == 1) {
 			sbi->gc_mode = GC_URGENT_HIGH;
-			if (sbi->gc_thread) {
-				sbi->gc_thread->gc_wake = true;
-				wake_up_interruptible_all(
-					&sbi->gc_thread->gc_wait_queue_head);
+			if (f2fs_wake_gc_thread(sbi))
 				wake_up_discard_thread(sbi, true);
-			}
 		} else if (t == 2) {
 			sbi->gc_mode = GC_URGENT_LOW;
 		} else if (t == 3) {
 			sbi->gc_mode = GC_URGENT_MID;
-			if (sbi->gc_thread) {
-				sbi->gc_thread->gc_wake = true;
-				wake_up_interruptible_all(
-					&sbi->gc_thread->gc_wait_queue_head);
-			}
+			f2fs_wake_gc_thread(sbi);
 		} else {
 			return -EINVAL;
 		}
@@ -934,14 +978,14 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	if (!strcmp(a->attr.name, "gc_boost_gc_multiple")) {
 		if (t < 1 || t > SEGS_PER_SEC(sbi))
 			return -EINVAL;
-		sbi->gc_thread->boost_gc_multiple = (unsigned int)t;
+		*ui = (unsigned int)t;
 		return count;
 	}
 
 	if (!strcmp(a->attr.name, "gc_boost_gc_greedy")) {
 		if (t > GC_GREEDY)
 			return -EINVAL;
-		sbi->gc_thread->boost_gc_greedy = (unsigned int)t;
+		*ui = (unsigned int)t;
 		return count;
 	}
 
@@ -980,39 +1024,64 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
-	if (!strcmp(a->attr.name, "critical_task_priority")) {
-		if (t < NICE_TO_PRIO(MIN_NICE) || t > NICE_TO_PRIO(MAX_NICE))
-			return -EINVAL;
-		if (!capable(CAP_SYS_NICE))
-			return -EPERM;
-		sbi->critical_task_priority = t;
-		if (sbi->cprc_info.f2fs_issue_ckpt)
-			set_user_nice(sbi->cprc_info.f2fs_issue_ckpt,
-					PRIO_TO_NICE(sbi->critical_task_priority));
-		if (sbi->gc_thread && sbi->gc_thread->f2fs_gc_task)
-			set_user_nice(sbi->gc_thread->f2fs_gc_task,
-					PRIO_TO_NICE(sbi->critical_task_priority));
-		return count;
-	}
+		if (!strcmp(a->attr.name, "critical_task_priority")) {
+			int nice;
+
+			if (t < NICE_TO_PRIO(MIN_NICE) || t > NICE_TO_PRIO(MAX_NICE))
+				return -EINVAL;
+			if (!capable(CAP_SYS_NICE))
+				return -EPERM;
+			sbi->critical_task_priority = t;
+			nice = PRIO_TO_NICE(sbi->critical_task_priority);
+			if (sbi->cprc_info.f2fs_issue_ckpt)
+				set_user_nice(sbi->cprc_info.f2fs_issue_ckpt, nice);
+			f2fs_set_gc_thread_nice(sbi, sbi->critical_task_priority);
+			return count;
+		}
 
 	__sbi_store_value(a, sbi, ptr + a->offset, t);
 
 	return count;
 }
 
+static ssize_t f2fs_gc_thread_store(struct f2fs_attr *a,
+				    struct f2fs_sb_info *sbi,
+				    const char *buf, size_t count)
+{
+	struct f2fs_gc_kthread *gc_th;
+	int srcu_idx;
+	ssize_t ret;
+
+	if (!down_read_trylock(&sbi->sb->s_umount))
+		return -EAGAIN;
+
+	gc_th = f2fs_get_gc_thread(sbi, &srcu_idx);
+	if (!gc_th) {
+		up_read(&sbi->sb->s_umount);
+		return -EINVAL;
+	}
+
+	ret = __f2fs_sbi_store(a, sbi, (unsigned char *)gc_th, buf, count);
+	f2fs_put_gc_thread(sbi, srcu_idx);
+	up_read(&sbi->sb->s_umount);
+	return ret;
+}
+
 static ssize_t f2fs_sbi_store(struct f2fs_attr *a,
 			struct f2fs_sb_info *sbi,
 			const char *buf, size_t count)
 {
 	ssize_t ret;
 	bool gc_entry = (!strcmp(a->attr.name, "gc_urgent") ||
+				 !strcmp(a->attr.name, "gc_idle") ||
 					a->struct_type == GC_THREAD);
 
 	if (gc_entry) {
 		if (!down_read_trylock(&sbi->sb->s_umount))
 			return -EAGAIN;
 	}
-	ret = __sbi_store(a, sbi, buf, count);
+	ret = __f2fs_sbi_store(a, sbi,
+			       __struct_ptr(sbi, a->struct_type), buf, count);
 	if (gc_entry)
 		up_read(&sbi->sb->s_umount);
 
@@ -1173,7 +1242,10 @@ static struct f2fs_attr f2fs_attr_##name = __ATTR(name, 0444, name##_show, NULL)
 #endif
 
 #define GC_THREAD_RW_ATTR(name, elname)				\
-	F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, name, elname)
+	F2FS_ATTR_OFFSET(GC_THREAD, name, 0644,			\
+		f2fs_gc_thread_show, f2fs_gc_thread_store,	\
+		offsetof(struct f2fs_gc_kthread, elname),	\
+		sizeof_field(struct f2fs_gc_kthread, elname))
 
 #define SM_INFO_RW_ATTR(name, elname)				\
 	F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, name, elname)
-- 
2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
