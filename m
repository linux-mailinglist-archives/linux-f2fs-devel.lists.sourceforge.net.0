Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4569178B283
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Aug 2023 16:04:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qacr3-0007Nr-Cy;
	Mon, 28 Aug 2023 14:04:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qacr0-0007Ne-Ui
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 14:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pRAt/owLqZzY+/zhZfHMoBIE4gXimI8Te6gJXnqQPho=; b=hIZbvfEn707bCYdunWcu4N+6P6
 KTaKQnCh1SzbbQEYsKLSxEEyc0/lSLHa5PxAuezroEdyEgrlMvrAqlk2bsBAiyerreT4bYgXI89Go
 h9Jk4+zHghLWgJmeVPxGmsJ+JH3IFtnpGPOKxSl/+ZSi5/DTFgjYMIwXVrgpPsXc9AkA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pRAt/owLqZzY+/zhZfHMoBIE4gXimI8Te6gJXnqQPho=; b=F
 /+KeyJpzRVf8AKBP0JOhS69l9nF4aHP97BZRxkQZVqX5UYJ7aOx5zlFMoNRuorS2ZZ1eFpwslK/VK
 AdVlS3ig37g1aQg0oAY+ps3QMMJgHJH+GQ2ggomLsGZ68GQ4DbfhAYSL+ZWgNvWvrnrdfMPeTpZjy
 7stLBrj0N+r11igo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qacqy-00043P-AY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 14:04:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B826561453
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Aug 2023 14:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E365C433C7;
 Mon, 28 Aug 2023 14:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693231462;
 bh=X6U4PxteH/EjLDJzCGakPS5hJHHN+ysNK2HZLF+vP34=;
 h=From:To:Cc:Subject:Date:From;
 b=ankK9vZEDlXWhpX5DSAvfZs+4ORjzANyJh0kh6M0WUrcP6PhmsopFM1+pmvg7EmvG
 1O8txTbNZmXpmuGZXIe8vbPOSkDBK3o0hYBYP0t7Nl4nUo8ewbDxPj1PiTgcxQvs2r
 /K3QP7frRkIcKAUJUte73t3p8do8DZpVMKJpuOge1bA1V+qQANSd/O5WJSsJvKXjpA
 jt2X9NOx/j8VrLWyDb6mNUULvlPVO6d4gdmjnhHRRrGZGqoOIr24w4USrJ9HrDAUbZ
 ZGR0suCAZH7V2ooxps0kajZ3UYGT0R4TGeQlJXrGUAsMSKOuYkP8UqPOeJuHzJjLRk
 nT1TggjrgJQ7A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 28 Aug 2023 22:04:14 +0800
Message-Id: <20230828140417.2951796-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  With below mount option and testcase, it hangs kernel. 1.
 mount -t f2fs -o compress_log_size=5 /dev/vdb /mnt/f2fs 2. touch
 /mnt/f2fs/file
 3. chattr +c /mnt/f2fs/file 4. dd if=/dev/zero of=/mnt/f2fs/file bs=1MB
 count=1 5. sync 6. dd if=/dev/zero of=/mnt/f2 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qacqy-00043P-AY
Subject: [f2fs-dev] [PATCH 1/4] f2fs: compress: fix deadloop in
 f2fs_write_cache_pages()
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

With below mount option and testcase, it hangs kernel.

1. mount -t f2fs -o compress_log_size=5 /dev/vdb /mnt/f2fs
2. touch /mnt/f2fs/file
3. chattr +c /mnt/f2fs/file
4. dd if=/dev/zero of=/mnt/f2fs/file bs=1MB count=1
5. sync
6. dd if=/dev/zero of=/mnt/f2fs/file bs=111 count=11 conv=notrunc
7. sync

INFO: task sync:4788 blocked for more than 120 seconds.
      Not tainted 6.5.0-rc1+ #322
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:sync            state:D stack:0     pid:4788  ppid:509    flags:0x00000002
Call Trace:
 <TASK>
 __schedule+0x335/0xf80
 schedule+0x6f/0xf0
 wb_wait_for_completion+0x5e/0x90
 sync_inodes_sb+0xd8/0x2a0
 sync_inodes_one_sb+0x1d/0x30
 iterate_supers+0x99/0xf0
 ksys_sync+0x46/0xb0
 __do_sys_sync+0x12/0x20
 do_syscall_64+0x3f/0x90
 entry_SYSCALL_64_after_hwframe+0x6e/0xd8

The reason is f2fs_all_cluster_page_ready() assumes that pages array should
cover at least one cluster, otherwise, it will always return false, result
in deadloop.

By default, pages array size is 16, and it can cover the case cluster_size
is equal or less than 16, for the case cluster_size is larger than 16, let's
allocate memory of pages array dynamically.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 916e317ac925..3f33e14dc7f8 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3023,7 +3023,8 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 {
 	int ret = 0;
 	int done = 0, retry = 0;
-	struct page *pages[F2FS_ONSTACK_PAGES];
+	struct page *pages_local[F2FS_ONSTACK_PAGES];
+	struct page **pages = pages_local;
 	struct folio_batch fbatch;
 	struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
 	struct bio *bio = NULL;
@@ -3047,6 +3048,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 #endif
 	int nr_folios, p, idx;
 	int nr_pages;
+	unsigned int max_pages = F2FS_ONSTACK_PAGES;
 	pgoff_t index;
 	pgoff_t end;		/* Inclusive */
 	pgoff_t done_index;
@@ -3056,6 +3058,15 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	int submitted = 0;
 	int i;
 
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (f2fs_compressed_file(inode) &&
+		1 << cc.log_cluster_size > F2FS_ONSTACK_PAGES) {
+		pages = f2fs_kzalloc(sbi, sizeof(struct page *) <<
+				cc.log_cluster_size, GFP_NOFS | __GFP_NOFAIL);
+		max_pages = 1 << cc.log_cluster_size;
+	}
+#endif
+
 	folio_batch_init(&fbatch);
 
 	if (get_dirty_pages(mapping->host) <=
@@ -3101,7 +3112,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 add_more:
 			pages[nr_pages] = folio_page(folio, idx);
 			folio_get(folio);
-			if (++nr_pages == F2FS_ONSTACK_PAGES) {
+			if (++nr_pages == max_pages) {
 				index = folio->index + idx + 1;
 				folio_batch_release(&fbatch);
 				goto write;
@@ -3283,6 +3294,11 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	if (bio)
 		f2fs_submit_merged_ipu_write(sbi, &bio, NULL);
 
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (pages != pages_local)
+		kfree(pages);
+#endif
+
 	return ret;
 }
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
