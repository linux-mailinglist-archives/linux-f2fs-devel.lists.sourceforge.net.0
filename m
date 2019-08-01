Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B33F7D2D3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Aug 2019 03:26:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hszrQ-00047v-VN; Thu, 01 Aug 2019 01:26:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <f2fsnewbie@gmail.com>) id 1hszrP-00047o-PV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Aug 2019 01:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LBn9qSFHQGqZzHg0UTgPaUSdLuBKs7uIgdXTkkRx/rA=; b=IxyaClj4w7MsZgnPwSgXKr41bx
 3aAjcGsSMtVWEl3ZNrg8bL3/MjaAFlJnqcwKy4z4tejuCA1ECBlyPgD3vmnI25KQ5N817+zDKeapi
 mbINTzyZ1AdvZkmBxclqUnQhzR3lVCaT63c09bwXWEepO25cqamzy1grsVGoi/LwxZ5k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LBn9qSFHQGqZzHg0UTgPaUSdLuBKs7uIgdXTkkRx/rA=; b=W
 MOlCumVsKJU8REp6da3KbnV+hPV8KovrxA2ySFL8QFsa+eePghnLxpuHAY1l9awhchfGo3bTOsxkR
 p6XcyOOsPAA0YceCsRa+o4MpwpTVH4u89z/7iG3Jcz5BoJWLhD4dHabQBeoWGFoQoKWZ7g8rlzCUJ
 FWa5QJ/+EfaU9CWg=;
Received: from mail-pg1-f182.google.com ([209.85.215.182])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hszrO-006L1w-JI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Aug 2019 01:26:27 +0000
Received: by mail-pg1-f182.google.com with SMTP id f5so24228932pgu.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 Jul 2019 18:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LBn9qSFHQGqZzHg0UTgPaUSdLuBKs7uIgdXTkkRx/rA=;
 b=B08c+LyNz4hnbWls6cFXOg4pFirJXR8HMwPvrF/ECYANaXTIAul9m+Rtys0iSN495L
 HzznpqDpL40xSnfxP7nllr1mdxeBgSQ+lO1MBoZnKPIaBkD+VnopowpDMunnoWoM9CMY
 oBVIDjwFEml6Zu7enYnZYJdBlsXTzkbgPP2r+GI5TM38/qW0TuYjP0NtLAgGQ/HCyCFY
 0TNir2GVjba2MyDmXRqDwADL2UB6a/8JOfwLIXooehCsHKfxZd9qhzqtBXf4vLW211/1
 x8h6AXMCETsiDmcHUKK+2b5N3bxdjpxHKSCRjACEWHzaUw+27kpHjc31GfRDsCyNlOKx
 OkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LBn9qSFHQGqZzHg0UTgPaUSdLuBKs7uIgdXTkkRx/rA=;
 b=K0ov+lpqDwIvr+7aFd27M0Uuvu1V3tkE6SbNPCtGMxSgsh75yekUV6E9V3AHLDPGjA
 Tq8nAOiwvZeU5A3Jh9Y3r9GnP1Odidsv7VpfzUfmvc/CyfU1Aj7PTUvtQ17+k8n1Tl1n
 cxosVH9Ks0S6kN6eudhphL3SPsKk/FHvWpfk5yHnVoSBhE4RGDyp/SKerzH9IjN87FxK
 tS+eBxt3eAutTmHbyL0EXjzjM8BsLuGkzPQabVj8C+7VLfsSJucKesd6hvkyAn+Y9pyl
 qsO/oU2ake+eHYEjaDm8BYf6P6/dST76tCO1kLBG+pPRpotUPhRuuII2/jHrMkBotWp6
 7OjQ==
X-Gm-Message-State: APjAAAU4k8M/37mjeTnvzFyHk8CR0vOBMWt673DbUFOqOSz0MpbFI9qo
 NjrkqjIegztTkhpWq51SIC5dUZPJ
X-Google-Smtp-Source: APXvYqzDNAa0k/iKP1vyjR87M2y3ZOMR5FLdf8cWDlx48rXBon2qSxGUN95r8t1onTSjUpKlj5jN5g==
X-Received: by 2002:a17:90a:d997:: with SMTP id
 d23mr5490816pjv.84.1564622780660; 
 Wed, 31 Jul 2019 18:26:20 -0700 (PDT)
Received: from curare.nss.cs.ubc.ca (coconut.cs.ubc.ca. [198.162.52.139])
 by smtp.gmail.com with ESMTPSA id a16sm77560098pfd.68.2019.07.31.18.26.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 18:26:19 -0700 (PDT)
From: Surbhi Palande <f2fsnewbie@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 31 Jul 2019 18:26:17 -0700
Message-Id: <20190801012617.2472-1-f2fsnewbie@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (f2fsnewbie[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.182 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hszrO-006L1w-JI
Subject: [f2fs-dev] [f2fs-tools][PATCH] Throw an error when zone device info
 not found
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
Cc: Surbhi Palande <csurbhi@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Surbhi Palande <csurbhi@gmail.com>

When the -m option is specified to format a Zoned device,
do not fall back to the non-zoned mode in case information
about the device is not found.

Explicitly specify this error to the user.

Signed-off-by: Surbhi Palande <csurbhi@gmail.com>
---
 lib/libf2fs.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 6b5badf..2ea405e 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -16,6 +16,7 @@
 #include <errno.h>
 #include <unistd.h>
 #include <fcntl.h>
+#include <libgen.h>
 #ifdef HAVE_MNTENT_H
 #include <mntent.h>
 #endif
@@ -1140,7 +1141,12 @@ int f2fs_get_device_info(void)
 		c.segs_per_sec = c.zone_blocks / DEFAULT_BLOCKS_PER_SEGMENT;
 		c.secs_per_zone = 1;
 	} else {
-		c.zoned_mode = 0;
+		if(c.zoned_mode != 0) {
+			MSG(0, "\n Error: %s is not zoned (-m option)", c.devices[0].path);
+			MSG(1, "\n /sys/block/%s/queue/zoned not found \n",
+					basename(c.devices[0].path));
+			return -1;
+		}
 	}
 
 	c.segs_per_zone = c.segs_per_sec * c.secs_per_zone;
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
