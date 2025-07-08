Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C62FAFD44B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mHGQkHF06Fa+V/JHRl9JDl6G3acDjIY81c8NxzBARM=; b=kWTFo0jXYVqI4VvDutd19JPw+u
	eaeqAvcVqQwoR/+jGuCpal2koURs2RMwJ2gXWJsBetUzUu0Yl+XilM5y2y8hf0dspfXIsVpY1Blxe
	fkLl6hsncvsJk453BrgBbqOKp64Pd5deo7XWb3P/PV4egecqUXEsojk4HZKfTgm54TtU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBk1-0005Y3-5K;
	Tue, 08 Jul 2025 17:04:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjp-0005VY-UU
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eu9UD8iu7xPsbGU4aKxkaCFKIKIdliK98Iiqssp2Aq8=; b=YWbEuLowCEBezBY1KZzJNLx2Y3
 EGhqOpnd9CBtUIqFDKt+q5IiZqh9bVjKtSWnIJq30SjD9scPgENielsNIXcowIAX/Pkx+7snio4L5
 RWPW2sn4Rw5X+3x8aIjm12/FNBTkvVVpBk7m1eS1Cc9Xy482OZz4iRoX2UBzmdqp4TUk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eu9UD8iu7xPsbGU4aKxkaCFKIKIdliK98Iiqssp2Aq8=; b=V4f6Rkiarv0ziBFZvBzkryxp2t
 ZBZuc4flkjehdfE5oDIRWH0mkC+dXsuD/3nddczZbPnm0ewSmLDcBKOilvxVOgeYoTV1f8XnjI+6G
 ZBi6h//cj+x0IiPtBDX1duHkVo2Hhh2jcP7dQy3YMflQh6WNE6K9QRy0jSQvvfOlxXjk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjm-0006E3-Jx for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=eu9UD8iu7xPsbGU4aKxkaCFKIKIdliK98Iiqssp2Aq8=; b=qEK4UNJaD5MC6aa/ycQxI0UcDP
 LguCt7jjzPN4MOYFpjD8RMHzXmtE1sxGnEEtBHrYsnsjKESmBekIA2o6YwTeJpoX8rTCAODDMQ1uc
 STMQ4oLZlOCXMl/AA2rxi2dQjerjU+wi2ZBE3stF678nm2W79HEmB9g3nxQiGYeFgPANo+qhLSD1L
 oZPWgsN5ApUOgRkIH9vZi7UAUOcgvyQX6CEamcCdBvMem1VEHv4RatqmJV/KNOhnB9nHSurvdwwV5
 173YWk7HOa9+vTuPgcXglOD6mQxfkhQCD6W6g13ilBt7aW9hckxs29FkHEkp/VbtyrAyhacRXYQGs
 02f41C4A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjg-00000000T50-0sjX;
 Tue, 08 Jul 2025 17:04:04 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:15 +0100
Message-ID: <20250708170359.111653-19-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: All callers have a folio so pass it in. Signed-off-by:
 Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/inode.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-) diff --git a/fs/f2fs/inode.c
 b/fs/f2fs/inode.c index 0a071ce586fa..bee6b0970e7b 100644 ---
 a/fs/f2fs/inode.c +++ b/fs/f2fs/inode.c @@ -116, 14 +116,
 15 @@ static void __recover_inline_status(struct inod [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBjm-0006E3-Jx
Subject: [f2fs-dev] [PATCH 18/60] f2fs: Pass a folio to
 f2fs_enable_inode_chksum()
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

All callers have a folio so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/inode.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 0a071ce586fa..bee6b0970e7b 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -116,14 +116,15 @@ static void __recover_inline_status(struct inode *inode, struct folio *ifolio)
 	return;
 }
 
-static bool f2fs_enable_inode_chksum(struct f2fs_sb_info *sbi, struct page *page)
+static
+bool f2fs_enable_inode_chksum(struct f2fs_sb_info *sbi, struct folio *folio)
 {
-	struct f2fs_inode *ri = &F2FS_NODE(page)->i;
+	struct f2fs_inode *ri = &F2FS_NODE(&folio->page)->i;
 
 	if (!f2fs_sb_has_inode_chksum(sbi))
 		return false;
 
-	if (!IS_INODE(page) || !(ri->i_inline & F2FS_EXTRA_ATTR))
+	if (!IS_INODE(&folio->page) || !(ri->i_inline & F2FS_EXTRA_ATTR))
 		return false;
 
 	if (!F2FS_FITS_IN_INODE(ri, le16_to_cpu(ri->i_extra_isize),
@@ -164,9 +165,9 @@ bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct folio *folio)
 		return true;
 
 #ifdef CONFIG_F2FS_CHECK_FS
-	if (!f2fs_enable_inode_chksum(sbi, &folio->page))
+	if (!f2fs_enable_inode_chksum(sbi, folio))
 #else
-	if (!f2fs_enable_inode_chksum(sbi, &folio->page) ||
+	if (!f2fs_enable_inode_chksum(sbi, folio) ||
 			folio_test_dirty(folio) ||
 			folio_test_writeback(folio))
 #endif
@@ -188,7 +189,7 @@ void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct folio *folio)
 {
 	struct f2fs_inode *ri = &F2FS_NODE(&folio->page)->i;
 
-	if (!f2fs_enable_inode_chksum(sbi, &folio->page))
+	if (!f2fs_enable_inode_chksum(sbi, folio))
 		return;
 
 	ri->i_inode_checksum = cpu_to_le32(f2fs_inode_chksum(sbi, &folio->page));
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
