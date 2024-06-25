Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA0E915D38
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2024 05:16:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLwfN-0008Dl-UT;
	Tue, 25 Jun 2024 03:16:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sLwfM-0008De-7n
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 03:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0y43zDCR9fI7cbJlz/dt4FMK+xi2H8Eeded0fcxZd8c=; b=fc90baEKeiCev4ZGL8Z9qjZc49
 YyOCVsBNVmXeIKPOyOhL2UP3FOGquI9C9MmNVNKSX75RkEAohLfEkPTQWpQgppXJzWlLzfkmLwzUk
 tbS2XliT49Ht3g04LtH6tq1bEljBW5nqJn1zJAMwgpNKMVBydF7BiBKILc64U+gA0J+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0y43zDCR9fI7cbJlz/dt4FMK+xi2H8Eeded0fcxZd8c=; b=U+HP5+qiT3dlwnMw60nlEibOow
 5/cIIcBc0MEVy6TQVyI8Jn9d/ApSsLCKfEdhiT7qUObxF2sPvIveGHkvKVGTRqjJKtQLali5GSfqA
 CE4bor8Fex7i1GJOpYQsyFeQZymWNWaTy0QsnCNvEWE7tM0M7+6L5dRpVQ3LWdamg5OU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLwfL-0001ls-L2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 03:16:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 85BCC611D7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Jun 2024 03:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4220AC4AF0B;
 Tue, 25 Jun 2024 03:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719285373;
 bh=1Xrsez65ZNQvM4VETHD3Cc+794w9s8wbJDQWT8A9bok=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aP6Ktd72zH4tmfpw5JvKAlyDAamSyGpm45bdv9UPzcp1OL1jesqFzK66JbgS0/Bg7
 lJCqaaUmDmX3M9t0OrVRho6bPrDkLpkrEuYIKz4ENO5hJlNFV0b0ytlcIs4pDdg9q4
 QJBqvvgHrJgnq63GlSfUuBYADObly4jvSzYHR4ad8CCq+xNkJ/+fBrl+ur6PszOMl+
 Wsljxho2hatIz/2ViZ6SvSHo2NJZ7di8LVePEl8bM2XNhsBtFqtJXxnBSw1j2m55WX
 8aqRlnuP5FzEVnrRsXgSnemPoXIKTwc7tZnCa8LnzJjxH6JVqMYfvStcFQS33gEU0c
 9Yz7TDr7vNdXw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 25 Jun 2024 11:16:04 +0800
Message-Id: <20240625031604.3587691-3-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625031604.3587691-1-chao@kernel.org>
References: <20240625031604.3587691-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Introudce a new help get_dnode_base() to wrap common code
 from get_dnode_addr() and data_blkaddr() for cleanup. Signed-off-by: Chao
 Yu <chao@kernel.org> --- fs/f2fs/f2fs.h | 46 +++++++++++++++++++ 1 file
 changed, 19 insertions(+), 27 deletions(-) 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sLwfL-0001ls-L2
Subject: [f2fs-dev] [PATCH 3/3] f2fs: clean up data_blkaddr() and
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
 fs/f2fs/f2fs.h | 46 +++++++++++++++++++---------------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1f78a39fe7f4..eacf0b0e6b2e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2905,26 +2905,31 @@ static inline __le32 *blkaddr_in_node(struct f2fs_node *node)
 }
 
 static inline int f2fs_has_extra_attr(struct inode *inode);
-static inline block_t data_blkaddr(struct inode *inode,
-			struct page *node_page, unsigned int offset)
+static inline int get_extra_isize(struct inode *inode);
+static inline unsigned int get_dnode_base(struct inode *inode,
+					struct page *node_page)
 {
-	struct f2fs_node *raw_node;
-	__le32 *addr_array;
-	int base = 0;
-	bool is_inode = IS_INODE(node_page);
-
-	raw_node = F2FS_NODE(node_page);
-
-	if (is_inode) {
+	if (IS_INODE(node_page)) {
 		if (!inode)
 			/* from GC path only */
-			base = offset_in_addr(&raw_node->i);
+			return offset_in_addr(&F2FS_NODE(node_page)->i);
 		else if (f2fs_has_extra_attr(inode))
-			base = get_extra_isize(inode);
+			return get_extra_isize(inode);
 	}
+	return 0;
+}
 
-	addr_array = blkaddr_in_node(raw_node);
-	return le32_to_cpu(addr_array[base + offset]);
+static inline __le32 *get_dnode_addr(struct inode *inode,
+					struct page *node_page)
+{
+	return blkaddr_in_node(F2FS_NODE(node_page)) +
+			get_dnode_base(inode, node_page);
+}
+
+static inline block_t data_blkaddr(struct inode *inode,
+			struct page *node_page, unsigned int offset)
+{
+	return le32_to_cpu(*(get_dnode_addr(inode, node_page) + offset));
 }
 
 static inline block_t f2fs_data_blkaddr(struct dnode_of_data *dn)
@@ -3297,8 +3302,6 @@ static inline bool f2fs_is_cow_file(struct inode *inode)
 	return is_inode_flag_set(inode, FI_COW_FILE);
 }
 
-static inline __le32 *get_dnode_addr(struct inode *inode,
-					struct page *node_page);
 static inline void *inline_data_addr(struct inode *inode, struct page *page)
 {
 	__le32 *addr = get_dnode_addr(inode, page);
@@ -3437,17 +3440,6 @@ static inline int get_inline_xattr_addrs(struct inode *inode)
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
