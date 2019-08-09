Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D91D8877D8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Aug 2019 12:53:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hw2Wb-0007QJ-Jg; Fri, 09 Aug 2019 10:53:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hw2Wa-0007Pe-E7
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ECPVXppZwKAwRk3r0GfgMemg4MoD1l7/MnfWcKJC97A=; b=QWu7I2HOogtJdsuoV4L4H2XRNT
 oKoLXKCfRFf0MZ7ZWuhQ4L5wS5ciaCuEbrX/LsMa+iktHYepMNVx4OlaWLFhExNsj3V+ySrGUZpUE
 zzZliUM/pv+/5H1lGoRD5n1i1NoaE23upX9mrf6OIfpVgRggGir8Q/R6XUA3GRtcK3nQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ECPVXppZwKAwRk3r0GfgMemg4MoD1l7/MnfWcKJC97A=; b=FQTsaKEw8rwQ/ayKHmWpmJy2xt
 fpvX3+zcM/3M/KnjLuStdTKUHu/va1cGY0xMIFeqInV2zWVp6A/mm/x+V7Ye39EQUVCN4RFmgNgjw
 IZsyOzqNuNYj1WJ5JycGKaJnuaD8c/WtNLKupsbKjlGMeRD93iGKJE1RAwwJl+NjU6R8=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hw2WZ-00GHD0-7K
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:32 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C665C1CADFFBC26904CA;
 Fri,  9 Aug 2019 18:53:23 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 9 Aug 2019 18:53:14 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 9 Aug 2019 18:53:00 +0800
Message-ID: <20190809105302.79876-8-yuchao0@huawei.com>
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
X-Headers-End: 1hw2WZ-00GHD0-7K
Subject: [f2fs-dev] [PATCH 08/10] f2fs-tools: advise to mount unclean image
 to replay journal
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

For defrag, resize, sload tools, let's advise to mount unclean
image to replay journal first in order to not lose any fsynced
data.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/mount.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index ad20d19..6e950bd 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2969,6 +2969,12 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 	}
 	cp = F2FS_CKPT(sbi);
 
+	if (c.func != FSCK && c.func != DUMP &&
+		!is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG)) {
+		ERR_MSG("Mount unclean image to replay log first\n");
+		return -1;
+	}
+
 	print_ckpt_info(sbi);
 
 	if (c.quota_fix) {
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
