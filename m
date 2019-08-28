Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E4A9FE8A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Aug 2019 11:34:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2uL8-0000dB-Er; Wed, 28 Aug 2019 09:34:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i2uL4-0000cP-9S
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Aug 2019 09:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2gOYMrp3as5MUJzIa99alKDcLAc5rCBWz3LdU7fDqrM=; b=MKNhq5tVdmij+kFRc3oybhSJ/R
 D7XAnp9eGm6Hso/Q5bK9idvDI6uyVtaUrG+t8xLFY/OnwK9z624+qTtx2yLjMLRg9jgfcnwOqCW2D
 zWZbOVe2aPtFK/mwGUcVxNuS8HwdTf2MBD5f8YUx9OQfAXJll5N/vgkxvG2xKEXwyPkw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2gOYMrp3as5MUJzIa99alKDcLAc5rCBWz3LdU7fDqrM=; b=He9h8CneNYLO0JdnnGYPU66Ur1
 Lb5mNSNkDJzUHWb2KicWzERiugJ6fxtW3xn4Hr2n45JCtK9BLcfByd+fxXzr2qrXyS9ILhoGnt1FS
 iCVJAGX3s4aosuY9rNwKw9SaFcnQmihiMY5cDP4uU+TvH2oXdLZPcsCV9wDxetG1DH2g=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2uL2-0068jf-Vy
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Aug 2019 09:34:02 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id ABE88777571745BBBA9B;
 Wed, 28 Aug 2019 17:33:51 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Wed, 28 Aug 2019 17:33:42 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 28 Aug 2019 17:33:38 +0800
Message-ID: <20190828093338.29446-4-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20190828093338.29446-1-yuchao0@huawei.com>
References: <20190828093338.29446-1-yuchao0@huawei.com>
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
X-Headers-End: 1i2uL2-0068jf-Vy
Subject: [f2fs-dev] [PATCH 4/4] f2fs: fix to add missing F2FS_IO_ALIGNED()
 condition
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

In f2fs_allocate_data_block(), we will reset fio.retry for IO
alignment feature instead of IO serialization feature.

In addition, spread F2FS_IO_ALIGNED() to check IO alignment
feature status explicitly.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c    | 6 +++++-
 fs/f2fs/segment.c | 4 +++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 777888ba171a..4764fdcb34d0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -294,6 +294,9 @@ static inline void __submit_bio(struct f2fs_sb_info *sbi,
 		if (test_opt(sbi, LFS) && current->plug)
 			blk_finish_plug(current->plug);
 
+		if (F2FS_IO_ALIGNED(sbi))
+			goto submit_io;
+
 		start = bio->bi_iter.bi_size >> F2FS_BLKSIZE_BITS;
 		start %= F2FS_IO_SIZE(sbi);
 
@@ -607,7 +610,8 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 		__submit_merged_bio(io);
 alloc_new:
 	if (io->bio == NULL) {
-		if ((fio->type == DATA || fio->type == NODE) &&
+		if (F2FS_IO_ALIGNED(sbi) &&
+				(fio->type == DATA || fio->type == NODE) &&
 				fio->new_blkaddr & F2FS_IO_SIZE_MASK(sbi)) {
 			dec_page_count(sbi, WB_DATA_TYPE(bio_page));
 			fio->retry = true;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 18584d4c078a..4887e2ff0ff8 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3129,12 +3129,14 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 		f2fs_inode_chksum_set(sbi, page);
 	}
 
+	if (F2FS_IO_ALIGNED(sbi))
+		fio->retry = false;
+
 	if (add_list) {
 		struct f2fs_bio_info *io;
 
 		INIT_LIST_HEAD(&fio->list);
 		fio->in_list = true;
-		fio->retry = false;
 		io = sbi->write_io[fio->type] + fio->temp;
 		spin_lock(&io->io_lock);
 		list_add_tail(&fio->list, &io->io_list);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
