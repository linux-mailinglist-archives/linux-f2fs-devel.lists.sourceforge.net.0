Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 723875297CD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 May 2022 05:19:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nqnkY-0006EF-C9; Tue, 17 May 2022 03:19:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nqnkW-0006E9-OP
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 May 2022 03:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sIKGL6+vbh9U8GooCW/XyHzEXwOFkljX/I0YAS2CnIY=; b=iAuusxzvwz3pr8xfnvrU7tLp6U
 S9Q9Dq5pWhL6neI9/FRoXqHQRqR/BqdSp2k+pkA1wPjE/gccgGm3T9fVZTf88dup6o2ZuY2XVLDf5
 r/7wsq+zVnlLica6WwMEBtfbj60Lw0wV3wn/ce8Exx1Cqsu8hX1Tlx2SSZr3EFoK7d/E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sIKGL6+vbh9U8GooCW/XyHzEXwOFkljX/I0YAS2CnIY=; b=m
 SyZv+Glzu58hxRr5DqJ6xo3/GZz+ozcauoYuUgNaSblvGDqxt+9RGLpM/UEHJZbRcfobHNJK9ubsc
 nYqRWoxQWZ5rI23HGoDpfgrKebutFPwVHL55flf9Y2TnIRrZIxQ2+d8zy6/YD+mE4BWK8GHcUvoLZ
 InsautTB35LQGVlo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nqnkU-0001Vn-Ur
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 May 2022 03:19:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BFC5D61407;
 Tue, 17 May 2022 03:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DBEC385B8;
 Tue, 17 May 2022 03:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652757580;
 bh=VIHjd9WHoqUG2QiApVkWuQIrOpyDysFKEQQlq03kRIA=;
 h=From:To:Cc:Subject:Date:From;
 b=PlbuoWjU155FW8X2ZQgGyHZzC3b9YI1xXr++vJ6YOQoX7P2eukYHMyxzHlIhGdXQI
 vK8b0mr1+FU1hjrVEgYIQhnVbZVHiy8rIxHrzUpgZlahNWOT4Y24nGGfu0JGVaw2QB
 +PRtLa4qP03H6E00hioAJ/Mh791AwSk46sN3hoUmq3BPmnFfeWg3WQ0pQOT8/E2o4V
 qjiGHyLvFnIg7Yp/9aPApV52DsInQzrJGTVI8Zp7K0o12vUrqnDmc3gQUuBMWsX7Se
 2a3SXJx5ghRfwSk+54/71deNVs0bX/f+/b7PNUhc/iJRN3JoQxSeaIyvkbU4glhh5d
 PdLKxJCearSDw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 17 May 2022 11:19:34 +0800
Message-Id: <20220517031934.3563135-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Pinning a file is heavy, because skipping pinned files make
 GC running with heavy load or no effect. So that this patch proposes to
 separate
 nocow and pinfile semantics: - NOCoW flag can only be set on regular file.
 - NOCoW file will only trigger IPU at common writeback/flush. - NOCow file
 will do OP [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
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
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqnkU-0001Vn-Ur
Subject: [f2fs-dev] [PATCH v3] f2fs: separate NOCoW and pinfile semantics
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

Pinning a file is heavy, because skipping pinned files make GC
running with heavy load or no effect.

So that this patch proposes to separate nocow and pinfile semantics:
- NOCoW flag can only be set on regular file.
- NOCoW file will only trigger IPU at common writeback/flush.
- NOCow file will do OPU during GC.

This flag can satisfying the demand of:
1) avoiding fragment of file's physical block
2) userspace doesn't want to pin file's physical address

After commit 5d539245cb18 ("f2fs: export FS_NOCOW_FL flag to user"),
Pin_file and NOCoW flags have already been twined closely. e.g.
once we set pinfile flag in file, nocow flag will be shown; and after
clearing pinfile flag, nocow flag will disappear.

So, in order to keep backward compatibility, let use below semantics:

f2fs_ioc_set_pin_file/f2fs_fileattr_set logic:
		pinfile			nocow
set		set pinfile | nocow	set nocow
clear		clear pinfile | nocow	clear nocow

File Behaviors:
w/ pinfile, w/ nocow:		use pinfile semantics
w/ pinfile, w/o nocow:		use pinfile semantics
w/o pinfile, w/ nocow:		use nocow semantics
w/o pinfile, w/o nocow:		no pinfile or nocow semantics

NOCoW can also be set on directory, and it will have no effect on
directory, however, new files created in nocow directory will have the
flag set.

Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
v3:
- support nocow flag for directory.
 fs/f2fs/data.c |  3 ++-
 fs/f2fs/f2fs.h | 13 +++++++++++--
 fs/f2fs/file.c | 18 +++++++++++++++++-
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 54a7a8ad994d..c8eab78f7d89 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2495,7 +2495,8 @@ bool f2fs_should_update_inplace(struct inode *inode, struct f2fs_io_info *fio)
 	if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
 		return false;
 
-	if (f2fs_is_pinned_file(inode))
+	if (f2fs_is_pinned_file(inode) ||
+			F2FS_I(inode)->i_flags & F2FS_NOCOW_FL)
 		return true;
 
 	/* if this is cold file, we should overwrite to avoid fragmentation */
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 492af5b96de1..5c67736000a7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2916,13 +2916,15 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
 #define F2FS_NOCOMP_FL			0x00000400 /* Don't compress */
 #define F2FS_INDEX_FL			0x00001000 /* hash-indexed directory */
 #define F2FS_DIRSYNC_FL			0x00010000 /* dirsync behaviour (directories only) */
+#define F2FS_NOCOW_FL			0x00800000 /* Do not cow file */
 #define F2FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
 #define F2FS_CASEFOLD_FL		0x40000000 /* Casefolded file */
 
 /* Flags that should be inherited by new inodes from their parent. */
 #define F2FS_FL_INHERITED (F2FS_SYNC_FL | F2FS_NODUMP_FL | F2FS_NOATIME_FL | \
 			   F2FS_DIRSYNC_FL | F2FS_PROJINHERIT_FL | \
-			   F2FS_CASEFOLD_FL | F2FS_COMPR_FL | F2FS_NOCOMP_FL)
+			   F2FS_CASEFOLD_FL | F2FS_COMPR_FL | F2FS_NOCOMP_FL | \
+			   F2FS_NOCOW_FL)
 
 /* Flags that are appropriate for regular files (all but dir-specific ones). */
 #define F2FS_REG_FLMASK		(~(F2FS_DIRSYNC_FL | F2FS_PROJINHERIT_FL | \
@@ -2954,9 +2956,16 @@ static inline void __mark_inode_dirty_flag(struct inode *inode,
 		fallthrough;
 	case FI_DATA_EXIST:
 	case FI_INLINE_DOTS:
-	case FI_PIN_FILE:
 	case FI_COMPRESS_RELEASED:
 		f2fs_mark_inode_dirty_sync(inode, true);
+		break;
+	case FI_PIN_FILE:
+		if (set)
+			F2FS_I(inode)->i_flags |= F2FS_NOCOW_FL;
+		else
+			F2FS_I(inode)->i_flags &= ~F2FS_NOCOW_FL;
+		f2fs_mark_inode_dirty_sync(inode, true);
+		break;
 	}
 }
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 216081ea8c81..9e71ce8601f9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1851,6 +1851,20 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 	if (IS_NOQUOTA(inode))
 		return -EPERM;
 
+	if ((iflags ^ masked_flags) & F2FS_NOCOW_FL) {
+		int ret;
+
+		if (!S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode))
+			return -EINVAL;
+		if (S_ISREG(inode->i_mode)) {
+			if (f2fs_should_update_outplace(inode, NULL))
+				return -EINVAL;
+			ret = f2fs_convert_inline_inode(inode);
+			if (ret)
+				return ret;
+		}
+	}
+
 	if ((iflags ^ masked_flags) & F2FS_CASEFOLD_FL) {
 		if (!f2fs_sb_has_casefold(F2FS_I_SB(inode)))
 			return -EOPNOTSUPP;
@@ -1926,6 +1940,7 @@ static const struct {
 	{ F2FS_NOCOMP_FL,	FS_NOCOMP_FL },
 	{ F2FS_INDEX_FL,	FS_INDEX_FL },
 	{ F2FS_DIRSYNC_FL,	FS_DIRSYNC_FL },
+	{ F2FS_NOCOW_FL,	FS_NOCOW_FL },
 	{ F2FS_PROJINHERIT_FL,	FS_PROJINHERIT_FL },
 	{ F2FS_CASEFOLD_FL,	FS_CASEFOLD_FL },
 };
@@ -1957,7 +1972,8 @@ static const struct {
 		FS_NOCOMP_FL |		\
 		FS_DIRSYNC_FL |		\
 		FS_PROJINHERIT_FL |	\
-		FS_CASEFOLD_FL)
+		FS_CASEFOLD_FL |	\
+		FS_NOCOW_FL)
 
 /* Convert f2fs on-disk i_flags to FS_IOC_{GET,SET}FLAGS flags */
 static inline u32 f2fs_iflags_to_fsflags(u32 iflags)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
