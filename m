Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2D2496E7C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 23 Jan 2022 01:12:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nBQUl-0003iF-TO; Sun, 23 Jan 2022 00:12:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sashal@kernel.org>) id 1nBQUk-0003i9-Fk
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 23 Jan 2022 00:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vq1kuWP1p2VZx+balyDac0UBV+vnNMYHXa0K91FRP0g=; b=javmPOtVsLhs2BmSRrwUsJE9UY
 vkuVLbKcQ9qEVzV9IvLPrqKSbNgpypJK5TlF8M/cHKaGhE6Zsq5AqftP0k6xEfURka+rxx6wHPCKc
 u3DYYJTYimNPjeiJqmRpdAvzaJclRKBcRYPKegCjnVyfpP2/5oKG7HdURYMIyn/to5Xg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vq1kuWP1p2VZx+balyDac0UBV+vnNMYHXa0K91FRP0g=; b=YzNpiXmgw1QH0zQCr+vvJ5NXsJ
 x4pQb6ZopNhYiFgz1HchvSW6bxBJSJfKVCyPjuYtyWetPtZkmpS/7pQ6ZHjitEn2vvNVaFXjJ3w20
 wjR//szt68+DCiYbhwxKG4x7Yh0awJUVhqmkX2fMKsYCaVGz+53Qg1KHd51odX8Hv3Sk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nBQUh-0000FP-PO
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 23 Jan 2022 00:12:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 91D0B60FD7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 23 Jan 2022 00:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B438DC340E2;
 Sun, 23 Jan 2022 00:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642896741;
 bh=GIY153ZvKfvQuNYDLicwOPgKn62OaYHA8oRdOYRdUUA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ti84i3EIJkIDYG3JvtqH8z3NcvEtfetsyv5X+84jwnXn0NldfhP5FIOxZLpwnZKvI
 SWXzCQv81eAiCUks8bNR3Nu9pMHJZniHndBg0NkdadF6DvJXHcZHlQQl0xigiuGAV1
 qx3lPX6bdplKK+tVl6twX4F7OwHFV9uz5HbuuxpGRo4YZr1JsLKQtI4c/DMTFFWHjP
 VjgKBwp5blYPagHolQjIeu829LByy8oLKefu+KSaMf8H6gAthLvn53H4SmFDfTxwxz
 3394SlS77RoW/F7fxCni06AWZ0n0T+zA591ZKtBjBzimCJoaMH59OjbxkTxS9bc+s6
 04bNGHbphDhfg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat, 22 Jan 2022 19:12:02 -0500
Message-Id: <20220123001216.2460383-3-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123001216.2460383-1-sashal@kernel.org>
References: <20220123001216.2460383-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 2a64e303e3051550c75897239174e399dfcb8b7e
 ] For compressed inode, in .{invalidate, release}page,
 we will call f2fs_invalidate_compress_pages()
 to drop all compressed page cache of current inode. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nBQUh-0000FP-PO
Subject: [f2fs-dev] [PATCH AUTOSEL 5.15 03/16] f2fs: don't drop compressed
 page cache in .{invalidate, release}page
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

[ Upstream commit 2a64e303e3051550c75897239174e399dfcb8b7e ]

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
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/data.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f4fd6c246c9a9..ae50bdf19afc5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3717,12 +3717,9 @@ void f2fs_invalidate_page(struct page *page, unsigned int offset,
 
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
@@ -3742,12 +3739,9 @@ int f2fs_release_page(struct page *page, gfp_t wait)
 		return 0;
 
 	if (test_opt(F2FS_P_SB(page), COMPRESS_CACHE)) {
-		struct f2fs_sb_info *sbi = F2FS_P_SB(page);
 		struct inode *inode = page->mapping->host;
 
-		if (f2fs_compressed_file(inode))
-			f2fs_invalidate_compress_pages(sbi, inode->i_ino);
-		if (inode->i_ino == F2FS_COMPRESS_INO(sbi))
+		if (inode->i_ino == F2FS_COMPRESS_INO(F2FS_I_SB(inode)))
 			clear_page_private_data(page);
 	}
 
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
