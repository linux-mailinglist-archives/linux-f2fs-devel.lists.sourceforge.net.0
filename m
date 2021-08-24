Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD59F3F5405
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Aug 2021 02:12:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mIK3M-0000Li-Mc; Tue, 24 Aug 2021 00:12:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mIK3L-0000Lb-D0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Aug 2021 00:12:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kCEpNEeJgX3UbKfTZuz8ekTg1IHKx43zf1JLu2WzEZg=; b=DRW9KrY0vaq1nQgzrjfymNKIQj
 EUSX+h4lOlKXGLX9lvTBXl+rw1N4ODxBX8UBy5SfwQrOz4RUwcWU6XHuS1KUubKYA4EVIzRBFgZ3J
 nQzCuiXp+98F0tiA46dj5jSFiXhEsuiAIJzpuwxoBxb6TAwU9Ozfd+oxfWNs0Wb4gdDk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kCEpNEeJgX3UbKfTZuz8ekTg1IHKx43zf1JLu2WzEZg=; b=V
 tIo6ukqyNrbV5Kmw/f7nvhvzxmljlEFllrS3Tw5KiwNaeKt3jYk+J5PZ6y7cYzCFKAV8p7ohFkhpl
 VkP2QkeN+yJPkZ7+OYalk2NhP7uUXEZM/rnCEtc8YIaLgK6+368m6X+7aF8/2bL1eiDVHuQ1QRay/
 n5QDR0PT8YKu2qJM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mIK3K-00GIRz-1v
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Aug 2021 00:12:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1953861052;
 Tue, 24 Aug 2021 00:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629763934;
 bh=R4PBDrabhdLVRyrQpEgZnIix3ZrqUr8Ms4laA+oA8EQ=;
 h=From:To:Cc:Subject:Date:From;
 b=LGxBHpxzUweIm67VnnU/0/cNRLceaxgKyVefuc759RoE60i1Rg604nLPSVQUNaSut
 gX+JnTi8V/l+f4s9zhRpY/u65/8bsSCYVFLHadiPgaiPhWKPbyChV8YtFgw6CJReCG
 O6CIa6lFLMUv+fERyZ4GpYW2ubUGU+elyGxVLph1fxfFhE3i0zBEOG8RSozt3oFHcm
 4EigZjIjKxehVcfrOSkXf7t3b1iSssJpUiSWEzLZvgPI4mCyvmEsQFI7a0AkbhyZLY
 Mfh7/uZ3poq3ZXAmYeab6mOqbeUBxdqOuyPv/TP+YNWOcswP1m8lI0bRdMivkV9/sI
 KYj3ib4LobZIQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 24 Aug 2021 08:12:08 +0800
Message-Id: <20210824001208.12942-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There is a missing place we forgot to account
 .skipped_gc_rwsem, 
 fix it. Fixes: 6f8d4455060d ("f2fs: avoid fi->i_gc_rwsem[WRITE] lock in
 f2fs_gc")
 Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/gc.c | 4 +++- 1 file
 changed, 3 insertions(+), 1 deletion(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mIK3K-00GIRz-1v
Subject: [f2fs-dev] [PATCH] f2fs: fix to account missing .skipped_gc_rwsem
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There is a missing place we forgot to account .skipped_gc_rwsem, fix it.

Fixes: 6f8d4455060d ("f2fs: avoid fi->i_gc_rwsem[WRITE] lock in f2fs_gc")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/gc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2c18443972b6..77391e3b7d68 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1500,8 +1500,10 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 			int err;
 
 			if (S_ISREG(inode->i_mode)) {
-				if (!down_write_trylock(&fi->i_gc_rwsem[READ]))
+				if (!down_write_trylock(&fi->i_gc_rwsem[READ])) {
+					sbi->skipped_gc_rwsem++;
 					continue;
+				}
 				if (!down_write_trylock(
 						&fi->i_gc_rwsem[WRITE])) {
 					sbi->skipped_gc_rwsem++;
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
