Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AF692DC40
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2024 01:03:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRgLZ-0004Sz-BT;
	Wed, 10 Jul 2024 23:03:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sRgLY-0004So-EM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 23:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RJe8ESsNDsoT/olZJf80ZSaALNhUqmYfM5+3pgQzyd4=; b=aSnldBccrff2L0VI+4wpCtxYsw
 Q5nbDFwoePJcSCqiYFrCPJU++SfR8G4VIp0yfqlVhAK/nMksLpfVP5ExA4RK85Snsa759T8rQDuMS
 n0NdjN+j32lVqg8GXA4Dvcz5LplrmfYdlTb642CulYZbETX55pSmn1DArbLyAkuUqBFo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RJe8ESsNDsoT/olZJf80ZSaALNhUqmYfM5+3pgQzyd4=; b=Q
 W7OigQ7I4fveZu5f43QL9XT2BLpk6eRd6qaWUDDniAZX4031YbtCe+Dqrp2wG72Z3h5d8yVfeh4dq
 mDyoN0Kz/3MoV8QApZc29wOf2HSOVileSdlSkMBS7yPOIVXPAU3w+QkLDnZ8zPjK2ap5ylNWabcDE
 OgTl5Syqeh39OTwA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRgLY-0003ba-SN for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 23:03:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BF80F612B8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Jul 2024 23:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC8BC32781;
 Wed, 10 Jul 2024 23:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720652605;
 bh=LLkwr8ysV5V5Ksk2Fpa/jkZ7YRtgKX22ClejkCQAFno=;
 h=From:To:Cc:Subject:Date:From;
 b=ttTe8RSGJIUdjmqzVD6x3yQ5h8PDiq9ovm5WY9i+AR4bC/eOQc1Q0381kX621Gkma
 2el7WPp1uB7PpEDX8HxwGOQp0qm5+QIPjN0cHwvF22L87gFwrt/fJzp6j+OcqEX65h
 RDqK/k/g4RnZLa8eS9cuXpBZMr+XOeoWErYsMGbC+0eEIYvKPs5TVpdFxyS+IwYkeh
 PUn86YBCcltD2XGsgH23Pa2h9axhqp9wsZUjUOUc3sbj8y3HUn6+CTEYgyM+hSUlKN
 rH2DyLa98wh2ENp9DwqexlFXScVL1eBnvEFp1HtKG5tkqYRmgSEzV8sGrHxbrF1AAM
 9AjCzZtm4ueDQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 10 Jul 2024 23:03:19 +0000
Message-ID: <20240710230319.33025-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 fsck/Makefile.am | 1 + 1 file changed,
 1 insertion(+) diff --git a/fsck/Makefile.am b/fsck/Makefile.am
 index 48402abfc98f..ea3b26a65aa3 100644 --- a/fsck/Makefile.am +++
 b/fsck/Makefile.am
 @@ -20,3 +20,4 @@ install-data-hook: ln -sf fsck.f2fs $(DESTDIR)/ [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: makefile.am]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sRgLY-0003ba-SN
Subject: [f2fs-dev] [PATCH] inject.f2fs: install makefile
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/Makefile.am | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fsck/Makefile.am b/fsck/Makefile.am
index 48402abfc98f..ea3b26a65aa3 100644
--- a/fsck/Makefile.am
+++ b/fsck/Makefile.am
@@ -20,3 +20,4 @@ install-data-hook:
 	ln -sf fsck.f2fs $(DESTDIR)/$(sbindir)/resize.f2fs
 	ln -sf fsck.f2fs $(DESTDIR)/$(sbindir)/sload.f2fs
 	ln -sf fsck.f2fs $(DESTDIR)/$(sbindir)/f2fslabel
+	ln -sf fsck.f2fs $(DESTDIR)/$(sbindir)/inject.f2fs
-- 
2.45.2.803.g4e1b14247a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
