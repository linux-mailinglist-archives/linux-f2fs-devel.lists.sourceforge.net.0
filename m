Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 988D852C0F3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 May 2022 19:24:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrNP4-0003wI-Kb; Wed, 18 May 2022 17:24:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nrNP3-0003vy-0F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 17:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dTtuy6FHL3LDsNMmhMcZalJs4r3jCsg4l9LdOBoHKWs=; b=IeLxQzhIRNplSsXd+dVvd2vI8/
 J2GWTGRBiebaIO/Yod8wdKR3VOwBg4DhQdDkjiZaaDaV+Bb+Y8kEm+LM6TyMET/x+tk4a1a1+F8ri
 LnRCpwrcH+ivGZIl8XLw8vVWxytlS2otjSO7jcdlCzqZOl+tDWJEYOQPdlntt45AhkZk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dTtuy6FHL3LDsNMmhMcZalJs4r3jCsg4l9LdOBoHKWs=; b=jzqfaTZxXZ4kzVXKtFcEWtTikn
 3nUekVDehupJXgC9teFAOI9ceMGPQIDoX/LRP3LlTKNnQJOlsIgmM4ZMFmVwErYBHmCZhZo5/LIXA
 kwhyRC8qevLoeYxTYTn/YR1C/enAkdiCXGDbQg6P7KPJXbVLDPeg+UunQdckvOPTv/1Y=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrNP0-0007N1-D3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 17:24:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id CBBA01F41D2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652894636;
 bh=qMxG+YpzRa2Wq/dXFds2CiSdQlWL7Xpfua9M2xxz+Yo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fE/j4efQcO18YVnQn2Z/ck/HtH3yHG/qyxHZxcmP2hrny7b1xRMpV8xb295NlFwL7
 N7oCR6PY/BloslcLUJ9Jsp9ov1Lq8ldXOK96+gCHf3hPgrReltgKEKE5rPwfbdpysn
 Y7D73c7qxY+8oq2JfXFGy/VePX4BQle9xRJkc+9RxRIo/hVVhs0JCliAIqm5aDiXJX
 h9gxdMDojBaPBkw5kRssWOkwjSYahk7JyBbWdAPQE3BJ68nhz3XqD9j/MV1bnZhboI
 7hUkZVFFEck7CQS2tMB1BIRZs1c+I0P5rFXoHCUmgYQf8SyJLbNQPPtVGRc3dNOIBE
 qxaxCyBjIAKqg==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 ebiggers@kernel.org
Date: Wed, 18 May 2022 13:23:19 -0400
Message-Id: <20220518172320.333617-8-krisman@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220518172320.333617-1-krisman@collabora.com>
References: <20220518172320.333617-1-krisman@collabora.com>
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
 Gabriel Krisman Bertazi <krisman@collabora.com> --- Changes since v4: - Create
 stub for !CONFIG_UNICODE case (eric) --- fs/ext4/ext4.h | 37
 ++++++++++++++++++++
 fs/ext4/namei.c | 15 ++++++--------- fs/ext4/super.c | 4 +--- 3 files [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nrNP0-0007N1-D3
Subject: [f2fs-dev] [PATCH v5 7/8] ext4: Move CONFIG_UNICODE defguards into
 the code flow
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
Cc: linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>,
 kernel@collabora.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Instead of a bunch of ifdefs, make the unicode built checks part of the
code flow where possible, as requested by Torvalds.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

---
Changes since v4:
  - Create stub for !CONFIG_UNICODE case (eric)
---
 fs/ext4/ext4.h  | 37 ++++++++++++++++++++-----------------
 fs/ext4/namei.c | 15 ++++++---------
 fs/ext4/super.c |  4 +---
 3 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 93a28fcb2e22..c38999ee3627 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -2727,8 +2727,24 @@ ext4_fsblk_t ext4_inode_to_goal_block(struct inode *);
 
 #if IS_ENABLED(CONFIG_UNICODE)
 extern int ext4_fname_setup_ci_filename(struct inode *dir,
-					 const struct qstr *iname,
-					 struct ext4_filename *fname);
+					const struct qstr *iname,
+					struct ext4_filename *fname);
+
+static inline void ext4_fname_free_ci_filename(struct ext4_filename *fname)
+{
+	kfree(fname->cf_name.name);
+	fname->cf_name.name = NULL;
+}
+#else
+static inline int ext4_fname_setup_ci_filename(struct inode *dir,
+					       const struct qstr *iname,
+					       struct ext4_filename *fname)
+{
+	return 0;
+}
+static inline void ext4_fname_free_ci_filename(struct ext4_filename *fname)
+{
+}
 #endif
 
 #ifdef CONFIG_FS_ENCRYPTION
@@ -2758,9 +2774,7 @@ static inline int ext4_fname_setup_filename(struct inode *dir,
 
 	ext4_fname_from_fscrypt_name(fname, &name);
 
-#if IS_ENABLED(CONFIG_UNICODE)
 	err = ext4_fname_setup_ci_filename(dir, iname, fname);
-#endif
 	return err;
 }
 
@@ -2777,9 +2791,7 @@ static inline int ext4_fname_prepare_lookup(struct inode *dir,
 
 	ext4_fname_from_fscrypt_name(fname, &name);
 
-#if IS_ENABLED(CONFIG_UNICODE)
 	err = ext4_fname_setup_ci_filename(dir, &dentry->d_name, fname);
-#endif
 	return err;
 }
 
@@ -2794,10 +2806,7 @@ static inline void ext4_fname_free_filename(struct ext4_filename *fname)
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
@@ -2810,10 +2819,7 @@ static inline int ext4_fname_setup_filename(struct inode *dir,
 	fname->disk_name.name = (unsigned char *) iname->name;
 	fname->disk_name.len = iname->len;
 
-#if IS_ENABLED(CONFIG_UNICODE)
 	err = ext4_fname_setup_ci_filename(dir, iname, fname);
-#endif
-
 	return err;
 }
 
@@ -2826,10 +2832,7 @@ static inline int ext4_fname_prepare_lookup(struct inode *dir,
 
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
index 8fbb35187f72..f142c8fef750 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1755,8 +1755,7 @@ static struct dentry *ext4_lookup(struct inode *dir, struct dentry *dentry, unsi
 		}
 	}
 
-#if IS_ENABLED(CONFIG_UNICODE)
-	if (!inode && IS_CASEFOLDED(dir)) {
+	if (IS_ENABLED(CONFIG_UNICODE) && !inode && IS_CASEFOLDED(dir)) {
 		/* Eventually we want to call d_add_ci(dentry, NULL)
 		 * for negative dentries in the encoding case as
 		 * well.  For now, prevent the negative dentry
@@ -1764,7 +1763,7 @@ static struct dentry *ext4_lookup(struct inode *dir, struct dentry *dentry, unsi
 		 */
 		return NULL;
 	}
-#endif
+
 	return d_splice_alias(inode, dentry);
 }
 
@@ -3081,16 +3080,14 @@ static int ext4_rmdir(struct inode *dir, struct dentry *dentry)
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
@@ -3186,16 +3183,16 @@ static int ext4_unlink(struct inode *dir, struct dentry *dentry)
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
