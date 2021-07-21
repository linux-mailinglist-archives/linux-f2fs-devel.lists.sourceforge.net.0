Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 859253D18D0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jul 2021 23:13:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6JWT-0003xu-N3; Wed, 21 Jul 2021 21:12:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1m6JWR-0003xZ-HG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Jul 2021 21:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HlI02XKC+lC64ms+XQgCKJ3PfplWwxDKPnFmnzw9MfE=; b=GoaH59Ma5kipVLSU535oJYcLrI
 IkU2Li+R/ZSAH/qvB6sLiR3Uhr8NMqkNnO6o4XiNe2yh9sw8Jb5oHcugcuNx32fLSpDvEgqLuMSSK
 2q7pt1EcM4tSD+/lk4MaD/jT3cRbC25Ce/77bg3HMyDA6/dATkpe/PfzRGtoERla/r3U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HlI02XKC+lC64ms+XQgCKJ3PfplWwxDKPnFmnzw9MfE=; b=N
 8meDnu5HVj8qxwEMuFz1e0h0SV0bDItCp3gsAI3d2HpSGC+KyQx33jEByaUjRrAx+m+CpLJt44ffp
 OtFjLV0xAyFIOpEGeU0CIjXFK6bqv3tT0uSiXOLpqcJkKMKo1vplvlJyiI3iOa2dkxav8YoqVSDMI
 AYkXifEVBPdXGU4U=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m6JWM-0004X1-LP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Jul 2021 21:12:55 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso1071448pjb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Jul 2021 14:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HlI02XKC+lC64ms+XQgCKJ3PfplWwxDKPnFmnzw9MfE=;
 b=ulCaX/p88ZfWSpF+Ii1S4YqwetBd6S+SZkGnm03Y5R3Dpat641FDjcFESiIZcsdZj8
 lfidCeNRnwld+4irqOzXwaRVRrC2c/09z4dzS2O/bbUX8qG0n6QfO7akq/9ajDY691tC
 P3TxV6U7w4zdnbCygYn5qM66DOevjLtdhu5n/O1J4CyDe3XGrl1zqwXwXTqTjUWnVdP0
 t9oSXoKcWnj71Opxh56c5eIt8HYm3PGjU3f+GPLgI1ismU/qFoB0b7ysSrpYZ5pQHoTp
 dHR/qVPGVbQgmKJfKnlumpgtcODBkstWaDVSrBfrS0L5ng4uvLwmPrVPlUl2MT5zfWZ2
 vL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HlI02XKC+lC64ms+XQgCKJ3PfplWwxDKPnFmnzw9MfE=;
 b=GwohMzKc+G0rtoUxARZgxtdUQgKKXex13uc4q9vfqHmmqtWIy4UmhrjI4E0kJmPF1A
 yJiaTOrJXXt4oSL2Ykmt/aVBJ1ZGX0b5IPl2EULZzG0YF1X0pWw4r/LAJxxTGx/Bu05w
 +tFX7Qehe6+bZKCFGXVDZ0v25D4UDiKbMudS/DeBIsZ6UBQUKXJF3DWoYE2hJEYdM/WE
 fH+lR4pxhnjqVY+AOYp/gOGDbkpTVVam3nFcKKRG1qnywZarfrQNWp0lGH6gLK/fUnvB
 OvIobagObz9bc1HSI2VRa890bmH5gukHGGo2s6yEBzcfOC3LHwF9Nyl1Im1MTPTGksOU
 A6jQ==
X-Gm-Message-State: AOAM533i0RLPvTAQgcFKTuS5qxoaj9TpdKBnOiAuAvLw0zpHL5Ov1nQ8
 viLc/Ov1dB3JaUhGf3IZXew=
X-Google-Smtp-Source: ABdhPJxTSpgCKdEscQOAy+Ld8ZZWYmwDHZllWnT3zkt8BtrHaaZ4TqrQOeV9QqBbdTKvYRbt80qDxg==
X-Received: by 2002:a17:902:c64b:b029:12b:25f7:9b17 with SMTP id
 s11-20020a170902c64bb029012b25f79b17mr28874638pls.24.1626901964990; 
 Wed, 21 Jul 2021 14:12:44 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:a0d4:143d:6e70:369d])
 by smtp.gmail.com with ESMTPSA id y9sm7667498pgr.10.2021.07.21.14.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 14:12:44 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed, 21 Jul 2021 14:12:40 -0700
Message-Id: <20210721211240.3632817-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.32.0.402.g57bb445576-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.46 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1m6JWM-0004X1-LP
Subject: [f2fs-dev] [PATCH] f2fs-tools: make fiemap command in accordance
 with uapi
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

Made "fiemap" command in accordance with user api manual. So, eliminated
NEW_ADDR print out and made it ends in the last extent.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 tools/f2fs_io/f2fs_io.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index aa1a7e4..42dbd60 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -757,10 +757,11 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
 			die_errno("FIEMAP failed");
 
 		phy_addr = fm->fm_extents[0].fe_physical / F2FS_BLKSIZE;
-		if (phy_addr == NEW_ADDR)
-			printf("NEW_ADDR ");
-		else
-			printf("%llu ", phy_addr);
+		printf("%llu: %llu\n", fm->fm_start / F2FS_BLKSIZE, phy_addr);
+
+		if (fm->fm_extents[0].fe_flags & FIEMAP_EXTENT_LAST)
+			break;
+
 		fm->fm_start += F2FS_BLKSIZE;
 	}
 	printf("\n");
-- 
2.32.0.402.g57bb445576-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
