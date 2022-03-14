Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E764D7B69
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Mar 2022 08:15:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nTevi-0004TO-DI; Mon, 14 Mar 2022 07:15:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <wangxiaojun11@huawei.com>) id 1nTevf-0004T2-65
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Mar 2022 07:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e+5wD+2TxQdBwrjtZmo8X7sq4G5aoslCZQYiZqKuEkU=; b=duPlcFnV0znkIKrM9K96ignYxR
 SJm/Z/8ndQidJly0VcblCrc31hfPz9vmz07J+ZN3Wp5LkNq+tZ9w0FKK0ftPmoGLoTeBCYK2I7SwS
 ioXHeEl+VROvhQDyez6IM8G0wpEK6uHDi+SCHbtU/hGqs1lx7a50qvyNowrOK47wnzl0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=e+5wD+2TxQdBwrjtZmo8X7sq4G5aoslCZQYiZqKuEkU=; b=S
 awnHuOswroveM1uT6S7W9rp/S+i2XKjqmbmqMo5U0gpE3cb8eAlu634dY6SPLDdB4cq18zUo1dweW
 h6UD7dQKI3sQ5BI7vvEZCOobZ69lM8IO1Hk28J9Y7L7cDohUbudHl0vp6OAkBs8LAf7MM6NkEPadP
 Z3c0e3MFq9gkYyrs=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nTevb-000192-0E
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Mar 2022 07:15:41 +0000
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KH77b0lyCzfZ0T;
 Mon, 14 Mar 2022 15:14:03 +0800 (CST)
Received: from huawei.com (10.90.53.225) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Mon, 14 Mar
 2022 15:15:29 +0800
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Mon, 14 Mar 2022 15:15:15 +0800
Message-ID: <20220314071515.93565-1-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  iput() has already judged the incoming parameter, so there
 is no need to repeat the judgment here. Signed-off-by: Wang Xiaojun
 <wangxiaojun11@huawei.com>
 --- fs/f2fs/namei.c | 3 +-- 1 file changed, 1 insertion(+), 2 deletions(-)
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [45.249.212.188 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nTevb-000192-0E
Subject: [f2fs-dev] [PATCH] f2fs: remove redundant parameter judgment
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
From: Wang Xiaojun via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wang Xiaojun <wangxiaojun11@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

iput() has already judged the incoming parameter, so there is
no need to repeat the judgment here.

Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
---
 fs/f2fs/namei.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 5f213f05556d..b7c9b602bd72 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -1107,8 +1107,7 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
 out_old:
 	f2fs_put_page(old_page, 0);
 out:
-	if (whiteout)
-		iput(whiteout);
+	iput(whiteout);
 	return err;
 }
 
-- 
2.26.0.106.g9fadedd



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
