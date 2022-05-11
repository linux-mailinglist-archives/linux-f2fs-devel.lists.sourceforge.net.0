Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73740523D81
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 May 2022 21:32:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nos4A-0006kJ-Ga; Wed, 11 May 2022 19:32:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nos49-0006kC-A9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 19:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ziLo/35WOlEpD9i/JpaeUAPwvQBanMJ9OpNuSf79DS4=; b=GbH08BNfSF2flUcs6zfXrJIkID
 5oDgUYN1M+zFkSAI0B6nwgNIM6qf/gu24yMlfD38MPz4+aENypXLYNHrZuJbUws/sdouTjGh8+WbH
 jEqlKFxG84rfkNIpj0POL1MM4BnuUeSIyzEqXu6A7BAcfU9r4u0Iq5vX5ywwpGd9N2y8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ziLo/35WOlEpD9i/JpaeUAPwvQBanMJ9OpNuSf79DS4=; b=SV0kyFxA4mKiqJMV92XfbHSa56
 OIQfAIsE2LFcEgJHRxrBoJRl2HWAfg1w95MisuI8DFy03Sbw7kG2eO0kwe+/hA9INnK74a9RrTcyi
 CEr7TArUOb4JjH9StfltQjKkOBHLEekUXRM4cwwPZKaMNwrktCBYOtM7W3kw62LpPmI8=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nos45-0093g9-5y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 19:32:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 153E61F42928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652297518;
 bh=O8zfH0g0Xeoi4Ay416v/LfViHrCuc8wWuQ7aplb+RbU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BGGfiu69jffYTnTizKAlYk9TfjMnygcZFTtSWqP+htDMYOmxRV6x9cUGTt7ccG1hm
 BwLwhe3v7WDKQjpN0TzLrVszCppRlCfuRekqHtRp9k1xb2HqHoRGsTj0etGS54tTwt
 MSDAitgjs5oSwWK07k4t7X3mDgm8zWfHFTqi7ka7Gnftqn/LHHZel5qoxgs1VpCCgC
 B7kCCuamekyIG3NFF9/OuVpVmZ41bIRpvbmADZSuA9SJlPzEq3BruzNp9waeNfqbY6
 fnkm6/HLFMoHivGL5HLb5KKdWiKP40ayc3F1OMITIhtzEo3YAnacqJx1HjxtZGRgjI
 Ruo9DGi81whVw==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	jaegeuk@kernel.org
Date: Wed, 11 May 2022 15:31:37 -0400
Message-Id: <20220511193146.27526-2-krisman@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511193146.27526-1-krisman@collabora.com>
References: <20220511193146.27526-1-krisman@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  ext4_ci_compare originally follows utf8_*_strcmp, which means
 return zero on match. This means that every usage of that in ext4 negates
 the return. Turn it into a predicate function,
 let it follow the kernel convention
 and return true on match, which means it's now the same as its f2fs counterpart
 and can be extracted into generic code. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
X-Headers-End: 1nos45-0093g9-5y
Subject: [f2fs-dev] [PATCH v4 01/10] ext4: Match the f2fs ci_compare
 implementation
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

ext4_ci_compare originally follows utf8_*_strcmp, which means return
zero on match.  This means that every usage of that in ext4 negates
the return.

Turn it into a predicate function, let it follow the kernel convention
and return true on match, which means it's now the same as its f2fs
counterpart and can be extracted into generic code.

This change also makes it more obvious that we are ignoring error
handling in ext4_match, which can occur since casefolding support (bad
utf8 name due to disk corruption on strict mode causes -EINVAL) and
casefold+encryption (-ENOMEM).  For now, keep the behavior.  It is
handled by the following patches.

While we are there, change the comment to the kernel-doc style.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
changes since v3:
  - move variable into code guard (lkp)
changes since v1:
  - rename to match f2fs naming (Eric)
---
 fs/ext4/namei.c | 66 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 22 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 767b4bfe39c3..59eb3ecfdea7 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1318,22 +1318,29 @@ static void dx_insert_block(struct dx_frame *frame, u32 hash, ext4_lblk_t block)
 }
 
 #if IS_ENABLED(CONFIG_UNICODE)
-/*
+/**
+ * ext4_match_ci() - Match (case-insensitive) a name with a dirent.
+ * @parent: Inode of the parent of the dentry.
+ * @name: name under lookup.
+ * @de_name: Dirent name.
+ * @de_name_len: dirent name length.
+ * @quick: whether @name is already casefolded.
+ *
  * Test whether a case-insensitive directory entry matches the filename
- * being searched for.  If quick is set, assume the name being looked up
- * is already in the casefolded form.
+ * being searched.  If quick is set, the @name being looked up is
+ * already in the casefolded form.
  *
- * Returns: 0 if the directory entry matches, more than 0 if it
- * doesn't match or less than zero on error.
+ * Return: > 0 if the directory entry matches, 0 if it doesn't match, or
+ * < 0 on error.
  */
-static int ext4_ci_compare(const struct inode *parent, const struct qstr *name,
-			   u8 *de_name, size_t de_name_len, bool quick)
+static int ext4_match_ci(const struct inode *parent, const struct qstr *name,
+			 u8 *de_name, size_t de_name_len, bool quick)
 {
 	const struct super_block *sb = parent->i_sb;
 	const struct unicode_map *um = sb->s_encoding;
 	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
 	struct qstr entry = QSTR_INIT(de_name, de_name_len);
-	int ret;
+	int ret, match = false;
 
 	if (IS_ENCRYPTED(parent)) {
 		const struct fscrypt_str encrypted_name =
@@ -1354,20 +1361,22 @@ static int ext4_ci_compare(const struct inode *parent, const struct qstr *name,
 		ret = utf8_strncasecmp_folded(um, name, &entry);
 	else
 		ret = utf8_strncasecmp(um, name, &entry);
-	if (ret < 0) {
-		/* Handle invalid character sequence as either an error
-		 * or as an opaque byte sequence.
+
+	if (!ret)
+		match = true;
+	else if (ret < 0 && !sb_has_strict_encoding(sb)) {
+		/*
+		 * In non-strict mode, fallback to a byte comparison if
+		 * the names have invalid characters.
 		 */
-		if (sb_has_strict_encoding(sb))
-			ret = -EINVAL;
-		else if (name->len != entry.len)
-			ret = 1;
-		else
-			ret = !!memcmp(name->name, entry.name, entry.len);
+		ret = 0;
+		match = ((name->len == entry.len) &&
+			 !memcmp(name->name, entry.name, entry.len));
 	}
+
 out:
 	kfree(decrypted_name.name);
-	return ret;
+	return (ret >= 0) ? match : ret;
 }
 
 int ext4_fname_setup_ci_filename(struct inode *dir, const struct qstr *iname,
@@ -1431,6 +1440,8 @@ static bool ext4_match(struct inode *parent,
 #if IS_ENABLED(CONFIG_UNICODE)
 	if (parent->i_sb->s_encoding && IS_CASEFOLDED(parent) &&
 	    (!IS_ENCRYPTED(parent) || fscrypt_has_encryption_key(parent))) {
+		int ret;
+
 		if (fname->cf_name.name) {
 			struct qstr cf = {.name = fname->cf_name.name,
 					  .len = fname->cf_name.len};
@@ -1442,11 +1453,22 @@ static bool ext4_match(struct inode *parent,
 					return false;
 				}
 			}
-			return !ext4_ci_compare(parent, &cf, de->name,
-							de->name_len, true);
+			ret = ext4_match_ci(parent, &cf, de->name,
+					    de->name_len, true);
+		} else {
+			ret = ext4_match_ci(parent, fname->usr_fname,
+					    de->name, de->name_len, false);
+		}
+
+		if (ret < 0) {
+			/*
+			 * Treat comparison errors as not a match.  The
+			 * only case where it happens is on a disk
+			 * corruption or ENOMEM.
+			 */
+			return false;
 		}
-		return !ext4_ci_compare(parent, fname->usr_fname, de->name,
-						de->name_len, false);
+		return ret;
 	}
 #endif
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
