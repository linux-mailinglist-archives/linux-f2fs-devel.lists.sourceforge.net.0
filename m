Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DF95507CB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Jun 2022 02:55:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o2jEF-0008JM-19; Sun, 19 Jun 2022 00:55:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o2jED-0008JF-JL
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 00:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YuGGco15QgIbUxcxeoK+Cdzu9s1C9Cjvgq+Cjhu4N8k=; b=P5iGH89+hR2DLGWNAZSuUAJ7cz
 dOdPsj5um5GzmKWiX7zhYiY7/e1JdI/McGgyW80PrdmfKGyEqHrxI7QZ+sUKzPZxHvh4AmDrv8qqq
 IEfGBNwCOV0RRKmJPMvhwcDUEMiBVTQWtRVYbD4R6AP3VgWxZ6AQH4FQEvzSUiwOTFEo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YuGGco15QgIbUxcxeoK+Cdzu9s1C9Cjvgq+Cjhu4N8k=; b=g
 2MXcd/I6g1+xA3aHd6f1ZO8vJ/Mcwrk3H74BA5on2VACCV2mir34/vj1G0SkdO33xhnkVfB5RUWOV
 7AR5MJVkcwtL0TI8jO8TlQZxO6JlsK66VGNmyQy40aA5fDIE8utSSCN1X9mTUs6TNLIGEE94rRTiF
 XOAgKF69+qlAlWWg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o2jEA-0005bY-C1
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 00:55:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 49DE760DEC;
 Sun, 19 Jun 2022 00:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB3DC3411A;
 Sun, 19 Jun 2022 00:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655600141;
 bh=Y1pY1dTeemIGkfSVJrQX+Eq3dkLnscBf5JndGotxl+w=;
 h=From:To:Cc:Subject:Date:From;
 b=ZddnPrdb25S2Mxs6xdlu3Tfh/9GngPK2LG2wF6CBGjRq8U6gaWJy8/xhLCratMnqa
 U3NS6ZraMnDoa2RroNZRXYiOi2NyKtHi8jsvTbcWGV29kKDHqkAtU+FTg1MrdgT8BC
 cpy7+LjAO5gL79p3ram6orvA97R3fjYnGsyjMJErJ+ByvH3O2siKNHjTzYXHw7jUxD
 eOJyS+Wwz76L+6Jj5unDe/frWDVIRAOCgUIeqM5Sj+4IV4Ml9mF6RG58LNxTEDl1+U
 9k8m6O2xWQFdddSiGbiXdDwhzytcnSBoEm25wX+r4u2z52aw+lprlHOAYPZZ9vKp0W
 xEtmHkH3307Og==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 19 Jun 2022 01:51:55 +0800
Message-Id: <20220618175155.3908-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -4.7 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise, in image which doesn't support compression feature,
 page_array_entry will be initialized w/o use. Signed-off-by: Chao Yu
 <chao.yu@oppo.com>
 --- fs/f2fs/compress.c | 3 +++ 1 file changed, 3 insertions(+) 
 Content analysis details:   (-4.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 1.1 DATE_IN_PAST_06_12     Date: is 6 to 12 hours before Received: date
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o2jEA-0005bY-C1
Subject: [f2fs-dev] [PATCH] f2fs: initialize page_array_entry slab only if
 compression feature is on
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

Otherwise, in image which doesn't support compression feature,
page_array_entry will be initialized w/o use.

Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
 fs/f2fs/compress.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 24824cd96f36..fa237e5c7173 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1908,6 +1908,9 @@ int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi)
 	dev_t dev = sbi->sb->s_bdev->bd_dev;
 	char slab_name[32];
 
+	if (!f2fs_sb_has_compression(sbi))
+		return 0;
+
 	sprintf(slab_name, "f2fs_page_array_entry-%u:%u", MAJOR(dev), MINOR(dev));
 
 	sbi->page_array_slab_size = sizeof(struct page *) <<
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
