Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7CEAFD469
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:05:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txR868N3aJVes+g8tT+b2uyoFmS6OqpQlt/zG/olp0s=; b=XPQkjK9LDv4twNpCsoBcklslFK
	MvRM7goRtRO4U4slgYCqOsGMU1qM6aKumDoLT8EyG8SGDa0sKFaR0RxupQAEbXfotN6fCUFxnmkrM
	v9V8x/tiWcPpBZMQ1fa9eK//GVoJCXaJLkMVAq/u09CYC9iBGxkDuScuVONLtd9qVkg4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBkz-0005lV-3D;
	Tue, 08 Jul 2025 17:05:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjx-0005Wy-L5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZskhtZXIOkW0EpZtkCvrqd18jrvXAqL2b5rZXmvtpZk=; b=nNkXzoKhw939F+ZRvlbQZI7Cz2
 vHlBrIvIvEe6rZeLDQGaZh/u1tO2OwKQ2akNLNdpG9cL6ZaZEachi3arIHsU2x7om/jow5j+6I2Of
 YJd5HJoqNN1Wrl37cpo3LBL12fJcIB7lviUAS2Xcf9sHSY80I+9kuor3hBDP/h433ITw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZskhtZXIOkW0EpZtkCvrqd18jrvXAqL2b5rZXmvtpZk=; b=NGla/DtHwckSiGCCmxKbnj+udX
 Ws2o3G8a8Jh14heI6eaxXD92d7FzS+V3TlXCTQPwg+KUkmsGxdfHnp+An8E+YTgKmt9+rIACgk4V8
 8wWeztwXPphEWlF8B7H/cnWFtvVaP8x58dVNFg1BG0NEw0fYTr5Ez0CLyFnLhnI1e4Ck=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjs-0006FE-OH for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ZskhtZXIOkW0EpZtkCvrqd18jrvXAqL2b5rZXmvtpZk=; b=ARxs0TGFstisfhaBL8K1IVb+iI
 28I6QKkEnm5WNSWgLFO0e+ORcFMqDhYlV3KCV3FoA8PIwDLzm9IWoyJszpbgteBLK/7v4CrwyvvsD
 CwVBIaBTXBzcpeO4rMTj3IPGeNV2Xo7FZEWFD/vlNWMev5irvKm/Z6XtrjlRBpFlpSCUbVSD231h2
 3uLfb39WL3z35BgP0M124FBsUX1N532m4vglEBb/xV6JpSTfQir96/uJnzDu8DGBEK0xHBdhKfdtG
 Boj3neQe5Mgnrowwv6O76IWLX4I/r6+TDgcdLzYk8Qi8X6SZIXuKs4EuOC33+TPUBTdtQhIOVk8xN
 MUXc3HyQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjh-00000000T5o-0zHk;
 Tue, 08 Jul 2025 17:04:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:23 +0100
Message-ID: <20250708170359.111653-27-willy@infradead.org>
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
 Content preview:  One caller passes NULL and the other caller already has a
 folio so pass it in. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/f2fs.h | 2 +- fs/f2fs/node.c | 6 +++--- fs/f2fs/recovery.c |
 2 +- 3 files changed, 5 insertions(+), 5 deletions(-) 
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
X-Headers-End: 1uZBjs-0006FE-OH
Subject: [f2fs-dev] [PATCH 26/60] f2fs: Pass a folio to
 f2fs_recover_xattr_data()
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

One caller passes NULL and the other caller already has a folio so
pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h     | 2 +-
 fs/f2fs/node.c     | 6 +++---
 fs/f2fs/recovery.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 49312008fedb..12b14fc406c5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3790,7 +3790,7 @@ void f2fs_alloc_nid_done(struct f2fs_sb_info *sbi, nid_t nid);
 void f2fs_alloc_nid_failed(struct f2fs_sb_info *sbi, nid_t nid);
 int f2fs_try_to_free_nids(struct f2fs_sb_info *sbi, int nr_shrink);
 int f2fs_recover_inline_xattr(struct inode *inode, struct folio *folio);
-int f2fs_recover_xattr_data(struct inode *inode, struct page *page);
+int f2fs_recover_xattr_data(struct inode *inode, struct folio *folio);
 int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct folio *folio);
 int f2fs_restore_node_summary(struct f2fs_sb_info *sbi,
 			unsigned int segno, struct f2fs_summary_block *sum);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 89a27bbc0226..f8620b262b72 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2753,7 +2753,7 @@ int f2fs_recover_inline_xattr(struct inode *inode, struct folio *folio)
 	return 0;
 }
 
-int f2fs_recover_xattr_data(struct inode *inode, struct page *page)
+int f2fs_recover_xattr_data(struct inode *inode, struct folio *folio)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	nid_t prev_xnid = F2FS_I(inode)->i_xattr_nid;
@@ -2791,8 +2791,8 @@ int f2fs_recover_xattr_data(struct inode *inode, struct page *page)
 	f2fs_update_inode_page(inode);
 
 	/* 3: update and set xattr node page dirty */
-	if (page) {
-		memcpy(F2FS_NODE(&xfolio->page), F2FS_NODE(page),
+	if (folio) {
+		memcpy(F2FS_NODE(&xfolio->page), F2FS_NODE(&folio->page),
 				VALID_XATTR_BLOCK_SIZE);
 		folio_mark_dirty(xfolio);
 	}
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 2de28bdfa670..01704055b4c2 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -633,7 +633,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		if (err)
 			goto out;
 	} else if (f2fs_has_xattr_block(ofs_of_node(&folio->page))) {
-		err = f2fs_recover_xattr_data(inode, &folio->page);
+		err = f2fs_recover_xattr_data(inode, folio);
 		if (!err)
 			recovered++;
 		goto out;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
