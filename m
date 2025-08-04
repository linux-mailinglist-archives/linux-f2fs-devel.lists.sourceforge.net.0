Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2722B199FA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Aug 2025 03:44:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhjnNCG1zGk21ZH97Bkyw1rNx4isyVqQ8smlqV2EXio=; b=fvRTvPn7+kunDkgttftCxp+hEI
	f0yN+y4dMj+h4BJxZwT4oC1temxEMQyF49V9x/Blkt3WNiRlFz4lpWjdyNOJDsE1PIDtnI2IDWEu8
	h9tWywfBpGpbFW93FbRkv2KTRou4IAvHNoV1G+S7eiL0dhzWTlLhffd3o65UzYVk7RE8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uikFA-0007QG-J8;
	Mon, 04 Aug 2025 01:44:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uikF8-0007Q9-Pv
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 01:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0CSDxqOupRz7+Z/++lkrWUVrSO3BrOWzm7BmU1GHs08=; b=AyvydfD/jNQ9f6DkHMFBesAbEv
 8mGJKBNJq9WVxTomjW3WmQA2jNq6qYzFt7HqX3+2cvWe89OuNlk+xZvhQjWABOw90Xzj8o+m1FBzz
 Dwrn4ZywKT/3eLiF8UEBBUedKpt4oWt8nGIpBKP4SXuSCvMKnfm65/wWGZgTOI8pv4Ls=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0CSDxqOupRz7+Z/++lkrWUVrSO3BrOWzm7BmU1GHs08=; b=hy1RuTGRZA3qIXgbxWBWxfOKTI
 cidwPPfttMQ8H9WDBN86M0JbIDuBNJs5TynPcmRSjiP2OYKtnBTmfJEDNQ3NXYjAekgXQ1wYC0y6D
 LI/OMPMiWbo4pm/n+iyC0hpMFCK9N0d822af2Mo7EgvCNT/OmrdSWteKbg8QAZkJyjls=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uikF8-00076f-C5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 01:44:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7A12A5C5B24
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Aug 2025 01:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40131C4CEEB;
 Mon,  4 Aug 2025 01:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754271831;
 bh=kaagW9dCMsb7y1ucHeMk+t7TtIVB1BcK8b6ccYWtXKU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wj9/VBmW6pgYO07LM2+g+xm61XPEJQLpgHEl6j8yNi8h1HEXtJGOhUd6aq51Mq55e
 K6S06Gf5PI7FZDo7TXqQXOn5I8HolnzHIsqZwQwVAKt29nokoPyz/ernPKWHGoWEzp
 GuM0Ow3BBBjOM0pm77mhv9YuFr3OSW5Dgf4RQVUg/aHlYDeJnNo1qBky2Qats5mgZZ
 QNqxnG0cVwrVLBESic3h9bpJVqu2y0nBDomPHHVaHi9xsw9lpXqfhVBi5EpX0MmNpY
 otGle+jHYc1e188voKNaKuL+f24kFHlLadwVjNmvXSdembqd+5umc68Q7FiVFN7GeN
 idc3zfBFaKVug==
To: jaegeuk@kernel.org
Date: Mon,  4 Aug 2025 09:43:38 +0800
Message-ID: <20250804014340.2537172-2-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250804014340.2537172-1-chao@kernel.org>
References: <20250804014340.2537172-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Clean up codes as below: - avoid unnecessary "err > 0" check
 condition - simply if-else condition in the loop - use "1 << log_cluster_size"
 instead of F2FS_I(inode)->i_cluster_size No logic changes. Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/compress.c | 33 +++++++++++++++ 1 file
 changed, 15 insertions(+), 18 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uikF8-00076f-C5
Subject: [f2fs-dev] [PATCH v2 2/3] f2fs: clean up
 f2fs_truncate_partial_cluster()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Clean up codes as below:
- avoid unnecessary "err > 0" check condition
- simply if-else condition in the loop
- use "1 << log_cluster_size" instead of F2FS_I(inode)->i_cluster_size

No logic changes.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 6cd8902849cf..e37a7ed801e5 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1215,9 +1215,11 @@ int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock)
 {
 	void *fsdata = NULL;
 	struct page *pagep;
+	struct page **rpages;
 	int log_cluster_size = F2FS_I(inode)->i_log_cluster_size;
 	pgoff_t start_idx = from >> (PAGE_SHIFT + log_cluster_size) <<
 							log_cluster_size;
+	int i;
 	int err;
 
 	err = f2fs_is_compressed_cluster(inode, start_idx);
@@ -1238,26 +1240,21 @@ int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock)
 	if (err <= 0)
 		return err;
 
-	if (err > 0) {
-		struct page **rpages = fsdata;
-		int cluster_size = F2FS_I(inode)->i_cluster_size;
-		int i;
-
-		for (i = cluster_size - 1; i >= 0; i--) {
-			struct folio *folio = page_folio(rpages[i]);
-			loff_t start = (loff_t)folio->index << PAGE_SHIFT;
-
-			if (from <= start) {
-				folio_zero_segment(folio, 0, folio_size(folio));
-			} else {
-				folio_zero_segment(folio, from - start,
-						folio_size(folio));
-				break;
-			}
-		}
+	rpages = fsdata;
+
+	for (i = (1 << log_cluster_size) - 1; i >= 0; i--) {
+		struct folio *folio = page_folio(rpages[i]);
+		loff_t start = (loff_t)folio->index << PAGE_SHIFT;
 
-		f2fs_compress_write_end(inode, fsdata, start_idx, true);
+		if (from > start) {
+			folio_zero_segment(folio, from - start,
+					folio_size(folio));
+			break;
+		}
+		folio_zero_segment(folio, 0, folio_size(folio));
 	}
+
+	f2fs_compress_write_end(inode, fsdata, start_idx, true);
 	return 0;
 }
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
