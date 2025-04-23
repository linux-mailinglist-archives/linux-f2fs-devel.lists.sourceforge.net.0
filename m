Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E816A9AFBA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Apr 2025 15:51:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u7wzS-0003M3-99;
	Thu, 24 Apr 2025 13:51:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1u7wzP-0003Lf-K1
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Apr 2025 13:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Bv69FtZVhIqPlCqJIqCKQOcHix/aNeySxwjw5nKrkw=; b=VVMvrHkbXL0xLmc8VVcKhfBrVr
 /5c019nnhVh6aiERO1JacIOtj7T8M6ZL2f7X8wJVTL6RKfAsffBRu1QcHaeFLfIPI1loFKmYYmDt5
 LlsJMbSPDWTh5K+71RbI2i5izfnPX1HxV4v5xxOaec/TwjBhotcUlbCLj3nUxx/ftzMQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0Bv69FtZVhIqPlCqJIqCKQOcHix/aNeySxwjw5nKrkw=; b=FOf7v8alWdtLpEmvP7DqMr6aoW
 tPFwl865eTFE8hiiJo6HxyPTTgwwGnVt8RxQtzEIgCMiKSLrUGboT11zBEWk7Fqt5sTPzW/2hr3wa
 A57EazufYsRXrTbNtOD5AdmQSZIqIpvJRulB/Xz+ajhEGlqoHMUmOKlOP4J65qIhZHIk=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1u7wzA-0000nQ-2r for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Apr 2025 13:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745502671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Bv69FtZVhIqPlCqJIqCKQOcHix/aNeySxwjw5nKrkw=;
 b=Xn6mfZicQiIE7L8p89HEUmpVHw/9UBguiSI9a8LQ4ac+DHMoocaXmmWOa8n18OoYPak+Bg
 e49JFVvlxBb9UkEx7fSTGQPBmLgXUZ9YayF3LwRaoISdNBMi0MIIQxUXyXob3rsmNM0aZ8
 55tH/JXFYb/bHkZ3J5yhNReDtHwnkU8=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-nWyjyze0PKuOo2x25Nx8Mg-1; Thu, 24 Apr 2025 09:51:10 -0400
X-MC-Unique: nWyjyze0PKuOo2x25Nx8Mg-1
X-Mimecast-MFC-AGG-ID: nWyjyze0PKuOo2x25Nx8Mg_1745502670
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-72b846873b2so879915a34.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Apr 2025 06:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745502670; x=1746107470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Bv69FtZVhIqPlCqJIqCKQOcHix/aNeySxwjw5nKrkw=;
 b=bjDdAXVLj6NUwYEN5uNehiNizq+THmexxaSkVymP1Q6Vj/tEckfwfTL49V51Jl9bC6
 r2SK+0mygxmQsq3RK7Ibtv6DX6k/RhfjBhE27R3ULi+DO/OruJDu0r5BTOxcdolVBRKX
 OIEz+pzFZ6a+YD5P9JbqFJ3Xu6JfHGmDpxxdhxH5uY5G8OMrMW441oQOXXRZV0bl0PXf
 yFJYIlHYi38wPqaAqFW/7t5Y9pM0EUfW+BuGzhnuSgjra1gvS0eyACGMXYGR2w277CQY
 /M/tiXHkob5DXTyl9/nAYf74ea8rCRliS6edjohtQsPvTXLsASWau4ZlS1ry9Nq4EYLh
 5N+A==
X-Gm-Message-State: AOJu0YxK/bk6Y7h5gQSXt7U386X+AELsiAFoU/DnXzgowiX52Ms8xGYN
 J33+YvJ8q3cidVqsfNh7WjLJjuzuetgHRNLlq7jSewweJ/aIj3TaDzzxBRsd9Gyjt2ILyXQ3oO/
 FCleb5Qyw/+7tT/cDWPJvYQBZ/7bzQrdPxQhmIm5QdxEGIuMLPetVGYTf9nlEzbotkJBouBYb1s
 jLlvVUd3zJykwr3+84IMnjLkmHPY42Vs4h9JqrHiv5hM3kFOYT0UEKdWnQskEF
X-Gm-Gg: ASbGncsGh/hrrK6aro8kRvyXvQ3fX/O26u5FacWfkkEtZ+Q4xmWQOKApmMYTjtyUiFI
 EMUklmNjIaBoEDvlr1ywlJZDDEYKy/6U3AvxJYIy/xjG0pUih92656nn262dKZ0G4JxV8xocP9w
 9mc/B0pp7mXFeB6c/aImI3xgD8yi1bEYVVvAZrb74yzjsHNQ+zuO6nN8ipHkTxQbFJlo8ktc9z+
 BKfaTgY3J5UQn/cDKSG1mgz9q9X7fRBv+xig0tzu8+6GlHbgl53wUkiJLQtNL+EwOZHhYqlIvAo
 mJTGvIS192jH9aSv2Q8y62vsS8RNIq1pHg85BdyGbkRaXd0/i5D/gHg=
X-Received: by 2002:a05:6830:25cc:b0:727:24ab:3e4 with SMTP id
 46e09a7af769-7304daab00cmr1964050a34.9.1745502669748; 
 Thu, 24 Apr 2025 06:51:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2u4n4Ao3E9wZ9rTZP0fLc4HVjXc56P01ET259Rz7opGpJzDEJQ/LVZ/WOUFiHMSOTHLYvGg==
X-Received: by 2002:a05:6830:25cc:b0:727:24ab:3e4 with SMTP id
 46e09a7af769-7304daab00cmr1964026a34.9.1745502669294; 
 Thu, 24 Apr 2025 06:51:09 -0700 (PDT)
Received: from localhost.localdomain (nwtn-09-2828.dsl.iowatelecom.net.
 [67.224.43.12]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7304f37b158sm233595a34.49.2025.04.24.06.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 06:51:08 -0700 (PDT)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 23 Apr 2025 12:08:47 -0500
Message-ID: <20250423170926.76007-4-sandeen@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423170926.76007-1-sandeen@redhat.com>
References: <20250423170926.76007-1-sandeen@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rvXglBWyZs0ThRjLss9rDC052VZrOexJjybV7bGITes_1745502670
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.2 (/)
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
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.8 DATE_IN_PAST_12_24     Date: is 12 to 24 hours before Received: date
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
X-Headers-End: 1u7wzA-0000nQ-2r
Subject: [f2fs-dev] [PATCH V3 3/7] f2fs: Allow sbi to be NULL in f2fs_printk
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
index 20dee7c40d59..35190db4501c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -323,11 +323,19 @@ void f2fs_printk(struct f2fs_sb_info *sbi, bool limit_rate,
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
@@ -737,13 +745,13 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
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
@@ -751,7 +759,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		break;
 	case Opt_noheap:
 	case Opt_heap:
-		f2fs_warn(sbi, "heap/no_heap options were deprecated");
+		f2fs_warn(NULL, "heap/no_heap options were deprecated");
 		break;
 #ifdef CONFIG_F2FS_FS_XATTR
 	case Opt_user_xattr:
@@ -774,7 +782,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_user_xattr:
 	case Opt_inline_xattr:
 	case Opt_inline_xattr_size:
-		f2fs_info(sbi, "%s options not supported", param->key);
+		f2fs_info(NULL, "%s options not supported", param->key);
 		break;
 #endif
 #ifdef CONFIG_F2FS_FS_POSIX_ACL
@@ -786,7 +794,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		break;
 #else
 	case Opt_acl:
-		f2fs_info(sbi, "%s options not supported", param->key);
+		f2fs_info(NULL, "%s options not supported", param->key);
 		break;
 #endif
 	case Opt_active_logs:
@@ -840,7 +848,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		break;
 	case Opt_reserve_root:
 		if (test_opt(sbi, RESERVE_ROOT)) {
-			f2fs_info(sbi, "Preserve previous reserve_root=%u",
+			f2fs_info(NULL, "Preserve previous reserve_root=%u",
 				  F2FS_OPTION(sbi).root_reserved_blocks);
 		} else {
 			F2FS_OPTION(sbi).root_reserved_blocks = result.int_32;
@@ -871,7 +879,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 #else
 	case Opt_fault_injection:
 	case Opt_fault_type:
-		f2fs_info(sbi, "%s options not supported", param->key);
+		f2fs_info(NULL, "%s options not supported", param->key);
 		break;
 #endif
 	case Opt_lazytime:
@@ -934,7 +942,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_usrjquota:
 	case Opt_grpjquota:
 	case Opt_prjjquota:
-		f2fs_info(sbi, "quota operations not supported");
+		f2fs_info(NULL, "quota operations not supported");
 		break;
 #endif
 	case Opt_alloc:
@@ -952,7 +960,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 #ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
 		set_opt(sbi, INLINECRYPT);
 #else
-		f2fs_info(sbi, "inline encryption not supported");
+		f2fs_info(NULL, "inline encryption not supported");
 #endif
 		break;
 	case Opt_checkpoint:
@@ -992,7 +1000,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	case Opt_compress_algorithm:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			break;
 		}
 		name = param->string;
@@ -1001,7 +1009,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 			F2FS_OPTION(sbi).compress_level = 0;
 			F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZO;
 #else
-			f2fs_info(sbi, "kernel doesn't support lzo compression");
+			f2fs_info(NULL, "kernel doesn't support lzo compression");
 #endif
 		} else if (!strncmp(name, "lz4", 3)) {
 #ifdef CONFIG_F2FS_FS_LZ4
@@ -1010,7 +1018,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 				return -EINVAL;
 			F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZ4;
 #else
-			f2fs_info(sbi, "kernel doesn't support lz4 compression");
+			f2fs_info(NULL, "kernel doesn't support lz4 compression");
 #endif
 		} else if (!strncmp(name, "zstd", 4)) {
 #ifdef CONFIG_F2FS_FS_ZSTD
@@ -1019,26 +1027,26 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
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
@@ -1046,7 +1054,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		break;
 	case Opt_compress_extension:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			break;
 		}
 		name = param->string;
@@ -1055,7 +1063,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 
 		if (strlen(name) >= F2FS_EXTENSION_LEN ||
 		    ext_cnt >= COMPRESS_EXT_NUM) {
-			f2fs_err(sbi, "invalid extension length/number");
+			f2fs_err(NULL, "invalid extension length/number");
 			return -EINVAL;
 		}
 
@@ -1069,7 +1077,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 		break;
 	case Opt_nocompress_extension:
 		if (!f2fs_sb_has_compression(sbi)) {
-			f2fs_info(sbi, "Image doesn't support compression");
+			f2fs_info(NULL, "Image doesn't support compression");
 			break;
 		}
 		name = param->string;
@@ -1078,7 +1086,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 
 		if (strlen(name) >= F2FS_EXTENSION_LEN ||
 			noext_cnt >= COMPRESS_EXT_NUM) {
-			f2fs_err(sbi, "invalid extension length/number");
+			f2fs_err(NULL, "invalid extension length/number");
 			return -EINVAL;
 		}
 
@@ -1092,21 +1100,21 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
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
@@ -1119,7 +1127,7 @@ static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_compress_chksum:
 	case Opt_compress_mode:
 	case Opt_compress_cache:
-		f2fs_info(sbi, "compression options not supported");
+		f2fs_info(NULL, "compression options not supported");
 		break;
 #endif
 	case Opt_atgc:
@@ -1204,17 +1212,17 @@ static int f2fs_validate_options(struct f2fs_sb_info *sbi)
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
@@ -1228,24 +1236,24 @@ static int f2fs_validate_options(struct f2fs_sb_info *sbi)
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
@@ -1255,11 +1263,11 @@ static int f2fs_validate_options(struct f2fs_sb_info *sbi)
 
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
 
@@ -1268,24 +1276,24 @@ static int f2fs_validate_options(struct f2fs_sb_info *sbi)
 
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
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
