Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F77B1029E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 10:02:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k9JOQb31WcPh3fJkJX9Poe4Ixa0liG+3RhATsCw+KfI=; b=BQIX6y0zWyzMn6AqYZ99kOWlGQ
	bEBdMmeTG42HkgrXmvwfqFjgVXKa8cBx6FQp9sGhEVjbSxjASLqMNa2+A/TRh323Fy348b/MiJPVc
	r/7aoclG9OWj6/7Nf0IYShkuJmlTph7r3ANyOujvwMjJHv0cXMuUMVbp6Twhw+H8G+eE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ueqtz-0004aD-Q8;
	Thu, 24 Jul 2025 08:02:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ueqty-0004a5-Jm
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 08:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qCxKa+CV0Ap3TNmX/c8TgU72nPKfxspzlSS7KA3hPks=; b=WLIcA9yMQMXI5h6/cPAjUy5LCJ
 vQWQBKuQQdg2sRy2RtYxm1mF8P3s1lXWek/lqoUbQhksbhJjk3bW/xJi2wwKsHpScR1I0JioxeuA8
 3Dy6CHyEBXAXPmNqSHlMuLQwR3IQyOz7wUs4/5kkri1Av4WgBVpa4BJrfP1xDaNNnI8o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qCxKa+CV0Ap3TNmX/c8TgU72nPKfxspzlSS7KA3hPks=; b=Y
 tnb4fXeGsG2pyUpY6v03I8cd+WUygINTixXlmpCa7br0UMRiBXlbRVKbHvUZc6j6tWDauaUkH7COD
 pGaHjew2ZcLEnPi2D/rFzH9cEeS6vvR7wb6CMT902l5AZkA6emiQAML2RmFkZ7ldJOcrl9j/bhcbo
 gQWTYSeGnU0xNFGI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ueqty-0007mQ-8e for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 08:02:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7BAA56111F;
 Thu, 24 Jul 2025 08:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91B4C4CEED;
 Thu, 24 Jul 2025 08:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753344115;
 bh=duxK4sSteoH+27SnghsS+Y78BsSKvV3qvjRvfw2ymeI=;
 h=From:To:Cc:Subject:Date:From;
 b=Mz8KnVFgiX1z/ywV/YlLjavASRHQitNmwRFub0rw+esDivit0+UnBhtbzTFkRcj2f
 70Uq7Dg8wS9W8cfcjdeu58CU4wQIQjYDO7HPtw69e4Mij9dVJetueEP1CMQWcVDffh
 cvy4oh9Kb8b1cdZuotCnoQ/kO4lFEr8mKW+M62EBpFoiKXDjHtklUz/mUzuLYZFjNv
 1Smc5AKBDlwsR525Hr7Mp55dLUfWyVS2xgriSyTvwVj1iu+O2nrUeo1i/Vv+Bbub60
 7SicCnYNWtssr8X/mmjRjhDB/iO8F4T2kIrxGd4/0fv7/pQj5tHbawfFkH3KIj6QNY
 YHUF0iv7SyLBw==
To: jaegeuk@kernel.org
Date: Thu, 24 Jul 2025 16:01:42 +0800
Message-ID: <20250724080144.3689181-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit 1acd73edbbfe ("f2fs: fix to account dirty data in
 __get_secs_required()")
 missed to calculate upper_p w/ data_secs, fix it. Fixes: 1acd73edbbfe ("f2fs:
 fix to account dirty data in __get_secs_required()") Cc: Daeho Jeong
 <daehojeong@google.com>
 Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/segment.h | 2 +- 1 file
 ch [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ueqty-0007mQ-8e
Subject: [f2fs-dev] [PATCH 1/3] f2fs: fix to update upper_p in
 __get_secs_required() correctly
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Commit 1acd73edbbfe ("f2fs: fix to account dirty data in __get_secs_required()")
missed to calculate upper_p w/ data_secs, fix it.

Fixes: 1acd73edbbfe ("f2fs: fix to account dirty data in __get_secs_required()")
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index d2c73f641134..2123645cf175 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -678,7 +678,7 @@ static inline void __get_secs_required(struct f2fs_sb_info *sbi,
 	if (lower_p)
 		*lower_p = node_secs + dent_secs + data_secs;
 	if (upper_p)
-		*upper_p = node_secs + dent_secs +
+		*upper_p = node_secs + dent_secs + data_secs +
 			(node_blocks ? 1 : 0) + (dent_blocks ? 1 : 0) +
 			(data_blocks ? 1 : 0);
 	if (curseg_p)
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
