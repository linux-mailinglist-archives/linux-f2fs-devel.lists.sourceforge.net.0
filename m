Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0448D9AC49
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Aug 2019 11:59:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i16LT-0006B9-Q0; Fri, 23 Aug 2019 09:58:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i16LR-0006Af-VU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 09:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bhq636ZG7nDUJ2RppwUvIPicNn8z7cSISIPgFZxbUFc=; b=H+fPl42eW03+DW+FiBj0mjJXil
 UoXAE98FfFsT3B/uZzWUoghockXBetfxwMj0+KhvpcRJI000qYZ47txcBJl8Qe+yw9ReXRE/Vl9M5
 atiX7BeGj7Yp6oIjEoGcFGsA1aWqhvy2Bc8z3dmC1fs+K5M76tiaTOmtmFe5y9r+QVRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bhq636ZG7nDUJ2RppwUvIPicNn8z7cSISIPgFZxbUFc=; b=BZ6V9d8JwxP4ztBhcA3A72un+w
 BoXAapdLtokIVsRVq5PwUROWDgid+U8jSydf6vpY46MDJiU6FTWNsOjog7PwBA6kCmukuFZ92SZHR
 l4nQfDCUQe0F0ANC41/My6S/Xl2Yp/+v0wVTlHxZDBekrc9Mmljm45/6u8oIjuBAn734=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i16LO-00HFEd-A8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 09:58:57 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A5C1524C3D1AA0FF058E;
 Fri, 23 Aug 2019 17:58:46 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Fri, 23 Aug 2019 17:58:39 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 23 Aug 2019 17:58:35 +0800
Message-ID: <20190823095836.28569-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20190823095836.28569-1-yuchao0@huawei.com>
References: <20190823095836.28569-1-yuchao0@huawei.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i16LO-00HFEd-A8
Subject: [f2fs-dev] [PATCH 2/3] f2fs: clean up __bio_alloc()'s parameter
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

Just cleanup, no logic change.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9fcfbd4f0b8c..769c548e955a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -259,26 +259,25 @@ static bool __same_bdev(struct f2fs_sb_info *sbi,
 /*
  * Low-level block read/write IO operations.
  */
-static struct bio *__bio_alloc(struct f2fs_sb_info *sbi, block_t blk_addr,
-				struct writeback_control *wbc,
-				int npages, bool is_read,
-				enum page_type type, enum temp_type temp)
+static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 {
+	struct f2fs_sb_info *sbi = fio->sbi;
 	struct bio *bio;
 
 	bio = f2fs_bio_alloc(sbi, npages, true);
 
-	f2fs_target_device(sbi, blk_addr, bio);
-	if (is_read) {
+	f2fs_target_device(sbi, fio->new_blkaddr, bio);
+	if (is_read_io(fio->op)) {
 		bio->bi_end_io = f2fs_read_end_io;
 		bio->bi_private = NULL;
 	} else {
 		bio->bi_end_io = f2fs_write_end_io;
 		bio->bi_private = sbi;
-		bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi, type, temp);
+		bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi,
+						fio->type, fio->temp);
 	}
-	if (wbc)
-		wbc_init_bio(wbc, bio);
+	if (fio->io_wbc)
+		wbc_init_bio(fio->io_wbc, bio);
 
 	return bio;
 }
@@ -461,8 +460,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	f2fs_trace_ios(fio, 0);
 
 	/* Allocate a new bio */
-	bio = __bio_alloc(fio->sbi, fio->new_blkaddr, fio->io_wbc,
-				1, is_read_io(fio->op), fio->type, fio->temp);
+	bio = __bio_alloc(fio, 1);
 
 	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
 		bio_put(bio);
@@ -538,8 +536,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 	}
 alloc_new:
 	if (!bio) {
-		bio = __bio_alloc(fio->sbi, fio->new_blkaddr, fio->io_wbc,
-				BIO_MAX_PAGES, false, fio->type, fio->temp);
+		bio = __bio_alloc(fio, BIO_MAX_PAGES);
 		bio_set_op_attrs(bio, fio->op, fio->op_flags);
 	}
 
@@ -616,9 +613,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 			fio->retry = true;
 			goto skip;
 		}
-		io->bio = __bio_alloc(sbi, fio->new_blkaddr, fio->io_wbc,
-						BIO_MAX_PAGES, false,
-						fio->type, fio->temp);
+		io->bio = __bio_alloc(fio, BIO_MAX_PAGES);
 		io->fio = *fio;
 	}
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
