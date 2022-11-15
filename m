Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DB762AF07
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Nov 2022 00:00:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ov4v7-0000Vk-OJ;
	Tue, 15 Nov 2022 23:00:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ov4v5-0000Vd-Qz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 23:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=doSD374PN3FOHbfmY5sQ13hqDjo+YilUPtKyoY0Ra7g=; b=fW4OP39c3ujTWrX49sH/jSGPMk
 7cJGtVCNvL1E9BeX3/kswWtVn8jp9paflqCa99vBHM7Y07H1GtdpSgfwdZ1XaB/73qGoMw/Zf8EAv
 NE7Ndc1aotKyq5woG2qnPOKoaxAYSbURv9BsKvbDmVacA0QCExB6tNS85h/WEpoC3+mg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=doSD374PN3FOHbfmY5sQ13hqDjo+YilUPtKyoY0Ra7g=; b=i37ESpSFKJsGUvP9i5tV4n9mRx
 LGLYl3hOhmEoYcEgEo1GpRpE2eDmI4Y2zuykipX7h3Nmw4SPjAAC76xRfublZlf03t3saSUSZnKbN
 8rcKeVMOkmjF1Qlvsa3un8SCu1PNc4lJnIpru7BEjOEicxv8Q93jYZmCNXjDo1oCYAkc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ov4v1-0004eg-4Q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 23:00:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B1C5B612C5;
 Tue, 15 Nov 2022 23:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02E5C433D6;
 Tue, 15 Nov 2022 23:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668553231;
 bh=0XGg28rzAOSgiZrCnSxxRvF03n9W/d8/Ypf4b+Xxvrw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X2cv+ENBEwMArtAZFRnH4d2PSNFDCoQ0YApMtMvMRhpcCiw5Tmhc7N2K2XshdjFna
 lPeEVknmci0zS+/apAZyriEI6Nn0Wb9zCaMU8YidvvztwXvZqNt4PQb1OknSe3xPYd
 ldCRXEhwBPF2J9qN2nfZM+8OWqVbmvgtMlEIZxTrDPFywKN9DIv+3ncSrqXMRsyrpm
 0P6UoVzLIkUcWGV0xFhfRkxnKE5+Hnzyx+52RiaVqLhLvvbfad1pky5qSbtPlqzb4m
 jFEz53zvnibFanLWZ1R1thRaTBJQkozFfBccnhRFnc4vLGOfK46HvVitnJnonfMsdl
 yaD6pC8GOdG6A==
Date: Tue, 15 Nov 2022 15:00:29 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sheng Yong <shengyong@oppo.com>
Message-ID: <Y3QaDU2n34nmPaiD@google.com>
References: <f508dea8-5dc3-e29e-0d8b-4d64735817ac@kernel.org>
 <20221115160155.1037163-1-shengyong@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221115160155.1037163-1-shengyong@oppo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If compress_extension is set,
 and a newly created file matches
 the extension, the file could be marked as compression file. However, if
 inline_data is also enabled, there is no chance to check its ext [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ov4v1-0004eg-4Q
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: fix to enable compress for newly
 created file if extension matches
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

If compress_extension is set, and a newly created file matches the
extension, the file could be marked as compression file. However,
if inline_data is also enabled, there is no chance to check its
extension since f2fs_should_compress() always returns false.

This patch moves set_compress_inode(), which do extension check, in
f2fs_should_compress() to check extensions before setting inline
data flag.

Fixes: 7165841d578e ("f2fs: fix to check inline_data during compressed inode conversion")
Signed-off-by: Sheng Yong <shengyong@oppo.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Checking this version.

 fs/f2fs/f2fs.h  |   2 +-
 fs/f2fs/namei.c | 328 ++++++++++++++++++++++++------------------------
 2 files changed, 163 insertions(+), 167 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b89b5d755ce0..dedac413bf64 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2980,7 +2980,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
 /* Flags that should be inherited by new inodes from their parent. */
 #define F2FS_FL_INHERITED (F2FS_SYNC_FL | F2FS_NODUMP_FL | F2FS_NOATIME_FL | \
 			   F2FS_DIRSYNC_FL | F2FS_PROJINHERIT_FL | \
-			   F2FS_CASEFOLD_FL | F2FS_COMPR_FL | F2FS_NOCOMP_FL)
+			   F2FS_CASEFOLD_FL)
 
 /* Flags that are appropriate for regular files (all but dir-specific ones). */
 #define F2FS_REG_FLMASK		(~(F2FS_DIRSYNC_FL | F2FS_PROJINHERIT_FL | \
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index e104409c3a0e..cb7441a19d22 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -22,8 +22,161 @@
 #include "acl.h"
 #include <trace/events/f2fs.h>
 
+static inline int is_extension_exist(const unsigned char *s, const char *sub,
+						bool tmp_ext)
+{
+	size_t slen = strlen(s);
+	size_t sublen = strlen(sub);
+	int i;
+
+	if (sublen == 1 && *sub == '*')
+		return 1;
+
+	/*
+	 * filename format of multimedia file should be defined as:
+	 * "filename + '.' + extension + (optional: '.' + temp extension)".
+	 */
+	if (slen < sublen + 2)
+		return 0;
+
+	if (!tmp_ext) {
+		/* file has no temp extension */
+		if (s[slen - sublen - 1] != '.')
+			return 0;
+		return !strncasecmp(s + slen - sublen, sub, sublen);
+	}
+
+	for (i = 1; i < slen - sublen; i++) {
+		if (s[i] != '.')
+			continue;
+		if (!strncasecmp(s + i + 1, sub, sublen))
+			return 1;
+	}
+
+	return 0;
+}
+
+int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
+							bool hot, bool set)
+{
+	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
+	int cold_count = le32_to_cpu(sbi->raw_super->extension_count);
+	int hot_count = sbi->raw_super->hot_ext_count;
+	int total_count = cold_count + hot_count;
+	int start, count;
+	int i;
+
+	if (set) {
+		if (total_count == F2FS_MAX_EXTENSION)
+			return -EINVAL;
+	} else {
+		if (!hot && !cold_count)
+			return -EINVAL;
+		if (hot && !hot_count)
+			return -EINVAL;
+	}
+
+	if (hot) {
+		start = cold_count;
+		count = total_count;
+	} else {
+		start = 0;
+		count = cold_count;
+	}
+
+	for (i = start; i < count; i++) {
+		if (strcmp(name, extlist[i]))
+			continue;
+
+		if (set)
+			return -EINVAL;
+
+		memcpy(extlist[i], extlist[i + 1],
+				F2FS_EXTENSION_LEN * (total_count - i - 1));
+		memset(extlist[total_count - 1], 0, F2FS_EXTENSION_LEN);
+		if (hot)
+			sbi->raw_super->hot_ext_count = hot_count - 1;
+		else
+			sbi->raw_super->extension_count =
+						cpu_to_le32(cold_count - 1);
+		return 0;
+	}
+
+	if (!set)
+		return -EINVAL;
+
+	if (hot) {
+		memcpy(extlist[count], name, strlen(name));
+		sbi->raw_super->hot_ext_count = hot_count + 1;
+	} else {
+		char buf[F2FS_MAX_EXTENSION][F2FS_EXTENSION_LEN];
+
+		memcpy(buf, &extlist[cold_count],
+				F2FS_EXTENSION_LEN * hot_count);
+		memset(extlist[cold_count], 0, F2FS_EXTENSION_LEN);
+		memcpy(extlist[cold_count], name, strlen(name));
+		memcpy(&extlist[cold_count + 1], buf,
+				F2FS_EXTENSION_LEN * hot_count);
+		sbi->raw_super->extension_count = cpu_to_le32(cold_count + 1);
+	}
+	return 0;
+}
+
+static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
+				struct inode *inode, const unsigned char *name)
+{
+	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
+	unsigned char (*noext)[F2FS_EXTENSION_LEN] =
+						F2FS_OPTION(sbi).noextensions;
+	unsigned char (*ext)[F2FS_EXTENSION_LEN] = F2FS_OPTION(sbi).extensions;
+	unsigned char ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
+	unsigned char noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
+	int i, cold_count, hot_count;
+
+	/* Caller should give the name of regular file or directory. */
+	if (!f2fs_sb_has_compression(sbi) || !name)
+		return;
+
+	if (S_ISDIR(inode->i_mode))
+		goto inherit_comp;
+
+	/* Don't compress hot files. */
+	f2fs_down_read(&sbi->sb_lock);
+	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
+	hot_count = sbi->raw_super->hot_ext_count;
+	for (i = cold_count; i < cold_count + hot_count; i++)
+		if (is_extension_exist(name, extlist[i], false))
+			break;
+	f2fs_up_read(&sbi->sb_lock);
+	if (i < (cold_count + hot_count))
+		return;
+
+	/* Don't compress unallowed extension. */
+	for (i = 0; i < noext_cnt; i++)
+		if (is_extension_exist(name, noext[i], false))
+			return;
+inherit_comp:
+	/* Inherit the {no-}compression flag in directory */
+	if (F2FS_I(dir)->i_flags & F2FS_NOCOMP_FL) {
+		F2FS_I(inode)->i_flags |= F2FS_NOCOMP_FL;
+		return;
+	} else if (F2FS_I(dir)->i_flags & F2FS_COMPR_FL) {
+		set_compress_context(inode);
+		return;
+	}
+
+	/* Compress wanting extension. */
+	for (i = 0; i < ext_cnt; i++) {
+		if (is_extension_exist(name, ext[i], false)) {
+			set_compress_context(inode);
+			return;
+		}
+	}
+}
+
 static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
-						struct inode *dir, umode_t mode)
+						struct inode *dir, umode_t mode,
+						const char *name)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
 	nid_t ino;
@@ -114,12 +267,8 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
 	if (F2FS_I(inode)->i_flags & F2FS_PROJINHERIT_FL)
 		set_inode_flag(inode, FI_PROJ_INHERIT);
 
-	if (f2fs_sb_has_compression(sbi)) {
-		/* Inherit the compression flag in directory */
-		if ((F2FS_I(dir)->i_flags & F2FS_COMPR_FL) &&
-					f2fs_may_compress(inode))
-			set_compress_context(inode);
-	}
+	/* Check compression first. */
+	set_compress_new_inode(sbi, dir, inode, name);
 
 	/* Should enable inline_data after compression set */
 	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode))
@@ -153,40 +302,6 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
 	return ERR_PTR(err);
 }
 
-static inline int is_extension_exist(const unsigned char *s, const char *sub,
-						bool tmp_ext)
-{
-	size_t slen = strlen(s);
-	size_t sublen = strlen(sub);
-	int i;
-
-	if (sublen == 1 && *sub == '*')
-		return 1;
-
-	/*
-	 * filename format of multimedia file should be defined as:
-	 * "filename + '.' + extension + (optional: '.' + temp extension)".
-	 */
-	if (slen < sublen + 2)
-		return 0;
-
-	if (!tmp_ext) {
-		/* file has no temp extension */
-		if (s[slen - sublen - 1] != '.')
-			return 0;
-		return !strncasecmp(s + slen - sublen, sub, sublen);
-	}
-
-	for (i = 1; i < slen - sublen; i++) {
-		if (s[i] != '.')
-			continue;
-		if (!strncasecmp(s + i + 1, sub, sublen))
-			return 1;
-	}
-
-	return 0;
-}
-
 /*
  * Set file's temperature for hot/cold data separation
  */
@@ -217,124 +332,6 @@ static inline void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *
 		file_set_hot(inode);
 }
 
-int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
-							bool hot, bool set)
-{
-	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
-	int cold_count = le32_to_cpu(sbi->raw_super->extension_count);
-	int hot_count = sbi->raw_super->hot_ext_count;
-	int total_count = cold_count + hot_count;
-	int start, count;
-	int i;
-
-	if (set) {
-		if (total_count == F2FS_MAX_EXTENSION)
-			return -EINVAL;
-	} else {
-		if (!hot && !cold_count)
-			return -EINVAL;
-		if (hot && !hot_count)
-			return -EINVAL;
-	}
-
-	if (hot) {
-		start = cold_count;
-		count = total_count;
-	} else {
-		start = 0;
-		count = cold_count;
-	}
-
-	for (i = start; i < count; i++) {
-		if (strcmp(name, extlist[i]))
-			continue;
-
-		if (set)
-			return -EINVAL;
-
-		memcpy(extlist[i], extlist[i + 1],
-				F2FS_EXTENSION_LEN * (total_count - i - 1));
-		memset(extlist[total_count - 1], 0, F2FS_EXTENSION_LEN);
-		if (hot)
-			sbi->raw_super->hot_ext_count = hot_count - 1;
-		else
-			sbi->raw_super->extension_count =
-						cpu_to_le32(cold_count - 1);
-		return 0;
-	}
-
-	if (!set)
-		return -EINVAL;
-
-	if (hot) {
-		memcpy(extlist[count], name, strlen(name));
-		sbi->raw_super->hot_ext_count = hot_count + 1;
-	} else {
-		char buf[F2FS_MAX_EXTENSION][F2FS_EXTENSION_LEN];
-
-		memcpy(buf, &extlist[cold_count],
-				F2FS_EXTENSION_LEN * hot_count);
-		memset(extlist[cold_count], 0, F2FS_EXTENSION_LEN);
-		memcpy(extlist[cold_count], name, strlen(name));
-		memcpy(&extlist[cold_count + 1], buf,
-				F2FS_EXTENSION_LEN * hot_count);
-		sbi->raw_super->extension_count = cpu_to_le32(cold_count + 1);
-	}
-	return 0;
-}
-
-static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
-						const unsigned char *name)
-{
-	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
-	unsigned char (*noext)[F2FS_EXTENSION_LEN] = F2FS_OPTION(sbi).noextensions;
-	unsigned char (*ext)[F2FS_EXTENSION_LEN] = F2FS_OPTION(sbi).extensions;
-	unsigned char ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
-	unsigned char noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
-	int i, cold_count, hot_count;
-
-	if (!f2fs_sb_has_compression(sbi) ||
-			F2FS_I(inode)->i_flags & F2FS_NOCOMP_FL ||
-			!f2fs_may_compress(inode) ||
-			(!ext_cnt && !noext_cnt))
-		return;
-
-	f2fs_down_read(&sbi->sb_lock);
-
-	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
-	hot_count = sbi->raw_super->hot_ext_count;
-
-	for (i = cold_count; i < cold_count + hot_count; i++) {
-		if (is_extension_exist(name, extlist[i], false)) {
-			f2fs_up_read(&sbi->sb_lock);
-			return;
-		}
-	}
-
-	f2fs_up_read(&sbi->sb_lock);
-
-	for (i = 0; i < noext_cnt; i++) {
-		if (is_extension_exist(name, noext[i], false)) {
-			f2fs_disable_compressed_file(inode);
-			return;
-		}
-	}
-
-	if (is_inode_flag_set(inode, FI_COMPRESSED_FILE))
-		return;
-
-	for (i = 0; i < ext_cnt; i++) {
-		if (!is_extension_exist(name, ext[i], false))
-			continue;
-
-		/* Do not use inline_data with compression */
-		stat_dec_inline_inode(inode);
-		clear_inode_flag(inode, FI_INLINE_DATA);
-		set_compress_context(inode);
-		return;
-	}
-}
-
 static int f2fs_create(struct user_namespace *mnt_userns, struct inode *dir,
 		       struct dentry *dentry, umode_t mode, bool excl)
 {
@@ -352,15 +349,13 @@ static int f2fs_create(struct user_namespace *mnt_userns, struct inode *dir,
 	if (err)
 		return err;
 
-	inode = f2fs_new_inode(mnt_userns, dir, mode);
+	inode = f2fs_new_inode(mnt_userns, dir, mode, dentry->d_name.name);
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
 
 	if (!test_opt(sbi, DISABLE_EXT_IDENTIFY))
 		set_file_temperature(sbi, inode, dentry->d_name.name);
 
-	set_compress_inode(sbi, inode, dentry->d_name.name);
-
 	inode->i_op = &f2fs_file_inode_operations;
 	inode->i_fop = &f2fs_file_operations;
 	inode->i_mapping->a_ops = &f2fs_dblock_aops;
@@ -689,7 +684,7 @@ static int f2fs_symlink(struct user_namespace *mnt_userns, struct inode *dir,
 	if (err)
 		return err;
 
-	inode = f2fs_new_inode(mnt_userns, dir, S_IFLNK | S_IRWXUGO);
+	inode = f2fs_new_inode(mnt_userns, dir, S_IFLNK | S_IRWXUGO, NULL);
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
 
@@ -760,7 +755,8 @@ static int f2fs_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
 	if (err)
 		return err;
 
-	inode = f2fs_new_inode(mnt_userns, dir, S_IFDIR | mode);
+	inode = f2fs_new_inode(mnt_userns, dir, S_IFDIR | mode,
+						dentry->d_name.name);
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
 
@@ -817,7 +813,7 @@ static int f2fs_mknod(struct user_namespace *mnt_userns, struct inode *dir,
 	if (err)
 		return err;
 
-	inode = f2fs_new_inode(mnt_userns, dir, mode);
+	inode = f2fs_new_inode(mnt_userns, dir, mode, NULL);
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
 
@@ -856,7 +852,7 @@ static int __f2fs_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
 	if (err)
 		return err;
 
-	inode = f2fs_new_inode(mnt_userns, dir, mode);
+	inode = f2fs_new_inode(mnt_userns, dir, mode, NULL);
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
 
-- 
2.38.1.493.g58b659f92b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
