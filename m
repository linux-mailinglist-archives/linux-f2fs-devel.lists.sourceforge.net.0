Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02875A9AFB8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Apr 2025 15:51:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u7wzT-0002D0-QT;
	Thu, 24 Apr 2025 13:51:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1u7wzS-0002Ct-2n
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Apr 2025 13:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=20X8W8gEmww41Q7n61pHQxjGF1NcC1fUPUqP1znWNZ8=; b=HCJoxMjlBpbFoDxK64IKMfF1HA
 +c3eZnkI0tZOeHoh8QH5rRCVrt8fv7Tkhof8CftGkuK9w9zKPKPAuUdkpjkpuq2e6xOuNYk+VD2Nb
 SvIIMKovneYCn2lzYpEZBVPFBsG/IvIGX8b9KO+PRBjzm54n2/UDXNxO9b7sycmCb1kY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=20X8W8gEmww41Q7n61pHQxjGF1NcC1fUPUqP1znWNZ8=; b=BtWu4P1N4wGA0lt4FXnr9HMrdC
 UXsNcfy0qmQltYhStKM3/tFXHLt8bL0LNPBp4kFL2gSKnND+9F7DUk8fwEOgBR3enLFqH5DnTKnwO
 WGqhtC0BqaguXtMJf8qqJDW7Zx0vrbh7H413mFWaOo+O0Af7Afl0MN1pewQOcaH6CErM=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1u7wzC-0000nY-LV for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Apr 2025 13:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745502669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20X8W8gEmww41Q7n61pHQxjGF1NcC1fUPUqP1znWNZ8=;
 b=Y9lvVRhnIQv4sZEYPjw40bX4+DX5NFJeU1Na+i/8dOsFQ9MegT8eo6yMrGzmBK/gm5Ethk
 2w0XuEw6xSRAYJJh2DFpl+bo3gAgDtHuZtRyeTUcTxkcTaabuiO1tD75ueqg8SlQAiR7PP
 17mgWfccqEaRp9ItJtG5nYKRtFW247c=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-NzWH1fWAMGC_6EDGtlaatQ-1; Thu, 24 Apr 2025 09:51:08 -0400
X-MC-Unique: NzWH1fWAMGC_6EDGtlaatQ-1
X-Mimecast-MFC-AGG-ID: NzWH1fWAMGC_6EDGtlaatQ_1745502668
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-72c0d69b71aso393400a34.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Apr 2025 06:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745502668; x=1746107468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=20X8W8gEmww41Q7n61pHQxjGF1NcC1fUPUqP1znWNZ8=;
 b=Zj916GMeHUj5/+3d2AWSOIRJEXkND8yz9TeJKqDCLX3wUViaA/3pzn1Mso02N+18t6
 jjF61bvqyMql2M8mHhku0m/8Sf2RF3rNi1OSlRGzOLNGSRAWfcEDq2xN4bfoUHb0BZmD
 hrtzBDRkDrD22bAKbBa6mISkDqHGyVZkrrYw5Z3Tvd5U1cslvY592TPnhawxIFD0Gm61
 sTEMazlvAOGaZ5CJsL6pT7ps0xkW6n3uUaB/YQ6/AXhZCa6bdpj2RcU711Cu2f7LDClu
 tWPJwmv+IDdBSXYEpi7RlrbovE7vFotfyArdeCmKzF+zcIppKTQ+sekyTTCp+pKd24Jf
 +kTA==
X-Gm-Message-State: AOJu0Yz/vQH8DB/eIP1ffIvxm1c+bSDNoh/SKz2BBD6IobONa/nMASN2
 TDQAkjUMk4M6QpzoqXzMwufjHa3vLveYZNiWs+CWLPXxi1PF1u1f5ASeUhKGchqaka27+Z+Gw0V
 fvHq/eGldqsEjvjUnx2eXgvZIscYUIdaZtkBxAy8jZFE0jXw6Gh3e2MfR9Dzh+nQL1NrvMyZKoC
 NlIMT3HKgpR5WXnTM6hhLs44rvXJOkyn9tI+XKJ83ZmWKuRS/Br2W34cTmC5Ti
X-Gm-Gg: ASbGncuB4Z326nO4iisE/JOqREabR7JJBIIdszkdQpWWpbueC4l+SjfiI5VLE1d/rYA
 X81FfFBDCyM5YMtJx6WNSjD09AeI2mk2RDaApCT/vroT7gyWRFeE9uCdZXsvUGZ/KwJPIh01eiY
 YChGl+pPbJh90Mt1dn7jJI6Mdf5ji/sF1HSgv6iITEFsdf0MVMxqSQTB62ZHKBkHL68ERGbrBIQ
 /xpRU8pm2jYsWO1tZz+6aUR5neJgtbod+iIgoqDSPSX77qZYg2pVqIv7it5jXAB2/VjGO2FU2Vt
 vdltpG+qYy8kAUGBTA68E2DbGtF/Ap2grdsM1uPVtMMr+0Y6CH+VaU8=
X-Received: by 2002:a05:6830:369b:b0:72b:99eb:7ce3 with SMTP id
 46e09a7af769-7304dbcd9admr1458748a34.18.1745502667425; 
 Thu, 24 Apr 2025 06:51:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUBkT8IuBa3hPdLMhwDATE3HSR3z4HwnotaHQjVHnEdLznwt0jtuOY3c4oz91usD9ZH5XVCA==
X-Received: by 2002:a05:6830:369b:b0:72b:99eb:7ce3 with SMTP id
 46e09a7af769-7304dbcd9admr1458729a34.18.1745502666931; 
 Thu, 24 Apr 2025 06:51:06 -0700 (PDT)
Received: from localhost.localdomain (nwtn-09-2828.dsl.iowatelecom.net.
 [67.224.43.12]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7304f37b158sm233595a34.49.2025.04.24.06.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 06:51:06 -0700 (PDT)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 23 Apr 2025 12:08:45 -0500
Message-ID: <20250423170926.76007-2-sandeen@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423170926.76007-1-sandeen@redhat.com>
References: <20250423170926.76007-1-sandeen@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vfv2bJNfM_gUzINcFNnnRCULK-7Przyq1UkUdDcnTm4_1745502668
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Hongbo Li <lihongbo22@huawei.com> Use an array of
 `fs_parameter_spec`
 called f2fs_param_specs to hold the mount option specifications for the new
 mount api. Add constant_table structures for several options to facilitate
 parsing. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
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
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.8 DATE_IN_PAST_12_24     Date: is 12 to 24 hours before Received: date
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u7wzC-0000nY-LV
Subject: [f2fs-dev] [PATCH V3 1/7] f2fs: Add fs parameter specifications for
 mount options
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

Use an array of `fs_parameter_spec` called f2fs_param_specs to
hold the mount option specifications for the new mount api.

Add constant_table structures for several options to facilitate
parsing.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
[sandeen: forward port, minor fixes and updates, more fsparam_enum]
Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---
 fs/f2fs/super.c | 122 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 22f26871b7aa..ebea03bba054 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -27,6 +27,7 @@
 #include <linux/part_stat.h>
 #include <linux/zstd.h>
 #include <linux/lz4.h>
+#include <linux/fs_parser.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -194,9 +195,130 @@ enum {
 	Opt_age_extent_cache,
 	Opt_errors,
 	Opt_nat_bits,
+	Opt_jqfmt,
+	Opt_checkpoint,
 	Opt_err,
 };
 
+static const struct constant_table f2fs_param_background_gc[] = {
+	{"on",		BGGC_MODE_ON},
+	{"off",		BGGC_MODE_OFF},
+	{"sync",	BGGC_MODE_SYNC},
+	{}
+};
+
+static const struct constant_table f2fs_param_mode[] = {
+	{"adaptive",		FS_MODE_ADAPTIVE},
+	{"lfs",			FS_MODE_LFS},
+	{"fragment:segment",	FS_MODE_FRAGMENT_SEG},
+	{"fragment:block",	FS_MODE_FRAGMENT_BLK},
+	{}
+};
+
+static const struct constant_table f2fs_param_jqfmt[] = {
+	{"vfsold",	QFMT_VFS_OLD},
+	{"vfsv0",	QFMT_VFS_V0},
+	{"vfsv1",	QFMT_VFS_V1},
+	{}
+};
+
+static const struct constant_table f2fs_param_alloc_mode[] = {
+	{"default",	ALLOC_MODE_DEFAULT},
+	{"reuse",	ALLOC_MODE_REUSE},
+	{}
+};
+static const struct constant_table f2fs_param_fsync_mode[] = {
+	{"posix",	FSYNC_MODE_POSIX},
+	{"strict",	FSYNC_MODE_STRICT},
+	{"nobarrier",	FSYNC_MODE_NOBARRIER},
+	{}
+};
+
+static const struct constant_table f2fs_param_compress_mode[] = {
+	{"fs",		COMPR_MODE_FS},
+	{"user",	COMPR_MODE_USER},
+	{}
+};
+
+static const struct constant_table f2fs_param_discard_unit[] = {
+	{"block",	DISCARD_UNIT_BLOCK},
+	{"segment",	DISCARD_UNIT_SEGMENT},
+	{"section",	DISCARD_UNIT_SECTION},
+	{}
+};
+
+static const struct constant_table f2fs_param_memory_mode[] = {
+	{"normal",	MEMORY_MODE_NORMAL},
+	{"low",		MEMORY_MODE_LOW},
+	{}
+};
+
+static const struct constant_table f2fs_param_errors[] = {
+	{"remount-ro",	MOUNT_ERRORS_READONLY},
+	{"continue",	MOUNT_ERRORS_CONTINUE},
+	{"panic",	MOUNT_ERRORS_PANIC},
+	{}
+};
+
+static const struct fs_parameter_spec f2fs_param_specs[] = {
+	fsparam_enum("background_gc", Opt_gc_background, f2fs_param_background_gc),
+	fsparam_flag("disable_roll_forward", Opt_disable_roll_forward),
+	fsparam_flag("norecovery", Opt_norecovery),
+	fsparam_flag_no("discard", Opt_discard),
+	fsparam_flag("no_heap", Opt_noheap),
+	fsparam_flag("heap", Opt_heap),
+	fsparam_flag_no("user_xattr", Opt_user_xattr),
+	fsparam_flag_no("acl", Opt_acl),
+	fsparam_s32("active_logs", Opt_active_logs),
+	fsparam_flag("disable_ext_identify", Opt_disable_ext_identify),
+	fsparam_flag_no("inline_xattr", Opt_inline_xattr),
+	fsparam_s32("inline_xattr_size", Opt_inline_xattr_size),
+	fsparam_flag_no("inline_data", Opt_inline_data),
+	fsparam_flag_no("inline_dentry", Opt_inline_dentry),
+	fsparam_flag_no("flush_merge", Opt_flush_merge),
+	fsparam_flag_no("barrier", Opt_barrier),
+	fsparam_flag("fastboot", Opt_fastboot),
+	fsparam_flag_no("extent_cache", Opt_extent_cache),
+	fsparam_flag("data_flush", Opt_data_flush),
+	fsparam_u32("reserve_root", Opt_reserve_root),
+	fsparam_gid("resgid", Opt_resgid),
+	fsparam_uid("resuid", Opt_resuid),
+	fsparam_enum("mode", Opt_mode, f2fs_param_mode),
+	fsparam_s32("fault_injection", Opt_fault_injection),
+	fsparam_u32("fault_type", Opt_fault_type),
+	fsparam_flag_no("lazytime", Opt_lazytime),
+	fsparam_flag_no("quota", Opt_quota),
+	fsparam_flag("usrquota", Opt_usrquota),
+	fsparam_flag("grpquota", Opt_grpquota),
+	fsparam_flag("prjquota", Opt_prjquota),
+	fsparam_string_empty("usrjquota", Opt_usrjquota),
+	fsparam_string_empty("grpjquota", Opt_grpjquota),
+	fsparam_string_empty("prjjquota", Opt_prjjquota),
+	fsparam_flag("nat_bits", Opt_nat_bits),
+	fsparam_enum("jqfmt", Opt_jqfmt, f2fs_param_jqfmt),
+	fsparam_enum("alloc_mode", Opt_alloc, f2fs_param_alloc_mode),
+	fsparam_enum("fsync_mode", Opt_fsync, f2fs_param_fsync_mode),
+	fsparam_string("test_dummy_encryption", Opt_test_dummy_encryption),
+	fsparam_flag("test_dummy_encryption", Opt_test_dummy_encryption),
+	fsparam_flag("inlinecrypt", Opt_inlinecrypt),
+	fsparam_string("checkpoint", Opt_checkpoint),
+	fsparam_flag_no("checkpoint_merge", Opt_checkpoint_merge),
+	fsparam_string("compress_algorithm", Opt_compress_algorithm),
+	fsparam_u32("compress_log_size", Opt_compress_log_size),
+	fsparam_string("compress_extension", Opt_compress_extension),
+	fsparam_string("nocompress_extension", Opt_nocompress_extension),
+	fsparam_flag("compress_chksum", Opt_compress_chksum),
+	fsparam_enum("compress_mode", Opt_compress_mode, f2fs_param_compress_mode),
+	fsparam_flag("compress_cache", Opt_compress_cache),
+	fsparam_flag("atgc", Opt_atgc),
+	fsparam_flag_no("gc_merge", Opt_gc_merge),
+	fsparam_enum("discard_unit", Opt_discard_unit, f2fs_param_discard_unit),
+	fsparam_enum("memory", Opt_memory_mode, f2fs_param_memory_mode),
+	fsparam_flag("age_extent_cache", Opt_age_extent_cache),
+	fsparam_enum("errors", Opt_errors, f2fs_param_errors),
+	{}
+};
+
 static match_table_t f2fs_tokens = {
 	{Opt_gc_background, "background_gc=%s"},
 	{Opt_disable_roll_forward, "disable_roll_forward"},
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
