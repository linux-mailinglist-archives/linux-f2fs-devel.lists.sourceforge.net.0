Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 940298BCC4C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 May 2024 12:47:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s3vs7-0000wG-2k;
	Mon, 06 May 2024 10:47:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s3vs5-0000w0-G8
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 May 2024 10:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V7TsJpeaZSd1kAAkTHGzZC+p11S6ODvpkdtqbNLkuXM=; b=FaWLsZyTzkPxArV0/EjPCTgaqG
 MF2jbv6z6BxU1jtel7iSzuMk/nSy3+isbh3fC//1cph9KucQzrWQPyfaRuEgSLaM1OrNzpMGZLNdY
 aOE/Bo6kQ1SoTmkCbqnK9oTZiTPhUPluPYglNl4KNXOU8CpCbhfEme8G/FlHahX9lg9Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=V7TsJpeaZSd1kAAkTHGzZC+p11S6ODvpkdtqbNLkuXM=; b=D
 LMVpebdfeW6vlf4Gd/N+PDASFl/jPGfZ4RfoeIJpzLG1WXZ2Adfu4vfSWFzg1O/GC9TiWpXFVZE8M
 Et4Moy19ohnNqLY7YAcJQLFcafgMX6vG3zoA/ZGmiUMrg6E2SkJL/J4me1US7PeNT+2tfHOVMlaDG
 GglfURfnbsAvqyQo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s3vs4-0005El-VV for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 May 2024 10:47:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 982FD60C02
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 May 2024 10:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00129C116B1;
 Mon,  6 May 2024 10:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714992415;
 bh=OZhJqt+o8seKhbAIpLU14VakbFXx8o5jipF26rcAztU=;
 h=From:To:Cc:Subject:Date:From;
 b=OBGl3ScGEUxgguSlQ75+eY+VpwBMeAwETZy3PrphT3PgVQx0OzEbAdBCjVG4Niou5
 N7ro6gE4pvNbuX5T5AhOu5+EeEQ/gsZJuX6xQ+bwu47WvIjiohH49UFFk9KCq1M531
 aYak/5xVkvJvObeiZxaiBt3NF83mQADn0Qq4qytxk1pwXEmCEjyoQrz/4BfAy4STr6
 0oT3Fg2MnCjbbFqTth/qgMu94AYycZ07wlWLT+BHm+yTC9/eMJMj6gKHKSLRvBAn0x
 Yd8LYEgaBjzYSyX5AIOwhFP/XOTYGUnE/hSVV1JnzdyFu/QaUlhrUtFt/efBD1T1ja
 jLE5NNHq6ouUQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  6 May 2024 18:46:50 +0800
Message-Id: <20240506104650.778504-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: - It missed to check validation of fault attrs in
 parse_options(), 
 let's fix to add check condition in f2fs_build_fault_attr(). - Use
 f2fs_build_fault_attr()
 in __sbi_store() to clean up code. Signed-off-by: Chao Yu <chao@kernel.org>
 --- fs/f2fs/f2fs.h | 12 ++++++++---- fs/f2fs/super.c | 27
 ++++++++++++++++++++-------
 fs/f2fs/sysfs.c | 14 ++++++++++---- 3 files changed, 38 insertions(+), 15
 [...] Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s3vs4-0005El-VV
Subject: [f2fs-dev] [PATCH] f2fs: check validation of fault attrs in
 f2fs_build_fault_attr()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

- It missed to check validation of fault attrs in parse_options(),
let's fix to add check condition in f2fs_build_fault_attr().
- Use f2fs_build_fault_attr() in __sbi_store() to clean up code.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h  | 12 ++++++++----
 fs/f2fs/super.c | 27 ++++++++++++++++++++-------
 fs/f2fs/sysfs.c | 14 ++++++++++----
 3 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 95a40d4f778f..b03d75e4eedc 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -72,7 +72,7 @@ enum {
 
 struct f2fs_fault_info {
 	atomic_t inject_ops;
-	unsigned int inject_rate;
+	int inject_rate;
 	unsigned int inject_type;
 };
 
@@ -4597,10 +4597,14 @@ static inline bool f2fs_need_verity(const struct inode *inode, pgoff_t idx)
 }
 
 #ifdef CONFIG_F2FS_FAULT_INJECTION
-extern void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
-							unsigned int type);
+extern int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
+							unsigned long type);
 #else
-#define f2fs_build_fault_attr(sbi, rate, type)		do { } while (0)
+int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
+							unsigned long type)
+{
+	return 0;
+}
 #endif
 
 static inline bool is_journalled_quota(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a4bc26dfdb1a..94918ae7eddb 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -66,21 +66,31 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_NO_SEGMENT]		= "no free segment",
 };
 
-void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
-							unsigned int type)
+int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
+							unsigned long type)
 {
 	struct f2fs_fault_info *ffi = &F2FS_OPTION(sbi).fault_info;
 
 	if (rate) {
+		if (rate > INT_MAX)
+			return -EINVAL;
 		atomic_set(&ffi->inject_ops, 0);
-		ffi->inject_rate = rate;
+		ffi->inject_rate = (int)rate;
 	}
 
-	if (type)
-		ffi->inject_type = type;
+	if (type) {
+		if (type >= BIT(FAULT_MAX))
+			return -EINVAL;
+		ffi->inject_type = (unsigned int)type;
+	}
 
 	if (!rate && !type)
 		memset(ffi, 0, sizeof(struct f2fs_fault_info));
+	else
+		f2fs_info(sbi,
+			"build fault injection attr: rate: %lu, type: 0x%lx",
+								rate, type);
+	return 0;
 }
 #endif
 
@@ -886,14 +896,17 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		case Opt_fault_injection:
 			if (args->from && match_int(args, &arg))
 				return -EINVAL;
-			f2fs_build_fault_attr(sbi, arg, F2FS_ALL_FAULT_TYPE);
+			if (f2fs_build_fault_attr(sbi, arg,
+					F2FS_ALL_FAULT_TYPE))
+				return -EINVAL;
 			set_opt(sbi, FAULT_INJECTION);
 			break;
 
 		case Opt_fault_type:
 			if (args->from && match_int(args, &arg))
 				return -EINVAL;
-			f2fs_build_fault_attr(sbi, 0, arg);
+			if (f2fs_build_fault_attr(sbi, 0, arg))
+				return -EINVAL;
 			set_opt(sbi, FAULT_INJECTION);
 			break;
 #else
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index a568ce96cf56..7aa3844e7a80 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -484,10 +484,16 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	if (ret < 0)
 		return ret;
 #ifdef CONFIG_F2FS_FAULT_INJECTION
-	if (a->struct_type == FAULT_INFO_TYPE && t >= BIT(FAULT_MAX))
-		return -EINVAL;
-	if (a->struct_type == FAULT_INFO_RATE && t >= UINT_MAX)
-		return -EINVAL;
+	if (a->struct_type == FAULT_INFO_TYPE) {
+		if (f2fs_build_fault_attr(sbi, 0, t))
+			return -EINVAL;
+		return count;
+	}
+	if (a->struct_type == FAULT_INFO_RATE) {
+		if (f2fs_build_fault_attr(sbi, t, 0))
+			return -EINVAL;
+		return count;
+	}
 #endif
 	if (a->struct_type == RESERVED_BLOCKS) {
 		spin_lock(&sbi->stat_lock);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
