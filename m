Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4544A2996C0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Oct 2020 20:22:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kX84f-00060u-Lf; Mon, 26 Oct 2020 19:22:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kX84d-00060l-Kp
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 19:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J61b71/QKe6oMcn0XjuH3n+b/7n0NtiU7bMRjrzYts8=; b=P+Pa7F7c9QuhiIJEUrF3yKmPs6
 WSLhc3e5tWSAYfln27SXrsVa3jrzb00JiWqFqqvoFqeqvSZ1VaWD7inge/EhzOor+fwWxPvSH7YGz
 IAP/CoocdFE4irA+WaxV8qws4de1RppVW8jZ3gnCTAywB5RDiUNMZ04SCA9Bc+dYRk0o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=J61b71/QKe6oMcn0XjuH3n+b/7n0NtiU7bMRjrzYts8=; b=g
 XT8g/GCpQunr932bVHynBPxwU++j9EN/4kum93l5yGLiG2yIc6i8sQPYRrWIHINhoJHr3mxQ7zg9H
 Ie73AgEPqJxUw+W7VdDEBEqyI2LRPGVOJGohjeEK/0DSsXLp2JxT8+LyyND/l2QDEaeR1zCkB73J9
 82nD7MMBuIeIMMZ4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kX84U-00EeQW-7B
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 19:22:31 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89B3A2080A;
 Mon, 26 Oct 2020 19:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603740136;
 bh=pd2RJCqAVpfNGQ5ypEduTt4rIlya9sC2k1zp9YD13i0=;
 h=From:To:Cc:Subject:Date:From;
 b=dRWOwXFDqYd72SEFlryt/ijWt1i6SGzSPaHhD88/dqEhU4VIN7/w6ZdGVY7PGWef+
 97z5PlapHJycTe7li8HfPblsL1kS48G7f4n0rnY+QWrRMM61Q8drP17VRa87ySmvTB
 lFU9jvShyDA9DgTWerjpXzODnzq5hoNe7ewvyBv8=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 26 Oct 2020 12:22:14 -0700
Message-Id: <20201026192214.4156137-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kX84U-00EeQW-7B
Subject: [f2fs-dev] [PATCH] f2fs: call f2fs_get_meta_page_retry for nat page
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When running fault injection test, if we don't stop checkpoint, some stale
NAT entries were flushed which breaks consistency.

Fixes: 86f33603f8c5 ("f2fs: handle errors of f2fs_get_meta_page_nofail")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/node.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index d5d8ce077f29..42394de6c7eb 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -109,7 +109,7 @@ static void clear_node_page_dirty(struct page *page)
 
 static struct page *get_current_nat_page(struct f2fs_sb_info *sbi, nid_t nid)
 {
-	return f2fs_get_meta_page(sbi, current_nat_addr(sbi, nid));
+	return f2fs_get_meta_page_retry(sbi, current_nat_addr(sbi, nid));
 }
 
 static struct page *get_next_nat_page(struct f2fs_sb_info *sbi, nid_t nid)
-- 
2.29.0.rc1.297.gfa9743e501-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
