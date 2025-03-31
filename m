Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF5EA76EB6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWS-0001C8-Kg;
	Mon, 31 Mar 2025 20:14:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVl-0000nQ-0l
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xFrYxw7V6grK07g0qEgQgN3yzDxYFEiQap0wdE0Hzuk=; b=OtktbDh8eMsJf0tFbOttMAyXDc
 o2aaQwByZUq6ryVzuVCjgznlO4UR835BsEdz0S/qsMMGbKlGZICruclh3/D5My0gRWMwTjSllfPif
 pcrDzlUAcKfbola1XUuX+qw08a3BEGG7IjLHNiJODXpgY4xI94s1Kv+GJjYKS1t2OnnM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xFrYxw7V6grK07g0qEgQgN3yzDxYFEiQap0wdE0Hzuk=; b=T6umyJinelDEbOnbdCIzgk//c8
 9skcFshQZbwBEw2jyKIU5sjEWazit4cRUDlTTyX+OXVQLlQkiI6H9bPBSNt/Eans76pQWKiu1O+cW
 JNo4stKc52cGmuFIcw98CKOKSAWFTZdq8cSLTuX/DZR19shUOgDiA8ikzBiYz7j5O2o0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVk-0003gH-Si for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=xFrYxw7V6grK07g0qEgQgN3yzDxYFEiQap0wdE0Hzuk=; b=GbShTCMH3/41p53XBtsn0HDPWj
 q3iijQy1omvZWKqKpVNg68vesXFxA7zZVfylQkay7w8v3yxI60BR8J/nrnAk7qwK3xi3x7Y2FWiWe
 KA0iZTv3ZKMv3F4n3bGnTqFx2gmTr3tbCWHUhp6tC4hcYGQYIfi3G5M5hQ77UL1Ss8yFP7teFNY6o
 JftYADxjKhRYgS/IVDZpAp2l5J9krt7piLRKs7KkVPMaXLWGyLSTNaHR1Dky30/Hgl0PWsA/pseaq
 dDNgxKjtR1+o66WU4rvuF74zmAkyhQL+fpTXrBo1mDmJ4k5wFVJ13RFuHgpD8toJa3IkRlM11WMKk
 JBVKJ+MQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVZ-00000004SSJ-2C2Z;
 Mon, 31 Mar 2025 20:13:21 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:19 +0100
Message-ID: <20250331201256.1057782-120-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  All callers now have a folio, so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/f2fs.h | 4 ++--
 fs/f2fs/node.c | 4 ++-- fs/f2fs/xattr.c | 8 ++++---- 3 files changed,
 8 insertions(+), 8 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVk-0003gH-Si
Subject: [f2fs-dev] [PATCH 119/153] f2fs: Pass a folio to inline_xattr_addr()
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

All callers now have a folio, so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h  | 4 ++--
 fs/f2fs/node.c  | 4 ++--
 fs/f2fs/xattr.c | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8e700621ee9d..60381c3c3d9b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3334,9 +3334,9 @@ static inline unsigned int addrs_per_page(struct inode *inode,
 	return addrs;
 }
 
-static inline void *inline_xattr_addr(struct inode *inode, struct page *page)
+static inline void *inline_xattr_addr(struct inode *inode, struct folio *folio)
 {
-	struct f2fs_inode *ri = F2FS_INODE(page);
+	struct f2fs_inode *ri = F2FS_INODE(&folio->page);
 
 	return (void *)&(ri->i_addr[DEF_ADDRS_PER_INODE -
 					get_inline_xattr_addrs(inode)]);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 8a4466d99589..e9e33241e762 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2738,8 +2738,8 @@ int f2fs_recover_inline_xattr(struct inode *inode, struct folio *folio)
 		goto update_inode;
 	}
 
-	dst_addr = inline_xattr_addr(inode, &ifolio->page);
-	src_addr = inline_xattr_addr(inode, &folio->page);
+	dst_addr = inline_xattr_addr(inode, ifolio);
+	src_addr = inline_xattr_addr(inode, folio);
 	inline_size = inline_xattr_size(inode);
 
 	f2fs_folio_wait_writeback(ifolio, NODE, true, true);
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index c07b3d7c45fa..58632a2b6613 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -280,13 +280,13 @@ static int read_inline_xattr(struct inode *inode, struct folio *ifolio,
 	void *inline_addr;
 
 	if (ifolio) {
-		inline_addr = inline_xattr_addr(inode, &ifolio->page);
+		inline_addr = inline_xattr_addr(inode, ifolio);
 	} else {
 		folio = f2fs_get_inode_folio(sbi, inode->i_ino);
 		if (IS_ERR(folio))
 			return PTR_ERR(folio);
 
-		inline_addr = inline_xattr_addr(inode, &folio->page);
+		inline_addr = inline_xattr_addr(inode, folio);
 	}
 	memcpy(txattr_addr, inline_addr, inline_size);
 	f2fs_folio_put(folio, true);
@@ -447,14 +447,14 @@ static inline int write_all_xattrs(struct inode *inode, __u32 hsize,
 	/* write to inline xattr */
 	if (inline_size) {
 		if (ifolio) {
-			inline_addr = inline_xattr_addr(inode, &ifolio->page);
+			inline_addr = inline_xattr_addr(inode, ifolio);
 		} else {
 			in_folio = f2fs_get_inode_folio(sbi, inode->i_ino);
 			if (IS_ERR(in_folio)) {
 				f2fs_alloc_nid_failed(sbi, new_nid);
 				return PTR_ERR(in_folio);
 			}
-			inline_addr = inline_xattr_addr(inode, &in_folio->page);
+			inline_addr = inline_xattr_addr(inode, in_folio);
 		}
 
 		f2fs_folio_wait_writeback(ifolio ? ifolio : in_folio,
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
