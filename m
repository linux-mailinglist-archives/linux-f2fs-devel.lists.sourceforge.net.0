Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A130962682A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Nov 2022 09:33:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1otlxO-0005q3-Ca;
	Sat, 12 Nov 2022 08:33:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ssawgyw@gmail.com>) id 1otlxI-0005pe-0K
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Nov 2022 08:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4DOeqJ5SMCOeWwnjErWXkoh3b+hyZguii3t6dQS8YmY=; b=h3CEDdkRaOqde8PtIYynCZJxDT
 LDkxCmb4c1hC1GSKGMF0vv0s8sdwlJX4ONtXeKWZddUQjW32Sj+gpp1biTSJtDEBZ4EfdMoHukJ+p
 YvL8TJqpu+glCLoikLd2EvpfB1pumcnD8mboyHWVIY4j6YozwboSjDO5dHyiiLGqhUPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4DOeqJ5SMCOeWwnjErWXkoh3b+hyZguii3t6dQS8YmY=; b=bIUbEP3bQu+tK624MQD/Knctnc
 n6ZFqsnmlOkyUnm+f6LmDo++ZOfu2KitcrTR3VaioDdV33vep5Fg6tHYKZF55IkSKti/rZZhoBbpo
 JEPPpY9wpe49Xk0fTalV80pZiOywMb+8x4oxOXjx5k4fRQAtgoTitSYWkOcCBtLLB8IU=;
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1otlxA-0004f9-1X for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Nov 2022 08:33:34 +0000
Received: by mail-pf1-f181.google.com with SMTP id y13so6779980pfp.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 12 Nov 2022 00:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4DOeqJ5SMCOeWwnjErWXkoh3b+hyZguii3t6dQS8YmY=;
 b=IBxyvjZzoJn3lNx52hSdWnd8nch0DPIteXYXXv2nCFcZaF5Vj+cURGaTaeBSQ6OoR7
 BUZv7yYyLphZeilhFjf7hRJ3QjCSt4azIF5y3KIh0MEgBpz7j/DwmtJBUUeDlXSEDTzk
 wmDKnPkt4mwZCRX43AwaY3Tg/5iXPAyZZkjjv482i2mk5iic/sEx1GglPugfioauNr7I
 6saBXb/MioFSWS1ltk1EGI5YcIYrBJz3B1tlTosE9zuZUUp5PiXnHmV7NXHlNcr6IcAh
 97ilLSggyCO1JAKfDTyNLdsvbIRA3y40zHHVQPWkRynv0GbRx4tqZaKLXa2dSQumi1mS
 rjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4DOeqJ5SMCOeWwnjErWXkoh3b+hyZguii3t6dQS8YmY=;
 b=KsEaWqZ3byBPziMOIvFUlBmOOConFcbEUXoV0ZJH8FPGjgMQ87FGzodiLiRDoEqF+r
 pfZB0REfMZ/k2CkyndrkyD+OB+k1BfcAXorc6H3oA8AL/DIuvxlHPJ3h5dU1ZTgwDldd
 VAwW8aOz1qfoY7Li1pmdgzHnAjIReeJUSd/BqWDlHAOzH4J5eOjD2GDVnFl1Wfur97a1
 Oe9HK4PHCcrFvc8/xnS+lqmo5WZ4BfEYCEHUCrcvf1+ycUdOvGVH2axEW2zaDRE3C9It
 eYeUetzEKM0LaUNWrCKz5RY/dpSduEbzSZmYlxslyX8Cc1AP16OJWPF8mB9g4fLdFzEB
 BXtA==
X-Gm-Message-State: ANoB5pkzZbG+gPw2VhKFO338ceeGnUDFNGkqQ47yNb4vqYFbFkK/VL5V
 e0DtfxJtkxPgNREgFokwVoc=
X-Google-Smtp-Source: AA0mqf6nLlSW5VpkbWvYJgYo7AZz395SuqNmwQNWgO0iRN0u/qGstxBxkjaN7nkV7UaRRPRReey3gw==
X-Received: by 2002:a63:1c61:0:b0:464:45f3:8272 with SMTP id
 c33-20020a631c61000000b0046445f38272mr4755995pgm.610.1668242002513; 
 Sat, 12 Nov 2022 00:33:22 -0800 (PST)
Received: from VirtualBox.. ([129.227.152.6]) by smtp.gmail.com with ESMTPSA id
 i11-20020a1709026acb00b001870533c443sm3066927plt.236.2022.11.12.00.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Nov 2022 00:33:22 -0800 (PST)
From: Yuwei Guan <ssawgyw@gmail.com>
X-Google-Original-From: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 12 Nov 2022 16:32:48 +0800
Message-Id: <20221112083250.295700-2-Yuwei.Guan@zeekrlife.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221112083250.295700-1-Yuwei.Guan@zeekrlife.com>
References: <20221112083250.295700-1-Yuwei.Guan@zeekrlife.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The commit 84b89e5d943d8 ("f2fs: add auto tuning for small
 devices") add tuning for small volume device, now support to tune alloce_mode
 to 'reuse' if it's small size. But the alloc_mode will change t [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ssawgyw[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.181 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.181 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1otlxA-0004f9-1X
Subject: [f2fs-dev] [PATCH 1/3] f2fs: fix to alloc_mode changed after
 remount on a small volume device
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

The commit 84b89e5d943d8 ("f2fs: add auto tuning for small devices") add
tuning for small volume device, now support to tune alloce_mode to 'reuse'
if it's small size. But the alloc_mode will change to 'default' when do
remount on this small size dievce.

The commit 4cac90d5491c9 ("f2fs: relocate readdir_ra configure
initialization") relocates readdir_ra variable to tuning process.

This patch fo fix alloc_mode changed when do remount for a small volume
device.

For a small device,
- alloc_mode will keep 'reuse', if no alloc_mode option in remount
  command,
- alloc_mode will be set as remount command, if it has 'alloc_mode='.

Signed-off-by: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
---
 fs/f2fs/super.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3834ead04620..2f36824ff84b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2190,6 +2190,23 @@ static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 	f2fs_flush_ckpt_thread(sbi);
 }
 
+static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi, bool is_remount)
+{
+	struct f2fs_sm_info *sm_i = SM_I(sbi);
+
+	/* adjust parameters according to the volume size */
+	if (sm_i->main_segments <= SMALL_VOLUME_SEGMENTS) {
+		F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_REUSE;
+		if (f2fs_block_unit_discard(sbi))
+			sm_i->dcc_info->discard_granularity = 1;
+		sm_i->ipu_policy = 1 << F2FS_IPU_FORCE |
+					1 << F2FS_IPU_HONOR_OPU_WRITE;
+	}
+
+	if (!is_remount)
+		sbi->readdir_ra = 1;
+}
+
 static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
@@ -2248,6 +2265,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 
 	default_options(sbi);
 
+	f2fs_tuning_parameters(sbi, true);
+
 	/* parse mount options */
 	err = parse_options(sb, data, true);
 	if (err)
@@ -4054,22 +4073,6 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 	return 0;
 }
 
-static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
-{
-	struct f2fs_sm_info *sm_i = SM_I(sbi);
-
-	/* adjust parameters according to the volume size */
-	if (sm_i->main_segments <= SMALL_VOLUME_SEGMENTS) {
-		F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_REUSE;
-		if (f2fs_block_unit_discard(sbi))
-			sm_i->dcc_info->discard_granularity = 1;
-		sm_i->ipu_policy = 1 << F2FS_IPU_FORCE |
-					1 << F2FS_IPU_HONOR_OPU_WRITE;
-	}
-
-	sbi->readdir_ra = 1;
-}
-
 static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 {
 	struct f2fs_sb_info *sbi;
@@ -4475,7 +4478,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 	f2fs_join_shrinker(sbi);
 
-	f2fs_tuning_parameters(sbi);
+	f2fs_tuning_parameters(sbi, false);
 
 	f2fs_notice(sbi, "Mounted with checkpoint version = %llx",
 		    cur_cp_version(F2FS_CKPT(sbi)));
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
