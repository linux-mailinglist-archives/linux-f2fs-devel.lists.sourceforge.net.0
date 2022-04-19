Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED1D507C3D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 23:57:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngvqY-0005lz-4m; Tue, 19 Apr 2022 21:57:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1ngvqW-0005lt-IO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 21:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MTNI0XB1tzAEaq1u03KZ+KGvWfVfgypHylWI7IOzW78=; b=BZ8c7ah1XTDj2f4NjFuPFmkmWV
 EGyMChEW3Pi/pOPug5pzIGW8UWdwMnGKVd+Tl8Ml0YXn3OF73KvGDZw+RDl1rA0k4uxY+nt8n914h
 SEue2NbTuGGy3mN3erTqgAdOjNom8GxY8xkSmEJfoX2rUqeGSYwjf9yKiMq9yOdMAw6s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MTNI0XB1tzAEaq1u03KZ+KGvWfVfgypHylWI7IOzW78=; b=X
 HAA6dMbK9vdZ0p9OV72xKduQ1cKwnPBOEKL5dcYziB1DzFXwD29rP3hVXXnnJkh0Sr7NFcfS3BDGX
 nw+7raVRJ7FZEBtrNKmjRSJs12EodYSh83hPQ4sDKOJFIV6us7XLblEzhteQpto9w1UR8H+wboA+A
 Gp8f9MQ1EEool7Qs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngvqU-004DFI-VN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 21:57:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE41F617BA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Apr 2022 21:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8239AC385A7;
 Tue, 19 Apr 2022 21:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650405424;
 bh=kvg9SXGdehN1yOUx+2cqBh0ZkhYF9DmxMqwB+3v5TRY=;
 h=From:To:Cc:Subject:Date:From;
 b=FhDIRLS2h0svfjr2wUFu6dKceIwBtTeYDlXfEG2hYER1g6bhyhUV0YwByzPI3HP1P
 ofvp4mrRiTMElQRuvcz3vGHMCbZ+l3mAasdHUELl6QKizFhvOj+nMfJdQrHEx4oVm3
 x/AU2g++u/xAom9mU7ihOkN4+U+xTMnatk2/lNCFBfVp/VXajUh+kxNtf9g3w8ngXw
 tmdVHXeHtsmqyZRUkM4S/aHcECet9RxEt7Wjl/JBY87UccD/z8TftMJc2PVtMI6eNo
 7DT6v+H8PRmaEdvlqrD7DAnFWvTjaW9XMQU2TqGXxpPfwJkHxyzslhxSbmfF3jPrGy
 NxKq+Zpzsd6vw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 19 Apr 2022 14:57:03 -0700
Message-Id: <20220419215703.1271395-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The block layer for zoned disk can reorder the FUA'ed IOs.
 Let's use flush command to keep the write order. Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org> --- fs/f2fs/file.c | 4 +++- fs/f2fs/node.c | 2 +- 2
 files changed, 4 insertions(+), 2 deletions(-) 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ngvqU-004DFI-VN
Subject: [f2fs-dev] [PATCH] f2fs: use flush command instead of FUA for zoned
 device
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

The block layer for zoned disk can reorder the FUA'ed IOs. Let's use flush
command to keep the write order.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 4 +++-
 fs/f2fs/node.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f08e6208e183..2aef0632f35b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -372,7 +372,9 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 	f2fs_remove_ino_entry(sbi, ino, APPEND_INO);
 	clear_inode_flag(inode, FI_APPEND_WRITE);
 flush_out:
-	if (!atomic && F2FS_OPTION(sbi).fsync_mode != FSYNC_MODE_NOBARRIER)
+	if ((!atomic && F2FS_OPTION(sbi).fsync_mode != FSYNC_MODE_NOBARRIER) ||
+			(atomic && !test_opt(sbi, NOBARRIER) &&
+					f2fs_sb_has_blkzoned(sbi)))
 		ret = f2fs_issue_flush(sbi, inode->i_ino);
 	if (!ret) {
 		f2fs_remove_ino_entry(sbi, ino, UPDATE_INO);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index c280f482c741..7224a980056f 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1633,7 +1633,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 		goto redirty_out;
 	}
 
-	if (atomic && !test_opt(sbi, NOBARRIER))
+	if (atomic && !test_opt(sbi, NOBARRIER) && !f2fs_sb_has_blkzoned(sbi))
 		fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
 
 	/* should add to global list before clearing PAGECACHE status */
-- 
2.36.0.rc0.470.gd361397f0d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
