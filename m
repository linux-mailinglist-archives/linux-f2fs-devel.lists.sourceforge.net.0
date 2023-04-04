Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6696D5739
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 05:30:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjXN8-0005jW-JL;
	Tue, 04 Apr 2023 03:30:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <o451686892@gmail.com>) id 1pjXN7-0005jQ-7Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 03:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8SCrUqeM1P3yGd529t2hRwHdcjRZtPKILDnamTlQUXQ=; b=bKDuYHOJD3bxYRyyabwk7gzKYI
 +HTR+ceDjuHSgTqo/lPek38Pb0Q0TTE9l+OAknycbZuAfVgW/o1K0EFBhqiEel8UC3FotQBAuBMg5
 h4cxYZL60KzqeZIDgybbSJCEJqQlDsuiXfcQabuksMyyXh5ykihsAxGVnx84619mP3+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8SCrUqeM1P3yGd529t2hRwHdcjRZtPKILDnamTlQUXQ=; b=K
 scZFetmGw96QzXhPH2temJs/HJoes5NY/BRlHcHe7q4o+TvlYiDsx4vNtAC0I2U57muty+zmzHyaT
 1XkxfwJ+GxPBbUFwtylAkNQEqDw2lyTclhdiZTEV2CzZIox4k6SugLTveuV+BLLv3J19WTQDQWv9e
 5y7tjdQbwHQ0Y7/g=;
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pjXN2-0005uV-4O for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 03:30:12 +0000
Received: by mail-pl1-f169.google.com with SMTP id n14so14193197plc.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Apr 2023 20:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680579002;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8SCrUqeM1P3yGd529t2hRwHdcjRZtPKILDnamTlQUXQ=;
 b=CzqiQOeOa+ta+hA2U1HMCdV6+eZQDEMhIqvt65+TtWpqkDFS4BFWCkl4/bTULAA388
 fQDLo0/Y0eea8yR+ddCvHR9jG0D64iLIfYciavMNkE5S4mZdXwrLt68g+1b6vQYc5rjt
 kep1qzVuyw6u+L4/uTehRgKVusRBYQ4m+1fZiEUZvu0z5SM8gh/cDFR6NQcSo3yCeGV9
 kXmw/lwo/9ahE+XOGSV0G20phPROjvn155wOg4/ADwu/ZsuKMt3oMkrlcrKYH7oVs2Hu
 HaBMGFFNzlU6aAcuXs+PwOCT033QSCyZGt+K3wptCzdPXSLKxlEQ8IyUmhEtL+Fdx9Ah
 +DFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680579002;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8SCrUqeM1P3yGd529t2hRwHdcjRZtPKILDnamTlQUXQ=;
 b=tggn3CIjXKBSOEQ/lWdYkIGfQvFY5zXNhmsVY0N3/O82PoNns42Gkz0EI1weNO8eUX
 nUnl2S1ktwv3oRXBtR/YqkbsfFkfOi21rBG0DtWPLvk+Q0Xff7Nl7b+QcMk3MaMfMB9n
 kUZ+rjUyZVKddfKDF3+tv/NT6IbFYdmCB/h76VqULG03nJk58dufiQ2iIdUVY+5VrecI
 mQeDh7okulhOwv8yiLOwP+B900+mLs9Bhv2OWYzWpJtdwZ0xsGZOVNU7e5BDPd+e74jQ
 xueUU93GlpbzSml2XdGaYGGOVFXgQxuPPs9eXymUPFndznPkrVMoxruPeD4DfLMVvMDH
 hpYA==
X-Gm-Message-State: AAQBX9czhWhFkLYm/X0H4+k+Qw0d8RYoeoAKoL8zkSrBmxqmtfbRnpDn
 akarVqujNYykJkaQ5OI01t4=
X-Google-Smtp-Source: AKy350Yff+5F1amie00s7tLoMAqgIv1zZEfcaKS3xqpJN07eq8Ra+GLIW13XiS1cmeFbmR2OSqUx5g==
X-Received: by 2002:a17:90a:5314:b0:23d:3a3f:950b with SMTP id
 x20-20020a17090a531400b0023d3a3f950bmr1311028pjh.22.1680579002199; 
 Mon, 03 Apr 2023 20:30:02 -0700 (PDT)
Received: from localhost.localdomain ([103.117.248.198])
 by smtp.gmail.com with ESMTPSA id
 js2-20020a17090b148200b002339491ead6sm10577019pjb.5.2023.04.03.20.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 20:30:01 -0700 (PDT)
From: Weizhao Ouyang <o451686892@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  4 Apr 2023 11:28:44 +0800
Message-Id: <20230404032844.3596879-1-o451686892@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Use common implementation of file type conversion helpers.
 Signed-off-by: Weizhao Ouyang --- fs/f2fs/dir.c | 39 +++ fs/f2fs/f2fs.h |
 1 - fs/f2fs/inline.c | 2 +- include/linux/f2fs_fs.h | 15 4 files changed
 [...] Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [o451686892[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.169 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.169 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [o451686892[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pjXN2-0005uV-4O
Subject: [f2fs-dev] [PATCH] f2fs: use common implementation of file type
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
Cc: linux-kernel@vger.kernel.org, Weizhao Ouyang <o451686892@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use common implementation of file type conversion helpers.

Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
---
 fs/f2fs/dir.c           | 39 +++------------------------------------
 fs/f2fs/f2fs.h          |  1 -
 fs/f2fs/inline.c        |  2 +-
 include/linux/f2fs_fs.h | 15 ---------------
 4 files changed, 4 insertions(+), 53 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 9ccdbe120425..225672e9469c 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -42,39 +42,6 @@ static unsigned int bucket_blocks(unsigned int level)
 		return 4;
 }
 
-static unsigned char f2fs_filetype_table[F2FS_FT_MAX] = {
-	[F2FS_FT_UNKNOWN]	= DT_UNKNOWN,
-	[F2FS_FT_REG_FILE]	= DT_REG,
-	[F2FS_FT_DIR]		= DT_DIR,
-	[F2FS_FT_CHRDEV]	= DT_CHR,
-	[F2FS_FT_BLKDEV]	= DT_BLK,
-	[F2FS_FT_FIFO]		= DT_FIFO,
-	[F2FS_FT_SOCK]		= DT_SOCK,
-	[F2FS_FT_SYMLINK]	= DT_LNK,
-};
-
-static unsigned char f2fs_type_by_mode[S_IFMT >> S_SHIFT] = {
-	[S_IFREG >> S_SHIFT]	= F2FS_FT_REG_FILE,
-	[S_IFDIR >> S_SHIFT]	= F2FS_FT_DIR,
-	[S_IFCHR >> S_SHIFT]	= F2FS_FT_CHRDEV,
-	[S_IFBLK >> S_SHIFT]	= F2FS_FT_BLKDEV,
-	[S_IFIFO >> S_SHIFT]	= F2FS_FT_FIFO,
-	[S_IFSOCK >> S_SHIFT]	= F2FS_FT_SOCK,
-	[S_IFLNK >> S_SHIFT]	= F2FS_FT_SYMLINK,
-};
-
-static void set_de_type(struct f2fs_dir_entry *de, umode_t mode)
-{
-	de->file_type = f2fs_type_by_mode[(mode & S_IFMT) >> S_SHIFT];
-}
-
-unsigned char f2fs_get_de_type(struct f2fs_dir_entry *de)
-{
-	if (de->file_type < F2FS_FT_MAX)
-		return f2fs_filetype_table[de->file_type];
-	return DT_UNKNOWN;
-}
-
 /* If @dir is casefolded, initialize @fname->cf_name from @fname->usr_fname. */
 int f2fs_init_casefolded_name(const struct inode *dir,
 			      struct f2fs_filename *fname)
@@ -485,7 +452,7 @@ void f2fs_set_link(struct inode *dir, struct f2fs_dir_entry *de,
 	lock_page(page);
 	f2fs_wait_on_page_writeback(page, type, true, true);
 	de->ino = cpu_to_le32(inode->i_ino);
-	set_de_type(de, inode->i_mode);
+	de->file_type = fs_umode_to_ftype(inode->i_mode);
 	set_page_dirty(page);
 
 	dir->i_mtime = dir->i_ctime = current_time(dir);
@@ -699,7 +666,7 @@ void f2fs_update_dentry(nid_t ino, umode_t mode, struct f2fs_dentry_ptr *d,
 	de->name_len = cpu_to_le16(name->len);
 	memcpy(d->filename[bit_pos], name->name, name->len);
 	de->ino = cpu_to_le32(ino);
-	set_de_type(de, mode);
+	de->file_type = fs_umode_to_ftype(mode);
 	for (i = 0; i < slots; i++) {
 		__set_bit_le(bit_pos + i, (void *)d->bitmap);
 		/* avoid wrong garbage data for readdir */
@@ -1036,7 +1003,7 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 			continue;
 		}
 
-		d_type = f2fs_get_de_type(de);
+		d_type = fs_ftype_to_dtype(de->file_type);
 
 		de_name.name = d->filename[bit_pos];
 		de_name.len = le16_to_cpu(de->name_len);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b0ab2062038a..3f39d162d858 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3489,7 +3489,6 @@ int f2fs_get_tmpfile(struct mnt_idmap *idmap, struct inode *dir,
 /*
  * dir.c
  */
-unsigned char f2fs_get_de_type(struct f2fs_dir_entry *de);
 int f2fs_init_casefolded_name(const struct inode *dir,
 			      struct f2fs_filename *fname);
 int f2fs_setup_filename(struct inode *dir, const struct qstr *iname,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 72269e7efd26..4638fee16a91 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -497,7 +497,7 @@ static int f2fs_add_inline_entries(struct inode *dir, void *inline_dentry)
 		fname.hash = de->hash_code;
 
 		ino = le32_to_cpu(de->ino);
-		fake_mode = f2fs_get_de_type(de) << S_SHIFT;
+		fake_mode = fs_ftype_to_dtype(de->file_type) << S_DT_SHIFT;
 
 		err = f2fs_add_regular_entry(dir, &fname, NULL, ino, fake_mode);
 		if (err)
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 1701f25117ea..d80195d226ab 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -585,21 +585,6 @@ struct f2fs_dentry_block {
 	__u8 filename[NR_DENTRY_IN_BLOCK][F2FS_SLOT_LEN];
 } __packed;
 
-/* file types used in inode_info->flags */
-enum {
-	F2FS_FT_UNKNOWN,
-	F2FS_FT_REG_FILE,
-	F2FS_FT_DIR,
-	F2FS_FT_CHRDEV,
-	F2FS_FT_BLKDEV,
-	F2FS_FT_FIFO,
-	F2FS_FT_SOCK,
-	F2FS_FT_SYMLINK,
-	F2FS_FT_MAX
-};
-
-#define S_SHIFT 12
-
 #define	F2FS_DEF_PROJID		0	/* default project ID */
 
 #endif  /* _LINUX_F2FS_FS_H */
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
