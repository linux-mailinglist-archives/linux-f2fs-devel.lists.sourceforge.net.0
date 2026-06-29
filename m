Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uxO9KZQCQmouygkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2026 07:28:52 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD5D6D607A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2026 07:28:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=RciA9vSf;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=V9uAwngZ;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="c 7Vhs/3";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=kkDxi93x;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pC5jRt/iNXplKmOUnroNyGfpUMywM5DlVCMAcd4apWA=; b=RciA9vSfNI21wwkg/nQtoSXL6f
	ouoKOdDZsJxHgffhwr5KHGHnn+zXzjQghZd8ZsS/T/AHI7A8VUanhoQOnEbjAFyLQrd7gNLT0TNd+
	x6K+ZABHf4uj7L8aGFtm3i8QkWm6bpVbcFFol8l7Mj5Y7uhDp04E5pqsOwN0N+qwTVTE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1we4Xo-0007hm-TY;
	Mon, 29 Jun 2026 05:28:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zzzccc427@gmail.com>) id 1we4Xn-0007hg-F0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jun 2026 05:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4rlXTL1AbUKSOvBNRJvUhw7f25JhxheO5eY/uajbqco=; b=V9uAwngZ0cPX+JC1LkPaG750zh
 kr+DgX/MvtClWkLMHoSSWaGIfw0k9TKggwN1F81egNtGCpTONSRP4QU206RwcxWTfi2t+cD/I3NNS
 2/tljEFm7cDENadM4XzMIxJ7IL1aa6TtFwKpiC4taZSPIrRyH7YgEm/PMOaKQast9xZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4rlXTL1AbUKSOvBNRJvUhw7f25JhxheO5eY/uajbqco=; b=c
 7Vhs/3w5CjgxwpXHQxpj2vqLI3xuNtXIOuR0MO3xu8B44FZlde0qnqcWujqeWLBpRQL94M4xfbQfz
 p9dqY/O6gRykrq5Q0KYEAM6SolJQ8gU78+L7Gpbn6axK8ubH6KYU65WCf7jNMNknu0U6uqaHTgJnY
 AOU33Fv32ToeFwX8=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1we4Xm-00046m-Ck for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jun 2026 05:28:32 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-37fa53bc22dso1803566a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 28 Jun 2026 22:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782710900; x=1783315700; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4rlXTL1AbUKSOvBNRJvUhw7f25JhxheO5eY/uajbqco=;
 b=kkDxi93xu3DzqBNMnCX63QVmTRdhyrAZrt+aaozFI1ADBJsk9V5ZvqRVOip1cJ6VyY
 dG8gjCgEtTF1bP/3b7AttcQqPqL+zZBLQCLxdpRoB6SMoGwF8kA87I147LopNx0CVfu9
 VX1FCifodJA5BgL2Dvjo8JgoTLXD7j+Q5OYQrgOtxgmx18sX/3/3FZaOwp0saPhY+5IF
 fJx939b1sNBKx/+U+B+IEGG9NpLMQ2ipix2BaOy160fher/lEBR1L1Z0kxMDbFDDNYfk
 mMe1xNFT/BMXrrwSe8bxu6jYWMr1mZN6D/AncmU1RISQ2Gn8yTpCqBdVFPUEuvSJ0aZk
 iTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782710900; x=1783315700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4rlXTL1AbUKSOvBNRJvUhw7f25JhxheO5eY/uajbqco=;
 b=CF7bWWeiySDis2SQuYxQdbsuJQCos7q52VD1cU5GyIhSZtp+PDhjTEyvCaQRc2qioa
 nFnfCVAv4KkGTLci35YoVp8OwGTnZ712CgXSl6eu/33pWJgJqPPnxvS7F5EsevaPXUwR
 reAZxLBYQAi2kwlnvtjySquF2L48N6fpQZkf7pePyPlKsrB+IhainihBcRpBTtBLCKTq
 nXlX5gbg9huZcebFcA9V2py7Wq+pNmbN1sRG0yIUvqGmaGjfgW0dtdV/hmVewxAT8lr9
 cdQR/IiCoCgRJKqK+3SWqQwro8V5B8bYhO0nNU1ZCBmsZ/Pi8iIEchUvOJoKZ1zDholi
 nvwg==
X-Gm-Message-State: AOJu0YyrteznXsfZLIVFwya5ats1HK+qkSg2qhXXE8fK5hLayi8JkP7g
 E8Bfj5HzMbh99/kDqk1BAn9fwK8IauYMpCX/zQdt4QiaR8j8iHwNxpRr
X-Gm-Gg: AfdE7ckkDHqdkZEsPgjS5jUXTeYkmSenhqjc7J5UUz8JjGVQjZoHfosJsZD5bDk9Oh1
 QT4r0wF9MIhN2qHCOwN91YywwJsMWeMN7OTcMVmr1vqdXiEc8ETKH2c2w8vOm4BT/HWdpyz216p
 DE1LUwyUjgb2Wm+QsIio/cnHG2KSJJ+dUV0mjQ8dtXiHrXgjy0bUtPlpZD4XIQ+mP6quc1CWSIX
 Ao2lnkHovUrGlO5mPhTILj4tYXh7E1GG6z9eeLOBywpCJ61gSdwbiIdejTs9TsNxPI9e6WBftOS
 ttEkv1+yMHQLcViy0yPX3Z2Hg22wiEolrCLWMSr7YpiXtUWj85V6lE6gWwOhu3xlIgkqr8qIS1p
 4Q0xpHVNwN7RQ3fUr6usjEWxZO6ZYDYk2SJFudMJ0WO28s5DeP73RLbLFAhAL9km6zRAYPCPINh
 RY+HWT2YmwKFg7k24JQA==
X-Received: by 2002:a17:903:2f4c:b0:2c9:9a19:10c with SMTP id
 d9443c01a7336-2c99a19037fmr73344515ad.40.1782710900031; 
 Sun, 28 Jun 2026 22:28:20 -0700 (PDT)
Received: from localhost ([111.228.63.84]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7f5afdd40sm84838635ad.33.2026.06.28.22.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2026 22:28:19 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 29 Jun 2026 13:28:11 +0800
Message-Id: <20260629052811.2167181-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: 2.1 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: A compressed read owns a decompress_io_ctx (DIC) until
 cluster
 completion drops its final reference. The final cleanup still reads dic->sbi
 and releases DIC page arrays through sbi->page_array_slab. I [...] 
 Content analysis details:   (2.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zzzccc427(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zzzccc427(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1we4Xm-00046m-Ck
Subject: [f2fs-dev] [PATCH] f2fs: wait for decompress contexts before
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
Cc: baijiaju1990@gmail.com, zzzccc427@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
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
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:baijiaju1990@gmail.com,m:zzzccc427@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[zzzccc427@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zzzccc427@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CAD5D6D607A

A compressed read owns a decompress_io_ctx (DIC) until cluster
completion drops its final reference.  The final cleanup still reads
dic->sbi and releases DIC page arrays through sbi->page_array_slab.  If
the final put is not in task context, cleanup is queued on sbi->wq.

The rpage unlocks in f2fs_verify_cluster() and f2fs_decompress_end_io()
can make the inode evictable before f2fs_put_dic() has finished.  Then
unmount can pass inode eviction, destroy the per-mount workqueue and
page-array slab, and free the f2fs_sb_info while the DIC cleanup path
still has to run.

The buggy scenario involves two paths, with each column showing the order
within that path:

fsverity_read_queue worker:        unmount:
1. verify decompressed rpages      1. observe the inode evictable
2. unlock the last rpage           2. evict and truncate pagecache
3. call f2fs_put_dic(dic, true)    3. destroy sbi->wq/page_array_slab
4. f2fs_free_dic() reads dic->sbi  4. free the f2fs_sb_info

Validation reproduced this kernel report:
KASAN: slab-use-after-free in f2fs_release_decomp_mem+0x1da/0x240
Workqueue: fsverity_read_queue f2fs_verify_cluster
The buggy address belongs to the object at ffff88810267c000 which belongs
to the cache kmalloc-8k of size 8192
The buggy address is located 4868 bytes inside of freed 8192-byte region
[ffff88810267c000, ffff88810267e000)
Read of size 4
Call trace:
  dump_stack_lvl+0x66/0xa0
  print_report+0xce/0x630
  f2fs_release_decomp_mem+0x1da/0x240 (fs/f2fs/compress.c:1685)
  srso_alias_return_thunk+0x5/0xfbef5
  __virt_addr_valid+0x224/0x430
  kasan_report+0xe0/0x110
  f2fs_free_dic+0x5b/0x630 (fs/f2fs/compress.c:1766)
  process_one_work+0x897/0x1820 (kernel/workqueue.c:3220)
  lock_is_held_type+0x8f/0x100
  worker_thread+0x575/0xf80
  kthread+0x2e7/0x3c0
  ret_from_fork+0x576/0x810
  __switch_to+0x57e/0xe10
  __switch_to_asm+0x33/0x70
  ret_from_fork_asm+0x1a/0x30
Allocated by task stack:
  kasan_save_stack+0x33/0x60
  kasan_save_track+0x14/0x30
  __kasan_kmalloc+0x8f/0xa0
  __kmalloc_cache_noprof+0x235/0x5c0
  f2fs_fill_super+0xd6/0x8840 (fs/f2fs/super.c:5004)
  get_tree_bdev_flags+0x312/0x590
  vfs_get_tree+0x8d/0x320
  fc_mount+0x15/0x1d0
  path_mount+0x59b/0x2020
  __x64_sys_mount+0x210/0x270
  do_syscall_64+0x115/0x6a0 (arch/x86/entry/syscall_64.c:87)
  entry_SYSCALL_64_after_hwframe+0x77/0x7f
Freed by task stack:
  kasan_save_stack+0x33/0x60
  kasan_save_track+0x14/0x30
  kasan_save_free_info+0x3b/0x60
  __kasan_slab_free+0x43/0x70
  kfree+0x2ed/0x520
  kill_f2fs_super+0x3bc/0x590 (fs/f2fs/super.c:5560)
  deactivate_locked_super+0xa8/0x160
  cleanup_mnt+0x1e2/0x3e0
  task_work_run+0x11d/0x1f0
  exit_to_user_mode_loop+0x17d/0x570
  do_syscall_64+0x4f0/0x6a0 (arch/x86/entry/syscall_64.c:87)
  entry_SYSCALL_64_after_hwframe+0x77/0x7f

Track live DICs in the per-mount compression state.  Increment the count
once a DIC is tied to the mounted sbi, decrement it only after
f2fs_free_dic() has released all sbi-owned DIC resources, and make
f2fs_put_super() wait for the count to reach zero before destroying
sbi->wq, sbi->page_array_slab, or the sbi itself.  This preserves the
existing read-completion and page-unlock behavior while extending
teardown to cover the cleanup lifetime that DIC already requires.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 fs/f2fs/compress.c | 14 ++++++++++++++
 fs/f2fs/f2fs.h     |  4 ++++
 fs/f2fs/super.c    |  2 ++
 3 files changed, 20 insertions(+)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 91855d91bbdd..bbdc009cfed3 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1732,6 +1732,7 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 	refcount_set(&dic->refcnt, 1);
 	dic->failed = false;
 	dic->vi = cc->vi;
+	atomic_inc(&sbi->nr_decompress_ctx);
 
 	for (i = 0; i < dic->cluster_size; i++)
 		dic->rpages[i] = cc->rpages[i];
@@ -1794,6 +1795,8 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
 
 	page_array_free(sbi, dic->rpages, dic->nr_rpages);
 	kmem_cache_free(dic_entry_slab, dic);
+	if (atomic_dec_and_test(&sbi->nr_decompress_ctx))
+		wake_up_all(&sbi->decompress_io_wait);
 }
 
 static void f2fs_late_free_dic(struct work_struct *work)
@@ -2077,6 +2080,9 @@ int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi)
 	if (!f2fs_sb_has_compression(sbi))
 		return 0;
 
+	atomic_set(&sbi->nr_decompress_ctx, 0);
+	init_waitqueue_head(&sbi->decompress_io_wait);
+
 	sprintf(slab_name, "f2fs_page_array_entry-%u:%u", MAJOR(dev), MINOR(dev));
 
 	sbi->page_array_slab_size = sizeof(struct page *) <<
@@ -2092,6 +2098,14 @@ void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi)
 	kmem_cache_destroy(sbi->page_array_slab);
 }
 
+void f2fs_wait_on_decompress_io(struct f2fs_sb_info *sbi)
+{
+	if (!f2fs_sb_has_compression(sbi))
+		return;
+
+	wait_event(sbi->decompress_io_wait, !atomic_read(&sbi->nr_decompress_ctx));
+}
+
 int __init f2fs_init_compress_cache(void)
 {
 	cic_entry_slab = f2fs_kmem_cache_create("f2fs_cic_entry",
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8f3e632f315c..63ae46a2d400 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2025,6 +2025,8 @@ struct f2fs_sb_info {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct kmem_cache *page_array_slab;	/* page array entry */
 	unsigned int page_array_slab_size;	/* default page array slab size */
+	atomic_t nr_decompress_ctx;		/* in-flight decompress contexts */
+	wait_queue_head_t decompress_io_wait;	/* wait for decompress contexts */
 
 	/* For runtime compression statistics */
 	u64 compr_written_block;
@@ -4696,6 +4698,7 @@ int f2fs_init_compress_inode(struct f2fs_sb_info *sbi);
 void f2fs_destroy_compress_inode(struct f2fs_sb_info *sbi);
 int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi);
 void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi);
+void f2fs_wait_on_decompress_io(struct f2fs_sb_info *sbi);
 int __init f2fs_init_compress_cache(void);
 void f2fs_destroy_compress_cache(void);
 struct address_space *COMPRESS_MAPPING(struct f2fs_sb_info *sbi);
@@ -4751,6 +4754,7 @@ static inline int f2fs_init_compress_inode(struct f2fs_sb_info *sbi) { return 0;
 static inline void f2fs_destroy_compress_inode(struct f2fs_sb_info *sbi) { }
 static inline int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi) { return 0; }
 static inline void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi) { }
+static inline void f2fs_wait_on_decompress_io(struct f2fs_sb_info *sbi) { }
 static inline int __init f2fs_init_compress_cache(void) { return 0; }
 static inline void f2fs_destroy_compress_cache(void) { }
 static inline void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2b8d96411156..b279d3eaae53 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2075,6 +2075,8 @@ static void f2fs_put_super(struct super_block *sb)
 	/* flush s_error_work before sbi destroy */
 	flush_work(&sbi->s_error_work);
 
+	f2fs_wait_on_decompress_io(sbi);
+
 	f2fs_destroy_wq(sbi);
 
 	kvfree(sbi->ckpt);
-- 
2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
