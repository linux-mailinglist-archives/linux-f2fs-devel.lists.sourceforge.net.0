Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D337A4B6F3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 04:46:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1towlF-0003wV-Pl;
	Mon, 03 Mar 2025 03:46:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1towlD-0003wN-Uv
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 03:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EZqxALOO5Bk7+WmWJu8clc0EKUz76AyKie0Fj6rhMlA=; b=WkXxrVRlhQxqwLOvo60ab+a8iC
 h8CUrKWOnJI6EYuO2pygaEphKUCasW4+aqnJ4YG3Ctr2Juaec/1281nyM8KKrBRah1C9CBNAN2mfR
 il+hkCLxcsuwGU7y4g4Z9W5oSeRUGE9w0wtLEjupdpBpZEZBaRwI5ngGMiAS/X+wtltY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EZqxALOO5Bk7+WmWJu8clc0EKUz76AyKie0Fj6rhMlA=; b=D
 ik9xblXjz7bs+tgABK6OAbg5gFjWjWH4eQO/9AB4mCUESmqmPfDoUmgWX7d+3jj1/Mx2L8TCXGj0z
 XxbD9GCYf8SySmpekxIxALQXx1ggpfgZb2qVtOQJ9cC2olR/07iJIF6fBoxCyhicbtlcAN4/TZ9jM
 kvSkO9p2lOYZn/8M=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1towlD-0006kH-Ri for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 03:46:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 93BE8611C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Mar 2025 03:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF3A4C4CEE6;
 Mon,  3 Mar 2025 03:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740973580;
 bh=LIa3c5jErC+Fa9BEa/bZPI0QfpHqsWVhgevulq+HzFo=;
 h=From:To:Cc:Subject:Date:From;
 b=LIcMW/5FVny7KJOkpdM4Ug/xO6v/wn0jO2LGfrNR8V6wusL6G5mzdoEdA/wW1gWNU
 3hs3Hq4XRzFKTuviescIVJEayvB9UV87shgMQnsXSIieTDBsC6kOihN6W3G0U/5O1V
 DBFJorNfwTHk3liD/qGDTILgjJyQsQY/q6EVA/+8jdftsbL84pK6X49O4h9pv7GtjB
 7y4ZxHbBQFcgDcp68aWM2ONuUvHwYUto9ctTUPD2Pibi6PgAti3RDBIpbJ6GUSahT+
 20iNMnYzx9aT6Q/aZMCwm2fq3DKddvaFRt8KB3hbYThiZMJb2m7zK4jfiM9zIpx/sh
 NgotyexoQODng==
To: jaegeuk@kernel.org
Date: Mon,  3 Mar 2025 11:46:06 +0800
Message-ID: <20250303034606.1355224-1-chao@kernel.org>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch introduces a new flag F2FS_NOLINEAR_LOOKUP_FL,
 so that we can tag casefolded directory w/ it to disable linear lookup
 functionality, 
 it can be used for QA. Signed-off-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/dir.c
 | 3 ++- fs/f2fs/f2fs.h | 2 ++ fs/f2fs/file.c | 36 +++++++++++++++++++++++
 include/uapi/linux/f2fs.h | 5 +++++ 4 files changed, 3 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1towlD-0006kH-Ri
Subject: [f2fs-dev] [PATCH] f2fs: support F2FS_NOLINEAR_LOOKUP_FL
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch introduces a new flag F2FS_NOLINEAR_LOOKUP_FL, so that we can
tag casefolded directory w/ it to disable linear lookup functionality,
it can be used for QA.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/dir.c             |  3 ++-
 fs/f2fs/f2fs.h            |  2 ++
 fs/f2fs/file.c            | 36 +++++++++++++++++++++++-------------
 include/uapi/linux/f2fs.h |  5 +++++
 4 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 54dd52de7269..4c74f29a2c73 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -366,7 +366,8 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 
 out:
 #if IS_ENABLED(CONFIG_UNICODE)
-	if (IS_CASEFOLDED(dir) && !de && use_hash) {
+	if (IS_CASEFOLDED(dir) && !de && use_hash &&
+				!IS_NOLINEAR_LOOKUP(dir)) {
 		use_hash = false;
 		goto start_find_entry;
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 05879c6dc4d6..787f1e5a52d7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3047,6 +3047,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
 #define F2FS_NOCOMP_FL			0x00000400 /* Don't compress */
 #define F2FS_INDEX_FL			0x00001000 /* hash-indexed directory */
 #define F2FS_DIRSYNC_FL			0x00010000 /* dirsync behaviour (directories only) */
+#define F2FS_NOLINEAR_LOOKUP_FL		0x08000000 /* do not use linear lookup */
 #define F2FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
 #define F2FS_CASEFOLD_FL		0x40000000 /* Casefolded file */
 #define F2FS_DEVICE_ALIAS_FL		0x80000000 /* File for aliasing a device */
@@ -3066,6 +3067,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
 #define F2FS_OTHER_FLMASK	(F2FS_NODUMP_FL | F2FS_NOATIME_FL)
 
 #define IS_DEVICE_ALIASING(inode)	(F2FS_I(inode)->i_flags & F2FS_DEVICE_ALIAS_FL)
+#define IS_NOLINEAR_LOOKUP(inode)	(F2FS_I(inode)->i_flags & F2FS_NOLINEAR_LOOKUP_FL)
 
 static inline __u32 f2fs_mask_flags(umode_t mode, __u32 flags)
 {
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 014cb7660a9a..1acddc4d11e4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2062,6 +2062,11 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 		}
 	}
 
+	if ((iflags ^ masked_flags) & F2FS_NOLINEAR_LOOKUP_FLAG) {
+		if (!S_ISDIR(inode->i_mode) || !IS_CASEFOLDED(inode))
+			return -EINVAL;
+	}
+
 	fi->i_flags = iflags | (fi->i_flags & ~mask);
 	f2fs_bug_on(F2FS_I_SB(inode), (fi->i_flags & F2FS_COMPR_FL) &&
 					(fi->i_flags & F2FS_NOCOMP_FL));
@@ -2093,17 +2098,18 @@ static const struct {
 	u32 iflag;
 	u32 fsflag;
 } f2fs_fsflags_map[] = {
-	{ F2FS_COMPR_FL,	FS_COMPR_FL },
-	{ F2FS_SYNC_FL,		FS_SYNC_FL },
-	{ F2FS_IMMUTABLE_FL,	FS_IMMUTABLE_FL },
-	{ F2FS_APPEND_FL,	FS_APPEND_FL },
-	{ F2FS_NODUMP_FL,	FS_NODUMP_FL },
-	{ F2FS_NOATIME_FL,	FS_NOATIME_FL },
-	{ F2FS_NOCOMP_FL,	FS_NOCOMP_FL },
-	{ F2FS_INDEX_FL,	FS_INDEX_FL },
-	{ F2FS_DIRSYNC_FL,	FS_DIRSYNC_FL },
-	{ F2FS_PROJINHERIT_FL,	FS_PROJINHERIT_FL },
-	{ F2FS_CASEFOLD_FL,	FS_CASEFOLD_FL },
+	{ F2FS_COMPR_FL,		FS_COMPR_FL },
+	{ F2FS_SYNC_FL,			FS_SYNC_FL },
+	{ F2FS_IMMUTABLE_FL,		FS_IMMUTABLE_FL },
+	{ F2FS_APPEND_FL,		FS_APPEND_FL },
+	{ F2FS_NODUMP_FL,		FS_NODUMP_FL },
+	{ F2FS_NOATIME_FL,		FS_NOATIME_FL },
+	{ F2FS_NOCOMP_FL,		FS_NOCOMP_FL },
+	{ F2FS_INDEX_FL,		FS_INDEX_FL },
+	{ F2FS_DIRSYNC_FL,		FS_DIRSYNC_FL },
+	{ F2FS_PROJINHERIT_FL,		FS_PROJINHERIT_FL },
+	{ F2FS_CASEFOLD_FL,		FS_CASEFOLD_FL },
+	{ F2FS_NOLINEAR_LOOKUP_FL,	F2FS_NOLINEAR_LOOKUP_FL },
 };
 
 #define F2FS_GETTABLE_FS_FL (		\
@@ -2121,7 +2127,8 @@ static const struct {
 		FS_INLINE_DATA_FL |	\
 		FS_NOCOW_FL |		\
 		FS_VERITY_FL |		\
-		FS_CASEFOLD_FL)
+		FS_CASEFOLD_FL |	\
+		F2FS_NOLINEAR_LOOKUP_FL)
 
 #define F2FS_SETTABLE_FS_FL (		\
 		FS_COMPR_FL |		\
@@ -2133,7 +2140,8 @@ static const struct {
 		FS_NOCOMP_FL |		\
 		FS_DIRSYNC_FL |		\
 		FS_PROJINHERIT_FL |	\
-		FS_CASEFOLD_FL)
+		FS_CASEFOLD_FL |	\
+		F2FS_NOLINEAR_LOOKUP_FL)
 
 /* Convert f2fs on-disk i_flags to FS_IOC_{GET,SET}FLAGS flags */
 static inline u32 f2fs_iflags_to_fsflags(u32 iflags)
@@ -3344,6 +3352,8 @@ int f2fs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
 		fsflags |= FS_INLINE_DATA_FL;
 	if (is_inode_flag_set(inode, FI_PIN_FILE))
 		fsflags |= FS_NOCOW_FL;
+	if (IS_NOLINEAR_LOOKUP(inode))
+		fsflags |= F2FS_NOLINEAR_LOOKUP_FL;
 
 	fileattr_fill_flags(fa, fsflags & F2FS_GETTABLE_FS_FL);
 
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index 795e26258355..a03626fdcf35 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -104,4 +104,9 @@ struct f2fs_comp_option {
 	__u8 log_cluster_size;
 };
 
+/* used for FS_IOC_GETFLAGS and FS_IOC_SETFLAGS */
+enum {
+	F2FS_NOLINEAR_LOOKUP_FLAG = 0x08000000,
+};
+
 #endif /* _UAPI_LINUX_F2FS_H */
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
