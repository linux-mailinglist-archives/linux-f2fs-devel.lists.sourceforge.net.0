Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 400A628323C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Oct 2020 10:38:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Epm5t2eFzFLZ91oSL3qYdCOPADw7qEdL3L0zw/etQLo=; b=GxEap79+FXyljbl9O8FzdOoI7
	VrcxMdN428vdudoCV6b1ifvTKP0YsN3L4PwCpz3fBhn5Jv8Iowbv7MlEVmvUhH/5/8fv4gcwtPCLY
	LQzvxYb+ybyKdPvMI1TDzPL/awA4oI+3JqLpXwIIRp7IBZVnLfGIgv2el99xEiLwfPuyQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kPM1G-0005Ny-3q; Mon, 05 Oct 2020 08:38:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <388x6XwYKAHoqYrwYremmejc.amk@flex--satyat.bounces.google.com>)
 id 1kPM1B-0005Mj-QV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Oct 2020 08:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dHnXF1W/20PFevqIJQyFZ/AoVLSu39bdQ59fV9E+wl8=; b=lYLVcwaMY4ymff6Iqdj0DowNI
 aZ8MC4wz90SucqzxdtxyXw8LRbwHovx8W2HMf7wl9Ub+a1Iv+U6WMfix2pswLuOl5U9EW/PL5p0lx
 TbTj5a302ovXZfnvVAWOYvND5BccmZXctkblOETxQmja4GXp8mAwec9W3soCHbPm5+vAs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dHnXF1W/20PFevqIJQyFZ/AoVLSu39bdQ59fV9E+wl8=; b=cZht9soHEqXiUOk6d71Qd9qStC
 0e//hBLLXnMa5VCBa/9peuvqskVud3wkhVkB0hJH0vBoTUZZxWWGYqgHE+ETpIYWSgcCpr8seUdsI
 CoMEh5+7m8IzdHxjNrgsB/OF1O7AS8IAHqg98UdNlBhKOGRNJUiu7yGMVstVZynL+7yk=;
Received: from mail-qk1-f201.google.com ([209.85.222.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kPM0x-0037Ui-O5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Oct 2020 08:38:48 +0000
Received: by mail-qk1-f201.google.com with SMTP id c19so6079460qkk.20
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 05 Oct 2020 01:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=dHnXF1W/20PFevqIJQyFZ/AoVLSu39bdQ59fV9E+wl8=;
 b=E5pc8PA5GYGj/I440mjbYVNg36emzQMnO+hi7qYN4H7GqJnYVHd3vHIelRNpOL6eMv
 tzuxw0/nPDAETVoxt6eZBwD5qBwSLsXfrxPAQgkg88dEnhKX3Q9sFmg/D5CIdREpp+Te
 SWGF34Yd4MfU5njKKa80akqUVvygeLoXzspfinE1I7MNi9xv1B7i+YvdIl3Z4OvfCwmB
 EvHpvfAeCGjQuoWQxIW+34RXQrQr0LpJGz/ck5yt4EI4QrC1pglSSUvFmG7iT9G0Q4TW
 ob8i9FEA29nXx0Nja3rITF7QIujNEBsSdbLQnqDPGYleolUiBe9QLmms/dQDdiu4CGSI
 1Ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=dHnXF1W/20PFevqIJQyFZ/AoVLSu39bdQ59fV9E+wl8=;
 b=dFUP/CbvZFk/FkXobpLteFEsYFLco+2NkDNcAL9SfpCtkkGetxueYfXal6Ttg6aquI
 wWPCuqtpRt+TyLe7gki8WWc4ad8RUmrEb4arcMa1d1zSwUtvnEnae0xSiX/wBzXBhrMD
 oU0cGP/vomjK/WonbOvXwsa7vjdwUH5st57K1AiLnVo4pvVzrWYJhSYZ3GKRNfDyLVqH
 wbSOPCXwz8y/5Dj7s9QhTpJjbwYJpfwLTQanL2oUudGmFzd2Y5UYxLb99lGld5p5klhe
 b7sAiIubVOCZNCkPxxhXpoIEwqbUuSDUKi0eeFGh6NIz4drloI+in+MXM1hYHiEeqhhb
 PqQQ==
X-Gm-Message-State: AOAM532GtrqosiuJPpNBObRU8tudqr9G7mauxOHihaZiJfa8jTbNGGMx
 s2+Ec9BlExk7UXeWwTZe6FT14HrXALc=
X-Google-Smtp-Source: ABdhPJxAbpf4N5rScmCx/y+iXragYL3MvKrQA/i8m/yLj2PrWyfMuN7hYU6zLGJn4YKr2zV7v+TlzTn9wpY=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:aa7:83d9:0:b029:138:b217:f347 with SMTP id
 j25-20020aa783d90000b0290138b217f347mr6813449pfn.0.1601883379697; Mon, 05 Oct
 2020 00:36:19 -0700 (PDT)
Date: Mon,  5 Oct 2020 07:36:06 +0000
In-Reply-To: <20201005073606.1949772-1-satyat@google.com>
Message-Id: <20201005073606.1949772-4-satyat@google.com>
Mime-Version: 1.0
References: <20201005073606.1949772-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.201 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kPM0x-0037Ui-O5
Subject: [f2fs-dev] [PATCH 3/3] f2fs: Add metadata encryption support
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
additions.

Introduces a new mount option for metadata encryption -
metadata_crypt_key=%s. The argument to this option is the key descriptor of
the metadata encryption key in hex. This key descriptor will be looked up
in the logon keyring with the "fscrypt:" prefix.

E.g. one might pass "-o metadata_crypt_key=ababcdcdefef0101" as the f2fs
mount option to the kernel, when the logon keyring has a key with the
descriptor "fscrypt:ababcdcdefef0101".

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
 Documentation/filesystems/f2fs.rst | 12 ++++++
 fs/f2fs/data.c                     | 24 +++++++----
 fs/f2fs/f2fs.h                     |  2 +
 fs/f2fs/super.c                    | 67 ++++++++++++++++++++++++++++--
 include/linux/f2fs_fs.h            |  3 +-
 5 files changed, 95 insertions(+), 13 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index ec8d99703ecb..94a294874707 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -266,6 +266,18 @@ inlinecrypt		 When possible, encrypt/decrypt the contents of encrypted
 			 inline encryption hardware. The on-disk format is
 			 unaffected. For more details, see
 			 Documentation/block/inline-encryption.rst.
+metadata_crypt_key=%s	 Specify the metadata encryption key for the filesystem.
+			 The argument to this option is the key descriptor of
+			 the metadata encryption key in hex. This key descriptor
+			 will be looked up in the logon keyring with the
+			 "fscrypt:" prefix. So e.g. one might pass "-o
+			 metadata_crypt_key=ababcdcdefef0101" as the f2fs mount
+			 option to the kernel, when the logon keyring has a key
+			 with the descriptor "fscrypt:ababcdcdefef0101".
+			 When an F2FS filesystem has metadata encryption enabled,
+			 all blocks in the FS other than the superblock are
+			 encrypted with the metadata encryption key. The
+			 superblock itself is stored in plaintext.
 ======================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 73683e58a08d..1b65313b57c8 100644
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
@@ -469,8 +469,13 @@ static void f2fs_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
 	 * The f2fs garbage collector sets ->encrypted_page when it wants to
 	 * read/write raw data without encryption.
 	 */
-	if (!fio || !fio->encrypted_page)
-		fscrypt_set_bio_crypt_ctx(bio, inode, first_idx, gfp_mask);
+	if (!fio || !fio->encrypted_page) {
+		if (fscrypt_needs_contents_encryption(inode))
+			fscrypt_set_bio_crypt_ctx(bio, inode, first_idx, gfp_mask);
+		else
+			fscrypt_metadata_crypt_bio(bio, blk_addr, inode->i_sb,
+						   gfp_mask);
+	}
 }
 
 static bool f2fs_crypt_mergeable_bio(struct bio *bio, const struct inode *inode,
@@ -712,7 +717,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	/* Allocate a new bio */
 	bio = __bio_alloc(fio, 1);
 
-	f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
+	f2fs_set_bio_crypt_ctx(bio, fio->new_blkaddr, fio->page->mapping->host,
 			       fio->page->index, fio, GFP_NOIO);
 
 	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
@@ -918,7 +923,8 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 	if (!bio) {
 		bio = __bio_alloc(fio, BIO_MAX_PAGES);
 		__attach_io_flag(fio);
-		f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
+		f2fs_set_bio_crypt_ctx(bio, fio->new_blkaddr,
+				       fio->page->mapping->host,
 				       fio->page->index, fio, GFP_NOIO);
 		bio_set_op_attrs(bio, fio->op, fio->op_flags);
 
@@ -992,7 +998,8 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 			goto skip;
 		}
 		io->bio = __bio_alloc(fio, BIO_MAX_PAGES);
-		f2fs_set_bio_crypt_ctx(io->bio, fio->page->mapping->host,
+		f2fs_set_bio_crypt_ctx(io->bio, fio->new_blkaddr,
+				       fio->page->mapping->host,
 				       bio_page->index, fio, GFP_NOIO);
 		io->fio = *fio;
 	}
@@ -1039,9 +1046,8 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 	if (!bio)
 		return ERR_PTR(-ENOMEM);
 
-	f2fs_set_bio_crypt_ctx(bio, inode, first_idx, NULL, GFP_NOFS);
-
 	f2fs_target_device(sbi, blkaddr, bio);
+	f2fs_set_bio_crypt_ctx(bio, blkaddr, inode, first_idx, NULL, GFP_NOFS);
 	bio->bi_end_io = f2fs_read_end_io;
 	bio_set_op_attrs(bio, REQ_OP_READ, op_flag);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d9e52a7f3702..8c5626a6f684 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4095,6 +4095,8 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 
 	if (f2fs_post_read_required(inode))
 		return true;
+	if (fscrypt_metadata_crypted(sbi->sb))
+		return true;
 	if (f2fs_is_multi_device(sbi))
 		return true;
 	/*
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9a6d375cbe4b..1c14c823a4e9 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -146,6 +146,7 @@ enum {
 	Opt_compress_algorithm,
 	Opt_compress_log_size,
 	Opt_compress_extension,
+	Opt_metadata_crypt_key,
 	Opt_err,
 };
 
@@ -213,6 +214,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_compress_algorithm, "compress_algorithm=%s"},
 	{Opt_compress_log_size, "compress_log_size=%u"},
 	{Opt_compress_extension, "compress_extension=%s"},
+	{Opt_metadata_crypt_key, "metadata_crypt_key=%s"},
 	{Opt_err, NULL},
 };
 
@@ -465,6 +467,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	unsigned char (*ext)[F2FS_EXTENSION_LEN];
 	int ext_cnt;
+#endif
+#ifdef CONFIG_FS_ENCRYPTION_METADATA
+	char *key_desc_hex = NULL;
+	int metadata_crypt_alg = le32_to_cpu(sbi->raw_super->metadata_crypt_alg);
 #endif
 	char *p, *name;
 	int arg = 0;
@@ -937,6 +943,35 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		case Opt_compress_extension:
 			f2fs_info(sbi, "compression options not supported");
 			break;
+#endif
+#ifdef CONFIG_FS_ENCRYPTION_METADATA
+		case Opt_metadata_crypt_key:
+			if (!metadata_crypt_alg) {
+				f2fs_err(sbi, "Filesystem doesn't have metadata encryption enabled, but a metadata encryption key was provided");
+				return -EINVAL;
+			}
+			if (is_remount) {
+				f2fs_warn(sbi, "Ignoring metadata crypt key specified for remount");
+				break;
+			}
+
+			if (fscrypt_metadata_crypted(sb)) {
+				f2fs_err(sbi, "Multiple metadata crypt key options specified");
+				return -EINVAL;
+			}
+
+			key_desc_hex = match_strdup(&args[0]);
+			if (!key_desc_hex)
+				return -ENOMEM;
+
+			if (fscrypt_setup_metadata_encryption(sb, key_desc_hex,
+							metadata_crypt_alg)) {
+				f2fs_err(sbi, "Could not setup metadata encryption");
+				kfree(key_desc_hex);
+				return -EINVAL;
+			}
+			kfree(key_desc_hex);
+			break;
 #endif
 		default:
 			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
@@ -964,6 +999,13 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		return -EINVAL;
 	}
 #endif
+#ifdef CONFIG_FS_ENCRYPTION_METADATA
+	if (metadata_crypt_alg &&
+	    !fscrypt_metadata_crypted(sb)) {
+		f2fs_err(sbi, "Filesystem has metadata encryption. Please provide metadata encryption key to mount filesystem");
+		return -EINVAL;
+	}
+#endif
 
 	if (F2FS_IO_SIZE_BITS(sbi) && !f2fs_lfs_mode(sbi)) {
 		f2fs_err(sbi, "Should set mode=lfs with %uKB-sized IO",
@@ -1249,6 +1291,8 @@ static void f2fs_put_super(struct super_block *sb)
 	iput(sbi->meta_inode);
 	sbi->meta_inode = NULL;
 
+	fscrypt_free_metadata_encryption(sb);
+
 	/*
 	 * iput() can update stat information, if f2fs_write_checkpoint()
 	 * above failed with error.
@@ -2504,6 +2548,9 @@ static int f2fs_get_num_devices(struct super_block *sb)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 
+	if (!sbi)
+		return 0;
+
 	if (f2fs_is_multi_device(sbi))
 		return sbi->s_ndevs;
 	return 1;
@@ -2873,6 +2920,13 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
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
@@ -3464,6 +3518,9 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		goto free_sb_buf;
 	}
 
+#ifdef CONFIG_FS_ENCRYPTION
+	sb->s_cop = &f2fs_cryptops;
+#endif
 	err = parse_options(sb, options, false);
 	if (err)
 		goto free_options;
@@ -3491,9 +3548,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 #endif
 
 	sb->s_op = &f2fs_sops;
-#ifdef CONFIG_FS_ENCRYPTION
-	sb->s_cop = &f2fs_cryptops;
-#endif
 #ifdef CONFIG_FS_VERITY
 	sb->s_vop = &f2fs_verityops;
 #endif
@@ -3602,6 +3656,12 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
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
@@ -3864,6 +3924,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	utf8_unload(sbi->s_encoding);
 #endif
 free_options:
+	fscrypt_free_metadata_encryption(sb);
 #ifdef CONFIG_QUOTA
 	for (i = 0; i < MAXQUOTAS; i++)
 		kfree(F2FS_OPTION(sbi).s_qf_names[i]);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 3c383ddd92dd..34cf0031dc8a 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -118,7 +118,8 @@ struct f2fs_super_block {
 	__u8 hot_ext_count;		/* # of hot file extension */
 	__le16  s_encoding;		/* Filename charset encoding */
 	__le16  s_encoding_flags;	/* Filename charset encoding flags */
-	__u8 reserved[306];		/* valid reserved region */
+	__le32	metadata_crypt_alg;	/* The metadata encryption algorithm (FSCRYPT_MODE_*) */
+	__u8 reserved[302];		/* valid reserved region */
 	__le32 crc;			/* checksum of superblock */
 } __packed;
 
-- 
2.28.0.806.g8561365e88-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
