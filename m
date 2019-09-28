Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1C4C0F3B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Sep 2019 03:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Date:Message-ID:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IuRVULu3vYjsJtr4hKVOov99BfzGEAPMenmO/HwrzJs=; b=LvSPRcCAp+bROw0KxiK/J44PJ0
	ygsCsQKR5FmcOe1huS2Jh4RHH1EH5cxPO+MZuaR2XslCvWg0vbrpuvmliyCMZFhlhx+Au2uofbS/z
	nX/nD/iD04ywssqMTD98HCXr+fk32z2Ym94ON+5SRM8P2/4EPHU7ehELg66DCbfjAJO4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iE1jA-0001Te-GQ; Sat, 28 Sep 2019 01:40:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cgxu519@zoho.com.cn>) id 1iE1j9-0001TX-8C
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 Sep 2019 01:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z/Zd2Dx+8M9YxzjuDzEXA61Umjs1F7BV//b9y8PQasU=; b=ZjbYR+bDgfKL5pjMkCGdo0ktUI
 G/XjGw+AYtMdUHNOpTAc/660L2Ypaa3n7cukdIXU7JZDoIA4jXHtdIbnVOiYIFCIB0zubT4slB6UH
 kRczMf8toE4Au//gbr67UncJUobnu0Q0v/qYIdzyU47a+ObS2j+Lsk8juB/04KACKi/E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Date:Subject:
 Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z/Zd2Dx+8M9YxzjuDzEXA61Umjs1F7BV//b9y8PQasU=; b=B2awBfjfcG7itz4KSB1Px2Dmvh
 9eKB0m+CikcSjjzxkAB5jcaTwhGruW7n56kDKZJTXPmbe2hTbN/vHN+Kb30OcxUqzkyaSvJHPldTH
 UPKk1bIfxwktGYNLHmpkBYx5geecwKTNKQHw0U8EFU/VgROC6eI5Ju51jQwLwq3qB5Sc=;
Received: from sender2-pp-o92.zoho.com.cn ([163.53.93.251])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1iE1j5-009FXS-N1
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 Sep 2019 01:40:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1569634824; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=oBUYXpD/EKNCwI75ZR++ns9J0nUR4ywmZZMo3MVGn5pZ3VDTVkM2Y2DAR4Ljj6RRe/4LYiDkKw6kE8ZXqrFpTUtOwxC85iflP3IYaQU8rUaBbR+ccELQa9PCK43qvSvSRp93HMUm7ghyPI7lAPY7xXYxvo4ArM90yJyB5Fn7248=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1569634824;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To:ARC-Authentication-Results;
 bh=Z/Zd2Dx+8M9YxzjuDzEXA61Umjs1F7BV//b9y8PQasU=; 
 b=nu9bCNDCw1OJQfEDS3+hDjFdyRBZmhEDc8oeY6zcCd/+/XLrdhMbB09Pvl6Uks2JJ3p9qgJ62WdrWkcxV3DBrX7vAmdib/6icRHLOOtBoHa7KwlzS8Sb4NxZsl/LuWGcDnsI3Vv9lrCzJ6qFxl/x5MPQi4PorQLUcBauWDaK2Ts=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=zoho.com.cn;
 spf=pass  smtp.mailfrom=cgxu519@zoho.com.cn;
 dmarc=pass header.from=<cgxu519@zoho.com.cn> header.from=<cgxu519@zoho.com.cn>
Received: from localhost.localdomain.localdomain (113.87.90.57 [113.87.90.57])
 by mx.zoho.com.cn with SMTPS id 1569634823931429.34589677329586;
 Sat, 28 Sep 2019 09:40:23 +0800 (CST)
To: jaegeuk@kernel.org,
	chao@kernel.org
Message-ID: <20190928014006.8243-1-cgxu519@zoho.com.cn>
Date: Sat, 28 Sep 2019 09:40:06 +0800
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-ZohoCNMailClient: External
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [163.53.93.251 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: zoho.com.cn]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1iE1j5-009FXS-N1
Subject: [f2fs-dev] [PATCH] f2fs: fix a comment in f2fs_shrink_count()
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
From: Chengguang Xu via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chengguang Xu <cgxu519@zoho.com.cn>
Cc: Chengguang Xu <cgxu519@zoho.com.cn>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix a mismatched comment in f2fs_shrink_count().

Signed-off-by: Chengguang Xu <cgxu519@zoho.com.cn>
---
 fs/f2fs/shrinker.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index a467aca29cfe..d66de5999a26 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -58,7 +58,7 @@ unsigned long f2fs_shrink_count(struct shrinker *shrink,
 		/* count extent cache entries */
 		count += __count_extent_cache(sbi);
 
-		/* shrink clean nat cache entries */
+		/* count clean nat cache entries */
 		count += __count_nat_entries(sbi);
 
 		/* count free nids cache entries */
-- 
2.21.0





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
