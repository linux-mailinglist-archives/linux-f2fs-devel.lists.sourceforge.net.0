Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 465742DD3A7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 16:05:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kEf9IiX0WN4wqHK2Fl83TM/wS4mKQ6kicqC64uGnUMw=; b=QwoG9RCMqJjOHFDOqkGiLtRDh
	OMFVD27myGY2o2KfvxKBOqGcgqERokJyO6oOjqTb/iYUKAkPCXAL5Qov8F1hxnen5TeGnpFvOGy18
	iZ/cpP60iLToXP2sbZRvf5JG+FTAIDosTAejGchBHGQ4qO9Hsu1c9Oe0QwzVFKfqeQNSg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpuqB-0005aK-1p; Thu, 17 Dec 2020 15:05:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3k3PbXwYKAOwgOhmOhUccUZS.Qca@flex--satyat.bounces.google.com>)
 id 1kpuq7-0005a8-H6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gUHtlY29KgYt4sJ00WK6RieWdOsnGeYeOfjOKvllIlw=; b=Li1ZUuGnWVgcizMoVYf7jdxbw
 ixI4dNihlfjpc0F8D4Gp61v/xm7Tb9NKxNueGbCs6Ku7MzOUMTYXaUfyrcDcBt/qUqwkZFMMrezwD
 dcFk5YcWsCxyC0/xYS3cQ7Wns9CHI6UEulI/HszLRA2X6p5aNKwOO47J/nuGlZG5y4xPM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gUHtlY29KgYt4sJ00WK6RieWdOsnGeYeOfjOKvllIlw=; b=GI3bFKLUM0BA6huWL9j5qxfgrp
 ppNsu51Z34ANo5s+09gXKc+wTAi4xXVS/zs6cWBkeKAPX84yJpE3Qw2oG/EfhozqjlFOb7TEgAW6d
 XkwJUoSSz9G338dRM56N9XYVuEUjd78rlrxguZDAYocsEvekZIOjZx/t/+M1/WOaPgOQ=;
Received: from mail-qk1-f201.google.com ([209.85.222.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kpupt-000266-16
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:05:11 +0000
Received: by mail-qk1-f201.google.com with SMTP id n190so22466684qkf.18
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Dec 2020 07:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=gUHtlY29KgYt4sJ00WK6RieWdOsnGeYeOfjOKvllIlw=;
 b=hXnpH4iybBNdXkdra8xGAeRwak4mM5FsawfYx5o+i4XIL6/L+yIeNbxDaYs90z8g22
 excIt5dg2/HLr6cd3Lkm5YLaShtVzP8uvz5cb+54qwVzUHqFoguDecYQVWkeXAM3XYqz
 P8nQNJtuCctra0nAmlQ8umC2QMe4BKnpEgsQYKAM1fs+NMByfDmv60kd5yuwXJjTPvu0
 I+mpiun5a98CObtZMoDjuO+HHLOhiGJUcQQ0tri4E4mjRm5IoXIr72s28SFCJqgUNeGN
 b925rRpfbYE8YOsKsauH6l0c8V9kSX16sN8Hi1C733lL2AqXIHjJiHRc9zG+CnJDtKRH
 jdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=gUHtlY29KgYt4sJ00WK6RieWdOsnGeYeOfjOKvllIlw=;
 b=ibeD//pqE/kg1hxc9AAqh8Hc/CLP3X8FcQ5wQ836cvoNFDsWco+LSPbPtDn+EuGgkB
 pbfPO9kzantS0j3HkjQHQf9NFlMLKNcRfu4lidTHFvitARytNR5rL6ueIox7p/bJ2GLh
 m16exUwLReXny7AjmYqCs07I0XMx1UAg1Ie/mOEwNBYpwbmBYUxOFAJQdnyv6CPQzK5M
 NHEYRWWbtS96zyK56twkZKljSoy5wZy8g9BdA6p9XvlQlPUMooslbQW1F+wnNwMdo1SY
 PIJIUQMvGsFFP92Fv/hnflwn0P2BpXIjBwoIfPvnpizOJEvsXxDn/o3GFxOntILEHv3I
 PYSA==
X-Gm-Message-State: AOAM532OqSWXw653ZxOaZ+thsim7YF+zjFU9QyQSqzMDpO5IH6E2eXhv
 No0QBlliwUfVSU/oU6pMf8cGS1DJRU4=
X-Google-Smtp-Source: ABdhPJxfVLg4dVq1oQLbKGyjfcacFaij6ffBEa7ezVhjup4u5DaiBk1bP+eQsCkMuUm56B9OLd27A3wZ5NQ=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a0c:f00e:: with SMTP id
 z14mr28530594qvk.25.1608217491181; 
 Thu, 17 Dec 2020 07:04:51 -0800 (PST)
Date: Thu, 17 Dec 2020 15:04:35 +0000
In-Reply-To: <20201217150435.1505269-1-satyat@google.com>
Message-Id: <20201217150435.1505269-4-satyat@google.com>
Mime-Version: 1.0
References: <20201217150435.1505269-1-satyat@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.201 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.201 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kpupt-000266-16
Subject: [f2fs-dev] [PATCH v2 3/3] f2fs: Add metadata encryption support
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-fscrypt@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Wire up metadata encryption support with the fscrypt metadata crypt
additions. Note that this feature relies on the blk-crypto framework
for encryption, and thus requires either hardware inline encryption
support or the blk-crypto-fallback.

Filesystems can be configured with metadata encryption support using the
f2fs userspace tools (mkfs.f2fs). Once formatted, F2FS filesystems with
metadata encryption can be mounted as long as the required key is present.
fscrypt looks for a logon key with the key descriptor=
fscrypt:<metadata_key_identifier>. The metadata_key_identifier is stored in
the filesystem superblock (and the userspace tools print the required
key descriptor).

Right now, the superblock of the filesystem is itself not encrypted. F2FS
reads the superblock using sb_bread, which uses the bd_inode of the block
device as the address space for any data it reads from the block device -
the data read under the bd_inode address space must be what is physically
present on disk (i.e. if the superblock is encrypted, then the ciphertext
of the superblock must be present in the page cache in the bd_inode's
address space), but f2fs requires that the superblock is decrypted by
blk-crypto, which would put the decrypted page contents into the page cache
instead. We could make f2fs read the superblock by submitting bios directly
with a separate address space, but we choose to just not encrypt the
superblock for now.

Not encrypting the superblock allows us to store the encryption algorithm
used for metadata encryption within the superblock itself, which simplifies
a few things. The userspace tools will store the encryption algorithm in
the superblock when formatting the FS.

Direct I/O with metadata encryption is also not supported for now.
Attempts to do direct I/O on a metadata encrypted F2FS filesystem will fall
back to using buffered I/O (just as attempts to do direct I/O on fscrypt
encrypted files also fall back to buffered I/O).

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/f2fs/data.c          | 17 ++++++++--------
 fs/f2fs/f2fs.h          |  2 ++
 fs/f2fs/super.c         | 44 +++++++++++++++++++++++++++++++++++++----
 include/linux/f2fs_fs.h |  7 ++++++-
 4 files changed, 57 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 627164706029..4bb7d1dd2a18 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -460,8 +460,8 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 	return bio;
 }
 
-static void f2fs_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
-				  pgoff_t first_idx,
+static void f2fs_set_bio_crypt_ctx(struct bio *bio, block_t blk_addr,
+				  const struct inode *inode, pgoff_t first_idx,
 				  const struct f2fs_io_info *fio,
 				  gfp_t gfp_mask)
 {
@@ -470,7 +470,7 @@ static void f2fs_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
 	 * read/write raw data without encryption.
 	 */
 	if (!fio || !fio->encrypted_page)
-		fscrypt_set_bio_crypt_ctx(bio, 0, inode, first_idx, gfp_mask);
+		fscrypt_set_bio_crypt_ctx(bio, blk_addr, inode, first_idx, gfp_mask);
 }
 
 static bool f2fs_crypt_mergeable_bio(struct bio *bio, const struct inode *inode,
@@ -712,7 +712,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	/* Allocate a new bio */
 	bio = __bio_alloc(fio, 1);
 
-	f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
+	f2fs_set_bio_crypt_ctx(bio, fio->new_blkaddr, fio->page->mapping->host,
 			       fio->page->index, fio, GFP_NOIO);
 
 	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
@@ -918,7 +918,8 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 	if (!bio) {
 		bio = __bio_alloc(fio, BIO_MAX_PAGES);
 		__attach_io_flag(fio);
-		f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
+		f2fs_set_bio_crypt_ctx(bio, fio->new_blkaddr,
+				       fio->page->mapping->host,
 				       fio->page->index, fio, GFP_NOIO);
 		bio_set_op_attrs(bio, fio->op, fio->op_flags);
 
@@ -992,7 +993,8 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 			goto skip;
 		}
 		io->bio = __bio_alloc(fio, BIO_MAX_PAGES);
-		f2fs_set_bio_crypt_ctx(io->bio, fio->page->mapping->host,
+		f2fs_set_bio_crypt_ctx(io->bio, fio->new_blkaddr,
+				       fio->page->mapping->host,
 				       bio_page->index, fio, GFP_NOIO);
 		io->fio = *fio;
 	}
@@ -1039,9 +1041,8 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 	if (!bio)
 		return ERR_PTR(-ENOMEM);
 
-	f2fs_set_bio_crypt_ctx(bio, inode, first_idx, NULL, GFP_NOFS);
-
 	f2fs_target_device(sbi, blkaddr, bio);
+	f2fs_set_bio_crypt_ctx(bio, blkaddr, inode, first_idx, NULL, GFP_NOFS);
 	bio->bi_end_io = f2fs_read_end_io;
 	bio_set_op_attrs(bio, REQ_OP_READ, op_flag);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index cb700d797296..af2c1f5136d9 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4122,6 +4122,8 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 
 	if (f2fs_post_read_required(inode))
 		return true;
+	if (fscrypt_metadata_crypted(sbi->sb))
+		return true;
 	if (f2fs_is_multi_device(sbi))
 		return true;
 	/*
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 4872973d7a22..d817aa1cfc18 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -981,7 +981,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		return -EINVAL;
 	}
 #endif
-
 	if (F2FS_IO_SIZE_BITS(sbi) && !f2fs_lfs_mode(sbi)) {
 		f2fs_err(sbi, "Should set mode=lfs with %uKB-sized IO",
 			 F2FS_IO_SIZE_KB(sbi));
@@ -1268,6 +1267,8 @@ static void f2fs_put_super(struct super_block *sb)
 	iput(sbi->meta_inode);
 	sbi->meta_inode = NULL;
 
+	fscrypt_free_metadata_encryption(sb);
+
 	/*
 	 * iput() can update stat information, if f2fs_write_checkpoint()
 	 * above failed with error.
@@ -2533,6 +2534,9 @@ static int f2fs_get_num_devices(struct super_block *sb)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 
+	if (!sbi)
+		return 0;
+
 	if (f2fs_is_multi_device(sbi))
 		return sbi->s_ndevs;
 	return 1;
@@ -2910,6 +2914,13 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 		return -EFSCORRUPTED;
 	}
 
+	/* Check if FS has metadata encryption if kernel doesn't support it */
+#ifndef CONFIG_FS_ENCRYPTION_METADATA
+	if (raw_super->metadata_crypt_alg) {
+		f2fs_err(sbi, "Filesystem has metadata encryption but kernel support for it wasn't enabled");
+		return -EINVAL;
+	}
+#endif
 	/* check CP/SIT/NAT/SSA/MAIN_AREA area boundary */
 	if (sanity_check_area_boundary(sbi, bh))
 		return -EFSCORRUPTED;
@@ -3510,6 +3521,21 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 						sizeof(raw_super->uuid));
 
 	default_options(sbi);
+
+#ifdef CONFIG_FS_ENCRYPTION
+	sb->s_cop = &f2fs_cryptops;
+#endif
+	if (sbi->raw_super->metadata_crypt_alg) {
+		err = fscrypt_setup_metadata_encryption(sb,
+				sbi->raw_super->metadata_crypt_key_ident,
+				le32_to_cpu(sbi->raw_super->metadata_crypt_alg),
+				sizeof(block_t));
+		if (err) {
+			f2fs_err(sbi, "Could not setup metadata encryption");
+			goto free_sb_buf;
+		}
+	}
+
 	/* parse mount options */
 	options = kstrdup((const char *)data, GFP_KERNEL);
 	if (data && !options) {
@@ -3544,9 +3570,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 #endif
 
 	sb->s_op = &f2fs_sops;
-#ifdef CONFIG_FS_ENCRYPTION
-	sb->s_cop = &f2fs_cryptops;
-#endif
 #ifdef CONFIG_FS_VERITY
 	sb->s_vop = &f2fs_verityops;
 #endif
@@ -3658,6 +3681,12 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		goto free_devices;
 	}
 
+	err = fscrypt_metadata_crypt_prepare_all_devices(sb);
+	if (err) {
+		f2fs_err(sbi, "Failed to initialize metadata crypt on all devices");
+		goto free_devices;
+	}
+
 	err = f2fs_init_post_read_wq(sbi);
 	if (err) {
 		f2fs_err(sbi, "Failed to initialize post read workqueue");
@@ -3860,6 +3889,12 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 	f2fs_notice(sbi, "Mounted with checkpoint version = %llx",
 		    cur_cp_version(F2FS_CKPT(sbi)));
+	if (fscrypt_metadata_crypted(sb)) {
+		f2fs_notice(sbi, "Mounted with metadata key identifier = %s%*phN",
+			    FSCRYPT_KEY_DESC_PREFIX,
+			    FSCRYPT_KEY_IDENTIFIER_SIZE,
+			    sbi->raw_super->metadata_crypt_key_ident);
+	}
 	f2fs_update_time(sbi, CP_TIME);
 	f2fs_update_time(sbi, REQ_TIME);
 	clear_sbi_flag(sbi, SBI_CP_DISABLED_QUICK);
@@ -3931,6 +3966,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	fscrypt_free_dummy_policy(&F2FS_OPTION(sbi).dummy_enc_policy);
 	kvfree(options);
 free_sb_buf:
+	fscrypt_free_metadata_encryption(sb);
 	kfree(raw_super);
 free_sbi:
 	if (sbi->s_chksum_driver)
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index a5dbb57a687f..34b2f6156694 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -10,6 +10,7 @@
 
 #include <linux/pagemap.h>
 #include <linux/types.h>
+#include <linux/fscrypt.h>
 
 #define F2FS_SUPER_OFFSET		1024	/* byte-size offset */
 #define F2FS_MIN_LOG_SECTOR_SIZE	9	/* 9 bits for 512 bytes */
@@ -115,7 +116,11 @@ struct f2fs_super_block {
 	__u8 hot_ext_count;		/* # of hot file extension */
 	__le16  s_encoding;		/* Filename charset encoding */
 	__le16  s_encoding_flags;	/* Filename charset encoding flags */
-	__u8 reserved[306];		/* valid reserved region */
+	/* The metadata encryption algorithm (FSCRYPT_MODE_*) */
+	__le32 metadata_crypt_alg;
+	/* The metadata encryption key identifier */
+	__u8 metadata_crypt_key_ident[FSCRYPT_KEY_IDENTIFIER_SIZE];
+	__u8 reserved[286];		/* valid reserved region */
 	__le32 crc;			/* checksum of superblock */
 } __packed;
 
-- 
2.29.2.729.g45daf8777d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
