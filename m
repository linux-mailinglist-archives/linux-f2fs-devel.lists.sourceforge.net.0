Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D045D8BCC0F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 May 2024 12:33:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s3vf0-0008Mo-LD;
	Mon, 06 May 2024 10:33:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s3vez-0008Mg-5r
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 May 2024 10:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f83KS+WRix2D0FSfjaIBor9+kyUWES/deZ9Qxf/EmwE=; b=K4lsRzkIgbvtYS2MEJQe7bhiWa
 5LZuK6Lo/xYUJUg1wQxDMd1uKx6dDx2o4TD0GR+kUVD9ynn/0wYWSK+EjhH8T/IOMEwJUDKsOTRmo
 1frFSMTkXkpJX+fnXCMOcSVf/vtyR668CG9oUjG5fLVlxwpFVo2l5rCaICjVfatMcjO4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f83KS+WRix2D0FSfjaIBor9+kyUWES/deZ9Qxf/EmwE=; b=E/R5hFp1BftsKTMkM0ygYcpBCp
 I9TnvKS//Rb75yqjFIn+GvEhZhZRDPhg7qoOZnZG64EwU2XfbRNkgQ2p93PwMtrs4LVU2YTYweMaX
 GVX/44fNRonDCKfbCvJWtfcx0WBp7B3QrPG+bmYnkMryNPjd3xbi/WpAmYOJqV7sOjHM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s3vey-00042s-L8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 May 2024 10:33:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E533CCE0C68
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 May 2024 10:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1719C4AF18;
 Mon,  6 May 2024 10:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714991601;
 bh=8d1H5ohN2OC867yx9Kz7v2nSEmt59J3n2trihH6jcFQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YsUNro59jXc0yxJ2XMnh1j9/+xx9X43rLu3WZgQ+WYy1DLyp0VXzPVAyd5JINd7OS
 mvA2tpZ98mnK26t8zizcnuhFu1QgMA9zoCbmiF6wNmNxlICzZhknuj6R7Pa+uI/EC5
 j5UShNpxwcq7gFizl1h1OSlAw1gYAF4FhnGQ2a3YG0ps0INegJv9hwiBKjhnUnY9QG
 yZlHbyIMcPno4wbhtwShSaksSCOrWPHW/F/CURfu9m5IdvH7MVDceI0baf+6oZTJKy
 pfqHJagIy1wclYghDINnZLBp/A7E+hRG095sFYt9xnJXO79st8DLBHnk2aBwl7yK2B
 Jjre/ozJIZDgA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  6 May 2024 18:33:12 +0800
Message-Id: <20240506103313.773503-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240506103313.773503-1-chao@kernel.org>
References: <20240506103313.773503-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  During gc_data_segment(), if inode state is abnormal,
 it missed
 to call iput(), fix it. Fixes: 132e3209789c ("f2fs: remove false alarm on
 iget failure during GC") Fixes: 9056d6489f5a ("f2fs: fix to do sanity check
 on inode type during garbage collection") Signed-off-by: Chao Yu <chao@ker
 [...] Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s3vey-00042s-L8
Subject: [f2fs-dev] [PATCH 2/3] f2fs: fix to add missing iput() in
 gc_data_segment()
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

During gc_data_segment(), if inode state is abnormal, it missed to call
iput(), fix it.

Fixes: 132e3209789c ("f2fs: remove false alarm on iget failure during GC")
Fixes: 9056d6489f5a ("f2fs: fix to do sanity check on inode type during garbage collection")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/gc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 8852814dab7f..e86c7f01539a 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1554,10 +1554,15 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 			int err;
 
 			inode = f2fs_iget(sb, dni.ino);
-			if (IS_ERR(inode) || is_bad_inode(inode) ||
-					special_file(inode->i_mode))
+			if (IS_ERR(inode))
 				continue;
 
+			if (is_bad_inode(inode) ||
+					special_file(inode->i_mode)) {
+				iput(inode);
+				continue;
+			}
+
 			err = f2fs_gc_pinned_control(inode, gc_type, segno);
 			if (err == -EAGAIN) {
 				iput(inode);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
