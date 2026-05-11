Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDIXKVh/AWqkbQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2026 09:03:52 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E52508D13
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2026 09:03:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WZu6KyWWePqsftWUwPQvhM3mgjMW77+iMXnZmt20IYQ=; b=WXuVsugJr3D/EeMT+af2PFpgae
	i4A9yO55fT3jKlp7YdOUhiPKqzL21YWSrcx4yQ9qWMRM5BBblJvTcVVAqLhVKQgNQshMtxn+1V2Lr
	I633yY/KrEfAhkrO/yQ1IB3MzHNP0BJsvn0uAyRk1Cpbwg1gqymvU3tkjgbezjLybwG0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wMKft-0000rU-7C;
	Mon, 11 May 2026 07:03:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rollkingzzc@gmail.com>) id 1wMKfq-0000rB-U1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 May 2026 07:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mx7THAMtJCfxPLp6VeftQF1JX0O/kLwRFiuvcZ90m94=; b=mk0HfRw9EHLDTbqZXQTAJ10AEM
 OrKYpmMj66f6/JE+CdNAxSFgGPtEYQnXgs1pgDGGqUDVXhJy0Op9SbmsmdZNwv/gRHcgpqB7/mhKl
 7kYUQh3cH4+AzjGgUmSjkM01xbstb8F4Mjq1durcI6kT3xOLMFY7IIXaN6M3Jr5pJGYU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mx7THAMtJCfxPLp6VeftQF1JX0O/kLwRFiuvcZ90m94=; b=G
 y9c/00Yks4mztXPvh2ZNVPtEYjGxd7CfHBiuZnd/+YuIc9y8acRCmiFJlfHacSq9AWpWEVp/+Gh2b
 wM6yrWb3mH8S4EaiNDVAVyCDDn3Pq/smDGc3thFBUio5rxIIjPBimKMbvEkCQaBAU6UrXjhzUMKRb
 ob2cZYZA2eV8KUNA=;
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wMKfo-0004vB-VG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 May 2026 07:03:31 +0000
Received: by mail-pj1-f67.google.com with SMTP id
 98e67ed59e1d1-3660b84347dso2356599a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 May 2026 00:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778482998; x=1779087798; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mx7THAMtJCfxPLp6VeftQF1JX0O/kLwRFiuvcZ90m94=;
 b=EOtvMFXjp0B9kvAmBdOWoLXFMR8kD1MoPoc7g0AzIGvycYxDSqnhuGz31qjrhRvuJr
 bJEzjNRGNSzmbfANZAK4tlYMGKrU9ohx5JCGSQqFZ2tFwW3SpZqDvjqe+CYUytN3gevV
 IBGlyfEm367gb+UWH9OIHo0vPpnzbdT4nKUABX0QzV65YZWnmBzj0gzWjvVBEft5aMji
 tfP6IWV9YmBYRSS0LqaiHzfoUVPH1ITdFSKUbruFJCc9dlqTXDIzym1Gst0TYwCXQ/43
 DWp8UG1oWcWQme87lSgMGIs7gljjWvC24sBHMq92pU307JINV9Gv5hRVTgpFBT3im6Hc
 87qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778482998; x=1779087798;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mx7THAMtJCfxPLp6VeftQF1JX0O/kLwRFiuvcZ90m94=;
 b=AkFpe8TISBiYtf+u9k83+X1LQP7fuB4pbubzHHguC4n/82OeZhHGpPkggOmAIn/lk6
 Yr8chfjDpYskneWMeao/f9OVRoQ1kkgCc9uIBV4XL+pkYH2RyAdz+k91hhOVKoauhzn3
 DHgUX7eZaEyQz7GX0qGD/xThKWEUFrZeMGQzX7nvDPlahY7GthGxOIeTZaNzIa8BIy3x
 9gah4+SMIHr8fs3fLBhAbeReEm7Q9zFHFC2fanNwv16DoBDOOg9iX6I/KydvYYErDLdY
 8qNjYpD3HJ8EIE0hDovvx2NgetFJI5gWePFMqbJn7xn4rHKLxAvBlebGaVqRUFbo1At/
 mu0Q==
X-Gm-Message-State: AOJu0YxXONfviQKdVlKm1ums9e7CsAe8l92G3qUcYL/cqMSlP3VVc766
 doOIPsufXdnH+gYIHHoFvOmvpUpGqdZC7vcUg4GZOlCSzIcaUHCBMMk/
X-Gm-Gg: Acq92OHDdyv5VEaAFuZ3VlG2npBZoX4i+HskJ2SCzXEROCXGuXEEvxN/LXNHD6c0BxV
 Dd//y4hMZtYrDjvrkxUOFjVFVEdXfD1brtLA8zr8aQ4ckQoOa7lXsQN/aQx9eKrn+5aH+qST3Yq
 VVg6FRTPm/4FQ9ucVAY9jILZDq9nbDVZggbPCyuippkuDRmycXvoN21hnMJXhQJNHniFOLB93jz
 HFDfZM1kS+z19UcV4o/o2pjAdMCQFExR+RvBKrB2KkdgbfYKnz0q9ZjGb6HPVWC3upipXJrA1L4
 e1V9ppO5bAzoyYPyXStKrKNWF/frxH44wH6rw953Rsp7wWZ5qe8RGP4hrI4qq68A/HJPF/+aQ7u
 U9WyeTv8v1XVW9F/5YWH27yZDyiLzi2SR7+1Wn8gKrK3uONo5f0nVZWmtv8A3WrJLPpHI3m/Er8
 yTFGmgBdpKTTD7AC1qlpgVEYPgVoSTg3U=
X-Received: by 2002:a17:90a:d446:b0:366:159a:c17e with SMTP id
 98e67ed59e1d1-36615aa0724mr15236489a91.2.1778482997935; 
 Mon, 11 May 2026 00:03:17 -0700 (PDT)
Received: from localhost ([111.228.63.84]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1d3fee3sm86799245ad.18.2026.05.11.00.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 00:03:17 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 11 May 2026 15:02:47 +0800
Message-Id: <20260511070247.2097231-1-rollkingzzc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs publishes the GC worker object through sbi->gc_thread.
 Several paths use that published pointer after only checking that it is
 non-NULL:
 foreground GC merge waits on the worker waitqueues, sysfs [...] 
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [rollkingzzc(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.67 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wMKfo-0004vB-VG
Subject: [f2fs-dev] [PATCH] f2fs: protect gc_thread lifetime for published
 users
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
 Zhang Cen <rollkingzzc@gmail.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 58E52508D13
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:2045gemini@gmail.com,m:zerocling0077@gmail.com,m:linux-kernel@vger.kernel.org,m:rollkingzzc@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

f2fs publishes the GC worker object through sbi->gc_thread.  Several
paths use that published pointer after only checking that it is non-NULL:
foreground GC merge waits on the worker waitqueues, sysfs reads and
writes access GC worker tunables, and shutdown/remount/unmount paths stop
the worker through f2fs_stop_gc_thread().

Those users do not all share the same exclusion.  In particular, the
dead-device shutdown path reaches f2fs_shutdown() under shared s_umount
and then calls f2fs_do_shutdown(..., false), while ordinary filesystem
paths and sysfs callbacks can still have borrowed the published worker
pointer.  f2fs_stop_gc_thread() also used to free the worker before
clearing sbi->gc_thread, so a second stopper could observe the same
object.

The buggy scenarios are all variants of the same lifetime problem:

f2fs_balance_fs() reader:          dead-device shutdown:
  1. sees GC_MERGE                 1. enters f2fs_shutdown()
  2. reads sbi->gc_thread          2. calls f2fs_stop_gc_thread()
  3. waits on gc_th->fggc_wq       3. stops gc_th->f2fs_gc_task
  4. resumes in finish_wait()      4. frees gc_th

GC-thread sysfs callback:          dead-device shutdown:
  1. enters f2fs_attr_show()       1. enters f2fs_shutdown()
     or f2fs_sbi_store()
  2. reaches f2fs_sbi_show()       2. calls f2fs_stop_gc_thread()
     or __sbi_store()
  3. reads sbi->gc_thread          3. stops and frees gc_th
  4. dereferences gc_thread fields
     or updates a GC tunable

first stopper:                     second stopper:
  1. enters f2fs_stop_gc_thread()  1. enters f2fs_stop_gc_thread()
  2. reads sbi->gc_thread          2. reads the same sbi->gc_thread
  3. stops gc_th->f2fs_gc_task     3. resumes after the first free
  4. frees gc_th                   4. dereferences or frees gc_th again
  5. clears sbi->gc_thread

The same underlying lifetime gap was also reproduced through GC-thread
sysfs show/store paths and through competing f2fs_stop_gc_thread()
callers, so handle all published GC worker users with one lifetime rule
instead of sending narrower fixes for each symptom.

Add a small lifetime rule for the published GC worker.  Protect the
published pointer with a dedicated rwsem, let readers acquire a
refcounted reference before dereferencing it, clear the published pointer
before stopping the worker, and wait for all borrowed references before
freeing the object.  Route the waitqueue, scalar, and sysfs users that
dereference the GC worker through the same borrow/release helpers.

Sanitizer validation reported:
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
  f2fs_start_gc_thread() (fs/f2fs/gc.c:197)
  f2fs_fill_super() (fs/f2fs/super.c:4975)

Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>

---
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 91f506e7c9cf..c37d6ba7c2fe 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1873,6 +1873,7 @@ struct f2fs_sb_info {
 						 * semaphore for GC, avoid
 						 * race between GC and GC or CP
 						 */
+	struct f2fs_rwsem gc_thread_lock;	/* protects gc_thread pointer */
 	struct f2fs_gc_kthread	*gc_thread;	/* GC thread */
 	struct atgc_management am;		/* atgc management */
 	unsigned int cur_victim_sec;		/* current victim section num */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index ba93010924c0..c7f631dc385d 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -28,12 +28,36 @@ static struct kmem_cache *victim_entry_slab;
 static unsigned int count_bits(const unsigned long *addr,
 				unsigned int offset, unsigned int len);
 
+bool f2fs_get_gc_thread(struct f2fs_sb_info *sbi,
+				struct f2fs_gc_kthread **gc_thread)
+{
+	struct f2fs_gc_kthread *gc_th;
+
+	f2fs_down_read(&sbi->gc_thread_lock);
+	gc_th = sbi->gc_thread;
+	if (gc_th && refcount_inc_not_zero(&gc_th->refcnt)) {
+		*gc_thread = gc_th;
+		f2fs_up_read(&sbi->gc_thread_lock);
+		return true;
+	}
+	f2fs_up_read(&sbi->gc_thread_lock);
+
+	*gc_thread = NULL;
+	return false;
+}
+
+void f2fs_put_gc_thread(struct f2fs_gc_kthread *gc_th)
+{
+	if (refcount_dec_and_test(&gc_th->refcnt))
+		complete(&gc_th->refcnt_completion);
+}
+
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
@@ -134,7 +158,7 @@ static int gc_thread_func(void *data)
 				wait_ms = gc_th->max_sleep_time;
 		}
 
-		if (need_to_boost_gc(sbi)) {
+		if (need_to_boost_gc(sbi, gc_th)) {
 			decrease_sleep_time(gc_th, &wait_ms);
 			if (f2fs_sb_has_blkzoned(sbi))
 				gc_boost = true;
@@ -194,6 +218,7 @@ static int gc_thread_func(void *data)
 int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_gc_kthread *gc_th;
+	struct task_struct *task;
 	dev_t dev = sbi->sb->s_bdev->bd_dev;
 
 	gc_th = f2fs_kmalloc(sbi, sizeof(struct f2fs_gc_kthread), GFP_KERNEL);
@@ -219,36 +244,53 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 		gc_th->boost_zoned_gc_percent = 0;
 	}
 
+	refcount_set(&gc_th->refcnt, 1);
+	init_completion(&gc_th->refcnt_completion);
+	gc_th->sbi = sbi;
 	gc_th->gc_wake = false;
 
+	init_waitqueue_head(&gc_th->gc_wait_queue_head);
+	init_waitqueue_head(&gc_th->fggc_wq);
+
+	f2fs_down_write(&sbi->gc_thread_lock);
 	sbi->gc_thread = gc_th;
-	init_waitqueue_head(&sbi->gc_thread->gc_wait_queue_head);
-	init_waitqueue_head(&sbi->gc_thread->fggc_wq);
-	sbi->gc_thread->f2fs_gc_task = kthread_run(gc_thread_func, sbi,
+	task = kthread_run(gc_thread_func, gc_th,
 			"f2fs_gc-%u:%u", MAJOR(dev), MINOR(dev));
-	if (IS_ERR(gc_th->f2fs_gc_task)) {
-		int err = PTR_ERR(gc_th->f2fs_gc_task);
+	if (IS_ERR(task)) {
+		int err = PTR_ERR(task);
 
-		kfree(gc_th);
 		sbi->gc_thread = NULL;
+		f2fs_up_write(&sbi->gc_thread_lock);
+		kfree(gc_th);
 		return err;
 	}
+	gc_th->f2fs_gc_task = task;
+	f2fs_up_write(&sbi->gc_thread_lock);
 
-	set_user_nice(gc_th->f2fs_gc_task,
-			PRIO_TO_NICE(sbi->critical_task_priority));
+	set_user_nice(task, PRIO_TO_NICE(sbi->critical_task_priority));
 	return 0;
 }
 
 void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi)
 {
-	struct f2fs_gc_kthread *gc_th = sbi->gc_thread;
+	struct f2fs_gc_kthread *gc_th;
 
+	f2fs_down_write(&sbi->gc_thread_lock);
+	gc_th = sbi->gc_thread;
 	if (!gc_th)
-		return;
+		goto unlock;
+	sbi->gc_thread = NULL;
+	f2fs_up_write(&sbi->gc_thread_lock);
+
 	kthread_stop(gc_th->f2fs_gc_task);
 	wake_up_all(&gc_th->fggc_wq);
+	f2fs_put_gc_thread(gc_th);
+	wait_for_completion(&gc_th->refcnt_completion);
 	kfree(gc_th);
-	sbi->gc_thread = NULL;
+	return;
+
+unlock:
+	f2fs_up_write(&sbi->gc_thread_lock);
 }
 
 static int select_gc_type(struct f2fs_sb_info *sbi, int gc_type)
@@ -784,6 +826,7 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 	unsigned int last_segment;
 	unsigned int nsearched;
 	unsigned int valid_thresh_ratio = 100;
+	struct f2fs_gc_kthread *gc_th = NULL;
 	bool is_atgc;
 	int ret = 0;
 
@@ -795,8 +838,11 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 	p.age_threshold = sbi->am.age_threshold;
 	if (one_time) {
 		p.one_time_gc = one_time;
-		if (has_enough_free_secs(sbi, 0, NR_PERSISTENT_LOG))
-			valid_thresh_ratio = sbi->gc_thread->valid_thresh_ratio;
+		f2fs_get_gc_thread(sbi, &gc_th);
+		if (gc_th && has_enough_free_secs(sbi, 0, NR_PERSISTENT_LOG))
+			valid_thresh_ratio = gc_th->valid_thresh_ratio;
+		if (gc_th)
+			f2fs_put_gc_thread(gc_th);
 	}
 
 retry:
@@ -1757,8 +1803,21 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 	unsigned char type = IS_DATASEG(get_seg_entry(sbi, segno)->type) ?
 						SUM_TYPE_DATA : SUM_TYPE_NODE;
 	unsigned char data_type = (type == SUM_TYPE_DATA) ? DATA : NODE;
+	unsigned int boost_gc_multiple = 1;
+	bool boost_zoned_gc = false;
 	int submitted = 0, sum_blk_cnt;
 
+	if (f2fs_sb_has_blkzoned(sbi)) {
+		struct f2fs_gc_kthread *gc_th;
+
+		if (f2fs_get_gc_thread(sbi, &gc_th)) {
+			boost_zoned_gc = !has_enough_free_blocks(sbi,
+						gc_th->boost_zoned_gc_percent);
+			boost_gc_multiple = gc_th->boost_gc_multiple;
+			f2fs_put_gc_thread(gc_th);
+		}
+	}
+
 	if (__is_large_section(sbi)) {
 		sec_end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
 
@@ -1776,11 +1835,8 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 			unsigned int window_granularity =
 				sbi->migration_window_granularity;
 
-			if (f2fs_sb_has_blkzoned(sbi) &&
-					!has_enough_free_blocks(sbi,
-					sbi->gc_thread->boost_zoned_gc_percent))
-				window_granularity *=
-					sbi->gc_thread->boost_gc_multiple;
+			if (boost_zoned_gc)
+				window_granularity *= boost_gc_multiple;
 
 			end_segno = start_segno + window_granularity;
 		}
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 6c4d4567571e..5bfb221c153f 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -1,4 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/refcount.h>
 /*
  * fs/f2fs/gc.h
  *
@@ -46,6 +47,9 @@
 #define NR_GC_CHECKPOINT_SECS (3)	/* data/node/dentry sections */
 
 struct f2fs_gc_kthread {
+	struct f2fs_sb_info *sbi;
+	refcount_t refcnt;
+	struct completion refcnt_completion;
 	struct task_struct *f2fs_gc_task;
 	wait_queue_head_t gc_wait_queue_head;
 
@@ -84,6 +88,10 @@ struct victim_entry {
 	struct list_head list;
 };
 
+bool f2fs_get_gc_thread(struct f2fs_sb_info *sbi,
+				struct f2fs_gc_kthread **gc_thread);
+void f2fs_put_gc_thread(struct f2fs_gc_kthread *gc_th);
+
 /*
  * inline functions
  */
@@ -193,10 +201,10 @@ static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
 			limit_free_user_blocks(invalid_user_blocks));
 }
 
-static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
+static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi,
+					struct f2fs_gc_kthread *gc_th)
 {
 	if (f2fs_sb_has_blkzoned(sbi))
-		return !has_enough_free_blocks(sbi,
-				sbi->gc_thread->boost_zoned_gc_percent);
+		return !has_enough_free_blocks(sbi, gc_th->boost_zoned_gc_percent);
 	return has_enough_invalid_blocks(sbi);
 }
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 788f8b050249..edfb2735b111 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -424,6 +424,8 @@ int f2fs_commit_atomic_write(struct inode *inode)
  */
 void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 {
+	struct f2fs_gc_kthread *gc_th = NULL;
+
 	if (f2fs_cp_error(sbi))
 		return;
 
@@ -444,15 +446,16 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 	if (has_enough_free_secs(sbi, 0, 0))
 		return;
 
-	if (test_opt(sbi, GC_MERGE) && sbi->gc_thread &&
-				sbi->gc_thread->f2fs_gc_task) {
+	if (test_opt(sbi, GC_MERGE) &&
+				f2fs_get_gc_thread(sbi, &gc_th) &&
+				gc_th->f2fs_gc_task) {
 		DEFINE_WAIT(wait);
 
-		prepare_to_wait(&sbi->gc_thread->fggc_wq, &wait,
-					TASK_UNINTERRUPTIBLE);
-		wake_up(&sbi->gc_thread->gc_wait_queue_head);
+		prepare_to_wait(&gc_th->fggc_wq, &wait, TASK_UNINTERRUPTIBLE);
+		wake_up(&gc_th->gc_wait_queue_head);
 		io_schedule();
-		finish_wait(&sbi->gc_thread->fggc_wq, &wait);
+		finish_wait(&gc_th->fggc_wq, &wait);
+		f2fs_put_gc_thread(gc_th);
 	} else {
 		struct f2fs_gc_control gc_control = {
 			.victim_segno = NULL_SEGNO,
@@ -462,6 +465,8 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 			.should_migrate_blocks = false,
 			.err_gc_skipped = false,
 			.nr_free_secs = 1 };
+		if (gc_th)
+			f2fs_put_gc_thread(gc_th);
 		f2fs_down_write_trace(&sbi->gc_lock, &gc_control.lc);
 		stat_inc_gc_call_count(sbi, FOREGROUND);
 		f2fs_gc(sbi, &gc_control);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ccf806b676f5..00cbe5efa7d5 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4973,6 +4973,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	/* initialize locks within allocated memory */
 	init_f2fs_rwsem_trace(&sbi->gc_lock, sbi, LOCK_NAME_GC_LOCK);
+	init_f2fs_rwsem(&sbi->gc_thread_lock);
 	mutex_init(&sbi->writepages);
 	init_f2fs_rwsem_trace(&sbi->cp_global_sem, sbi, LOCK_NAME_CP_GLOBAL);
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 352e96ad5c3a..1ffb26ab9017 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -981,6 +981,8 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	}
 
 	if (!strcmp(a->attr.name, "critical_task_priority")) {
+		struct f2fs_gc_kthread *gc_th;
+
 		if (t < NICE_TO_PRIO(MIN_NICE) || t > NICE_TO_PRIO(MAX_NICE))
 			return -EINVAL;
 		if (!capable(CAP_SYS_NICE))
@@ -989,9 +991,12 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		if (sbi->cprc_info.f2fs_issue_ckpt)
 			set_user_nice(sbi->cprc_info.f2fs_issue_ckpt,
 					PRIO_TO_NICE(sbi->critical_task_priority));
-		if (sbi->gc_thread && sbi->gc_thread->f2fs_gc_task)
-			set_user_nice(sbi->gc_thread->f2fs_gc_task,
-					PRIO_TO_NICE(sbi->critical_task_priority));
+		if (f2fs_get_gc_thread(sbi, &gc_th)) {
+			if (gc_th->f2fs_gc_task)
+				set_user_nice(gc_th->f2fs_gc_task,
+						PRIO_TO_NICE(sbi->critical_task_priority));
+			f2fs_put_gc_thread(gc_th);
+		}
 		return count;
 	}
 
@@ -1011,10 +1016,13 @@ static ssize_t f2fs_sbi_store(struct f2fs_attr *a,
 	if (gc_entry) {
 		if (!down_read_trylock(&sbi->sb->s_umount))
 			return -EAGAIN;
+		f2fs_down_read(&sbi->gc_thread_lock);
 	}
 	ret = __sbi_store(a, sbi, buf, count);
-	if (gc_entry)
+	if (gc_entry) {
+		f2fs_up_read(&sbi->gc_thread_lock);
 		up_read(&sbi->sb->s_umount);
+	}
 
 	return ret;
 }
@@ -1025,8 +1033,16 @@ static ssize_t f2fs_attr_show(struct kobject *kobj,
 	struct f2fs_sb_info *sbi = container_of(kobj, struct f2fs_sb_info,
 								s_kobj);
 	struct f2fs_attr *a = container_of(attr, struct f2fs_attr, attr);
+	ssize_t ret;
 
-	return a->show ? a->show(a, sbi, buf) : 0;
+	if (a->struct_type != GC_THREAD)
+		return a->show ? a->show(a, sbi, buf) : 0;
+
+	f2fs_down_read(&sbi->gc_thread_lock);
+	ret = a->show ? a->show(a, sbi, buf) : 0;
+	f2fs_up_read(&sbi->gc_thread_lock);
+
+	return ret;
 }
 
 static ssize_t f2fs_attr_store(struct kobject *kobj, struct attribute *attr,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
