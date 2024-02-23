Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC94860910
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Feb 2024 03:54:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rdLhl-0006cm-LW;
	Fri, 23 Feb 2024 02:54:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rdLhj-0006cd-RI
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Feb 2024 02:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qtA3eltSePaTBgB6QYbPO9ANNSqGG8hN5MM4sC7tRSc=; b=KIuYSurcWAkEOEKnfUAE7yue81
 pfM3NKwEYBaKzZVA5fGQgCXFAo/egirqHd4BoPd6DF5o9mu+BkZIBXn2tdvR/mC0NhtWiKI6QCAnT
 jO1qzflUnB4LQPFqJQjEZngOriDqxC6TXdNiCoudcHGFQ+XJE1CnYI3ngql4nI+wXZAk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qtA3eltSePaTBgB6QYbPO9ANNSqGG8hN5MM4sC7tRSc=; b=M
 4F5L/mOA9p/1jYmPOPSyZWX+8Id54SRwasrrfsgWTJJTh3IFPQc12pRRgxrSfmoCa4RrITbatWI+A
 9jGC0OkXAVBWsAXCX3imrCNrlZSohi07zWybOv9C84YpGP/wXe694GcD3YXS0h1xTKp8YD0iTe+86
 62f1QTjfkf7HpBQw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rdLhd-00045D-SM for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Feb 2024 02:54:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8354BCE12DA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 Feb 2024 02:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2DCC433C7;
 Fri, 23 Feb 2024 02:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708656850;
 bh=MtfIvW3ZInRpl5iX8uy2azMoMXfPseve2FHzcWCecMY=;
 h=From:To:Cc:Subject:Date:From;
 b=FH6omqY0SODN7lStTxvDfIWw8IYve+dQJ55KIhtdpcLxcL0VzlW3FT8NTghAq0Ci+
 7HBjwq/UTV8RTUWZTu/r+CwK7DTelSMsLFlIxDcuRQt/rdwkdQpg71xO+wYXhBQ90O
 G5/kUPbkiOynTfIJN1Pvu/p9d3FK/+v2GnZ0IQvS6q8PLdoLKEH4h8q2c4lLESZm8M
 vQJHGsg+NonHzD2REEYQ+UMi1QaNIJ/XDgGLWtxrs8SOJmEkLQPbIC5ACduYeBdMSm
 WoP43snOalEKqDxHHfwKYOWR1R1zdQqMXyubCC0uz0KT706RvB++ugxxv77bidCyFV
 kSStx7lgMlo8A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 23 Feb 2024 10:54:03 +0800
Message-Id: <20240223025403.1180558-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  @type in f2fs_allocate_data_block() indicates log header's
 type, it can be CURSEG_COLD_DATA_PINNED or CURSEG_ALL_DATA_ATGC, rather than
 type of data/node, however IS_DATASEG()/IS_NODESEG() only accept [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rdLhd-00045D-SM
Subject: [f2fs-dev] [PATCH] f2fs: fix to use correct segment type in
 f2fs_allocate_data_block()
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

@type in f2fs_allocate_data_block() indicates log header's type, it
can be CURSEG_COLD_DATA_PINNED or CURSEG_ALL_DATA_ATGC, rather than
type of data/node, however IS_DATASEG()/IS_NODESEG() only accept later
one, fix it.

Fixes: 093749e296e2 ("f2fs: support age threshold based garbage collection")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index d0209ea77dd2..76422f50e6cc 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3505,12 +3505,12 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	locate_dirty_segment(sbi, GET_SEGNO(sbi, old_blkaddr));
 	locate_dirty_segment(sbi, GET_SEGNO(sbi, *new_blkaddr));
 
-	if (IS_DATASEG(type))
+	if (IS_DATASEG(se->type))
 		atomic64_inc(&sbi->allocated_data_blocks);
 
 	up_write(&sit_i->sentry_lock);
 
-	if (page && IS_NODESEG(type)) {
+	if (page && IS_NODESEG(se->type)) {
 		fill_node_footer_blkaddr(page, NEXT_FREE_BLKADDR(sbi, curseg));
 
 		f2fs_inode_chksum_set(sbi, page);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
