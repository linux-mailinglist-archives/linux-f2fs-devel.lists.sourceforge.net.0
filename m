Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4435746995E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Dec 2021 15:44:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1muFEb-0005fe-LC; Mon, 06 Dec 2021 14:44:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1muFEZ-0005fT-NW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Dec 2021 14:44:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LD+2mUJknO6/FCSK/WlckWgSUhT8potaxTHJNMIF5d4=; b=l/o4Hufkr3+JYzXefxywB4I3dd
 ZqmQXVepD7JLV1mAfM5BEuLe3uhYy+22PloAdSgCVZbFlweMmkm2I+I628cM1hrpy9NQJvmFRzhaC
 O72+d1tmFojCsqmsco4vFkvM9hAu9D911KZjXP5dxVcOZPG7lwK8EU+y9tTcxpR1NuQI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LD+2mUJknO6/FCSK/WlckWgSUhT8potaxTHJNMIF5d4=; b=MBcbvDf/Lf+TxTatQMrtGc1DZU
 PpLqA+mj0zWyumlAAY7ycjzq7ucVScoNyiub3urSFjDWv7HKgqq43VwI9nxD5b9UEN0s3KQn7f/Ay
 GlVOR1N0ZFigQM+nTgI3uJfbRuJpk5DEmfHVbRDgfIlyYJUIftYzTj1YrY+TiDZnteVU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1muFEZ-0000fX-5r
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Dec 2021 14:44:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C980D612FC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Dec 2021 14:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590CEC341C2;
 Mon,  6 Dec 2021 14:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638801885;
 bh=cUjbe/EJAxsJ8SgLeq77UY5nWkrmwigTYc5XTbzXi8Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pQjdO0FVrurbWZwCXDtJKfjtObhATEZmVtxJCVai418GhufbzFVrL2heqVLnI5cWS
 cuqzt3zMUE3ZQoWwsO3go8P7a+X7KH2ZAbOiAyTQJ1hBuOdWSXdIuoemuhNnibsFeO
 kvZBNntunIbY3TSYXWOOivUjWhMgQcLnXJmg56Yi/PIT7VYbytWO9uhDlAiCD1xENP
 70QC2C11JhCSl+Skz+DgKr1c5fM4rt2MfllQ79lWZCApHv2YFXIwzcWe32kWshepMj
 hGAJDleidIhl3gQCVW3QFotxItH5BOeofXYnFXt1XBVgCCEm8F9MfED53lbbuCqCTw
 7EDZOniskqNew==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  6 Dec 2021 22:44:21 +0800
Message-Id: <20211206144421.3735-3-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206144421.3735-1-chao@kernel.org>
References: <20211206144421.3735-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In fuzzed image, SSA table may indicate that a data block
 belongs to invalid node, which node ID is out-of-range (0, 1, 2 or max_nid),
 in order to avoid migrating inconsistent data in such corrupted i [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1muFEZ-0000fX-5r
Subject: [f2fs-dev] [PATCH 3/3] f2fs: fix to do sanity check in is_alive()
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In fuzzed image, SSA table may indicate that a data block belongs to
invalid node, which node ID is out-of-range (0, 1, 2 or max_nid), in
order to avoid migrating inconsistent data in such corrupted image,
let's do sanity check anyway before data block migration.

Cc: stable@vger.kernel.org
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/gc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 3e64b234df21..b538cbcba351 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1026,6 +1026,9 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 	}
 
+	if (f2fs_check_nid_range(sbi, dni->ino))
+		return false;
+
 	*nofs = ofs_of_node(node_page);
 	source_blkaddr = data_blkaddr(NULL, node_page, ofs_in_node);
 	f2fs_put_page(node_page, 1);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
