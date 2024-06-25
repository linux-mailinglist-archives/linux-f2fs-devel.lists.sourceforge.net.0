Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D3C915D39
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2024 05:16:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLwfM-0002Nc-SS;
	Tue, 25 Jun 2024 03:16:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sLwfL-0002NV-OD
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 03:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=84+pn/lqan3N47R8gGvLXlaQqc/fX8OXzhOW+0UKk4Y=; b=EkKGiNIsSSgsPl1RxW03vemTZB
 pHWQ1r2wdAy6JguCUCmvMXVvYxLmzo6GG1JbfmeJsp64TDDJYxqfBSzdq7JYEu4C2JiNsq3y2avIH
 b7JQ5Ln/OHEXNFP5m0RcQ7bCSKpzOnUyj/wP6RowiVvsCBiB01eEGntfPHfkGKE9uhIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=84+pn/lqan3N47R8gGvLXlaQqc/fX8OXzhOW+0UKk4Y=; b=jYkk4KmmqxyzKt0qiIOmyP/a4x
 OtI5aKSMYvhhr9q+034MxZn/y1R+S+XgYCPQTeUELURVrXOm4j2O6/ehGwPSeFBgWzf0H2CypWbMV
 cOCOrZHc7BfxAjuoDw4vPEcdH6sqZX4KniL34/rvGv+fgBKtUIaQ5iS7aTQcCZA1tELc=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLwfL-0001lm-UY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 03:16:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7B8C7CE17BB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Jun 2024 03:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB0FC32789;
 Tue, 25 Jun 2024 03:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719285371;
 bh=bcfjSpR4747ly8u0IB5/5T8MV5FJsuo1UT28kexs9go=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N1qqYF7nhrmFEUJQRTPuqDOCe8hw81XtgvnojiHzy5xj3IEtSTPoRo33HJedaJUzN
 pDZlehNg42PKv1x8KzTYT0BierwehD/GiimORKBDZbSxC+Exr6cVkLzqagcqPwLz5e
 PAD/l1S1kRDOhp+9Eb7J68tilVMWQtGLTSe/Wrn7W20oU4/aBB/eUC9Fp4h1+5UPNl
 J/kxtJ7iUBEGXnVVXE4jmjqyMNCjDBIWvqntUEATsHz5tFlCYLmx4Wy20S+hOQRfQj
 ZVGFpgeICnxtkIhg4s2JkM7mYKNNBW8XnkJ4cfgBvktDvi18cM3VyyCkKBw5nx1K6o
 w4DjcahEZHhMg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 25 Jun 2024 11:16:03 +0800
Message-Id: <20240625031604.3587691-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625031604.3587691-1-chao@kernel.org>
References: <20240625031604.3587691-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Introduce a new help addrs_per_page() to wrap common code
 from addrs_per_inode() and addrs_per_block() for cleanup. Signed-off-by: Chao
 Yu <chao@kernel.org> --- fs/f2fs/f2fs.h | 20 +++++++ include/linux/f2fs_fs.h
 | 7 +++---- 2 files changed, 10 insertions(+), 17 deletions(-) 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sLwfL-0001lm-UY
Subject: [f2fs-dev] [PATCH 2/3] f2fs: clean up addrs_per_{inode,block}()
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

Introduce a new help addrs_per_page() to wrap common code
from addrs_per_inode() and addrs_per_block() for cleanup.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h          | 20 +++++++-------------
 include/linux/f2fs_fs.h |  7 +++----
 2 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 45451ca3b438..1f78a39fe7f4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3232,21 +3232,15 @@ static inline bool f2fs_need_compress_data(struct inode *inode)
 	return false;
 }
 
-static inline unsigned int addrs_per_inode(struct inode *inode)
+static inline unsigned int addrs_per_page(struct inode *inode,
+							bool is_inode)
 {
-	unsigned int addrs = CUR_ADDRS_PER_INODE(inode) -
-				get_inline_xattr_addrs(inode);
+	unsigned int addrs = is_inode ? (CUR_ADDRS_PER_INODE(inode) -
+			get_inline_xattr_addrs(inode)) : DEF_ADDRS_PER_BLOCK;
 
-	if (!f2fs_compressed_file(inode))
-		return addrs;
-	return ALIGN_DOWN(addrs, F2FS_I(inode)->i_cluster_size);
-}
-
-static inline unsigned int addrs_per_block(struct inode *inode)
-{
-	if (!f2fs_compressed_file(inode))
-		return DEF_ADDRS_PER_BLOCK;
-	return ALIGN_DOWN(DEF_ADDRS_PER_BLOCK, F2FS_I(inode)->i_cluster_size);
+	if (f2fs_compressed_file(inode))
+		return ALIGN_DOWN(addrs, F2FS_I(inode)->i_cluster_size);
+	return addrs;
 }
 
 static inline void *inline_xattr_addr(struct inode *inode, struct page *page)
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 41d1d71c36ff..01bee2b289c2 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -259,15 +259,14 @@ struct node_footer {
 #define CUR_ADDRS_PER_INODE(inode)	(DEF_ADDRS_PER_INODE - \
 					get_extra_isize(inode))
 #define DEF_NIDS_PER_INODE	5	/* Node IDs in an Inode */
-#define ADDRS_PER_INODE(inode)	addrs_per_inode(inode)
+#define ADDRS_PER_INODE(inode)	addrs_per_page(inode, true)
 /* Address Pointers in a Direct Block */
 #define DEF_ADDRS_PER_BLOCK	((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
-#define ADDRS_PER_BLOCK(inode)	addrs_per_block(inode)
+#define ADDRS_PER_BLOCK(inode)	addrs_per_page(inode, false)
 /* Node IDs in an Indirect Block */
 #define NIDS_PER_BLOCK		((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
 
-#define ADDRS_PER_PAGE(page, inode)	\
-	(IS_INODE(page) ? ADDRS_PER_INODE(inode) : ADDRS_PER_BLOCK(inode))
+#define ADDRS_PER_PAGE(page, inode)	(addrs_per_page(inode, IS_INODE(page)))
 
 #define	NODE_DIR1_BLOCK		(DEF_ADDRS_PER_INODE + 1)
 #define	NODE_DIR2_BLOCK		(DEF_ADDRS_PER_INODE + 2)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
