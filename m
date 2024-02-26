Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABFA86678B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 02:32:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rePr8-0000za-ED;
	Mon, 26 Feb 2024 01:32:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rePr7-0000zU-7n
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 01:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MKYXI1Ap5bdO4ffnGtEFZhoB6Xx2YGZvvZEWMh9zBBU=; b=K9q5nmNz3+kMpucaXr3qg/YMYF
 JpZ+w4zXDXYHr1QnpQC/crQNjm7pEiFMrWnKpUXWIhnBC8PZIzcezasnuN8r39wDvuBxW0via7t4G
 2k0ceucnss+ZLRsYg/Kb/xwfklWrrtm/cyWJcwDqYrHAuLl0EtkYdMJpR4X92RFYulKI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MKYXI1Ap5bdO4ffnGtEFZhoB6Xx2YGZvvZEWMh9zBBU=; b=asD2ewTm13414ftoE46Pen9PCr
 PX40423vU5axtJMZcqSh0bE2nxqe5HQVsQ7S1zd+qo3/B83d4mz4k1SfLLIwHyzaULXrg86GyWrDv
 pza/v33WiOYGH0Vd1pKFYyYIjAcCYLyhtG33LaxQPTwzWTkSpNjj7QfI5Voo4SOIOgtQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rePr3-0007wJ-JM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 01:32:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A4CFACE122C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Feb 2024 01:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87233C433F1;
 Mon, 26 Feb 2024 01:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708911141;
 bh=A4yz3LRTSvapt9o8FbzBxwIf+iiKoUhwLj0hcQkJ+Wk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kba7CjwyvYHZYqaueT48znUox1iICesihe//v1MzldqInj0Axh8uIvIfBjn+h6T/6
 TCqvnsiB0U6qFKtp0I7a2S7tBvyRGZoGO0kXG2dw1ERyFzI3+bOctLMqV2Ri/LbDIV
 XtFDkbFXIpHuv+baKXjHLX/KsG+0uyTmNtt4/2h/FlAAzfaNPqL/HQU7ZgQ5ffPzDv
 XEp7AniLEMBQsfyArGdqI8+sQy0D7i1NVN9HcLjwmJwIXH2BkdIrModkOfqGQ0b18E
 9Zpb4EtqwTcKyakW2QPyKkX9BLFTdkYizPcvgCpU4q8VlRi9K6ZpEmX+X4VYYzcmhA
 odIiTNwigmV1g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 26 Feb 2024 09:32:06 +0800
Message-Id: <20240226013208.2389246-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240226013208.2389246-1-chao@kernel.org>
References: <20240226013208.2389246-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch exchangs position of f2fs_precache_extents() and
 filemap_fdatawrite(), so that f2fs_precache_extents() can load extent info
 after physical addresses of all data are fixed. Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/data.c | 4 ++-- 1 file changed, 2 insertions(+), 2 deletions(-)
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rePr3-0007wJ-JM
Subject: [f2fs-dev] [PATCH 2/4] f2fs: relocate f2fs_precache_extents() in
 f2fs_swap_activate()
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

This patch exchangs position of f2fs_precache_extents() and
filemap_fdatawrite(), so that f2fs_precache_extents() can load
extent info after physical addresses of all data are fixed.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0c728e82d936..bd8674bf1d84 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4045,12 +4045,12 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
 	if (!f2fs_disable_compressed_file(inode))
 		return -EINVAL;
 
-	f2fs_precache_extents(inode);
-
 	ret = filemap_fdatawrite(inode->i_mapping);
 	if (ret < 0)
 		return ret;
 
+	f2fs_precache_extents(inode);
+
 	ret = check_swap_activate(sis, file, span);
 	if (ret < 0)
 		return ret;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
