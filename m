Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0686221C4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Nov 2022 03:11:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1osaZI-00069X-Vl;
	Wed, 09 Nov 2022 02:11:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1osaZ8-00069L-PW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Nov 2022 02:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mvUcP4HbntagmkOGfZf7WFmP0Hncswvrk5B3oyCzjwM=; b=UMqhemyZZneK7uby3VjcgkK7LP
 R14yQQRZzeXEauu8jNIXXbfOyG1Vs5z5slj+8htAyEsj+9sTqT7dznTHjJHx8hD7Fa6knVX82VEtQ
 S7v/1ndVG2Gsof6uWSGtFrqFCdfb3qWfeLPnVb3JoW4oYjnEf7hw/V9Pid8+xtiTkLSQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mvUcP4HbntagmkOGfZf7WFmP0Hncswvrk5B3oyCzjwM=; b=DtD9/pb7u0oe5CuyJnAdEusd12
 9QF3RNB2YScxeVcayDkNvo4unzLdHvbb0mCI/OROmgfBCoKraYEu9Fb+zTx2tTTh1EkhHrJmHNLBz
 0vsqR9ZPRqK4gh4Pqc9A3uUgigPNskoaSPIVFyMEL5icX+iPTEwkCs8zMY+9GP20n9no=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1osaZ8-0001LE-5G for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Nov 2022 02:11:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC46061808
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  9 Nov 2022 02:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1900FC433C1;
 Wed,  9 Nov 2022 02:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667959900;
 bh=el+9iDBLBzbkqcIXd+VbVRLhL+sNygO7vW88HQ7wz0Y=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=RSm0iYTzd8Ef9RbgEX2v/Tj3V1G/oN+I/GfMxdhJQMDwIzzoEOv+2oREZYoKQXAyE
 qdd8Fttb3PZb/C2wxomUuIvL6YVMZo9QxLOIote9coQJqsWlrPMWEGsGkMYL7KQqX+
 B+/EezEPcmud4epjkW0cvC4n1o3PHxcR4CJgpdisHy5+Q+9B93PKLP/QHjtBgskLRs
 I7N2nJl9C9bfymZKKFvu95cyElE8IbU2VL3fqADYCRG1XvCkaqyZJDRkBo+oNpA527
 91hvklb6XID/DP3u71YKGoH6ZIQIu6TWYR+ec7UalV7O+d+w/Wb7rvMTH/xTv5Nwaf
 1zJRoxrsFiflw==
Date: Tue, 8 Nov 2022 18:11:38 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Y2sMWrKXJtGSmUz7@google.com>
References: <20221109020917.4121067-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221109020917.4121067-1-jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If block address is still alive, we should give a valid node
 block even after shutdown. Otherwise, we can see zero data when reading out
 a file. Cc: stable@vger.kernel.org Fixes: 83a3bfdb5a8 ("f2fs: indicate
 shutdown
 f2fs to allow unmount successfully") Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org> --- 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1osaZ8-0001LE-5G
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: allow to read node block after
 shutdown
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If block address is still alive, we should give a valid node block even after
shutdown. Otherwise, we can see zero data when reading out a file.

Cc: stable@vger.kernel.org
Fixes: 83a3bfdb5a8 ("f2fs: indicate shutdown f2fs to allow unmount successfully")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 - Cc: stable

 fs/f2fs/node.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 983572f23896..b9ee5a1176a0 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1360,8 +1360,7 @@ static int read_node_page(struct page *page, blk_opf_t op_flags)
 		return err;
 
 	/* NEW_ADDR can be seen, after cp_error drops some dirty node pages */
-	if (unlikely(ni.blk_addr == NULL_ADDR || ni.blk_addr == NEW_ADDR) ||
-			is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN)) {
+	if (unlikely(ni.blk_addr == NULL_ADDR || ni.blk_addr == NEW_ADDR)) {
 		ClearPageUptodate(page);
 		return -ENOENT;
 	}
-- 
2.38.1.431.g37b22c650d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
