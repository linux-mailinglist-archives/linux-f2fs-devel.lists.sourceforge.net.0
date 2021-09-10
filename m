Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEAB4060BD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Sep 2021 02:18:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mOUFl-0006IQ-Ot; Fri, 10 Sep 2021 00:18:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1mOUFk-0006CF-3Y
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Sep 2021 00:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qCUHmiEwfrUyKrvJnefpyA+KzmJ0Ebz9RA5bWnEgGf0=; b=fsm5KNsdoCk05tHfaH1JkDrFkI
 re2vavDtxY2jUW110rp+3VTJx3LBkPFkDEPavwVXZRg9PQF7k6fNQhhG6BPrb9YuT7Ogu6fDHJQ+B
 S76F7Drnc8gT4NtsLPJU00IWiS8UuDROStkJCeTZzK/FFJMgOHtgXptle3Znu3G+Fz1s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qCUHmiEwfrUyKrvJnefpyA+KzmJ0Ebz9RA5bWnEgGf0=; b=Xb5+JA3djNItRTb+sqED6cHe/F
 ImN254xhJTMp6WvfPtthhkZbNuju9TqcDNc6Zq2IdrX6E0aww59YN/rkyhKSz8hPDHl3n34KTGt0t
 Tzk4SFQ4mqWznQbCEkfbyDRdXWYJWs1pZgOgtEIFQX5o+1P93TuhHFkooH4EmjjTBVvk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mOUFj-005S0j-Ir
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Sep 2021 00:18:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DDE8610A3;
 Fri, 10 Sep 2021 00:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233122;
 bh=0GSy/z9oteAShp89i8clV0SqHqaWt0d0zxQWpkUyeRU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y8QOo/BNNrDPok9TzEFO+1ouNmdf3TYbqhu/XwvYdr8n2BaHxJVkbmBFOWQlQmjNY
 Igm5mnnrNQ+o49EFUXiK8YeiWZlbKCBbyRxe1E03LnoLTeoelO0cgPq5nAvjqOlenq
 gVAFgrcTDXijCEj7f+F4Mh2SwEIXNFd49E95Qjc1lUa0lM8uTd/+YTdTh1Ad6I6rnP
 jptCwtx7ei4jRlAk31K1WDTkdj1RjHJqWVJz37hLe8W4n4DYmPf+3i/WACoxzh2gee
 fwd8oIdpofoFt71ktkK4BIcbHxCqgR+L3963dfApkAKutkDsT6ZUSAqwBn853QLQTO
 zJP3d3jQW8baA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  9 Sep 2021 20:17:07 -0400
Message-Id: <20210910001820.174272-15-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910001820.174272-1-sashal@kernel.org>
References: <20210910001820.174272-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Jaegeuk Kim <jaegeuk@kernel.org> [ Upstream commit
 2eeb0dce728a7eac3e4dfe355d98af40d61f7a26
 ] This tries to fix priority inversion in the below condition resulting in
 long checkpoint delay. 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mOUFj-005S0j-Ir
Subject: [f2fs-dev] [PATCH AUTOSEL 5.13 15/88] f2fs: don't sleep while
 grabing nat_tree_lock
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Daeho Jeong <daehojeong@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit 2eeb0dce728a7eac3e4dfe355d98af40d61f7a26 ]

This tries to fix priority inversion in the below condition resulting in
long checkpoint delay.

f2fs_get_node_info()
 - nat_tree_lock
  -> sleep to grab journal_rwsem by contention

                                     checkpoint
                                     - waiting for nat_tree_lock

In order to let checkpoint go, let's release nat_tree_lock, if there's a
journal_rwsem contention.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/node.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e67ce5f13b98..b731d7ff455c 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -538,7 +538,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 	int i;
 
 	ni->nid = nid;
-
+retry:
 	/* Check nat cache */
 	down_read(&nm_i->nat_tree_lock);
 	e = __lookup_nat_cache(nm_i, nid);
@@ -550,10 +550,19 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 		return 0;
 	}
 
-	memset(&ne, 0, sizeof(struct f2fs_nat_entry));
+	/*
+	 * Check current segment summary by trying to grab journal_rwsem first.
+	 * This sem is on the critical path on the checkpoint requiring the above
+	 * nat_tree_lock. Therefore, we should retry, if we failed to grab here
+	 * while not bothering checkpoint.
+	 */
+	if (!rwsem_is_locked(&sbi->cp_global_sem)) {
+		down_read(&curseg->journal_rwsem);
+	} else if (!down_read_trylock(&curseg->journal_rwsem)) {
+		up_read(&nm_i->nat_tree_lock);
+		goto retry;
+	}
 
-	/* Check current segment summary */
-	down_read(&curseg->journal_rwsem);
 	i = f2fs_lookup_journal_in_cursum(journal, NAT_JOURNAL, nid, 0);
 	if (i >= 0) {
 		ne = nat_in_journal(journal, i);
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
