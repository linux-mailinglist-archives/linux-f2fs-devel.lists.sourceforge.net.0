Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5B81B2532
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Apr 2020 13:36:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jQrCp-0004G0-VB; Tue, 21 Apr 2020 11:36:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jQrCo-0004Fn-E0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Apr 2020 11:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7TMxef6zEik+d4Ux6oqwG12xknyOfWnFq2Uvx22LroE=; b=YXZ4OGaLUziQuwX0JG5AiJMM1v
 epuYmUgTDHOpLKy7uAyl68/24qyyVgpPrHz4zZAHFFemAd2/2JVRCbjZ8xe8e0eyRqc2UBoyrJuVJ
 dONk+8lCAtpQhSb/m6YEl91stqa6+YRgY8nYDEcVWWpTPO80CIu4JCQzTOD3PYjLIYfw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7TMxef6zEik+d4Ux6oqwG12xknyOfWnFq2Uvx22LroE=; b=E
 IcOYJNZLzgSMKkxzuKYYlpDmAI6vGOUhbea/UvhIQe2lTySkqtJHeL0GNBE184GVawHdWs9JDHN29
 lCul7lX9bZmX+cmExU123oy22dMqlHXYPEuTQTF3MxuCnxwq2S59tAyi0Le3xqnwipSk/FfMvnCyy
 MtCzK59lRwjrLc+8=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jQrCk-005JWX-Gv
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Apr 2020 11:36:46 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E3F3D244BF4870A871B2;
 Tue, 21 Apr 2020 19:36:33 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Tue, 21 Apr 2020 19:36:24 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 21 Apr 2020 19:36:21 +0800
Message-ID: <20200421113621.60996-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jQrCk-005JWX-Gv
Subject: [f2fs-dev] [PATCH] f2fs: compress: don't handle non-compressed data
 in workqueue
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

If bio has no compressed data, we don't need to handle end_io work in
workqueue, instead, it should just let interrupter handle it directly
to speed up IO response.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index ff8a92df8d99..8607c02e8f96 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -114,7 +114,8 @@ static enum count_type __read_io_type(struct page *page)
 /* postprocessing steps for read bios */
 enum bio_post_read_step {
 	STEP_DECRYPT,
-	STEP_DECOMPRESS,
+	STEP_DECOMPRESS_NOWQ,		/* handle normal cluster data inplace */
+	STEP_DECOMPRESS,		/* handle compressed cluster data in workqueue */
 	STEP_VERITY,
 };
 
@@ -990,7 +991,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 	if (f2fs_encrypted_file(inode))
 		post_read_steps |= 1 << STEP_DECRYPT;
 	if (f2fs_compressed_file(inode))
-		post_read_steps |= 1 << STEP_DECOMPRESS;
+		post_read_steps |= 1 << STEP_DECOMPRESS_NOWQ;
 	if (f2fs_need_verity(inode, first_idx))
 		post_read_steps |= 1 << STEP_VERITY;
 
@@ -2189,6 +2190,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	for (i = 0; i < dic->nr_cpages; i++) {
 		struct page *page = dic->cpages[i];
 		block_t blkaddr;
+		struct bio_post_read_ctx *ctx;
 
 		blkaddr = data_blkaddr(dn.inode, dn.node_page,
 						dn.ofs_in_node + i + 1);
@@ -2225,6 +2227,11 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		if (bio_add_page(bio, page, blocksize, 0) < blocksize)
 			goto submit_and_realloc;
 
+		/* tag STEP_DECOMPRESS to handle IO in wq */
+		ctx = bio->bi_private;
+		if (!(ctx->enabled_steps & (1 << STEP_DECOMPRESS)))
+			ctx->enabled_steps |= 1 << STEP_DECOMPRESS;
+
 		inc_page_count(sbi, F2FS_RD_DATA);
 		f2fs_update_iostat(sbi, FS_DATA_READ_IO, F2FS_BLKSIZE);
 		ClearPageError(page);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
