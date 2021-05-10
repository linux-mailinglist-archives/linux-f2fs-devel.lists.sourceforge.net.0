Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB4D3790B6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 16:28:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg6tT-0003Vo-1e; Mon, 10 May 2021 14:28:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lg6tR-0003Vh-Qg
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 14:28:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fq1b+Isl5+gYnWSx7qYVRyoUAr9cXF9uxU922Q4uDU8=; b=dh9Mpk/XhprQvMLyDq2zNg3ffD
 amONjEGb903liig+7cYQv6dRqZyin7IFP1zK07rVQxIvfIaihVo1UF3vEDyVoitWpO58Wy7w3NGsS
 jNKvqvo8pjY5UFqsXbWy0iIVrrsKshpJJXzTkxzYBDtNIbLAuSEmNIGoruUuvPU3SMjg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fq1b+Isl5+gYnWSx7qYVRyoUAr9cXF9uxU922Q4uDU8=; b=N
 CbKb0EhMR0MUZiwhnKenVhNLazDzlvyQdByKuf0lp/OXpOaAuE2umYlVCpRm4W9z1dKkPxTC3be8Y
 v7x15NPdAbOyf6boSG8yNvCYcYcPXCnd8uBrMKzyDMid4sElzQ0NOtqS16CrMYFNs9sv0Tyxvrtg2
 MsVev4JRSK5neanI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lg6tL-0003kg-JE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 14:28:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2091611F0;
 Mon, 10 May 2021 14:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620656890;
 bh=5Qx2wMQY09P/jiz+QyXoXliDQV06oKwVi44Sr9uGsVA=;
 h=From:To:Cc:Subject:Date:From;
 b=n7DQ+ePe8MZ/W7CimYXZFPNzOE2FndNoWEPR8x0U22UVREFxJqX/XHbh1VJDAfNkg
 3DqJom5OmACR5RAparxHCl1akePyOJy5N+T2ywJeG83VMXW6c4KLpe8H3KXCG3DbNP
 NRVLHKM+Vavik1dfRoR5AfBZrZQT/P64EfFpunNiZh4oXoNkfNizJsdI9kbPfAmW9r
 krRxiPrxLc+AYkGspZm9ZjIrRQ1C80XqDOvTD+hsYIpKct/KYFOLvM5+98t1zllQq4
 LcmVGOUCyoXQinz2z2EpF7Be5pbOuizu1JpEoIiYNTYvugS1KgPq13oHI2j5rqSp2l
 DRFddyGFb2SUQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 10 May 2021 07:28:04 -0700
Message-Id: <20210510142804.511265-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lg6tL-0003kg-JE
Subject: [f2fs-dev] [PATCH] f2fs: avoid null pointer access when handling
 IPU error
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

 Unable to handle kernel NULL pointer dereference at virtual address 000000000000001a
 pc : f2fs_inplace_write_data+0x144/0x208
 lr : f2fs_inplace_write_data+0x134/0x208
 Call trace:
  f2fs_inplace_write_data+0x144/0x208
  f2fs_do_write_data_page+0x270/0x770
  f2fs_write_single_data_page+0x47c/0x830
  __f2fs_write_data_pages+0x444/0x98c
  f2fs_write_data_pages.llvm.16514453770497736882+0x2c/0x38
  do_writepages+0x58/0x118
  __writeback_single_inode+0x44/0x300
  writeback_sb_inodes+0x4b8/0x9c8
  wb_writeback+0x148/0x42c
  wb_do_writeback+0xc8/0x390
  wb_workfn+0xb0/0x2f4
  process_one_work+0x1fc/0x444
  worker_thread+0x268/0x4b4
  kthread+0x13c/0x158
  ret_from_fork+0x10/0x18

Fixes: 955772787667 ("f2fs: drop inplace IO if fs status is abnormal")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c605415840b5..ae875557d693 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3577,9 +3577,11 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 	if (fio->bio) {
 		struct bio *bio = *(fio->bio);
 
-		bio->bi_status = BLK_STS_IOERR;
-		bio_endio(bio);
-		fio->bio = NULL;
+		if (bio) {
+			bio->bi_status = BLK_STS_IOERR;
+			bio_endio(bio);
+			fio->bio = NULL;
+		}
 	}
 	return err;
 }
-- 
2.31.1.607.g51e8a6a459-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
