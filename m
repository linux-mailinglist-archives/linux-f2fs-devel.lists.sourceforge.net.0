Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 326BF85F7E9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Feb 2024 13:19:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rd82i-00048B-KT;
	Thu, 22 Feb 2024 12:19:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rd82f-000482-UE
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Feb 2024 12:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=egF2uKlkrZrFqBU0WSciNeTzO1/Wffz3bqGISsIOh4Q=; b=Sm0wQ5KdVtVyef+Y2T6Q93fKSH
 nhtix5yvGoNZAb4VlN03THEKDs19NZOguvfQmK/Rijj5VZ/3mesTJh3N2uObg4uC4PIswFFrErA+z
 oqyizvYaJZMmKNP35FhmkaZEmR8M6xgrliujZkO1+HpSAjAb+efHZKBR0GHvnn0hCwL4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=egF2uKlkrZrFqBU0WSciNeTzO1/Wffz3bqGISsIOh4Q=; b=XwJ/q1H32+mvrD1RwRXMDxINrD
 7AsQUNX1cWUGrXzZaofTMsiD0BmzwHSm6kZJhFprxO5bLlYRK9MPZdduXeKe+rzgVjl8kEeUTgHG+
 LKgP+GbND5jN0+yjLkwpAqSgquxXe/ztSQyZxGDqX9g9CiPOk3I7s3JMg3KFSr0b1Oro=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rd82e-0003UZ-SS for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Feb 2024 12:19:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D0F5A617F3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Feb 2024 12:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47646C433A6;
 Thu, 22 Feb 2024 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708604339;
 bh=kfTRBKt4Nbx/JzbJcvx90tf0O1Cn9EETCkS6TLsrw28=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mDPZhRslysG7G8AyvkqI8r9ViKpQOP+RQuHHkMeCIcT4GE6xkcFtwtOUwLrA0HTcl
 e4fhoauXNziXTHN2W1w3JUYD94c04YFog4zl54zZ09EZ6jcyrTi7wexP0TnXtj41nF
 pZTBiZLeS/XcY5dcSQtyG4jIEVKsl2UBDJqWeNyV9VuhMGrKpv/KdbsVKrGscfycZs
 QhzasHFMgiDW5BvPoK7K2rKzb71cWIRmOZQwNRDpSSzgNP/yAm26lcgVx8YVM2n2+f
 DDU+YdTK9Ami/i3bRM0Z+vfc8fG5QArg94/tJ+r/12G9OJ4dloiaGhIVHElja3U7FB
 kkEf90HRJXeuA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 22 Feb 2024 20:18:49 +0800
Message-Id: <20240222121851.883141-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240222121851.883141-1-chao@kernel.org>
References: <20240222121851.883141-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_stop_checkpoint(, false) is complex and it may sleep,
 so we should move it outside segmap_lock spinlock coverage in
 get_new_segment().
 Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/segment.c | 12
 +++++++++--- 1 file changed, 9 insertions(+), 3 deletions(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rd82e-0003UZ-SS
Subject: [f2fs-dev] [PATCH 2/4] f2fs: fix to don't call f2fs_stop_checkpoint
 in spinlock coverage
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

f2fs_stop_checkpoint(, false) is complex and it may sleep, so we should
move it outside segmap_lock spinlock coverage in get_new_segment().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index d0209ea77dd2..8edc42071e6f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2646,6 +2646,7 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
 	unsigned int old_zoneno = GET_ZONE_FROM_SEG(sbi, *newseg);
 	bool init = true;
 	int i;
+	int ret = 0;
 
 	spin_lock(&free_i->segmap_lock);
 
@@ -2671,9 +2672,8 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
 		secno = find_first_zero_bit(free_i->free_secmap,
 							MAIN_SECS(sbi));
 		if (secno >= MAIN_SECS(sbi)) {
-			f2fs_stop_checkpoint(sbi, false,
-				STOP_CP_REASON_NO_SEGMENT);
-			f2fs_bug_on(sbi, 1);
+			ret = -ENOSPC;
+			goto out_unlock;
 		}
 	}
 	segno = GET_SEG_FROM_SEC(sbi, secno);
@@ -2704,7 +2704,13 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
 	f2fs_bug_on(sbi, test_bit(segno, free_i->free_segmap));
 	__set_inuse(sbi, segno);
 	*newseg = segno;
+out_unlock:
 	spin_unlock(&free_i->segmap_lock);
+
+	if (ret) {
+		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_NO_SEGMENT);
+		f2fs_bug_on(sbi, 1);
+	}
 }
 
 static void reset_curseg(struct f2fs_sb_info *sbi, int type, int modified)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
