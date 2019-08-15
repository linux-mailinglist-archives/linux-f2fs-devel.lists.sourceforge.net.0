Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C37898EA8E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Aug 2019 13:46:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hyECl-00086x-0d; Thu, 15 Aug 2019 11:46:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hyECj-00086f-Tk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Aug 2019 11:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H8hso6h41SuOcXXoMTp7X4tfzApATQRbyPwxXuHaSps=; b=GGsgxcH+SCS5aZsQ7HjG8hzLcI
 Cok+FaiXha3xPbJKA0b/IGopDExWkZIeXTJiBq9nkRpSW31zx0Po7+er9w2tyZWx9fvVtcQymDvNt
 8u9clPyoQqs94F27xykKOof37f18IQPTyiV423NLDMqx9eb++lw0cs2ct4EpMZbAqmJQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H8hso6h41SuOcXXoMTp7X4tfzApATQRbyPwxXuHaSps=; b=gRXRdtAciO7xbCMa0FbKF2lD6M
 Me0tWtBITcg0N4xt+9kew/t/ffq9JsuqchKGptSDTSdp5pAdlSHfpguwsiaw3tK82Lglyh7fB4Tai
 dVpANVfG7251KUHAoPCDft32inDEsqhXpGGEUot1N4ztkfIOaccchlFlb+ql0DxjQPhw=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hyECh-004TKy-TG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Aug 2019 11:46:05 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 00F349C9855E94F96FF4;
 Thu, 15 Aug 2019 19:45:57 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Thu, 15 Aug 2019 19:45:49 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 15 Aug 2019 19:45:36 +0800
Message-ID: <20190815114536.114255-3-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20190815114536.114255-1-yuchao0@huawei.com>
References: <20190815114536.114255-1-yuchao0@huawei.com>
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
X-Headers-End: 1hyECh-004TKy-TG
Subject: [f2fs-dev] [PATCH 3/3] f2fs: fix to use more generic EOPNOTSUPP
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

EOPNOTSUPP is widely used as error number indicating operation is
not supported in syscall, and ENOTSUPP was defined and only used
for NFSv3 protocol, so use EOPNOTSUPP instead.

Fixes: 0a2aa8fbb969 ("f2fs: refactor __exchange_data_block for speed up")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index b3937a6497d9..64469555e774 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1034,7 +1034,7 @@ static int __read_out_blkaddrs(struct inode *inode, block_t *blkaddr,
 
 			if (test_opt(sbi, LFS)) {
 				f2fs_put_dnode(&dn);
-				return -ENOTSUPP;
+				return -EOPNOTSUPP;
 			}
 
 			/* do not invalidate this block address */
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
