Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D8E4060D9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Sep 2021 02:20:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mOUHa-0006h0-3S; Fri, 10 Sep 2021 00:20:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1mOUHY-0006gg-PE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Sep 2021 00:20:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P8qj/y2+ezc1tNhCIybOC9nKYTueu4a62okj5I5aTrM=; b=kYiF+yl7zS74cLZLbDxxn3drtw
 p7lrcbRYxfBgoAzZBnS7elDAWivCQKwbMh+CIwG1zlmm1TbVaxC6KMGm4mdx36y5jLXvShAJYb3z5
 b3KkGtV41QtqwrkCatTfubhrUh0olGwkKCPUujWHtmfjXET1kO3xCARSfadHD7cW8ctE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P8qj/y2+ezc1tNhCIybOC9nKYTueu4a62okj5I5aTrM=; b=USfoNA5H9JEF5njit6NsPtTBdH
 fazfEB6rNFZ0gv9ptm/4zbNW/dliWngeR4EKDKDq512pRLXcIdcx+2880owKGvnw8ZoE0WtvTPyeW
 Anbm2T9Ohb0cP7C078wMMqRLq4z/+HI8ncT/eFVoBovfr1DCNnf+oGh+6uuxxWSHePnk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mOUHY-005S5r-9L
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Sep 2021 00:20:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19FF6610A3;
 Fri, 10 Sep 2021 00:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233234;
 bh=fTcZ3cYtTT+hrBpIaRoONPfiCMU7LCbwOJh9LibM75A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OsU3vSSlKErm+a3GxToor/YiOr2UIkQ0eay7hHt/Y+Tsrr0yFd7rysjxUowDU+GGs
 GCbjeIkW+Qi7AfiEUQo42N/C8lUskPg1JbT3dJ6xBYNKmdDNrMJuG1/Ey0ct+0ai3L
 jn6cPYHtScAprVpkuIkaUKsZGml+T/U7NJ6oIe85xmBCzWPlpgtiPI9eW2pyUVF6PR
 Vdy2hGR5flRTnaMKgLoPhysi7KIaBqpfJyRZ1AaPjrV/89z1ZRlJ5cYO7kXK/o0INP
 bVg2YHdhMLl/KW9Wb60LW/ksoQQ6WTzOHAf1tmkd3NQqlht4rhnjo/R7YmdDM/hAMf
 h5+AERD2QTXaw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  9 Sep 2021 20:19:39 -0400
Message-Id: <20210910002028.175174-4-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002028.175174-1-sashal@kernel.org>
References: <20210910002028.175174-1-sashal@kernel.org>
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
 Content preview: From: Jia Yang <jiayang5@huawei.com> [ Upstream commit
 10d0786b39b3b91c4fbf8c2926e97ab456a4eea1
 ] This reverts commit 957fa47823dfe449c5a15a944e4e7a299a6601db. 
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
X-Headers-End: 1mOUHY-005S5r-9L
Subject: [f2fs-dev] [PATCH AUTOSEL 5.10 04/53] f2fs: Revert "f2fs: Fix
 indefinite loop in f2fs_gc() v1"
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
Cc: Sasha Levin <sashal@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jia Yang <jiayang5@huawei.com>

[ Upstream commit 10d0786b39b3b91c4fbf8c2926e97ab456a4eea1 ]

This reverts commit 957fa47823dfe449c5a15a944e4e7a299a6601db.

The patch "f2fs: Fix indefinite loop in f2fs_gc()" v1 and v4 are all
merged. Patch v4 is test info for patch v1. Patch v1 doesn't work and
may cause that sbi->cur_victim_sec can't be resetted to NULL_SEGNO,
which makes SSR unable to get segment of sbi->cur_victim_sec.
So it should be reverted.

The mails record:
[1] https://lore.kernel.org/linux-f2fs-devel/7288dcd4-b168-7656-d1af-7e2cafa4f720@huawei.com/T/
[2] https://lore.kernel.org/linux-f2fs-devel/20190809153653.GD93481@jaegeuk-macbookpro.roam.corp.google.com/T/

Signed-off-by: Jia Yang <jiayang5@huawei.com>
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/gc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index e02affb5c0e7..343b9baf0d08 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1727,7 +1727,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 		round++;
 	}
 
-	if (gc_type == FG_GC && seg_freed)
+	if (gc_type == FG_GC)
 		sbi->cur_victim_sec = NULL_SEGNO;
 
 	if (sync)
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
