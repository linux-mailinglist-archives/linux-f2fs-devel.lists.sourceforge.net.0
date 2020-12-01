Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 145082C985A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Dec 2020 08:45:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kk0Lq-00087e-Hi; Tue, 01 Dec 2020 07:45:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <huangshuosheng@allwinnertech.com>)
 id 1kk0Lp-00087Y-Ps
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Dec 2020 07:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e1WdFejGM4g6JGubbx6LonI+jZgw0D+1Efd/Yyxdpg8=; b=lwvbTI9sqDCP4yxy733eBdnsDW
 dfOS+ZKj1fHyhuk/yE6N7J/fgMA0lTquMWunTCEq5YXAXrPmReG6Rj9qR1/riC8G+V9qz0oOKuV+4
 r8yrcjmd1FDztWQ3bLTUKbdqkSe19KVk7+Rt9oaQdnWMGbHdY7Yru8zMVrbELl4bCra8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=e1WdFejGM4g6JGubbx6LonI+jZgw0D+1Efd/Yyxdpg8=; b=X
 /40Sf3Y+esyicEDIjuY7qFb6OhPqN4NIgwRegQ48LsphMs3bpiLMw0O7Y9SNGn+5vlHTiOPQVB0Li
 0kYzA+98lk1L/jqd06Z3L4V++Yys3Nroko/BW9tV2Tblhxb8YhUeynNbkDxzbzpCI2CXN/RAZJwQe
 0skWJS1A1L+shUyU=;
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kk0LZ-008goM-9I
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Dec 2020 07:45:29 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3243493|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00467113-0.00219213-0.993137;
 FP=12105205307651440311|1|1|4|0|-1|-1|-1; HT=ay29a033018047192;
 MF=huangshuosheng@allwinnertech.com; NM=1; PH=DS; RN=5; RT=5; SR=0;
 TI=SMTPD_---.J1OSVB1_1606806239; 
Received: from allwinnertech.com(mailfrom:huangshuosheng@allwinnertech.com
 fp:SMTPD_---.J1OSVB1_1606806239)
 by smtp.aliyun-inc.com(10.147.42.135);
 Tue, 01 Dec 2020 15:04:11 +0800
From: Shuosheng Huang <huangshuosheng@allwinnertech.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue,  1 Dec 2020 15:03:57 +0800
Message-Id: <20201201070357.851-1-huangshuosheng@allwinnertech.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [121.197.207.205 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1kk0LZ-008goM-9I
Subject: [f2fs-dev] [PATCH] f2fs: Remove unnecessary unlikely()
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
Cc: tiny.windzz@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yangtao Li <tiny.windzz@gmail.com>

WARN_ON() already contains an unlikely(), so it's not necessary
to use unlikely.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 fs/f2fs/f2fs.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index cb700d797296..9f33a508fe51 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -33,10 +33,8 @@
 #else
 #define f2fs_bug_on(sbi, condition)					\
 	do {								\
-		if (unlikely(condition)) {				\
-			WARN_ON(1);					\
+		if (WARN_ON(condition))					\
 			set_sbi_flag(sbi, SBI_NEED_FSCK);		\
-		}							\
 	} while (0)
 #endif
 
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
