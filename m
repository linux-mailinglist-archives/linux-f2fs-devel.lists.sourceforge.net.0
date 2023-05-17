Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A77D705E35
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 May 2023 05:42:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pz836-0004vM-0W;
	Wed, 17 May 2023 03:42:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pz834-0004vF-88
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 03:41:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d3pTrwNPpmD+e+qlfroxQOmecTBXw8pq/ZMJFyNwMcc=; b=ZpxkqbBr+hOltbPVWos/DkCRJB
 ysAEt1KnTrSwi8W90LfQOVIvhwUIC15zQPK6tY5GjwobMplXuTuvoD4PAR0SVPt/4PXlBvM4ADQl1
 11SZMJ7Iwbl7oxfSodn8k4JQth+pUCFAI0s4yHLzWmy1JaFDaCIqeE718BfK4GdIvESM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=d3pTrwNPpmD+e+qlfroxQOmecTBXw8pq/ZMJFyNwMcc=; b=G
 GmZEde1OSk5x++0xp/e9nPc2sd6fCmJKtV80qk96JTifkyl9dzqYzU6OS+VXUfs7inMuSOuVSBZtt
 +SPSBNxZvUldu1hgPs7xB+v1Vhspb09Wv507XN4q2YJ3DxXOSpQkOFX9olrun83DBLTZzQeEU9u66
 GGmOWqGE6n9Iokiw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pz831-00ATk9-NQ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 03:41:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2534660A4B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 May 2023 03:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D064CC433EF;
 Wed, 17 May 2023 03:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684294906;
 bh=jIMBSZU6DcIg128BmiUzKyo1mKFJN6bwGmXxDRJS/7c=;
 h=From:To:Cc:Subject:Date:From;
 b=VqrUbrMhVu67DZAKgx7QGu0lljDrcRx6jtZsupnKWYnfdTmBgee5hTRyvBHETW+xo
 gXQE7ukGIpqQMSkqqK2I6imfGLm6KhutUU1M8JgTHVymX65P7ebFizM1SE5cCDgLz2
 2ifO5Ze/6NuxTUI2dKlyEVqxEsHU0d6N0Lgc0w1IWuLIado07S9ucjmC7kTugM7W6A
 Dpz6KlMSaM4yMNxZU0YI4GvdildW/n3SoOWINSyUYW+t+vN/GRKPsPUno5NDG1186H
 Wxv7dex7f5zc8h579D3FnHFBRW7XY39PsHuw5IW03AKXj8YMH+dL/zduLpnCzKDLOn
 aBODLwSM8MNHw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 17 May 2023 11:41:39 +0800
Message-Id: <20230517034139.12879-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The last valid compress related field is i_compress_flag,
 check its validity instead of i_log_cluster_size. Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- v2: - rebase the code. fs/f2fs/inode.c | 6 +++--- 1 file changed,
 3 insertions(+), 3 deletions(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
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
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pz831-00ATk9-NQ
Subject: [f2fs-dev] [PATCH v2] f2fs: compress: fix to check validity of
 i_compress_flag field
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

The last valid compress related field is i_compress_flag, check its
validity instead of i_log_cluster_size.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- rebase the code.
 fs/f2fs/inode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index f8bf75c1eca9..0a1748444329 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -361,7 +361,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi) &&
 			fi->i_flags & F2FS_COMPR_FL &&
 			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
-						i_log_cluster_size))
+						i_compress_flag))
 		return sanity_check_compress_inode(inode, ri);
 
 	return true;
@@ -490,7 +490,7 @@ static int do_read_inode(struct inode *inode)
 	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi) &&
 					(fi->i_flags & F2FS_COMPR_FL)) {
 		if (F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
-					i_log_cluster_size)) {
+					i_compress_flag)) {
 			unsigned short compress_flag;
 
 			atomic_set(&fi->i_compr_blocks,
@@ -728,7 +728,7 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 
 		if (f2fs_sb_has_compression(F2FS_I_SB(inode)) &&
 			F2FS_FITS_IN_INODE(ri, F2FS_I(inode)->i_extra_isize,
-							i_log_cluster_size)) {
+							i_compress_flag)) {
 			unsigned short compress_flag;
 
 			ri->i_compr_blocks =
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
