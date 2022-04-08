Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A54BB4F8D4A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Apr 2022 07:44:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nchPi-0004Hl-4M; Fri, 08 Apr 2022 05:44:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dzm91@hust.edu.cn>) id 1nchPg-0004Ha-Om
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Apr 2022 05:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fCd8fFcmC3MxMth2q/Gkxm9sxVqNUIf55fBEtjQSvHc=; b=i9CdcjgYn6EXr+box8RcyBQU32
 Az2Lgz91qlx8T/YElE2UmqWlWm3wkOTHUqHAWW8ZIl7S8oImEf+65h/kNtRdvKUuQuN9/Zne+Zscv
 HoC16AU5omA/YaRn6QkVx498abtDg3WK0JvXmg1I9gH2Fvr328yA6yhuSjkfcvxR6Hws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fCd8fFcmC3MxMth2q/Gkxm9sxVqNUIf55fBEtjQSvHc=; b=N
 o1cdsngIPBeeNPLaf/4GypqwmK0KATv/TlyeXOuMz0rp82+o3X+HCGukqipg7l3Ta69iAEveqek1+
 jhpn9YnUxYPNN+ryq/dljo+nlRFcBq8WtDdip/j/1vraUn2HGCxQUwkoT3eKlZc955GUMm1c/ZI/C
 rlX/I9MgbtQI2QdU=;
Received: from mail.hust.edu.cn ([202.114.0.240] helo=hust.edu.cn)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nchPc-0001UT-9d
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Apr 2022 05:44:03 +0000
Received: from localhost.localdomain ([222.20.126.44])
 (user=dzm91@hust.edu.cn mech=LOGIN bits=0)
 by mx1.hust.edu.cn  with ESMTP id 2385ME7N017799-2385ME7Q017799
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Fri, 8 Apr 2022 13:22:20 +0800
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Date: Fri,  8 Apr 2022 13:22:06 +0800
Message-Id: <20220408052207.209856-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-FEAS-AUTH-USER: dzm91@hust.edu.cn
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Dongliang Mu <mudongliangabcd@gmail.com> In
 f2fs_is_valid_blkaddr, 
 if type is DATA_GENERIC_ENHANCE or DATA_GENERIC_ENHANCE_READ, it invokes
 WARN_ON(1) not matter blkaddr is in the range or not. 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nchPc-0001UT-9d
Subject: [f2fs-dev] [PATCH] fs: f2fs: remove WARN_ON in f2fs_is_valid_blkaddr
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
Cc: linux-kernel@vger.kernel.org,
 syzbot+763ae12a2ede1d99d4dc@syzkaller.appspotmail.com,
 Dongliang Mu <mudongliangabcd@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Dongliang Mu <mudongliangabcd@gmail.com>

In f2fs_is_valid_blkaddr, if type is DATA_GENERIC_ENHANCE or
DATA_GENERIC_ENHANCE_READ, it invokes WARN_ON(1) not matter
blkaddr is in the range or not.

Fix this by removing WARN_ON.

Note that, syzbot patch testing does not incur any further issues

Reported-by: syzbot+763ae12a2ede1d99d4dc@syzkaller.appspotmail.com
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 fs/f2fs/checkpoint.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index f5366feea82d..521498b2dd8c 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -158,7 +158,6 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
 		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
 			 blkaddr, exist);
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
-		WARN_ON(1);
 	}
 	return exist;
 }
@@ -196,7 +195,6 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 			f2fs_warn(sbi, "access invalid blkaddr:%u",
 				  blkaddr);
 			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			WARN_ON(1);
 			return false;
 		} else {
 			return __is_bitmap_valid(sbi, blkaddr, type);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
