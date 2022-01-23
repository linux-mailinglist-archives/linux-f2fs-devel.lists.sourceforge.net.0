Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E54B6496E60
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 23 Jan 2022 01:11:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nBQTw-0003ec-Jl; Sun, 23 Jan 2022 00:11:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sashal@kernel.org>) id 1nBQTw-0003eQ-4z
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 23 Jan 2022 00:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q5HfF0NGriJVC7KM5G6/4Yj+qcvHBUtWUiIR38EzSrI=; b=baoL/8+QhSfxrEGgXgObjdleRr
 s2YQK1B2dCY/r5macEz1wUp3uJOP4/M+KYlCsQrKkc7HAWBd/4TC7aAfrPo7/ltvH83dnEk4HVuE1
 KadRE8P8y7sZmYZaYd0RQofDqeHrQUvtm3CxEsNleb4yqdRc/hSxB20msMwjVq2kgfec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q5HfF0NGriJVC7KM5G6/4Yj+qcvHBUtWUiIR38EzSrI=; b=KvDe4x/ktQgvEb1SIiXWa2d8Sd
 FBiVWjDcTaKEh2ibWaj6yEn8A6d3I1rICqTaUugamCj7LbBhAG9qed1QCtpkmXhPTyn+Ozwj3xeJk
 y9jEvDVt5gXo12FD/yq072SGz0tXnpftzGbcITMIlP9DTiTfPtrsjwo6KH1OyE0CxuXc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nBQTs-007tMI-L0
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 23 Jan 2022 00:11:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 65300B8075F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 23 Jan 2022 00:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68139C340E2;
 Sun, 23 Jan 2022 00:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642896689;
 bh=BrDSlStalQdzU+ebZKUiYrJ4gnOOGfjJ74pdXELcfhg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=knxN9uTBTWJvUvYlSyTwpXBH2k9XC3lfzdh35ihT1oW2A74o7/w8xGiGkDqpchXtr
 6tThhkWYGnXj2N4myk5Bj3+N3xa1r+FhpLmEO4bOaUCFJEITQh8DXBRtddZzdV/xhj
 O9EwT8gKlSZ8D4dFoPQL3FxprYTXIua2VdpM1S0XUVr7m/H31lWRBLlAtOvzGBq2r6
 qrqeorGFgNrL3D4w9/+IqfEPDuyvPwDCTS/k+mOuRx/nrijiFiJY6oaQGFlRmxX48s
 l1Vqk5F4bDrKrod8qa0dAY59Q1Fsq3dZ+0hjtO/eeY3vzUCVIjUrRRbYqdWWazY55T
 FKi5CBg4Y19NQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat, 22 Jan 2022 19:10:56 -0500
Message-Id: <20220123001113.2460140-3-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123001113.2460140-1-sashal@kernel.org>
References: <20220123001113.2460140-1-sashal@kernel.org>
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
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nBQTs-007tMI-L0
Subject: [f2fs-dev] [PATCH AUTOSEL 5.16 03/19] f2fs: don't drop compressed
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
index 9f754aaef558b..7ee105eb6940a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3770,12 +3770,9 @@ void f2fs_invalidate_page(struct page *page, unsigned int offset,
 
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
@@ -3795,12 +3792,9 @@ int f2fs_release_page(struct page *page, gfp_t wait)
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
