Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE4C9B3F5F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 01:57:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5aXw-0002d0-7f;
	Tue, 29 Oct 2024 00:57:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t5aXu-0002ct-Js
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 00:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I+4Lg4irGpovA30umAjWEAK7FNq3sXsHmIbIh378Tik=; b=H+BbgFedScgf4cYFpLE+nH1KTT
 DLeek++/I5HZyTWvxxKhHIuDVvOXlNTyPHNLMLopXEa3bVV7QvR3HD1LIy0Zs4wnee/qUe1XYAM09
 +yqpNNdL8VNGbSkLrb5feAEe/H9DpbDZjk8C1Lvc9sPcF0z46aTQfAB90VXtm+ggvyeE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=I+4Lg4irGpovA30umAjWEAK7FNq3sXsHmIbIh378Tik=; b=j
 zHGOQCReRfYcRbw/pRqkOq7Y3ywAdpc6+Y7VQ9R57d6Mp/sIgR1efKo9Aqv8CpzNk9Op0Nmdo7Y10
 ZsQkw8/AkKU7tMo1S0qQiv/Uu0bwZC+O9VT0v6jbcvR5i2hFVYxT61LiolpYsVuT80ZAT6g85Yq/s
 Tzbp5OxhSLM5vQWY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5aXs-000481-AS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 00:57:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E8A345C5AC7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Oct 2024 00:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8950BC4CEC3;
 Tue, 29 Oct 2024 00:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730163430;
 bh=6amym9LlHgYwByTv/LTLrRmuOSWhxeY3BdEsJPngSbc=;
 h=From:To:Cc:Subject:Date:From;
 b=PEJh+6j1uzmIWwsg1KEBFZbhqFCmGz+qAxX0fbbKWXZgJsIoGJgQmJqdM1c2C2YGD
 2LuMhgn/UcLyLrmPAFBkDYHrpm0/mmPh8uegUGuiCad/Dk+INKP6yDvkBRrknWomg6
 KZAnDCKS78/5rJK3Fr8atpSIpHUIalTHQtzTihdBMCvv7vaNTPmKWo5/HODVD5TH+G
 ZO6vCDHk6vMRXowImBZmsojxZsS1C48VWYqGvUnP17JU1/MEUaTGo8L2IGtYIMu9/a
 1qftTiEO6YaU5rySc44IT/hP/KzNRYe4mVxKdeKFo3AOYdE+UFrfmDZIPx4za5sV8P
 tQDPQ5tAJApMg==
To: jaegeuk@kernel.org
Date: Tue, 29 Oct 2024 08:57:03 +0800
Message-Id: <20241029005703.2740230-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Just cleanup,
 no logic change. Signed-off-by: Chao Yu <chao@kernel.org>
 --- fs/f2fs/node.c | 11 ++++------- 1 file changed, 4 insertions(+),
 7 deletions(-)
 diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c index af36c6d6542b..7d904f2bd5b6
 100644 --- a/fs/f2fs/node.c +++ b/fs/f2fs/node.c @@ -1066, 7 +1066, 7 @@ static
 int truncate_partial_nodes(struct dnode_of_d [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5aXs-000481-AS
Subject: [f2fs-dev] [PATCH] f2fs: clean up opened code w/ {get,set}_nid()
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

Just cleanup, no logic change.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index af36c6d6542b..7d904f2bd5b6 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1066,7 +1066,7 @@ static int truncate_partial_nodes(struct dnode_of_data *dn,
 	int i;
 	int idx = depth - 2;
 
-	nid[0] = le32_to_cpu(ri->i_nid[offset[0] - NODE_DIR1_BLOCK]);
+	nid[0] = get_nid(dn->inode_page, offset[0], true);
 	if (!nid[0])
 		return 0;
 
@@ -1177,7 +1177,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 
 skip_partial:
 	while (cont) {
-		dn.nid = le32_to_cpu(ri->i_nid[offset[0] - NODE_DIR1_BLOCK]);
+		dn.nid = get_nid(page, offset[0], true);
 		switch (offset[0]) {
 		case NODE_DIR1_BLOCK:
 		case NODE_DIR2_BLOCK:
@@ -1209,13 +1209,10 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 		}
 		if (err < 0)
 			goto fail;
-		if (offset[1] == 0 &&
-				ri->i_nid[offset[0] - NODE_DIR1_BLOCK]) {
+		if (offset[1] == 0 && get_nid(page, offset[0], true)) {
 			lock_page(page);
 			BUG_ON(page->mapping != NODE_MAPPING(sbi));
-			f2fs_wait_on_page_writeback(page, NODE, true, true);
-			ri->i_nid[offset[0] - NODE_DIR1_BLOCK] = 0;
-			set_page_dirty(page);
+			set_nid(page, offset[0], 0, true);
 			unlock_page(page);
 		}
 		offset[1] = 0;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
