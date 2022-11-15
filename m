Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1686291E5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Nov 2022 07:36:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oupYC-0006Ep-AS;
	Tue, 15 Nov 2022 06:36:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ssawgyw@gmail.com>) id 1oupYB-0006Ej-21
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 06:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/ddiJyfTyZKuawRH0HdAalthgL1Zu6o7Dm/cACdaVe8=; b=DDZXbrKNmdEaidk0RNCvg9Jy4u
 a+POZlbAjslU4jA8uj3xEqg3gSU7GfkE7m0tv2zjLRKgjyFIwdnQ6iYIRieYpXQEV9v0eivI8Vnxn
 kuEPVOIOwh4PZsa3vlQGnDVDPmnauBJ2jTcHQcaqO0QoZPuH/5lfNjw9CHzpxsswNa8g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/ddiJyfTyZKuawRH0HdAalthgL1Zu6o7Dm/cACdaVe8=; b=MTxELre8yOYxx+616Gv2kPXJrm
 bl2hOA9N8lI3knSfQ09e6GplYhgLvG8vWXTzxSTkZYMYfLVYwu0qaHt4QG2hBRjZ0leoD5P8I6kXt
 2z+q4bkcNsivpDd6V7jNArSXqC+gjisA4o1h9uqI7tJOkDlvkGTJM9EBdOwNWs5MTCMA=;
Received: from mail-pg1-f171.google.com ([209.85.215.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oupYA-0008HU-Ey for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 06:36:02 +0000
Received: by mail-pg1-f171.google.com with SMTP id 136so12435344pga.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Nov 2022 22:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ddiJyfTyZKuawRH0HdAalthgL1Zu6o7Dm/cACdaVe8=;
 b=fbkTPJI6AdjhHDOAYjXNCRvWLJeS+4Nq2CAHj74eUDoT58ti3q7omrhHGT6kh9kPW/
 XzjFIkVr8Tn8MP9JmIjaP4QwFoVn8SLybhGUCBbshXXfu3QO7dNAH/c5UHbHVRjYDjVk
 eLWK+INryeHrOewUQ0vbC9CrqVVnZP2C6SkHF21q4rME3D99xtuRIYY6+OcGBFG6b8GE
 f4UyxTVdg71A+NJ0wDStJ1Y8oc1yZFKannJGbTc++xbcYfN2vrMvs4IPQ4DpIBajUD4J
 I6GfuPFaY17savOj4LdfTErn8YcC65VAbKJXF/Nq/HpRZzRzlNsaPSeE6kEiHTpRLTlQ
 Ks6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ddiJyfTyZKuawRH0HdAalthgL1Zu6o7Dm/cACdaVe8=;
 b=00ByaPPWXiNpiH8puqsT3IO4fCuTGXkW4b+BftJo2qVcTi/gNZpudZyKv+NASdcl6K
 RL/WIRcCvMyChb90Fy2qR0Oc37tYcniasLX/CKmiA4RfVT9psynY/nI0Apbi66SX9Atl
 Dt4HL/mJKf+w2mk6kodvwC7PcVPWRESJp2OSSCZS+bpjYCqh1s83gOFg7Lh9bzRtNZqG
 u2RHtuG9vDPYkrod7jNbne7S2fKoGLM8bvH8dip7f7lGhiLjhRVhkErQct3tkWkTVy6A
 7mxibhjoYLU/HBjYcw7DyJJe+7ZlVoTggdJu3OmbgvHAbgbPR0WosQo2TjZ+KuxAfyfe
 l8Jg==
X-Gm-Message-State: ANoB5pmH1G/BqJ5LyvqadMEHOfaHcGxcK4cGMfSfwHKv4xFCxceg2Hbl
 biSt+IuSmpBkq04jQTNvPAk=
X-Google-Smtp-Source: AA0mqf5flZQzQWytBUUJAK3gX47rHhuDS851ql2atv78oKjWIOj8+6BzVhmY9A0Va0F7ogUwfKplqA==
X-Received: by 2002:a62:1a10:0:b0:572:6da6:218e with SMTP id
 a16-20020a621a10000000b005726da6218emr1986865pfa.1.1668494156965; 
 Mon, 14 Nov 2022 22:35:56 -0800 (PST)
Received: from VirtualBox.. ([129.227.152.6]) by smtp.gmail.com with ESMTPSA id
 e4-20020a170902d38400b001822121c45asm8767874pld.28.2022.11.14.22.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 22:35:56 -0800 (PST)
From: Yuwei Guan <ssawgyw@gmail.com>
X-Google-Original-From: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 15 Nov 2022 14:35:35 +0800
Message-Id: <20221115063537.59023-2-Yuwei.Guan@zeekrlife.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115063537.59023-1-Yuwei.Guan@zeekrlife.com>
References: <20221115063537.59023-1-Yuwei.Guan@zeekrlife.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.171 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ssawgyw[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.171 listed in wl.mailspike.net]
X-Headers-End: 1oupYA-0008HU-Ey
Subject: [f2fs-dev] [PATCH v2 1/3] f2fs: fix to alloc_mode changed after
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
remount on this small size dievce. This patch fo fix alloc_mode changed
when do remount for a small volume device.

Signed-off-by: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
---
 fs/f2fs/super.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3834ead04620..17b9e70b8f32 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2043,7 +2043,11 @@ static void default_options(struct f2fs_sb_info *sbi)
 		F2FS_OPTION(sbi).active_logs = NR_CURSEG_PERSIST_TYPE;
 
 	F2FS_OPTION(sbi).inline_xattr_size = DEFAULT_INLINE_XATTR_ADDRS;
-	F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_DEFAULT;
+	if (le32_to_cpu(F2FS_RAW_SUPER(sbi)->segment_count_main) <=
+							SMALL_VOLUME_SEGMENTS)
+		F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_REUSE;
+	else
+		F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_DEFAULT;
 	F2FS_OPTION(sbi).fsync_mode = FSYNC_MODE_POSIX;
 	F2FS_OPTION(sbi).s_resuid = make_kuid(&init_user_ns, F2FS_DEF_RESUID);
 	F2FS_OPTION(sbi).s_resgid = make_kgid(&init_user_ns, F2FS_DEF_RESGID);
@@ -4060,7 +4064,6 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
 
 	/* adjust parameters according to the volume size */
 	if (sm_i->main_segments <= SMALL_VOLUME_SEGMENTS) {
-		F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_REUSE;
 		if (f2fs_block_unit_discard(sbi))
 			sm_i->dcc_info->discard_granularity = 1;
 		sm_i->ipu_policy = 1 << F2FS_IPU_FORCE |
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
