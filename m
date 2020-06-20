Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F4A202271
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Jun 2020 09:51:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jmYHJ-0006P7-LZ; Sat, 20 Jun 2020 07:51:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchangchun1@huawei.com>) id 1jmYHI-0006P0-Fy
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Jun 2020 07:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cABRU7UHO64DdO8l++1C70SE7ftqPcfEJ4j+LLJYXBo=; b=XGQ0iDCMr6IkANyobW7ZsppOdM
 bgTg8dyc4evT04p6jtOOLZ7hSV0b8dwbKqh3S3hgxgwi9B5foCX6pgb52aLzNOfX4XIJkMqVNpSqt
 6QS+TXWeXkPBSMe4sVsfkSQKJgPdGO7mpb1s9rThOH4ofzh4T++91d5oFgkjwYUeXNhM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cABRU7UHO64DdO8l++1C70SE7ftqPcfEJ4j+LLJYXBo=; b=L
 WjO0S4O4V8/v3QWYOhJZm5Tj4N+M0FJJyNJEF2osg5i/Vk5OqpEZhry8Rj7HBLm8nfj1cqtzGbmt6
 XdnoSKRgr4abeKKmIYKskCrYQVL2QQvMXhP9WZ6YxYc8CZl+eTuagw38EhXDbX0u9bJ4IYQTW48Hz
 xUk3eQw6vlQqSyX8=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jmYHG-00B99c-CG
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Jun 2020 07:51:04 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A4615A373F33A9C5940C;
 Sat, 20 Jun 2020 15:50:49 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Sat, 20 Jun 2020
 15:50:42 +0800
From: Yu Changchun <yuchangchun1@huawei.com>
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>
Date: Sat, 20 Jun 2020 03:58:29 -0400
Message-ID: <20200620075829.32465-1-yuchangchun1@huawei.com>
X-Mailer: git-send-email 2.27.0.22.g2051400
MIME-Version: 1.0
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jmYHG-00B99c-CG
Subject: [f2fs-dev]  [PATCH] f2fs: fix an oops in f2fs_is_compressed_page
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch is to fix a crash:

 #3 [ffffb6580689f898] oops_end at ffffffffa2835bc2
 #4 [ffffb6580689f8b8] no_context at ffffffffa28766e7
 #5 [ffffb6580689f920] async_page_fault at ffffffffa320135e
    [exception RIP: f2fs_is_compressed_page+34]
    RIP: ffffffffa2ba83a2  RSP: ffffb6580689f9d8  RFLAGS: 00010213
    RAX: 0000000000000001  RBX: fffffc0f50b34bc0  RCX: 0000000000002122
    RDX: 0000000000002123  RSI: 0000000000000c00  RDI: fffffc0f50b34bc0
    RBP: ffff97e815a40178   R8: 0000000000000000   R9: ffff97e83ffc9000
    R10: 0000000000032300  R11: 0000000000032380  R12: ffffb6580689fa38
    R13: fffffc0f50b34bc0  R14: ffff97e825cbd000  R15: 0000000000000c00
    ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0018
 #6 [ffffb6580689f9d8] __is_cp_guaranteed at ffffffffa2b7ea98
 #7 [ffffb6580689f9f0] f2fs_submit_page_write at ffffffffa2b81a69
 #8 [ffffb6580689fa30] f2fs_do_write_meta_page at ffffffffa2b99777
 #9 [ffffb6580689fae0] __f2fs_write_meta_page at ffffffffa2b75f1a
 #10 [ffffb6580689fb18] f2fs_sync_meta_pages at ffffffffa2b77466
 #11 [ffffb6580689fc98] do_checkpoint at ffffffffa2b78e46
 #12 [ffffb6580689fd88] f2fs_write_checkpoint at ffffffffa2b79c29
 #13 [ffffb6580689fdd0] f2fs_sync_fs at ffffffffa2b69d95
 #14 [ffffb6580689fe20] sync_filesystem at ffffffffa2ad2574
 #15 [ffffb6580689fe30] generic_shutdown_super at ffffffffa2a9b582
 #16 [ffffb6580689fe48] kill_block_super at ffffffffa2a9b6d1
 #17 [ffffb6580689fe60] kill_f2fs_super at ffffffffa2b6abe1
 #18 [ffffb6580689fea0] deactivate_locked_super at ffffffffa2a9afb6
 #19 [ffffb6580689feb8] cleanup_mnt at ffffffffa2abcad4
 #20 [ffffb6580689fee0] task_work_run at ffffffffa28bca28
 #21 [ffffb6580689ff00] exit_to_usermode_loop at ffffffffa28050b7
 #22 [ffffb6580689ff38] do_syscall_64 at ffffffffa280560e
 #23 [ffffb6580689ff50] entry_SYSCALL_64_after_hwframe at ffffffffa320008c

This occurred when umount f2fs if enable F2FS_FS_COMPRESSION
with F2FS_IO_TRACE. Fixes it by adding IS_IO_TRACED_PAGE to check
validity of pid for page_private.

Signed-off-by: Yu Changchun <yuchangchun1@huawei.com>
---
 fs/f2fs/compress.c | 7 +++++++
 fs/f2fs/f2fs.h     | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 1e02a8c106b0..12e9b6cd8c94 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -49,6 +49,13 @@ bool f2fs_is_compressed_page(struct page *page)
 		return false;
 	if (IS_ATOMIC_WRITTEN_PAGE(page) || IS_DUMMY_WRITTEN_PAGE(page))
 		return false;
+	/*
+	 * page->private may be set with pid.
+	 * pid_max is enough to check if it is traced.
+	 */
+	if (IS_IO_TRACED_PAGE(page))
+		return false;
+
 	f2fs_bug_on(F2FS_M_SB(page->mapping),
 		*((u32 *)page_private(page)) != F2FS_COMPRESSED_PAGE_MAGIC);
 	return true;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b35a50f4953c..634b6650d618 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1313,6 +1313,14 @@ enum fsync_mode {
 #define IS_DUMMY_WRITTEN_PAGE(page)			\
 		(page_private(page) == (unsigned long)DUMMY_WRITTEN_PAGE)
 
+#ifdef CONFIG_F2FS_IO_TRACE
+#define IS_IO_TRACED_PAGE(page)			\
+		(page_private(page) > 0 &&		\
+		 page_private(page) < (unsigned long)PID_MAX_LIMIT)
+#else
+#define IS_IO_TRACED_PAGE(page) (0)
+#endif
+
 #ifdef CONFIG_FS_ENCRYPTION
 #define DUMMY_ENCRYPTION_ENABLED(sbi) \
 	(unlikely(F2FS_OPTION(sbi).dummy_enc_ctx.ctx != NULL))
-- 
2.27.0.22.g2051400



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
