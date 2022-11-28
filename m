Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F2063A428
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:06:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oza6F-0007qV-MC;
	Mon, 28 Nov 2022 09:06:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1oza61-0007qJ-Us
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:06:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=93lUf2Yl5jzTi/ZpIQt/d66du6Z7M3MI5N1pwAOidPY=; b=X2oOVk28tCxGuHOgqle9Mcv6A+
 TO0Nimqb+7cpjZbPOcjWuzfhkablYsKXUsaheLKL5Ch9ULGUHX2CrvFB9/FKTBx78tuh/E8RifPqO
 fMq2Ac442n2fyKhe6Q2J2YwISWi7n7ftknd0mDVmt42B7FupGJpv6HefN5Yg4kIrMAPk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=93lUf2Yl5jzTi/ZpIQt/d66du6Z7M3MI5N1pwAOidPY=; b=jD/T2+aKZiZV3dJcflVZgeDyRG
 OlbUMFGpHTfDnl+JYrZSoSzwnFiZyYyd4Qt6ZNn/K8GMRuyQyW5S1RgEGBzBns/edG85vaskUPADd
 Eg5Sh8+7Rzq9vs2LnsvD/f6NxSw8m8gwAuLCLmbfrgl4ZyzmjsB89D2nMBipFNh/X15g=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oza5w-0004Mx-Pq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:06:37 +0000
Received: by mail-pf1-f179.google.com with SMTP id w129so9826484pfb.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Nov 2022 01:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=93lUf2Yl5jzTi/ZpIQt/d66du6Z7M3MI5N1pwAOidPY=;
 b=cvRduKxQBd+dQX00FcUDlva9HxIMi7VXrDhju+OzmsUksxd1+QVOsiRPhFgy1T9nk/
 5ey7nbpakRWL4y+EWdA67WIm0iQ4B701ccG8U1TBVOKA0IutNu4Pyp0WMOvf2gAk6kF1
 ua6qCIR1QsIUTkNFdhQl0UgwEofc8ZeeyTzo3aI804XeaaqcrYlDhGZgrZrW0zDkwMyx
 X5mFupdqjR6Oxo2uEnyMGhLvS6vLzohHdbDTZUT+4kegvUzNR/Dnvo9vcResfKIV9dXu
 +DZ65C2fLgesKA/EZ+PLJGH03NNezkjyjLWhjBFL4KewSBH35r7BSAKRFwj0H6OcJQrG
 ZjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=93lUf2Yl5jzTi/ZpIQt/d66du6Z7M3MI5N1pwAOidPY=;
 b=v/KLhswp7wqOkPBZIPXSsUH5WO21xmUBxs7V7Ug8RvW9Lxv2QFuHljjX9Qg+zFijCJ
 UI5zW46l+9Gb20Le6Bstnyycrlaei1zQom7Ge5FEIz+urOtaMOpm9VTedrPKG6Nu8vqh
 9w1VRCzSJ+PVlvgfV63/z7CCGwTqbxHl5odX1tYa/BvqReM5MPZMrg8HfwR6H6qpxWhD
 MHfLAhSuhQcILrDT3LPMfcFoQEc0d0pi50OMUWbnzBnN0N2zSLhi/12m2txmXhDpn79I
 uS/I1fz2uaYH86t0aNDJhU+SftcO7KdcWhyx4Aie0wbjLTNkJGCpo7BGXq71YOxlWLjP
 VqEg==
X-Gm-Message-State: ANoB5plGW21HvL4TdGJZBxiK9my/9Kd5EFBtHwVVqmin/Ezahm90doWv
 jYWSRLjl884Bax5Ds9X3dPdHGKssYQvHjQ==
X-Google-Smtp-Source: AA0mqf5bLNRGY5ORIClJVRaDOve5sCdxWODL5frMN+BPd5GYHAnQP2HovicHAy+X8YBzInCO7+2cBA==
X-Received: by 2002:aa7:9045:0:b0:56c:a321:eecb with SMTP id
 n5-20020aa79045000000b0056ca321eecbmr52091885pfo.19.1669626387218; 
 Mon, 28 Nov 2022 01:06:27 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.252])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a170902ea1100b001811a197797sm8269268plg.194.2022.11.28.01.06.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Nov 2022 01:06:26 -0800 (PST)
From: qixiaoyu1 <qxy65535@gmail.com>
X-Google-Original-From: qixiaoyu1 <qixiaoyu1@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 16:58:57 +0800
Message-Id: <20221128085859.5295-4-qixiaoyu1@xiaomi.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221128085859.5295-1-qixiaoyu1@xiaomi.com>
References: <20221128085859.5295-1-qixiaoyu1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: xiongping1 enable data block seperation feature only
 when age_extent_cache mount option is on Signed-off-by: xiongping1
 Signed-off-by:
 qixiaoyu1 --- Documentation/filesystems/f2fs.rst | 4 ++++ fs/f2fs/block_age.c
 | 3 +++ fs/f2fs/f2fs.h | 1 + fs/f2fs/super.c | 27 +++++++++++++++++++++++++++
 [...] Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.179 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oza5w-0004Mx-Pq
Subject: [f2fs-dev] [PATCH 3/5] f2fs: add age_extent_cache mount option
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
Cc: xiongping1 <xiongping1@xiaomi.com>, qixiaoyu1 <qixiaoyu1@xiaomi.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: xiongping1 <xiongping1@xiaomi.com>

enable data block seperation feature only when
age_extent_cache mount option is on

Signed-off-by: xiongping1 <xiongping1@xiaomi.com>
Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
---
 Documentation/filesystems/f2fs.rst |  4 ++++
 fs/f2fs/block_age.c                |  3 +++
 fs/f2fs/f2fs.h                     |  1 +
 fs/f2fs/super.c                    | 27 +++++++++++++++++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 17df9a02ccff..f4e8943f649d 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -340,6 +340,10 @@ memory=%s		 Control memory mode. This supports "normal" and "low" modes.
 			 Because of the nature of low memory devices, in this mode, f2fs
 			 will try to save memory sometimes by sacrificing performance.
 			 "normal" mode is the default mode and same as before.
+age_extent_cache	 Enable an age extent cache based on rb-tree, it can record
+			 data block update frequency of the extent per inode, in
+			 order to indicate better temperature info for data block
+			 allocation.
 ======================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/block_age.c b/fs/f2fs/block_age.c
index c8e8fbe51d8e..bc009616adfb 100644
--- a/fs/f2fs/block_age.c
+++ b/fs/f2fs/block_age.c
@@ -37,6 +37,9 @@ static inline bool f2fs_may_age_extent_tree(struct inode *inode)
 	if (list_empty(&sbi->s_list))
 		return false;
 
+	if (!test_opt(sbi, AGE_EXTENT_CACHE))
+		return false;
+
 	/* don't cache block age info for cold file */
 	if (is_inode_flag_set(inode, FI_COMPRESSED_FILE) ||
 			file_is_cold(inode))
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5cc516228407..428cc560b721 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -106,6 +106,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
 #define F2FS_MOUNT_MERGE_CHECKPOINT	0x10000000
 #define	F2FS_MOUNT_GC_MERGE		0x20000000
 #define F2FS_MOUNT_COMPRESS_CACHE	0x40000000
+#define F2FS_MOUNT_AGE_EXTENT_CACHE	0x80000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 91d3c9d0425d..dcb5905c7264 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -161,6 +161,9 @@ enum {
 	Opt_nogc_merge,
 	Opt_discard_unit,
 	Opt_memory_mode,
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	Opt_age_extent_cache,
+#endif
 	Opt_err,
 };
 
@@ -238,6 +241,9 @@ static match_table_t f2fs_tokens = {
 	{Opt_nogc_merge, "nogc_merge"},
 	{Opt_discard_unit, "discard_unit=%s"},
 	{Opt_memory_mode, "memory=%s"},
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	{Opt_age_extent_cache, "age_extent_cache"},
+#endif
 	{Opt_err, NULL},
 };
 
@@ -1253,6 +1259,11 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			}
 			kfree(name);
 			break;
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+		case Opt_age_extent_cache:
+			set_opt(sbi, AGE_EXTENT_CACHE);
+			break;
+#endif
 		default:
 			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
 				 p);
@@ -2035,6 +2046,10 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 	else if (F2FS_OPTION(sbi).memory_mode == MEMORY_MODE_LOW)
 		seq_printf(seq, ",memory=%s", "low");
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	if (test_opt(sbi, AGE_EXTENT_CACHE))
+		seq_puts(seq, ",age_extent_cache");
+#endif
 	return 0;
 }
 
@@ -2206,6 +2221,9 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	bool need_restart_discard = false, need_stop_discard = false;
 	bool no_extent_cache = !test_opt(sbi, EXTENT_CACHE);
 	bool enable_checkpoint = !test_opt(sbi, DISABLE_CHECKPOINT);
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	bool no_age_extent_cache = !test_opt(sbi, AGE_EXTENT_CACHE);
+#endif
 	bool no_io_align = !F2FS_IO_ALIGNED(sbi);
 	bool no_atgc = !test_opt(sbi, ATGC);
 	bool no_discard = !test_opt(sbi, DISCARD);
@@ -2300,6 +2318,15 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		goto restore_opts;
 	}
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	/* disallow enable/disable age extent_cache dynamically */
+	if (no_age_extent_cache == !!test_opt(sbi, AGE_EXTENT_CACHE)) {
+		err = -EINVAL;
+		f2fs_warn(sbi, "switch age_extent_cache option is not allowed");
+		goto restore_opts;
+	}
+#endif
+
 	if (no_io_align == !!F2FS_IO_ALIGNED(sbi)) {
 		err = -EINVAL;
 		f2fs_warn(sbi, "switch io_bits option is not allowed");
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
