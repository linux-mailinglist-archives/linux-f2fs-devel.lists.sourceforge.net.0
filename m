Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA897EA75
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Aug 2019 04:48:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1htNbu-0001Me-GH; Fri, 02 Aug 2019 02:48:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <f2fsnewbie@gmail.com>) id 1htNbt-0001MN-8l
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Aug 2019 02:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VwqKG558nLeKLuEFTGZ1/PZ+IKHuSabqyA67HnHb3os=; b=SxfLfaeaVJWe7It6ap5+cYnSFj
 EJxH1GsmDMUa5PUidL9Fid1j4kV+35Z5BDxyXqsklEqtI1GUz2S4D90uIrTu1q7UOw9UJm1uf71Fl
 SFknZQVIK6CbPbvG9yBfbT/cB7vxoA7oE/pGw/xFVWM1t0THw8jVwl0UZoccPLJSwgMU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VwqKG558nLeKLuEFTGZ1/PZ+IKHuSabqyA67HnHb3os=; b=MSAXHToLgajjt/e7XPAqP5aRwU
 +gy8tghRR9rVw091Qq9oXekDo72pwnSn1ZI1jmZG/M/yGSBFTBuNY/GexUGrZGlOI1fTUTXwJ33pt
 ZJekVnw+Sci7kbgsq9GFEacTedMg+9wb/1FEeOBuDsPkv4IPCg7GWc88Ax1Sz7/RpsRk=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1htNbp-007fIq-Tu
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Aug 2019 02:48:01 +0000
Received: by mail-pf1-f193.google.com with SMTP id f17so31198664pfn.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 01 Aug 2019 19:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VwqKG558nLeKLuEFTGZ1/PZ+IKHuSabqyA67HnHb3os=;
 b=ZPwYVwgp9vOeecl6hiieQ7v82BbOqVzNtQzCouGOpLR2CutANaasTwqmvNP9bVurk+
 gYGbx+zMcjcvp/qty/EqjTf/i0SYzdYsZRU7G+V8ceTLFTYGir3MWyMKxo4bV1KvK/A7
 fsKQPgkzU+V+o6STGOGVtBz+rpRGLy1CQNbJ7XzkdcxAq1+g2XfBKMJAxtka2LCVsQx6
 x8JSlGm4d1W/IV7Vj1PzB62feouReAGMiQdidBAp/5qJEPeNoD3KNrk5wxBwoaZ3W2gA
 jNutVAz0mCDYtUDExu8VYzhK2vO22JQV8gScTm0J5k9tdoq6WV6g9wh73D9D6j7H8snW
 eT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VwqKG558nLeKLuEFTGZ1/PZ+IKHuSabqyA67HnHb3os=;
 b=IpSIeb0QXwXQ7gEV8wTfkGpt7BxKH3PLSwulxOooFn4Fx0a2cEUvbpx67DXTRqeBLR
 xRcjC42dZyUFX/R18oHeieyNmrzEK5OvOK0kiyF12coQA+Vaih9LC3XPJMPENrgwIZHM
 Zoups1kNPiDL3d6/vsSqCpHcaSwiFrvcr28TSEJhkGJkKm7AFD2+9nc++4zRlwPDZDSM
 uclXg97fd9zt2n2QebehHq7hi7nukPWgt+73MNna7vhwpPKkozjXkjLpv87H4CNgBluZ
 3gK5Nqs7HOd+eYiRdc1cGHID3nrlfltF7OmZU0yzrB+IJUb8uObgfVX1sRsq6emccY10
 I3uQ==
X-Gm-Message-State: APjAAAVC1Yi9ar+1Uyl9k7yrIY4QLsduaRcYkipFHYIg0r02M6Mh15iY
 1R+nK1CsEd9bxGTYSjVbWxrETXZ9
X-Google-Smtp-Source: APXvYqzFR18PJ6RzslwipJixOSKLzeJG0xNZctAGpuPeEBzIJ2fx6xAgze5JQQt+GlF/LnI1AIIYtQ==
X-Received: by 2002:a63:de43:: with SMTP id y3mr59582332pgi.211.1564714071797; 
 Thu, 01 Aug 2019 19:47:51 -0700 (PDT)
Received: from curare.nss.cs.ubc.ca (coconut.cs.ubc.ca. [198.162.52.139])
 by smtp.gmail.com with ESMTPSA id z13sm5643095pjn.32.2019.08.01.19.47.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:47:51 -0700 (PDT)
From: Surbhi Palande <f2fsnewbie@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  1 Aug 2019 19:47:48 -0700
Message-Id: <20190802024748.17987-1-f2fsnewbie@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <BYAPR04MB581626A599C2601E1A6BFAD4E7DE0@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <BYAPR04MB581626A599C2601E1A6BFAD4E7DE0@BYAPR04MB5816.namprd04.prod.outlook.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (f2fsnewbie[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1htNbp-007fIq-Tu
Subject: [f2fs-dev] [f2fs-tools][PATCH] libf2fs: Throw an error when zone
 dev info not found
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
 lib/libf2fs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 6b5badf..4966dee 100644
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
@@ -1140,7 +1141,11 @@ int f2fs_get_device_info(void)
 		c.segs_per_sec = c.zone_blocks / DEFAULT_BLOCKS_PER_SEGMENT;
 		c.secs_per_zone = 1;
 	} else {
-		c.zoned_mode = 0;
+		if(c.zoned_mode != 0) {
+			MSG(0, "\n Error: %s may not be a zoned block device \n",
+					c.devices[0].path);
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
