Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0D6B04F7A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jul 2025 05:48:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wxS08OvhCGQn6dIgqMEjyrt/9UUm3HBpeQewSW0/72c=; b=WoHirXA6Kt5JkRhN6MhfLjdlWH
	ifUynFE+PvxU2JTrzbgpniFhHn7uWFuzorT26Q4BYkrw9ZhgGsKqIz9YC8HIvbAEGpMp9/+AqTR6H
	jXQjKLS0/8Vr8t5BcTqy2SR8cgQLigxRx6t0hHvZqjPXIbJFxd3PACRgLQuWJMlWIXKY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubWel-0004Q4-OL;
	Tue, 15 Jul 2025 03:48:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ubWeh-0004Pv-3O
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 03:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8ZsWC/xy6ivAVLgGoptxG17kDa5kqp7XduKtycp6Dj0=; b=iDxdRmhaA1cSJKuUsQUJNGdsFE
 1O04e+8cZqIqYdLca8WllWNGe7dLeiVtkgDxxurc5v+tdoplKUY9sNom27xxT1JbSd6vB813M5gRn
 rGYz6ec9LQik+gIzHt88IMTED2PZCdgX2dfAL2NV9KMa6JMPxK+vsIz7E1YS4Ea1b1KQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8ZsWC/xy6ivAVLgGoptxG17kDa5kqp7XduKtycp6Dj0=; b=b
 mgR7bqWYjx3sTWp8dHSjTPxQXRXzrKYiYgdLDJYSjmhJKURGh1zZqR7q7k/Xt0OkYKdoGudC2aMVz
 eAE9ynDPAUBCcroRLyvdtSOxHoJt+Hxfjs/nkRAMuAxkN8DcwUjhcB3bZlTuDRjroQnoIN4BFHBzS
 TAxjlpU3foHvCrLo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ubWeg-00038p-Pg for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 03:48:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CCBE543767
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Jul 2025 02:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE822C4CEED;
 Tue, 15 Jul 2025 02:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752546643;
 bh=96GljATNHlwW+Ta+iLWZI2r2gbQnVj4VFyRi/hkx3vA=;
 h=From:To:Cc:Subject:Date:From;
 b=SCOir/75NKgRfmOROV7oW92Rq7SVk9qXgDZMgoz5OrKJ7zti6Ap3c73fk6lqrY91D
 eN8CFNX1GoeiJ2m62noJxY19CP/KLJ6tFehygSigJLzWXovNDkdmnSap9H3yBsqvkl
 Ja8yrsa9ef4kMpjb3g2w7nFM5pJala6rCaP7XN8lbyV+aOdswCpfLh1xoB+zBdVnfT
 CKZsTfhmOGhBQwQAS74tVp86aSBb7mhek9/z67JPi4BtylYgqM2C3OHIiYy/Fnq84x
 j2hASHXb877wzinudC/i8wl4S2LLWuTGKrYmNzBkRfRpF4pGnV9h604nxUkBSgc50h
 5pIAHlGsZaJJw==
To: jaegeuk@kernel.org
Date: Tue, 15 Jul 2025 10:30:35 +0800
Message-ID: <20250715023035.487742-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch fixes wrong parameter in usage of
 test_lookup_perf.
 Signed-off-by: Chao Yu <chao@kernel.org> --- v2: - drop change for f2fs_io
 manual tools/f2fs_io/f2fs_io.c | 2 +- 1 file changed, 1 insertion(+),
 1 deletion(-)
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ubWeg-00038p-Pg
Subject: [f2fs-dev] [PATCH v2] f2fs_io: fix doc of test_lookup_perf
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

This patch fixes wrong parameter in usage of test_lookup_perf.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- drop change for f2fs_io manual
 tools/f2fs_io/f2fs_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 8e81ba9..f282190 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -2241,7 +2241,7 @@ static void do_test_create_perf(int argc, char **argv, const struct cmd_desc *cm
 
 #define test_lookup_perf_desc "measure readdir/stat speed"
 #define test_lookup_perf_help						\
-"f2fs_io test_lookup_perf [-s] [-S] <dir> <num_files>\n\n"		\
+"f2fs_io test_lookup_perf [-i] [-v] <dir> <num_files>\n\n"		\
 "Measures readdir/stat performance.\n"				\
 "  <dir>          The target directory in where it will test on.\n"	\
 "  <num_files>    The total number of files the test will initialize or test.\n"\
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
