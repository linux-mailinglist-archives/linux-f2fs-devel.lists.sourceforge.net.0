Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 634781955B1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Mar 2020 11:50:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jHmZF-0006hi-0z; Fri, 27 Mar 2020 10:50:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jHmZC-0006hR-6h
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Mar 2020 10:50:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Thapt64gBibUNUikcGgyvDjacVqXIEjZzOM0AvjyjbE=; b=GDnUJpELKGxh43DwGm7jxCzf5J
 1pzYNFvCpj+SXN4Ga6XVFlFSY5Hc3DAqG81B+lw5yvt9eh+siD1vpUGaq2Nx48wbXLRP7114CgOvn
 tLuWdR6zWCUmSQJOLkwn5DIrrDnaJdZlXXRz9Cri5JuBEXGMDxQOPkzGj2d2P1pHAaoU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Thapt64gBibUNUikcGgyvDjacVqXIEjZzOM0AvjyjbE=; b=EiAWc6RK5PvcQVCAIZ70Rj1oj5
 H6ooGElZn73lHVNgN5yjg752QUnuHke+uaxGxoL6gtKL3SdzB7iKIHNg/zko/Jpqv/ATdD2Ha25xG
 fnX/2S2/lQ+8fsxMDGxBT8Z5abwgpLoKNg2bHRPqkXK/DOMRahy3YZ8eFRCgS2ZQjQsQ=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jHmZ7-006CEy-3a
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Mar 2020 10:50:22 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7AE4EB349D00C049249D;
 Fri, 27 Mar 2020 18:30:03 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Fri, 27 Mar 2020 18:29:57 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 27 Mar 2020 18:29:52 +0800
Message-ID: <20200327102953.104035-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20200327102953.104035-1-yuchao0@huawei.com>
References: <20200327102953.104035-1-yuchao0@huawei.com>
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
X-Headers-End: 1jHmZ7-006CEy-3a
Subject: [f2fs-dev] [PATCH 2/3] f2fs: keep inline_data when compression
 conversion
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

We can keep compressed inode's data inline before inline conversion.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/file.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6cb3c6cae7cd..21f7108ca2ba 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1822,11 +1822,6 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 		if (iflags & F2FS_NOCOMP_FL)
 			return -EINVAL;
 		if (iflags & F2FS_COMPR_FL) {
-			int err = f2fs_convert_inline_inode(inode);
-
-			if (err)
-				return err;
-
 			if (!f2fs_may_compress(inode))
 				return -EINVAL;
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
