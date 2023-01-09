Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D74661CCF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Jan 2023 04:45:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pEj6C-0004gF-Sb;
	Mon, 09 Jan 2023 03:45:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pEj6B-0004g9-UT
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jan 2023 03:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rHRshsuBf+8lCGtLmK89FWYAz7KW/e2jrXHpUqGarjU=; b=B3nSe4jc/yu2LGd8FUaimUpNC+
 opaEorW1TaqHhdfFBBydfsPLIH7kiMktOHPPlekn2wFoCGk9cEnyEJ0RKCClTwKPLerllsGw00uEs
 7XXbbLBvT39MElAh5/6+2Ancz+tTEn/c8GCUdh8vM8Gq9SPSHksZYO4AgJfmj4b3j1CI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rHRshsuBf+8lCGtLmK89FWYAz7KW/e2jrXHpUqGarjU=; b=cxS6GCP1M4IqlopHFQ5bYPx3xI
 7tPbwe3MWfv0wLwiudwAY3ungDA9VQfbyltgjn0l8/cKbPlz/cX5sDZqnFYfvQug/aLSKhLvUYXKt
 yithKz9uSF2Yz96vZdELkSKKjKddJXm+N5vzTjHkU6NHublr/qj72A+ETeJtOiy3qr8s=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pEj6B-0003WY-88 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jan 2023 03:45:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0042BB80CA0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  9 Jan 2023 03:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8769EC433F0;
 Mon,  9 Jan 2023 03:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673235915;
 bh=hVQIDpSVJOnPY2pK3qWpbcFhTb9CAdeMNX3yCL8XtEw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tjJos42kd7YwDy512Qj+aLjV4Lf4PU/FjJhfrLf/9lBdLNo8IV4QeYNs4yxC6TXdn
 LCk6WkCi4srQ/ohEXXB8RUPAPD0oDBPiVtQ3hYVh2j/BBoJKKfDi21Oj+gXI6tucyN
 azQGIomcooCa+UMy1wTUrISbPzyjY0/Gzd9by6iz/3VuArvhLCEPhcWo42enhqRVgn
 PzMSaOd0YiKYCJZcjlPDvLNP1CXttCtFTqpJ2HAuenfd/0op4YNFEwfJ1bNqShu9bK
 XeqL4Sg0O3/3/bRFqJxuO4HDsFrBxKiZJnxOCpQg9MDiKYP1c0KYGQ4Tk4QmLyJOME
 SbusW1M3r6woQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  9 Jan 2023 11:44:51 +0800
Message-Id: <20230109034453.490176-3-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230109034453.490176-1-chao@kernel.org>
References: <20230109034453.490176-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit 7a10f0177e11 ("f2fs: don't give partially written
 atomic
 data from process crash") attempted to drop atomic write data after process
 crash, however, f2fs_abort_atomic_write() may be called from [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
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
X-Headers-End: 1pEj6B-0003WY-88
Subject: [f2fs-dev] [PATCH 3/5] f2fs: fix to abort atomic write only during
 do_exist()
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

Commit 7a10f0177e11 ("f2fs: don't give partially written atomic data
from process crash") attempted to drop atomic write data after process
crash, however, f2fs_abort_atomic_write() may be called from noncrash
case, fix it by adding missed PF_EXITING check condition
f2fs_file_flush().

- application crashs
 - do_exit
  - exit_signals -- sets PF_EXITING
  - exit_files
   - put_files_struct
    - close_files
     - filp_close
      - flush (f2fs_file_flush)
       - check atomic_write_task && PF_EXITING
       - f2fs_abort_atomic_write

Fixes: 7a10f0177e11 ("f2fs: don't give partially written atomic data from process crash")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 434c0d89c145..7b62c533f6d3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1876,7 +1876,8 @@ static int f2fs_file_flush(struct file *file, fl_owner_t id)
 	 * until all the writers close its file. Since this should be done
 	 * before dropping file lock, it needs to do in ->flush.
 	 */
-	if (F2FS_I(inode)->atomic_write_task == current)
+	if (F2FS_I(inode)->atomic_write_task == current &&
+				(current->flags & PF_EXITING))
 		f2fs_abort_atomic_write(inode, true);
 	return 0;
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
