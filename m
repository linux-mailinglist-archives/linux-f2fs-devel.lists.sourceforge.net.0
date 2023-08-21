Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4065B782D23
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Aug 2023 17:22:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qY6jq-00036H-Tj;
	Mon, 21 Aug 2023 15:22:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qY6jp-00036B-IV
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Aug 2023 15:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rToafid38dSDzo9BmIsdEKn34E8qPil/lAIBqR3Fvqo=; b=iyjLTgxgBiccTaUlQ4mQtXVi2q
 W/PBpbXt8rtaw2PA/rrOhXtAU6fObNP5puJV3TaYS+7ZdYSfQNLv5vKYkQGXoa2zXpNfVwTsNJOuY
 36XjxvHxycNJEGp8PsDbpW0h28wIm9WLUsgglJUpRel/U6UIeHeXXEbidWawD0+/zwOo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rToafid38dSDzo9BmIsdEKn34E8qPil/lAIBqR3Fvqo=; b=F2JaHAwWyunzialRFrg1vU78ZF
 dvQEcgW5YF9DIbQ4uVIK79dLnGFkBDlbAeNSOsQQ6GRJ7UMgSHQvFgqeoSpcCy9ivLY8wwFVXSb8v
 c14rFZA6W1RPfdrqR9+lGVqSrZ8u3esfWXfAA+sHZkpE+zr/O7OAhMc91rGq0OEoXU/Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qY6jp-00BU2l-Cm for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Aug 2023 15:22:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C6E9963A9A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Aug 2023 15:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65AAC433C8;
 Mon, 21 Aug 2023 15:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692631355;
 bh=ViCdO3mKsu0rpP6MtdWLUzlowcnCJvN7GijE6W+iSaE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NMzRWXF/8nU1TTsBojqEhv3nqo6J7b23jvjPMJ1BJlZ4tSk1Y4dXWU2HWVLrA1j66
 Fnd1QtrOKO0xij66hBlRITK31JSzw7r3O3zgzDjFW7YV0SsJwgvzaauhPsEuLkXXzF
 9xoISvWonafD/FqlpmjhQaAC+eEUahCA7ub5DrKY9rM/XvJHQsrn0MDAgmL1bTxhj2
 WLumWWntO0YnMkmYNv6FG/Zkh83gfgmgNWY/WkLtGSOFbXg7wqPq6TSeZW9U7WVC/V
 EAswnMFwxOON9QyUkfpnfv1bH11Xt6BOi4+Y0Sz/P95Uz9FqpETvBBn/UmpGQJ/Dbb
 JzePma50DG+8w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 21 Aug 2023 23:22:24 +0800
Message-Id: <20230821152225.4086924-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230821152225.4086924-1-chao@kernel.org>
References: <20230821152225.4086924-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In error path of f2fs_submit_page_read(), it missed to call
 iostat_update_and_unbind_ctx() and free bio_post_read_ctx,
 fix it. Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/data.c | 3 +++ 1 file changed,
 3 insertions(+)
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qY6jp-00BU2l-Cm
Subject: [f2fs-dev] [PATCH 2/3] f2fs: fix error path of
 f2fs_submit_page_read()
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

In error path of f2fs_submit_page_read(), it missed to call
iostat_update_and_unbind_ctx() and free bio_post_read_ctx, fix it.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5d9697717353..916e317ac925 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1167,6 +1167,9 @@ static int f2fs_submit_page_read(struct inode *inode, struct page *page,
 	f2fs_wait_on_block_writeback(inode, blkaddr);
 
 	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
+		iostat_update_and_unbind_ctx(bio);
+		if (bio->bi_private)
+			mempool_free(bio->bi_private, bio_post_read_ctx_pool);
 		bio_put(bio);
 		return -EFAULT;
 	}
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
