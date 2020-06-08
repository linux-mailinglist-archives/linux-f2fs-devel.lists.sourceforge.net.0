Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFBE1F1868
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Jun 2020 14:03:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jiGVJ-0007DO-6f; Mon, 08 Jun 2020 12:03:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jiGVG-0007Cx-7R
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jun 2020 12:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KMY2txQq5UkBvoIs13HsGjnQ7mvFTBcJ54dDX2bdEro=; b=OU+N2GEE6TvCLD6YgQmH7T4qf1
 Mu79nFXAFHEWgIRtpaKfU8fEsrVQCNs9shxz0ypw/5wAAhpnJ+0I7k7qIbzgP9nS0zJrFNk9OOy4Y
 rALl8Rf8ESC2aOKRUuNMzYjwacJyZiJ1OmHX+WGn0O3aHL9S4QLjP+itWpRiG/sRK7RU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KMY2txQq5UkBvoIs13HsGjnQ7mvFTBcJ54dDX2bdEro=; b=C54yxPPCwbVs7X8YC7G/G78owy
 UVqrzUjg6qCoYs9UsgY58ke47a1v4i7ntqjnBShaJUDdY1EYmDhaHqBFWMEM9IEVUaq7R7wDLtr0S
 odEgNyFqOVMoA1PfA/JRD0Cb88kjikMhh4wO0XFSf08Pbij8+PsI0iQNUWDZcqYDtxrs=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jiGVE-00GOur-U5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jun 2020 12:03:46 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CA372969A77F174BC765;
 Mon,  8 Jun 2020 20:03:29 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Mon, 8 Jun 2020 20:03:20 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 8 Jun 2020 20:03:17 +0800
Message-ID: <20200608120317.6716-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20200608120317.6716-1-yuchao0@huawei.com>
References: <20200608120317.6716-1-yuchao0@huawei.com>
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
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jiGVE-00GOur-U5
Subject: [f2fs-dev] [PATCH 2/2] f2fs: remove unused parameter of
 f2fs_put_rpages_mapping()
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

Just cleanup, no logic change.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index a53578a89211..1e02a8c106b0 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -89,8 +89,7 @@ static void f2fs_unlock_rpages(struct compress_ctx *cc, int len)
 	f2fs_drop_rpages(cc, len, true);
 }
 
-static void f2fs_put_rpages_mapping(struct compress_ctx *cc,
-				struct address_space *mapping,
+static void f2fs_put_rpages_mapping(struct address_space *mapping,
 				pgoff_t start, int len)
 {
 	int i;
@@ -942,7 +941,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 
 		if (!PageUptodate(page)) {
 			f2fs_unlock_rpages(cc, i + 1);
-			f2fs_put_rpages_mapping(cc, mapping, start_idx,
+			f2fs_put_rpages_mapping(mapping, start_idx,
 					cc->cluster_size);
 			f2fs_destroy_compress_ctx(cc);
 			goto retry;
@@ -977,7 +976,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 unlock_pages:
 	f2fs_unlock_rpages(cc, i);
 release_pages:
-	f2fs_put_rpages_mapping(cc, mapping, start_idx, i);
+	f2fs_put_rpages_mapping(mapping, start_idx, i);
 	f2fs_destroy_compress_ctx(cc);
 	return ret;
 }
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
