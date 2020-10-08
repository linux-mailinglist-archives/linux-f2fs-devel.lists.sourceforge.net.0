Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D786287E89
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Oct 2020 00:11:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQe8b-0001HS-Lh; Thu, 08 Oct 2020 22:11:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kQe8a-0001HI-CQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Oct 2020 22:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ws/CcdJtoRFIeBCNv7OUwWx3oY2xbofAR3jO/I3iEnw=; b=ho3TCiGgl0fcw53fp6j0OqGmYM
 M252swFHMc/p9C7dixokv/btkT2/qfFwpse8raltsyOZRGHhuylyCiP3CmHZZ4psEhwpOgmGFMndd
 zg8TqWXKuBb3uqyh38UfLiajyTbTJwmMQwFlmjWdHYXUD+LE8QBP2kZeXUURQ/gqJxrY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ws/CcdJtoRFIeBCNv7OUwWx3oY2xbofAR3jO/I3iEnw=; b=k
 8DKFRJKUd/yOHbis7YcpHEZYhGvOVizEdVje5G7On0aHeUPel5vfRe/SQuwkDwSW89tt2YMhl5I8M
 N4WjFN4/KjuJ6czemddILrNHv6IAzxnDQvbuA8ndSp+iFTA7rKOIFd2yuzX8fRNjtH7cMu+m/iENc
 RoZreEaGqCsar6d4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQe8Q-003Vxe-8B
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Oct 2020 22:11:48 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7F6EE22241;
 Thu,  8 Oct 2020 22:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602195092;
 bh=5cwnMyQhKUP3d82WK3IQRFD3LayprBJ/26VCNg9TYjI=;
 h=From:To:Cc:Subject:Date:From;
 b=s5KO77zHEHTrjhoGLQRAFkidlXW0qvk0fmxgztaroiU7PbCWpTewDIobEef1OeBOj
 FP7rjSApa4gqsoLNwDRlqvVo44nsfu4NKriQDnL2cHMxK4TSMHc+uWABfbjQSxqnMk
 GpYECZNvpdpQb093O8Vcb+y0r435FywMC/+yh/Lw=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu,  8 Oct 2020 15:11:31 -0700
Message-Id: <20201008221131.925195-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kQe8Q-003Vxe-8B
Subject: [f2fs-dev] [PATCH] f2fs: fix memory alignment to support 32bit
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

In 32bit system, 64-bits key breaks memory alignment.
This fixes the commit "f2fs: support 64-bits key in f2fs rb-tree node entry".

Reported-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 713ab95223ef6..ce79b9b5b1eff 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -617,7 +617,7 @@ struct rb_entry {
 			unsigned int len;	/* length of the entry */
 		};
 		unsigned long long key;		/* 64-bits key */
-	};
+	} __packed;
 };
 
 struct extent_info {
-- 
2.28.0.1011.ga647a8990f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
