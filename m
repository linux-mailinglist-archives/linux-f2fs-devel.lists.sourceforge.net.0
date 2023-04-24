Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EDA6ED1AA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 17:46:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqyOu-0002E3-9b;
	Mon, 24 Apr 2023 15:46:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lizetao1@huawei.com>) id 1pqyOs-0002Dw-5F
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 15:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nfMNEuRl44uF5Jwgh4trYhfoQd1i+R3ihLAlsMM3FDM=; b=i1pn6ZwClJcVB1su1pcqKD3TMZ
 W5qDjokd6zfanWUHcziCEjo3QZhVs2P9btaO5B21+mCLwVmKT6Lxg7vqhfWJ9/SkpTk0LH2LNkNB4
 msnMy+RSz47u7JSHPlsWSTlwtUyNxvL7K9Wupj4tKvvEvOd/8wm46elJmlOhaeal5w0w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nfMNEuRl44uF5Jwgh4trYhfoQd1i+R3ihLAlsMM3FDM=; b=W
 pxF7efIkYPlvo6uQAeSDqYhrKQVTW5FrGn7P5yO3nG2cQSJARfxGnNGUd9XnHypIZU+00+IfWhJJf
 WeMaCjeNIrbGuK1jR0Wn/TxJrr66+D/GXHO5r+z3kQ/Kn59g51gW8zZwQf0JkV2i0DQKCVSqd2Mb/
 c5XCdoOF4WlA6HAo=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pqyOp-0007PI-2R for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 15:46:45 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Q4qC51sWZz17Trl;
 Mon, 24 Apr 2023 23:42:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 24 Apr
 2023 23:46:31 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 24 Apr 2023 23:46:48 +0000
Message-ID: <20230424234648.577673-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  After the commit "0a4ee518185", this "goto" statement was
 redundant,
 remote it for clean code. Signed-off-by: Li Zetao <lizetao1@huawei.com>
 --- fs/f2fs/data.c | 1 - 1 file changed,
 1 deletion(-) diff --git a/fs/f2fs/data.c
 b/fs/f2fs/data.c index 06b552a0aba2..c9a71b4b09dd 100644 --- a/fs/f2fs/data.c
 +++ b/fs/f2fs/data.c @@ -2171, 7 +2171,
 6 @@ static int f2fs_read_single_page(struct inode *inod [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.255 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.255 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 DATE_IN_FUTURE_06_12   Date: is 6 to 12 hours after Received: date
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1pqyOp-0007PI-2R
Subject: [f2fs-dev] [PATCH -next] f2fs: remove redundant goto statement in
 f2fs_read_single_page()
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
From: Li Zetao via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Li Zetao <lizetao1@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

After the commit "0a4ee518185", this "goto" statement was redundant,
remote it for clean code.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 fs/f2fs/data.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 06b552a0aba2..c9a71b4b09dd 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2171,7 +2171,6 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 	f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
 							F2FS_BLKSIZE);
 	*last_block_in_bio = block_nr;
-	goto out;
 out:
 	*bio_ret = bio;
 	return ret;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
