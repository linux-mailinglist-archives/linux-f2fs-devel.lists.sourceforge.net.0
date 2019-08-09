Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B223D877DB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Aug 2019 12:53:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hw2Wn-0004QR-Fz; Fri, 09 Aug 2019 10:53:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hw2Wk-0004Pv-EX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fE3BQHzomD+7K9lK8U+vCwfz++JFgUowgZ3va75I2Lc=; b=Amqtiq8qDrBySAufHV9fDp/Wkx
 cVwfkhsYEmmfdZL+9EDG3KFMPxskySahvu4EtT+CLBg3TjfV2F1NY4xvtscLlJXV/rDHbld8X5INB
 d5D9ywW/oChK6yFdXhIVmszbYQmwAA9YvKVacyrYf3EADK7HLyAel5RT9TGCYTwHIAAg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fE3BQHzomD+7K9lK8U+vCwfz++JFgUowgZ3va75I2Lc=; b=OdwRJYJRcVigudKq63S8rEXCvv
 vsFA8WwZJtcgzwe7wiwPPkVI5evjYL1tKe0g/IkehIoUj0ifs/yja3mMgN75oU+2fMGGhnvBBivpt
 AenlWCqu3Zi0TQMlgydLbTVyujpH9hJjXORzR5pxhEdPU6+b34u6AFrBgNa2b05+CCSw=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hw2Wi-00HEfp-4E
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:41 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id DC5E7EBDF53620CF9515;
 Fri,  9 Aug 2019 18:53:23 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 9 Aug 2019 18:53:14 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 9 Aug 2019 18:52:59 +0800
Message-ID: <20190809105302.79876-7-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20190809105302.79876-1-yuchao0@huawei.com>
References: <20190809105302.79876-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hw2Wi-00HEfp-4E
Subject: [f2fs-dev] [PATCH 07/10] fsck.f2fs: fix to set large section type
 during allocation
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

During block allocation in large free section, we need to change
all sub segments' type in it, otherwise, we will fail to allocate
block in non-first segment due to mismatch seg-type.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/mount.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 46fe1be..ad20d19 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2393,6 +2393,20 @@ int relocate_curseg_offset(struct f2fs_sb_info *sbi, int type)
 	return 0;
 }
 
+void set_section_type(struct f2fs_sb_info *sbi, unsigned int segno, int type)
+{
+	struct seg_entry *se;
+	unsigned int i;
+
+	if (sbi->segs_per_sec == 1)
+		return;
+
+	for (i = 0; i < sbi->segs_per_sec; i++) {
+		se = get_seg_entry(sbi, segno + i);
+		se->type = type;
+	}
+}
+
 int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left, int type)
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
@@ -2436,8 +2450,11 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left, int type)
 				if (se2->valid_blocks)
 					break;
 			}
-			if (i == sbi->segs_per_sec)
+
+			if (i == sbi->segs_per_sec) {
+				set_section_type(sbi, segno, type);
 				return 0;
+			}
 		}
 
 		if (se->type == type &&
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
