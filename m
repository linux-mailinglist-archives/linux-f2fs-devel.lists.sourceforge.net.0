Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD35A4CE18
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 23:17:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tpE6a-0001vX-NI;
	Mon, 03 Mar 2025 22:17:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tpE6Z-0001vR-MG
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 22:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aqdc8cmE8ZHerCyHHMFPatrMgp9jT+v+ZI3d4hO3MDc=; b=APRzP1SpWiYczxbjjlOBr9C1P1
 m8wsAkwPrFN3rKAqiyGumQ3DIKSXKdoT8xke1qPL89q8GxGEBFxm4FO6ek47QPxazrDnOV3Je3UeV
 dfI5UCIeUfhvChnL7HNHCHJj9SCOJbpT3THJKFxpmjMwgVW6qDFfssifACxf0Qu5jshg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aqdc8cmE8ZHerCyHHMFPatrMgp9jT+v+ZI3d4hO3MDc=; b=U
 +oAKffYfnsQSdBnWaDkGJ0U1u/MkdrFbedlZCqOuwwYFXBMiIXtxOP/z0Sz2Nq1I7rRNUA8jp3WlY
 cb4iD0C0RdlnJKkSOdSZEIJSknmnziPQpZe9tZfy9GW0t+c/3XvPqoAERf81HQ7orEbayz2ipgYi1
 p0bNm1yi7AAlUg7E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tpE6Z-0004gH-1d for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 22:17:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D53235C49B0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Mar 2025 22:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476DCC4CEE5;
 Mon,  3 Mar 2025 22:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741040252;
 bh=3Dhep88DZZmRiLR4JWC42gaVSxkJVdFR1Myn7cDYqJ8=;
 h=From:To:Cc:Subject:Date:From;
 b=k8IkKKnSuXX9oOfKUomPgZ7LlFvIL5SR4515wYm59tc2uZ5PIjBjagYViP42eluJ1
 +i7vI38FZeb29Q8uumRm08MMoc1Kajy5RCIP7K2JO52x88tntP2CaAwbA5MVEKuQb2
 JhUUTkLVMy3NrcbivsDlUWkT4pHB0KR+V4GFvuz89SVaK9ByRzRCDcQ9kOzmTJbCz4
 U4cUsOP62FGX/N2k1fT8b9RaKLwBV0uHXtoPFZcbD2j0obA9jcHquAuXz/Ys5iiv86
 NIpr4u8rRjLmZsEt9imeuvcnNe0rmQhvYnq3P/SHKO6PQQWsWIKtGFnLywyjjQOZwM
 anBGgrZjSx+hQ==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  3 Mar 2025 22:17:30 +0000
Message-ID: <20250303221730.1284822-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The checkpoint is the top priority thread which can stop all
 the filesystem operations. Let's make it RT priority. Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> --- fs/f2fs/checkpoint.c | 2 +- 1 file changed,
 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tpE6Z-0004gH-1d
Subject: [f2fs-dev] [PATCH] f2fs: set highest IO priority for checkpoint
 thread
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The checkpoint is the top priority thread which can stop all the filesystem
operations. Let's make it RT priority.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index bd890738b94d..8dbb815a35c0 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -21,7 +21,7 @@
 #include "iostat.h"
 #include <trace/events/f2fs.h>
 
-#define DEFAULT_CHECKPOINT_IOPRIO (IOPRIO_PRIO_VALUE(IOPRIO_CLASS_BE, 3))
+#define DEFAULT_CHECKPOINT_IOPRIO (IOPRIO_PRIO_VALUE(IOPRIO_CLASS_RT, 3))
 
 static struct kmem_cache *ino_entry_slab;
 struct kmem_cache *f2fs_inode_entry_slab;
-- 
2.48.1.711.g2feabab25a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
