Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD3E64F679
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Dec 2022 01:47:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p6LMF-0001q1-Fe;
	Sat, 17 Dec 2022 00:47:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p6LMD-0001pl-MG
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 00:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6rUr+riJeBQGOvGKvPKOPPDW0eArrIRPj9toPOkHeLE=; b=H5IndbA+s0G2cJNju9vgiWEGIi
 4EO2x3/eFz301smbAOmectOo6O/TloEqTaIVYUqswjp4HxwLrOC4TLtXNF8iO/xBwmeexFgbUCI7e
 9izZbIZHFmYXaiSywkzvbE7PpIgFa875vJxwomOBQ4gnYtGKduQtez4OEae1fRs84CyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6rUr+riJeBQGOvGKvPKOPPDW0eArrIRPj9toPOkHeLE=; b=c
 Eqiny5RNyFMQDtHT0obhUc89nvGDuOPbRjAC2lhXxXedtCV+GvoAGv/nLme7C+TK7enl+mAJp4liV
 HholkNi24De8nP0YUH9C28te2sm/wDavG/r56R5/pXWpBs8UnWUBuDyWbHotpiO4btOU94mCN9OoU
 fXXDmG1NZ8SKziCI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p6LMC-001vGx-UM for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 00:47:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A5937B81E4F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 17 Dec 2022 00:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64066C433EF;
 Sat, 17 Dec 2022 00:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671238025;
 bh=RcsuFo8KYXcA03TEr9Mq5ANGUIZxFkfKFOpi/1eHeRM=;
 h=From:To:Cc:Subject:Date:From;
 b=S72RlySVGVPRDL/AKYB7DNR8UK3pvepkv3/9VhwzFXHvfIqExsZxQVYjVND9MjwWg
 dij+k1nrbvdKZeOftBV55V2JewouAYed9Eg1+w9qE/raifQO2iiZg1Ls+91nscZ+1o
 sh8ZEHH03k4hIOEAme9PSkpmcaAUHGwwltB1TQ+LmTNE8OpVEfYwRvuX3iSToPS6wL
 HSCy2eDGzDDlv5PxRYmQ/FJyQNeQFaCMJT2jL3BuCZuZzPG0q2eyiAP1ZVxkvfjokT
 V06ytkm5JFNekj+iK4d5UsQFGtAe/++WTwE5KSJz9buOwxUneuibFrjwrlH6kynygK
 I/k8iSbYmc3xA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 16 Dec 2022 16:46:56 -0800
Message-Id: <20221217004659.2092427-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Clean up and one bug fix. Jaegeuk Kim (3): f2fs: initialize
 extent_cache parameter f2fs: don't mix to use union values in extent_info
 f2fs: should use a temp extent_info for lookup fs/f2fs/data.c | 2 +-
 fs/f2fs/extent_cache.c
 | 31 ++++++++++++++++ fs/f2fs/file.c | 2 +- fs/f2fs/segment.c | 2 +- 4 files
 changed, 19 insertions(+), 18 deletions(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p6LMC-001vGx-UM
Subject: [f2fs-dev] [PATCH 0/3] fix per-block age-based extent_cache
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

Clean up and one bug fix.

Jaegeuk Kim (3):
  f2fs: initialize extent_cache parameter
  f2fs: don't mix to use union values in extent_info
  f2fs: should use a temp extent_info for lookup

 fs/f2fs/data.c         |  2 +-
 fs/f2fs/extent_cache.c | 31 ++++++++++++++++---------------
 fs/f2fs/file.c         |  2 +-
 fs/f2fs/segment.c      |  2 +-
 4 files changed, 19 insertions(+), 18 deletions(-)

-- 
2.39.0.314.g84b9a713c41-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
