Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D75BD4AD5D7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Feb 2022 11:52:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nHO6Y-0007CY-1T; Tue, 08 Feb 2022 10:52:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nHO6X-0007CP-Dr
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Feb 2022 10:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QdQPHdjakmPz6XmpwdLVGWqmdOEeo5KmP2ORujA4PTs=; b=c+cundG9PJgA8O4SuonLEffWTE
 XVhiTL9sRl1c8rBdlI7oFPQkORe/f451KXSflzXYAVK1xQSjkmMjVqbd7hkBb9BncmyNzXtKVZfd/
 aLRXIP6Qcp5ntUj41VR82/0sdCf55+IHLrE6b3d5sbVpNi1LctX34NxABjyHmFPNann4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QdQPHdjakmPz6XmpwdLVGWqmdOEeo5KmP2ORujA4PTs=; b=Z
 WkO2tuVMy/VKftuBQdHGfe0J9zQvaIRoZZgxf0QNQAH8U/xNUFVE9YLFwrGYEA/y4ailwGF9HGK+5
 NvQeeVxvw9LYGOKB1q6vNGdCPk2Zn7VBxCLDU8dmxAjfo8dmMwgu+CTnc8YijeOjJZkYVuUuYQRAc
 gOvTCb3PNv6dAjSU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nHO6V-0008NU-3c
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Feb 2022 10:52:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DD422B81A0D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  8 Feb 2022 10:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64169C004E1;
 Tue,  8 Feb 2022 10:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644317523;
 bh=LOsnrHhtZ02v5wdKdIpP4CXhD4olCp1tiNeKEg5L2bY=;
 h=From:To:Cc:Subject:Date:From;
 b=ZGsO2CWjFjH85KytSFltbGoyHDgWbO/Dc/g9b7Td1eDR+IV2ALxBKXIFYLDwZK1Oj
 cNWK2Xn/hl9E9p/B80AnW7flcfVTu6EU4bLsC+2fnlC/uww4gzRwUADmy44COeqpuY
 dhF1evwfHhsJcpvWXM/1UzZ9MKMmNl3/g7dDYR+N/0GP9NPCCc7VmaYBFJlAMvwKUE
 HeIUUW7Dl4xWGT7OgYqZZNBKTZX/B+7ZezvtKLJv+1px5zczdsr8BAOZsSbw3kYlPc
 JCx0o4fb+u0TjaNH51THr+tkcq2ozqk4LN2Cj3vuuNTmb/7p212imlyhO6r5ZBtq7g
 6fDvlM/G1q22w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue,  8 Feb 2022 18:51:56 +0800
Message-Id: <20220208105156.3810115-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's avoid holding cp_rwsem write lock during
 f2fs_sync_node_pages()
 in block_operations(), then cp_rwsem write lock's coverage in checkpoint
 can be shrunk, then it expects there will be more opportu [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nHO6V-0008NU-3c
Subject: [f2fs-dev] [PATCH RFC] f2fs: sync node page without cp_rwsem during
 block_operations()
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

Let's avoid holding cp_rwsem write lock during f2fs_sync_node_pages()
in block_operations(), then cp_rwsem write lock's coverage in checkpoint
can be shrunk, then it expects there will be more opportunity that
foreground operator can grab cp_rwsem read lock.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index f7cb4277de70..7596faa0be45 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1190,6 +1190,8 @@ static int block_operations(struct f2fs_sb_info *sbi)
 		.for_reclaim = 0,
 	};
 	int err = 0, cnt = 0;
+	bool sync_lockless = true;
+	unsigned int retry_cnt = 3;
 
 	/*
 	 * Let's flush inline_data in dirty node pages.
@@ -1249,15 +1251,25 @@ static int block_operations(struct f2fs_sb_info *sbi)
 
 	if (get_pages(sbi, F2FS_DIRTY_NODES)) {
 		f2fs_up_write(&sbi->node_write);
+		if (!retry_cnt--)
+			sync_lockless = false;
+		if (sync_lockless) {
+			f2fs_up_write(&sbi->node_change);
+			f2fs_unlock_all(sbi);
+		}
 		atomic_inc(&sbi->wb_sync_req[NODE]);
 		err = f2fs_sync_node_pages(sbi, &wbc, false, FS_CP_NODE_IO);
 		atomic_dec(&sbi->wb_sync_req[NODE]);
 		if (err) {
-			f2fs_up_write(&sbi->node_change);
-			f2fs_unlock_all(sbi);
+			if (!sync_lockless) {
+				f2fs_up_write(&sbi->node_change);
+				f2fs_unlock_all(sbi);
+			}
 			return err;
 		}
 		cond_resched();
+		if (sync_lockless)
+			goto retry_flush_quotas;
 		goto retry_flush_nodes;
 	}
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
