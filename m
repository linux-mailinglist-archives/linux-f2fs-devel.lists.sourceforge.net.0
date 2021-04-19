Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7823F363977
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Apr 2021 04:45:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lYJv0-0001uW-VL; Mon, 19 Apr 2021 02:45:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wanjiabing@vivo.com>) id 1lYJuz-0001uJ-Ob
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Apr 2021 02:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hdIvNm2Ejv3eHDUNsOoSTKQcVZmZbzSmD9mKdRclFOg=; b=LFYgXKnWTpxNvZIPxwDgZuIyh5
 lQcSvssfPdGhnHiwOBvGuvhzLzoGdo0yg3JPpGQdqdzSOOh4Ml0HUczk+JGrqmNUPZhx0KYKUH65I
 4AVXGcs5bHkaLmg7Ddp+3dZnURjP67N1dZSbfP/pt0jsapMwUcfa7kHY6uHCvr/ijQWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hdIvNm2Ejv3eHDUNsOoSTKQcVZmZbzSmD9mKdRclFOg=; b=O
 mIpp24G+Ynak0jvGDw4QeDz4Zyt3noDHLK97SdvoRTJo9lK/borNaqIMJAkD5WFLarZuCOYsU80A9
 h8NaE4eBubiS7b71P4NV1JeFTFnD5uNTQ64+Zn00n4HU58QBPGqwK0bAcnh986X4ltNr7VDciIKy9
 nnpyplEW92jjBxNs=;
Received: from mail-m17635.qiye.163.com ([59.111.176.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lYJuu-00C6Kr-FX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Apr 2021 02:45:45 +0000
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id B2ECD400253;
 Mon, 19 Apr 2021 10:20:32 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Mon, 19 Apr 2021 10:20:03 +0800
Message-Id: <20210419022003.34172-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQ05MSFYdSRlCGRlLGBhLSxpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mwg6SRw6Cj8QMBVCFxQBCDgw
 OApPFDJVSlVKTUpDTEJDQ0hISU5IVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFKT05PNwY+
X-HM-Tid: 0a78e7edeccad991kuwsb2ecd400253
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.35 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lYJuu-00C6Kr-FX
Subject: [f2fs-dev] [PATCH] fs: f2fs: Remove unnecessary struct declaration
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
Cc: kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

struct dnode_of_data is defined at 897th line.
The declaration here is unnecessary. Remove it.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 fs/f2fs/f2fs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e2d302ae3a46..0757f9e50fd2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3299,7 +3299,6 @@ void f2fs_hash_filename(const struct inode *dir, struct f2fs_filename *fname);
 /*
  * node.c
  */
-struct dnode_of_data;
 struct node_info;
 
 int f2fs_check_nid_range(struct f2fs_sb_info *sbi, nid_t nid);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
