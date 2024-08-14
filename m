Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 436F9951275
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2024 04:32:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1se3ok-0000X0-BH;
	Wed, 14 Aug 2024 02:32:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1se3oi-0000Wj-Ng
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 02:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7YLutfHadPlfIJrQd6691hCRshZ3A7vSS2HOSPmyqEM=; b=Zfo+DZndZ7afkoSCFG+cmtgB2y
 BKRlCBhuBiI4OXh4L8X9dq4sD36uvkOUjD5o4OJ/eWAs+Y5ccV3VusDj3G4TOYbO3trVhpVue03ce
 vEmmFVDvzzYYmg/Fi5KaWyl6BDKLnkJUqJg3ocrPciBe3VrJj2RPiwCoGfq3SO0HsMI4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7YLutfHadPlfIJrQd6691hCRshZ3A7vSS2HOSPmyqEM=; b=Q8z/L/hK6M0wJFgaAeSqCvgf9k
 X/z56ym9HB3eo4HPy8g8eamkJxgT+6tuJeCimDA7F2WLWN4DbrDMQ5cczPQ07YTkjkGSxqxX/ekAP
 9/ShxSvx5jz85aN7uuiF0jhO29zDqUzefMelZA+1ZNTl4VyUkyA+HbOYgV3Wtn6Hsvx4=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1se3oh-0005VC-MI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 02:32:53 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WkC2L0RdBz1T77C;
 Wed, 14 Aug 2024 10:32:10 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
 by mail.maildlp.com (Postfix) with ESMTPS id 5A9C81800D0;
 Wed, 14 Aug 2024 10:32:39 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 14 Aug
 2024 10:32:39 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 14 Aug 2024 10:39:07 +0800
Message-ID: <20240814023912.3959299-5-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240814023912.3959299-1-lihongbo22@huawei.com>
References: <20240814023912.3959299-1-lihongbo22@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  At the parsing phase of the new mount api, sbi will not be
 available. So here allows sbi to be NULL in f2fs log helpers and use that
 in handle_mount_opt(). Signed-off-by: Hongbo Li <lihongbo22@huawei.com> ---
 fs/f2fs/super.c | 106 ++++++++++++++++++++++++++ 1 file changed,
 57 insertions(+), 49 deletions(-) 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [45.249.212.255 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vaf.va]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.255 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
X-Headers-End: 1se3oh-0005VC-MI
Subject: [f2fs-dev] [PATCH 4/9] f2fs: Allow sbi to be NULL in f2fs_printk
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
From: Hongbo Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hongbo Li <lihongbo22@huawei.com>
Cc: linux-fsdevel@vger.kernel.org, lczerner@redhat.com, brauner@kernel.org,
 lihongbo22@huawei.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

At the parsing phase of the new mount api, sbi will not be
available. So here allows sbi to be NULL in f2fs log helpers
and use that in handle_mount_opt().

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 fs/f2fs/super.c | 106 ++++++++++++++++++++++++++----------------------
 1 file changed, 57 insertions(+), 49 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8c8cd06a6d9c..2a06444e7e02 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -364,11 +364,19 @@ void f2fs_printk(struct f2fs_sb_info *sbi, bool limit_rate,
 	vaf.fmt = printk_skip_level(fmt);
 	vaf.va = &args;
 	if (limit_rate)
-		printk_ratelimited("%c%cF2FS-fs (%s): %pV\n",
-			KERN_SOH_ASCII, level, sbi->sb->s_id, &vaf);
+		if (sbi)
+			printk_ratelimited("%c%cF2FS-fs (%s): %pV\n",
+				KERN_SOH_ASCII, level, sbi->sb->s_id, &vaf);
+		else
+			printk_ratelimited("%c%cF2FS-fs: %pV\n",
+				KERN_SOH_ASCII, level, &vaf);
 	else
-		printk("%c%cF2FS-fs (%s): %pV\n",
-			KERN_SOH_ASCII, level, sbi->sb->s_id, &vaf);
+		if (sbi)
+			printk("%c%cF2FS-fs (%s): %pV\n",
+				KERN_SOH_ASCII, level, sbi->sb->s_id, &vaf);
+		else
+			printk("%c%cF2FS-fs: %pV\n",
+				KERN_SOH_ASCII, level, &vaf);
 
 	va_end(args);
 }
@@ -796,21 +804,21 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		return 0;
 	case Opt_discard:
 		if (!f2fs_hw_support_discard(sbi)) {
-			f2fs_warn(sbi, "device does not support discard");
+			f2fs_warn(NULL, "device does not support discard");
 			return 0;
 		}
 		set_opt(sbi, DISCARD);
 		return 0;
 	case Opt_nodiscard:
 		if (f2fs_hw_should_discard(sbi)) {
-			f2fs_warn(sbi, "discard is required for zoned block devices");
+			f2fs_warn(NULL, "discard is required for zoned block devices");
 			return -EINVAL;
 		}
 		clear_opt(sbi, DISCARD);
 		return 0;
 	case Opt_noheap:
 	case Opt_heap:
-		f2fs_warn(sbi, "heap/no_heap options were deprecated");
+		f2fs_warn(NULL, "heap/no_heap options were deprecated");
 		return 0;
 #ifdef CONFIG_F2FS_FS_XATTR
 	case Opt_user_xattr:
@@ -831,16 +839,16 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		return 0;
 #else
 	case Opt_user_xattr:
-		f2fs_info(sbi, "user_xattr options not supported");
+		f2fs_info(NULL, "user_xattr options not supported");
 		return 0;
 	case Opt_nouser_xattr:
-		f2fs_info(sbi, "nouser_xattr options not supported");
+		f2fs_info(NULL, "nouser_xattr options not supported");
 		return 0;
 	case Opt_inline_xattr:
-		f2fs_info(sbi, "inline_xattr options not supported");
+		f2fs_info(NULL, "inline_xattr options not supported");
 		return 0;
 	case Opt_noinline_xattr:
-		f2fs_info(sbi, "noinline_xattr options not supported");
+		f2fs_info(NULL, "noinline_xattr options not supported");
 		return 0;
 #endif
 #ifdef CONFIG_F2FS_FS_POSIX_ACL
@@ -852,10 +860,10 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		return 0;
 #else
 	case Opt_acl:
-		f2fs_info(sbi, "acl options not supported");
+		f2fs_info(NULL, "acl options not supported");
 		return 0;
 	case Opt_noacl:
-		f2fs_info(sbi, "noacl options not supported");
+		f2fs_info(NULL, "noacl options not supported");
 		return 0;
 #endif
 	case Opt_active_logs:
@@ -905,7 +913,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		return 0;
 	case Opt_reserve_root:
 		if (test_opt(sbi, RESERVE_ROOT)) {
-			f2fs_info(sbi, "Preserve previous reserve_root=%u",
+			f2fs_info(NULL, "Preserve previous reserve_root=%u",
 				  F2FS_OPTION(sbi).root_reserved_blocks);
 		} else {
 			F2FS_OPTION(sbi).root_reserved_blocks = result.uint_32;
@@ -915,7 +923,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_resuid:
 		uid = make_kuid(current_user_ns(), result.uint_32);
 		if (!uid_valid(uid)) {
-			f2fs_err(sbi, "Invalid uid value %u", result.uint_32);
+			f2fs_err(NULL, "Invalid uid value %u", result.uint_32);
 			return -EINVAL;
 		}
 		F2FS_OPTION(sbi).s_resuid = uid;
@@ -923,7 +931,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_resgid:
 		gid = make_kgid(current_user_ns(), result.uint_32);
 		if (!gid_valid(gid)) {
-			f2fs_err(sbi, "Invalid gid value %u", result.uint_32);
+			f2fs_err(NULL, "Invalid gid value %u", result.uint_32);
 			return -EINVAL;
 		}
 		F2FS_OPTION(sbi).s_resgid = gid;
@@ -962,11 +970,11 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		return 0;
 #else
 	case Opt_fault_injection:
-		f2fs_info(sbi, "fault_injection options not supported");
+		f2fs_info(NULL, "fault_injection options not supported");
 		return 0;
 
 	case Opt_fault_type:
-		f2fs_info(sbi, "fault_type options not supported");
+		f2fs_info(NULL, "fault_type options not supported");
 		return 0;
 #endif
 #ifdef CONFIG_QUOTA
@@ -1028,7 +1036,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_jqfmt_vfsv0:
 	case Opt_jqfmt_vfsv1:
 	case Opt_noquota:
-		f2fs_info(sbi, "quota operations not supported");
+		f2fs_info(NULL, "quota operations not supported");
 		return 0;
 #endif
 	case Opt_alloc:
@@ -1072,7 +1080,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 #ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
 		sb->s_flags |= SB_INLINECRYPT;
 #else
-		f2fs_info(sbi, "inline encryption not supported");
+		f2fs_info(NULL, "inline encryption not supported");
 #endif
 		return 0;
 	case Opt_checkpoint:
@@ -1126,7 +1134,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	case Opt_compress_algorithm:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			return 0;
 		}
 		name = kmemdup_nul(param->string, param->size, GFP_KERNEL);
@@ -1138,7 +1146,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 			F2FS_OPTION(sbi).compress_algorithm =
 							COMPRESS_LZO;
 #else
-			f2fs_info(sbi, "kernel doesn't support lzo compression");
+			f2fs_info(NULL, "kernel doesn't support lzo compression");
 #endif
 		} else if (!strncmp(name, "lz4", 3)) {
 #ifdef CONFIG_F2FS_FS_LZ4
@@ -1150,7 +1158,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 			F2FS_OPTION(sbi).compress_algorithm =
 							COMPRESS_LZ4;
 #else
-			f2fs_info(sbi, "kernel doesn't support lz4 compression");
+			f2fs_info(NULL, "kernel doesn't support lz4 compression");
 #endif
 		} else if (!strncmp(name, "zstd", 4)) {
 #ifdef CONFIG_F2FS_FS_ZSTD
@@ -1162,7 +1170,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 			F2FS_OPTION(sbi).compress_algorithm =
 							COMPRESS_ZSTD;
 #else
-			f2fs_info(sbi, "kernel doesn't support zstd compression");
+			f2fs_info(NULL, "kernel doesn't support zstd compression");
 #endif
 		} else if (!strcmp(name, "lzo-rle")) {
 #ifdef CONFIG_F2FS_FS_LZORLE
@@ -1170,7 +1178,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 			F2FS_OPTION(sbi).compress_algorithm =
 							COMPRESS_LZORLE;
 #else
-			f2fs_info(sbi, "kernel doesn't support lzorle compression");
+			f2fs_info(NULL, "kernel doesn't support lzorle compression");
 #endif
 		} else {
 			kfree(name);
@@ -1180,12 +1188,12 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		return 0;
 	case Opt_compress_log_size:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			return 0;
 		}
 		if (result.int_32 < MIN_COMPRESS_LOG_SIZE ||
 			result.int_32 > MAX_COMPRESS_LOG_SIZE) {
-			f2fs_err(sbi,
+			f2fs_err(NULL,
 				"Compress cluster log size is out of range");
 			return -EINVAL;
 		}
@@ -1193,7 +1201,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		return 0;
 	case Opt_compress_extension:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			break;
 		}
 		name = kmemdup_nul(param->string, param->size, GFP_KERNEL);
@@ -1205,7 +1213,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 
 		if (strlen(name) >= F2FS_EXTENSION_LEN ||
 			ext_cnt >= COMPRESS_EXT_NUM) {
-			f2fs_err(sbi,
+			f2fs_err(NULL,
 				"invalid extension length/number");
 			kfree(name);
 			return -EINVAL;
@@ -1226,7 +1234,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		return 0;
 	case Opt_nocompress_extension:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			return 0;
 		}
 		name = kmemdup_nul(param->string, param->size, GFP_KERNEL);
@@ -1238,7 +1246,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 
 		if (strlen(name) >= F2FS_EXTENSION_LEN ||
 			noext_cnt >= COMPRESS_EXT_NUM) {
-			f2fs_err(sbi,
+			f2fs_err(NULL,
 				"invalid extension length/number");
 			kfree(name);
 			return -EINVAL;
@@ -1259,14 +1267,14 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		return 0;
 	case Opt_compress_chksum:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			return 0;
 		}
 		F2FS_OPTION(sbi).compress_chksum = true;
 		return 0;
 	case Opt_compress_mode:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			return 0;
 		}
 		name = kmemdup_nul(param->string, param->size, GFP_KERNEL);
@@ -1284,7 +1292,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		return 0;
 	case Opt_compress_cache:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			return 0;
 		}
 		set_opt(sbi, COMPRESS_CACHE);
@@ -1297,7 +1305,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_compress_chksum:
 	case Opt_compress_mode:
 	case Opt_compress_cache:
-		f2fs_info(sbi, "compression options not supported");
+		f2fs_info(NULL, "compression options not supported");
 		return 0;
 #endif
 	case Opt_atgc:
@@ -1367,7 +1375,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		kfree(name);
 		return 0;
 	default:
-		f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
+		f2fs_err(NULL, "Unrecognized mount option \"%s\" or missing value",
 			 param->key);
 		return -EINVAL;
 	}
@@ -1434,17 +1442,17 @@ static int f2fs_validate_options(struct super_block *sb)
 		return -EINVAL;
 #else
 	if (f2fs_sb_has_quota_ino(sbi) && !f2fs_readonly(sbi->sb)) {
-		f2fs_info(sbi, "Filesystem with quota feature cannot be mounted RDWR without CONFIG_QUOTA");
+		f2fs_info(NULL, "Filesystem with quota feature cannot be mounted RDWR without CONFIG_QUOTA");
 		return -EINVAL;
 	}
 	if (f2fs_sb_has_project_quota(sbi) && !f2fs_readonly(sbi->sb)) {
-		f2fs_err(sbi, "Filesystem with project quota feature cannot be mounted RDWR without CONFIG_QUOTA");
+		f2fs_err(NULL, "Filesystem with project quota feature cannot be mounted RDWR without CONFIG_QUOTA");
 		return -EINVAL;
 	}
 #endif
 #if !IS_ENABLED(CONFIG_UNICODE)
 	if (f2fs_sb_has_casefold(sbi)) {
-		f2fs_err(sbi,
+		f2fs_err(NULL,
 			"Filesystem with casefold feature cannot be mounted without CONFIG_UNICODE");
 		return -EINVAL;
 	}
@@ -1458,24 +1466,24 @@ static int f2fs_validate_options(struct super_block *sb)
 #ifdef CONFIG_BLK_DEV_ZONED
 		if (F2FS_OPTION(sbi).discard_unit !=
 						DISCARD_UNIT_SECTION) {
-			f2fs_info(sbi, "Zoned block device doesn't need small discard, set discard_unit=section by default");
+			f2fs_info(NULL, "Zoned block device doesn't need small discard, set discard_unit=section by default");
 			F2FS_OPTION(sbi).discard_unit =
 					DISCARD_UNIT_SECTION;
 		}
 
 		if (F2FS_OPTION(sbi).fs_mode != FS_MODE_LFS) {
-			f2fs_info(sbi, "Only lfs mode is allowed with zoned block device feature");
+			f2fs_info(NULL, "Only lfs mode is allowed with zoned block device feature");
 			return -EINVAL;
 		}
 #else
-			f2fs_err(sbi, "Zoned block device support is not enabled");
+			f2fs_err(NULL, "Zoned block device support is not enabled");
 			return -EINVAL;
 #endif
 		}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (f2fs_test_compress_extension(sbi)) {
-		f2fs_err(sbi, "invalid compress or nocompress extension");
+		f2fs_err(NULL, "invalid compress or nocompress extension");
 		return -EINVAL;
 	}
 #endif
@@ -1485,11 +1493,11 @@ static int f2fs_validate_options(struct super_block *sb)
 
 		if (!f2fs_sb_has_extra_attr(sbi) ||
 			!f2fs_sb_has_flexible_inline_xattr(sbi)) {
-			f2fs_err(sbi, "extra_attr or flexible_inline_xattr feature is off");
+			f2fs_err(NULL, "extra_attr or flexible_inline_xattr feature is off");
 			return -EINVAL;
 		}
 		if (!test_opt(sbi, INLINE_XATTR)) {
-			f2fs_err(sbi, "inline_xattr_size option should be set with inline_xattr option");
+			f2fs_err(NULL, "inline_xattr_size option should be set with inline_xattr option");
 			return -EINVAL;
 		}
 
@@ -1498,24 +1506,24 @@ static int f2fs_validate_options(struct super_block *sb)
 
 		if (F2FS_OPTION(sbi).inline_xattr_size < min_size ||
 				F2FS_OPTION(sbi).inline_xattr_size > max_size) {
-			f2fs_err(sbi, "inline xattr size is out of range: %d ~ %d",
+			f2fs_err(NULL, "inline xattr size is out of range: %d ~ %d",
 				 min_size, max_size);
 			return -EINVAL;
 		}
 	}
 
 	if (test_opt(sbi, ATGC) && f2fs_lfs_mode(sbi)) {
-		f2fs_err(sbi, "LFS is not compatible with ATGC");
+		f2fs_err(NULL, "LFS is not compatible with ATGC");
 		return -EINVAL;
 	}
 
 	if (f2fs_is_readonly(sbi) && test_opt(sbi, FLUSH_MERGE)) {
-		f2fs_err(sbi, "FLUSH_MERGE not compatible with readonly mode");
+		f2fs_err(NULL, "FLUSH_MERGE not compatible with readonly mode");
 		return -EINVAL;
 	}
 
 	if (f2fs_sb_has_readonly(sbi) && !f2fs_readonly(sbi->sb)) {
-		f2fs_err(sbi, "Allow to mount readonly mode only");
+		f2fs_err(NULL, "Allow to mount readonly mode only");
 		return -EROFS;
 	}
 	return 0;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
