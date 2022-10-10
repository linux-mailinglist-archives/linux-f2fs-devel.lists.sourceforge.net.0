Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D6B5FA79A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Oct 2022 00:16:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oi14M-0006Zc-UC;
	Mon, 10 Oct 2022 22:16:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oi147-0006ZG-CV
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Oct 2022 22:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TSnfmV5MJSfmBT33PUGaa9/Vml2+SENXFc4nbxU0++4=; b=TK69/S/6UO61CEYzg3O8R06GKO
 4EEYI4DKy5Sc7BXNG38uP9xHDyb7n8mxhxtIPQaOBhDVeLvMytHKdH/bB22WyJBVYR71iNtEWf458
 F12Cux7pDjXOx2gmiJ3emXskEZr+taM+I3ccDp4/TUNW7zcy1P42N5icMEiwT79Q90SE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TSnfmV5MJSfmBT33PUGaa9/Vml2+SENXFc4nbxU0++4=; b=F2xlMwwYw6yncyR+Q/LV2HtKGr
 kckgQi21DtdKI+JQ38IW9CRD1wVlvOtNMXuEf5OLyKTn3Enx+E6V1Yv00jaqEPIg/wraxRsHEUFVF
 Df9145UOvz704kpm4E5StFTDHWywVgwJktwCFPrfS6zIFrbeiYRWFiD2Y99EOWmKaY5k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oi145-0008Av-VH for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Oct 2022 22:16:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8E3276103E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Oct 2022 22:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF066C433D6;
 Mon, 10 Oct 2022 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665440151;
 bh=wZ/EOWz6nhcKq0ueJZs/TIumez1AxffY2Ws7JHLZD+o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Iq1Tvt0gvQCIFVGz5MOACY/MIYxvdJxjOTZyGDw1vEldNc2y/XhqR8DXCow2TSzUy
 2dwUoIiP9m9JNy0ISKAONTS+9mXQTYOsqRdU9sn1McP3GrU0Qq97kgv9I3d6TKGk5E
 LgRuYehXIkGwqQ7BjY9eFeQ5ligoAl08R2FZD1Zz9bapb8ZBD+WtlQVrz1CvFbXvlg
 aMzdnXPP43UdE0oSC4hslGkNFJkO154Odd/QLHAzwb1O3kKk6quXZpESVxQaoMtRHI
 Elu5Pk8bGFMgrmp5dboc2URlI1ez465ldmL7sUNZJrAnhK6+lAOecwpHTmwG/FSXA7
 K95OCptqEYPug==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 10 Oct 2022 15:15:47 -0700
Message-Id: <20221010221548.2728860-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221010221548.2728860-1-jaegeuk@kernel.org>
References: <20221010221548.2728860-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  We need to set the c.zoned_model appropriately for further
 usages. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- fsck/mount.c
 | 8 ++++++++ 1 file changed,
 8 insertions(+) diff --git a/fsck/mount.c b/fsck/mount.c
 index 0597220b3bc0..cd8a07538150 100644 --- a/fsck/mount.c +++ b/fsck/mount.c
 @@ -1095,6 +1095,14 @@ int init_sb_info(struct f2fs_sb_info *sbi) if (i ==
 0) c.d [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oi145-0008Av-VH
Subject: [f2fs-dev] [PATCH 2/3] fsck.f2fs: fix missing to assign
 c.zoned_model
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We need to set the c.zoned_model appropriately for further usages.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/mount.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index 0597220b3bc0..cd8a07538150 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1095,6 +1095,14 @@ int init_sb_info(struct f2fs_sb_info *sbi)
 		if (i == 0)
 			c.devices[i].end_blkaddr += get_sb(segment0_blkaddr);
 
+		if (c.zoned_model == F2FS_ZONED_NONE) {
+			if (c.devices[i].zoned_model == F2FS_ZONED_HM)
+				c.zoned_model = F2FS_ZONED_HM;
+			else if (c.devices[i].zoned_model == F2FS_ZONED_HA &&
+					c.zoned_model != F2FS_ZONED_HM)
+				c.zoned_model = F2FS_ZONED_HA;
+		}
+
 		c.ndevs = i + 1;
 		MSG(0, "Info: Device[%d] : %s blkaddr = %"PRIx64"--%"PRIx64"\n",
 				i, c.devices[i].path,
-- 
2.38.0.rc1.362.ged0d419d3c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
