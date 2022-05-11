Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07394523D8E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 May 2022 21:32:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nos4Y-0006yG-ES; Wed, 11 May 2022 19:32:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nos4X-0006xs-It
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 19:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BiWQtMKZVsSpK2p5rq0NxHvLH8gusOX5yxhKUCGeM1s=; b=ZpfoEoEld9NS3euNPmMXoc5HOE
 n+jM30T/NWiCKqJ5CtoQUsvtP7FsIENKGICTKX/IJgMceBEtPyKQ9ntoYpKAZcagqQ/nOsylvD/46
 +2hOlXy6jjaSyIfG9bX0SvvTwORk9/OIuRSdBc6vvCzstmv6XzI+L2p/ZQZ51FsEYRCk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BiWQtMKZVsSpK2p5rq0NxHvLH8gusOX5yxhKUCGeM1s=; b=QsciBsbjbSxXN+f/L3jAAB1a0j
 YR63S2T5waSiV5qTs2kNrJ0CMWSZef8DEoqwMRfC7DQf8ZAUVjGtxxAwzzAAcuoFsQ+cy4y3+QH8h
 xna84+eqV4M9HfwJYPP0N7lcDNVYBAnKIlnd0M4wgpsS9lT6ICHperfzv1G3h8UpknCo=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nos4V-0007Jv-LA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 19:32:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 500411F42971
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652297545;
 bh=I+NTXd5q40UlKaGrc5vhldVVShFaNrxghoaW9oyhz2o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W3vuzqnciBUXQAAjjldyha/9KoplRdfGtrygVkV+9yF+2HgZ1RQVPwcjT5LVfWVlX
 l09WQx0hbmm/qQvOx+/EnZoPJsJqPP3v5wUQuNIcNFtg/RrKflcVblF2GxKsSqS9uL
 G1vmxv3uFcW4PUPBiQFeH1NIyYbm/3KW2AqxzAynd54teE2dsVStUK9F8RfLIEAH0D
 U3afw/i30GH8dRSlPCtoci4AgXfQf7D4zvghbO33hIqIiKvCNELuS7JSf4i5XRO3/M
 ZTW2vtMh+Z4ptWAhevYRGGDnNVwfpBOyaPuKG+G+IrbCjms8ZPhn8AIiwidsXKlAVL
 7/yUOcNBi+0Ew==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	jaegeuk@kernel.org
Date: Wed, 11 May 2022 15:31:45 -0400
Message-Id: <20220511193146.27526-10-krisman@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511193146.27526-1-krisman@collabora.com>
References: <20220511193146.27526-1-krisman@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Instead of a bunch of ifdefs, make the unicode built checks
 part of the code flow where possible, as requested by Torvalds. Signed-off-by:
 Gabriel Krisman Bertazi <krisman@collabora.com> --- fs/ext4/ext4.h | 39
 +++++++++++++++++++
 fs/ext4/namei.c | 15 ++++++--------- fs/ext4/super.c | 4 +--- 3 files cha
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nos4V-0007Jv-LA
Subject: [f2fs-dev] [PATCH v4 09/10] ext4: Move CONFIG_UNICODE defguards
 into the code flow
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
Cc: ebiggers@kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>, kernel@collabora.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Instead of a bunch of ifdefs, make the unicode built checks part of the
code flow where possible, as requested by Torvalds.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 fs/ext4/ext4.h  | 39 +++++++++++++++++++--------------------
 fs/ext4/namei.c | 15 ++++++---------
 fs/ext4/super.c |  4 +---
 3 files changed, 26 insertions(+), 32 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 93a28fcb2e22..e3c55a8e23bd 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -2725,11 +2725,17 @@ extern unsigned ext4_free_clusters_after_init(struct super_block *sb,
 					      struct ext4_group_desc *gdp);
 ext4_fsblk_t ext4_inode_to_goal_block(struct inode *);
 
-#if IS_ENABLED(CONFIG_UNICODE)
 extern int ext4_fname_setup_ci_filename(struct inode *dir,
-					 const struct qstr *iname,
-					 struct ext4_filename *fname);
+					const struct qstr *iname,
+					struct ext4_filename *fname);
+
+static inline void ext4_fname_free_ci_filename(struct ext4_filename *fname)
+{
+#if IS_ENABLED(CONFIG_UNICODE)
+	kfree(fname->cf_name.name);
+	fname->cf_name.name = NULL;
 #endif
+}
 
 #ifdef CONFIG_FS_ENCRYPTION
 static inline void ext4_fname_from_fscrypt_name(struct ext4_filename *dst,
@@ -2758,9 +2764,9 @@ static inline int ext4_fname_setup_filename(struct inode *dir,
 
 	ext4_fname_from_fscrypt_name(fname, &name);
 
-#if IS_ENABLED(CONFIG_UNICODE)
-	err = ext4_fname_setup_ci_filename(dir, iname, fname);
-#endif
+	if (IS_ENABLED(CONFIG_UNICODE))
+		err = ext4_fname_setup_ci_filename(dir, iname, fname);
+
 	return err;
 }
 
@@ -2777,9 +2783,9 @@ static inline int ext4_fname_prepare_lookup(struct inode *dir,
 
 	ext4_fname_from_fscrypt_name(fname, &name);
 
-#if IS_ENABLED(CONFIG_UNICODE)
-	err = ext4_fname_setup_ci_filename(dir, &dentry->d_name, fname);
-#endif
+	if (IS_ENABLED(CONFIG_UNICODE))
+		err = ext4_fname_setup_ci_filename(dir, &dentry->d_name, fname);
+
 	return err;
 }
 
@@ -2794,10 +2800,7 @@ static inline void ext4_fname_free_filename(struct ext4_filename *fname)
 	fname->usr_fname = NULL;
 	fname->disk_name.name = NULL;
 
-#if IS_ENABLED(CONFIG_UNICODE)
-	kfree(fname->cf_name.name);
-	fname->cf_name.name = NULL;
-#endif
+	ext4_fname_free_ci_filename(fname);
 }
 #else /* !CONFIG_FS_ENCRYPTION */
 static inline int ext4_fname_setup_filename(struct inode *dir,
@@ -2810,9 +2813,8 @@ static inline int ext4_fname_setup_filename(struct inode *dir,
 	fname->disk_name.name = (unsigned char *) iname->name;
 	fname->disk_name.len = iname->len;
 
-#if IS_ENABLED(CONFIG_UNICODE)
-	err = ext4_fname_setup_ci_filename(dir, iname, fname);
-#endif
+	if (IS_ENABLED(CONFIG_UNICODE))
+		err = ext4_fname_setup_ci_filename(dir, iname, fname);
 
 	return err;
 }
@@ -2826,10 +2828,7 @@ static inline int ext4_fname_prepare_lookup(struct inode *dir,
 
 static inline void ext4_fname_free_filename(struct ext4_filename *fname)
 {
-#if IS_ENABLED(CONFIG_UNICODE)
-	kfree(fname->cf_name.name);
-	fname->cf_name.name = NULL;
-#endif
+	ext4_fname_free_ci_filename(fname);
 }
 #endif /* !CONFIG_FS_ENCRYPTION */
 
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 16fd0df5f8a8..0892f9ee15cf 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1757,8 +1757,7 @@ static struct dentry *ext4_lookup(struct inode *dir, struct dentry *dentry, unsi
 		}
 	}
 
-#if IS_ENABLED(CONFIG_UNICODE)
-	if (!inode && IS_CASEFOLDED(dir)) {
+	if (IS_ENABLED(CONFIG_UNICODE) && !inode && IS_CASEFOLDED(dir)) {
 		/* Eventually we want to call d_add_ci(dentry, NULL)
 		 * for negative dentries in the encoding case as
 		 * well.  For now, prevent the negative dentry
@@ -1766,7 +1765,7 @@ static struct dentry *ext4_lookup(struct inode *dir, struct dentry *dentry, unsi
 		 */
 		return NULL;
 	}
-#endif
+
 	return d_splice_alias(inode, dentry);
 }
 
@@ -3083,16 +3082,14 @@ static int ext4_rmdir(struct inode *dir, struct dentry *dentry)
 	ext4_fc_track_unlink(handle, dentry);
 	retval = ext4_mark_inode_dirty(handle, dir);
 
-#if IS_ENABLED(CONFIG_UNICODE)
 	/* VFS negative dentries are incompatible with Encoding and
 	 * Case-insensitiveness. Eventually we'll want avoid
 	 * invalidating the dentries here, alongside with returning the
 	 * negative dentries at ext4_lookup(), when it is better
 	 * supported by the VFS for the CI case.
 	 */
-	if (IS_CASEFOLDED(dir))
+	if (IS_ENABLED(CONFIG_UNICODE) && IS_CASEFOLDED(dir))
 		d_invalidate(dentry);
-#endif
 
 end_rmdir:
 	brelse(bh);
@@ -3188,16 +3185,16 @@ static int ext4_unlink(struct inode *dir, struct dentry *dentry)
 	retval = __ext4_unlink(handle, dir, &dentry->d_name, d_inode(dentry));
 	if (!retval)
 		ext4_fc_track_unlink(handle, dentry);
-#if IS_ENABLED(CONFIG_UNICODE)
+
 	/* VFS negative dentries are incompatible with Encoding and
 	 * Case-insensitiveness. Eventually we'll want avoid
 	 * invalidating the dentries here, alongside with returning the
 	 * negative dentries at ext4_lookup(), when it is  better
 	 * supported by the VFS for the CI case.
 	 */
-	if (IS_CASEFOLDED(dir))
+	if (IS_ENABLED(CONFIG_UNICODE) && IS_CASEFOLDED(dir))
 		d_invalidate(dentry);
-#endif
+
 	if (handle)
 		ext4_journal_stop(handle);
 
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 1847b46af808..fa0004459dd6 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -3645,14 +3645,12 @@ int ext4_feature_set_ok(struct super_block *sb, int readonly)
 		return 0;
 	}
 
-#if !IS_ENABLED(CONFIG_UNICODE)
-	if (ext4_has_feature_casefold(sb)) {
+	if (!IS_ENABLED(CONFIG_UNICODE) && ext4_has_feature_casefold(sb)) {
 		ext4_msg(sb, KERN_ERR,
 			 "Filesystem with casefold feature cannot be "
 			 "mounted without CONFIG_UNICODE");
 		return 0;
 	}
-#endif
 
 	if (readonly)
 		return 1;
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
