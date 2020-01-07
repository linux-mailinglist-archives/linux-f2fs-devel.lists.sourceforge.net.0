Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CD2131D78
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jan 2020 03:07:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ioeHK-0000Xk-CQ; Tue, 07 Jan 2020 02:07:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ioeHJ-0000Xd-Hx
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jan 2020 02:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kIsuTAx47TH5fb7e4+0knAfYnPHfrTRVbW372x8XTHU=; b=Ksd8nofOU/QvyPC7sQcVmf0xD5
 eBIx8oDkFfdoYwE25sUjBEaMLwSFTYvdA7RDgDc+8K3cWNOFMMTSkFqZM33wG4KdRelCrVBQdU6Ht
 3espgmhYe4RlGwcDmIBZiZaTeukqPsSlrAqG6tHno16mjap7JlEjRsDzLwvnbOvCKtBE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kIsuTAx47TH5fb7e4+0knAfYnPHfrTRVbW372x8XTHU=; b=L
 MDimGtGhzQW0Sp5BhPRLVnwArGfb7JRQ1PkcAGbuRt/c8GYq/mdvmTF5KMxQQg0ji3AgUgsfmKjDn
 qnzztWYb7eYR84wO5So0JU+EHw3Mcuk4nidPHjRaYh3hS3Z+ED9kL9ziZDGhdI7RYtQGKRG3F4kXp
 02FLlgMJ88O0fP9U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ioeH9-00C4ho-C4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jan 2020 02:07:29 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3698220715;
 Tue,  7 Jan 2020 02:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578362831;
 bh=YcE7t3XTXnWAd1OgFRbOFUYls33MgydieLk49V9wlMo=;
 h=From:To:Cc:Subject:Date:From;
 b=vezTOWd0ixvoWWuFn6wO4gzSDKGJRXQvt1n2BqRAjS8PVfRmy0K8SnTvPzk9CaTXw
 xQza6b7eSgZWexdMy5yb6m1KH7ZsjPIN6ljLDCOcDSjIzMuxtJWXNew12Bh3xusjbO
 fooTSb3l4VsR17zcbyftv/q16FxjU+TEDedPzOjY=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  6 Jan 2020 18:07:09 -0800
Message-Id: <20200107020709.73568-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1ioeH9-00C4ho-C4
Subject: [f2fs-dev] [PATCH] f2fs: add a way to turn off ipu bio cache
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

Setting 0x40 in /sys/fs/f2fs/dev/ipu_policy gives a way to turn off
bio cache, which is useufl to check whether block layer using hardware
encryption engine merges IOs correctly.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/filesystems/f2fs.txt | 1 +
 fs/f2fs/segment.c                  | 2 +-
 fs/f2fs/segment.h                  | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
index 41b5aa94b30f..cd93bcc34726 100644
--- a/Documentation/filesystems/f2fs.txt
+++ b/Documentation/filesystems/f2fs.txt
@@ -335,6 +335,7 @@ Files in /sys/fs/f2fs/<devname>
                                0x01: F2FS_IPU_FORCE, 0x02: F2FS_IPU_SSR,
                                0x04: F2FS_IPU_UTIL,  0x08: F2FS_IPU_SSR_UTIL,
                                0x10: F2FS_IPU_FSYNC.
+			       0x40: F2FS_IPU_NOCACHE disables bio caches.
 
  min_ipu_util                 This parameter controls the threshold to trigger
                               in-place-updates. The number indicates percentage
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a9519532c029..311fe4937f6a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3289,7 +3289,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 
 	stat_inc_inplace_blocks(fio->sbi);
 
-	if (fio->bio)
+	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 << F2FS_IPU_NOCACHE)))
 		err = f2fs_merge_page_bio(fio);
 	else
 		err = f2fs_submit_page_bio(fio);
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index a1b3951367cd..02e620470eef 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -623,6 +623,7 @@ enum {
 	F2FS_IPU_SSR_UTIL,
 	F2FS_IPU_FSYNC,
 	F2FS_IPU_ASYNC,
+	F2FS_IPU_NOCACHE,
 };
 
 static inline unsigned int curseg_segno(struct f2fs_sb_info *sbi,
-- 
2.24.0.525.g8f36a354ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
