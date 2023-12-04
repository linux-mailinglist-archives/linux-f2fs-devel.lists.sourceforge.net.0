Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D869380413D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Dec 2023 22:59:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rAGyg-0000lC-8u;
	Mon, 04 Dec 2023 21:59:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rAGyc-0000l5-LN
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Dec 2023 21:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2NsrjOGbg4NmIjD8PWqjBsvJk5exDijeITeH9cgLNWk=; b=mMboq4JgbvfNJ6znREgAfIsLl4
 7KQ+C2Of0x8jkGpXJOHpdx4XL5Ivc9nq5DZwq5MZDNBl2EiJrK+arbFpRluMFuKsXXHICXsOEA8j5
 lDZt5Gu0pfkPowbZ3A+g4fovwN7SLguCmbImNFW0XlfA2ckm6rLHD2CFGbPdgMnyL6eI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2NsrjOGbg4NmIjD8PWqjBsvJk5exDijeITeH9cgLNWk=; b=R
 1lZt0GFQmw+6zus2Wy0Bta588+QmoT+WI/L7l4Z3eFW25lNQA84LwcxfgAY4CIsnA/gcLu8Dfe3Jz
 gIhA7FpefAdcH3bK3mTcPInYToFYq91m6ZFzgb+a+Aic3Fr5vcP+AZC3vk4dn9fsX4e/UudsMnphv
 pzoouuxUE6T62Jkc=;
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rAGyZ-0006rx-2Y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Dec 2023 21:59:41 +0000
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-28654179ec0so3682653a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 Dec 2023 13:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701727168; x=1702331968; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2NsrjOGbg4NmIjD8PWqjBsvJk5exDijeITeH9cgLNWk=;
 b=Av6vZyJ7GMD5yQPvTeNLFO/HscR1UTnEF4gy580cfyDVGkjW9w9c0x/Gyc4aelqo7X
 7WwsUEk6gVSsxFE000/i7ay2Fc1s1Q3PcTEbAh6Fgz/FA15MT8/zFxjNMStKZhKexiGJ
 Wv0CVY7svUgbkXfzWLJPnjcpo7qb6ZZUHgyfD1LnZfF1wlk1I70qATxOVSUqkJETr4Q0
 s7O30Tb11N4CjVzy6gRy3eq5bGv7FQ6shY94y5s0R5UcQbRN1ka8kufqjpn1jEXaM5B3
 0ms0Ru+D2bP2LmmmejCveGItot3bAgZmXBjY9+0fjXhh5QEaP0j/eU9nantKmzU+4PWZ
 eVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701727168; x=1702331968;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2NsrjOGbg4NmIjD8PWqjBsvJk5exDijeITeH9cgLNWk=;
 b=Ncg+Ef2YgYJ9xBfnRS9OTSixPZxpGPQReZUHsfxMY1ev+vW85tMyFpSpxNlJEGZLU3
 2+9BOvvORimrJ/czZVVnXyur1SMOII9hjIM6tCxTfM4Jar+tDXioD59iXfH6n21BfKXL
 gWXzi8WL0P+taViWnF32f0h/yHnrAfze3lU2MXd9NRrAuN6QKEWfGDK0Uqh+vtm5jPZc
 H/obCOkJWWoklRR5lmvMUuMS6YIZla0EdWqkihincJeE2W9AYqJJQyGF8Hwn1l0iE8tQ
 +yGAKEnYoOtnQxFTZxCffQeeW5xP02Um8kuTZ1ikgQRqHGHhY23vBJ8b8spD6xGR6PbN
 +vOQ==
X-Gm-Message-State: AOJu0YwoqnPxgZ+V74wqgP6wBrvrAEvdwod9dPMsjGkmdqeBMnhUvAbh
 IV1vTFI6+IQ9VJJNm/NJDzYoKCI5NIo=
X-Google-Smtp-Source: AGHT+IEd8ztf0T46rO8eqjfh+HBBSeiqKtVN5wRE53nvIDe3epX1CVDUgVsHKD8Vx1RM5sUOMcJY/g==
X-Received: by 2002:a17:902:7842:b0:1d0:649b:89d0 with SMTP id
 e2-20020a170902784200b001d0649b89d0mr3912917pln.52.1701717778840; 
 Mon, 04 Dec 2023 11:22:58 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:727a:d07a:2bd2:a437])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a170902dac400b001cfe19e2508sm8687675plx.274.2023.12.04.11.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 11:22:58 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  4 Dec 2023 11:22:51 -0800
Message-ID: <20231204192251.2518865-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Do not finishing zones for current zones.
 Signed-off-by: Daeho Jeong Fixes: 06a25b021d15 ("f2fs-tools: make six open
 zone check resilient") --- fsck/fsck.c | 12 +++++++++++- 1 file changed,
 11 insertions(+), 1 deletion(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.43 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.43 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rAGyZ-0006rx-2Y
Subject: [f2fs-dev] [PATCH] f2fs-tools: skip finishing zones for current
 zones
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Do not finishing zones for current zones.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Fixes: 06a25b021d15 ("f2fs-tools: make six open zone check resilient")
---
 fsck/fsck.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 8acb822..5121a56 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3265,8 +3265,9 @@ static int chk_and_fix_wp_with_sit(int UNUSED(i), void *blkzone, void *opaque)
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	block_t zone_block, wp_block, wp_blkoff;
 	unsigned int zone_segno, wp_segno;
-	int ret, last_valid_blkoff;
+	int i, ret, last_valid_blkoff;
 	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
+	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
 
 	if (blk_zone_conv(blkz))
 		return 0;
@@ -3309,6 +3310,15 @@ static int chk_and_fix_wp_with_sit(int UNUSED(i), void *blkzone, void *opaque)
 		return 0;
 	}
 
+	/* if a curseg points to the zone, do not finishing zone */
+	for (i = 0; i < NO_CHECK_TYPE; i++) {
+		struct curseg_info *cs = CURSEG_I(sbi, i);
+
+		if (zone_segno <= cs->segno &&
+				cs->segno < zone_segno + segs_per_zone)
+			return 0;
+	}
+
 	/*
 	 * If valid blocks exist in the zone beyond the write pointer, it
 	 * is a bug. No need to fix because the zone is not selected for the
-- 
2.43.0.rc2.451.g8631bc7472-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
