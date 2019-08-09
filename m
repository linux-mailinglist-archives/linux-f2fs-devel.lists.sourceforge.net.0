Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B136877D9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Aug 2019 12:53:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hw2Wb-0007Qe-PX; Fri, 09 Aug 2019 10:53:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hw2Wa-0007Pp-Pp
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=04sWHCFa7o95b2iILVyREcj9vXYkNaSCsOMz5pRoNIQ=; b=d89zP00PupzgtEAUNisy4ulFAe
 BhYGuCmaunutWoblVF6Y+GLMDWFx2SMZAGYPqPshcFobN+EdNaBD40dXP7JIc/sCm5n8vZm4ByLuV
 phbSC92O+UkcLDdGxOkGWoUtCb7owzHYPo/+DACwkIWAwTk0JHurrI5tdWcwa8T5QHwQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=04sWHCFa7o95b2iILVyREcj9vXYkNaSCsOMz5pRoNIQ=; b=ARULysY0KI3xAMoj85JHPpB9oG
 VqUeWTRt7c9SJc48JABmRgPNdLBy4/SSPaYwquuoDlTS0p1sor6t2b5ooiMxnYXGLDneWMlZaJqNH
 zxpL8l5CL8PSXn0AtrU+Vx1ZD2DOVk4l9Ov4GsMowIO5TYTynP23iJ9eHqxeL56iGfm4=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hw2WZ-00FrrC-5k
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:32 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D01523B8103AC28693E9;
 Fri,  9 Aug 2019 18:53:23 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 9 Aug 2019 18:53:16 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 9 Aug 2019 18:53:02 +0800
Message-ID: <20190809105302.79876-10-yuchao0@huawei.com>
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
X-Headers-End: 1hw2WZ-00FrrC-5k
Subject: [f2fs-dev] [PATCH 10/10] f2fs-tools: add missing newline symbol in
 log
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

to show pretty log format.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/segment.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fsck/segment.c b/fsck/segment.c
index 2d18358..b0c6889 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -28,23 +28,23 @@ int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
 	if (old_blkaddr == NULL_ADDR) {
 		if (c.func == FSCK) {
 			if (fsck->chk.valid_blk_cnt >= sbi->user_block_count) {
-				ERR_MSG("Not enough space");
+				ERR_MSG("Not enough space\n");
 				return -ENOSPC;
 			}
 			if (is_node && fsck->chk.valid_node_cnt >=
 					sbi->total_valid_node_count) {
-				ERR_MSG("Not enough space for node block");
+				ERR_MSG("Not enough space for node block\n");
 				return -ENOSPC;
 			}
 		} else {
 			if (sbi->total_valid_block_count >=
 						sbi->user_block_count) {
-				ERR_MSG("Not enough space");
+				ERR_MSG("Not enough space\n");
 				return -ENOSPC;
 			}
 			if (is_node && sbi->total_valid_node_count >=
 						sbi->total_node_count) {
-				ERR_MSG("Not enough space for node block");
+				ERR_MSG("Not enough space for node block\n");
 				return -ENOSPC;
 			}
 		}
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
