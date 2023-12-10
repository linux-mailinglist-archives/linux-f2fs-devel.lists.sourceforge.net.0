Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECCD80B9FC
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Dec 2023 10:21:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rCFzw-0007b3-2Z;
	Sun, 10 Dec 2023 09:21:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rCFzu-0007ax-Os
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 09:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t1mFy5MqHYl9IZvWjQoiTSStN4TsgRcBm1BmXVteFVA=; b=IL5t7U16zap6hFOFI9E7giAznm
 76fFvBAcXTIyaKQWINSvswWoDOfywcpANuaxZGp9ZTQ0TvT4uW/XcCbfgEPrjQov8Xw7ec13SCbZH
 zGqt/VYQBLzSmEotjgtOxNZwbJZyBOfAwOFEkIPmHOj9qQq4FCQAG3j7CoHGNVNblqP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t1mFy5MqHYl9IZvWjQoiTSStN4TsgRcBm1BmXVteFVA=; b=Mm1e6Swbg8coj8of3qdjW/Duqr
 oTUCL69SrWj5lpXTjVtCL3AZTGx1nv/XqM92MAScvPebOWUdzFmchGG53GkZ+f7hQacon8YA9zvqE
 cuSxja7zRtC5/wpaluNslde1hspVUH/ZqWVhYvi1Pp3mgbo4xpViUyscIbFfAW8Cfz2M=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rCFzp-0002nH-0Z for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 09:21:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 18929B80A27
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Dec 2023 09:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F537C433C7;
 Sun, 10 Dec 2023 09:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702200051;
 bh=yOuZPXBjKzvohX2oVWWx3dWTtZRRyOJHZm+idQtSj7Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mUBmEZdRC92b5ppU7KkbM5o9GKhtV4T8mxVcHNQtSFi1TWK6ZZgU3pNRQTsxnksO0
 ZlH8O0D2n8ptGIZWKr9/wPIxREIvk+1tYykw+G94KFEcNueKjxl5VYj5ZnC3QhkWE1
 AwAqrNKyEEnOfv65Ie/zTHzBLa1mLP9gr5cEzhC0gzJBjD6fyC74o3hHyVARIDzbU5
 0jrHRuA9IjLXVS6b/2b7luEVW8xRiQIUf034T31RDcpG97OKjnQfZrEwy4KVTRFSk2
 V72N3Y3At8ehn+q19DYpuIycqo12FdUX8K8R0QVuQIu+tGdB5aQrD3PrrHsL6tHVVf
 +r+g/piIZcT3g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 10 Dec 2023 17:20:37 +0800
Message-Id: <20231210092040.3374741-3-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231210092040.3374741-1-chao@kernel.org>
References: <20231210092040.3374741-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Just cleanup,
 no logic changes. Signed-off-by: Chao Yu <chao@kernel.org>
 --- fs/f2fs/data.c | 11 ++--------- fs/f2fs/f2fs.h | 18 +++++++++++++++---
 fs/f2fs/file.c | 8 +------- fs/f2fs/inode.c | 32 ++++++++++++++ 4 [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rCFzp-0002nH-0Z
Subject: [f2fs-dev] [PATCH 3/6] f2fs: introduce get_dnode_addr() to clean up
 codes
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

Just cleanup, no logic changes.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c  | 11 ++---------
 fs/f2fs/f2fs.h  | 18 +++++++++++++++---
 fs/f2fs/file.c  |  8 +-------
 fs/f2fs/inode.c | 32 ++++++++++++++------------------
 4 files changed, 32 insertions(+), 37 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 7a81ff3c385a..ae46c4841ca9 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1181,16 +1181,9 @@ static int f2fs_submit_page_read(struct inode *inode, struct page *page,
 
 static void __set_data_blkaddr(struct dnode_of_data *dn)
 {
-	struct f2fs_node *rn = F2FS_NODE(dn->node_page);
-	__le32 *addr_array;
-	int base = 0;
+	__le32 *addr = get_dnode_addr(dn->inode, dn->node_page);
 
-	if (IS_INODE(dn->node_page) && f2fs_has_extra_attr(dn->inode))
-		base = get_extra_isize(dn->inode);
-
-	/* Get physical address of data block */
-	addr_array = blkaddr_in_node(rn);
-	addr_array[base + dn->ofs_in_node] = cpu_to_le32(dn->data_blkaddr);
+	addr[dn->ofs_in_node] = cpu_to_le32(dn->data_blkaddr);
 }
 
 /*
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2f1d76088953..a06b8aad5117 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3277,12 +3277,13 @@ static inline bool f2fs_is_cow_file(struct inode *inode)
 	return is_inode_flag_set(inode, FI_COW_FILE);
 }
 
+static inline __le32 *get_dnode_addr(struct inode *inode,
+					struct page *node_page);
 static inline void *inline_data_addr(struct inode *inode, struct page *page)
 {
-	struct f2fs_inode *ri = F2FS_INODE(page);
-	int extra_size = get_extra_isize(inode);
+	__le32 *addr = get_dnode_addr(inode, page);
 
-	return (void *)&(ri->i_addr[extra_size + DEF_INLINE_RESERVED_SIZE]);
+	return (void *)(addr + DEF_INLINE_RESERVED_SIZE);
 }
 
 static inline int f2fs_has_inline_dentry(struct inode *inode)
@@ -3427,6 +3428,17 @@ static inline int get_inline_xattr_addrs(struct inode *inode)
 	return F2FS_I(inode)->i_inline_xattr_size;
 }
 
+static inline __le32 *get_dnode_addr(struct inode *inode,
+					struct page *node_page)
+{
+	int base = 0;
+
+	if (IS_INODE(node_page) && f2fs_has_extra_attr(inode))
+		base = get_extra_isize(inode);
+
+	return blkaddr_in_node(F2FS_NODE(node_page)) + base;
+}
+
 #define f2fs_get_inode_mode(i) \
 	((is_inode_flag_set(i, FI_ACL_MODE)) ? \
 	 (F2FS_I(i)->i_acl_mode) : ((i)->i_mode))
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5025abf2d995..d0e7894e42d4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -557,20 +557,14 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
-	struct f2fs_node *raw_node;
 	int nr_free = 0, ofs = dn->ofs_in_node, len = count;
 	__le32 *addr;
-	int base = 0;
 	bool compressed_cluster = false;
 	int cluster_index = 0, valid_blocks = 0;
 	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
 	bool released = !atomic_read(&F2FS_I(dn->inode)->i_compr_blocks);
 
-	if (IS_INODE(dn->node_page) && f2fs_has_extra_attr(dn->inode))
-		base = get_extra_isize(dn->inode);
-
-	raw_node = F2FS_NODE(dn->node_page);
-	addr = blkaddr_in_node(raw_node) + base + ofs;
+	addr = get_dnode_addr(dn->inode, dn->node_page) + ofs;
 
 	/* Assumption: truncation starts with cluster */
 	for (; count > 0; count--, addr++, dn->ofs_in_node++, cluster_index++) {
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 108e3d00028a..b31410c4afbc 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -61,35 +61,31 @@ void f2fs_set_inode_flags(struct inode *inode)
 			S_ENCRYPTED|S_VERITY|S_CASEFOLD);
 }
 
-static void __get_inode_rdev(struct inode *inode, struct f2fs_inode *ri)
+static void __get_inode_rdev(struct inode *inode, struct page *node_page)
 {
-	int extra_size = get_extra_isize(inode);
+	__le32 *addr = get_dnode_addr(inode, node_page);
 
 	if (S_ISCHR(inode->i_mode) || S_ISBLK(inode->i_mode) ||
 			S_ISFIFO(inode->i_mode) || S_ISSOCK(inode->i_mode)) {
-		if (ri->i_addr[extra_size])
-			inode->i_rdev = old_decode_dev(
-				le32_to_cpu(ri->i_addr[extra_size]));
+		if (addr[0])
+			inode->i_rdev = old_decode_dev(le32_to_cpu(addr[0]));
 		else
-			inode->i_rdev = new_decode_dev(
-				le32_to_cpu(ri->i_addr[extra_size + 1]));
+			inode->i_rdev = new_decode_dev(le32_to_cpu(addr[1]));
 	}
 }
 
-static void __set_inode_rdev(struct inode *inode, struct f2fs_inode *ri)
+static void __set_inode_rdev(struct inode *inode, struct page *node_page)
 {
-	int extra_size = get_extra_isize(inode);
+	__le32 *addr = get_dnode_addr(inode, node_page);
 
 	if (S_ISCHR(inode->i_mode) || S_ISBLK(inode->i_mode)) {
 		if (old_valid_dev(inode->i_rdev)) {
-			ri->i_addr[extra_size] =
-				cpu_to_le32(old_encode_dev(inode->i_rdev));
-			ri->i_addr[extra_size + 1] = 0;
+			addr[0] = cpu_to_le32(old_encode_dev(inode->i_rdev));
+			addr[1] = 0;
 		} else {
-			ri->i_addr[extra_size] = 0;
-			ri->i_addr[extra_size + 1] =
-				cpu_to_le32(new_encode_dev(inode->i_rdev));
-			ri->i_addr[extra_size + 2] = 0;
+			addr[0] = 0;
+			addr[1] = cpu_to_le32(new_encode_dev(inode->i_rdev));
+			addr[2] = 0;
 		}
 	}
 }
@@ -463,7 +459,7 @@ static int do_read_inode(struct inode *inode)
 	}
 
 	/* get rdev by using inline_info */
-	__get_inode_rdev(inode, ri);
+	__get_inode_rdev(inode, node_page);
 
 	if (!f2fs_need_inode_block_update(sbi, inode->i_ino))
 		fi->last_disk_size = inode->i_size;
@@ -736,7 +732,7 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 		}
 	}
 
-	__set_inode_rdev(inode, ri);
+	__set_inode_rdev(inode, node_page);
 
 	/* deleted inode */
 	if (inode->i_nlink == 0)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
