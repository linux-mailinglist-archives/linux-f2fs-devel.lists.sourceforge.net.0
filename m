Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F82DB11815
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Jul 2025 07:50:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vpAN61+9GcX4tOeLuKfp/CF/z1tlJ9xIY7r2f9mkowk=; b=TxZQqmsUnHgC+HTI12+WiveKuC
	3WIm9hCsBzw4dFNS0R2y/HmP43k27i4jeuKok1cQHgtTP5lINqQ4bwTomY3cALWvzZsNR5btIlN/B
	O5dd7B1UO0ELJ/AZ4aTQqPYxtOJJ+KsMM5SrtwNaUEZQQk9rA8KySffQiToEJxhWgEEU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ufBK2-0007ej-EX;
	Fri, 25 Jul 2025 05:50:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ufBK1-0007ec-6Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 05:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CQAZtWFGK9dDxdSu+lSzoe0ZeZCISskxRbZCnoohAgI=; b=meGvpJ95WpbLPQxIIxTeaiP8o6
 Mo7Q7iebaI374oHa7ltfXLyOYe7Aqn+LoAcxyhq7zR8kIWAYGoo0q4g8C6K6AeI6x4mM7lCxNCVUB
 B3Pn0gRCJt0kCR16Dl3BF12iOKSHOHdaopO25gewsYnslYXZ/gu8gM4sSGPZwcmUSQls=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CQAZtWFGK9dDxdSu+lSzoe0ZeZCISskxRbZCnoohAgI=; b=d
 qT4f0qszOuUSdqWPJALswGJ6xIxnBnpufh4/+tFMGvEANhLaetNp51I+TeRsizjQCGmgrfg3CVXl6
 xFKzRKkGCf+iNTT2MknimcX2WZMvzfyOJz/cH3atcLvc5ECi/o6ftadeA+d/EuHLvUcMh/UKAvWA0
 /d3hhQG8JtI0RtT4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ufBK0-0006ZS-KC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 05:50:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EF592601DC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Jul 2025 05:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF8AC4CEE7;
 Fri, 25 Jul 2025 05:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753422614;
 bh=BGjXsUnNjLE7O41aldkupZWLOiDewT6Hs1fr1D63K1c=;
 h=From:To:Cc:Subject:Date:From;
 b=D8RrNpDBV3QGCenq/W5CMdUMA/dks0uOADljV8y1fH7ojMR6Q/jG2p5zX+m0SuTPO
 r2qgrjFOan12YSJbUTxmO/ot3Lv0NnC7jHZ1wAaHqgmse3CJtRg5HZ1r8Lf8I2caMG
 Zqg8A+Pr+NwEdAHfwKrkdB1ukLL4xsK1Rhd74I8a+HWaq+I2fuQ/hDI4HpgFMbIVsi
 Vn7MmgckdNbBXMV7lyc9jwGUzOwdjyLmV0ThgM9IBdheRHIystMvkGQk/AFbN/m6QP
 DO8K/ioilJCwEcR7ohhA9vOvhJainVFQg10EDwY/xE4Ei1GMsV9FO+kYr7k0eG5Pt8
 PR7au4Oi41yqg==
To: jaegeuk@kernel.org
Date: Fri, 25 Jul 2025 13:49:22 +0800
Message-ID: <20250725054922.3972265-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  It provides a way to disable linear lookup fallback during
 mkfs. Behavior summary: Android Distro By default disabled enabled Android
 case: Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ufBK0-0006ZS-KC
Subject: [f2fs-dev] [PATCH v3] mkfs.f2fs: support -C [no]hashonly to control
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
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

Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- honor [no]hashonly flag for Android case
- update testcase and output
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
index 8b3b0cc..fcb227c 100644
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
+off linear lookup fallback, use nohashonly flag.
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
