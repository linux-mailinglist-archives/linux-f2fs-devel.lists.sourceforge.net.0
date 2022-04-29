Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC7E5153A1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Apr 2022 20:28:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkVLU-0001YB-Uw; Fri, 29 Apr 2022 18:28:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nkVLT-0001Xh-K9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 18:27:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pI5PYOwSrjKY1gxdkCtIy3MQOs0kdsXhBokyfSbsihI=; b=d09whUMLAWtIP1kztHoI/eoOVS
 FJttBGvuAiuo2Obc2vyKofbF6DBNA7hEmElh8U8f1VNUL/NxI2zpmtgs+AaFuNvXHFWbB8VolIO0B
 ftOBWWH3Qghpz7YqUKeF42sQmpUZvk2N4pZzqp3ZM4gszDsVEccRxuAIlynXnzbnVQGE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pI5PYOwSrjKY1gxdkCtIy3MQOs0kdsXhBokyfSbsihI=; b=c+zuypi2yCkGKKPqac+f0wvd23
 wzowKvG+qzAdAsxehOtR3fcmugpbWnsXo2M5vJEK1s1KDCJVdh4/MmBbUO8DIGpW4KHxIyP7iEETA
 MmqS35HCqcnM5zI2LESAb8S89WQF1Nk0lncRqzFnyUoAjQ81FHGZI/FAptXfxoO6rvDY=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkVLK-00E44X-TO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 18:27:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 93F991F46915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651256864;
 bh=PNCfTULIr3nrKnUhteldBCGbb9yM9LedJwSaGK5KYUM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H2VUxIzSMsVKyczIzkUF0vJjJdTgqq35QD30rygCksCp/WXOpfSVyQQPRfEhZJD01
 FO7+++wKTKKdE2uq7g8SNg9RC0qyU/Bhs9pe06Uii4RVCEebsMuHXb+oekfHqOXl0U
 zexPSyn/DUDQH2NuvH1FOm/CsiNfJBIzPs8yr7fxIwC7OjQROTeUiJRKxZrruhdKhY
 RBSA6cKdfWSHOVQqGTY4VHrxd5xYQKOQ9hglS7I4jBfJBG/YIl1i3eS4QbnKZLR2V9
 tvvwBxqk0VuGBrXN1bfsDQMceOkhF69IoobqToxvDvvAdN353Mcp6TcaTueeu2m1BX
 GY9ejRCMXBh/A==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	jaegeuk@kernel.org
Date: Fri, 29 Apr 2022 14:27:24 -0400
Message-Id: <20220429182728.14008-4-krisman@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429182728.14008-1-krisman@collabora.com>
References: <20220429182728.14008-1-krisman@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  By using a new type here, we can hide most of the caching
 casefold logic from ext4. The condition in ext4_match is now quite redundant, 
 but this is addressed in the next patch. This doesn't use ext4_filename to
 keep it generic, since the function will be moved to libfs to be shared with
 f2fs. Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
X-Headers-End: 1nkVLK-00E44X-TO
Subject: [f2fs-dev] [PATCH v3 3/7] ext4: Implement ci comparison using
 unicode_name
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

By using a new type here, we can hide most of the caching casefold logic
from ext4.  The condition in ext4_match is now quite redundant, but this
is addressed in the next patch.

This doesn't use ext4_filename to keep it generic, since the function
will be moved to libfs to be shared with f2fs.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

--
Changes since v1:
  - Instead of (ab)using fscrypt_name, create a new type (ebiggers).
---
 fs/ext4/namei.c    | 32 +++++++++++++++-----------------
 include/linux/fs.h |  5 +++++
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index c1a8a09369d1..5102652b5af4 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1321,20 +1321,19 @@ static void dx_insert_block(struct dx_frame *frame, u32 hash, ext4_lblk_t block)
 /**
  * ext4_match_ci() - Match (case-insensitive) a name with a dirent.
  * @parent: Inode of the parent of the dentry.
- * @name: name under lookup.
+ * @uname: name under lookup.
  * @de_name: Dirent name.
  * @de_name_len: dirent name length.
- * @quick: whether @name is already casefolded.
  *
  * Test whether a case-insensitive directory entry matches the filename
- * being searched.  If quick is set, the @name being looked up is
- * already in the casefolded form.
+ * being searched.
  *
  * Return: > 0 if the directory entry matches, 0 if it doesn't match, or
  * < 0 on error.
  */
-static int ext4_match_ci(const struct inode *parent, const struct qstr *name,
-			 u8 *de_name, size_t de_name_len, bool quick)
+static int ext4_match_ci(const struct inode *parent,
+			 const struct unicode_name *uname,
+			 u8 *de_name, size_t de_name_len)
 {
 	const struct super_block *sb = parent->i_sb;
 	const struct unicode_map *um = sb->s_encoding;
@@ -1357,10 +1356,10 @@ static int ext4_match_ci(const struct inode *parent, const struct qstr *name,
 		entry.len = decrypted_name.len;
 	}
 
-	if (quick)
-		ret = utf8_strncasecmp_folded(um, name, &entry);
+	if (uname->folded_name->name)
+		ret = utf8_strncasecmp_folded(um, uname->folded_name, &entry);
 	else
-		ret = utf8_strncasecmp(um, name, &entry);
+		ret = utf8_strncasecmp(um, uname->usr_name, &entry);
 
 	if (!ret)
 		match = true;
@@ -1370,8 +1369,8 @@ static int ext4_match_ci(const struct inode *parent, const struct qstr *name,
 		 * the names have invalid characters.
 		 */
 		ret = 0;
-		match = ((name->len == entry.len) &&
-			 !memcmp(name->name, entry.name, entry.len));
+		match = ((uname->usr_name->len == entry.len) &&
+			 !memcmp(uname->usr_name->name, entry.name, entry.len));
 	}
 
 out:
@@ -1427,6 +1426,7 @@ static bool ext4_match(struct inode *parent,
 			      const struct ext4_filename *fname,
 			      struct ext4_dir_entry_2 *de)
 {
+	struct unicode_name u;
 	struct fscrypt_name f;
 	int ret;
 
@@ -1451,14 +1451,12 @@ static bool ext4_match(struct inode *parent,
 					return false;
 				}
 			}
-
-			ret = ext4_match_ci(parent, &fname->cf_name, de->name,
-					    de->name_len, true);
-		} else {
-			ret = ext4_match_ci(parent, fname->usr_fname,
-					    de->name, de->name_len, false);
 		}
 
+		u.folded_name = &fname->cf_name;
+		u.usr_name = fname->usr_fname;
+
+		ret = ext4_match_ci(parent, &u, de->name, de->name_len);
 		if (ret < 0) {
 			/*
 			 * Treat comparison errors as not a match.  The
diff --git a/include/linux/fs.h b/include/linux/fs.h
index e2d892b201b0..3f76a18a5f40 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3358,6 +3358,11 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
 
 extern int generic_check_addressable(unsigned, u64);
 
+struct unicode_name {
+	const struct qstr *folded_name;
+	const struct qstr *usr_name;
+};
+
 extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
 
 #ifdef CONFIG_MIGRATION
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
