Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B2425B8A1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Sep 2020 04:16:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kDenJ-0008Tn-Kv; Thu, 03 Sep 2020 02:16:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kDenH-0008Tf-KE
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 02:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t0IePvJctJfetc/ucsuJuX+2hUgrZTDweCX/BlngD90=; b=gFAyE2/BW3SNm0zOxA+GTKddSX
 Uv2laqjlImhWQV84mJKF2vUI2cXaCzGvwI0+SiLZ365fFyjZHMvuoWB+8LU4nxkSR1zX6pzi8kAKz
 YA++u7bClYHSgqeeoDe1HG+/Fe7+QQ8Z2rm9Z8iqvsTqEoGNXF7gYkh3I/443m3Jl2e0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=t0IePvJctJfetc/ucsuJuX+2hUgrZTDweCX/BlngD90=; b=R
 Pj8PRW4MnmbBjzeroBJT4m5FrwTErYuGSVgmO9+iOeBVHw3gz+m+l7YZXLQAGCCyBPxfu9MuOHs7u
 AGvIgHnmjowycFEHxbJAS2/sEufLRQ4jqckwV0X7/96nGhq4CSQj3m6ej1zeTfX5k0fSHaTuw7Qbf
 o7dEym+TbBldKSCk=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kDenF-009uOD-0q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 02:16:07 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8658E86DF3E6611CB73A;
 Thu,  3 Sep 2020 10:15:45 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Thu, 3 Sep 2020 10:15:38 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 3 Sep 2020 10:15:15 +0800
Message-ID: <20200903021515.100621-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kDenF-009uOD-0q
Subject: [f2fs-dev] [PATCH] f2fs: trace: fix typo
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

Fixes a typo from 'compreesed' to 'compressed'.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 include/trace/events/f2fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 06c73f3f6dd2..f8f1e85ff130 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -136,7 +136,7 @@ TRACE_DEFINE_ENUM(CP_RESIZE);
 	__print_symbolic(type,						\
 		{ CP_NO_NEEDED,		"no needed" },			\
 		{ CP_NON_REGULAR,	"non regular" },		\
-		{ CP_COMPRESSED,	"compreesed" },			\
+		{ CP_COMPRESSED,	"compressed" },			\
 		{ CP_HARDLINK,		"hardlink" },			\
 		{ CP_SB_NEED_CP,	"sb needs cp" },		\
 		{ CP_WRONG_PINO,	"wrong pino" },			\
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
