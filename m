Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A175668731C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Feb 2023 02:42:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNOby-0004Sx-6i;
	Thu, 02 Feb 2023 01:42:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yang.lee@linux.alibaba.com>) id 1pNObv-0004ST-UC
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 01:41:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Um+1mBfdR8lP4Bbu7l7NnGNwU6JIehtXCNiZx3e/Ck=; b=Qanj1I4Zzu/8WCdzHr/1gEFvRc
 J/8kiS5obLDXCQngBmJN7kupjy8HtU5y5J1/9z4bUg+wCO6l/6la5ngTvwbbDw73S4R52nEcZlWJQ
 fWSmLbdTTae1C25VdR67Ww2k4KAjUPHNtBuoWBSTcRHeUzg3nNoIUfWmWRP+vZ0Dtzsg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9Um+1mBfdR8lP4Bbu7l7NnGNwU6JIehtXCNiZx3e/Ck=; b=c
 fzKKld7f55ZaznhU5HNux4RM151n3116rP8l8sAO3DDP82kTh81kWCkyVrI0UtAuZ7Bqboy0QAJoP
 merichHnVZ+K5ppm08gX2WheK7sKRHU3TLKHyUu4tkN2HzPxJfsMjp63kCCe6k0hziF96Krf6KtMb
 mXUZ+txFL8dMitQI=;
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNObt-007xrf-6T for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 01:41:59 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R551e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VaiLIr6_1675299672; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VaiLIr6_1675299672) by smtp.aliyun-inc.com;
 Thu, 02 Feb 2023 09:01:13 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: jaegeuk@kernel.org
Date: Thu,  2 Feb 2023 09:01:11 +0800
Message-Id: <20230202010111.69078-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-Spam-Score: -8.0 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: ./fs/f2fs/checkpoint.c:1485:55-56: Unneeded semicolon
 Reported-by: Abaci Robot <abaci@linux.alibaba.com> Link:
 https://bugzilla.openanolis.cn/show_bug.cgi?id=3925
 Signed-off-by: Yang Li <yang.lee@linux.alibaba.com> --- fs/f2fs/checkpoint.c
 | 2 +- 1 file [...] 
 Content analysis details:   (-8.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [115.124.30.131 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [115.124.30.131 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 welcome-list
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
X-Headers-End: 1pNObt-007xrf-6T
Subject: [f2fs-dev] [PATCH -next] f2fs: Remove unneeded semicolon
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
Cc: Abaci Robot <abaci@linux.alibaba.com>, Yang Li <yang.lee@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

./fs/f2fs/checkpoint.c:1485:55-56: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3925
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 fs/f2fs/checkpoint.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index b1b39c17f2d8..b7ef8cd10b10 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1482,7 +1482,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	for (i = 0; i < NR_CURSEG_DATA_TYPE; i++) {
 		struct curseg_info *curseg = CURSEG_I(sbi, i + CURSEG_HOT_DATA);
 
-		ckpt->cur_data_segno[i] = cpu_to_le32(curseg->segno);;
+		ckpt->cur_data_segno[i] = cpu_to_le32(curseg->segno);
 		ckpt->cur_data_blkoff[i] = cpu_to_le16(curseg->next_blkoff);
 		ckpt->alloc_type[i + CURSEG_HOT_DATA] = curseg->alloc_type;
 	}
-- 
2.20.1.7.g153144c



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
