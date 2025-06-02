Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFD2ACAB0F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Jun 2025 11:03:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hw0ilK0m5GHyZ6rG1L8beSgNcndlEpIxAbAOHJ01IZU=; b=HLeWlVKcHJZey/vsi2ipHTYSCt
	b0LhM6RaC60lV/LqJKDbHZ65O91NAHrZ0ZeVfQXnTTaj9JmwMKzMqKNgiRkelnWComTv3G0rQu6Dv
	vfzsTh+qcrmo+BvQoBl28bQgnuGZYG1i/1HAWLeDcLIlBIVWAn1yVNM2Z6U9yfA1Y0CI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uM14U-0004mk-3O;
	Mon, 02 Jun 2025 09:03:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1uM14S-0004m5-Gx
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 09:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hIkuhNBSkK8VVIeidRBLXtJQWP25YUHfmunqTl4zsCg=; b=GfZO1VVQLPAs9q4QxVkQC7DTyf
 4QCaYRaEfpQjtpD60LbC4eLGpRHiA7upS2Nh+AVmBueJ8uFpi/Ai6+w3dtqySGa4cIp/yvCArPvGY
 TWXfRTe66e9q1JgAicy4m6R82wQ8hdBPxIUuKOXTLsP8nNO/s/pzaq9PefSP56MnR71w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hIkuhNBSkK8VVIeidRBLXtJQWP25YUHfmunqTl4zsCg=; b=hmgK04RJLqMW013K6KkqrknZ14
 d6RscPcRV8XL2Tr3JdfEZ6fKIwiGdAaEr3NOVFSZS2iTfxwFOqK9zEmaUT7miDQQquPdRli1jpscn
 70pX+NbP8dUQ8MlIXqQG9KWCD6auTRwqHmCIStXu/NJ/I1isdKRvr4E8G3HTdxmjpeec=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uM14M-0007vn-EW for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 09:03:04 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4b9ns273gVz1fxq2;
 Mon,  2 Jun 2025 17:01:42 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
 by mail.maildlp.com (Postfix) with ESMTPS id 5B949180044;
 Mon,  2 Jun 2025 17:02:51 +0800 (CST)
Received: from huawei.com (10.67.174.162) by kwepemo500009.china.huawei.com
 (7.202.194.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 2 Jun
 2025 17:02:50 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 2 Jun 2025 09:02:20 +0000
Message-ID: <20250602090224.485077-4-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20250602090224.485077-1-lihongbo22@huawei.com>
References: <20250602090224.485077-1-lihongbo22@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.162]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemo500009.china.huawei.com (7.202.194.199)
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  At the parsing phase of the new mount api, sbi will not be
 available. So here allows sbi to be NULL in f2fs log helpers and use that
 in handle_mount_opt(). Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
 [sandeen:
 forward port] Signed-off-by: Eric Sandeen <sandeen@redhat.com> ---
 fs/f2fs/super.c | 90 +++++++++++++++++++++++++++ 1 f [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.35 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.35 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.35 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
X-Headers-End: 1uM14M-0007vn-EW
Subject: [f2fs-dev] [PATCH v4 3/7] f2fs: Allow sbi to be NULL in f2fs_printk
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
Cc: linux-fsdevel@vger.kernel.org, sandeen@redhat.com, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

At the parsing phase of the new mount api, sbi will not be
available. So here allows sbi to be NULL in f2fs log helpers
and use that in handle_mount_opt().

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
[sandeen: forward port]
Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---
 fs/f2fs/super.c | 90 +++++++++++++++++++++++++++----------------------
 1 file changed, 49 insertions(+), 41 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index dff2419ba905..150287b1e732 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -325,11 +325,19 @@ void f2fs_printk(struct f2fs_sb_info *sbi, bool limit_rate,
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
@@ -739,13 +747,13 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_discard:
 		if (result.negated) {
 			if (f2fs_hw_should_discard(sbi)) {
-				f2fs_warn(sbi, "discard is required for zoned block devices");
+				f2fs_warn(NULL, "discard is required for zoned block devices");
 				return -EINVAL;
 			}
 			clear_opt(sbi, DISCARD);
 		} else {
 			if (!f2fs_hw_support_discard(sbi)) {
-				f2fs_warn(sbi, "device does not support discard");
+				f2fs_warn(NULL, "device does not support discard");
 				break;
 			}
 			set_opt(sbi, DISCARD);
@@ -753,7 +761,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		break;
 	case Opt_noheap:
 	case Opt_heap:
-		f2fs_warn(sbi, "heap/no_heap options were deprecated");
+		f2fs_warn(NULL, "heap/no_heap options were deprecated");
 		break;
 #ifdef CONFIG_F2FS_FS_XATTR
 	case Opt_user_xattr:
@@ -776,7 +784,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_user_xattr:
 	case Opt_inline_xattr:
 	case Opt_inline_xattr_size:
-		f2fs_info(sbi, "%s options not supported", param->key);
+		f2fs_info(NULL, "%s options not supported", param->key);
 		break;
 #endif
 #ifdef CONFIG_F2FS_FS_POSIX_ACL
@@ -788,7 +796,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		break;
 #else
 	case Opt_acl:
-		f2fs_info(sbi, "%s options not supported", param->key);
+		f2fs_info(NULL, "%s options not supported", param->key);
 		break;
 #endif
 	case Opt_active_logs:
@@ -842,7 +850,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		break;
 	case Opt_reserve_root:
 		if (test_opt(sbi, RESERVE_ROOT)) {
-			f2fs_info(sbi, "Preserve previous reserve_root=%u",
+			f2fs_info(NULL, "Preserve previous reserve_root=%u",
 				  F2FS_OPTION(sbi).root_reserved_blocks);
 		} else {
 			F2FS_OPTION(sbi).root_reserved_blocks = result.int_32;
@@ -873,7 +881,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 #else
 	case Opt_fault_injection:
 	case Opt_fault_type:
-		f2fs_info(sbi, "%s options not supported", param->key);
+		f2fs_info(NULL, "%s options not supported", param->key);
 		break;
 #endif
 	case Opt_lazytime:
@@ -936,7 +944,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_usrjquota:
 	case Opt_grpjquota:
 	case Opt_prjjquota:
-		f2fs_info(sbi, "quota operations not supported");
+		f2fs_info(NULL, "quota operations not supported");
 		break;
 #endif
 	case Opt_alloc:
@@ -954,7 +962,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 #ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
 		set_opt(sbi, INLINECRYPT);
 #else
-		f2fs_info(sbi, "inline encryption not supported");
+		f2fs_info(NULL, "inline encryption not supported");
 #endif
 		break;
 	case Opt_checkpoint:
@@ -1001,7 +1009,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	case Opt_compress_algorithm:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			break;
 		}
 		name = param->string;
@@ -1010,7 +1018,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 			F2FS_OPTION(sbi).compress_level = 0;
 			F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZO;
 #else
-			f2fs_info(sbi, "kernel doesn't support lzo compression");
+			f2fs_info(NULL, "kernel doesn't support lzo compression");
 #endif
 		} else if (!strncmp(name, "lz4", 3)) {
 #ifdef CONFIG_F2FS_FS_LZ4
@@ -1019,7 +1027,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 				return -EINVAL;
 			F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZ4;
 #else
-			f2fs_info(sbi, "kernel doesn't support lz4 compression");
+			f2fs_info(NULL, "kernel doesn't support lz4 compression");
 #endif
 		} else if (!strncmp(name, "zstd", 4)) {
 #ifdef CONFIG_F2FS_FS_ZSTD
@@ -1028,26 +1036,26 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 				return -EINVAL;
 			F2FS_OPTION(sbi).compress_algorithm = COMPRESS_ZSTD;
 #else
-			f2fs_info(sbi, "kernel doesn't support zstd compression");
+			f2fs_info(NULL, "kernel doesn't support zstd compression");
 #endif
 		} else if (!strcmp(name, "lzo-rle")) {
 #ifdef CONFIG_F2FS_FS_LZORLE
 			F2FS_OPTION(sbi).compress_level = 0;
 			F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZORLE;
 #else
-			f2fs_info(sbi, "kernel doesn't support lzorle compression");
+			f2fs_info(NULL, "kernel doesn't support lzorle compression");
 #endif
 		} else
 			return -EINVAL;
 		break;
 	case Opt_compress_log_size:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			break;
 		}
 		if (result.uint_32 < MIN_COMPRESS_LOG_SIZE ||
 		    result.uint_32 > MAX_COMPRESS_LOG_SIZE) {
-			f2fs_err(sbi,
+			f2fs_err(NULL,
 				"Compress cluster log size is out of range");
 			return -EINVAL;
 		}
@@ -1055,7 +1063,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		break;
 	case Opt_compress_extension:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			break;
 		}
 		name = param->string;
@@ -1064,7 +1072,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 
 		if (strlen(name) >= F2FS_EXTENSION_LEN ||
 		    ext_cnt >= COMPRESS_EXT_NUM) {
-			f2fs_err(sbi, "invalid extension length/number");
+			f2fs_err(NULL, "invalid extension length/number");
 			return -EINVAL;
 		}
 
@@ -1078,7 +1086,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		break;
 	case Opt_nocompress_extension:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			break;
 		}
 		name = param->string;
@@ -1087,7 +1095,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 
 		if (strlen(name) >= F2FS_EXTENSION_LEN ||
 			noext_cnt >= COMPRESS_EXT_NUM) {
-			f2fs_err(sbi, "invalid extension length/number");
+			f2fs_err(NULL, "invalid extension length/number");
 			return -EINVAL;
 		}
 
@@ -1101,21 +1109,21 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		break;
 	case Opt_compress_chksum:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			break;
 		}
 		F2FS_OPTION(sbi).compress_chksum = true;
 		break;
 	case Opt_compress_mode:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			break;
 		}
 		F2FS_OPTION(sbi).compress_mode = result.uint_32;
 		break;
 	case Opt_compress_cache:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			break;
 		}
 		set_opt(sbi, COMPRESS_CACHE);
@@ -1128,7 +1136,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_compress_chksum:
 	case Opt_compress_mode:
 	case Opt_compress_cache:
-		f2fs_info(sbi, "compression options not supported");
+		f2fs_info(NULL, "compression options not supported");
 		break;
 #endif
 	case Opt_atgc:
@@ -1213,17 +1221,17 @@ static int f2fs_validate_options(struct f2fs_sb_info *sbi)
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
 
 	if (!IS_ENABLED(CONFIG_UNICODE) && f2fs_sb_has_casefold(sbi)) {
-		f2fs_err(sbi,
+		f2fs_err(NULL,
 			"Filesystem with casefold feature cannot be mounted without CONFIG_UNICODE");
 		return -EINVAL;
 	}
@@ -1237,24 +1245,24 @@ static int f2fs_validate_options(struct f2fs_sb_info *sbi)
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
-		f2fs_err(sbi, "Zoned block device support is not enabled");
+		f2fs_err(NULL, "Zoned block device support is not enabled");
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
@@ -1264,11 +1272,11 @@ static int f2fs_validate_options(struct f2fs_sb_info *sbi)
 
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
 
@@ -1277,24 +1285,24 @@ static int f2fs_validate_options(struct f2fs_sb_info *sbi)
 
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
 
-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
