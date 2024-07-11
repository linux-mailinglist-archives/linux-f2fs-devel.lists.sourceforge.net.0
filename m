Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FBF92DE1E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2024 03:46:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRitY-0001M4-IB;
	Thu, 11 Jul 2024 01:46:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sRitW-0001Lx-Ob
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jul 2024 01:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JqJ8SqMPwUyW5A4ojInIo9cjdgVxc19XS7VxyoTXZyA=; b=baX342glhGUhmKwD8Fnrhwjnwp
 Ea7fT7ZJiYCdEtC1wn4yTLPB617qnmg1Gso/X0HcLvTGtBuG71RtejsxeBIarm60JIbUHjPvX9jLm
 vPGQejlVWTl7zfI94L6eDYL5BTytcF1O1BNsi0ZeL4GYP01z3XvG7OgMK04BAKCUskPk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JqJ8SqMPwUyW5A4ojInIo9cjdgVxc19XS7VxyoTXZyA=; b=T
 CPBldW/qLuYKEUCxc55+93NPCMp9/5xzsOl17l6mv1DlKGTBzUV60JeIYaJJn/ffBOXVEnqxOuaVB
 fglXdW1jFbxgf/j8fmA9WrrX24UITUf5SMP3MGCTi21LBr2PpDelFdR/AuWRcpkUFSjOYZbJnRKAA
 xNGfRtWSh2opfJME=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRitX-0004H8-Mr for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jul 2024 01:46:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3EC80CE102B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jul 2024 01:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518CBC32781;
 Thu, 11 Jul 2024 01:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720662398;
 bh=XP/d/ZdSd0AByfrWjgBiH3rJMmDFKEO7x8m3AbPYooU=;
 h=From:To:Cc:Subject:Date:From;
 b=iXpvcxkRQ46ZCugwBTe9ZZDZVkvroa3ILeNC99WWxiJ4JevY7av1hkGbHIEC/8OIz
 ypWdXN0xMUTDt3DrriO5eiR4HiuchVmGDSXi3N/D+CynOkL54GEe7x6Hc8i5FIz8sC
 NGu5c57dsSyTjdjO46l7DWkJu4h2YGgUE524ByUTUyfHJrKyJHrVXOxusy7cVZma+1
 +iYbpzKybPpLf9Mi4k5yGTD3MWRcvnxC3Mog3EUEVB/fssd1HtAdTn6ogQVkrjxWbl
 OlWWXGTPJk9WQK0XV1NUaccYTC97ck/e2Y7FUjImYFTN8O5cNslPco2ankozGvkEg0
 BVNwM6e1nsmDQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 11 Jul 2024 09:46:32 +0800
Message-Id: <20240711014632.3927676-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Introudce a new help get_dnode_base() to wrap common code
 from get_dnode_addr() and data_blkaddr() for cleanup. Signed-off-by: Chao
 Yu <chao@kernel.org> --- v2: - clean up get_dnode_base() and remove redundant
 declaration suggested by Jaegeuk. fs/f2fs/f2fs.h | 46 +++++++++++++++++ 1
 [...] Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sRitX-0004H8-Mr
Subject: [f2fs-dev] [PATCH v2 3/3] f2fs: clean up data_blkaddr() and
 get_dnode_addr()
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

Introudce a new help get_dnode_base() to wrap common code from
get_dnode_addr() and data_blkaddr() for cleanup.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- clean up get_dnode_base() and remove redundant declaration suggested
by Jaegeuk.
 fs/f2fs/f2fs.h | 46 +++++++++++++++++-----------------------------
 1 file changed, 17 insertions(+), 29 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3948c181997f..2d810f97992b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2900,26 +2900,27 @@ static inline __le32 *blkaddr_in_node(struct f2fs_node *node)
 }
 
 static inline int f2fs_has_extra_attr(struct inode *inode);
-static inline block_t data_blkaddr(struct inode *inode,
-			struct page *node_page, unsigned int offset)
+static inline unsigned int get_dnode_base(struct inode *inode,
+					struct page *node_page)
 {
-	struct f2fs_node *raw_node;
-	__le32 *addr_array;
-	int base = 0;
-	bool is_inode = IS_INODE(node_page);
+	if (!IS_INODE(node_page))
+		return 0;
 
-	raw_node = F2FS_NODE(node_page);
+	return inode ? get_extra_isize(inode) :
+			offset_in_addr(&F2FS_NODE(node_page)->i);
+}
 
-	if (is_inode) {
-		if (!inode)
-			/* from GC path only */
-			base = offset_in_addr(&raw_node->i);
-		else if (f2fs_has_extra_attr(inode))
-			base = get_extra_isize(inode);
-	}
+static inline __le32 *get_dnode_addr(struct inode *inode,
+					struct page *node_page)
+{
+	return blkaddr_in_node(F2FS_NODE(node_page)) +
+			get_dnode_base(inode, node_page);
+}
 
-	addr_array = blkaddr_in_node(raw_node);
-	return le32_to_cpu(addr_array[base + offset]);
+static inline block_t data_blkaddr(struct inode *inode,
+			struct page *node_page, unsigned int offset)
+{
+	return le32_to_cpu(*(get_dnode_addr(inode, node_page) + offset));
 }
 
 static inline block_t f2fs_data_blkaddr(struct dnode_of_data *dn)
@@ -3292,8 +3293,6 @@ static inline bool f2fs_is_cow_file(struct inode *inode)
 	return is_inode_flag_set(inode, FI_COW_FILE);
 }
 
-static inline __le32 *get_dnode_addr(struct inode *inode,
-					struct page *node_page);
 static inline void *inline_data_addr(struct inode *inode, struct page *page)
 {
 	__le32 *addr = get_dnode_addr(inode, page);
@@ -3432,17 +3431,6 @@ static inline int get_inline_xattr_addrs(struct inode *inode)
 	return F2FS_I(inode)->i_inline_xattr_size;
 }
 
-static inline __le32 *get_dnode_addr(struct inode *inode,
-					struct page *node_page)
-{
-	int base = 0;
-
-	if (IS_INODE(node_page) && f2fs_has_extra_attr(inode))
-		base = get_extra_isize(inode);
-
-	return blkaddr_in_node(F2FS_NODE(node_page)) + base;
-}
-
 #define f2fs_get_inode_mode(i) \
 	((is_inode_flag_set(i, FI_ACL_MODE)) ? \
 	 (F2FS_I(i)->i_acl_mode) : ((i)->i_mode))
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
