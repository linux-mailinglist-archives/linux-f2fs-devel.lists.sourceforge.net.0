Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 166275F6A5D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Oct 2022 17:14:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ogSaB-0002mc-0h;
	Thu, 06 Oct 2022 15:14:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ogSa9-0002mM-Gg
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Oct 2022 15:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tVZNbjbAFyOq3f3u6PzK5DhF687jpZdTNELUXxxTZwI=; b=iRURBDr5xUATBxIqJVJIxFwyQ1
 kPeWJXEM71W7j/fBb6rIwB83LxxMsznNpVRHVRk2Xf3D+vANAgCgvjzlT5IM2joQBc0/wC5OoRc+G
 EfZd0o6uFU2mfFCYD4asi9rtgnUxtxpPREeyULzftxNuimfpAjlRcGYkjkOwfOLr4w6U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tVZNbjbAFyOq3f3u6PzK5DhF687jpZdTNELUXxxTZwI=; b=I
 iVth1XU20rpO5TuYWnKJ9fUcQYYh7g3md4CcMzmRoNwcSlEZlvOs4RQJq00du3qZY1x79rLbvC2Ed
 21iW/0HoEDr11PH4uiHFp/MLEOHDKUFT5H1TGmjgqfZIOBzvd2EwABpl4MayK+uVRSsA5wet9/TjN
 0KjsXvW7KbPkSsbk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ogSa8-0006qb-TH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Oct 2022 15:14:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A24DFB820D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Oct 2022 15:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAD4C433D6;
 Thu,  6 Oct 2022 15:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665069273;
 bh=iWa1rm6SdQ2WK8Wust6X3A7TVGiD5e+VeSaAdtLkQuw=;
 h=From:To:Cc:Subject:Date:From;
 b=MEYApFcs7c2zP6aIDq3MKt+SQH8lpFSTZ6LLi8pk5mjmYUCKDrHbW8n5txPc6acX5
 oZS1LD/Ap+jhUnluF4fMv8yYgu+5uD3ZXORGDAu7WpwQusnT2qO4TzvadBkpQAis/V
 ecIPCWRnsGUri4dnBsubtl0eKJA3hNqki5WhXmxJ70ICvrYUEHlyazXb7HCX+J0d51
 GYE6XlBSTXD5Kv4h+JGQf7XTcA+2nOgmKONnmhF7LWeZfVIfIOlzMX8Maq9dO84FiR
 vDz2jXtb1dRZSjl0KZiXHzMQWBs1c1S+uleAsW3020b2zbDcR0jznefmUigdrG+tUM
 NcV8nHgXKMvng==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu,  6 Oct 2022 23:14:28 +0800
Message-Id: <20221006151428.57561-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  fs/f2fs/super.c:3886:6: warning: no previous prototype for
 'f2fs_record_stop_reason' [-Wmissing-prototypes] Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/super.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ogSa8-0006qb-TH
Subject: [f2fs-dev] [PATCH] f2fs: fix compile warning
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

fs/f2fs/super.c:3886:6: warning: no previous prototype for 'f2fs_record_stop_reason' [-Wmissing-prototypes]

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index fad333881ea2..2908d41ed462 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3884,7 +3884,7 @@ static void save_stop_reason(struct f2fs_sb_info *sbi, unsigned char reason)
 	spin_unlock(&sbi->error_lock);
 }
 
-void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
+static void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
 	int err;
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
