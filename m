Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D369866AFA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 08:36:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1reVXA-0004FC-6v;
	Mon, 26 Feb 2024 07:36:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1reVWm-0004EN-EF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 07:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5HG4MWd5T3KHVIQNzZO3t4OTPKGD3eDzImKMZe1jtqs=; b=ESHf3T75NYZ/EZbvrGrZ4/kxvf
 BVqUfe/0lrlpt+e5EAU8b1dzpBiaGAUAbodsFNvmn39BRN0Z9fcPVMtIQSX+vmTcsg3QwUxK4HttW
 WPTEzTqvdTmUcFNtC4yY1R3VInUY+XQ3fXGo2ErRuOk7NXWZ3ZL0j+BF8QDVNxP2bAR0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5HG4MWd5T3KHVIQNzZO3t4OTPKGD3eDzImKMZe1jtqs=; b=b
 sCNSBoscwbucRf9/LzJKAQoghjW96sywCr8ArpFyx1K7296dSPlwvKVL5A+ux9Jrm9qT9hyBm6F5E
 9woVmMjCt5C+VBW0tMUmhJaOFbs7QeExt2zGdFXV/6dVbJVgbGhQAelKmFLb3QxfEiCTSAZowltXP
 Y9baY912dLnASbrA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1reVWm-0002xs-It for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 07:35:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 31E3560F32
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Feb 2024 07:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BAF0C43390;
 Mon, 26 Feb 2024 07:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708932945;
 bh=xYW4vWigmlTDvWjBbKDHIv6Pc+z/yoRDygV1eUyCs3s=;
 h=From:To:Cc:Subject:Date:From;
 b=Xa7ptxQB7eVKCaBz+kFs8H+z7DLqwuPctA+AeKlsNaiFrv8t3/L5MS6DC2ogMVQKU
 fRFMU95DpzuU2UkSVvoAtyMVWWwm3ZLhJD9uzvyjoYGhb4CtbptUmqApgi9IZGwadZ
 SygTwNGQWG9BzOCywONdVGxk+fm9PpOTqukLesEZVh9+l2dojQR9j/6IxA3+QXywvo
 f9jVeYxRcOceEb7rdkuIMJ4IjViJiXhtxEgQAUUFO6h8gSIURMT3G/HN9FcSGHYyxi
 TJANZ9ZO1xm3fwXVJRRQGocuKpVfyEREn06qnV0bvSRqSrT157YcnSfz0ZGS4OTEQ7
 GQLZE7t3BmFrQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 26 Feb 2024 15:35:38 +0800
Message-Id: <20240226073539.2509926-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Mapping info from dump.f2fs: i_addr[0x2d] cluster flag
 [0xfffffffe
 : 4294967294] i_addr[0x2e] [0x 10428 : 66600] i_addr[0x2f] [0x 10429 : 66601]
 i_addr[0x30] [0x 1042a : 66602] f2fs_io fiemap 37 1
 /mnt/f2fs/disk-58390c8c.raw
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1reVWm-0002xs-It
Subject: [f2fs-dev] [PATCH 1/2] f2fs: ro: compress: fix to avoid caching
 unaligned extent
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

Mapping info from dump.f2fs:
i_addr[0x2d] cluster flag    		[0xfffffffe : 4294967294]
i_addr[0x2e]                 		[0x   10428 : 66600]
i_addr[0x2f]                 		[0x   10429 : 66601]
i_addr[0x30]                 		[0x   1042a : 66602]

f2fs_io fiemap 37 1 /mnt/f2fs/disk-58390c8c.raw

Previsouly, it missed to align fofs and ofs_in_node to cluster_size,
result in adding incorrect read extent cache, fix it.

Before:
f2fs_update_read_extent_tree_range: dev = (253,48), ino = 5, pgofs = 37, len = 4, blkaddr = 66600, c_len = 3

After:
f2fs_update_read_extent_tree_range: dev = (253,48), ino = 5, pgofs = 36, len = 4, blkaddr = 66600, c_len = 3

Fixes: 94afd6d6e525 ("f2fs: extent cache: support unaligned extent")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 10 ++++++----
 fs/f2fs/f2fs.h     |  6 ++++--
 fs/f2fs/node.c     | 20 ++++++++++++++------
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index f821681886b8..21f03d119d4d 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1841,16 +1841,18 @@ void f2fs_put_page_dic(struct page *page, bool in_task)
  * check whether cluster blocks are contiguous, and add extent cache entry
  * only if cluster blocks are logically and physically contiguous.
  */
-unsigned int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn)
+unsigned int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn,
+						unsigned int ofs_in_node)
 {
-	bool compressed = f2fs_data_blkaddr(dn) == COMPRESS_ADDR;
+	bool compressed = data_blkaddr(dn->inode, dn->node_page,
+					ofs_in_node) == COMPRESS_ADDR;
 	int i = compressed ? 1 : 0;
 	block_t first_blkaddr = data_blkaddr(dn->inode, dn->node_page,
-						dn->ofs_in_node + i);
+							ofs_in_node + i);
 
 	for (i += 1; i < F2FS_I(dn->inode)->i_cluster_size; i++) {
 		block_t blkaddr = data_blkaddr(dn->inode, dn->node_page,
-						dn->ofs_in_node + i);
+							ofs_in_node + i);
 
 		if (!__is_valid_data_blkaddr(blkaddr))
 			break;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 51701fc66200..33fd02716cf3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4307,7 +4307,8 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc);
 void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
 				bool in_task);
 void f2fs_put_page_dic(struct page *page, bool in_task);
-unsigned int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn);
+unsigned int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn,
+						unsigned int ofs_in_node);
 int f2fs_init_compress_ctx(struct compress_ctx *cc);
 void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse);
 void f2fs_init_compress_info(struct f2fs_sb_info *sbi);
@@ -4364,7 +4365,8 @@ static inline void f2fs_put_page_dic(struct page *page, bool in_task)
 {
 	WARN_ON_ONCE(1);
 }
-static inline unsigned int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn) { return 0; }
+static inline unsigned int f2fs_cluster_blocks_are_contiguous(
+			struct dnode_of_data *dn, unsigned int ofs_in_node) { return 0; }
 static inline bool f2fs_sanity_check_cluster(struct dnode_of_data *dn) { return false; }
 static inline int f2fs_init_compress_inode(struct f2fs_sb_info *sbi) { return 0; }
 static inline void f2fs_destroy_compress_inode(struct f2fs_sb_info *sbi) { }
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 51241996b9ec..b3de6d6cdb02 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -852,21 +852,29 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 
 	if (is_inode_flag_set(dn->inode, FI_COMPRESSED_FILE) &&
 					f2fs_sb_has_readonly(sbi)) {
-		unsigned int c_len = f2fs_cluster_blocks_are_contiguous(dn);
+		unsigned int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
+		unsigned int ofs_in_node = dn->ofs_in_node;
+		pgoff_t fofs = index;
+		unsigned int c_len;
 		block_t blkaddr;
 
+		/* should align fofs and ofs_in_node to cluster_size */
+		if (fofs % cluster_size) {
+			fofs = round_down(fofs, cluster_size);
+			ofs_in_node = round_down(ofs_in_node, cluster_size);
+		}
+
+		c_len = f2fs_cluster_blocks_are_contiguous(dn, ofs_in_node);
 		if (!c_len)
 			goto out;
 
-		blkaddr = f2fs_data_blkaddr(dn);
+		blkaddr = data_blkaddr(dn->inode, dn->node_page, ofs_in_node);
 		if (blkaddr == COMPRESS_ADDR)
 			blkaddr = data_blkaddr(dn->inode, dn->node_page,
-						dn->ofs_in_node + 1);
+						ofs_in_node + 1);
 
 		f2fs_update_read_extent_tree_range_compressed(dn->inode,
-					index, blkaddr,
-					F2FS_I(dn->inode)->i_cluster_size,
-					c_len);
+					fofs, blkaddr, cluster_size, c_len);
 	}
 out:
 	return 0;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
