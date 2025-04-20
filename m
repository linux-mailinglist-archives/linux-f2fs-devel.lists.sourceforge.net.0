Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DC9A9524C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Apr 2025 16:01:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u6rhb-0003oj-Fv;
	Mon, 21 Apr 2025 14:00:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1u6rhZ-0003oc-WE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Apr 2025 14:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZemooXzBmCB9xX4ZitlTfSWvN1M40kyBD1Fl2rGdnZc=; b=JLQLs6AeDUrVsUjJL9BrUx4nVy
 vcm4KIJl1MHfGdr8+9BX7kilojFGaR1iBGovr7byfJ4xY7clqWCuYnxVf4+5T4LX1VFXLbrnamg3l
 p4gg59Nzd+vuJ2E1CzQllZ6xddQqSIs9c7ilQVcYABnW/U4sAvKm4s5cpWA02WvMx/Bs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZemooXzBmCB9xX4ZitlTfSWvN1M40kyBD1Fl2rGdnZc=; b=WKonSKY/4SkwwQ52h/KQKR7F+M
 n30GO/UIzgWMxYuZv7427BH9/pyATI6uHO9+OJcRPq12DrcPkYR/nNvDPSw0Z84MSE4/CVU80adh9
 JgcGgak+4hNXBXD/s8MUtkfWkPibquoCGMhSjv7OOk8Q3FZjEB9hZ8BjJNudzJpB2Dmg=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1u6rhJ-0003xM-FJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Apr 2025 14:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745244022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZemooXzBmCB9xX4ZitlTfSWvN1M40kyBD1Fl2rGdnZc=;
 b=UyERkVqY5WBJ5gLMlRtGTi5QxwNJSxgan0F6dWInNRaHv3apC9C/1wOiJEKxtw5OcbY+sd
 PFbHicjNtRGA2lozL77mgeGUBa4ATHwhHax6lPuiMqKHQ9Dtd1xAwRVnQjeTN9mX9gMHo8
 y7GRfP42LpdC5vXLH428h8vmt97VFl0=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-0Lks7444MpGHmma6p8qDRA-1; Mon, 21 Apr 2025 10:00:21 -0400
X-MC-Unique: 0Lks7444MpGHmma6p8qDRA-1
X-Mimecast-MFC-AGG-ID: 0Lks7444MpGHmma6p8qDRA_1745244020
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-85e7551197bso344814839f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Apr 2025 07:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745244020; x=1745848820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZemooXzBmCB9xX4ZitlTfSWvN1M40kyBD1Fl2rGdnZc=;
 b=KAeiF8Lx+HRVWUd8NvzIydvwF+YMWa6+hP73GYGXnnUky8wSmJ3oTouPE5yiVN6c62
 dA8AfF8T7tZ1bamZY39hVLirDMHr9oN+xUe+OB8ItbM9Pa2SrEqw+VfDxJM0qYnwnIdq
 6nof7Ql4fEWIfxt86zNWbUBxDRBn8X0zo3UIFZMlqTZX+O6hrY4BDW11wh07W15ifVyd
 GNBlvN3dCSZFgceUU6QPdWWHPmygvapW0N/EpoDhp8JEB7bdr2bsDYnrbRdNihbiBpJz
 P44tCmihlVUZcwSDTufX08ue4wYMozf3/l5MRadohMPJVdaAZw8DQlWKm9ZM4KRim3mp
 O7Xw==
X-Gm-Message-State: AOJu0YxfsRRLJT/zEx1CIN0GuKh5bhUJGUaqyRq8OgjYngGVGfJ61vcs
 V40/xmpZboU2m5MWRV3xzLRm16ds2Lz8gGS2JDjr7rcq0ZEU/kWfd//EHMNbNIsJ49hRW+1Nbw3
 jmLh7zbN90HB4K6rsLpJ1LyDNqD5ZlG7oPdVqYpaQCa+wcVF+W2IXwUi5GPEGnNyp2A+n2FdoT8
 jLPUk/UrCbs9dBrOft2y9DcHhSk0qdeMHXCC7i3H3zzD230t2q2ErwQ3bwmA==
X-Gm-Gg: ASbGncsgHeCUQQMy1Zl5rJL+ir9ECUSw0puehOtYSW74R+xX8X3+pmxiio9YXtTcB3C
 elv6AVYxsd5W/y2++ALENA34as9W2bQcjSuP3gxu5qsqGtQ7uIOmwS9amNiURBCwANAQovxLKd7
 ccsCcfNSs+4UnV1fgPozFBIAOFIW/PLSIUag+varC8YBxbFNMwq0SGy2pv2F3IlnIencDKaAmQ8
 v4grLf+QaGOxNPGQ8n1X2Bw5XKZrmu3j6MUdbmdcv9dbOnqpk00ehYUAsUx7xAgkOZxjDbD92VB
 UcBAMcuPdMG7/I0=
X-Received: by 2002:a6b:4e0b:0:b0:858:7b72:ec89 with SMTP id
 ca18e2360f4ac-861d89f12d9mr1065682639f.5.1745244019766; 
 Mon, 21 Apr 2025 07:00:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZ6SSLDQLW//k8veqFYQTshX2KgkWx0xnluXF+mev8GEmfas5PmCoD/JvRQ2E09J2az5Qc/g==
X-Received: by 2002:a6b:4e0b:0:b0:858:7b72:ec89 with SMTP id
 ca18e2360f4ac-861d89f12d9mr1065677839f.5.1745244019204; 
 Mon, 21 Apr 2025 07:00:19 -0700 (PDT)
Received: from fedora.. ([65.128.104.55]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f6a3839336sm1788866173.73.2025.04.21.07.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 07:00:18 -0700 (PDT)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 20 Apr 2025 10:25:02 -0500
Message-ID: <20250420154647.1233033-4-sandeen@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250420154647.1233033-1-sandeen@redhat.com>
References: <20250420154647.1233033-1-sandeen@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Di5el1Ah6lOz5zXeeaQvRtJ9E2SynPTfyVxfES-9Zew_1745244020
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Hongbo Li <lihongbo22@huawei.com> At the parsing phase
 of the new mount api, sbi will not be available. So here allows sbi to be
 NULL in f2fs log helpers and use that in handle_mount_opt(). Signed-off-by:
 Hongbo Li <lihongbo22@huawei.com> [sandeen: forward port] Signed-off-by:
 Eric Sandeen <sandeen@redhat.com> --- fs/f2fs/super.c | 90
 +++++++++++++++++++++++++++ 1 f [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 0.8 DATE_IN_PAST_12_24     Date: is 12 to 24 hours before Received: date
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u6rhJ-0003xM-FJ
Subject: [f2fs-dev] [PATCH 3/7] f2fs: Allow sbi to be NULL in f2fs_printk
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
From: Eric Sandeen via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Sandeen <sandeen@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com,
 Eric Sandeen <sandeen@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Hongbo Li <lihongbo22@huawei.com>

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
index 8343dc2a515d..aeb8e9a48bf6 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -321,11 +321,19 @@ void f2fs_printk(struct f2fs_sb_info *sbi, bool limit_rate,
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
@@ -735,13 +743,13 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
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
@@ -749,7 +757,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		break;
 	case Opt_noheap:
 	case Opt_heap:
-		f2fs_warn(sbi, "heap/no_heap options were deprecated");
+		f2fs_warn(NULL, "heap/no_heap options were deprecated");
 		break;
 #ifdef CONFIG_F2FS_FS_XATTR
 	case Opt_user_xattr:
@@ -772,7 +780,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_user_xattr:
 	case Opt_inline_xattr:
 	case Opt_inline_xattr_size:
-		f2fs_info(sbi, "%s options not supported", param->key);
+		f2fs_info(NULL, "%s options not supported", param->key);
 		break;
 #endif
 #ifdef CONFIG_F2FS_FS_POSIX_ACL
@@ -784,7 +792,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		break;
 #else
 	case Opt_acl:
-		f2fs_info(sbi, "%s options not supported", param->key);
+		f2fs_info(NULL, "%s options not supported", param->key);
 		break;
 #endif
 	case Opt_active_logs:
@@ -838,7 +846,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		break;
 	case Opt_reserve_root:
 		if (test_opt(sbi, RESERVE_ROOT)) {
-			f2fs_info(sbi, "Preserve previous reserve_root=%u",
+			f2fs_info(NULL, "Preserve previous reserve_root=%u",
 				  F2FS_OPTION(sbi).root_reserved_blocks);
 		} else {
 			F2FS_OPTION(sbi).root_reserved_blocks = result.int_32;
@@ -870,7 +878,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 #else
 	case Opt_fault_injection:
 	case Opt_fault_type:
-		f2fs_info(sbi, "%s options not supported", param->key);
+		f2fs_info(NULL, "%s options not supported", param->key);
 		break;
 #endif
 	case Opt_lazytime:
@@ -933,7 +941,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_usrjquota:
 	case Opt_grpjquota:
 	case Opt_prjjquota:
-		f2fs_info(sbi, "quota operations not supported");
+		f2fs_info(NULL, "quota operations not supported");
 		break;
 #endif
 	case Opt_alloc:
@@ -951,7 +959,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 #ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
 		set_opt(sbi, INLINECRYPT);
 #else
-		f2fs_info(sbi, "inline encryption not supported");
+		f2fs_info(NULL, "inline encryption not supported");
 #endif
 		break;
 	case Opt_checkpoint:
@@ -991,7 +999,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	case Opt_compress_algorithm:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			break;
 		}
 		name = param->string;
@@ -1000,7 +1008,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 			F2FS_OPTION(sbi).compress_level = 0;
 			F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZO;
 #else
-			f2fs_info(sbi, "kernel doesn't support lzo compression");
+			f2fs_info(NULL, "kernel doesn't support lzo compression");
 #endif
 		} else if (!strncmp(name, "lz4", 3)) {
 #ifdef CONFIG_F2FS_FS_LZ4
@@ -1009,7 +1017,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 				return -EINVAL;
 			F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZ4;
 #else
-			f2fs_info(sbi, "kernel doesn't support lz4 compression");
+			f2fs_info(NULL, "kernel doesn't support lz4 compression");
 #endif
 		} else if (!strncmp(name, "zstd", 4)) {
 #ifdef CONFIG_F2FS_FS_ZSTD
@@ -1018,26 +1026,26 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
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
@@ -1045,7 +1053,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		break;
 	case Opt_compress_extension:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			break;
 		}
 		name = param->string;
@@ -1054,7 +1062,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 
 		if (strlen(name) >= F2FS_EXTENSION_LEN ||
 		    ext_cnt >= COMPRESS_EXT_NUM) {
-			f2fs_err(sbi, "invalid extension length/number");
+			f2fs_err(NULL, "invalid extension length/number");
 			return -EINVAL;
 		}
 
@@ -1068,7 +1076,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		break;
 	case Opt_nocompress_extension:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			break;
 		}
 		name = param->string;
@@ -1077,7 +1085,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 
 		if (strlen(name) >= F2FS_EXTENSION_LEN ||
 			noext_cnt >= COMPRESS_EXT_NUM) {
-			f2fs_err(sbi, "invalid extension length/number");
+			f2fs_err(NULL, "invalid extension length/number");
 			return -EINVAL;
 		}
 
@@ -1091,21 +1099,21 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
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
@@ -1118,7 +1126,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_compress_chksum:
 	case Opt_compress_mode:
 	case Opt_compress_cache:
-		f2fs_info(sbi, "compression options not supported");
+		f2fs_info(NULL, "compression options not supported");
 		break;
 #endif
 	case Opt_atgc:
@@ -1203,17 +1211,17 @@ static int f2fs_validate_options(struct f2fs_sb_info *sbi)
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
@@ -1227,24 +1235,24 @@ static int f2fs_validate_options(struct f2fs_sb_info *sbi)
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
@@ -1254,11 +1262,11 @@ static int f2fs_validate_options(struct f2fs_sb_info *sbi)
 
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
 
@@ -1267,24 +1275,24 @@ static int f2fs_validate_options(struct f2fs_sb_info *sbi)
 
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
2.47.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
