Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C27C7281DB3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Oct 2020 23:32:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kOSfa-0005xz-HL; Fri, 02 Oct 2020 21:32:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kOSfZ-0005xm-97
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Oct 2020 21:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cXITP5jhssfPcLriSK7Nh9AHnTDT5tOv9r/df9xLyJ8=; b=WQJooHcPWNDk2vrV4xLifDSzDx
 wrV17aqgZ81fRaJ2Yrg+yrWXbr8aexYRz9HBWZiMA74ydT71ouWHTPevdZjpdh+hd5mzLm/FZzs+t
 Boct2h7wJ9LNIGDYa2BgURz/vKyj4Jt1qViP8N5XnhBcv2eyQdp+VJ/pslOuPb6i6kUM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cXITP5jhssfPcLriSK7Nh9AHnTDT5tOv9r/df9xLyJ8=; b=e
 279XOfI1kTbChtzkZ3/WhnLzzCWLRNPEfwZWwWBOcAZCWN1T1eJj5JfdNemh4u2VEITX8rHOwdSOw
 0dYunbgnOs8V2nFgfPX6GCXxMFRQrfiHk3sTtEcATwahLfse3yx/KNCDYujIjBk2fh1+pS5aUC7Mi
 4sL9RolfvekhXNlU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kOSfJ-00EcBT-6n
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Oct 2020 21:32:49 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1B43206DB;
 Fri,  2 Oct 2020 21:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601674347;
 bh=BXnB7D0dGvSDenDoY22oXd0SzTll4rH2ewFNsGCrSQA=;
 h=From:To:Cc:Subject:Date:From;
 b=LR7U+bEt/2/CNKafgRz9yu9mA1CtUmFoFJ3bsUQ4A+2jE3r+O/Mim0orfIExLNY0u
 wq+A4QhtpDPSXKtSVPIjuNbaoB3Zkq7YCYuT37VAZVOdg7S76w8uOrrqNDzxj//szF
 UFpZxz8cXufw1DsTb8hN5+RY0UAv7vVBxlQbPgME=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  2 Oct 2020 14:32:26 -0700
Message-Id: <20201002213226.2862930-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kOSfJ-00EcBT-6n
Subject: [f2fs-dev] [PATCH] f2fs: f2fs_get_meta_page_nofail should not be
 failed
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

Otherwise, f2fs can break the the consistency.
(e.g., BUG_ON in f2fs_get_sum_page)

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c | 9 +++------
 fs/f2fs/f2fs.h       | 2 --
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index f18386d30f031..7bb3a741a8f16 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -110,15 +110,12 @@ struct page *f2fs_get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index)
 struct page *f2fs_get_meta_page_nofail(struct f2fs_sb_info *sbi, pgoff_t index)
 {
 	struct page *page;
-	int count = 0;
-
 retry:
 	page = __get_meta_page(sbi, index, true);
 	if (IS_ERR(page)) {
-		if (PTR_ERR(page) == -EIO &&
-				++count <= DEFAULT_RETRY_IO_COUNT)
-			goto retry;
-		f2fs_stop_checkpoint(sbi, false);
+		f2fs_flush_merged_writes(sbi);
+		congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
+		goto retry;
 	}
 	return page;
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9d58fd5dae139..d905edb42c327 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -595,8 +595,6 @@ enum {
 					 */
 };
 
-#define DEFAULT_RETRY_IO_COUNT	8	/* maximum retry read IO count */
-
 /* congestion wait timeout value, default: 20ms */
 #define	DEFAULT_IO_TIMEOUT	(msecs_to_jiffies(20))
 
-- 
2.28.0.806.g8561365e88-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
