Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38448AB302A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 May 2025 09:00:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aqBWg6PfMxr79Znf0xNQiLNXsQ98QGbRJpPyYDhry10=; b=JApOn8PD5DUdP4kQ+ZafwK/Dp7
	x4HBWmom8ZczFfQDb1AOdviQ1Whc/XzQQZQuE1QlsL8pEr635UxR5S02MWq/Vho+Quqrcn5R7xD4g
	Ts8bPZiCLFYmxGdxFzm1QZki84szSCs/aWOlD/KddR51d7noe7WHe4TXuusg3jrVR840=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEN8h-0004Jj-G4;
	Mon, 12 May 2025 06:59:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uEN8S-0004JT-Kw
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 06:59:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qniVw2pXU7TWnRln8ytimmI5PjJYdq/gCMD8/abJTNw=; b=EOBkRB2KYIl75zy9hX+rwKHhOX
 SlwowT0oQQ268TTQT4Moo7tSFhb6MHAvLWizPWqgi3+4+xWdy0ol5+q9WIbUWnl2E+dnJiAjL2zGQ
 Ck0bM1AOS2TFevN/+o6MPlxLOSBoYK4Qad3J3uVSclooMVzb6r/FPLA6O7geDYZDFuJk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qniVw2pXU7TWnRln8ytimmI5PjJYdq/gCMD8/abJTNw=; b=F
 Nz/Qn7PrQn8aKQ0uB6anMs7/f9f6X6NY9qSkGIY5+k8O1tSzyYvz7Deilq4RHd8m6gxDr90bP1Pc5
 niYeamlVj9gGve7JR+doR2ZYeDdNkMS00PcZQvgFXNlovhnHZR0iJHfZtDyu8qNSyf/r7bFKr+Hc3
 bL5r24Qnd26Mg1q4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEN8S-0001Ue-2z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 06:59:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B116D44934;
 Mon, 12 May 2025 06:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D37C4CEE7;
 Mon, 12 May 2025 06:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747033170;
 bh=rJb4ar78moHg29UPU5USB46gFHse91i4J5qniDxEwO0=;
 h=From:To:Cc:Subject:Date:From;
 b=ZouP1lBJ7W4k9s8O0k/UQr8qP7fvgfox/rtwt7vsY2EthEcO5CgLW+E5pqiTq8lSw
 rwU9gdcQ2FAEPjdIejApQj/IKH/cT1y5Rx3N/0Gpc0BckPRQbV0jW8/yzLZ4n6g0KB
 MaTUzoczmsUueATv69FAJwiKTNZivbD0LbfsgVZy8WU1FwE8ZZuS7B1iM062s6Y1NA
 CFq3jmgexXr1fhWf0pnN8Kagke/wlONnlBkKL3uFAJ6vGLDXJuo2G9hSWRGQHG/rvK
 YXVAnX8PxxQbKvJZPf6AIVUFy8bhxnm04CRnGBmCR/V5ABhihlnFn5aSDCX2sUx193
 RryCLBqQTiMBQ==
To: jaegeuk@kernel.org
Date: Mon, 12 May 2025 14:59:22 +0800
Message-ID: <20250512065922.2565055-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
MIME-Version: 1.0
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  nl6720 reported in [1], mkfs.f2fs doesn't report block size, 
 instead, it prints sector size which is not used inside f2fs. Let's print
 block size as well during mkfs as below: output of mkfs.f2fs: Info: sector
 size = 512 Info: total sectors = 16777216 (8192 MB) Info: block size = 4096
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEN8S-0001Ue-2z
Subject: [f2fs-dev] [PATCH] libf2fs: print block size
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
Cc: nl6720 <devnull@nl6720.me>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

nl6720 reported in [1], mkfs.f2fs doesn't report block size, instead,
it prints sector size which is not used inside f2fs. Let's print block
size as well during mkfs as below:

output of mkfs.f2fs:

Info: sector size = 512
Info: total sectors = 16777216 (8192 MB)
Info: block size = 4096

[1] https://lore.kernel.org/linux-f2fs-devel/20250425013623.918150-1-devnull@nl6720.me

Reported-by: nl6720 <devnull@nl6720.me>
Closes: https://github.com/jaegeuk/f2fs-tools/issues/29
Signed-off-by: Chao Yu <chao@kernel.org>
---
 lib/libf2fs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index d2579d7..40c974d 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1375,6 +1375,7 @@ int f2fs_get_f2fs_info(void)
 	MSG(0, "Info: total sectors = %"PRIu64" (%"PRIu64" MB)\n",
 				c.total_sectors, (c.total_sectors *
 					(c.sector_size >> 9)) >> 11);
+	MSG(0, "Info: block size = %u\n", c.blksize);
 	return 0;
 }
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
