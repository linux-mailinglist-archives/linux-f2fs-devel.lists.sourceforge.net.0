Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C3A6A89BB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Mar 2023 20:46:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pXosa-0004af-Nd;
	Thu, 02 Mar 2023 19:46:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pXosZ-0004aZ-1H
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Mar 2023 19:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q1EnsV4tzxFH2PMc3Yg0KG+Aj8AHjZ0pSYpLTh09gbg=; b=QUScABx5ZKMlAw8f1FA+75f76U
 tzkIQCH2r9Fcm3/wKjqYVos9dZUAcQezVVvBV5r47u4yuhD+PPagJyzSrUrgAcA2pOSO62D2eUYGZ
 JgB4sIYUKkW5eQNJR7rIsDjBshyWZg3tx5+Q6RJLOAM05jYzI9Jjp2e31SSMQ1LyFHNI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=q1EnsV4tzxFH2PMc3Yg0KG+Aj8AHjZ0pSYpLTh09gbg=; b=k
 lD+LeSkat35uN6s/fXEjlvEHnVBi1HFGXI8qsIrCh+KAByiyIEndau036vghz3ANQwBPS4nBaJRhG
 CN41YhwS2u4yu6ONp+9gD2wyWCyhgSTWLBfpcDQPmEQ2t0vRZNp2PuwPYI02drJqMYgHZuj7epSvW
 iFgtpLKPVGUnx8eA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pXosX-00DqTf-J2 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Mar 2023 19:46:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 22362615F7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Mar 2023 19:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B847C433EF;
 Thu,  2 Mar 2023 19:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677786367;
 bh=1k1EPJ390ArQrsQWvm/55sVNqR78Ofcg58LhQDeXbu8=;
 h=From:To:Cc:Subject:Date:From;
 b=BdbrLxKor7trErTIYLoRPksPhI1Mg6H0Xt+VeZ5/NYPcijHoXKyLOUd2E636nvCzJ
 cpEEQoWC0bWBzGNd47nqckflsDZkg1XB3UCt5HTmVV3E6NOj9RXMEXoVq83OdMaVt1
 m8nG9TFu69ZVD5jGlS1O1uX+LN26X3pOTbOPkcMVxhFiHyWS3eu+MSyl5rNrTtg6xT
 jJjwGFxZie5OyMoAHJRrpLwkF3TZkVjw19eDFHASq0reX1L5zgHbDD2rQ7nFT0IZKo
 8zLDiEy+OXdcsPPq/fjThPSuUTElZF9HHZzP4L6/GxAjUZc6HfKHrHndaMpqnD6J+g
 Jonn49zflG1wQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  2 Mar 2023 11:46:05 -0800
Message-Id: <20230302194605.646472-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's relax this for Android support. Change-Id:
 Ic46593ef429e23b5d85977da374a95015ee72154
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- lib/libf2fs.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pXosX-00DqTf-J2
Subject: [f2fs-dev] [PATCH] f2fs-tools: relax zone size of power of 2
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

Let's relax this for Android support.

Change-Id: Ic46593ef429e23b5d85977da374a95015ee72154
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 lib/libf2fs.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index f63307a42a08..118e12592394 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1045,12 +1045,9 @@ int get_device_info(int i)
 			return -1;
 		}
 
-		if (!is_power_of_2(dev->zone_size)) {
-			MSG(0, "\tError: zoned: illegal zone size %" PRIu64 "u (not a power of 2)\n",
+		if (!is_power_of_2(dev->zone_size))
+			MSG(0, "\tInfo: zoned: zone size %" PRIu64 "u (not a power of 2)\n",
 					dev->zone_size);
-			free(stat_buf);
-			return -1;
-		}
 
 		/*
 		 * Check zone configuration: for the first disk of a
-- 
2.40.0.rc0.216.gc4246ad0f0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
