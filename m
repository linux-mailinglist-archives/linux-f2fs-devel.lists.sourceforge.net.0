Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CFBB11818
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Jul 2025 07:52:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+cqpRbm3JbGjufloao2r377svyxufIpfvMKs/tx4Q3k=; b=OHUWmlBoH6yX9eRXx7WXAGpmK3
	t4yMaHAE8n6LeovDO8iqlAzQ6+CHHI2SjaT/yoTDP/0FLvBUuGM8Pz0Rsni6rVEjaDu8b3Xg44F8D
	FYEi46Kej0qz1aDunG4dPHOZYkrcG4TCqJdUKLP5eWz/EyIo7bFg6iOeWTEWU0p0lLXc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ufBM9-0003P9-6o;
	Fri, 25 Jul 2025 05:52:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ufBM8-0003P0-3U
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 05:52:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fQvW+wwEL/vKerTHMZJ5rK/bxI1WFWx+Pw5TkmRSET4=; b=YupxAv1CghNFRX2RTJywsWlWBr
 q4bEccXx0FhQeq8+5sdll+uhtnKjCRvjamTVHLCAkdpj+kdz+N9XSXy+nPPbDqpprmuJEG21Refw5
 8aMSmX1Do1LsqQddf5VjVaYJKN2xTe2ixRnSGpBE3dnd5gUGnvTdntAGtQOJpritaLW8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fQvW+wwEL/vKerTHMZJ5rK/bxI1WFWx+Pw5TkmRSET4=; b=S
 OnIk6XYwKnIWLDxb+TD7HijF6wkRVu6NJkR/8Y9U/3QYV18DjjMFxfvmx1B4X3b/7biffrYac/I97
 Y0njQyAuCDzAjRUdP9nUHLzJ5snzomS+AuuaAOr0BpvsJpmLBe81vJ/ZpJs5pS0pyJlYmPnIsCJMR
 HbrAhgv42hxC6Voc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ufBM7-0006jx-LX for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 05:52:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 422BB5C668A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Jul 2025 05:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11EC8C4CEE7;
 Fri, 25 Jul 2025 05:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753422740;
 bh=W1UNqUye+wuywy6cuwYi/bfS5cN41yuGTkS7qPhfBsk=;
 h=From:To:Cc:Subject:Date:From;
 b=PcuJMDTRL9tYchWwpf+d+Q/9VrZZMEvbqugE/4v04Upa+2jB+mZkx6f3OK8K+XJZd
 PTc+SeVoBqCRm4xF7BoZXQ1GG438Xv3vWtK7TV0XJqQFlilPdd4/x/YdRahtOrIQv2
 /R283CS6J5IsVG0dMHUme4bxOvcvziwskCFbTY+JUj3kHx0i+gahoZZCJTH3W/kahl
 mhvToCZQXRAugzQNPpIED4Z8TrqoNVUKJeS32OC25QD4DlcLJ7RNiydFt1Obb783Sy
 RI0s7ZHaIcB6acVYQB3lCeOjX93v/m/kD8jYb+nkn5ciLVbowhAqm1sce9jCsmXCPl
 6BGKo0TcbbNew==
To: jaegeuk@kernel.org
Date: Fri, 25 Jul 2025 13:52:04 +0800
Message-ID: <20250725055204.3973947-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Behavior summary: Android Distro By default disabled enabled
 Android case: 1) enabled -> disabled - mkfs.f2fs -f -g android -O casefold
 -C utf8:nohashonly /dev/vdb - dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
 s_encoding_flags [0x 0 : 0] - fsck.f2fs -g android --nolinear-l [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
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
X-Headers-End: 1ufBM7-0006jx-LX
Subject: [f2fs-dev] [PATCH] fsck.f2fs: honor --linear-lookup=X for Android
 case
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

Behavior summary:
			Android		Distro
By default		disabled	enabled

Android case:

1) enabled -> disabled
- mkfs.f2fs -f -g android -O casefold -C utf8:nohashonly /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       0 : 0]
- fsck.f2fs -g android --nolinear-lookup=1 /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       2 : 2]

- mkfs.f2fs -f -g android -O casefold -C utf8:nohashonly /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       0 : 0]
- fsck.f2fs -g android /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       2 : 2]

2) disabled -> enabled
- mkfs.f2fs -f -g android -O casefold -C utf8:hashonly /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       2 : 2]
- fsck.f2fs -g android --nolinear-lookup=0 /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       0 : 0]

Distro case:

1) enabled -> disabled
- mkfs.f2fs -f -O casefold -C utf8:nohashonly /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       0 : 0]
- fsck.f2fs --nolinear-lookup=1 /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       2 : 2]

2) disabled -> enabled
- mkfs.f2fs -f -O casefold -C utf8:hashonly /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       2 : 2]
- fsck.f2fs --nolinear-lookup=0 /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       0 : 0]

3) default
- mkfs.f2fs -f -O casefold -C utf8:hashonly /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       2 : 2]
- fsck.f2fs /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       2 : 2]

- mkfs.f2fs -f -O casefold -C utf8:nohashonly /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       0 : 0]
- fsck.f2fs /dev/vdb
- dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       0 : 0]

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/fsck.c | 9 +++++++++
 fsck/main.c | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index bb39f8b..4c36dc1 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2425,6 +2425,15 @@ void fsck_update_sb_flags(struct f2fs_sb_info *sbi)
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	u16 flags = get_sb(s_encoding_flags);
 
+	/* handle default option for Android case */
+	if ((c.nolinear_lookup == LINEAR_LOOKUP_DEFAULT) &&
+		c.disabled_feature & F2FS_FEATURE_LINEAR_LOOKUP) {
+		c.nolinear_lookup = LINEAR_LOOKUP_DISABLE;
+		MSG(0, "Info: set default linear_lookup option: %s\n",
+			c.nolinear_lookup == LINEAR_LOOKUP_DISABLE ?
+			"disable" : "enable");
+	}
+
 	if (c.nolinear_lookup == LINEAR_LOOKUP_DEFAULT) {
 		MSG(0, "Info: Casefold: linear_lookup [%s]\n",
 			get_sb(s_encoding_flags) & F2FS_ENC_NO_COMPAT_FALLBACK_FL ?
diff --git a/fsck/main.c b/fsck/main.c
index e05c23a..324629e 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -226,7 +226,7 @@ static void add_default_options(void)
 			c.auto_fix = 1;
 
 			/* disable linear lookup by default */
-			c.nolinear_lookup = LINEAR_LOOKUP_DISABLE;
+			c.disabled_feature |= F2FS_FEATURE_LINEAR_LOOKUP;
 		} else if (c.func == RESIZE) {
 			c.force = 1;
 		}
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
