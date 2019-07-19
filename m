Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B436D980
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jul 2019 05:51:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hoJvm-0002AM-An; Fri, 19 Jul 2019 03:51:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hoJvl-0002AE-E2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jul 2019 03:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xjq9IWsGt0hHtStiHdQrRFDDexXLGBl3z3SITqSlleQ=; b=cb/Ia3nFgGg5qhlM7sO5U4lGEQ
 kDwF5lIP8u6rKGD35OOUD/nO6sLsmWcSIuR2oayh5Hp/lu+HP5ErzR/0M8I5y9Wwp0WiONCHtLwgy
 CABUy/s64f/b++LBP2oGLLqYRtoecVAeDSlW5qKeoOjwK5hkfv1E4kXjHvcv1h2ZDj0M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Xjq9IWsGt0hHtStiHdQrRFDDexXLGBl3z3SITqSlleQ=; b=J
 S/EKPU06IKEJVCCh38Jx1Wa33UkL03TQEXaUXg+VDnXaXyVccXUqigieT5Fd2dhW45k8rCdK0voNt
 JQbWmjawtki/+QN3gWH+SyB5vCCW8sptrLeZvoXDlleIHdkKJ+OwPkCxL7Y7MX5fOcUi6jmhz7b3n
 lsAqXR/lFbDyCUqE=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hoJvh-006yEJ-NB
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jul 2019 03:51:37 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E10FE1544804BADD5D11;
 Fri, 19 Jul 2019 11:51:24 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 19 Jul 2019 11:51:17 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 19 Jul 2019 11:51:11 +0800
Message-ID: <20190719035111.121961-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
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
X-Headers-End: 1hoJvh-006yEJ-NB
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid tagging SBI_QUOTA_NEED_REPAIR
 incorrectly
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

On a quota disabled image, with fault injection, SBI_QUOTA_NEED_REPAIR
will be set incorrectly in error path of f2fs_evict_inode(), fix it.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index a33d7a849b2d..d1998ddf14fd 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -693,7 +693,8 @@ void f2fs_evict_inode(struct inode *inode)
 
 	if (err) {
 		f2fs_update_inode_page(inode);
-		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
+		if (dquot_initialize_needed(inode))
+			set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
 	}
 	sb_end_intwrite(inode->i_sb);
 no_delete:
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
