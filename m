Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 056BC7147E4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 May 2023 12:28:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q3a6m-0002ht-KY;
	Mon, 29 May 2023 10:28:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q3a6j-0002hm-6Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 10:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gpLXVDErLFJzTTjcukM5qYM3wFvGWyoJS80GiueIcyE=; b=Q/xRS4kBE8rbQa+8ylW8OkUqyF
 NvXuHbxj6DUydISY+cvIcfgTzGQ4Aq2vpXOQ7pIAI9CxVxTUrlk3Oq3tVYEEBN626vKkma8vd05pk
 we+bit6kqY8QXUSVA0lk0zU7K/lEDEyL0vcbUsDga9mhhoun6NIWPrmo0QRHxHSw0Rdg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gpLXVDErLFJzTTjcukM5qYM3wFvGWyoJS80GiueIcyE=; b=f
 ghWy2NBLoUvAp0EbynPqxHbOCw2HbyQ3/1eqpW5nsGywNkou9SvopcUVFwMZvGFv9CeOf22n4msx8
 4meL+bTUKGnFyc3ulVdjZ1breyiutiRzVIFnx5/sawAHHKAP+byRG8MR1kefVwK9fPFXQ/OzIDP0S
 +AHk1w7l6mRW9P2Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q3a6i-0005aw-Ew for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 10:28:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 139ED62343
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 May 2023 10:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F959C433EF;
 Mon, 29 May 2023 10:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685356082;
 bh=IJLIQq1chUklXte5PhtFAFs0mire2QtY9PJNSSEzrHs=;
 h=From:To:Cc:Subject:Date:From;
 b=sBtgyvEit3uCvlbTRP5yHC+e5nciFVqpCz0/ljIWoo8gp18aq9laYndbbyTqiHvjQ
 i/HjBmK5FvWKKOceIIS0i3vSJNrSlv1tHYSdyuHo8pAiR1bd0s01aUQg1KYmFJkg9x
 Rkelf5Mrf0M7H7CQWGagt2+B5g5ny46sq8wWDscMcpsiCVy7D6bhpki0RhrNmHIvmv
 CXdMAtf4xDe+zM1b0K1GoO+C2su3vhKHh6kQ0hOta06pI5YvuyIfoT5q4/TNeCaPFO
 X3e4+kw6H5sz9PQfSWuk1Kj2gHc8qd0/AWZtq+MjRi1vi5z42by8SS3dgtmK2aml6s
 5lMS9lgXnAC2Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 29 May 2023 18:27:55 +0800
Message-Id: <20230529102755.2547478-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch does below changes: - clean up check condition
 - add sanity check for i_extra_isize w/ lower boundary - add sanity check
 for feature dependency - check i_extra_isize only if f2fs_has_extra_ [...]
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q3a6i-0005aw-Ew
Subject: [f2fs-dev] [PATCH] f2fs: do more sanity check on inode
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

This patch does below changes:
- clean up check condition
- add sanity check for i_extra_isize w/ lower boundary
- add sanity check for feature dependency
- check i_extra_isize only if f2fs_has_extra_attr() is true

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h  |   2 +
 fs/f2fs/inode.c | 108 +++++++++++++++++++++++++++++++-----------------
 2 files changed, 72 insertions(+), 38 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9bd83fb28439..11c0bb12c686 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3424,6 +3424,8 @@ static inline int get_inline_xattr_addrs(struct inode *inode)
 	((is_inode_flag_set(i, FI_ACL_MODE)) ? \
 	 (F2FS_I(i)->i_acl_mode) : ((i)->i_mode))
 
+#define F2FS_MIN_EXTRA_ATTR_SIZE		(sizeof(__le32))
+
 #define F2FS_TOTAL_EXTRA_ATTR_SIZE			\
 	(offsetof(struct f2fs_inode, i_extra_end) -	\
 	offsetof(struct f2fs_inode, i_extra_isize))	\
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 0a1748444329..1e49009831c1 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -300,41 +300,79 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		return false;
 	}
 
-	if (f2fs_sb_has_flexible_inline_xattr(sbi)
-			&& !f2fs_has_extra_attr(inode)) {
-		set_sbi_flag(sbi, SBI_NEED_FSCK);
-		f2fs_warn(sbi, "%s: corrupted inode ino=%lx, run fsck to fix.",
-			  __func__, inode->i_ino);
-		return false;
-	}
-
-	if (f2fs_has_extra_attr(inode) &&
-			!f2fs_sb_has_extra_attr(sbi)) {
-		set_sbi_flag(sbi, SBI_NEED_FSCK);
-		f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
-			  __func__, inode->i_ino);
-		return false;
-	}
-
-	if (fi->i_extra_isize > F2FS_TOTAL_EXTRA_ATTR_SIZE ||
+	if (f2fs_has_extra_attr(inode)) {
+		if (!f2fs_sb_has_extra_attr(sbi)) {
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
+			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
+				  __func__, inode->i_ino);
+			return false;
+		}
+		if (fi->i_extra_isize > F2FS_TOTAL_EXTRA_ATTR_SIZE ||
+			fi->i_extra_isize < F2FS_MIN_EXTRA_ATTR_SIZE ||
 			fi->i_extra_isize % sizeof(__le32)) {
-		set_sbi_flag(sbi, SBI_NEED_FSCK);
-		f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_extra_isize: %d, max: %zu",
-			  __func__, inode->i_ino, fi->i_extra_isize,
-			  F2FS_TOTAL_EXTRA_ATTR_SIZE);
-		return false;
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
+			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_extra_isize: %d, max: %zu",
+				  __func__, inode->i_ino, fi->i_extra_isize,
+				  F2FS_TOTAL_EXTRA_ATTR_SIZE);
+			return false;
+		}
+		if (f2fs_sb_has_flexible_inline_xattr(sbi) &&
+			f2fs_has_inline_xattr(inode) &&
+			(!fi->i_inline_xattr_size ||
+			fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
+			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, max: %zu",
+				  __func__, inode->i_ino, fi->i_inline_xattr_size,
+				  MAX_INLINE_XATTR_SIZE);
+			return false;
+		}
+		if (f2fs_sb_has_compression(sbi) &&
+			fi->i_flags & F2FS_COMPR_FL &&
+			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
+						i_compress_flag)) {
+			if (!sanity_check_compress_inode(inode, ri))
+				return false;
+		}
+	} else {
+		if (f2fs_sb_has_flexible_inline_xattr(sbi)) {
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
+			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, run fsck to fix.",
+				  __func__, inode->i_ino);
+			return false;
+		}
 	}
 
-	if (f2fs_has_extra_attr(inode) &&
-		f2fs_sb_has_flexible_inline_xattr(sbi) &&
-		f2fs_has_inline_xattr(inode) &&
-		(!fi->i_inline_xattr_size ||
-		fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
-		set_sbi_flag(sbi, SBI_NEED_FSCK);
-		f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, max: %zu",
-			  __func__, inode->i_ino, fi->i_inline_xattr_size,
-			  MAX_INLINE_XATTR_SIZE);
-		return false;
+	if (!f2fs_sb_has_extra_attr(sbi)) {
+		if (f2fs_sb_has_project_quota(sbi)) {
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
+			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
+				  __func__, inode->i_ino, F2FS_FEATURE_PRJQUOTA);
+			return false;
+		}
+		if (f2fs_sb_has_inode_chksum(sbi)) {
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
+			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
+				  __func__, inode->i_ino, F2FS_FEATURE_INODE_CHKSUM);
+			return false;
+		}
+		if (f2fs_sb_has_flexible_inline_xattr(sbi)) {
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
+			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
+				  __func__, inode->i_ino, F2FS_FEATURE_FLEXIBLE_INLINE_XATTR);
+			return false;
+		}
+		if (f2fs_sb_has_inode_crtime(sbi)) {
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
+			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
+				  __func__, inode->i_ino, F2FS_FEATURE_INODE_CRTIME);
+			return false;
+		}
+		if (f2fs_sb_has_compression(sbi)) {
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
+			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
+				  __func__, inode->i_ino, F2FS_FEATURE_COMPRESSION);
+			return false;
+		}
 	}
 
 	if (f2fs_sanity_check_inline_data(inode)) {
@@ -358,12 +396,6 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		return false;
 	}
 
-	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi) &&
-			fi->i_flags & F2FS_COMPR_FL &&
-			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
-						i_compress_flag))
-		return sanity_check_compress_inode(inode, ri);
-
 	return true;
 }
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
