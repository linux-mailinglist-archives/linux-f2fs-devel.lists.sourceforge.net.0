Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C88E675725F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jul 2023 05:37:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qLbWu-0001hO-If;
	Tue, 18 Jul 2023 03:37:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qLbWq-0001hI-JG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jul 2023 03:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CWkwQcE4g8D4UrLpsfSAjGxcsIg6pZV2OqZut64Zaco=; b=CNRwyVPOPqNhidmdO6c1wyZeGg
 aFJEGCJPF2THhVlHOu2bEqTYfnfmKU8DIcZvAG16Zxou7oYFgFOjwnXoTOVFWBS0DDDwLWCIktQ5A
 XP7vMKncMCkXlIZG2R9QrSfbPcbBcfM5ASkKvjj05MYqAIHYTRbJ4pABceTAjiOXusP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CWkwQcE4g8D4UrLpsfSAjGxcsIg6pZV2OqZut64Zaco=; b=K
 +LbQc1d1TsMv/VWN3LU6pWGlc+Fuv3THLA8v2Y3QUQwQ8KoyzAhy4oJ9LfbSwnnjF8vbtNqkciy0G
 rmfNLfgmoAUeqZfAZGYMioTYKTpH4Ho7iHI7ELQVdQN+EWjfXMYlGaSeETo8O96I7oMHWFHG8ZQSE
 c3emwXdf/vMn6iTc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qLbWp-00BOnh-VA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jul 2023 03:37:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 67FC0611AB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Jul 2023 03:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC99DC433C7;
 Tue, 18 Jul 2023 03:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689651449;
 bh=hqFX19ePvyggE5tbXCUO/gQvepzTAxskGKPLrtqrsCk=;
 h=From:To:Cc:Subject:Date:From;
 b=GBsE0ZYVYD0aGMpJPLV8PPYdjDfJ88jehvx8DcDctj/hQtf/cY0EFLjjtl4ZhPFOj
 Zl5H7g05zDh9XNNAergvZuIVLgZYBCgYc63lc3s3RPeODm2SRgqunKHrYlTMxgy8nT
 SUzpCqnze1LxkltBv5resZQNP/2kkdGLpFtDPc8HWrhXJc0olOL5vUR5R08dqhcVEx
 M62qlPw/hyh+z1xxjC8Oxy8dlwUL5ZUuHIco2JZaOArVbKo4epyKEsh3EuGRtm13BJ
 ggvIreDFTlel7nPS6W1P0FPlT7te70G8skLXzLshxM+fQxbXvqONUm2+3rFzs2W030
 hG/C9h12C5vgw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 17 Jul 2023 20:37:28 -0700
Message-ID: <20230718033728.1286392-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  external/f2fs-tools/tools/f2fs_io/f2fs_io.c:1452:3: error:
 format specifies type 'unsigned long' but the argument has type 'u64' (aka
 'unsigned long long') [-Werror,-Wformat] range.start, range.len, r [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qLbWp-00BOnh-VA
Subject: [f2fs-dev] [PATCH] f2fs_io: fix build warning
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

external/f2fs-tools/tools/f2fs_io/f2fs_io.c:1452:3: error: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Werror,-Wformat]
                range.start, range.len, ret);
                ^~~~~~~~~~~
external/f2fs-tools/tools/f2fs_io/f2fs_io.c:1452:16: error: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Werror,-Wformat]
                range.start, range.len, ret);
                             ^~~~~~~~~
2 errors generated.
20:35:27 ninja failed with: exit status 1

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index b4e73079e76c..73ac700f8209 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1447,7 +1447,7 @@ static void do_gc_range(int argc, char **argv, const struct cmd_desc *cmd)
 		die_errno("F2FS_IOC_GARBAGE_COLLECT_RANGE failed");
 	}
 
-	printf("trigger %s gc_range [%lu, %lu] ret=%d\n",
+	printf("trigger %s gc_range [%"PRIu64", %"PRIu64"] ret=%d\n",
 		range.sync ? "synchronous" : "asynchronous",
 		range.start, range.len, ret);
 	exit(0);
-- 
2.41.0.255.g8b1d071c50-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
