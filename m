Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9212405CEF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Sep 2021 20:45:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mOP3T-0002XG-SL; Thu, 09 Sep 2021 18:45:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1mOP3T-0002X9-3t
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Sep 2021 18:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eIRUV177R/6HfuoI8FHarmoyfNkO4pVielfxANQnT94=; b=B/QgJiA2Zllqox+ufZGNc3FGlU
 DeS9I5L5W7b5AkjZSvmpzNS/T7HWqoMMuizNBRpMIn13A0NHXifHhE4KYisV5SkRepQ8S5dSgm08M
 jnRbCyZ5XhhLl3Ha7LxcDkGejTZLR374oPz3D3v1NaZiKTgtSh0YN8h9sPsa3ixpyWfA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eIRUV177R/6HfuoI8FHarmoyfNkO4pVielfxANQnT94=; b=j
 0/42YgMp3rziyPNH+a3RcCEzkoMwaZmgbsQwG2N2ZBAIvqjckMtNkoZS8wC7qm570X5Z1JNqdPH/T
 Kru82I3v1F9Ug8OLzyb3foqQnyCU/F/Hsh/oWt7WUrhuIf2yaCoIX/5GYjsiHHic64sAN/cpn7Was
 pHiVNfKWN8iyf+uo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mOP3R-005BPz-8m
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Sep 2021 18:45:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE7B8610CE;
 Thu,  9 Sep 2021 18:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631213139;
 bh=aoyQEZvSd1+vYy9qkBjguGDggRTI0dLHoK9hq7Mx2yY=;
 h=From:To:Cc:Subject:Date:From;
 b=KXvkGpIrxCmJIdH1Km0g/8dgNjJHNKJJjqP5enlPVfhL+RYlDftQ7viPPIy8THpR8
 quKG2AnonGHE5r2rhH8iPJejTdvE+0/IKAS0AlZTE67DfWfmStoSo1STy0uhp3O/3J
 WzJBeoe1XtOeeVT+d4oRzrcQ82eexPguYWwiRLqDzRxQ4LQqnZ2m9Ag3wmcOquaCWs
 POCb9PUcH+dYTMwRwMYHI81XtGSSfr9/S5+/s63PsGqNWuoW0q+O6HTBPmUYgojO3i
 fQEADAswkp/rtccTS8vLlJ49dNtxGcC8gtcM5JdR1CWyxizM4p2g65XnKOJp5rMYZ8
 SANHIGYjwBAVA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu,  9 Sep 2021 11:45:13 -0700
Message-Id: <20210909184513.139281-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> The max_namelen
 field
 is unnecessary, as it is set to 255 (NAME_MAX) on all filesystems that support
 fscrypt (or plan to support fscrypt). For simplicity,
 just use NAME_MAX directly instead. 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mOP3R-005BPz-8m
Subject: [f2fs-dev] [PATCH] fscrypt: remove fscrypt_operations::max_namelen
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
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

The max_namelen field is unnecessary, as it is set to 255 (NAME_MAX) on
all filesystems that support fscrypt (or plan to support fscrypt).  For
simplicity, just use NAME_MAX directly instead.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fname.c       | 3 +--
 fs/ext4/super.c         | 1 -
 fs/f2fs/super.c         | 1 -
 fs/ubifs/crypto.c       | 1 -
 include/linux/fscrypt.h | 3 ---
 5 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index eb538c28df940..a9be4bc74a94a 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -429,8 +429,7 @@ int fscrypt_setup_filename(struct inode *dir, const struct qstr *iname,
 
 	if (fscrypt_has_encryption_key(dir)) {
 		if (!fscrypt_fname_encrypted_size(&dir->i_crypt_info->ci_policy,
-						  iname->len,
-						  dir->i_sb->s_cop->max_namelen,
+						  iname->len, NAME_MAX,
 						  &fname->crypto_buf.len))
 			return -ENAMETOOLONG;
 		fname->crypto_buf.name = kmalloc(fname->crypto_buf.len,
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 136940af00b88..47212d7c02b84 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1566,7 +1566,6 @@ static const struct fscrypt_operations ext4_cryptops = {
 	.set_context		= ext4_set_context,
 	.get_dummy_policy	= ext4_get_dummy_policy,
 	.empty_dir		= ext4_empty_dir,
-	.max_namelen		= EXT4_NAME_LEN,
 	.has_stable_inodes	= ext4_has_stable_inodes,
 	.get_ino_and_lblk_bits	= ext4_get_ino_and_lblk_bits,
 };
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 78ebc306ee2b5..cf049a042482b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2976,7 +2976,6 @@ static const struct fscrypt_operations f2fs_cryptops = {
 	.set_context		= f2fs_set_context,
 	.get_dummy_policy	= f2fs_get_dummy_policy,
 	.empty_dir		= f2fs_empty_dir,
-	.max_namelen		= F2FS_NAME_LEN,
 	.has_stable_inodes	= f2fs_has_stable_inodes,
 	.get_ino_and_lblk_bits	= f2fs_get_ino_and_lblk_bits,
 	.get_num_devices	= f2fs_get_num_devices,
diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index 22be7aeb96c4f..c57b46a352d8f 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -82,5 +82,4 @@ const struct fscrypt_operations ubifs_crypt_operations = {
 	.get_context		= ubifs_crypt_get_context,
 	.set_context		= ubifs_crypt_set_context,
 	.empty_dir		= ubifs_crypt_empty_dir,
-	.max_namelen		= UBIFS_MAX_NLEN,
 };
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index e912ed9141d9d..91ea9477e9bd2 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -118,9 +118,6 @@ struct fscrypt_operations {
 	 */
 	bool (*empty_dir)(struct inode *inode);
 
-	/* The filesystem's maximum ciphertext filename length, in bytes */
-	unsigned int max_namelen;
-
 	/*
 	 * Check whether the filesystem's inode numbers and UUID are stable,
 	 * meaning that they will never be changed even by offline operations
-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
