Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DCA6598B9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Dec 2022 14:29:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pBFRr-0003Je-Fy;
	Fri, 30 Dec 2022 13:29:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pBFRq-0003JY-8s
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Dec 2022 13:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F5P212tNhU2MdBd8W83CXlcWw1RUzkk+/qbvM+EsgtE=; b=QAzwEadS49X6xRioGTliVz5F1D
 ebSWSc2PVpuqi1pgrDJO/RczKjBT+dEfat15Fp8kiyGYTRPesD8xIePUqTDpgTO1aLza+bGwn2hKY
 MA41WRygtRL9rzRsyRQSzGuxCwvF7NvzpqYgQ8bqH3/cXVIj4GFMnbUtukbUCXwr5Yug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=F5P212tNhU2MdBd8W83CXlcWw1RUzkk+/qbvM+EsgtE=; b=Q
 U/p50XgmrZr739hgGNFxwm1dzBnUu8H3psyRyjRwRTQ4znkzOjTaeKdseIDQ9DbRrXeAZN8GVu1PF
 cUKT0ileYcrj62kJG3SuMzSkKuJpD6nuqI0MLKqtPVy8WRkB33NR3Xtu9GMfKIy4svZW8af4hFeDe
 6ijtx5ieohnf9Dvo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pBFRk-0002of-Gb for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Dec 2022 13:29:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 95E35CE184A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Dec 2022 13:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCFDAC433EF;
 Fri, 30 Dec 2022 13:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672406944;
 bh=niN4//FFQLqT+lccFSrIwvGHtpHQO5j4UdQf+dAxTnM=;
 h=From:To:Cc:Subject:Date:From;
 b=Q8Z9F1TdYSn+DHTUxC0tV6CvgAHrJOkO5FS+1xoIU/hT+CkbagXRWd+nGcoQ7G+oY
 1QABx5QNGJ4MojljBreW7J6SqybB4ua+Z7K/CoVuZXX9uC0n4P0zo+X55yDOKvUubL
 PHLVndJhdf+zQxLjSDF/wkNWw59kBNSelibr8zmXgfAVw08xcUNSyG/GDra/lIqWo/
 SuMuf7ysAJlpw/vWb/dcZtItBAIsyY7oSAo8iebf5fgaHZN7thPjdHC3MX/i4cLQIL
 RbU4b4wNyOxl1QazZf9GFWYdu5inJ3fR5cYJa4YloshTyH+R5KZf9wDXHMRlAQuOdk
 UI6VDL+WnXmeg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 30 Dec 2022 21:28:56 +0800
Message-Id: <20221230132856.4248-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If kthread_run() fails in f2fs_create_flush_cmd_control(),
 it should not release SM_I(sbi)->fcc_info, otherwise, w/ below testcase,
 it will cause NULL pointer dereference when accessing SM_I(sbi)->fcc [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pBFRk-0002of-Gb
Subject: [f2fs-dev] [PATCH] f2fs: fix error path of
 f2fs_create_flush_cmd_control()
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

If kthread_run() fails in f2fs_create_flush_cmd_control(), it should
not release SM_I(sbi)->fcc_info, otherwise, w/ below testcase, it will
cause NULL pointer dereference when accessing SM_I(sbi)->fcc_info
in f2fs_issue_flush().

- mount -o noflush_merge /dev/vda /mnt/f2fs
- mount -o remount,flush_merge /dev/vda /mnt/f2fs  -- kthread_run() fails
- dd if=/dev/zero of=/mnt/f2fs/file bs=4k count=1 conv=fsync

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 2646575f43de..7b18e8c02f5d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -663,8 +663,7 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi)
 	if (IS_ERR(fcc->f2fs_issue_flush)) {
 		int err = PTR_ERR(fcc->f2fs_issue_flush);
 
-		kfree(fcc);
-		SM_I(sbi)->fcc_info = NULL;
+		fcc->f2fs_issue_flush = NULL;
 		return err;
 	}
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
