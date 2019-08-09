Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5947A877D6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Aug 2019 12:53:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hw2Wb-0004On-2t; Fri, 09 Aug 2019 10:53:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hw2Wa-0004Of-B4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B+K2UpdrtZmLfkd8pWf6GiI+fH3aP5ufo6kbHP5JC3w=; b=cn4u5AFoKckIG8eyDFyQZb8zqb
 ZSGdSSSrv89jvOdWnC5QQBhvhQZFL0L/M1TrtojuMevS6ABYaMDdDOX6spcQ5q1DW2oP+Li4ndApC
 goy82zZvhcEJdS1wandMWT5KCPBKb/KuHi0ebOwSVrI+DuvSsIjm9J+1GxzAZNpb4XJU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B+K2UpdrtZmLfkd8pWf6GiI+fH3aP5ufo6kbHP5JC3w=; b=H0FrvbqDZtV2aJ3glc2s2aArG4
 j9xu0TSz+2ubSM/hIOoXx5CxoRFP72jzZH6GTCdUf7Uj6ZbobKnkqgcEh7ouReBU15Ku4RMC71DjC
 CHFQ7BzwLxGcHXs33EL64choYKec3jiOoAAqbh7WoHJqh8nH2+adOUCTOjypbwugMm84=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hw2WZ-00HEfC-2T
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:32 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D823B7356C5E59AAF52C;
 Fri,  9 Aug 2019 18:53:23 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 9 Aug 2019 18:53:15 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 9 Aug 2019 18:53:01 +0800
Message-ID: <20190809105302.79876-9-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20190809105302.79876-1-yuchao0@huawei.com>
References: <20190809105302.79876-1-yuchao0@huawei.com>
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
X-Headers-End: 1hw2WZ-00HEfC-2T
Subject: [f2fs-dev] [PATCH 09/10] fsck.f2fs: fix to propagate error of
 write_dquots()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Propagate correct error number from write_dquots() to
quota_write_inode().

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/mkquota.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fsck/mkquota.c b/fsck/mkquota.c
index c1abbc4..84f9d3d 100644
--- a/fsck/mkquota.c
+++ b/fsck/mkquota.c
@@ -42,10 +42,11 @@ static void print_dquot(const char *desc, struct dquot *dq)
 #define print_dquot(...)
 #endif
 
-static void write_dquots(dict_t *dict, struct quota_handle *qh)
+static int write_dquots(dict_t *dict, struct quota_handle *qh)
 {
 	dnode_t		*n;
 	struct dquot	*dq;
+	int retval = 0;
 
 	for (n = dict_first(dict); n; n = dict_next(dict, n)) {
 		dq = dnode_get(n);
@@ -53,10 +54,13 @@ static void write_dquots(dict_t *dict, struct quota_handle *qh)
 			print_dquot("write", dq);
 			dq->dq_h = qh;
 			update_grace_times(dq);
-			if (qh->qh_ops->commit_dquot(dq))
+			if (qh->qh_ops->commit_dquot(dq)) {
+				retval = -1;
 				break;
+			}
 		}
 	}
+	return retval;
 }
 
 errcode_t quota_write_inode(struct f2fs_sb_info *sbi, enum quota_type qtype)
@@ -83,7 +87,7 @@ errcode_t quota_write_inode(struct f2fs_sb_info *sbi, enum quota_type qtype)
 		if (retval) {
 			log_debug("Cannot initialize io on quotafile");
 		} else {
-			write_dquots(dict, h);
+			retval = write_dquots(dict, h);
 			quota_file_close(sbi, h, 1);
 		}
 	}
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
