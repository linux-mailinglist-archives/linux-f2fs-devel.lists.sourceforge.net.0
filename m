Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 766B352C0F1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 May 2022 19:23:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrNOs-0003u5-Fy; Wed, 18 May 2022 17:23:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nrNOr-0003tx-8I
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 17:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KAWy8evc9N2n8MfP1NtZmJMWa8r2xOV+CXTmiFcCN5A=; b=YAUE3s1w2tk0try1PksOUZuaXe
 O1P5KPdK4sGYFIe+O5PeM99Gx3ynef+zYPy50+77yANc57aJus6FSHCYTHrBmIXWjQua1LUtAPy3k
 WK4xr40ANdtHalIq3Ekz1XUsAyp+GDiwEd1pJxyYXk6bNfYQiN8s/e67tHYsGZFdOiPs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KAWy8evc9N2n8MfP1NtZmJMWa8r2xOV+CXTmiFcCN5A=; b=RhxClicnyLxkSevQfETz0kPlB3
 daCWV8ChS+a0CawJ9oq+IBGDFoftqyRiz/OU2OhawPet5Re/VHfgNjjHIYEjVtRuNA3CH/QHMRrfq
 hZNpkmZRXfTAqHUWmtn3/vS0uEuba4kPa9ku9bWwWBM99NKJ+alSF2nOPyGPkL0MAbqw=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrNOo-007B1c-1j
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 17:23:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 8CEA21F4549A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652894623;
 bh=hQs+goqTCvCaXTUy3btJlPvSkYbGWVY3DqR1VOH2yuo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gb8EMThQfx6jrVorGVUt8+Yg7lPZ66hkNvpdFnmzUJW/i47CbmBwSpfoSiOFQ1aho
 G0edZRFEKxhmUU9S/amP/dO+MtBGufEr4PbY/2sxRef+7gzfOwIHY8qoX5u8+9Ke9t
 OLFW61sKaAvvltEr9xR2Yq2PJdgvEzB3bwkqPS4K0ho1o4ZPEXoneRZi90I3pbkhdy
 PlU0a4drKE6MwL8TpLCOq6mXa267CT9xsv3U85LZr/Nia06YwO8DNGEgZBd127IThj
 8TNQ9CLTPl9iBxgpCeaaYosNoiGrFIqwraXyJZvQD7di/xR38dMcCQqgjcbRHM6NQT
 Yk72r+Eo+3GzA==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 ebiggers@kernel.org
Date: Wed, 18 May 2022 13:23:16 -0400
Message-Id: <20220518172320.333617-5-krisman@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220518172320.333617-1-krisman@collabora.com>
References: <20220518172320.333617-1-krisman@collabora.com>
MIME-Version: 1.0
X-Spam-Score: 1.5 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Instead of reimplementing ext4_match_ci, use the new libfs
 helper. Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com> ---
 fs/ext4/namei.c | 81 +++++++++++ 1 file changed, 17 insertions(+),
 64 deletions(-)
 Content analysis details:   (1.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 1.7 URIBL_BLACK            Contains an URL listed in the URIBL blacklist
 [URIs: entry.name]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
X-Headers-End: 1nrNOo-007B1c-1j
Subject: [f2fs-dev] [PATCH v5 4/8] ext4: Reuse generic_ci_match for ci
 comparisons
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

Instead of reimplementing ext4_match_ci, use the new libfs helper.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 fs/ext4/namei.c | 81 +++++++++++--------------------------------------
 1 file changed, 17 insertions(+), 64 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 206fcf8fdc16..98295b03a57c 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1318,58 +1318,6 @@ static void dx_insert_block(struct dx_frame *frame, u32 hash, ext4_lblk_t block)
 }
 
 #if IS_ENABLED(CONFIG_UNICODE)
-/*
- * Test whether a case-insensitive directory entry matches the filename
- * being searched for.  If quick is set, assume the name being looked up
- * is already in the casefolded form.
- *
- * Returns: 0 if the directory entry matches, more than 0 if it
- * doesn't match or less than zero on error.
- */
-static int ext4_ci_compare(const struct inode *parent, const struct qstr *name,
-			   u8 *de_name, size_t de_name_len, bool quick)
-{
-	const struct super_block *sb = parent->i_sb;
-	const struct unicode_map *um = sb->s_encoding;
-	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
-	struct qstr entry = QSTR_INIT(de_name, de_name_len);
-	int ret;
-
-	if (IS_ENCRYPTED(parent)) {
-		const struct fscrypt_str encrypted_name =
-				FSTR_INIT(de_name, de_name_len);
-
-		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
-		if (!decrypted_name.name)
-			return -ENOMEM;
-		ret = fscrypt_fname_disk_to_usr(parent, 0, 0, &encrypted_name,
-						&decrypted_name);
-		if (ret < 0)
-			goto out;
-		entry.name = decrypted_name.name;
-		entry.len = decrypted_name.len;
-	}
-
-	if (quick)
-		ret = utf8_strncasecmp_folded(um, name, &entry);
-	else
-		ret = utf8_strncasecmp(um, name, &entry);
-	if (ret < 0) {
-		/* Handle invalid character sequence as either an error
-		 * or as an opaque byte sequence.
-		 */
-		if (sb_has_strict_encoding(sb))
-			ret = -EINVAL;
-		else if (name->len != entry.len)
-			ret = 1;
-		else
-			ret = !!memcmp(name->name, entry.name, entry.len);
-	}
-out:
-	kfree(decrypted_name.name);
-	return ret;
-}
-
 int ext4_fname_setup_ci_filename(struct inode *dir, const struct qstr *iname,
 				  struct ext4_filename *name)
 {
@@ -1432,20 +1380,25 @@ static bool ext4_match(struct inode *parent,
 #if IS_ENABLED(CONFIG_UNICODE)
 	if (parent->i_sb->s_encoding && IS_CASEFOLDED(parent) &&
 	    (!IS_ENCRYPTED(parent) || fscrypt_has_encryption_key(parent))) {
-		if (fname->cf_name.name) {
-			if (IS_ENCRYPTED(parent)) {
-				if (fname->hinfo.hash != EXT4_DIRENT_HASH(de) ||
-					fname->hinfo.minor_hash !=
-						EXT4_DIRENT_MINOR_HASH(de)) {
+		int ret;
 
-					return false;
-				}
-			}
-			return !ext4_ci_compare(parent, &fname->cf_name,
-						de->name, de->name_len, true);
+		if (IS_ENCRYPTED(parent) &&
+		    (fname->hinfo.hash != EXT4_DIRENT_HASH(de) ||
+		     fname->hinfo.minor_hash != EXT4_DIRENT_MINOR_HASH(de)))
+			return false;
+
+		ret = generic_ci_match(parent, fname->usr_fname,
+				       &fname->cf_name, de->name,
+				       de->name_len);
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
