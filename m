Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A42A4189
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Aug 2019 03:40:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3sNN-0007Xg-Od; Sat, 31 Aug 2019 01:40:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <zhengbin13@huawei.com>) id 1i3sNM-0007XR-EO
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Aug 2019 01:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xzwkj6hvcNZtl42YMh32kMkaoIj+vCP6xSl1u/+vKT0=; b=Nl5dfI6Xuv2fJzT8ntBLBQxq5A
 Th22Gj8DJi69LZRqnq413G6QkoVFioABwjbyY9G13Y622PMmheKnwMukbEF7Jp3Ho5RhFCDjXmSl/
 Df5bwhgghcu2a37chjY5Stj05ULnne/hf/1OmdWnMas5H7dfD68ZDk6EEnPtP3mRddRE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Xzwkj6hvcNZtl42YMh32kMkaoIj+vCP6xSl1u/+vKT0=; b=U
 iPQZQGrNuKWKUn3YOUeswQnqtWZV1PzWdjmzynWMJZ8lJeiDntDOO7sqWLksqevGb66ICAY0E1Bbb
 oXvR6p+ssP9bf3wt0gXv2PftJlT9kV6Acqo9oaXTiu3ORoGRjDa2+1Pz22vMbqHzA+OlWvDwwnrJG
 uxV90li3cfCdgN6g=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3sNK-003wdS-DN
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Aug 2019 01:40:24 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 6DC02A4DB7A0A22DA3FD;
 Sat, 31 Aug 2019 09:40:15 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Sat, 31 Aug 2019
 09:40:08 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
Date: Sat, 31 Aug 2019 09:46:51 +0800
Message-ID: <1567216011-43066-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
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
X-Headers-End: 1i3sNK-003wdS-DN
Subject: [f2fs-dev] [PATCH] f2fs: Make f2fs_fname_setup_ci_filename static
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix sparse warning:

fs/f2fs/dir.c:142:6: warning: symbol 'f2fs_fname_setup_ci_filename' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 fs/f2fs/dir.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 9de688a..147fa5a 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -139,9 +139,9 @@ int f2fs_ci_compare(const struct inode *parent, const struct qstr *name,
 	return ret;
 }

-void f2fs_fname_setup_ci_filename(struct inode *dir,
-					const struct qstr *iname,
-					struct fscrypt_str *cf_name)
+static void f2fs_fname_setup_ci_filename(struct inode *dir,
+					       const struct qstr *iname,
+					       struct fscrypt_str *cf_name)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);

--
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
