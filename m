Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDE36EA166
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Apr 2023 04:02:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ppg6K-0001U3-Dr;
	Fri, 21 Apr 2023 02:02:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ppg6F-0001Tw-4e
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Apr 2023 02:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Iyfi/PjnhIP9XOYzCLcG69avXjDKVNa44dPm76cmEtE=; b=THE3FEuWcuMFxIxZ/MjgctHj/S
 z8AkiU+JX8qIZs4NuI+XxKp1i7e7fP1n3ApQjWNhgnSjBeCk11fTw6H5NT7WLgLcDqMeC1JeGRMnR
 zgDafvtxtyfhsre5ZQPZLSPLDgs4zW4cs6GR5PzYRhf/VW7gXnfCN49O/BREvPUDgDyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Iyfi/PjnhIP9XOYzCLcG69avXjDKVNa44dPm76cmEtE=; b=V
 417OMUnjjJ7mu4AzM1ueqKA+qQhVxQT+2rJM5UCyZxzcqik4U8ZEbcotgJUbpEBIQ+2HYzGic3m1r
 RKmAstYbv2dZywUrkfgmqY0apSU6Bk1ajvH7wAL3e3CyNDlxj0EBjvxBRiuvAgT4xr4zFM6f/CNPj
 q6pRQUU34Ss6dhV0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ppg6F-00020V-F3 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Apr 2023 02:02:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 20A9F64CF0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Apr 2023 02:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4A4C433D2;
 Fri, 21 Apr 2023 02:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682042525;
 bh=9340DfwcHIyLGEj8rbvnurntm4mO9XqyjEGJYFQnSS4=;
 h=From:To:Cc:Subject:Date:From;
 b=uWywheHbQHNcegTawbbJPT4238fUZcZ1xAsKEDARxcQ7ie+F7oqRCDPAoqIl3r/r7
 RhRIDLsCSQK+JbTEy1jEJcnKh8ReknKVnP20eSYk7a4PwxPvsn3uOmrbYfuObYXOec
 or4Os/WmAo//ceNYJy4rNNPYFnDB+05Ibq/KPblzizq0xQ8XS4g4cjloaef5OdkH60
 OfYZ1vhFmEm8NlHBPNrnW/kHlHELCQ7KMkt320Xl/rijF7+DD1PEJnKZi+rqkBlDP+
 xQstIFpJwPOXdy+jtoxA9TQSpcoupbxOnGPUMgblAbC0nbEJceF6sYpOKFU6E2YT+0
 QtTRSI/bJc57g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 21 Apr 2023 10:01:38 +0800
Message-Id: <20230421020138.2727050-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
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
 --- fs/f2fs/inode.c | 6 +++--- 1 file changed, 3 insertions(+), 3 deletions(-)
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ppg6F-00020V-F3
Subject: [f2fs-dev] [PATCH] f2fs: compress: fix to check validity of
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
 fs/f2fs/inode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index cf4327ad106c..516d5dd8f976 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -286,7 +286,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi) &&
 			fi->i_flags & F2FS_COMPR_FL &&
 			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
-						i_log_cluster_size)) {
+						i_compress_flag)) {
 		if (ri->i_compress_algorithm >= COMPRESS_MAX) {
 			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
@@ -442,7 +442,7 @@ static int do_read_inode(struct inode *inode)
 	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi) &&
 					(fi->i_flags & F2FS_COMPR_FL)) {
 		if (F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
-					i_log_cluster_size)) {
+					i_compress_flag)) {
 			unsigned short compress_flag;
 
 			atomic_set(&fi->i_compr_blocks,
@@ -680,7 +680,7 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 
 		if (f2fs_sb_has_compression(F2FS_I_SB(inode)) &&
 			F2FS_FITS_IN_INODE(ri, F2FS_I(inode)->i_extra_isize,
-							i_log_cluster_size)) {
+							i_compress_flag)) {
 			unsigned short compress_flag;
 
 			ri->i_compr_blocks =
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
