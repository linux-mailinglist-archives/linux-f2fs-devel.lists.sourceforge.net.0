Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ADE26F314
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Sep 2020 05:04:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kJ6h8-00050j-GS; Fri, 18 Sep 2020 03:04:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kJ6h7-00050c-Cg
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Sep 2020 03:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SoUiSyDAiXamTuSTWd6yFf/QgBlckA+zgLy4lp0oq6M=; b=l5gWoKpdVOVzr4ag/BL6CotPA6
 AbVAF1XpmTLMB3iSKvmnH5VzLKfelqiPpj/hskjDC1yVc2lKGCV6+EwD1pEwrN29yL61KsbTWJWcZ
 GoaFVF7RDSZ5nuKcD+nOTUhedfukJK9TYl90iNj0gmc0f5D928kankwkVL811+p7MmfE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SoUiSyDAiXamTuSTWd6yFf/QgBlckA+zgLy4lp0oq6M=; b=M
 zTqF6ismAoPPKhRDYg7iiBUqURJ47CCIq5O/SKkFBREuWhZIVKDSAiy0LKXizS1KZrs2/9Lt5WEI7
 rbdKYUbVXRp49uzmvsHFwz8DTNHT5IGv/L143IIQ2YZlJltgrkNlJ9F7QsJGTcXm35VNi+q5K59GI
 AN67S8p8tP0gif0E=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kJ6h2-00DkUs-8c
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Sep 2020 03:04:17 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 59F21602F5A3BE675A3B;
 Fri, 18 Sep 2020 11:04:03 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Fri, 18 Sep 2020 11:03:54 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 18 Sep 2020 11:03:49 +0800
Message-ID: <20200918030349.19667-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kJ6h2-00DkUs-8c
Subject: [f2fs-dev] [PATCH] f2fs: compress: fix to disallow enabling
 compress on non-empty file
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

Compressed inode and normal inode has different layout, so we should
disallow enabling compress on non-empty file to avoid race condition
during inode .i_addr array parsing and updating.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/file.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 58e464cc15f0..139fdfc1dc55 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1821,6 +1821,8 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 		if (iflags & F2FS_COMPR_FL) {
 			if (!f2fs_may_compress(inode))
 				return -EINVAL;
+			if (inode->i_size)
+				return -EINVAL;
 
 			set_compress_context(inode);
 		}
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
