Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DD1B132E1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jul 2025 04:05:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rvpzCInsIWofpAGTQA8ia2k2xAzag/YZeVhLigykFNs=; b=mlr/SSVuMJkH6rWOtzZ1emsCFK
	KW7C/NLf2unnMVH3pDcSV1oUQtXfor9JY64N4nZ37ephgHC0hO7VW62aGIJ92rat0j8g1oNj48QhQ
	hx+rSs2/Af4y4W6JXZXUL1YBqR8dQvrSLLDnlgJRYnnuxX/SR1ulBWOGOU/AH3w3ql80=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugDFQ-0000W8-14;
	Mon, 28 Jul 2025 02:05:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ugDFO-0000W2-QW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 02:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NuYbzcPWf6jBVKh1wozpuN9ADEmu3JGk4sr9YW+RzQI=; b=TTlkIC2a0FLFD2DdcSNENocai5
 +v2wMxLdnDaJodgSMzt0LoTdv6qHZ+tsr+nMv4ppn6vx41dMfx2V5OEomczAYSZOCYQvSV6CEONHV
 q7HNqMZSNlVKxl7HKQfn0m9MckFD6kMGM9u0A76eJqSxvgzKQasFegS8yk3QsL4SZWx0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NuYbzcPWf6jBVKh1wozpuN9ADEmu3JGk4sr9YW+RzQI=; b=n
 JZTWKmbGjq5jef8spBPUUTD3EyNlxuP117gNR31XXWa4bPurWDMHYvYw4IJAVzXwkPmkjrd2k+8Hc
 1KbIU/7lbMeV0dMocul7G8a12IayrbVes5jyCrMrVzu0CE4u9bDJp5TZfKxYW/Obo2sOTkE5dTwQ5
 +aSZnEGUB5AxsOLw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugDFO-0008EM-8u for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 02:05:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DB37844EDC;
 Mon, 28 Jul 2025 02:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D8EC4CEEB;
 Mon, 28 Jul 2025 02:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753668339;
 bh=XOUtxih2qIdcvV7KIZq4k66XGk5SPx1GPHIvo+sLfTQ=;
 h=From:To:Cc:Subject:Date:From;
 b=Liw0QvklhsS2hT19vV+wI+C9mkfjY4sjsDZLLLrc5JAxU8k023Jit+6x4B8bj2LJg
 bO8A1tDz6mw9NgVHrNCERCX/JwjF/Z3ytfBU8TRqFNM5LKHaQn/0JgND0L2ZSko/2W
 Ztb+kPSHpB8LUGqrKEVWdW/qBK5gwJiU8g/XpFwBInSdLLfQ83sQw5DZU/vRULOTa/
 pT6Rg7f6oxj19caTnSLf+ujbEnHndtvvosDC4v8qZBxxw/bxrZBJFZ3qfrnfJb4pi0
 PIX7VTysYC998lUE0p3wcdWl/tctG5A8r0PxGDz/1qIL+VSczs7KD1pG00kI+963Yv
 hejFaw+KNshFQ==
To: jaegeuk@kernel.org
Date: Mon, 28 Jul 2025 10:05:31 +0800
Message-ID: <20250728020531.22736-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  It provides a way to disable linear lookup fallback during
 mkfs. Behavior summary: Android Distro By default disabled enabled Android
 case: Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ugDFO-0008EM-8u
Subject: [f2fs-dev] [PATCH v4] mkfs.f2fs: support -C [no]hashonly to control
 linear lookup fallback
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It provides a way to disable linear lookup fallback during mkfs.

Behavior summary:
			Android		Distro
By default		disabled	enabled

Android case:

1.1) Disable linear lookup:
- mkfs.f2fs -f -g android -O casefold -C utf8:hashonly /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       2 : 2]

1.2) Enable linear lookup:
- mkfs.f2fs -f -g android -O casefold -C utf8:nohashonly /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       0 : 0]

1.3) By default:
- mkfs.f2fs -f -g android -O casefold -C utf8 /dev/vdb
Info: set default linear_lookup option: disable
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       2 : 2]

Distro case:

2.1) Disable linear lookup:
- mkfs.f2fs -f -O casefold -C utf8:hashonly /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       2 : 2]

2.2) Enable linear lookup:
- mkfs.f2fs -f -O casefold -C utf8:nohashonly /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       0 : 0]

2.3) By default:
- mkfs.f2fs -f -O casefold -C utf8 /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       0 : 0]

Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v4:
- fix typo in manual page
 include/f2fs_fs.h       |  3 ++-
 lib/libf2fs.c           |  6 ++++++
 man/mkfs.f2fs.8         |  9 ++++++++-
 mkfs/f2fs_format.c      | 11 +++++++++++
 mkfs/f2fs_format_main.c |  3 ++-
 5 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index f7268d1..a8da8fa 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1478,7 +1478,8 @@ enum {
 
 /* feature list in Android */
 enum {
-	F2FS_FEATURE_NAT_BITS = 0x0001,
+	F2FS_FEATURE_NAT_BITS		= 0x0001,
+	F2FS_FEATURE_LINEAR_LOOKUP	= 0x0002,
 };
 
 /* nolinear lookup tune */
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 2f012c8..1a496b7 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1424,6 +1424,7 @@ static const struct enc_flags {
 	char *param;
 } encoding_flags[] = {
 	{ F2FS_ENC_STRICT_MODE_FL, "strict" },
+	{ F2FS_ENC_NO_COMPAT_FALLBACK_FL, "hashonly"}
 };
 
 /* Return a positive number < 0xff indicating the encoding magic number
@@ -1485,6 +1486,11 @@ int f2fs_str2encoding_flags(char **param, __u16 *flags)
 					*flags |= fl->flag;
 				}
 
+				if (fl->flag == F2FS_ENC_NO_COMPAT_FALLBACK_FL)
+					c.nolinear_lookup = neg ?
+						LINEAR_LOOKUP_ENABLE :
+						LINEAR_LOOKUP_DISABLE;
+
 				goto next_flag;
 			}
 		}
diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index 8b3b0cc..9096646 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -232,10 +232,17 @@ Use UTF-8 for casefolding.
 .I flags:
 .RS 1.2i
 .TP 1.2i
-.B strict
+.B [no]strict
 This flag specifies that invalid strings should be rejected by the filesystem.
 Default is disabled.
 .RE
+.RS 1.2i
+.TP 1.2i
+.B [no]hashonly
+This flag specifies that linear lookup fallback is off during lookup, to turn
+on linear lookup fallback, use nohashonly flag.
+For android case, it will disable linear lookup by default.
+.RE
 .RE
 .TP
 .BI \-q
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 2680bd3..04dfc20 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -671,6 +671,17 @@ static int f2fs_prepare_super_block(void)
 	memcpy(sb->init_version, c.version, VERSION_LEN);
 
 	if (c.feature & F2FS_FEATURE_CASEFOLD) {
+		/*
+		 * if [no]hashonly option is not assigned, let's disable
+		 * linear lookup fallback by default for Android case.
+		 */
+		if ((c.nolinear_lookup == LINEAR_LOOKUP_DEFAULT) &&
+			(c.disabled_feature & F2FS_FEATURE_LINEAR_LOOKUP)) {
+			c.s_encoding_flags |= F2FS_ENC_NO_COMPAT_FALLBACK_FL;
+			MSG(0, "Info: set default linear_lookup option: %s\n",
+				c.s_encoding_flags & F2FS_ENC_NO_COMPAT_FALLBACK_FL ?
+				"disable" : "enable");
+		}
 		set_sb(s_encoding, c.s_encoding);
 		set_sb(s_encoding_flags, c.s_encoding_flags);
 	}
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index f0bec4f..8f8e975 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -143,7 +143,8 @@ static void add_default_options(void)
 		force_overwrite = 1;
 		c.wanted_sector_size = F2FS_BLKSIZE;
 		c.root_uid = c.root_gid = 0;
-		c.disabled_feature |= F2FS_FEATURE_NAT_BITS;
+		c.disabled_feature |= F2FS_FEATURE_NAT_BITS |
+					F2FS_FEATURE_LINEAR_LOOKUP;
 
 		/* RO doesn't need any other features */
 		if (c.feature & F2FS_FEATURE_RO)
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
