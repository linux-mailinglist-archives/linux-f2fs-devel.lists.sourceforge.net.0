Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3789D2A5E37
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Nov 2020 07:43:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kaCWR-00027x-9T; Wed, 04 Nov 2020 06:43:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kaCWP-00027d-50
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Nov 2020 06:43:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=emGDw4sf0R+y7qG3ui4I1SNddsQ6uq9/SNXPre63a9k=; b=DN6WgYlohvGKMov2CWzRs/V57+
 pdk0O2bsG+5ByourfWVgqbWNyDJDJMRyTyYbBzeSEt/zI/jG4dYucxwjL/qenzhXP/q2s9V7nNdaL
 aIt5UBqnSZyQcDt5ac908Mxfb+vhdYumQAcActyIejfjYK84MM7uCTRUG82xeDhd7MrQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=emGDw4sf0R+y7qG3ui4I1SNddsQ6uq9/SNXPre63a9k=; b=P
 TEssWXuF9kv/wDi8q7KZurgvQmZW32wglNb9wAhNRMUIYKGyyCe3lG/oreomIdQbBm/KhQuGXjohb
 zBg4jMwFMFn4Rs8tYwNmNREPWaoHoQSyvgtvRnTvpBSJeeBUi8JasUfvYBTeOmufaauQ6+LsYMQVq
 nPU1GBZLws91Gf+w=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kaCWB-000sKd-Dp
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Nov 2020 06:43:52 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CQxtm1GG2zhZN1;
 Wed,  4 Nov 2020 14:43:28 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Wed, 4 Nov 2020 14:43:21 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 4 Nov 2020 14:43:09 +0800
Message-ID: <20201104064310.15769-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kaCWB-000sKd-Dp
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: avoid unneeded data copy in
 f2fs_ioc_move_range()
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

Fields in struct f2fs_move_range won't change in f2fs_ioc_move_range(),
let's avoid copying this structure's data to userspace.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/file.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 52417a2e3f4f..22ae8ae0072f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2898,12 +2898,6 @@ static int f2fs_ioc_move_range(struct file *filp, unsigned long arg)
 					range.pos_out, range.len);
 
 	mnt_drop_write_file(filp);
-	if (err)
-		goto err_out;
-
-	if (copy_to_user((struct f2fs_move_range __user *)arg,
-						&range, sizeof(range)))
-		err = -EFAULT;
 err_out:
 	fdput(dst);
 	return err;
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
