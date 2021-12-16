Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FD8476D33
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Dec 2021 10:17:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mxmso-0004Uo-GI; Thu, 16 Dec 2021 09:17:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mxmsm-0004Ua-Ab
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Dec 2021 09:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vAk8uiqDiPlzUgOQwec03lvFAzrTRQe44F+sjNph6UQ=; b=kkuh/cdyjgw3UqmuU3BJ5uzS/f
 HCDz4LOnfq87nq2J+TkYZ9V8Ixfe+Y2A2l0BhMWJ5VF5mLr1a8bF0DukKmsboMa7YBSoC5z9eaHxJ
 HiT+aDw1IZMa/+nIQrp5lUocHM8DMyNjPcqkT/cKZ9EQ9M0VKaST06xJLKfC/jsq/Vdw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vAk8uiqDiPlzUgOQwec03lvFAzrTRQe44F+sjNph6UQ=; b=Y
 l5GZuVOiGKHfg1v0A2mFg6FnPs2+r8dKlbrbOPu+ImhDG+HcGprPqS+gV2KePXNe1qMBiIvlP8rZX
 fwAZ2vtXTUUSQZSAnpZRmazok08RIfBs82MiZdLp4PjG+p1rzP6CB/sHBRSKxAMZsAfEMr5KI3+76
 G1NGsZ/Sl4QGY4zk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mxmsk-0002By-Qm
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Dec 2021 09:17:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 629C8B822F7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Dec 2021 09:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC68C36AE4;
 Thu, 16 Dec 2021 09:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639646208;
 bh=P1QMsZOfJCidhTVblCUZbljZNHmQSIofc23szP58Yfs=;
 h=From:To:Cc:Subject:Date:From;
 b=DFrCYxOkDBttlIkWihE1W31BqMtAassuxaqmldX2dXRcU88cix4mMhlTXCRm8cHwg
 8CHG2uAZ3edZxoqM6l1abgouMBN/pu+nvtU3xGQKhyNibSuZlT54Rr5pYOkqKKieSr
 10xk+THV2jkfqQDLncju/wfOUlauI3lD0NTppzXyO8HU8+2HujGaDBJzEsRmvJwStx
 q5j7TN7kXUOuADNbpU6toWU9kUNOG7XliaQP8fB6G8CIyYNk9S7x09qUIMSk/90836
 08daGI92Mf9mGA5rDk5E5ZG1+pclzgK0bCyyHB+tjAJ16P70sGURLWYUJkbOZuOb59
 nDjYZAXmLuhNw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 16 Dec 2021 17:08:30 +0800
Message-Id: <20211216090830.5461-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For compressed inode, in .{invalidate, release}page, we will
 call f2fs_invalidate_compress_pages() to drop all compressed page cache of
 current inode. But we don't need to drop compressed page cache synchronously
 in .invalidatepage, because, all trancation paths of compressed physical
 block has been covered with f2fs_invalidate_compress_page(). 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mxmsk-0002By-Qm
Subject: [f2fs-dev] [PATCH] f2fs: don't drop compressed page cache in
 .{invalidate, release}page
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

For compressed inode, in .{invalidate,release}page, we will call
f2fs_invalidate_compress_pages() to drop all compressed page cache of
current inode.

But we don't need to drop compressed page cache synchronously in
.invalidatepage, because, all trancation paths of compressed physical
block has been covered with f2fs_invalidate_compress_page().

And also we don't need to drop compressed page cache synchronously
in .releasepage, because, if there is out-of-memory, we can count
on page cache reclaim on sbi->compress_inode.

BTW, this patch may fix the issue reported below:

https://lore.kernel.org/linux-f2fs-devel/20211202092812.197647-1-changfengnan@vivo.com/T/#u

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2737fcc0dbcf..40274c32dbc0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3528,12 +3528,9 @@ void f2fs_invalidate_page(struct page *page, unsigned int offset,
 
 	clear_page_private_gcing(page);
 
-	if (test_opt(sbi, COMPRESS_CACHE)) {
-		if (f2fs_compressed_file(inode))
-			f2fs_invalidate_compress_pages(sbi, inode->i_ino);
-		if (inode->i_ino == F2FS_COMPRESS_INO(sbi))
-			clear_page_private_data(page);
-	}
+	if (test_opt(sbi, COMPRESS_CACHE) &&
+			inode->i_ino == F2FS_COMPRESS_INO(sbi))
+		clear_page_private_data(page);
 
 	if (page_private_atomic(page))
 		return f2fs_drop_inmem_page(inode, page);
@@ -3552,15 +3549,10 @@ int f2fs_release_page(struct page *page, gfp_t wait)
 	if (page_private_atomic(page))
 		return 0;
 
-	if (test_opt(F2FS_P_SB(page), COMPRESS_CACHE)) {
-		struct f2fs_sb_info *sbi = F2FS_P_SB(page);
-		struct inode *inode = page->mapping->host;
-
-		if (f2fs_compressed_file(inode))
-			f2fs_invalidate_compress_pages(sbi, inode->i_ino);
-		if (inode->i_ino == F2FS_COMPRESS_INO(sbi))
-			clear_page_private_data(page);
-	}
+	if (test_opt(F2FS_P_SB(page), COMPRESS_CACHE) &&
+			inode->i_ino ==
+			F2FS_COMPRESS_INO(F2FS_I_SB(page->mapping->host)))
+		clear_page_private_data(page);
 
 	clear_page_private_gcing(page);
 
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
