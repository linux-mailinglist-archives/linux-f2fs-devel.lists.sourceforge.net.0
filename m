Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 311FBA19A32
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jan 2025 22:13:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tai2g-0001ci-Bi;
	Wed, 22 Jan 2025 21:13:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tai2e-0001cY-65
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Jan 2025 21:13:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2eiVcM44tMFkHviX3plTK9CEgcTtDlCrv6IVmizxOFE=; b=IFZrpOuIVnL/VKb9bLFsYR5s6s
 mUHGaOY8Ms4TpLC7oMXa76qrJlmidNgqe0mKkC3I5JW9fYOU8Gj1YwKZeTnlA3J80xLw2PnY4mezl
 yqO5xYLXxpTR+FACyOV2q1vCwVQdQ0RwAEsHMV7cgIkr492aBRXn/WLNZ+ieM6tWLWkU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2eiVcM44tMFkHviX3plTK9CEgcTtDlCrv6IVmizxOFE=; b=f
 CvC4Zd5IAMC/2u2ksegBNon63gFSkdazAVQH4kJdIEjZahe1hJ5apIEnPs0159GfezGsufuM3eyH+
 LfBckCRmL21TBtesIeO/hlHGDJu3tRUjqu3VdILH+/fYXFvUIfe9bu8q1uEhey+pwU6Wf/NTwD1/a
 DYDaX0YHgAXH/qdE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tai2d-0004zR-FQ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Jan 2025 21:13:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B54185C0136
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Jan 2025 21:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2606C4CED2;
 Wed, 22 Jan 2025 21:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737580413;
 bh=0IIibQ4WJD2rYcyoeUOj6S1TdAkiS8xdmqohf0Ol47E=;
 h=From:To:Cc:Subject:Date:From;
 b=CuPcm98IhmUQVEBCNSGT+ybIplellHYPogvAw8+YoZWPrUXaQHDSsAJVobVlrFp/r
 ct7vX+q16X31YF6cPz81hFyqMHCdw5z+Qb5uVM8xxLvNjElEG38UmWoTNP7YjfPXRA
 VdEDFxrWPa3tVPfcQkHasIQM7XzIv6BW3/qgDkwnMinopZ6zOvlMY3fsbLQfn17b5M
 I46Kd3GSn+2d7hQmp0Y9NpL40Qwwzh9g0ti2Q1NKOY8VnaiqMVH0IvOfkFqCoIrFQQ
 r1z4v2BlsZ986baD2qx5owKuj4k83SOHrAf9oLkePYKa3KbtbZBdWaeGjzv9bAJQBH
 Fg7FJPLNpdn/w==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 22 Jan 2025 21:10:15 +0000
Message-ID: <20250122211323.3835557-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
MIME-Version: 1.0
X-Spam-Score: -8.2 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Note, let me keep improving this patch set, while trying to
 get some feedbacks from MM and API folks from [1]. If users clearly know
 which file-backed pages to reclaim in system view, they can use this ioctl()
 to register in advance and reclaim all at once later. 
 Content analysis details:   (-8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tai2d-0004zR-FQ
Subject: [f2fs-dev] [PATCH 0/2 v7] add ioctl/sysfs to donate file-backed
 pages
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

Note, let me keep improving this patch set, while trying to get some feedbacks
from MM and API folks from [1].

If users clearly know which file-backed pages to reclaim in system view, they
can use this ioctl() to register in advance and reclaim all at once later.

I'd like to propose this API in F2FS only, since
1) the use-case is quite limited in Android at the moment. Once it's generall
accepted with more use-cases, happy to propose a generic API such as fadvise.
Please chime in, if there's any needs.

2) it's file-backed pages which requires to maintain the list of inode objects.
I'm not sure this fits in MM tho, also happy to listen to any feedback.

[1] https://lore.kernel.org/lkml/Z4qmF2n2pzuHqad_@google.com/

Change log from v6:
 - change sysfs entry name to reclaim_caches_kb

Jaegeuk Kim (2):
  f2fs: register inodes which is able to donate pages
  f2fs: add a sysfs entry to request donate file-backed pages

 Documentation/ABI/testing/sysfs-fs-f2fs |  7 +++
 fs/f2fs/debug.c                         |  3 ++
 fs/f2fs/f2fs.h                          | 14 +++++-
 fs/f2fs/file.c                          | 65 +++++++++++++++++++++++++
 fs/f2fs/inode.c                         | 14 ++++++
 fs/f2fs/shrinker.c                      | 33 +++++++++++++
 fs/f2fs/super.c                         |  1 +
 fs/f2fs/sysfs.c                         |  8 +++
 include/uapi/linux/f2fs.h               |  7 +++
 9 files changed, 151 insertions(+), 1 deletion(-)

-- 
2.48.1.262.g85cc9f2d1e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
