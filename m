Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0888595102
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Aug 2022 06:49:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oNoVx-00054y-KG;
	Tue, 16 Aug 2022 04:49:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oNoVw-00054r-KK
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Aug 2022 04:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vrK5RcreX+xCDGDRW/0fh8U05YN6Rz9ChVx84ZCFGfM=; b=k4Ud88dzzMlo/5ASPFd52rlz1N
 g9sWYErX5qVf3oDBUfpZCgEByPPOJVsRGxX3nmg0KYu5Ygr71HXGKfsx34lCVWbahYdaKqei2WItF
 qfhMXr7ecNqfzhFKTrD3qmAkQdPe6kz9D3SVvekQtaGigmvEdgw1otEa0yWh5URvNS/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
 Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vrK5RcreX+xCDGDRW/0fh8U05YN6Rz9ChVx84ZCFGfM=; b=G
 z26sulVCKT5F/Ct9h1rDXpasi4+0hW3ab6ElVBqL//y57OZTGCiR49/wdWxoMWEDZuQMkn8ZhxDNr
 8YyF22E07oIEtjHq/v/r18S7+OiXCQipowSWnKcmh/c+Ly8W6d0FvEuhYAMZVY3NpcAeFBjU/ex8q
 PqPzYo9+CrnGxP20=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oNoVt-0006wT-OB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Aug 2022 04:49:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8EC016120F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Aug 2022 04:49:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A92C433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Aug 2022 04:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660625343;
 bh=Fwt75qHdRovF1QdoWUWkfMIcV2ai6xVPmEUhgchu8is=;
 h=From:To:Subject:Date:From;
 b=Ohv0gak3kB0lGR9VY8tZRWCF1qXt7Cgsl45g7eUEWZP1Z9O3cqkfSiWhnTObAmwpl
 wL/WxwA9yHI3NRy2+ls04bVXBTmKCjCgaPw/wKrwPjzIsgJ1WNuMkniZoUvhpF4o6l
 Uv/JusJUQaBNLlZnyc5uIakHLhmc81a0qFCCL2B2H7A0v4gZWtOZlhWZD/NpMMyzoe
 wUWx9XFAQlRGUHt+m2bHPJV5jy6KGa1czQ5OUkJWR/rws7SSR04/OmwNv9ATpjDlQy
 2rCBY+x+2Vu2ICxnrnOJZ6yg2wc573b2R4DNuIB5Vifzbd2OUnmjfiEyc6Tki5v8/M
 mrylHM2SpWOeQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 15 Aug 2022 21:48:32 -0700
Message-Id: <20220816044832.129302-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> Cleanly report an
 error instead of dividing by 0 (causing a floating point exception) in the
 following case: truncate -s 16M img && mkfs.f2fs img 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oNoVt-0006wT-OB
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: catch total_zones=0 instead of
 crashing
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Cleanly report an error instead of dividing by 0 (causing a floating
point exception) in the following case:

	truncate -s 16M img && mkfs.f2fs img

Note that this is a minimal fix; it appears that overly-small images
still cause various integer overflows in f2fs_prepare_super_block().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 mkfs/f2fs_format.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 7cd5815..40ac589 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -467,7 +467,8 @@ static int f2fs_prepare_super_block(void)
 
 	total_zones = get_sb(segment_count) / (c.segs_per_zone) -
 							total_meta_zones;
-
+	if (total_zones == 0)
+		goto too_small;
 	set_sb(section_count, total_zones * c.secs_per_zone);
 
 	set_sb(segment_count_main, get_sb(section_count) * c.segs_per_sec);
@@ -497,8 +498,7 @@ static int f2fs_prepare_super_block(void)
 			c.sector_size < zone_align_start_offset) ||
 		(get_sb(segment_count_main) - NR_CURSEG_TYPE) <
 						c.reserved_segments) {
-		MSG(0, "\tError: Device size is not sufficient for F2FS volume\n");
-		return -1;
+		goto too_small;
 	}
 
 	if (c.vol_uuid) {
@@ -612,6 +612,10 @@ static int f2fs_prepare_super_block(void)
 	}
 
 	return 0;
+
+too_small:
+	MSG(0, "\tError: Device size is not sufficient for F2FS volume\n");
+	return -1;
 }
 
 static int f2fs_init_sit_area(void)

base-commit: 6148db344eb25b23a7cbde36d026011cd15b6143
-- 
2.37.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
