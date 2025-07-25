Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC12B1157B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Jul 2025 02:59:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pXNjgqpIVt/NnBcdcl2G5WDMqsMI4qzsR/0q2YGvDjo=; b=XghgiJbDBvWcA1zcG9xLMAoeII
	hdchbUhz5kWrmQ08Pytf2CEOWIlVzfElrOTjDZGqOO6Jsg174tKfeFAJgwu4hx2MRFLedseod1E/w
	D8rVYoQb5E6EslEcrJUB/ISrh78ztneVUWcuqMXYG6Z0s5rHkYUIojqhPIxel657wygU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uf6mj-0001SC-SI;
	Fri, 25 Jul 2025 00:59:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uf6mi-0001S6-GA
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 00:59:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iZSPt6W7Zlb2KsN2sEvutUgLyrsdlxv8CJMyZ48uZ+Q=; b=hjI2Op94dQ4AnG0y6UStXTW5H3
 CNmdukvWUwlwdIzeey7oCOVf7qFkSO3flnMVd9BszsWR6utC+pkhqM3FaCXR4vEvz8DqMopruGA9q
 UY4fFAfCUMNLcw+P/Q18XGCWFXJx4v76uDQVDRoWpjrGn5jN/X4VV2V2+uJD6DK4D758=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iZSPt6W7Zlb2KsN2sEvutUgLyrsdlxv8CJMyZ48uZ+Q=; b=O
 +jIX7HD9zcD6U0AShA0MM0wpqVdTWXVEJg6yVGR6afJ4G94JdS6ICCEs0t0v0brwNOg5r3Tff32Ii
 +prGT3c7L9akSsOyoYNznrFiBVWAa8vGQvJfa2lW/D6f+H3bp1mN5x/HkZhe/lE6TH/o6qhJKEpfI
 /SCTh5hYHwCfcxYI=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uf6mh-0007YP-UU for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 00:59:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E7D41A56294
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Jul 2025 00:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58CFC4CEED;
 Fri, 25 Jul 2025 00:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753405168;
 bh=cMFu/GEy3hioA3z9/cfDqmnP+X7hl7QjBEG+qFIQP80=;
 h=From:To:Cc:Subject:Date:From;
 b=PyPaunDHCynkR3SUs3SLTZdO5iTwgSY5+7UTUeLd7EbpBEwkf4ywyh0p0O8YG2pOo
 7BkHZ77jHRnHeg3BUAPEc6Obyk6EweYTJiZiMlg35eIvg94cCPbxxjqKxLxkvJMuwt
 VNUuJfHNT5gwjapT6a7rPlbCWWJGiDO97HZhujVjcfTEtaX7GmvE8asrFK4jrrH6QN
 u22eJAFAycn3IjeMRDuZ4mwvhbI39KaQuQzcwszYrXE8XL6/qTxwu1KDxnK1h4C9aE
 zPxgSVs3adabWdMUNvTRWbUL62iIn18H6rdWAYSnBnhUhv0ldXSaiUziGggAgCU1xa
 A1RQSI5Y1aqyA==
To: jaegeuk@kernel.org
Date: Fri, 25 Jul 2025 08:59:24 +0800
Message-ID: <20250725005924.3909785-1-chao@kernel.org>
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
 mkfs. Behavior summary: Android Distro By default disabled enabled Tune w/
 [no]hashonly no yes Android case: 
 Content analysis details:   (-0.2 points, 5.0 required)
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
X-Headers-End: 1uf6mh-0007YP-UU
Subject: [f2fs-dev] [PATCH v2] mkfs.f2fs: support -C [no]hashonly to control
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It provides a way to disable linear lookup fallback during mkfs.

Behavior summary:
			Android		Distro
By default		disabled	enabled
Tune w/ [no]hashonly	no		yes

Android case:

1.1) Disable linear lookup:
mkfs.f2fs -f -g android -O casefold -C utf8:hashonly /dev/vdb
dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       2 : 2]

1.2) Enable linear lookup:
mkfs.f2fs -f -g android -O casefold -C utf8:nohashonly /dev/vdb
dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       2 : 2]

1.3) By default:
mkfs.f2fs -f -g android -O casefold -C utf8 /dev/vdb
dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       2 : 2]

Distro case:

2.1) Disable linear lookup:
mkfs.f2fs -f -O casefold -C utf8:hashonly /dev/vdb
dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       2 : 2]

2.2) Enable linear lookup:
mkfs.f2fs -f -O casefold -C utf8:nohashonly /dev/vdb
dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       0 : 0]

2.3) By default:
mkfs.f2fs -f -O casefold -C utf8 /dev/vdb
dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       0 : 0]

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- disable linear lookup by default for Android case
 include/f2fs_fs.h       |  3 ++-
 lib/libf2fs.c           |  1 +
 man/mkfs.f2fs.8         | 10 ++++++++--
 mkfs/f2fs_format.c      |  3 +++
 mkfs/f2fs_format_main.c |  3 ++-
 5 files changed, 16 insertions(+), 4 deletions(-)

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
index 2f012c8..0e3e62a 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1424,6 +1424,7 @@ static const struct enc_flags {
 	char *param;
 } encoding_flags[] = {
 	{ F2FS_ENC_STRICT_MODE_FL, "strict" },
+	{ F2FS_ENC_NO_COMPAT_FALLBACK_FL, "hashonly"}
 };
 
 /* Return a positive number < 0xff indicating the encoding magic number
diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index 8b3b0cc..8cb7d32 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -232,9 +232,15 @@ Use UTF-8 for casefolding.
 .I flags:
 .RS 1.2i
 .TP 1.2i
-.B strict
+.B [no]strict
 This flag specifies that invalid strings should be rejected by the filesystem.
-Default is disabled.
+For android case, it will disable linear lookup by default.
+.RE
+.RS 1.2i
+.TP 1.2i
+.B [no]hashonly
+This flag specifies that there is no linear lookup fallback during lookup.
+By default, linear lookup fallback is enabled.
 .RE
 .RE
 .TP
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 2680bd3..a45bbcb 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -671,6 +671,9 @@ static int f2fs_prepare_super_block(void)
 	memcpy(sb->init_version, c.version, VERSION_LEN);
 
 	if (c.feature & F2FS_FEATURE_CASEFOLD) {
+		if (!(c.s_encoding_flags & F2FS_ENC_NO_COMPAT_FALLBACK_FL) &&
+			(c.disabled_feature & F2FS_FEATURE_LINEAR_LOOKUP))
+			c.s_encoding_flags |= F2FS_ENC_NO_COMPAT_FALLBACK_FL;
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
