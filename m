Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FF7782D25
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Aug 2023 17:22:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qY6jx-0000z7-Vx;
	Mon, 21 Aug 2023 15:22:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qY6jt-0000yz-PO
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Aug 2023 15:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jPF+J5hi8u90adnDr4nO8bMjliVy/4uW5b+cubtClwE=; b=QBbScOjxNYEgurRwDTYJ6oIOS+
 Xr+GFHa3IKLwU+p9bcg8s2m0KStu6+9HiIOSACvuDnykZ61KXHA7uBqOFbuP8/RGPdgCI5DdxJ5gl
 ac5LN+ZrExdhZnCbxRRNixXLSWpJckkpjNp90MJSPlIjzJWtuV1HaoKcZUzAQowqWBII=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jPF+J5hi8u90adnDr4nO8bMjliVy/4uW5b+cubtClwE=; b=K
 Z75dJQc8f/iqLkqGY+Nkhol7s/3cKnW4DCj3F3G47VppR556874Tuo5deTaHuNaEhyQ3sfeQ6332h
 +4y7q68XAiGLV8Btq1tDN1yM0O1J/RYa/r0oQIkfLbPFnXpc/TzeRHdQPz/XDFVG/XP8LleEvl1Yk
 Zf/J+7oZxgaXNDdU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qY6js-0004ko-QE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Aug 2023 15:22:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 02364630E6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Aug 2023 15:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A864C433C7;
 Mon, 21 Aug 2023 15:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692631353;
 bh=UKJouoh35D1ljmwVw1T+lc1Ww6sUl1JIQ3DRiiX56nE=;
 h=From:To:Cc:Subject:Date:From;
 b=ERtRk+K/S1T+lRj2R+Ow5dux1h/He9Cp611H84buS7tp+NfH0i5Mp471gQaLJsEWQ
 n+SviJ/Pnog9M+tHGU3sZkf2GqzUZem0eawP0md50cd54uoKo5hTvlYSV8GVFsaTyx
 rrRbLOmsbytYn0+Rav3D9LfCsaRrPErSt42LBZhrHWPJyE6E3FQpKZcb8wnlDGWVO2
 +o7awUAxU3GQ5i+X1sRSTxnQRmRhMTSWfNEJyYbn4g8p27fbM+1qdyfJiqfYVizGox
 dJl1UTTpM7MWuXEX0+YxQ5dfutvSUlGqIVuNQtFav6cMZ8aMK8cwbfNhtQtZyog2xh
 JusvYz1pHMTEw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 21 Aug 2023 23:22:23 +0800
Message-Id: <20230821152225.4086924-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In sanity_check_{compress_, }inode(), it doesn't need to set
 SBI_NEED_FSCK in each error case, instead,
 we can set the flag in do_read_inode()
 only once when sanity_check_inode() fails. Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/inode.c | 23 ++++ 1 file changed, 4 insertions(+), 19 deletions(-)
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qY6js-0004ko-QE
Subject: [f2fs-dev] [PATCH 1/3] f2fs: clean up error handling in
 sanity_check_{compress_, }inode()
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

In sanity_check_{compress_,}inode(), it doesn't need to set SBI_NEED_FSCK
in each error case, instead, we can set the flag in do_read_inode() only
once when sanity_check_inode() fails.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/inode.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index e81725c922cd..8ed5406ea204 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -214,7 +214,7 @@ static bool sanity_check_compress_inode(struct inode *inode,
 		f2fs_warn(sbi,
 			"%s: inode (ino=%lx) has unsupported compress algorithm: %u, run fsck to fix",
 			__func__, inode->i_ino, ri->i_compress_algorithm);
-		goto err;
+		return false;
 	}
 	if (le64_to_cpu(ri->i_compr_blocks) >
 			SECTOR_TO_BLOCK(inode->i_blocks)) {
@@ -222,14 +222,14 @@ static bool sanity_check_compress_inode(struct inode *inode,
 			"%s: inode (ino=%lx) has inconsistent i_compr_blocks:%llu, i_blocks:%llu, run fsck to fix",
 			__func__, inode->i_ino, le64_to_cpu(ri->i_compr_blocks),
 			SECTOR_TO_BLOCK(inode->i_blocks));
-		goto err;
+		return false;
 	}
 	if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
 		ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
 		f2fs_warn(sbi,
 			"%s: inode (ino=%lx) has unsupported log cluster size: %u, run fsck to fix",
 			__func__, inode->i_ino, ri->i_log_cluster_size);
-		goto err;
+		return false;
 	}
 
 	clevel = le16_to_cpu(ri->i_compress_flag) >>
@@ -273,8 +273,6 @@ static bool sanity_check_compress_inode(struct inode *inode,
 err_level:
 	f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported compress level: %u, run fsck to fix",
 		  __func__, inode->i_ino, clevel);
-err:
-	set_sbi_flag(sbi, SBI_NEED_FSCK);
 	return false;
 }
 
@@ -287,14 +285,12 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 
 	iblocks = le64_to_cpu(F2FS_INODE(node_page)->i_blocks);
 	if (!iblocks) {
-		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: corrupted inode i_blocks i_ino=%lx iblocks=%llu, run fsck to fix.",
 			  __func__, inode->i_ino, iblocks);
 		return false;
 	}
 
 	if (ino_of_node(node_page) != nid_of_node(node_page)) {
-		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: corrupted inode footer i_ino=%lx, ino,nid: [%u, %u] run fsck to fix.",
 			  __func__, inode->i_ino,
 			  ino_of_node(node_page), nid_of_node(node_page));
@@ -303,7 +299,6 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 
 	if (f2fs_has_extra_attr(inode)) {
 		if (!f2fs_sb_has_extra_attr(sbi)) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
 				  __func__, inode->i_ino);
 			return false;
@@ -311,7 +306,6 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		if (fi->i_extra_isize > F2FS_TOTAL_EXTRA_ATTR_SIZE ||
 			fi->i_extra_isize < F2FS_MIN_EXTRA_ATTR_SIZE ||
 			fi->i_extra_isize % sizeof(__le32)) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_extra_isize: %d, max: %zu",
 				  __func__, inode->i_ino, fi->i_extra_isize,
 				  F2FS_TOTAL_EXTRA_ATTR_SIZE);
@@ -321,7 +315,6 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 			f2fs_has_inline_xattr(inode) &&
 			(!fi->i_inline_xattr_size ||
 			fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, max: %zu",
 				  __func__, inode->i_ino, fi->i_inline_xattr_size,
 				  MAX_INLINE_XATTR_SIZE);
@@ -335,7 +328,6 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 				return false;
 		}
 	} else if (f2fs_sb_has_flexible_inline_xattr(sbi)) {
-		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: corrupted inode ino=%lx, run fsck to fix.",
 			  __func__, inode->i_ino);
 		return false;
@@ -343,31 +335,26 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 
 	if (!f2fs_sb_has_extra_attr(sbi)) {
 		if (f2fs_sb_has_project_quota(sbi)) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
 				  __func__, inode->i_ino, F2FS_FEATURE_PRJQUOTA);
 			return false;
 		}
 		if (f2fs_sb_has_inode_chksum(sbi)) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
 				  __func__, inode->i_ino, F2FS_FEATURE_INODE_CHKSUM);
 			return false;
 		}
 		if (f2fs_sb_has_flexible_inline_xattr(sbi)) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
 				  __func__, inode->i_ino, F2FS_FEATURE_FLEXIBLE_INLINE_XATTR);
 			return false;
 		}
 		if (f2fs_sb_has_inode_crtime(sbi)) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
 				  __func__, inode->i_ino, F2FS_FEATURE_INODE_CRTIME);
 			return false;
 		}
 		if (f2fs_sb_has_compression(sbi)) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
 				  __func__, inode->i_ino, F2FS_FEATURE_COMPRESSION);
 			return false;
@@ -375,21 +362,18 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 	}
 
 	if (f2fs_sanity_check_inline_data(inode)) {
-		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
 			  __func__, inode->i_ino, inode->i_mode);
 		return false;
 	}
 
 	if (f2fs_has_inline_dentry(inode) && !S_ISDIR(inode->i_mode)) {
-		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_dentry, run fsck to fix",
 			  __func__, inode->i_ino, inode->i_mode);
 		return false;
 	}
 
 	if ((fi->i_flags & F2FS_CASEFOLD_FL) && !f2fs_sb_has_casefold(sbi)) {
-		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: inode (ino=%lx) has casefold flag, but casefold feature is off",
 			  __func__, inode->i_ino);
 		return false;
@@ -477,6 +461,7 @@ static int do_read_inode(struct inode *inode)
 
 	if (!sanity_check_inode(inode, node_page)) {
 		f2fs_put_page(node_page, 1);
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
 		return -EFSCORRUPTED;
 	}
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
