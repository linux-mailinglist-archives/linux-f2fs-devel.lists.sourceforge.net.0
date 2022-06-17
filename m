Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F3754FFF8
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Jun 2022 00:31:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o2KV0-0001Vl-E5; Fri, 17 Jun 2022 22:31:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1o2KUy-0001Ve-Lx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jun 2022 22:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g8NrGc5w5lL73F+pp+dUVWOn7yuIx+GYMu7GqYXSCEo=; b=WnpdYACrmLeccLjzPaLb5LDaMG
 Q2/Wooqlu7hGdE5kDutzGvxEsX3Slkv4suSzKoez+gjgcZgMtUEhoJm1It4VeQrfZryKZUGN8uKLD
 uO/BSvZ92TfeGnZhxuZkBPiitBnaXfoRR8jIb/ASngLX2NUDdaYMjNnaOgP7rbXYe+4o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=g8NrGc5w5lL73F+pp+dUVWOn7yuIx+GYMu7GqYXSCEo=; b=a
 99ZZHIBJ6pQHsOi2Jn5+CWgaSzSEon3/xkiGkLTcnbbBAL7JV78Ye1Az2LHm9JPk+hKNw7xqXVSwN
 6+dwzEsRxHS8+qwqxWVwAa2YSDHXqzo859IGSvQ9wkLwr2nYdLmFS1geQugakOg+ZY6p8y2wpE9xi
 zICqvnQbK8Opm5vU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o2KUw-0005V4-SE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jun 2022 22:31:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DEB79B82B1D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Jun 2022 22:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB69C3411B;
 Fri, 17 Jun 2022 22:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655505080;
 bh=Jp4eIONtSs6CWILka62alidYJLIpx9VDEl4Ouzu1iBE=;
 h=From:To:Cc:Subject:Date:From;
 b=cfe2aC3SsNv0taX/O9yxiekxXZfxv7Xte5M7lNEsPf9x0mhp1IskXj9gxyIHxJQeM
 SMXqmYDl6hCotPpO7UIzpuF5kXqA/b561wOipbmHC6YV1wYklHKqHaZmmi1HGGnajd
 Mxhthm91pBBjLjNK2knc9Royz6jSdAjxwpTtwQFWE8UYt9hnGD5e6IcSn6qIx+aRyi
 qMvIReINpOQ++H5QLWm4pDap7NU8sZiiBCagoXMnDWeFOrH1lg5c0lkj1pIlEnWWm+
 OaYHWWY6rsZRtmxOZLoDYNkTvhR10qy1yj/rBNEsN+Rn248lpISKV7bKA6ND7yPRla
 3uIeLQYhieXBg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 17 Jun 2022 15:31:04 -0700
Message-Id: <20220617223106.3517374-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This fixes the below corruption. [345393.335389] F2FS-fs
 (vdb):
 sanity_check_inode: inode (ino=6d0, mode=33206) should not have inline_data,
 run fsck to fix Cc: <stable@vger.kernel.org> Fixes: 677a82b44ebf ("f2fs:
 fix to do sanity check for inline inode") Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- fs/f2fs/namei.c | 16 ++++++++++------ 1 file chan [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o2KUw-0005V4-SE
Subject: [f2fs-dev] [PATCH 1/3] f2fs: attach inline_data after setting
 compression
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This fixes the below corruption.

[345393.335389] F2FS-fs (vdb): sanity_check_inode: inode (ino=6d0, mode=33206) should not have inline_data, run fsck to fix

Cc: <stable@vger.kernel.org>
Fixes: 677a82b44ebf ("f2fs: fix to do sanity check for inline inode")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/namei.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index c549acb52ac4..a841abe6a071 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -89,8 +89,6 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
 	if (test_opt(sbi, INLINE_XATTR))
 		set_inode_flag(inode, FI_INLINE_XATTR);
 
-	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode))
-		set_inode_flag(inode, FI_INLINE_DATA);
 	if (f2fs_may_inline_dentry(inode))
 		set_inode_flag(inode, FI_INLINE_DENTRY);
 
@@ -107,10 +105,6 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
 
 	f2fs_init_extent_tree(inode, NULL);
 
-	stat_inc_inline_xattr(inode);
-	stat_inc_inline_inode(inode);
-	stat_inc_inline_dir(inode);
-
 	F2FS_I(inode)->i_flags =
 		f2fs_mask_flags(mode, F2FS_I(dir)->i_flags & F2FS_FL_INHERITED);
 
@@ -127,6 +121,14 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
 			set_compress_context(inode);
 	}
 
+	/* Should enable inline_data after compression set */
+	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode))
+		set_inode_flag(inode, FI_INLINE_DATA);
+
+	stat_inc_inline_xattr(inode);
+	stat_inc_inline_inode(inode);
+	stat_inc_inline_dir(inode);
+
 	f2fs_set_inode_flags(inode);
 
 	trace_f2fs_new_inode(inode, 0);
@@ -325,6 +327,8 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
 		if (!is_extension_exist(name, ext[i], false))
 			continue;
 
+		/* Do not use inline_data with compression */
+		clear_inode_flag(inode, FI_INLINE_DATA);
 		set_compress_context(inode);
 		return;
 	}
-- 
2.36.1.476.g0c4daa206d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
