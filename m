Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C025339F0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 May 2022 11:30:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ntnLX-0002nt-7D; Wed, 25 May 2022 09:30:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <yuyufen@huawei.com>) id 1ntnLU-0002nn-1J
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 May 2022 09:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TPCi7ltVeNt5jE/ueUWv8Hcotudrsc231tJj33CYA98=; b=kQHIqbUIbLM9GNXw9raFkQ83mL
 0H6Flv491uEOzBo/Bp94J7C9VnNxrknADJD0f8W/UTgCJUK1noftV7mmJdtQGf3JRjLWHKeddVV7O
 UZJl+mFIYX4C2WAnE8b13LGySkEpSdsmn5oonGh8y0i9JNrxUQYwXYtghjwDgd9LDp+g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TPCi7ltVeNt5jE/ueUWv8Hcotudrsc231tJj33CYA98=; b=N
 suYz+E/dh+2u+fmr59HILb9lw51jCwPmZRvS7IAui4T41RChEpOS/17QDQFsE1DNBYoebNkdlrV3R
 JxyKHPJEgs3Y9/nDZ1hvXUcDrMQY9TPK0s4S35NS+RhjMlM3S/nZ9Xr5kN+yqpKNhtKuSgUUUkC5K
 pjOudDJLudToQwGQ=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ntnLO-0001wv-9k
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 May 2022 09:30:22 +0000
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L7QkX5ycyzjX4P;
 Wed, 25 May 2022 17:29:24 +0800 (CST)
Received: from dggpeml500009.china.huawei.com (7.185.36.209) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 25 May 2022 17:30:07 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500009.china.huawei.com
 (7.185.36.209) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 25 May
 2022 17:30:07 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 25 May 2022 17:43:35 +0800
Message-ID: <20220525094336.2489995-1-yuyufen@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500009.china.huawei.com (7.185.36.209)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We have define 'fi' at the begin of function do_read_inode(),
 just use it, rather than use F2FS_I(inode) again. Signed-off-by: Yufen Yu
 <yuyufen@huawei.com> --- fs/f2fs/inode.c | 8 ++++---- 1 file changed,
 4 insertions(+), 4 deletions(-) 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1ntnLO-0001wv-9k
Subject: [f2fs-dev] [PATCH 1/2] f2fs: replace F2FS_I(inode) by the local
 variable
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
From: Yufen Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yufen Yu <yuyufen@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We have define 'fi' at the begin of function do_read_inode(),
just use it, rather than use F2FS_I(inode) again.

Signed-off-by: Yufen Yu <yuyufen@huawei.com>
---
 fs/f2fs/inode.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 83639238a1fe..9bad349be9cc 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -466,10 +466,10 @@ static int do_read_inode(struct inode *inode)
 		}
 	}
 
-	F2FS_I(inode)->i_disk_time[0] = inode->i_atime;
-	F2FS_I(inode)->i_disk_time[1] = inode->i_ctime;
-	F2FS_I(inode)->i_disk_time[2] = inode->i_mtime;
-	F2FS_I(inode)->i_disk_time[3] = F2FS_I(inode)->i_crtime;
+	fi->i_disk_time[0] = inode->i_atime;
+	fi->i_disk_time[1] = inode->i_ctime;
+	fi->i_disk_time[2] = inode->i_mtime;
+	fi->i_disk_time[3] = fi->i_crtime;
 	f2fs_put_page(node_page, 1);
 
 	stat_inc_inline_xattr(inode);
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
