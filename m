Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB03476D4B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Dec 2021 10:21:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mxmxY-0004oT-JZ; Thu, 16 Dec 2021 09:21:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mxmxX-0004oJ-Gz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Dec 2021 09:21:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sZxkQch9Wjj3fCKZ7WctrRLGSpGBmyljqvEVegQzhfs=; b=MMhWKGXc3S5o++z9opqRJMa8c0
 2l8Yf/7sxCIQx+H0+QKD5z3LUv4NKSC3uJaurUTFJfi4juoMxxF9MrU3sT3tLEliZmQNvBSEEWQdz
 wj0X74zaM9T8QPOUOrzAzjGTSj1sYoK0/uwc+Bq792YEePB8x7rIVoqiFyrfHLHp68S8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sZxkQch9Wjj3fCKZ7WctrRLGSpGBmyljqvEVegQzhfs=; b=X
 42skVc1QHkSAzzt14EcuY6/fTMKVSBEa3dq9VnmXSE3giwdVpjXg37yWOveFeKOcOao2ROKsUn1AI
 S/aoyy21p46CnitZaq5fqZcSm4dnkTWgHUPZKc9fgsuihw3LeyYuw5VDciLzV2c7Kyb+K4nQ/HHTN
 BnVBh53bc0JzuZXs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mxmxW-0002TC-R1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Dec 2021 09:21:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97592B8226E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Dec 2021 09:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BA9C36AE2;
 Thu, 16 Dec 2021 09:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639646507;
 bh=tzWUoBZu6KNUUnzAoW8OFL7Sa0PqRes0tnj2oCB60S4=;
 h=From:To:Cc:Subject:Date:From;
 b=FVOl0Djy+1dkAYkfmwBnhdKzO3GX1UtE8jtEhj1npdu0jkt44isid8TNH//5AQxnm
 qyfuj3LenlnscPFcbADLqLR3E3TyYAekRWigvRdbDbieUroC8IYByznNam4isnKMdj
 ld8U5w9s/1f5yQkPUtDJrdllZhXhfSKOEX80XB4EZD0mwofMM7sRFU6vLW97dw838S
 nj7OxNco6ZjS+1bsIKkF4jTsr+nzr1XMTDdG4wPLF7fSIKxWPxYNDq7z7kxZw+oMrI
 FI2KtCBMIpZaFMAf1KcdBG4IqtdINHNpOXeWrcMWboEEziOx82jXm8U3yFa71S0EaU
 MoIHeKrVdNwtA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 16 Dec 2021 17:13:56 +0800
Message-Id: <20211216091356.6643-1-chao@kernel.org>
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
X-Headers-End: 1mxmxW-0002TC-R1
Subject: [f2fs-dev] [PATCH v2] f2fs: don't drop compressed page cache in
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
v2:
- fix compile error.
 fs/f2fs/data.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2737fcc0dbcf..0fc6e0245732 100644
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
@@ -3553,12 +3550,9 @@ int f2fs_release_page(struct page *page, gfp_t wait)
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
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
