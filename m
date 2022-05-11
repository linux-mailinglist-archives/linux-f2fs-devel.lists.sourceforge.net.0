Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC172523D91
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 May 2022 21:32:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nos4d-0001uW-J1; Wed, 11 May 2022 19:32:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nos4c-0001uI-5R
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 19:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OAOicXaTooZP2BzF1RfrH/nrvulMAZZWXgoxm/XhX7c=; b=XI178QqtnkxQ78eyj5T+8eG7Cv
 +YJWOIMAW5po9+bPqiYILW4y/5kXh5n1pc2NT0h/HwJrrlOe2B6XqNTkGNh5KjZXmsyLrehe542uk
 yfuwW1exI9dkrOhJ9hU5tpTRXgq4kKM1mcEOXeKlu5k+pclHhM9AWSk80DEMUtB7QQV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OAOicXaTooZP2BzF1RfrH/nrvulMAZZWXgoxm/XhX7c=; b=lsCeTcEEI5xraWiezsMDTDrY6o
 ma1kxLYnoFZhqcRZdX99ZMShWDCcjpd6xGVL599qfsdE32+1askPTHCV3xyQcBAYCNjDi90a8x1IK
 bEKHwkrGIUZWqFl9GwvVeKr+lfO97lya0xNNj3dAIe2mstcGJ2Tf+eSyNnj3skRtaJH0=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nos4Z-0007KF-Na
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 19:32:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 5DAEB1F42944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652297549;
 bh=lWwjGPQZNKQyZU9L/pR9B/2LEb9B0zvK7S61tCd+dv8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y5u22+4IgucVqcfLjfcc8LdflwZG7JbI6mA2jIW+suVrl2Ggrnphft/0OZRtazk+W
 /+r/HhuptTJiwRfI3t83Urs6+FTsuX3lIwAkPXq2d8QzMKG23yVtGr10cr0n1X1Xr1
 InlazdsxP2/pwlmejtxaJFb5rP59/Ckgs85JOdyeLX47wr6P/RlOmr7BtqgGbdtS/j
 KDeVrPE6i7fnCITjBIJ/0loNZs5EixeB9CZfzwqqY/D4LfjEvDNAbFDBYsunn2J0IS
 8aH0b45fUDOti5xUN0lKzmvm9UtoNCF3GdHdXQLgmNpoS5vhaY1fqdX7Fz0nfP3JnU
 mljC93fN1sqPA==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	jaegeuk@kernel.org
Date: Wed, 11 May 2022 15:31:46 -0400
Message-Id: <20220511193146.27526-11-krisman@collabora.com>
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
 Content preview:  Instead of a bunch of ifdefs, make the unicode built checks
 part of the code flow where possible, as requested by Torvalds. Signed-off-by:
 Gabriel Krisman Bertazi <krisman@collabora.com> --- fs/f2fs/namei.c | 12
 ++++++------ fs/f2fs/super.c | 22 ++++++++++++ 2 files changed,
 18 insertions(+), 16 deletions(-) 
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
X-Headers-End: 1nos4Z-0007KF-Na
Subject: [f2fs-dev] [PATCH v4 10/10] f2fs: Move CONFIG_UNICODE defguards
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
 fs/f2fs/namei.c | 12 ++++++------
 fs/f2fs/super.c | 22 ++++++++++++----------
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 5f213f05556d..843e4102347d 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -561,8 +561,8 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 		goto out_iput;
 	}
 out_splice:
-#if IS_ENABLED(CONFIG_UNICODE)
-	if (!inode && IS_CASEFOLDED(dir)) {
+
+	if (IS_ENABLED(CONFIG_UNICODE) && !inode && IS_CASEFOLDED(dir)) {
 		/* Eventually we want to call d_add_ci(dentry, NULL)
 		 * for negative dentries in the encoding case as
 		 * well.  For now, prevent the negative dentry
@@ -571,7 +571,7 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 		trace_f2fs_lookup_end(dir, dentry, ino, err);
 		return NULL;
 	}
-#endif
+
 	new = d_splice_alias(inode, dentry);
 	err = PTR_ERR_OR_ZERO(new);
 	trace_f2fs_lookup_end(dir, dentry, ino, !new ? -ENOENT : err);
@@ -622,16 +622,16 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 		goto fail;
 	}
 	f2fs_delete_entry(de, page, dir, inode);
-#if IS_ENABLED(CONFIG_UNICODE)
+
 	/* VFS negative dentries are incompatible with Encoding and
 	 * Case-insensitiveness. Eventually we'll want avoid
 	 * invalidating the dentries here, alongside with returning the
 	 * negative dentries at f2fs_lookup(), when it is better
 	 * supported by the VFS for the CI case.
 	 */
-	if (IS_CASEFOLDED(dir))
+	if (IS_ENABLED(CONFIG_UNICODE) && IS_CASEFOLDED(dir))
 		d_invalidate(dentry);
-#endif
+
 	f2fs_unlock_op(sbi);
 
 	if (IS_DIRSYNC(dir))
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index baefd398ec1a..c336760ff743 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -278,12 +278,13 @@ f2fs_sb_read_encoding(const struct f2fs_super_block *sb)
 
 	return NULL;
 }
+#endif
 
 struct kmem_cache *f2fs_cf_name_slab;
 static int __init f2fs_create_casefold_cache(void)
 {
 	f2fs_cf_name_slab = f2fs_kmem_cache_create("f2fs_casefolded_name",
-							F2FS_NAME_LEN);
+						   F2FS_NAME_LEN);
 	if (!f2fs_cf_name_slab)
 		return -ENOMEM;
 	return 0;
@@ -293,10 +294,6 @@ static void f2fs_destroy_casefold_cache(void)
 {
 	kmem_cache_destroy(f2fs_cf_name_slab);
 }
-#else
-static int __init f2fs_create_casefold_cache(void) { return 0; }
-static void f2fs_destroy_casefold_cache(void) { }
-#endif
 
 static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
 {
@@ -1259,13 +1256,13 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		return -EINVAL;
 	}
 #endif
-#if !IS_ENABLED(CONFIG_UNICODE)
-	if (f2fs_sb_has_casefold(sbi)) {
+
+	if (!IS_ENABLED(CONFIG_UNICODE) && f2fs_sb_has_casefold(sbi)) {
 		f2fs_err(sbi,
 			"Filesystem with casefold feature cannot be mounted without CONFIG_UNICODE");
 		return -EINVAL;
 	}
-#endif
+
 	/*
 	 * The BLKZONED feature indicates that the drive was formatted with
 	 * zone alignment optimization. This is optional for host-aware
@@ -4611,7 +4608,10 @@ static int __init init_f2fs_fs(void)
 	err = f2fs_init_compress_cache();
 	if (err)
 		goto free_compress_mempool;
-	err = f2fs_create_casefold_cache();
+
+	if (IS_ENABLED(CONFIG_UNICODE))
+		err = f2fs_create_casefold_cache();
+
 	if (err)
 		goto free_compress_cache;
 	return 0;
@@ -4654,7 +4654,9 @@ static int __init init_f2fs_fs(void)
 
 static void __exit exit_f2fs_fs(void)
 {
-	f2fs_destroy_casefold_cache();
+	if (IS_ENABLED(CONFIG_UNICODE))
+		f2fs_destroy_casefold_cache();
+
 	f2fs_destroy_compress_cache();
 	f2fs_destroy_compress_mempool();
 	f2fs_destroy_bioset();
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
