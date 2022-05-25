Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83255533511
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 May 2022 03:56:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ntgGX-0008Vw-PV; Wed, 25 May 2022 01:56:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1ntgGW-0008Vp-QF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 May 2022 01:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tQ8w2pw2dTnb13d7/rd+XKSx1h1SBtx+VPFz8B+pXbc=; b=eto0NV6WaIW3m225fXLWIe9+VR
 IXhRi5ZT/4fLcJ+Tj4u/W5s2G6GPMZZQVuSbH5kidNv/cs6FW9VuhLAYXZ0UkgbNCuy+cW9VmQ+Iy
 CmjEN/+ZeUytbtmYW/tzs1OHOrchrZ3yYgAWt9cag1jXtCtcqPeTlGfubYUuy1sgROtQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tQ8w2pw2dTnb13d7/rd+XKSx1h1SBtx+VPFz8B+pXbc=; b=k
 eQ+Cwgg5SYEoCwYX0TXqo79WvvztvPu0UZr1eFJvY10cuqgmKk8+jIB8ocKqWK+Yp900q9+mDbh2P
 cGpa5heuxbbS03kjCJfCG1ingPVAFrngqL6KA4YBTdmR0bubQe4/gMFlcz4CZSqCWuPiHER2GBnvA
 CGxsisE5kotabNZk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ntgGV-0001JO-5R
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 May 2022 01:56:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5B5F60F46;
 Wed, 25 May 2022 01:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E9AC34100;
 Wed, 25 May 2022 01:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653443801;
 bh=hNHaLYvjKeAxDgpE7qKiVuYLTc51rccayDM5S5yqzkM=;
 h=From:To:Cc:Subject:Date:From;
 b=HqxwfzFzjDfU7SRG2BfRajIWClMs/kpuOLa7VZSBEcKwmOLSA59INHgjGSVsInWbH
 LwF5kFHXstg/igZgSGOAfkyIQscBp3ooPWZu8gETaQv166TBhp9822sp9BzpkZnKBk
 JNprhK4E36cUR4DROICWCn98CF/7fXLuQ+BwlOE9cU67myilCoNNGryY5GIFGaynVM
 QPJWPO/cvoUmHH4/JL+yNuquUQ5ce3zThpu+ss87THXaQqSHC9lltCvwJ0YmpckV3Y
 S6gqbypEPXC3+0OeMj6KfzxBXFucawEwA3KPKUJ+13N59lzY1zfUQm7AJfRxlD67rj
 RARZDR10TZ+Yg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 25 May 2022 09:56:34 +0800
Message-Id: <20220525015634.3985529-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In __f2fs_commit_atomic_write(), we will guarantee success
 of revoke_entry_slab allocation, so let's avoid unneeded error handling.
 Signed-off-by: Chao Yu <chao.yu@oppo.com> --- fs/f2fs/segment.c | 5 -----
 1 file changed, 5 deletions(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ntgGV-0001JO-5R
Subject: [f2fs-dev] [PATCH] f2fs: avoid unneeded error handling for
 revoke_entry_slab allocation
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

In __f2fs_commit_atomic_write(), we will guarantee success of
revoke_entry_slab allocation, so let's avoid unneeded error handling.

Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
 fs/f2fs/segment.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 0a4180f64291..51ceff797b97 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -315,11 +315,6 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 
 			new = f2fs_kmem_cache_alloc(revoke_entry_slab, GFP_NOFS,
 							true, NULL);
-			if (!new) {
-				f2fs_put_dnode(&dn);
-				ret = -ENOMEM;
-				goto out;
-			}
 
 			ret = __replace_atomic_write_block(inode, index, blkaddr,
 							&new->old_addr, false);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
