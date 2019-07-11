Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5276549D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2019 12:39:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hlWTh-0008UN-3t; Thu, 11 Jul 2019 10:39:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hlWTf-0008UG-UG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 10:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yc6CliARcbpvsgPO9xa0nw8Jtli6MkKnonrskYIGyF0=; b=UwDZzvp+ULHyxHiP46+K2doDc8
 skTHlPoGBN4ZiBN62enRmhIq3TroHO9JiKXAq5s2XdhqdN/I12LeUb0N80ZrpviqjiI8xqSOvFf6Y
 qaHw8ADHhH2BPer2unShbzi+0xcn7zMxU9sNYlOtkF4QFGpYcUWZEsW+bV+54Bk8mWV8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yc6CliARcbpvsgPO9xa0nw8Jtli6MkKnonrskYIGyF0=; b=BWNvua4asyqtBBrGfsbptBpLaK
 EeW9/ct1RHqi9h92pLX3qZLif1XR5gzkc7GDCbm57Xp8Xd11V8xpVBWJQOyMyEXKyoWFEOuM1/ows
 ghXr0Zznki4cGPRGFkmqevp3J1WuWVi3nPZ565oI4FkvtmIP/lqoCrooM+wIemrNfQaI=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hlWTb-00FwWS-Nh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 10:39:03 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 31C3FEE1B2607C849EF1;
 Thu, 11 Jul 2019 18:38:51 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Thu, 11 Jul 2019 18:38:40 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 11 Jul 2019 18:38:37 +0800
Message-ID: <1562841517-77910-2-git-send-email-yuchao0@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562841517-77910-1-git-send-email-yuchao0@huawei.com>
References: <1562841517-77910-1-git-send-email-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hlWTb-00FwWS-Nh
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix panic of IO alignment feature
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

Since 07173c3ec276 ("block: enable multipage bvecs"), one bio vector
can store multi pages, so that we can not calculate max IO size of
bio as PAGE_SIZE * bio->bi_max_vecs. However IO alignment feature of
f2fs always has that assumption, so finally, it may cause panic during
IO submission as below stack.

 kernel BUG at fs/f2fs/data.c:317!
 RIP: 0010:__submit_merged_bio+0x8b0/0x8c0
 Call Trace:
  f2fs_submit_page_write+0x3cd/0xdd0
  do_write_page+0x15d/0x360
  f2fs_outplace_write_data+0xd7/0x210
  f2fs_do_write_data_page+0x43b/0xf30
  __write_data_page+0xcf6/0x1140
  f2fs_write_cache_pages+0x3ba/0xb40
  f2fs_write_data_pages+0x3dd/0x8b0
  do_writepages+0xbb/0x1e0
  __writeback_single_inode+0xb6/0x800
  writeback_sb_inodes+0x441/0x910
  wb_writeback+0x261/0x650
  wb_workfn+0x1f9/0x7a0
  process_one_work+0x503/0x970
  worker_thread+0x7d/0x820
  kthread+0x1ad/0x210
  ret_from_fork+0x35/0x40

This patch adds one extra condition to check left space in bio while
trying merging page to bio, to avoid panic.

This bug was reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=204043

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c          | 10 ++++++++++
 fs/f2fs/super.c         |  2 +-
 include/linux/f2fs_fs.h |  1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index bdfd8fb..f106ada 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -508,6 +508,16 @@ static bool io_is_mergeable(struct f2fs_sb_info *sbi, struct bio *bio,
 {
 	if (!page_is_mergeable(sbi, bio, last_blkaddr, cur_blkaddr))
 		return false;
+	if (F2FS_IO_ALIGNED(sbi)) {
+		unsigned int filled_blocks =
+				F2FS_BYTES_TO_BLK(bio->bi_iter.bi_size);
+		unsigned int io_size = F2FS_IO_SIZE(sbi);
+		unsigned int left_vecs = bio->bi_max_vecs - bio->bi_vcnt;
+
+		/* IOs in bio is aligned and left space of vectors is not enough */
+		if (!(filled_blocks % io_size) && left_vecs < io_size)
+			return false;
+	}
 	return io_type_is_mergeable(io, fio);
 }
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d95a681..a98e3b9 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3204,7 +3204,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	if (err)
 		goto free_bio_info;
 
-	if (F2FS_IO_SIZE(sbi) > 1) {
+	if (F2FS_IO_ALIGNED(sbi)) {
 		sbi->write_io_dummy =
 			mempool_create_page_pool(2 * (F2FS_IO_SIZE(sbi) - 1), 0);
 		if (!sbi->write_io_dummy) {
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 6555990..52af9ac 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -41,6 +41,7 @@
 #define F2FS_IO_SIZE_BYTES(sbi)	(1 << (F2FS_OPTION(sbi).write_io_size_bits + 12)) /* B */
 #define F2FS_IO_SIZE_BITS(sbi)	(F2FS_OPTION(sbi).write_io_size_bits) /* power of 2 */
 #define F2FS_IO_SIZE_MASK(sbi)	(F2FS_IO_SIZE(sbi) - 1)
+#define F2FS_IO_ALIGNED(sbi)	(F2FS_IO_SIZE(sbi) > 1)
 
 /* This flag is used by node and meta inodes, and by recovery */
 #define GFP_F2FS_ZERO		(GFP_NOFS | __GFP_ZERO)
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
