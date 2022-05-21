Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 640AA52FADE
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 May 2022 13:12:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nsN1o-0000HM-Ec; Sat, 21 May 2022 11:12:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <Julia.Lawall@inria.fr>) id 1nsN1n-0000HG-Jz
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 21 May 2022 11:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pMvuUQk6ouYyUeDfElzILUZqqWZeqbowbmPLFy/cJ/8=; b=SfE+WYnDV+y1Hmshj1KuvS5EEl
 xpLNb+7pe1MQwYrzz7kimDpL4XK4ZD8KBHFFKvBpbnXLiXhBcVUhrndjdB4eC6JtvwhdhHqm1dALM
 NOWUmbxRdR5T5ujA1yUcECPlM+7w+lI53Z8ka/kdrJ9G/ggbjvWoGnl+MPJ1kkaIZZr0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pMvuUQk6ouYyUeDfElzILUZqqWZeqbowbmPLFy/cJ/8=; b=U
 dzv40ZBy30oEq+8uG3QQnWIpk/FySV7GOMJgjZBjSuMAXWJkVccRvWicRtlOqrktl9W9k9OT49bi4
 Ky+FCUvAbtu8S4gy78Edr999+7UBcVOhdRmLIZTYaFSW2MDfHqUKGLN4n5g3qYv44EMofu2B+quE/
 mT6RU45yTK+BR1Wo=;
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nsN1k-0002Yt-FH
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 21 May 2022 11:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pMvuUQk6ouYyUeDfElzILUZqqWZeqbowbmPLFy/cJ/8=;
 b=mC8JPiuRm/CgG18mq1ahIyGansXq/h1tacvZ5ZyqOzHKIPLuGtoPPJlH
 DYz7Lq5I8iO0WTGe0+sanpt2BFgE13gVeaNTCiL+o78Dod4+j9sEBreKO
 WhVpmTsJ5w8SoqBFVBiO8Th+a10nsjoZtojXDl1h2JJBp4sz/yuX2JLsp E=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,242,1647298800"; d="scan'208";a="14728001"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 13:12:08 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Sat, 21 May 2022 13:11:43 +0200
Message-Id: <20220521111145.81697-93-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Spelling mistake (triple letters) in comment. Detected with
 the help of Coccinelle. Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
 --- fs/f2fs/f2fs.h | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.134.164.104 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [192.134.164.104 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nsN1k-0002Yt-FH
Subject: [f2fs-dev] [PATCH] f2fs: fix typo in comment
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Spelling mistake (triple letters) in comment.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 fs/f2fs/f2fs.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 154ba142a04d..84a27d5ed039 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1758,7 +1758,7 @@ struct f2fs_sb_info {
 	unsigned int data_io_flag;
 	unsigned int node_io_flag;
 
-	/* For sysfs suppport */
+	/* For sysfs support */
 	struct kobject s_kobj;			/* /sys/fs/f2fs/<devname> */
 	struct completion s_kobj_unregister;
 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
