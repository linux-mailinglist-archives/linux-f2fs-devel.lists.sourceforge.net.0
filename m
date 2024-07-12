Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEC692F64E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2024 09:34:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sSAnh-0004UL-PJ;
	Fri, 12 Jul 2024 07:34:42 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sSAnb-0004U8-8L
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 07:34:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GL1pBFYigp1pA1XsdHVLzFxfiUg5djogecfxeM7bwJY=; b=LNwQYNerWMd8U1BwVGmOcc0+CK
 B5QosP12fm/njRKKX+g6LJcnitMqf4Z81hV30s+Nv24HetvCR23jy2xuT2r5DpfQF0xhAOjpbKYpI
 ugwKSeKbPsTjtBDdtn4NY9sFI16DG8ZdRYyy4Ke44PfnHn5plMm5uW2NRVNlnAquHnaQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GL1pBFYigp1pA1XsdHVLzFxfiUg5djogecfxeM7bwJY=; b=i
 HVy8UkUtCGG04H29cO5FzPqa1FAoLz5kIo/R/R9cMhqPtgV89XPFOtQWygzIMZNHb/qmq5/Qp/YfX
 xhjn7dzq3nbjC2dD1c5O4j+NxhLpoNADwacMioZv6ui7GPSQrVxIAwwAWTM1rFTrR2MSFn/qdXPRh
 +CCS34DnLw7BbXCY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sSAnb-0005eA-Ir for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 07:34:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 25881CE140D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Jul 2024 07:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C45FC3277B;
 Fri, 12 Jul 2024 07:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720769662;
 bh=pQDRxA/hn4GoB35hMTWuxnTZbA6PilRZeqm+y7oKfkY=;
 h=From:To:Cc:Subject:Date:From;
 b=ki261NVVkOo6/fkukqcGMmIUAvLrT3KwM+lh0WXotJcJ5QfGsr3G3lSOeE5KO1IYw
 zSsM2REhgYqHv/J7N4uVVQC/bmoxwvm6kH/VxhSU7QcS6DxSeKQz4SAqeIWSee6vuW
 qUUmLEfGhSJe8V86Q4nzBEKlQ+NnudwBSGeFeoPtHGpEdwUSi4f46vxEQpA2GSI0cm
 KWVIalevvudV0mnJmM/oh7weYngkOz8W5nlHmfz3WLtIrr35a5udQrmMWz+oBCDPRc
 E7N99QseG1xfjGxCDwcoELIByug2rgrQzlOKn3jRZ81WbQVcJWZn59jycBMpYvr/W/
 4SKPmX3EjxE5Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 12 Jul 2024 15:34:15 +0800
Message-Id: <20240712073415.227226-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  All directory blocks are within the scope of i_size, so let's
 limit the end_block to just check valid dirent blocks. Meanwhile, it uses
 dir_blocks() instead of variable for cleanup in __f2fs_find_entry(). 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sSAnb-0005eA-Ir
Subject: [f2fs-dev] [PATCH] f2fs: don't traverse directory blocks after EOF
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

All directory blocks are within the scope of i_size, so let's limit
the end_block to just check valid dirent blocks.

Meanwhile, it uses dir_blocks() instead of variable for cleanup in
__f2fs_find_entry().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/dir.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 02c9355176d3..d4591c215f07 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -305,18 +305,21 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 	int s = GET_DENTRY_SLOTS(fname->disk_name.len);
 	unsigned int nbucket, nblock;
 	unsigned int bidx, end_block;
+	unsigned long last_block;
 	struct page *dentry_page;
 	struct f2fs_dir_entry *de = NULL;
 	pgoff_t next_pgofs;
 	bool room = false;
 	int max_slots;
 
+	last_block = dir_blocks(dir);
 	nbucket = dir_buckets(level, F2FS_I(dir)->i_dir_level);
 	nblock = bucket_blocks(level);
 
 	bidx = dir_block_index(level, F2FS_I(dir)->i_dir_level,
 			       le32_to_cpu(fname->hash) % nbucket);
 	end_block = bidx + nblock;
+	end_block = min_t(unsigned int, end_block, last_block);
 
 	while (bidx < end_block) {
 		/* no need to allocate new dentry pages to all the indices */
@@ -361,7 +364,6 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 					 const struct f2fs_filename *fname,
 					 struct page **res_page)
 {
-	unsigned long npages = dir_blocks(dir);
 	struct f2fs_dir_entry *de = NULL;
 	unsigned int max_depth;
 	unsigned int level;
@@ -373,7 +375,7 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 		goto out;
 	}
 
-	if (npages == 0)
+	if (dir_blocks(dir) == 0)
 		goto out;
 
 	max_depth = F2FS_I(dir)->i_current_depth;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
