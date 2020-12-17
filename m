Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F56A2DD3CA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 16:10:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=soUNwq3XDqpKNpGdUXOJbvxToloR3X/QQj4VQxqUwMg=; b=l8Ry1405684ca+Fj+hwQJWW+1
	vGSuih10xjCBdCsux5Ms8FB4xQrOhSP7WZaWy6+8wYyAWtfXMeleC/XCkma7ppRdj7f+85bBvf1Iw
	+sF2y0wXCBO4LG5XV51daocNwNeV1DR/YZefeEYU7K0k9Phm2CSYsysKyonF2JYftDfwQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpuvR-0004fJ-Rh; Thu, 17 Dec 2020 15:10:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <35nTbXwYKAEMxfy3fylttlqj.htr@flex--satyat.bounces.google.com>)
 id 1kpuvP-0004ep-TX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=++TotkQ1z+X0zzxeRHf1h4kyqkNEnjDXm22E4kriCUQ=; b=keBUdEN0p3cMG5KKYJqIBvW6k
 k9NEmRBqcpN1vKDY7sIvyAdc+IWTHRR2fnwnG6Yp94U+kW2Lnur5ihS25gxNFjqFrJflA7huL930h
 E5623QwfX6wOP74vZU3ZPHLatBFRRRr8vWcBSBiqNMDziTWL1QgWYrcj2zUWWdwe6D0IE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=++TotkQ1z+X0zzxeRHf1h4kyqkNEnjDXm22E4kriCUQ=; b=eklIokiO5la+k5Rj2U8r1li0g1
 zzwsislVWGsmeHexVgzqfftMpg4/7fkicv1gDb4rUw9zgz3gR06h6wfCA2bpPSpnKLuCYw10rnFvD
 ybVP+BmDxIRwjcT4oqstnwGKw1BzhoopOAWVZVEIYSnt2/XNVZ6vOcjkxxb8W6BF5Fdc=;
Received: from mail-pf1-f202.google.com ([209.85.210.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kpuvM-000FNF-2H
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:10:39 +0000
Received: by mail-pf1-f202.google.com with SMTP id q22so18701876pfj.20
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Dec 2020 07:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=++TotkQ1z+X0zzxeRHf1h4kyqkNEnjDXm22E4kriCUQ=;
 b=FKQ6cyW6OEGxmCmb11+E+YMDad6B6aAZ9T6FLYoi/ongAFylaPKIK0tKmj0cHOU1FG
 4FNj7PXW/P2qpwA4Dpe/qEB6oprXqrgh6PWfPKEmkBANShvsFlZAzq8Ip2fyTv6j9C5d
 QJU1qMCuoYNKdVWTsOvQ3vcyPDTBVa++i2devEn/sG+P9baaFbyapF9kRtQX5XZUxIk9
 G4GjhPMwf/7u7tTaV1JE/2JG8WWt6WN75ff1JdgX3nj5ZIYwuNZwKpFME4k3adMitGrc
 h3GJM8okmTe+j940Hh6Mm2s4rQAwzX1wa/QhRdPiFE0S6iVBsQJ9BdJ7Ovaq9hEfAFrO
 6T8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=++TotkQ1z+X0zzxeRHf1h4kyqkNEnjDXm22E4kriCUQ=;
 b=qAQ4WbgCv2yIDsrahh4EncbTOUiGiOWD+dMV3bsaH+FiHnAa/b+XONaf+kuN2LZizi
 l7gMHuIcRKWW2IzOHSQoMX3dGUwkx15Q4k/4rDE1hRYnuWE9NFrDzVI5zwA//0PxZ2wa
 ltFmbHD/aKLr68wI9DXETtN6vH9OnvY14Bgd6sGtvXiBtmcrHP2seSUio32j4G+J9rvi
 mfQVhi4X2QVjaC46C2CYPElgL9n8E7ODpR2/M8qQ4BUtBIMK1j5S7UF7chp3BMoKkK8a
 bf1M+Wn4Wf6w+FPh4uieY0ok8+qx89nJl7+2oVxfV0XsgOi53KzndVxbygcB7/t9lF4F
 xyNw==
X-Gm-Message-State: AOAM530FNLYMEUm5G1aktGUr5z7mtyZG7xb9WZBBesqzcFhyMzEMO3hK
 k1qAheaylmabpOeSQo5r14HfZBW2UZE=
X-Google-Smtp-Source: ABdhPJxnATrAurdLM44eyMC0wK1oz60VltCe4DRXvsIOL0RNtohr3hXjx987O7Fc0j7JcYYRcYXxDjscYFw=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a17:902:9a49:b029:da:b3b0:94a1 with SMTP id
 x9-20020a1709029a49b02900dab3b094a1mr6572158plv.11.1608217830230; Thu, 17 Dec
 2020 07:10:30 -0800 (PST)
Date: Thu, 17 Dec 2020 15:10:12 +0000
In-Reply-To: <20201217151013.1513045-1-satyat@google.com>
Message-Id: <20201217151013.1513045-2-satyat@google.com>
Mime-Version: 1.0
References: <20201217151013.1513045-1-satyat@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
 Chao Yu <chao@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: makefile.am]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.202 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kpuvM-000FNF-2H
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs-tools: Introduce metadata encryption
 support
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
Cc: Satya Tangirala <satyat@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Introduce native metadata encryption support for f2fs. All blocks
other than the super block (and its redundant copy) are encrypted with the
specified metadata encryption key and algorithm. The IV for each block is
its block number in the filesystem.

This patch introduces two new options '-A' and '-M' for specifying metadata
crypt options to mkfs.f2fs. '-A' takes the desired metadata encryption
algorithm as argument. '-M' takes the linux key_serial of the metadata
crypt key as the argument. The keyring key provided must be of a key
type that supports reading the payload from userspace.

mkfs.f2fs stores the encryption algorithm and the key's identifier in the
superblock of the FS. The key's identifier is derived from the raw metadata
key. The key identifier will be verified at mount time by the kernel by
doing the same derivation on the raw metadata key (hence the metadata
crypt key must be inserted with the same description as what mkfs.f2fs
stores in the superblock and prints to stdout, before the filesystem can
be mounted). The actual metadata encryption key used to encrypt metadata
is derived from the raw metadata key (for details, refer to
f2fs_metadata_process_key_serial()).

The rest of the programs use the encryption algorithm and the key
identifier stored in the superblock of the FS. They also verify that
the payload of the key matches the identifier of the key, before proceeding
to use the key.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 README                        |   2 +
 configure.ac                  |   2 +
 fsck/main.c                   |   2 +
 fsck/mount.c                  |  27 +++-
 include/f2fs_fs.h             |  21 ++-
 include/f2fs_metadata_crypt.h |  33 ++++
 lib/Makefile.am               |   4 +-
 lib/f2fs_metadata_crypt.c     | 284 ++++++++++++++++++++++++++++++++++
 lib/libf2fs.c                 |   3 -
 lib/libf2fs_io.c              |  78 +++++++++-
 man/fsck.f2fs.8               |   5 +-
 man/mkfs.f2fs.8               |  44 ++++++
 mkfs/f2fs_format.c            |   8 +-
 mkfs/f2fs_format_main.c       |  35 ++++-
 14 files changed, 529 insertions(+), 19 deletions(-)
 create mode 100644 include/f2fs_metadata_crypt.h
 create mode 100644 lib/f2fs_metadata_crypt.c

diff --git a/README b/README
index 4ea3356..881bebc 100644
--- a/README
+++ b/README
@@ -13,6 +13,8 @@ You should install the following packages.
  - autoconf
  - libtool
  - libselinux1-dev
+ - libkeyutils-dev
+ - libkcapi-dev
 
 Initial compilation
 -------------------
diff --git a/configure.ac b/configure.ac
index 1e5619d..ddda70a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -85,9 +85,11 @@ AC_CHECK_HEADERS(m4_flatten([
 	attr/xattr.h
 	byteswap.h
 	fcntl.h
+	kcapi.h
 	linux/blkzoned.h
 	linux/falloc.h
 	linux/fs.h
+	linux/fscrypt.h
 	linux/hdreg.h
 	linux/limits.h
 	linux/posix_acl.h
diff --git a/fsck/main.c b/fsck/main.c
index 32559f1..36c9095 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -26,6 +26,8 @@
 #include <stdbool.h>
 #include "quotaio.h"
 
+#include "f2fs_metadata_crypt.h"
+
 struct f2fs_fsck gfsck;
 
 #ifdef WITH_ANDROID
diff --git a/fsck/mount.c b/fsck/mount.c
index 8ebc5b0..5cbc962 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -11,6 +11,7 @@
 #include "fsck.h"
 #include "node.h"
 #include "xattr.h"
+#include "f2fs_metadata_crypt.h"
 #include <locale.h>
 #include <stdbool.h>
 #ifdef HAVE_LINUX_POSIX_ACL_H
@@ -561,12 +562,21 @@ void print_sb_state(struct f2fs_super_block *sb)
 	if (f & cpu_to_le32(F2FS_FEATURE_COMPRESSION)) {
 		MSG(0, "%s", " compression");
 	}
+
 	MSG(0, "\n");
 	MSG(0, "Info: superblock encrypt level = %d, salt = ",
 					sb->encryption_level);
 	for (i = 0; i < 16; i++)
 		MSG(0, "%02x", sb->encrypt_pw_salt[i]);
 	MSG(0, "\n");
+
+	if (sb->metadata_crypt_alg) {
+		MSG(0, "Info: Metadata encryption enabled. Alg = %d, key identifier = fscrypt:",
+		    get_sb(metadata_crypt_alg));
+	}
+	for (i = 0; i < FSCRYPT_KEY_IDENTIFIER_SIZE; i++)
+		MSG(0, "%02x", sb->metadata_crypt_key_ident[i]);
+	MSG(0, "\n");
 }
 
 static inline bool is_valid_data_blkaddr(block_t blkaddr)
@@ -686,7 +696,7 @@ void update_superblock(struct f2fs_super_block *sb, int sb_mask)
 	memcpy(buf + F2FS_SUPER_OFFSET, sb, sizeof(*sb));
 	for (addr = SB0_ADDR; addr < SB_MAX_ADDR; addr++) {
 		if (SB_MASK(addr) & sb_mask) {
-			ret = dev_write_block(buf, addr);
+			ret = dev_write_block_no_encrypt(buf, addr);
 			ASSERT(ret >= 0);
 		}
 	}
@@ -940,7 +950,7 @@ int validate_super_block(struct f2fs_sb_info *sbi, enum SB_ADDR sb_addr)
 	if (!sbi->raw_super)
 		return -ENOMEM;
 
-	if (dev_read_block(buf, sb_addr))
+	if (dev_read_block_no_decrypt(buf, sb_addr))
 		return -1;
 
 	memcpy(sbi->raw_super, buf + F2FS_SUPER_OFFSET,
@@ -3499,6 +3509,19 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 	}
 	sb = F2FS_RAW_SUPER(sbi);
 
+	/* Setup metadata encryption */
+	c.metadata_crypt_alg = get_sb(metadata_crypt_alg);
+	if (c.metadata_crypt_alg) {
+		ret = f2fs_metadata_process_key_ident(
+						sb->metadata_crypt_key_ident);
+		if (ret)
+			return ret;
+
+		ret = f2fs_metadata_verify_args();
+		if (ret)
+			return ret;
+	}
+
 	ret = check_sector_size(sb);
 	if (ret)
 		return -1;
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index b5bda13..1f12607 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -49,6 +49,8 @@
 #include <selinux/label.h>
 #endif
 
+#include <linux/fscrypt.h>
+
 #ifdef UNUSED
 #elif defined(__GNUC__)
 # define UNUSED(x) UNUSED_ ## x __attribute__((unused))
@@ -175,6 +177,9 @@ static inline uint64_t bswap_64(uint64_t val)
 
 #define NULL_SEGNO	((unsigned int)~0)
 
+#define ARRAY_SIZE(array)			\
+	(sizeof(array) / sizeof(array[0]))
+
 /*
  * Debugging interfaces
  */
@@ -345,6 +350,7 @@ typedef struct {
 	bool dbg_en;
 } dev_cache_config_t;
 
+struct kcapi_handle;
 struct f2fs_configuration {
 	u_int32_t reserved_segments;
 	u_int32_t new_reserved_segments;
@@ -441,6 +447,13 @@ struct f2fs_configuration {
 
 	/* cache parameters */
 	dev_cache_config_t cache_config;
+
+	/* metadata encryption */
+	__u8 *metadata_crypt_key;
+	__u8 metadata_crypt_key_ident[FSCRYPT_KEY_IDENTIFIER_SIZE];
+	int metadata_crypt_key_len;
+	int metadata_crypt_alg;
+	struct kcapi_handle *kcapi_handle;
 };
 
 #ifdef CONFIG_64BIT
@@ -675,7 +688,11 @@ struct f2fs_super_block {
 	__u8 hot_ext_count;		/* # of hot file extension */
 	__le16  s_encoding;		/* Filename charset encoding */
 	__le16  s_encoding_flags;	/* Filename charset encoding flags */
-	__u8 reserved[306];		/* valid reserved region */
+	/* The metadata encryption algorithm (FSCRYPT_MODE_*) */
+	__le32 metadata_crypt_alg;
+	/* The metadata crypt key identifier */
+	__u8 metadata_crypt_key_ident[FSCRYPT_KEY_IDENTIFIER_SIZE];
+	__u8 reserved[286];		/* valid reserved region */
 	__le32 crc;			/* checksum of superblock */
 } __attribute__((packed));
 
@@ -1237,12 +1254,14 @@ extern int dev_readahead(__u64, size_t UNUSED(len));
 #endif
 extern int dev_write(void *, __u64, size_t);
 extern int dev_write_block(void *, __u64);
+extern int dev_write_block_no_encrypt(void *, __u64);
 extern int dev_write_dump(void *, __u64, size_t);
 /* All bytes in the buffer must be 0 use dev_fill(). */
 extern int dev_fill(void *, __u64, size_t);
 extern int dev_fill_block(void *, __u64);
 
 extern int dev_read_block(void *, __u64);
+extern int dev_read_block_no_decrypt(void *, __u64);
 extern int dev_reada_block(__u64);
 
 extern int dev_read_version(void *, __u64, size_t);
diff --git a/include/f2fs_metadata_crypt.h b/include/f2fs_metadata_crypt.h
new file mode 100644
index 0000000..6aece31
--- /dev/null
+++ b/include/f2fs_metadata_crypt.h
@@ -0,0 +1,33 @@
+/**
+ * f2fs_metadata_crypt.h
+ *
+ * Copyright (c) 2020 Google LLC
+ *
+ * Dual licensed under the GPL or LGPL version 2 licenses.
+ */
+
+#include <inttypes.h>
+#include <linux/fscrypt.h>
+#include <keyutils.h>
+
+#ifndef HKDF_CONTEXT_METADATA_ENC_KEY
+#define HKDF_CONTEXT_KEY_IDENTIFIER	1
+#define HKDF_CONTEXT_METADATA_ENC_KEY	8
+#endif
+
+#ifndef FSCRYPT_MAX_IV_SIZE
+#define FSCRYPT_MAX_IV_SIZE 32
+#endif
+
+int f2fs_get_crypt_alg(const char *optarg);
+
+void f2fs_print_crypt_algs(void);
+
+int f2fs_metadata_process_key_serial(key_serial_t key_serial);
+
+int f2fs_metadata_process_key_ident(u8 key_ident[FSCRYPT_KEY_IDENTIFIER_SIZE]);
+
+int f2fs_metadata_verify_args(void);
+
+void *f2fs_metadata_crypt_blocks(void *src_buf, size_t len, __u64 blk_addr,
+	bool encrypt);
diff --git a/lib/Makefile.am b/lib/Makefile.am
index 871d773..a0173d0 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -2,10 +2,10 @@
 
 lib_LTLIBRARIES = libf2fs.la
 
-libf2fs_la_SOURCES = libf2fs.c libf2fs_io.c libf2fs_zoned.c nls_utf8.c
+libf2fs_la_SOURCES = libf2fs.c libf2fs_io.c libf2fs_zoned.c nls_utf8.c f2fs_metadata_crypt.c
 libf2fs_la_CFLAGS = -Wall
 libf2fs_la_CPPFLAGS = -I$(top_srcdir)/include
-libf2fs_la_LDFLAGS = -version-info $(LIBF2FS_CURRENT):$(LIBF2FS_REVISION):$(LIBF2FS_AGE)
+libf2fs_la_LDFLAGS = -lkeyutils -lkcapi -version-info $(LIBF2FS_CURRENT):$(LIBF2FS_REVISION):$(LIBF2FS_AGE)
 
 root_libdir=@root_libdir@
 
diff --git a/lib/f2fs_metadata_crypt.c b/lib/f2fs_metadata_crypt.c
new file mode 100644
index 0000000..3869788
--- /dev/null
+++ b/lib/f2fs_metadata_crypt.c
@@ -0,0 +1,284 @@
+/**
+ * f2fs_metadata_crypt.c
+ *
+ * Copyright (c) 2020 Google LLC
+ *
+ * Dual licensed under the GPL or LGPL version 2 licenses.
+ */
+#include <string.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <sys/socket.h>
+#include <linux/if_alg.h>
+#include <linux/socket.h>
+#include <assert.h>
+#include <errno.h>
+#include <kcapi.h>
+
+#include "f2fs_fs.h"
+#include "f2fs_metadata_crypt.h"
+
+extern struct f2fs_configuration c;
+const struct f2fs_crypt_mode {
+	const char *friendly_name;
+	const char *cipher_str;
+	unsigned int keysize;
+	unsigned int ivlen;
+} f2fs_crypt_modes[] = {
+	[FSCRYPT_MODE_AES_256_XTS] = {
+		.friendly_name = "AES-256-XTS",
+		.cipher_str = "xts(aes)",
+		.keysize = 64,
+		.ivlen = 16,
+	},
+	[FSCRYPT_MODE_ADIANTUM] = {
+		.friendly_name = "Adiantum",
+		.cipher_str = "adiantum(xchacha12,aes)",
+		.keysize = 32,
+		.ivlen = 32,
+	},
+};
+#define MAX_IV_LEN 32
+
+void f2fs_print_crypt_algs(void)
+{
+	int i;
+
+	for (i = 1; i < ARRAY_SIZE(f2fs_crypt_modes); i++) {
+		if (!f2fs_crypt_modes[i].friendly_name)
+			continue;
+		MSG(0, "\t%s\n", f2fs_crypt_modes[i].friendly_name);
+	}
+}
+
+int f2fs_get_crypt_alg(const char *optarg)
+{
+	int i;
+
+	for (i = 1; i < ARRAY_SIZE(f2fs_crypt_modes); i++) {
+		if (f2fs_crypt_modes[i].friendly_name &&
+		    !strcmp(f2fs_crypt_modes[i].friendly_name, optarg)) {
+			return i;
+		}
+	}
+
+	return 0;
+}
+
+int f2fs_metadata_hkdf(u8 *key, unsigned int keysize,
+			u8 context_byte, u8 *dest, unsigned int dest_len)
+{
+	u8 info[9];
+
+	memcpy(info, "fscrypt\0", 8);
+	info[8] = context_byte;
+
+	return kcapi_hkdf("hmac(sha512)", key, keysize, NULL, 0,
+			  info, sizeof(info), dest, dest_len);
+}
+
+int f2fs_metadata_process_key_serial(key_serial_t key_serial)
+{
+	int err = 0;
+	u8 *metadata_key;
+
+	c.metadata_crypt_key_len =
+		keyctl_read_alloc(key_serial, (void **)&metadata_key);
+
+	if (c.metadata_crypt_key_len < 0) {
+		MSG(0, "\tSpecified metadata crypt key not found.\n");
+		return errno;
+	}
+
+	err = f2fs_metadata_hkdf(metadata_key, c.metadata_crypt_key_len,
+				 HKDF_CONTEXT_KEY_IDENTIFIER,
+				 c.metadata_crypt_key_ident,
+				 FSCRYPT_KEY_IDENTIFIER_SIZE);
+	if (err)
+		goto out;
+
+	c.metadata_crypt_key = malloc(c.metadata_crypt_key_len);
+	if (!c.metadata_crypt_key) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	err = f2fs_metadata_hkdf(metadata_key, c.metadata_crypt_key_len,
+				 HKDF_CONTEXT_METADATA_ENC_KEY,
+				 c.metadata_crypt_key,
+				 c.metadata_crypt_key_len);
+	if (err)
+		goto out_free_metadata_crypt_key;
+
+	goto out;
+
+out_free_metadata_crypt_key:
+	free(c.metadata_crypt_key);
+out:
+	free(metadata_key);
+	return err;
+}
+
+int f2fs_metadata_process_key_ident(u8 key_ident[FSCRYPT_KEY_IDENTIFIER_SIZE])
+{
+	char key_desc[FSCRYPT_KEY_DESC_PREFIX_SIZE +
+		      FSCRYPT_KEY_IDENTIFIER_SIZE * 2 + 1];
+	char *prefix = "fscrypt:";
+	int prefix_len = strlen(prefix);
+	int offset = prefix_len;
+	int i = 0;
+	key_serial_t key_serial;
+	int err;
+
+	memcpy(key_desc, prefix, prefix_len);
+	for (i = 0; i < FSCRYPT_KEY_IDENTIFIER_SIZE; i++, offset += 2)
+		sprintf(key_desc + offset, "%02x", key_ident[i]);
+
+	key_serial = request_key("user", key_desc, NULL, 0);
+	if (key_serial == -1) {
+		MSG(0, "The metadata key was not found. Expected to find a key with type \"user\" in a process subscribed keyring.\n");
+		MSG(0, "The required key descriptor is %s\n", key_desc);
+		return -errno;
+	}
+
+	err = f2fs_metadata_process_key_serial(key_serial);
+	if (err)
+		return err;
+
+	if (memcmp(key_ident, c.metadata_crypt_key_ident,
+		   FSCRYPT_KEY_IDENTIFIER_SIZE)) {
+		MSG(0, "The metadata key had incorrect key identifier\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int f2fs_metadata_verify_args(void)
+{
+	const struct f2fs_crypt_mode *crypt_mode;
+	int ret;
+
+	/* If neither specified, nothing to do */
+	if (!c.metadata_crypt_key && !c.metadata_crypt_alg)
+		return 0;
+
+	/* We need both specified */
+	if (!c.metadata_crypt_key || !c.metadata_crypt_alg)
+		return -EINVAL;
+
+	if (c.metadata_crypt_alg < 0 ||
+	    c.metadata_crypt_alg >= ARRAY_SIZE(f2fs_crypt_modes))
+		return -EINVAL;
+
+	crypt_mode = &f2fs_crypt_modes[c.metadata_crypt_alg];
+
+	if (!crypt_mode->keysize) {
+		MSG(0, "\tInvalid crypto mode %d\n", c.metadata_crypt_alg);
+		return -EINVAL;
+	}
+
+	if (c.metadata_crypt_key_len != crypt_mode->keysize) {
+		MSG(0, "\tMetadata encryption key length %d didn't match required size %d\n",
+		    c.metadata_crypt_key_len, crypt_mode->keysize);
+
+		return -EINVAL;
+	}
+
+	ret = kcapi_cipher_init(&c.kcapi_handle, crypt_mode->cipher_str, 0);
+
+	if (ret) {
+		switch (ret) {
+		case -ENOENT:
+			MSG(0, "The required metadata crypto algorithm %s was not available. Maybe support for the algorithm or CRYPTO_USER_API_SKCIPHER wasn't enabled in the kernel config.\n",
+			    crypt_mode->cipher_str);
+			break;
+		case -EOPNOTSUPP:
+			MSG(0, "The AF_ALG family isn't available. Maybe it's not enabled in the kernel config, or its use isn't allowed by the SELinux policy.\n");
+			break;
+		case -EINVAL:
+			MSG(0, "The accept syscall failed while trying to use the kernel crypto API.\n");
+			break;
+		case -ENOMEM:
+			MSG(0, "Not enough memory to allocate crypto cipher.\n");
+			break;
+		default:
+			MSG(0, "Something went wrong while setting up the crypto cipher %d\n",
+			    ret);
+		}
+		return ret;
+	}
+
+	ret = kcapi_cipher_setkey(c.kcapi_handle, c.metadata_crypt_key,
+				  c.metadata_crypt_key_len);
+	if (ret < 0) {
+		MSG(0, "Couldn't set key for metadata cipher.\n");
+		kcapi_cipher_destroy(c.kcapi_handle);
+		return ret;
+	}
+
+	return 0;
+}
+
+void f2fs_metadata_crypt_gen_iv(u8 iv[FSCRYPT_MAX_IV_SIZE], __u64 blk_addr)
+{
+	int i = 0;
+
+	memset(iv, 0, FSCRYPT_MAX_IV_SIZE);
+
+	while (blk_addr > 0) {
+		iv[i] = blk_addr & 0xFF;
+		blk_addr >>= 8;
+		i++;
+	}
+}
+
+int f2fs_metadata_crypt_block(u8 *buf, u8 iv[FSCRYPT_MAX_IV_SIZE], bool encrypt)
+{
+	int ret;
+
+	if (encrypt)
+		ret = kcapi_cipher_encrypt(c.kcapi_handle, buf, F2FS_BLKSIZE,
+					   iv, buf, F2FS_BLKSIZE, 0);
+	else
+		ret = kcapi_cipher_decrypt(c.kcapi_handle, buf, F2FS_BLKSIZE,
+					   iv, buf, F2FS_BLKSIZE, 0);
+	if (ret != F2FS_BLKSIZE) {
+		if (ret < 0)
+			MSG(0, "\tFailed to en/decrypt blocks. Errno %d\n", ret);
+		else
+			MSG(0, "\tFailed to en/decrypt the entire block (only part of it was en/decrypted)\n");
+		return -1;
+	}
+
+	return 0;
+}
+
+void *f2fs_metadata_crypt_blocks(void *buf, size_t len, __u64 blk_addr,
+				 bool encrypt)
+{
+	u8 *out_buf;
+	u8 iv[FSCRYPT_MAX_IV_SIZE];
+	int blk_offset;
+	int ret;
+
+	if (!c.metadata_crypt_key)
+		return buf;
+
+	out_buf = malloc(len);
+	memcpy(out_buf, buf, len);
+
+	for (blk_offset = 0; blk_offset < len / F2FS_BLKSIZE; blk_offset++) {
+		f2fs_metadata_crypt_gen_iv(iv, blk_addr + blk_offset);
+		ret = f2fs_metadata_crypt_block(
+					out_buf + blk_offset * F2FS_BLKSIZE,
+					iv, encrypt);
+		if (ret) {
+			free(out_buf);
+			return NULL;
+		}
+	}
+
+	return out_buf;
+}
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 55fa391..6950c04 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1270,9 +1270,6 @@ unsigned int calc_extra_isize(void)
 	return size - F2FS_EXTRA_ISIZE_OFFSET;
 }
 
-#define ARRAY_SIZE(array)			\
-	(sizeof(array) / sizeof(array[0]))
-
 static const struct {
 	char *name;
 	__u16 encoding_magic;
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index 138285d..df3723d 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -33,6 +33,7 @@
 #include <assert.h>
 #include <inttypes.h>
 #include "f2fs_fs.h"
+#include "f2fs_metadata_crypt.h"
 
 struct f2fs_configuration c;
 
@@ -499,10 +500,12 @@ static int sparse_write_blk(__u64 block, int count, const void *buf) { return 0;
 static int sparse_write_zeroed_blk(__u64 block, int count) { return 0; }
 #endif
 
-int dev_read(void *buf, __u64 offset, size_t len)
+static int __dev_read(void *buf, __u64 offset, size_t len, bool metadata_decrypt)
 {
 	int fd;
+	__u64 blk_addr = offset >> F2FS_BLKSIZE_BITS;
 	int err;
+	void *new_buf = NULL;
 
 	if (c.sparse_mode)
 		return sparse_read_blk(offset / F2FS_BLKSIZE,
@@ -521,9 +524,24 @@ int dev_read(void *buf, __u64 offset, size_t len)
 		return -1;
 	if (read(fd, buf, len) < 0)
 		return -1;
+	if (metadata_decrypt) {
+		new_buf = f2fs_metadata_crypt_blocks(buf, len, blk_addr, false);
+		if (!new_buf)
+			return -1;
+		if (new_buf != buf) {
+			memcpy(buf, new_buf, len);
+			free(new_buf);
+		}
+	}
+
 	return 0;
 }
 
+int dev_read(void *buf, __u64 offset, size_t len)
+{
+	return __dev_read(buf, offset, len, true);
+}
+
 #ifdef POSIX_FADV_WILLNEED
 int dev_readahead(__u64 offset, size_t len)
 #else
@@ -541,9 +559,13 @@ int dev_readahead(__u64 offset, size_t UNUSED(len))
 #endif
 }
 
-int dev_write(void *buf, __u64 offset, size_t len)
+static int __dev_write(void *buf, __u64 offset, size_t len,
+		       bool metadata_encrypt)
 {
 	int fd;
+	__u64 blk_addr = offset >> F2FS_BLKSIZE_BITS;
+	void *src_buf = buf;
+	int err = -1;
 
 	if (c.dry_run)
 		return 0;
@@ -562,11 +584,26 @@ int dev_write(void *buf, __u64 offset, size_t len)
 	 */
 	if (dcache_update_cache(fd, buf, (off64_t)offset, len) < 0)
 		return -1;
+	if (metadata_encrypt) {
+		buf = f2fs_metadata_crypt_blocks(buf, len, blk_addr, true);
+		if (!buf)
+			return -1;
+	}
 	if (lseek64(fd, (off64_t)offset, SEEK_SET) < 0)
-		return -1;
+		goto out;
 	if (write(fd, buf, len) < 0)
-		return -1;
-	return 0;
+		goto out;
+
+	err = 0;
+out:
+	if (buf != src_buf)
+		free(buf);
+	return err;
+}
+
+int dev_write(void *buf, __u64 offset, size_t len)
+{
+	return __dev_write(buf, offset, len, true);
 }
 
 int dev_write_block(void *buf, __u64 blk_addr)
@@ -574,6 +611,12 @@ int dev_write_block(void *buf, __u64 blk_addr)
 	return dev_write(buf, blk_addr << F2FS_BLKSIZE_BITS, F2FS_BLKSIZE);
 }
 
+int dev_write_block_no_encrypt(void *buf, __u64 blk_addr)
+{
+	return __dev_write(buf, blk_addr << F2FS_BLKSIZE_BITS, F2FS_BLKSIZE,
+			   false);
+}
+
 int dev_write_dump(void *buf, __u64 offset, size_t len)
 {
 	if (lseek64(c.dump_fd, (off64_t)offset, SEEK_SET) < 0)
@@ -586,6 +629,9 @@ int dev_write_dump(void *buf, __u64 offset, size_t len)
 int dev_fill(void *buf, __u64 offset, size_t len)
 {
 	int fd;
+	__u64 blk_addr = offset >> F2FS_BLKSIZE_BITS;
+	void *src_buf = buf;
+	int err = -1;
 
 	if (c.sparse_mode)
 		return sparse_write_zeroed_blk(offset / F2FS_BLKSIZE,
@@ -598,11 +644,21 @@ int dev_fill(void *buf, __u64 offset, size_t len)
 	/* Only allow fill to zero */
 	if (*((__u8*)buf))
 		return -1;
-	if (lseek64(fd, (off64_t)offset, SEEK_SET) < 0)
+
+	buf = f2fs_metadata_crypt_blocks(buf, len, blk_addr, true);
+	if (!buf)
 		return -1;
+
+	if (lseek64(fd, (off64_t)offset, SEEK_SET) < 0)
+		goto out;
 	if (write(fd, buf, len) < 0)
-		return -1;
-	return 0;
+		goto out;
+
+	err = 0;
+out:
+	if (buf != src_buf)
+		free(buf);
+	return err;
 }
 
 int dev_fill_block(void *buf, __u64 blk_addr)
@@ -615,6 +671,12 @@ int dev_read_block(void *buf, __u64 blk_addr)
 	return dev_read(buf, blk_addr << F2FS_BLKSIZE_BITS, F2FS_BLKSIZE);
 }
 
+int dev_read_block_no_decrypt(void *buf, __u64 blk_addr)
+{
+	return __dev_read(buf, blk_addr << F2FS_BLKSIZE_BITS, F2FS_BLKSIZE,
+			  false);
+}
+
 int dev_reada_block(__u64 blk_addr)
 {
 	return dev_readahead(blk_addr << F2FS_BLKSIZE_BITS, F2FS_BLKSIZE);
diff --git a/man/fsck.f2fs.8 b/man/fsck.f2fs.8
index af1076c..56943cd 100644
--- a/man/fsck.f2fs.8
+++ b/man/fsck.f2fs.8
@@ -30,7 +30,10 @@ fsck.f2fs \- check a Linux F2FS file system
 .B fsck.f2fs
 is used to check an f2fs file system (usually in a disk partition).
 \fIdevice\fP is the special file corresponding to the device (e.g.
-\fI/dev/sdXX\fP).
+\fI/dev/sdXX\fP). If the filesystem has metadata encryption enabled,
+then the required metadata encryption key should be added to a process
+subscribed keyring with key-type "user". The other requirements for
+metadata encryption are listed under the \-M option for mkfs.f2fs.
 .PP
 The exit code returned by
 .B fsck.f2fs
diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index e2aee76..0ea114f 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -12,6 +12,10 @@ mkfs.f2fs \- create an F2FS file system
 .I heap-based-allocation
 ]
 [
+.B \-A
+.I metadata-encryption-algorithm
+]
+[
 .B \-c
 .I device-list
 ]
@@ -44,6 +48,10 @@ mkfs.f2fs \- create an F2FS file system
 .B \-m
 ]
 [
+.B \-M
+.I metadata-crypt-key-serial
+]
+[
 .B \-o
 .I overprovision-ratio-percentage
 ]
@@ -110,6 +118,24 @@ Specify 1 or 0 to enable/disable heap based block allocation policy.
 If the value is equal to 1, each of active log areas are initially
 assigned separately according to the whole volume size.
 The default value is 1.
+
+.TP
+.BI \-A " metadata-encryption-algorithm"
+Specify the encryption algorithm to use for metadata encryption. The \-M
+option must also be specified, providing the metadata crypt key to use.
+Check the description of the \-M option for requirements before using this
+pair of options.
+The following values are supported for this option:
+.RS 1.2i
+.TP 1.2i
+.B AES-256-XTS
+Use xts(aes) for metadata encryption. The required key length is 64 bytes.
+.TP
+.B Adiantum
+Use adiantum (adiantum(xchacha12,aes)) for metadata encryption. The
+required key length is 32 bytes.
+.RE
+
 .TP
 .BI \-c " device-list"
 Build f2fs with these additional comma separated devices, so that the user can
@@ -147,6 +173,24 @@ Specify the volume label to the partition mounted as F2FS.
 .BI \-m
 Specify f2fs filesystem to supports the block zoned feature.
 Without it, the filesystem doesn't support the feature.
+
+.TP
+.BI \-M
+Specify the key_serial (as returned by keyctl) of the metadata crypt key to
+use for metadata encryption. This key is not used directly as the
+encryption key - the encryption key is derived from this key using
+hmac(sha512). This option must be specified along with the \-A option.
+The length of the key must match the required key length of the chosen
+algorithm.
+.P
+.RS
+The kernel must support the AF_ALG socket family (and it must be allowed
+by the SELinux policy), the kernel crypto userspace API for symmetric
+ciphers (i.e. CONFIG_CRYPTO_USER_API_SKCIPHER) must be enabled, and
+crypto API support for the chosen encryption algorithm must be enabled for
+this option to work.
+.RE
+
 .TP
 .BI \-o " overprovision-ratio-percentage"
 Specify the percentage of the volume that will be used as overprovision area.
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index a6c542e..2d68aa4 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -537,6 +537,12 @@ static int f2fs_prepare_super_block(void)
 		set_sb(s_encoding_flags, c.s_encoding_flags);
 	}
 
+	if (c.metadata_crypt_key) {
+		set_sb(metadata_crypt_alg, c.metadata_crypt_alg);
+		memcpy(sb->metadata_crypt_key_ident, c.metadata_crypt_key_ident,
+		       FSCRYPT_KEY_IDENTIFIER_SIZE);
+	}
+
 	sb->feature = c.feature;
 
 	if (get_sb(feature) & F2FS_FEATURE_SB_CHKSUM) {
@@ -1046,7 +1052,7 @@ static int f2fs_write_super_block(void)
 	memcpy(zero_buff + F2FS_SUPER_OFFSET, sb, sizeof(*sb));
 	DBG(1, "\tWriting super block, at offset 0x%08x\n", 0);
 	for (index = 0; index < 2; index++) {
-		if (dev_write_block(zero_buff, index)) {
+		if (dev_write_block_no_encrypt(zero_buff, index)) {
 			MSG(1, "\tError: While while writing super_blk "
 					"on disk!!! index : %d\n", index);
 			free(zero_buff);
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index f2f0a80..139251c 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -28,6 +28,7 @@
 
 #include "f2fs_fs.h"
 #include "f2fs_format_utils.h"
+#include "f2fs_metadata_crypt.h"
 
 #ifdef WITH_ANDROID
 #include <sparse/sparse.h>
@@ -44,6 +45,7 @@ static void mkfs_usage()
 	MSG(0, "\nUsage: mkfs.f2fs [options] device [sectors]\n");
 	MSG(0, "[options]:\n");
 	MSG(0, "  -a heap-based allocation [default:0]\n");
+	MSG(0, "  -A Metadata encryption algorithm\n");
 	MSG(0, "  -c device1[,device2,...] up to 7 additional devices, except meta device\n");
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -e [cold file ext list] e.g. \"mp3,gif,mov\"\n");
@@ -54,6 +56,7 @@ static void mkfs_usage()
 	MSG(0, "  -l label\n");
 	MSG(0, "  -U uuid\n");
 	MSG(0, "  -m support zoned block device [default:0]\n");
+	MSG(0, "  -M Metadata encryption key_serial in keyring\n");
 	MSG(0, "  -o overprovision percentage [default:auto]\n");
 	MSG(0, "  -O feature1[,feature2,...] e.g. \"encrypt\"\n");
 	MSG(0, "  -C [encoding[:flag1,...]] Support casefolding with optional flags\n");
@@ -73,6 +76,8 @@ static void mkfs_usage()
 
 static void f2fs_show_info()
 {
+	int i;
+
 	MSG(0, "\n\tF2FS-tools: mkfs.f2fs Ver: %s (%s)\n\n",
 				F2FS_TOOLS_VERSION,
 				F2FS_TOOLS_DATE);
@@ -97,6 +102,14 @@ static void f2fs_show_info()
 					f2fs_encoding2str(c.s_encoding));
 	if (c.feature & le32_to_cpu(F2FS_FEATURE_PRJQUOTA))
 		MSG(0, "Info: Enable Project quota\n");
+
+	if (c.metadata_crypt_alg) {
+		MSG(0, "Info: Metadata alg is %d\n", c.metadata_crypt_alg);
+		MSG(0, "Info: Metadata key ident is fscrypt:");
+		for (i = 0; i < FSCRYPT_KEY_IDENTIFIER_SIZE; i++)
+			MSG(0, "%02x", c.metadata_crypt_key_ident[i]);
+		MSG(0, "\n");
+	}
 }
 
 static void add_default_options(void)
@@ -125,7 +138,7 @@ static void add_default_options(void)
 
 static void f2fs_parse_options(int argc, char *argv[])
 {
-	static const char *option_string = "qa:c:C:d:e:E:g:il:mo:O:rR:s:S:z:t:T:U:Vfw:";
+	static const char *option_string = "qa:A:c:C:d:e:E:g:il:mM:o:O:rR:s:S:z:t:T:U:Vfw:";
 	int32_t option=0;
 	int val;
 	char *token;
@@ -138,6 +151,14 @@ static void f2fs_parse_options(int argc, char *argv[])
 		case 'a':
 			c.heap = atoi(optarg);
 			break;
+		case 'A':
+			c.metadata_crypt_alg = f2fs_get_crypt_alg(optarg);
+			if (c.metadata_crypt_alg < 0) {
+				MSG(0, "Error: invalid crypt algorithm specified. The choices are:");
+				f2fs_print_crypt_algs();
+				exit(1);
+			}
+			break;
 		case 'c':
 			if (c.ndevs >= MAX_DEVICES) {
 				MSG(0, "Error: Too many devices\n");
@@ -178,6 +199,15 @@ static void f2fs_parse_options(int argc, char *argv[])
 		case 'm':
 			c.zoned_mode = 1;
 			break;
+		case 'M': {
+			key_serial_t key_serial = strtol(optarg, NULL, 10);
+
+			if (f2fs_metadata_process_key_serial(key_serial)) {
+				MSG(0, "Error: Invalid metadata key\n");
+				mkfs_usage();
+			}
+			break;
+		}
 		case 'o':
 			c.overprovision = atof(optarg);
 			break;
@@ -244,6 +274,9 @@ static void f2fs_parse_options(int argc, char *argv[])
 		}
 	}
 
+	if (f2fs_metadata_verify_args())
+		exit(1);
+
 	add_default_options();
 
 	if (!(c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR))) {
-- 
2.29.2.729.g45daf8777d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
