Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBDE5522CD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jun 2022 19:39:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o3LMd-000778-EW; Mon, 20 Jun 2022 17:39:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daeho43@gmail.com>) id 1o3LMc-000770-Dq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jun 2022 17:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lkxuUdoBKH6pPxKTI0fRy8LqcjRJrSIkdt2qKGUgvrk=; b=jFrxckt5bsRk401eHlK+RILHj8
 eOjcghPpK+FpWAY8tw2+9BB5Hz96yOl57VUGNGYomE8ozFJX66OBQTPItBRz4el7Hq0rwe2iDhvfo
 JXT3LmqP9jKPfexWb6q1ZrDXoS2n1ffDdGlOGlG0oT6CAaUCHxQ3eU9JBaUc4nO9PQc0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lkxuUdoBKH6pPxKTI0fRy8LqcjRJrSIkdt2qKGUgvrk=; b=J
 qyG6NuZqh4BcORx47l7KJtXBhLle75or8cIUd+HU1DVZ7j39qbPGpO+PJUzIQOqIykyABt5uga/tj
 j7r9Z1selpSqq/6+oImcO3/FeJ3TFMjMvseOGFUWHgKM+7wDfqkz+KthPQnIdd7Wv9kJhvvJAMpkf
 siewOcqEdRrWnrek=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o3LMS-008X39-LY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jun 2022 17:38:55 +0000
Received: by mail-pj1-f46.google.com with SMTP id d14so7337156pjs.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Jun 2022 10:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lkxuUdoBKH6pPxKTI0fRy8LqcjRJrSIkdt2qKGUgvrk=;
 b=SILLAXN7WMUOUoGPfiug7fjBfpf/5bu3meLBvf6cLyHMwnd8UH+yepwVnkQ4y1sfBU
 oU7mL7iWp39B50z2Ce8YT9nZYIP+qmRhs7v897Ap2zRKVNWJKiA90NouMzDHdKX/vIqB
 CDtGjTAme3tic1fC08U0CqhyLQ2mDDI6aquHe4agHcI6tfIh1C/R6vE8Wppt47Zn/0Dm
 24uMzHC4GZSbT+fsBz7AC+Upo07/S6tWzB+fwGooUS2V/5EtXETKXX6ryeUu9DtPWREy
 /wowA1H95kDd4JS0pjaUW7XYHwrCCsX83EKghRI5Qg0wdYIzNqpwOw5yUkvF1IMzJfVS
 sS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lkxuUdoBKH6pPxKTI0fRy8LqcjRJrSIkdt2qKGUgvrk=;
 b=tFNDsNNJuEMr1HlrUg2C4pLjjCzJsznujxwjoLN0I6AzBeeSmcqFEgfO5NjFvUMB8x
 fNXYhz2cMmwOtNtOfIqKa/NGjKUpetgfvl1UEyyKjzBvchE+4tw4tqX+mBeqnpIxSplT
 HOFThbOcZ8AfueWrqHUZ3oBquxnxxxBHR9VHpYAMzwRwIOU1PUoq9Pgu9Rcdu6c8qoMw
 b0RW0H4AVju05j2FygS86md3Rvl0vdKcVysuXqz55rCxQE853YqMi1/S2aFmgPDxO18N
 InfXHhMQuvipiYow8eGze9IWh0/yrpGaeRZLK+oQUVEnRbSNPKsJH54VDd6aCQiCrTeD
 YbBA==
X-Gm-Message-State: AJIora+8ZXIMY5aUDIEFWrnZJTl6lN/ftFck2rMK1RkfJp9l4J2ltgUx
 UqezkX8FfQK2P5UG0kI1XPB5j4Nis+Q=
X-Google-Smtp-Source: AGRyM1scAwUS1BBCT1XfPyX+ZzuLCIGM/DPTsyAo5YYquMdm5T+wMxmUmZKktKb5VQgIc0UbCjE0gw==
X-Received: by 2002:a17:90b:1d02:b0:1e6:961d:d56f with SMTP id
 on2-20020a17090b1d0200b001e6961dd56fmr28428340pjb.225.1655746727026; 
 Mon, 20 Jun 2022 10:38:47 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:1db8:e686:ccbc:a11b])
 by smtp.gmail.com with ESMTPSA id
 f185-20020a62dbc2000000b0051868677e6dsm373268pfg.51.2022.06.20.10.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:38:46 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 20 Jun 2022 10:38:42 -0700
Message-Id: <20220620173843.1462198-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Introduce memory mode to supports "normal"
 and "low" memory modes. "low" mode is to support low memory devices. Because
 of the nature of low memory devices, in this mode, f2fs will try to save
 memory [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.46 listed in list.dnswl.org]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1o3LMS-008X39-LY
Subject: [f2fs-dev] [PATCH 1/2] f2fs: introduce memory mode
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

Introduce memory mode to supports "normal" and "low" memory modes.
"low" mode is to support low memory devices. Because of the nature of
low memory devices, in this mode, f2fs will try to save memory sometimes
by sacrificing performance. "normal" mode is the default mode and same
as before.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/filesystems/f2fs.rst |  5 +++++
 fs/f2fs/f2fs.h                     | 13 +++++++++++++
 fs/f2fs/super.c                    | 24 ++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index ad8dc8c040a2..2965601e21bb 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -336,6 +336,11 @@ discard_unit=%s		 Control discard unit, the argument can be "block", "segment"
 			 default, it is helpful for large sized SMR or ZNS devices to
 			 reduce memory cost by getting rid of fs metadata supports small
 			 discard.
+memory=%s		 Control memory mode. This supports "normal" and "low" modes.
+			 "low" mode is introduced to support low memory devices.
+			 Because of the nature of low memory devices, in this mode, f2fs
+			 will try to save memory sometimes by sacrificing performance.
+			 "normal" mode is the default mode and same as before.
 ======================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d9bbecd008d2..fea97093d927 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -159,6 +159,7 @@ struct f2fs_mount_info {
 	int fsync_mode;			/* fsync policy */
 	int fs_mode;			/* fs mode: LFS or ADAPTIVE */
 	int bggc_mode;			/* bggc mode: off, on or sync */
+	int memory_mode;		/* memory mode */
 	int discard_unit;		/*
 					 * discard command's offset/size should
 					 * be aligned to this unit: block,
@@ -1360,6 +1361,13 @@ enum {
 	DISCARD_UNIT_SECTION,	/* basic discard unit is section */
 };
 
+enum {
+	MEMORY_MODE_NORMAL,	/* memory mode for normal devices */
+	MEMORY_MODE_LOW,	/* memory mode for low memry devices */
+};
+
+
+
 static inline int f2fs_test_bit(unsigned int nr, char *addr);
 static inline void f2fs_set_bit(unsigned int nr, char *addr);
 static inline void f2fs_clear_bit(unsigned int nr, char *addr);
@@ -4398,6 +4406,11 @@ static inline bool f2fs_lfs_mode(struct f2fs_sb_info *sbi)
 	return F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS;
 }
 
+static inline bool f2fs_low_mem_mode(struct f2fs_sb_info *sbi)
+{
+	return F2FS_OPTION(sbi).memory_mode == MEMORY_MODE_LOW;
+}
+
 static inline bool f2fs_may_compress(struct inode *inode)
 {
 	if (IS_SWAPFILE(inode) || f2fs_is_pinned_file(inode) ||
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3112fe92f934..cf9cf24f9b56 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -160,6 +160,7 @@ enum {
 	Opt_gc_merge,
 	Opt_nogc_merge,
 	Opt_discard_unit,
+	Opt_memory_mode,
 	Opt_err,
 };
 
@@ -236,6 +237,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_gc_merge, "gc_merge"},
 	{Opt_nogc_merge, "nogc_merge"},
 	{Opt_discard_unit, "discard_unit=%s"},
+	{Opt_memory_mode, "memory=%s"},
 	{Opt_err, NULL},
 };
 
@@ -1235,6 +1237,22 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			}
 			kfree(name);
 			break;
+		case Opt_memory_mode:
+			name = match_strdup(&args[0]);
+			if (!name)
+				return -ENOMEM;
+			if (!strcmp(name, "normal")) {
+				F2FS_OPTION(sbi).memory_mode =
+						MEMORY_MODE_NORMAL;
+			} else if (!strcmp(name, "low")) {
+				F2FS_OPTION(sbi).memory_mode =
+						MEMORY_MODE_LOW;
+			} else {
+				kfree(name);
+				return -EINVAL;
+			}
+			kfree(name);
+			break;
 		default:
 			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
 				 p);
@@ -2006,6 +2024,11 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
 		seq_printf(seq, ",discard_unit=%s", "section");
 
+	if (F2FS_OPTION(sbi).memory_mode == MEMORY_MODE_NORMAL)
+		seq_printf(seq, ",memory=%s", "normal");
+	else if (F2FS_OPTION(sbi).memory_mode == MEMORY_MODE_LOW)
+		seq_printf(seq, ",memory=%s", "low");
+
 	return 0;
 }
 
@@ -2027,6 +2050,7 @@ static void default_options(struct f2fs_sb_info *sbi)
 	F2FS_OPTION(sbi).compress_ext_cnt = 0;
 	F2FS_OPTION(sbi).compress_mode = COMPR_MODE_FS;
 	F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
+	F2FS_OPTION(sbi).memory_mode = MEMORY_MODE_NORMAL;
 
 	sbi->sb->s_flags &= ~SB_INLINECRYPT;
 
-- 
2.37.0.rc0.104.g0611611a94-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
