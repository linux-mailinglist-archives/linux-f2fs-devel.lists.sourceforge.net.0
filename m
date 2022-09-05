Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F0C5AD482
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Sep 2022 16:09:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oVCnK-0000jH-Jc;
	Mon, 05 Sep 2022 14:09:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oVCmy-0000ig-Pm
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Sep 2022 14:09:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NJGaN4lgvtBRqdMB40dL/uyPRX05nXeiPW8E8KXnwxE=; b=m1a8I5iTso4pSM0Q30Rlv22IZC
 cO20B1f48SoOTRJoN+HQPzFJzBs4yQ9m3w7vUuIeiy45r/az8WRdrIIXdzRrhdJ0ZGPu5FD7NmbPu
 2zZ5qwVDdOECbJpq8pXorBmxnVl0HcJlaKeXQ2fp4J6CdoCTsKGQO0V41UeMjzNQauWQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NJGaN4lgvtBRqdMB40dL/uyPRX05nXeiPW8E8KXnwxE=; b=S
 HP3X1fY6SQksE+AqTlkIGZYq3+GApnRjtmjD5bB3/vYcmm6vKE1ihVX78ulEItVRAIFyE0Ubql0u5
 ncphJULbBknk7rRSKN9pPvFf24CuUVhSTuo5zCTLsLn2Vns2cPuTW742H1LSuCKTvBE9bxegTWryj
 JS4ZcgLE9vTgGY0k=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oVCmb-0004mW-U2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Sep 2022 14:09:13 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MLqyJ1LsSzZcJN;
 Mon,  5 Sep 2022 22:04:24 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 5 Sep 2022 22:08:52 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 5 Sep
 2022 22:08:51 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 5 Sep 2022 22:12:25 +0800
Message-ID: <20220905141225.26456-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  We should not increase total hit count when not found the
 entry in cache extent tree. Remove the stat_inc_total_hit when
 f2fs_lookup_rb_tree
 returns nullptr. Fixes:54c2258cd63a8 ("f2fs: extract rb-tree operation
 infrastructure")
 Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com> ---
 fs/f2fs/extent_cache.c
 | 3 ++- 1 file changed, 2 insertions(+), 1 delet [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oVCmb-0004mW-U2
Subject: [f2fs-dev] [PATCH -next] f2fs: total hit count should only be
 increased when entry found
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
From: Zhang Qilong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zhang Qilong <zhangqilong3@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We should not increase total hit count when not
found the entry in cache extent tree. Remove the
stat_inc_total_hit when f2fs_lookup_rb_tree returns
nullptr.

Fixes:54c2258cd63a8 ("f2fs: extract rb-tree operation infrastructure")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 fs/f2fs/extent_cache.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 866e72b29bd5..264682eebcd1 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -426,6 +426,7 @@ static bool f2fs_lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
 		*ei = et->largest;
 		ret = true;
 		stat_inc_largest_node_hit(sbi);
+		stat_inc_total_hit(sbi);
 		goto out;
 	}
 
@@ -447,8 +448,8 @@ static bool f2fs_lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
 	}
 	spin_unlock(&sbi->extent_lock);
 	ret = true;
-out:
 	stat_inc_total_hit(sbi);
+out:
 	read_unlock(&et->lock);
 
 	trace_f2fs_lookup_extent_tree_end(inode, pgofs, ei);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
