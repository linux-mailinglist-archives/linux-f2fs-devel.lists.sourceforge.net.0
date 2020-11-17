Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A132B589B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 05:03:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kesCr-0001hp-40; Tue, 17 Nov 2020 04:03:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kesCo-0001ha-9m
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 04:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jCrMwcvdxkq94nR3x0sGReo3BqDwjE5Ztf1DK+WLXwg=; b=DPsTJGDUthouuFxNppto2Kk/F6
 s/tfhWFfuMnhJgZziSq83WtoftYP/MIr0l6lg7696T/AyrlpY3O1HfHIzxxNoSsUyAt7aH3Pfu9+R
 6esZc0KpRJhUpZSFNrWiLz+oE4i2xmvp+tSquum621muqpP3xLS/PpYQMKD03Jgbf2yc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jCrMwcvdxkq94nR3x0sGReo3BqDwjE5Ztf1DK+WLXwg=; b=W
 Di9VaxQX61X7WVKcWMBfodccAX9qlQGVbntdMmy7Ym6P9XLI/03w7+VjWUH4J/AdBG+Q+AqToLzrS
 haqEETYjsnb+Goo8VjMZyGDg09zRM6WpvXUGoRpSvgXvDxS7A6Z0kHpqmW2oXKEx0ebmZyFaVRf+J
 +EyN74MSj2G/xkaY=;
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kesCe-008j7B-0x
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 04:02:58 +0000
Received: by mail-pf1-f180.google.com with SMTP id w6so16269485pfu.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Nov 2020 20:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jCrMwcvdxkq94nR3x0sGReo3BqDwjE5Ztf1DK+WLXwg=;
 b=ETMrNYesf8Pjq5kKiOj80tNeS2+KZkV/+PR0kwCIdDQyd6TUn+JEGEWOt7iWnVwcDR
 9puJrgKn9qoUKLs5/kS1Fa730NTdCTWZkPTDC6qXhqHfrKa0hq/U/SVrjFYFXv0cp5eZ
 UvL6iBd8z2f+/xaCvP9fzA0UydY/fYGda9jsDguwN/2WyyFdRvRfzj4vVDSPE0eWchXF
 bE/aXb0h1bdgBgeRQekD5cnMtTZ5IA+T6SWYbN6DlnJXWWxmNCuxp/e62naUecKUaBqq
 iSoJ+wJiCvX7Gb8Rnzkoaex5E3Ra6Zs1Db5gnTptZBG+7DiE0qaNWbLqR41qYmM6Qdxz
 25gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jCrMwcvdxkq94nR3x0sGReo3BqDwjE5Ztf1DK+WLXwg=;
 b=H5ViEVw1IUm700yC5tNUgIuvgDKaaQ2P43Gwh2lbV/6sVaIKX+jlJKNUqUnJx9yx8M
 fntkrVnh0MEVQ5gktXhS9FoAUxYPRp4vFE+Vb9+enxiJ4M09PldeCU+jUOZINzLhpcjq
 GcYrl3BLE3/CupUZdMvlUU6ib1Zal7v+K8V2a/aHvl0AVEBC5fQss3VvKOkEg1sNJ52L
 vPVKVZc5dtArJWK1dR1rZUI6oEN7fQQiXdXW6/uPdblhijDYMWZkZQMmQCWTY46C/Moo
 zqgv6qSaHIMp0PfM0q1/L0rMiWqHWXQc77pW09aHcuOCmXwCT6HlTlNnbxaVdOjFTI4p
 rQDQ==
X-Gm-Message-State: AOAM532R0NRzkebt6EViQrQxqyV7HX5asAqjSfcTiULMw4iWWUudzHKm
 VjZ5h1xSUg14Lap0ps1fgDI=
X-Google-Smtp-Source: ABdhPJxtrhzM60oUBHWHmdqQiSL4y43zz6s9vrkHtw1cqlbGel0cX24hqt472jG8To6oHWLoKsEnQg==
X-Received: by 2002:a17:90b:817:: with SMTP id
 bk23mr2536190pjb.191.1605585755297; 
 Mon, 16 Nov 2020 20:02:35 -0800 (PST)
Received: from daehojeong1.seo.corp.google.com ([100.102.127.132])
 by smtp.gmail.com with ESMTPSA id s18sm20388518pfc.5.2020.11.16.20.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 20:02:34 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 17 Nov 2020 13:02:22 +0900
Message-Id: <20201117040223.858979-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.180 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.180 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kesCe-008j7B-0x
Subject: [f2fs-dev] [PATCH 1/2] f2fs: add disable_auto_compr mount option
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

We will add a new disable_auto_compr mount option to turn off the
automaic compression on the compression enabled file, in order to
give discretion of choosing the target file and the timing of
compression to the user.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/filesystems/f2fs.rst |  4 ++++
 fs/f2fs/data.c                     | 10 +++++-----
 fs/f2fs/f2fs.h                     |  8 ++++++++
 fs/f2fs/segment.c                  |  2 +-
 fs/f2fs/super.c                    |  9 +++++++++
 5 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index b8ee761c9922..c36ca1e0f7ab 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -260,6 +260,10 @@ compress_extension=%s	 Support adding specified extension, so that f2fs can enab
 			 For other files, we can still enable compression via ioctl.
 			 Note that, there is one reserved special extension '*', it
 			 can be set to enable compression for all files.
+disable_auto_compr       Even if compression feature is enabled, this option can
+                         disable automaic compression on the compression enabled
+                         file to give discretion of choosing the target file and
+                         the timing of compression to the user.
 inlinecrypt		 When possible, encrypt/decrypt the contents of encrypted
 			 files using the blk-crypto framework rather than
 			 filesystem-layer encryption. This allows the use of
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c31ec408bd4f..414c8370ab7e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2896,7 +2896,7 @@ static int f2fs_write_data_page(struct page *page,
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
 		goto out;
 
-	if (f2fs_compressed_file(inode)) {
+	if (f2fs_need_compress_write(inode)) {
 		if (f2fs_is_compressed_cluster(inode, page->index)) {
 			redirty_page_for_writepage(wbc, page);
 			return AOP_WRITEPAGE_ACTIVATE;
@@ -2988,7 +2988,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 readd:
 			need_readd = false;
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-			if (f2fs_compressed_file(inode)) {
+			if (f2fs_need_compress_write(inode)) {
 				ret = f2fs_init_compress_ctx(&cc);
 				if (ret) {
 					done = 1;
@@ -3067,7 +3067,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				goto continue_unlock;
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-			if (f2fs_compressed_file(inode)) {
+			if (f2fs_need_compress_write(inode)) {
 				get_page(page);
 				f2fs_compress_ctx_add_page(&cc, page);
 				continue;
@@ -3120,7 +3120,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	}
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	/* flush remained pages in compress cluster */
-	if (f2fs_compressed_file(inode) && !f2fs_cluster_is_empty(&cc)) {
+	if (f2fs_need_compress_write(inode) && !f2fs_cluster_is_empty(&cc)) {
 		ret = f2fs_write_multi_pages(&cc, &submitted, wbc, io_type);
 		nwritten += submitted;
 		wbc->nr_to_write -= submitted;
@@ -3162,7 +3162,7 @@ static inline bool __should_serialize_io(struct inode *inode,
 	if (IS_NOQUOTA(inode))
 		return false;
 
-	if (f2fs_compressed_file(inode))
+	if (f2fs_need_compress_write(inode))
 		return true;
 	if (wbc->sync_mode != WB_SYNC_ALL)
 		return true;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a33c90cf979b..c473c78699bc 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -99,6 +99,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
 #define F2FS_MOUNT_DISABLE_CHECKPOINT	0x02000000
 #define F2FS_MOUNT_NORECOVERY		0x04000000
 #define F2FS_MOUNT_ATGC			0x08000000
+#define F2FS_MOUNT_DISABLE_AUTO_COMPR	0x10000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
@@ -2838,6 +2839,13 @@ static inline int f2fs_compressed_file(struct inode *inode)
 		is_inode_flag_set(inode, FI_COMPRESSED_FILE);
 }
 
+static inline int f2fs_need_compress_write(struct inode *inode)
+{
+	if (test_opt(F2FS_I_SB(inode), DISABLE_AUTO_COMPR))
+		return 0;
+	return f2fs_compressed_file(inode);
+}
+
 static inline unsigned int addrs_per_inode(struct inode *inode)
 {
 	unsigned int addrs = CUR_ADDRS_PER_INODE(inode) -
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a0d7a7e04bc7..f56a8b6bbee7 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3245,7 +3245,7 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 			else
 				return CURSEG_COLD_DATA;
 		}
-		if (file_is_cold(inode) || f2fs_compressed_file(inode))
+		if (file_is_cold(inode) || f2fs_need_compress_write(inode))
 			return CURSEG_COLD_DATA;
 		if (file_is_hot(inode) ||
 				is_inode_flag_set(inode, FI_HOT_DATA) ||
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5bb523bf32a6..909c1543b282 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -146,6 +146,7 @@ enum {
 	Opt_compress_algorithm,
 	Opt_compress_log_size,
 	Opt_compress_extension,
+	Opt_disable_auto_compr,
 	Opt_atgc,
 	Opt_err,
 };
@@ -214,6 +215,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_compress_algorithm, "compress_algorithm=%s"},
 	{Opt_compress_log_size, "compress_log_size=%u"},
 	{Opt_compress_extension, "compress_extension=%s"},
+	{Opt_disable_auto_compr, "disable_auto_compr"},
 	{Opt_atgc, "atgc"},
 	{Opt_err, NULL},
 };
@@ -934,10 +936,14 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			F2FS_OPTION(sbi).compress_ext_cnt++;
 			kfree(name);
 			break;
+		case Opt_disable_auto_compr:
+			set_opt(sbi, DISABLE_AUTO_COMPR);
+			break;
 #else
 		case Opt_compress_algorithm:
 		case Opt_compress_log_size:
 		case Opt_compress_extension:
+		case Opt_disable_auto_compr:
 			f2fs_info(sbi, "compression options not supported");
 			break;
 #endif
@@ -1511,6 +1517,9 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
 		seq_printf(seq, ",compress_extension=%s",
 			F2FS_OPTION(sbi).extensions[i]);
 	}
+
+	if (test_opt(sbi, DISABLE_AUTO_COMPR))
+		seq_puts(seq, ",disable_auto_compr");
 }
 
 static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
-- 
2.29.2.299.gdc1121823c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
