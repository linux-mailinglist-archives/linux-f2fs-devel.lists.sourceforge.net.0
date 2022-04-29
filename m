Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D500F5153AA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Apr 2022 20:28:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkVLf-0001aW-A6; Fri, 29 Apr 2022 18:28:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nkVLe-0001ZZ-5M
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 18:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BrAXTMvTIhycLuK0grcieo2H56kgVrTIGRjLGiNEa04=; b=k5Y0IMEE20hEXtAeK4cDlhVPRb
 x3QSb+/wSmsRnPR1cdCDJ7f1QzY2qu47l6i30xCtEAl7pj+8Hr2LerXboz5qp6zl3vjqWV3LiecCj
 zlsKUPaWVDtACl4fPlSfdd9emL9SWcfZVNlVmAlqKPLTQ/I46wBQh4IhNm2duy0y8UAI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BrAXTMvTIhycLuK0grcieo2H56kgVrTIGRjLGiNEa04=; b=QnznfC2f7LXqGJBACZ7Kk/zGnf
 LdoaV4bfocdrm46opM4Y5VxmH/ASAgEeFIAScZ/wjWuadMcRac25QQ+BEAZT4ghSfmUX4AVSW2j/L
 lPwIi6LWPqJH2gA8lXWXA1MGE5rGRquzRYAj37w8ebS+izgUckeFkdxn+Gl+COtZ2xyQ=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkVLZ-0001sG-Nu
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 18:28:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 698541F46913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651256879;
 bh=e2mIC2NlA+jrtGJdGyDt40xQfgyktaRVyuhlRHDssdg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mhUIS5KolkDEVLKydJJGwtmBAUfMjZYY65SAMwLu6HY0GWa8UA9NyMk5vsKnhBGnz
 6DaiSFCen8PCqjZq2AAcDKydm37BU3MTUx2JhKJjxwnN5Fm1PPtJBehtmOGlf+ztIz
 Te9ORRP6J//LieyP1Pg1U6xMFBcwOsKPAtj2ETUeBot/Oef9d6SghZ2ecVHh1FdTjW
 TbCFGcRx1G3+vrc5pg1BAPcjOGtug7aLvHvHZl8DHGzTwBJsEoehQ8dPEGVROjAq7p
 4hJ/Jtu7f7chzSdZjk+pOSr2pdIils3iffVpSlw6kgkAEL7OM8TrDEHW1w79s3XPNE
 xG9FZ3q5ArwXw==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	jaegeuk@kernel.org
Date: Fri, 29 Apr 2022 14:27:28 -0400
Message-Id: <20220429182728.14008-8-krisman@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429182728.14008-1-krisman@collabora.com>
References: <20220429182728.14008-1-krisman@collabora.com>
MIME-Version: 1.0
X-Spam-Score: 1.5 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Now that ci_match is part of libfs,
 make f2fs reuse it instead
 of having a different implementation. Signed-off-by: Gabriel Krisman Bertazi
 <krisman@collabora.com> --- fs/f2fs/dir.c | 58 ++++ 1 file changed,
 4 insertions(+), 54 deletions(-) 
 Content analysis details:   (1.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.7 URIBL_BLACK            Contains an URL listed in the URIBL blacklist
 [URIs: entry.name]
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
X-Headers-End: 1nkVLZ-0001sG-Nu
Subject: [f2fs-dev] [PATCH v3 7/7] f2fs: Reuse generic_ci_match for ci
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
Cc: ebiggers@kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>, kernel@collabora.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Now that ci_match is part of libfs, make f2fs reuse it instead of having
a different implementation.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 fs/f2fs/dir.c | 58 ++++-----------------------------------------------
 1 file changed, 4 insertions(+), 54 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 166f08623362..c39b3abbf99e 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -208,69 +208,19 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
 	return f2fs_find_target_dentry(&d, fname, max_slots);
 }
 
-#if IS_ENABLED(CONFIG_UNICODE)
-/*
- * Test whether a case-insensitive directory entry matches the filename
- * being searched for.
- *
- * Returns 1 for a match, 0 for no match, and -errno on an error.
- */
-static int f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
-			       const u8 *de_name, u32 de_name_len)
-{
-	const struct super_block *sb = dir->i_sb;
-	const struct unicode_map *um = sb->s_encoding;
-	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
-	struct qstr entry = QSTR_INIT(de_name, de_name_len);
-	int res;
-
-	if (IS_ENCRYPTED(dir)) {
-		const struct fscrypt_str encrypted_name =
-			FSTR_INIT((u8 *)de_name, de_name_len);
-
-		if (WARN_ON_ONCE(!fscrypt_has_encryption_key(dir)))
-			return -EINVAL;
-
-		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
-		if (!decrypted_name.name)
-			return -ENOMEM;
-		res = fscrypt_fname_disk_to_usr(dir, 0, 0, &encrypted_name,
-						&decrypted_name);
-		if (res < 0)
-			goto out;
-		entry.name = decrypted_name.name;
-		entry.len = decrypted_name.len;
-	}
-
-	res = utf8_strncasecmp_folded(um, name, &entry);
-	/*
-	 * In strict mode, ignore invalid names.  In non-strict mode,
-	 * fall back to treating them as opaque byte sequences.
-	 */
-	if (res < 0 && !sb_has_strict_encoding(sb)) {
-		res = name->len == entry.len &&
-				memcmp(name->name, entry.name, name->len) == 0;
-	} else {
-		/* utf8_strncasecmp_folded returns 0 on match */
-		res = (res == 0);
-	}
-out:
-	kfree(decrypted_name.name);
-	return res;
-}
-#endif /* CONFIG_UNICODE */
-
 static inline int f2fs_match_name(const struct inode *dir,
 				   const struct f2fs_filename *fname,
 				   const u8 *de_name, u32 de_name_len)
 {
 	struct fscrypt_name f;
+	struct unicode_name u;
 
 #if IS_ENABLED(CONFIG_UNICODE)
 	if (fname->cf_name.name) {
 		struct qstr cf = FSTR_TO_QSTR(&fname->cf_name);
-
-		return f2fs_match_ci_name(dir, &cf, de_name, de_name_len);
+		u.folded_name = &cf;
+		u.usr_name = fname->usr_fname;
+		return generic_ci_match(dir, &u, (u8*) de_name, de_name_len);
 	}
 #endif
 	f.usr_fname = fname->usr_fname;
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
