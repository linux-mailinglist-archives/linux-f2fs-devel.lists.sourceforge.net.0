Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C043131EE5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jan 2020 06:17:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=07w+mq6V+HzcuaDzfuf4JgKYsmEntneCSvFMkiBQ8pE=; b=gz6z1QEBWzq+l3QbEXnc8aGNJ
	5t55Ihlw+0aa7vQ+wNJBDbw/Kyn+SJBOrjAWaeZNQ58fx05pfGOL52Hui0T9YfuVZpyd9iOJJe5ag
	aOTvoou2lBxtwOP29+VNarNAu7EvTWf8iSR9SwXOFI9CWqHkjUPc8ydb1PEzgq12sJuZs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iohF1-0008NC-8z; Tue, 07 Jan 2020 05:17:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3TxQUXgYKAL4hvswirksskpi.gsq@flex--drosen.bounces.google.com>)
 id 1iohEz-0008N1-F0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jan 2020 05:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4AXPdE8yqNr+UTP/rFDx92PCwirFX2ZEqY++oHBRWKw=; b=a93bATzPGp9TtdHcpq81q/rii
 6LGxen1aaJ/IpJpqrMo44w7wMLgCeOsVPV079GPn/qWHvwUQbBEqo2+/scaCxPM7GZZT1k8Gf9oWi
 KcWuAYMXaHlzaRVag+eYyQ3lsXvh+TEmAOe88D/h9iCZDpeT/3eayjmPvqVmOqC4DVwhk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4AXPdE8yqNr+UTP/rFDx92PCwirFX2ZEqY++oHBRWKw=; b=HRxCrLP1nKdFBhmwhottgNR6aC
 fj2fCQqirPBjQ0YHBxnDUi1Evfx7+shROmHPMCBQNoQTIyTHN0ZsUTitMbumyFDB+OzCXiFVjumFR
 8O5ir2yWYcRcycUmlrSJsa7yvTmu+FtKFat/e5X7lsMTPH+Xmc29M6D0xf0m3Fmu/8fw=;
Received: from mail-pl1-f202.google.com ([209.85.214.202])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iohEu-00CAdL-Rd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jan 2020 05:17:16 +0000
Received: by mail-pl1-f202.google.com with SMTP id b5so20199013pls.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 06 Jan 2020 21:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=4AXPdE8yqNr+UTP/rFDx92PCwirFX2ZEqY++oHBRWKw=;
 b=qzzP4bBS8EuwmrADny3HdL+oILi5OWXafmr9+EgaY2XO4RFCDXp3Libc0vAx5RBSBI
 V06tRfqOBRd6GQ0WrFMsWW39pHL/Qb3Iupm+snRP5wV+h3+6zlxVfqIjwE6O8/8Lia7s
 FGD7j0ptw2XK5x1QcrH8OY9hspFgglumz3BRtmil+8X4JDjWb58BfPIoFc6fSx79Bkqu
 npccLvUDBK6yE8m75nVdQAhh9760gF9LrHT4RpxuOfmJqZWcAGJgFnZ1H4nXdf9sFN64
 W8wOJg0TPTXyQt0VO7glwmHkIWCCjVr65sZMEWJGRkSp6RoRy7dtdh8pYlNPtQgLx9Uy
 zRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=4AXPdE8yqNr+UTP/rFDx92PCwirFX2ZEqY++oHBRWKw=;
 b=Jkf76Y040fghxSTLiWttWG44NbiPMqDBQluK/w3OPXRa5PGSUaPUgYO+QdSjo18piQ
 lHi4KilhloWL/43aMpXFwuQcH9l3kQT6PKNDQnX6014tl7ekEVKe410J4p2zdvdElrkK
 JWP4woRNErWc0AoUgyYr984tFaHAyrmcMeGV4q5t7nkKmzywm7oHNyts5FwcrD09fqds
 XfwEZtPXwjcTAE8rmLP6mvxUEMf0f0XIuH0MhGP1LK5p4Hy0FtRhlP73SKaOazuPCvXA
 o2AytyUaj2HfaCRQC9iRNgWXRYcn7erPsIxEng6nxgAAHMYCUuw7mm/EWNg92mFUbL7T
 ZpJg==
X-Gm-Message-State: APjAAAWEW6gnxyaRbDoCaXPeniJiRAgw8gsTdE8oinqhTFmQnQbFJ6TL
 +2ImwutzqCZ1tL3vAGdKQiPwy7aavKQ=
X-Google-Smtp-Source: APXvYqxtgRC7ZYyzIQDkyWxrBFI07Wr/K1irtO1/YE8s4nlZku5QL85CamutHDyYgo2zl8vzSlHheFWVVis=
X-Received: by 2002:a63:ea4c:: with SMTP id
 l12mr111550676pgk.174.1578374223839; 
 Mon, 06 Jan 2020 21:17:03 -0800 (PST)
Date: Mon,  6 Jan 2020 21:16:38 -0800
In-Reply-To: <20200107051638.40893-1-drosen@google.com>
Message-Id: <20200107051638.40893-7-drosen@google.com>
Mime-Version: 1.0
References: <20200107051638.40893-1-drosen@google.com>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.202 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: disk_name.name]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.202 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iohEu-00CAdL-Rd
Subject: [f2fs-dev] [PATCH v2 6/6] ext4: Optimize match for casefolded
 encrypted dirs
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Matching names with casefolded encrypting directories requires
decrypting entries to confirm case since we are case preserving. We can
avoid needing to decrypt if our hash values don't match.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/ext4/ext4.h  | 17 ++++++++-------
 fs/ext4/namei.c | 55 ++++++++++++++++++++++++++-----------------------
 2 files changed, 38 insertions(+), 34 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index f06bab489d372..f104c46a68950 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -2393,9 +2393,9 @@ extern unsigned ext4_free_clusters_after_init(struct super_block *sb,
 ext4_fsblk_t ext4_inode_to_goal_block(struct inode *);
 
 #ifdef CONFIG_UNICODE
-extern void ext4_fname_setup_ci_filename(struct inode *dir,
+extern int ext4_fname_setup_ci_filename(struct inode *dir,
 					 const struct qstr *iname,
-					 struct fscrypt_str *fname);
+					 struct ext4_filename *fname);
 #endif
 
 #ifdef CONFIG_FS_ENCRYPTION
@@ -2426,9 +2426,9 @@ static inline int ext4_fname_setup_filename(struct inode *dir,
 	ext4_fname_from_fscrypt_name(fname, &name);
 
 #ifdef CONFIG_UNICODE
-	ext4_fname_setup_ci_filename(dir, iname, &fname->cf_name);
+	err = ext4_fname_setup_ci_filename(dir, iname, fname);
 #endif
-	return 0;
+	return err;
 }
 
 static inline int ext4_fname_prepare_lookup(struct inode *dir,
@@ -2445,9 +2445,9 @@ static inline int ext4_fname_prepare_lookup(struct inode *dir,
 	ext4_fname_from_fscrypt_name(fname, &name);
 
 #ifdef CONFIG_UNICODE
-	ext4_fname_setup_ci_filename(dir, &dentry->d_name, &fname->cf_name);
+	err = ext4_fname_setup_ci_filename(dir, &dentry->d_name, fname);
 #endif
-	return 0;
+	return err;
 }
 
 static inline void ext4_fname_free_filename(struct ext4_filename *fname)
@@ -2472,15 +2472,16 @@ static inline int ext4_fname_setup_filename(struct inode *dir,
 					    int lookup,
 					    struct ext4_filename *fname)
 {
+	int err = 0;
 	fname->usr_fname = iname;
 	fname->disk_name.name = (unsigned char *) iname->name;
 	fname->disk_name.len = iname->len;
 
 #ifdef CONFIG_UNICODE
-	ext4_fname_setup_ci_filename(dir, iname, &fname->cf_name);
+	err = ext4_fname_setup_ci_filename(dir, iname, fname);
 #endif
 
-	return 0;
+	return err;
 }
 
 static inline int ext4_fname_prepare_lookup(struct inode *dir,
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 42ed2e9d3a1f4..1357d82d27395 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -784,7 +784,9 @@ dx_probe(struct ext4_filename *fname, struct inode *dir,
 	if (hinfo->hash_version <= DX_HASH_TEA)
 		hinfo->hash_version += EXT4_SB(dir->i_sb)->s_hash_unsigned;
 	hinfo->seed = EXT4_SB(dir->i_sb)->s_hash_seed;
-	if (fname && fname_name(fname))
+	/* hash is already computed for encrypted casefolded directory */
+	if (fname && fname_name(fname) &&
+				!(IS_ENCRYPTED(dir) && IS_CASEFOLDED(dir)))
 		ext4fs_dirhash(dir, fname_name(fname), fname_len(fname), hinfo);
 	hash = hinfo->hash;
 
@@ -1352,19 +1354,21 @@ int ext4_ci_compare(struct inode *parent, const struct qstr *name,
 	return ret;
 }
 
-void ext4_fname_setup_ci_filename(struct inode *dir, const struct qstr *iname,
-				  struct fscrypt_str *cf_name)
+int ext4_fname_setup_ci_filename(struct inode *dir, const struct qstr *iname,
+				  struct ext4_filename *name)
 {
+	struct fscrypt_str *cf_name = &name->cf_name;
+	struct dx_hash_info *hinfo = &name->hinfo;
 	int len;
 
 	if (!needs_casefold(dir)) {
 		cf_name->name = NULL;
-		return;
+		return 0;
 	}
 
 	cf_name->name = kmalloc(EXT4_NAME_LEN, GFP_NOFS);
 	if (!cf_name->name)
-		return;
+		return -ENOMEM;
 
 	len = utf8_casefold(dir->i_sb->s_encoding,
 			    iname, cf_name->name,
@@ -1372,10 +1376,18 @@ void ext4_fname_setup_ci_filename(struct inode *dir, const struct qstr *iname,
 	if (len <= 0) {
 		kfree(cf_name->name);
 		cf_name->name = NULL;
-		return;
 	}
 	cf_name->len = (unsigned) len;
+	if (!IS_ENCRYPTED(dir))
+		return 0;
 
+	hinfo->hash_version = DX_HASH_SIPHASH;
+	hinfo->seed = NULL;
+	if (cf_name->name)
+		ext4fs_dirhash(dir, cf_name->name, cf_name->len, hinfo);
+	else
+		ext4fs_dirhash(dir, iname->name, iname->len, hinfo);
+	return 0;
 }
 #endif
 
@@ -1405,16 +1417,12 @@ static bool ext4_match(struct inode *parent,
 			struct qstr cf = {.name = fname->cf_name.name,
 					  .len = fname->cf_name.len};
 			if (IS_ENCRYPTED(parent)) {
-				struct dx_hash_info hinfo;
-
-				hinfo.hash_version = DX_HASH_SIPHASH;
-				hinfo.seed = NULL;
-				ext4fs_dirhash(parent, fname->cf_name.name,
-						fname_len(fname), &hinfo);
-				if (hinfo.hash != EXT4_DIRENT_HASH(de) ||
-						hinfo.minor_hash !=
-						    EXT4_DIRENT_MINOR_HASH(de))
+				if (fname->hinfo.hash != EXT4_DIRENT_HASH(de) ||
+					fname->hinfo.minor_hash !=
+						EXT4_DIRENT_MINOR_HASH(de)) {
+
 					return 0;
+				}
 			}
 			return !ext4_ci_compare(parent, &cf, de->name,
 							de->name_len, true);
@@ -2036,15 +2044,11 @@ void ext4_insert_dentry(struct inode *dir,
 	de->name_len = fname_len(fname);
 	memcpy(de->name, fname_name(fname), fname_len(fname));
 	if (ext4_hash_in_dirent(dir)) {
-		struct dx_hash_info hinfo;
+		struct dx_hash_info *hinfo = &fname->hinfo;
 
-		hinfo.hash_version = DX_HASH_SIPHASH;
-		hinfo.seed = NULL;
-		ext4fs_dirhash(dir, fname_usr_name(fname),
-				fname_len(fname), &hinfo);
-		EXT4_EXTENDED_DIRENT(de)->hash = cpu_to_le32(hinfo.hash);
+		EXT4_EXTENDED_DIRENT(de)->hash = cpu_to_le32(hinfo->hash);
 		EXT4_EXTENDED_DIRENT(de)->minor_hash =
-				cpu_to_le32(hinfo.minor_hash);
+						cpu_to_le32(hinfo->minor_hash);
 	}
 }
 
@@ -2195,10 +2199,9 @@ static int make_indexed_dir(handle_t *handle, struct ext4_filename *fname,
 	if (fname->hinfo.hash_version <= DX_HASH_TEA)
 		fname->hinfo.hash_version += EXT4_SB(dir->i_sb)->s_hash_unsigned;
 	fname->hinfo.seed = EXT4_SB(dir->i_sb)->s_hash_seed;
-	if (ext4_hash_in_dirent(dir))
-		ext4fs_dirhash(dir, fname_usr_name(fname),
-				fname_len(fname), &fname->hinfo);
-	else
+
+	/* casefolded encrypted hashes are computed on fname setup */
+	if (!ext4_hash_in_dirent(dir))
 		ext4fs_dirhash(dir, fname_name(fname),
 				fname_len(fname), &fname->hinfo);
 
-- 
2.24.1.735.g03f4e72817-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
