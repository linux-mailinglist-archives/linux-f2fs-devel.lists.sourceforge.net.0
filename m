Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D32B85B7DB1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Sep 2022 01:59:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oYFo8-0003Sd-WC;
	Tue, 13 Sep 2022 23:59:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@collabora.com>) id 1oYFo7-0003Rx-4h
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 23:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v21BwDjGifqQ0l1K9dGdxoTEOIcJ7tunhncbB/oA2Is=; b=bbyoGFR21MnorRy7AXdM0G3TqD
 DgEhgFF3Pv4y9cOCMwvjRiT3X7BVbfixEUdkoQqRe6Lv/a4O4wmygXP1qJQrrmWct2TIiAemkNZCe
 5I/1Gy5HkftCvNMw9DfW1hLX/o8QN7odk/SoA3boBhmiOuTgffcdVAtzIXACscZE4FFo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v21BwDjGifqQ0l1K9dGdxoTEOIcJ7tunhncbB/oA2Is=; b=FNEhOwsB78ajKEBWVQqesc0xG3
 qBuhjK+0MhJrZ5iWTan6JBmPoOtQ62+0BePZ8wzNkkjcQYD/WriQxVhypegpbUqFH9f1571ICCxvy
 J8TxplcfJVJfsrqlJEFi12MnZTvtG4nc6ee/ZSx2Dae05d3PYkMaJ8PzAkveFVczrqo0=;
Received: from madras.collabora.co.uk ([46.235.227.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oYFoI-007NNv-5N for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 23:59:23 +0000
Received: from localhost (modemcable141.102-20-96.mc.videotron.ca
 [96.20.102.141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: krisman)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 316156602027;
 Wed, 14 Sep 2022 00:42:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663112535;
 bh=Ye9ctBXY+vK0987QXsEMGtd9H+aj+uA1GWgh+3zErFs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PO3G7/U8atFyPFJPblUtyhzpZxHfRTadKtBSaLs8jVU2Enzp93qQSljfYNE1GvKix
 7CylNDWWyonLFUHCgb9QFOI4GtD+ekGjRx20pLw8FpdxYjwYnSW3xpFBNA+8/SCWp5
 s/yxIVwSwS9yWZpFdTelIRhJz+MktIswRdW9bJVyiJdup27Y5H4cQZBa5ZU1JSqNpP
 j+PLqpgFIK/lMBul8TJIGb71j0Re5rwXJv4hKhULy1tG68io6sSOjMDtJwa9N3KxrJ
 poWWtY1vad6uU948endtdN8kAn0YxZ/LAFFgAhcRxqIRJ14yNrFBnF1kbXk9oaHxAC
 mO2Ww44MRbe4Q==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 ebiggers@kernel.org
Date: Tue, 13 Sep 2022 19:41:46 -0400
Message-Id: <20220913234150.513075-5-krisman@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913234150.513075-1-krisman@collabora.com>
References: <20220913234150.513075-1-krisman@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Instead of reimplementing ext4_match_ci, use the new libfs
 helper. It also adds a comment explaining why fname->cf_name.name must be
 checked prior to the encryption hash optimization, because that tripped me
 before. Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oYFoI-007NNv-5N
Subject: [f2fs-dev] [PATCH v9 4/8] ext4: Reuse generic_ci_match for ci
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

It also adds a comment explaining why fname->cf_name.name must be
checked prior to the encryption hash optimization, because that tripped
me before.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

---
Changes since v6:
  - Readd cf_name != NULL on hash verification and comment explaining it (eric)
---
 fs/ext4/namei.c | 91 +++++++++++++++----------------------------------
 1 file changed, 27 insertions(+), 64 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 089ea8b42a1e..9c892c58abf2 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1364,58 +1364,6 @@ static void dx_insert_block(struct dx_frame *frame, u32 hash, ext4_lblk_t block)
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
@@ -1478,20 +1426,35 @@ static bool ext4_match(struct inode *parent,
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
+		/*
+		 * Just checking IS_ENCRYPTED(parent) below is not
+		 * sufficient to decide whether one can use the hash for
+		 * skipping the string comparison, because the key might
+		 * have been added right after
+		 * ext4_fname_setup_ci_filename().  In this case, a hash
+		 * mismatch will be a false negative.  Therefore, make
+		 * sure cf_name was properly initialized before
+		 * considering the calculated hash.
+		 */
+		if (IS_ENCRYPTED(parent) && fname->cf_name.name &&
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
2.37.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
