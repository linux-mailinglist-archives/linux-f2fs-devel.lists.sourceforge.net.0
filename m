Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD50791A5B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Sep 2023 17:13:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdBG4-0005mF-KP;
	Mon, 04 Sep 2023 15:12:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qdBG3-0005m6-Lv
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 15:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nzRPsnoDv0reoq3J4HngyKkbQvH3g1iWRTKzy26+yis=; b=Nk3Rok7Q2clyqvsvbzDsBgJVl/
 L1ZaSQMA4DQgemwbiqXtHV9m/K3LozxcOXcTx0d7FFNFqYyq93DarAIDqtltQoiU2roDFyLU5TT2O
 Vqz4Q9XRdIf/brDNyZZa7/cLnVgmKKnAc0W9SVz1BOAD2kDERV+OHcMFB1h6LMzT9uqg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nzRPsnoDv0reoq3J4HngyKkbQvH3g1iWRTKzy26+yis=; b=Q
 yn7k/l5M0J9NM5CqZFkASyGYUx5es2rFKwCmJ8XkK4Nupgy1HSttb/caHeG10jwcuZUlgTIzsj8MY
 PvKMqYslKnnTTiu3egXBfGpzr9Jy7q5mBaeL+G7nXs95Q5g2uWNKKbvD+ltM4SbjWXXYdhf0vm+9s
 DfByvlXigKZ4n4PY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qdBG3-009N0D-F1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 15:12:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 201B3B80E6C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Sep 2023 15:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93DD8C433C7;
 Mon,  4 Sep 2023 15:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693840367;
 bh=vvfGHYHl5xJjMX5/f31WY7Kz3B/DCsZa1lluG2f5HTY=;
 h=From:To:Cc:Subject:Date:From;
 b=pMvSXDc23f+POmvwTwuhEYS/fiPLUKyv4ziUOUzRmJX2ex+RrGrPNc+LJc8V/1x6k
 AbXy8HtqSJt+H5kShX2tbt7N/k5bDXXnIpcJxaQl+iAM0OQ0fBNebclJvc01cGVWFn
 +ZnJ20TWM2LHCr7iYtAu4pWRwBiOnJGxHGLt6djxsL0KdHJQZXuHa6CVJ3gF+pzMhT
 VkIesIrIV/C/uiKoBztmT+w3FSm2DOHrOQywow1Xox144kRZAZW1LhTdqflZnu+eKR
 OEdyJAJqHN+6u65u1itLYA+kegZJU3Ojyl2csrhYvHqEwz4Cfh/1Su8kO75IspDdM5
 lBL5ZYlApGAug==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  4 Sep 2023 23:12:42 +0800
Message-Id: <20230904151242.1786219-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If file has both cold and compress flag,
 during f2fs_ioc_compress_file(), 
 f2fs will trigger IPU for non-compress cluster and OPU for compress cluster,
 so that, data of the file may be fragmented. Fix it by always triggering
 OPU for IOs from user mode compression. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qdBG3-009N0D-F1
Subject: [f2fs-dev] [PATCH] f2fs: compress: fix to avoid fragment w/ OPU
 during f2fs_ioc_compress_file()
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

If file has both cold and compress flag, during f2fs_ioc_compress_file(),
f2fs will trigger IPU for non-compress cluster and OPU for compress
cluster, so that, data of the file may be fragmented.

Fix it by always triggering OPU for IOs from user mode compression.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2a38d2cc2140..d4b59c57d827 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2665,6 +2665,11 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 		return true;
 	if (f2fs_is_atomic_file(inode))
 		return true;
+	/* rewrite low ratio compress data w/ OPU mode to avoid fragmentation */
+	if (f2fs_compressed_file(inode) &&
+		F2FS_OPTION(sbi).compress_mode == COMPR_MODE_USER &&
+		is_inode_flag_set(inode, FI_ENABLE_COMPRESS))
+		return true;
 
 	/* swap file is migrating in aligned write mode */
 	if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
