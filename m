Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E10429632
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 May 2019 12:44:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hU7gN-0003rw-7e; Fri, 24 May 2019 10:44:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hU7gL-0003rV-Mv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 10:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0gW3Ntr4OUYMFMNtazk4UAD+I2a2PngPrYU/RCJOnFU=; b=E8Cr3O86X/22Npi0Vk0oRV3blA
 UVvj4XufQmfK2bdDiiLOyP6O5fbs7kv6IUg2k9wezvkJkOvwJS7+0PYTaYlO4O+rrVrL4VvASmuhL
 IWxb6OVQy8Fe/KDRadDsDFKLJP/J6iJaLq7w5EKUqAxuhvgRPRfgZLA7l/NDbejcFlcs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0gW3Ntr4OUYMFMNtazk4UAD+I2a2PngPrYU/RCJOnFU=; b=Dm/+YyS+A4C1soBK35G3Y206U9
 SAbywSrATNyv4NmlrQLn90kRqzA+NeUQ606nZIx3D+Yrjq3k6IbXC6iOK/Jgyb3ZMFblx10mnD5R3
 JaZtY9xnOBCbVc1zOeMNteYK+WMzWu1V48AtrrLVBIfOfLSju+xgDNev/CaBVC/QHg9o=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hU7gJ-006DFx-Pg
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 10:44:13 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id CB693617AA; Fri, 24 May 2019 10:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558694645;
 bh=HF7FUic2Qgap5t9eKuxI7oyYoQWtLjSkiQ9P+5lmjgA=;
 h=From:To:Cc:Subject:Date:From;
 b=NCJDg9xpM3m7Tr78OqD7WJBPCTV8Eaq/qGbuC7+HQaM/CIZOJP4tORbuXzvsqFjKW
 E++8fOAhFf+BJxjR9J3Iu3ijtsVhQHgaJOj44V+MvrJwXTxarGdtaeoPURC3/ww+GF
 MuBmCRdMXuF0XKAhzZLNaZ39DH9rxeufjzoh6RcQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: stummala@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3EAFB60C5F;
 Fri, 24 May 2019 10:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558694644;
 bh=HF7FUic2Qgap5t9eKuxI7oyYoQWtLjSkiQ9P+5lmjgA=;
 h=From:To:Cc:Subject:Date:From;
 b=KbvxFmnvnO6HucGm9IgtDjyI71UXjCLu9Fa0t4OsNNZV3YlobN6ZhhNvIOGA6ZQxB
 n2VgvVUOv0xlRf6L28u+vkxgHON1z1O5JR9HY/vs96NLaE+cT0e+HUP3bapWuQL02e
 g3QZW3sy3nJ2pkA0dIwv2EVIyl1oZNz2z0KpdZgc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3EAFB60C5F
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 24 May 2019 16:13:51 +0530
Message-Id: <1558694631-12481-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hU7gJ-006DFx-Pg
Subject: [f2fs-dev] [PATCH] f2fs: add errors=panic mount option
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
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add errors=panic mount option for debugging purpose. It can be
set dynamically when the config option CONFIG_F2FS_CHECK_FS
is not enabled.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
 fs/f2fs/f2fs.h  |  9 +++++++--
 fs/f2fs/super.c | 21 +++++++++++++++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9b3d997..95adedb 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -32,8 +32,12 @@
 #define f2fs_bug_on(sbi, condition)					\
 	do {								\
 		if (unlikely(condition)) {				\
-			WARN_ON(1);					\
-			set_sbi_flag(sbi, SBI_NEED_FSCK);		\
+			if (test_opt(sbi, ERRORS_PANIC)) {		\
+				BUG_ON(condition);			\
+			} else {					\
+				WARN_ON(1);				\
+				set_sbi_flag(sbi, SBI_NEED_FSCK);	\
+			}						\
 		}							\
 	} while (0)
 #endif
@@ -99,6 +103,7 @@ struct f2fs_fault_info {
 #define F2FS_MOUNT_INLINE_XATTR_SIZE	0x00800000
 #define F2FS_MOUNT_RESERVE_ROOT		0x01000000
 #define F2FS_MOUNT_DISABLE_CHECKPOINT	0x02000000
+#define F2FS_MOUNT_ERRORS_PANIC		0x04000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 912e261..7d6d96a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -137,6 +137,7 @@ enum {
 	Opt_fsync,
 	Opt_test_dummy_encryption,
 	Opt_checkpoint,
+	Opt_errors,
 	Opt_err,
 };
 
@@ -196,6 +197,7 @@ enum {
 	{Opt_fsync, "fsync_mode=%s"},
 	{Opt_test_dummy_encryption, "test_dummy_encryption"},
 	{Opt_checkpoint, "checkpoint=%s"},
+	{Opt_errors, "errors=%s"},
 	{Opt_err, NULL},
 };
 
@@ -788,6 +790,23 @@ static int parse_options(struct super_block *sb, char *options)
 			}
 			kvfree(name);
 			break;
+		case Opt_errors:
+#ifndef CONFIG_F2FS_CHECK_FS
+			name = match_strdup(&args[0]);
+			if (!name)
+				return -ENOMEM;
+
+			if (strlen(name) == 5 && !strncmp(name, "panic", 5)) {
+				set_opt(sbi, ERRORS_PANIC);
+			} else {
+				kvfree(name);
+				return -EINVAL;
+			}
+			kvfree(name);
+			f2fs_msg(sb, KERN_INFO,
+				"debug mode errors=panic enabled\n");
+#endif
+			break;
 		default:
 			f2fs_msg(sb, KERN_ERR,
 				"Unrecognized mount option \"%s\" or missing value",
@@ -1417,6 +1436,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 		seq_printf(seq, ",fsync_mode=%s", "strict");
 	else if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_NOBARRIER)
 		seq_printf(seq, ",fsync_mode=%s", "nobarrier");
+	if (test_opt(sbi, ERRORS_PANIC))
+		seq_printf(seq, ",errors=%s", "panic");
 	return 0;
 }
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
