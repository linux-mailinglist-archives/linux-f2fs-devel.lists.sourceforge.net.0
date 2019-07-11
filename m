Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7E66549B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2019 12:39:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hlWTa-000167-Hn; Thu, 11 Jul 2019 10:38:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hlWTX-00015T-Uv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 10:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BDev8gHYMiRdcjrZ4xyD0fgRZdlQMDYo3yXJl9JENRk=; b=aDl9qQ4xatJeyY0AVEwNI73UmS
 s5tML4nvedwC9pLQPRoXlXQ8anfqsJLWO9e2sP6g1jjmmfL+UnyEPJBAxI98KnrstPSdjhKUOe7aw
 j/5GGfMiYwrYHn0A/Fm/hk8zKR1VcIUvctTglN/SHB41mtPZ/uSCUUKCme0s1x6rN3mQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BDev8gHYMiRdcjrZ4xyD0fgRZdlQMDYo3yXJl9JENRk=; b=I
 D7OV65u7rVCALNgzJKut/GpyfRHfG3gGGfIdVB7DrLGVJ0F5XRRyZW8mrxvY3Vd5Mch2rEWX34Zx6
 6M0ClnOrl1F+soINN8zLAqHWQPMYDya+8eNdkW0GvJ+klvRjf6j3JbvkinGM2vwui4gnXguvMdht2
 oRGBMdG0I2nYoDtw=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hlWTV-00FYNz-MI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 10:38:55 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0F3D65CBD034033FF4B7;
 Thu, 11 Jul 2019 18:38:46 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Thu, 11 Jul 2019 18:38:39 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 11 Jul 2019 18:38:36 +0800
Message-ID: <1562841517-77910-1-git-send-email-yuchao0@huawei.com>
X-Mailer: git-send-email 2.7.4
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
X-Headers-End: 1hlWTV-00FYNz-MI
Subject: [f2fs-dev] [PATCH 1/2] f2fs: introduce {page,
 io}_is_mergeable() for readability
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

Wrap merge condition into function for readability, no logic change.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c | 42 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6a8db4a..bdfd8fb 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -482,6 +482,35 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	return 0;
 }
 
+static bool page_is_mergeable(struct f2fs_sb_info *sbi, struct bio *bio,
+				block_t last_blkaddr, block_t cur_blkaddr)
+{
+	if (!bio)
+		return true;
+	if (last_blkaddr != cur_blkaddr)
+		return false;
+	return __same_bdev(sbi, cur_blkaddr, bio);
+}
+
+static bool io_type_is_mergeable(struct f2fs_bio_info *io,
+						struct f2fs_io_info *fio)
+{
+	if (io->fio.op != fio->op)
+		return false;
+	return io->fio.op_flags == fio->op_flags;
+}
+
+static bool io_is_mergeable(struct f2fs_sb_info *sbi, struct bio *bio,
+					struct f2fs_bio_info *io,
+					struct f2fs_io_info *fio,
+					block_t last_blkaddr,
+					block_t cur_blkaddr)
+{
+	if (!page_is_mergeable(sbi, bio, last_blkaddr, cur_blkaddr))
+		return false;
+	return io_type_is_mergeable(io, fio);
+}
+
 int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 {
 	struct bio *bio = *fio->bio;
@@ -495,8 +524,8 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 	trace_f2fs_submit_page_bio(page, fio);
 	f2fs_trace_ios(fio, 0);
 
-	if (bio && (*fio->last_block + 1 != fio->new_blkaddr ||
-			!__same_bdev(fio->sbi, fio->new_blkaddr, bio))) {
+	if (!page_is_mergeable(fio->sbi, bio, *fio->last_block,
+						fio->new_blkaddr)) {
 		__submit_bio(fio->sbi, bio, fio->type);
 		bio = NULL;
 	}
@@ -569,9 +598,8 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 
 	inc_page_count(sbi, WB_DATA_TYPE(bio_page));
 
-	if (io->bio && (io->last_block_in_bio != fio->new_blkaddr - 1 ||
-	    (io->fio.op != fio->op || io->fio.op_flags != fio->op_flags) ||
-			!__same_bdev(sbi, fio->new_blkaddr, io->bio)))
+	if (!io_is_mergeable(sbi, io->bio, io, fio,
+			io->last_block_in_bio, fio->new_blkaddr))
 		__submit_merged_bio(io);
 alloc_new:
 	if (io->bio == NULL) {
@@ -1643,8 +1671,8 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 	 * This page will go to BIO.  Do we need to send this
 	 * BIO off first?
 	 */
-	if (bio && (*last_block_in_bio != block_nr - 1 ||
-		!__same_bdev(F2FS_I_SB(inode), block_nr, bio))) {
+	if (!page_is_mergeable(F2FS_I_SB(inode), bio,
+				*last_block_in_bio, block_nr - 1)) {
 submit_and_realloc:
 		__submit_bio(F2FS_I_SB(inode), bio, DATA);
 		bio = NULL;
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
