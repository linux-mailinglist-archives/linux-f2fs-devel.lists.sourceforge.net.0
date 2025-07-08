Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD5BAFD443
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFgQwAxPTQXmYmm8bAroAiFsVu2s5ZmEm91zhEeZHDo=; b=cw3cu3oRQSE+vXV3Cf1o6lBVN3
	zXZA85D8j7dAqxWT0HwdO/ZKbs5TaHSqmKsBCBoZz2i6GKu03D0iA1YWcUrnBW2HgE7n0ketdJsWT
	7HLpPUE0kj08vr9ccOQ8fCzmv+5EpA7sZVB6YThV6NLCHAL8XxPGmoq2YTiSLfVS5hkA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjz-0002rK-JE;
	Tue, 08 Jul 2025 17:04:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjv-0002op-25
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RzMIoFDrYKuHOjNXRCDwMP/5XvlwhDVx7Y+zC/b4d6s=; b=TbheN33GJVwwFHXt29+9T2/ji3
 EZJi17iV+agnmU3iJRogrspmJu6Z/M9CFCLJ24rFysEej4O/v6jW7EiOoxJiLfZL6k4/Qn3TxjGny
 /vXlzBF7EzeTniHtzTqeNM1lB0QbzfuwcO7tVJ7ooc6+oDnVRwOvBvsPeqhYoogUKKnY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RzMIoFDrYKuHOjNXRCDwMP/5XvlwhDVx7Y+zC/b4d6s=; b=klLLojjMBVW51mgxY2mYNK7lpe
 Nf/3QommamLxJBhhR/VxF0XxAr2Jk+F4dIuAUTd81hlWWEXEz1nfKkVWNFSi9eWGbWWSwjqtpo/G4
 qi5qR/aLUBGUbd1NWOsQFjNWNSrxopILZJHijKKJoEZrUFmaycOdl1nX8+xdcPv6i9rM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjr-0006Es-O3 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=RzMIoFDrYKuHOjNXRCDwMP/5XvlwhDVx7Y+zC/b4d6s=; b=ljQD9PtyJ8HMa22TshFjW9xS4O
 PuEVC8s0Ha+2d4waOkMO/mfrlwEuHl3bc78SXUriBSeiGhgjYBtiOH8lSPQmYQtjxb5/PIc0GG+W0
 KKhxgC3QK054plpW3jL5mS8+enOIMmTWKe5ze2jeiLJIdkHl4Y05QY99E1RfFId+c3+KEfE3i6LQH
 giMn2g91gOc/jSsRIyvpZ7hNb9LnVFTCO1h6XDYPhGHV6v6DArPSW7ehLaAn7B/0F1B4ceKxKqVY3
 kgCxsMj8LsIFM7+gF/7N75gsPlcr95Q5tQ/2oghbFunEmPbNBrC8GCK8km019bRnI3twx8sYGl4MU
 p9u8g3Tw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjg-00000000T56-1SgU;
 Tue, 08 Jul 2025 17:04:04 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:16 +0100
Message-ID: <20250708170359.111653-20-willy@infradead.org>
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
 Content preview: Both callers have a folio so pass it in. Signed-off-by:
 Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/inode.c | 8 ++++---- 1
 file changed, 4 insertions(+), 4 deletions(-) diff --git a/fs/f2fs/inode.c
 b/fs/f2fs/inode.c index bee6b0970e7b..61fd96f0a1ff 100644 ---
 a/fs/f2fs/inode.c +++ b/fs/f2fs/inode.c @@ -134, 9 +134,
 9 @@ bool f2fs_enable_inode_chksum(struct f2fs_sb_info [...] 
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
X-Headers-End: 1uZBjr-0006Es-O3
Subject: [f2fs-dev] [PATCH 19/60] f2fs: Pass a folio to f2fs_inode_chksum()
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

Both callers have a folio so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/inode.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index bee6b0970e7b..61fd96f0a1ff 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -134,9 +134,9 @@ bool f2fs_enable_inode_chksum(struct f2fs_sb_info *sbi, struct folio *folio)
 	return true;
 }
 
-static __u32 f2fs_inode_chksum(struct f2fs_sb_info *sbi, struct page *page)
+static __u32 f2fs_inode_chksum(struct f2fs_sb_info *sbi, struct folio *folio)
 {
-	struct f2fs_node *node = F2FS_NODE(page);
+	struct f2fs_node *node = F2FS_NODE(&folio->page);
 	struct f2fs_inode *ri = &node->i;
 	__le32 ino = node->footer.ino;
 	__le32 gen = ri->i_generation;
@@ -175,7 +175,7 @@ bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct folio *folio)
 
 	ri = &F2FS_NODE(&folio->page)->i;
 	provided = le32_to_cpu(ri->i_inode_checksum);
-	calculated = f2fs_inode_chksum(sbi, &folio->page);
+	calculated = f2fs_inode_chksum(sbi, folio);
 
 	if (provided != calculated)
 		f2fs_warn(sbi, "checksum invalid, nid = %lu, ino_of_node = %x, %x vs. %x",
@@ -192,7 +192,7 @@ void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct folio *folio)
 	if (!f2fs_enable_inode_chksum(sbi, folio))
 		return;
 
-	ri->i_inode_checksum = cpu_to_le32(f2fs_inode_chksum(sbi, &folio->page));
+	ri->i_inode_checksum = cpu_to_le32(f2fs_inode_chksum(sbi, folio));
 }
 
 static bool sanity_check_compress_inode(struct inode *inode,
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
