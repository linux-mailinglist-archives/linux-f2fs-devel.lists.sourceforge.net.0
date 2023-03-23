Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7296C726D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 22:39:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfSei-0002He-6P;
	Thu, 23 Mar 2023 21:39:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pfSeg-0002HT-Ix
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 21:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yybaM4YIcDzuIhMj6qlTkhcBm4Gw0gal0LIhlGtgFh8=; b=Yhx7HjL2y2UiO9PDfSa9JzqPlC
 1PDpwcqPnwo8H5ot2dige61ieD27MwG3tTTBlifLb2iAHAwLpZ6cTAvNBbi57mBvemmXDeHGCynCq
 t0ROkwBwNfxxhHI+6cA5LIgQqVR8rfSTLL2NHRl8DTTy0489TDdAHiGOUbi0Vx2lrR88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yybaM4YIcDzuIhMj6qlTkhcBm4Gw0gal0LIhlGtgFh8=; b=J
 /m/2hvGYodqYs80EATUQMOXf1rC8z/u88kDSAAhXghG36FlK2ZDPWLpg8TY0jzWjAoVHWtg5ddTv1
 GQH2iXnj2jH5rwrM9jcY1MWKMEqlQvjQu/PR/syKJEAqsg1h1zsqifGe8dodxxSWQFK5a4aTkXILO
 cI19cNtK4dNMXRl0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfSee-00030D-LJ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 21:39:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4129628D8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Mar 2023 21:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F247AC433D2;
 Thu, 23 Mar 2023 21:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679607561;
 bh=2wm98QIcutJIPgtolx5FVuBVp/ZTzCYN6ELSU1GVJ+E=;
 h=From:To:Cc:Subject:Date:From;
 b=VgfIv3JLWTq1Cz8h4wTsFvDi6OnP3/tmT4HLn/sDHRSwuw1Lh9uv94rv3Uk6+Gg2x
 vdpEUmUvTnYVYjoYEQQwgs3zUDGQGN+cJAdX64WlTWAtSdz9iuCCGnPRYT7+w7FhDV
 YmFMz8UlLL1t00HS+ZDBRTDUDNUY67y9ZHsbXXoG0Z3fVs42+xUfN24H3zjXlyEp2w
 ahesitRXao4kQ9t2c0tl6w+nGOu4h/fVQRi+b2tR67EUc0PoTR0Wf0jzXA4sfKVj89
 OsYxSqKzOiLUjPMTOVwmniCt6Ozt6O8DOFZmaDBww0V4LCP6GRzqgMuHERN44zIUNg
 yFnMpSuswvY6g==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 23 Mar 2023 14:39:19 -0700
Message-Id: <20230323213919.1876157-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=216050 Somehow
 we're getting a page which has a different mapping. Let's avoid the infinite
 loop. Cc: <stable@vger.kernel.org> Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- fs/f2fs/data.c | 8 ++------ 1 file changed, 2 insertions(+), 6 deletions(-)
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pfSee-00030D-LJ
Subject: [f2fs-dev] [PATCH] f2fs: get out of a repeat loop when getting a
 locked data page
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

https://bugzilla.kernel.org/show_bug.cgi?id=216050

Somehow we're getting a page which has a different mapping.
Let's avoid the infinite loop.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index bf51e6e4eb64..80702c93e885 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1329,18 +1329,14 @@ struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
 {
 	struct address_space *mapping = inode->i_mapping;
 	struct page *page;
-repeat:
+
 	page = f2fs_get_read_data_page(inode, index, 0, for_write, NULL);
 	if (IS_ERR(page))
 		return page;
 
 	/* wait for read completion */
 	lock_page(page);
-	if (unlikely(page->mapping != mapping)) {
-		f2fs_put_page(page, 1);
-		goto repeat;
-	}
-	if (unlikely(!PageUptodate(page))) {
+	if (unlikely(page->mapping != mapping || !PageUptodate(page))) {
 		f2fs_put_page(page, 1);
 		return ERR_PTR(-EIO);
 	}
-- 
2.40.0.348.gf938b09366-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
