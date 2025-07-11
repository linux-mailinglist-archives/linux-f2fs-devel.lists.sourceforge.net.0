Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A61B01512
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Jul 2025 09:46:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4mNTw3vc9lxVLI7eGtb1jPy7C/fFUqlicHaHID6j2ws=; b=Few+/L57mrvKm7DUIHRPDSch0h
	QIJsEsVUEmfJIglULWFkb7e67zCo6oKg55je+FO1fSj0ywSv86NQEdXiXxjeCEH/d1dXi5PpfQYOe
	MwhpX6V+M1o/xhHhypscZFs4TuJYiZEnXhB3mtW/ECzHxjyn5yeuzGO7182sq1QZ79sc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ua8SR-0001j3-NB;
	Fri, 11 Jul 2025 07:46:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ua8SP-0001iw-Rt
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 07:46:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3NSNVh/QFYSE6f+ShmYnUo4p5d0aRTuS0cW+PYQiDgw=; b=jmJEzc++sqT+Sjj/bLmNfpm8x3
 K6bjrIDETaGFg51wJzPvzdorgwSbCYeZJwj0pJP7wnKYHuqYIN28clAG/RFuNA9VMbRFwkKBpDfNb
 k6/aIds0r2s61I4amk9dokVgCopImDbS7IeawWUK+MsvlZyg4PW4POVDOoWlOjTaP41g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3NSNVh/QFYSE6f+ShmYnUo4p5d0aRTuS0cW+PYQiDgw=; b=Z
 ezMIBfGErdlb17XTL4gFp3xwV4jQaC4lDhT8umC0v29aIgKfFxz8h9KvMde9RNzuNW9lSgVE4MH+y
 dXuIRDsiJkMTgLCWaUuSk6go7TQYGYor8KPO6xDnuC/IndxkTqwXZppk4yMd4Vox6E77JuUG/HcKa
 0l2ax8/DTRC4sb+E=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ua8SL-0002WO-Ji for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 07:46:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C79896115D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Jul 2025 07:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB93C4CEED;
 Fri, 11 Jul 2025 07:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752219959;
 bh=921vVFRFTboXidfmunKqTGrsbzazjgFSQp95Mq3e5Zk=;
 h=From:To:Cc:Subject:Date:From;
 b=b5QD/kUg8fftP8gNf7GW9gEDiJxQIyGWdJnGqwQv3+lqQi/JaNDgzOFu4wjg43G82
 CVnovMky2mGzyISMVNwrQ4V1bKwRdxEoCUQ3MKZC0BEGQ2qkqw0yesRYxRxJ8lri0O
 /g6ax0xU7JjMbceyK8Fq83v9Fd7Xj4tSGXA9/6R/UOkJj+AIb+gwvpdhwxx3nLVNqd
 0n1e2FTFHQifi2eMIpXKSXByEhFjGwHiS0S+EJvRoUrFsQvE4feZpkeaaOSoSxOYp0
 BmDdbMbr5ufsHQ3PUOzO9DFpVuMuCkN0qVtr+1fxLsacR/5pAk7rmwJPOU1rTYNSqj
 ZFP/YG6ng/ycQ==
To: jaegeuk@kernel.org
Date: Fri, 11 Jul 2025 15:45:49 +0800
Message-ID: <20250711074551.216069-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It allows to print more informations once assert() is
 triggered
 in init_sb_info(). Signed-off-by: Chao Yu <chao@kernel.org> --- fsck/mount.c
 | 9 +++++++-- 1 file changed, 7 insertions(+), 2 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1ua8SL-0002WO-Ji
Subject: [f2fs-dev] [PATCH 1/3] fsck.f2fs: allow to print more infos before
 assert() in init_sb_info()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It allows to print more informations once assert() is triggered
in init_sb_info().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/mount.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index a7f16e7..dbbeb56 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1261,8 +1261,13 @@ int init_sb_info(struct f2fs_sb_info *sbi)
 			if (get_device_info(i))
 				ASSERT(0);
 		} else if (c.func != INJECT) {
-			ASSERT(!strcmp((char *)sb->devs[i].path,
-						(char *)c.devices[i].path));
+			if (strcmp((char *)sb->devs[i].path,
+					(char *)c.devices[i].path)) {
+				MSG(0, "paths mismatch: %s, %s\n",
+					(char *)sb->devs[i].path,
+					(char *)c.devices[i].path);
+				ASSERT(0);
+			}
 		}
 
 		c.devices[i].total_segments =
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
