Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E11E83CFF07
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jul 2021 18:17:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m5sQV-0000kD-M5; Tue, 20 Jul 2021 16:16:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1m5sQU-0000k1-Dj
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Jul 2021 16:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pCQnKGbRrKYT5PDy2GVsH9sljSoVdHms6Oo3o3dYiBc=; b=CA20DDLfewruuJHralhoR3kCoQ
 xhoryHUKcipD0zYDBdVZWZ4L6bvmhBKOo73i6mDT0m4905EPZ3rNdxYpaTLEjJWR+3ZMHtmGsb1K3
 mdKy4jvjHIQAWGIbYr0V79vl1zzVbINEQ9GntR0ZaYWi9uegfH7uoZxkQZjNXZ/SLm+c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pCQnKGbRrKYT5PDy2GVsH9sljSoVdHms6Oo3o3dYiBc=; b=P
 H1ym8o/BRTYqWrG4/Np+Mo38Tsk7u18qUzdjD7vqN1ggKH55F2CZscESqf+8ASc0hycF1dwqa0QuJ
 1ofMTHKrZeN0pl8lWw+wG+sJ75OhN9k9SoNn0LHXTKxPXIUEmDTODvAGKP6Tfsx/CObs3BIgr1mjd
 ClJ4kHv9BQqAag0s=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m5sQO-0006HK-0F
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Jul 2021 16:16:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5999610FB;
 Tue, 20 Jul 2021 16:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626797804;
 bh=p+Pe0YiOpWyC2St9IqP+fKtMb6eDyQpswKhY6pEHx1g=;
 h=From:To:Cc:Subject:Date:From;
 b=KH4VhwDMkCbzh3AgsCYCA7T9cBDBSeEn6NieSH2a7+9UiQqNBRsjv7oMb9kR1Dwi9
 jnZxop7G3GxGodwBGCrOjXz8rF837J0epj6m1IOZn+T+W6JaDXE3kGWENO79I4AyLm
 MfWAOpncSRL8Jrujj0UbXC62EnQvjekoi7D6lmj6KOFhwr84QXI1ZQlpWwB1Ea5UU1
 K6tE/LvG2bqYfipShuaHq5zK69dxV7DgfKRo7LZozLu7bN12gQEWaZl9klpZu6F5V8
 vdMvNpU9Zu9qiqIYuA5qo8hlsTdd+RFRS7VRwFLqP91N3Dm3xwZUtbO9ouCv9VOJrd
 BjATpRJbkLSBQ==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Date: Tue, 20 Jul 2021 09:16:29 -0700
Message-Id: <20210720161629.1918963-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0.402.g57bb445576-goog
MIME-Version: 1.0
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m5sQO-0006HK-0F
Subject: [f2fs-dev] [PATCH 5.10, 5.12,
 5.13] f2fs: Show casefolding support only when supported
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 Daniel Rosenberg <drosen@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daniel Rosenberg <drosen@google.com>

commit 39307f8ee3539478c28e71b4909b5b028cce14b1 upstream.
[Please apply to 5.10-stable, 5.12-stable, and 5.13-stable.]

The casefolding feature is only supported when CONFIG_UNICODE is set.
This modifies the feature list f2fs presents under sysfs accordingly.

Fixes: 5aba54302a46 ("f2fs: include charset encoding information in the superblock")
Cc: stable@vger.kernel.org # v5.4+
Signed-off-by: Daniel Rosenberg <drosen@google.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/sysfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index ec77ccfea923..b8850c81068a 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -612,7 +612,9 @@ F2FS_FEATURE_RO_ATTR(lost_found, FEAT_LOST_FOUND);
 F2FS_FEATURE_RO_ATTR(verity, FEAT_VERITY);
 #endif
 F2FS_FEATURE_RO_ATTR(sb_checksum, FEAT_SB_CHECKSUM);
+#ifdef CONFIG_UNICODE
 F2FS_FEATURE_RO_ATTR(casefold, FEAT_CASEFOLD);
+#endif
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 F2FS_FEATURE_RO_ATTR(compression, FEAT_COMPRESSION);
 #endif
@@ -700,7 +702,9 @@ static struct attribute *f2fs_feat_attrs[] = {
 	ATTR_LIST(verity),
 #endif
 	ATTR_LIST(sb_checksum),
+#ifdef CONFIG_UNICODE
 	ATTR_LIST(casefold),
+#endif
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	ATTR_LIST(compression),
 #endif
-- 
2.32.0.402.g57bb445576-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
