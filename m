Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB60EA24545
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 Jan 2025 23:29:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tdzVz-0004vZ-TE;
	Fri, 31 Jan 2025 22:29:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tdzVz-0004vN-1B
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Jan 2025 22:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0xPJIZnPSNAlPtUjvM6lch1/HX3hzlAnohwGHYYv6Ew=; b=BLUD9MP4cHG++fi1ozirB1GNLr
 NP+iZ3HuBMLXwlXOuL6AWVNAO9oF2TNMErtQ5P4tCpoJ26l5FK74U0PLG7/X3zp28asHvruFIdz9V
 zVfQp/ErEWywG8ICkJLbVXRCVllL12hnMVUmOtUd5FmQoIAQP7dBilBjUnpuZlRj80iM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0xPJIZnPSNAlPtUjvM6lch1/HX3hzlAnohwGHYYv6Ew=; b=A
 qGL9dTEwg9b4xG0XoVyY7TY/petWOqg83ExXoMsXFP3pK4uHWUxIQ4F+IAlQIEGBTnqKNzcAxB939
 A8N3g2cvHaW/1p5VJhGAx2IHODfaVCGX8/kstixBSrXfPNhO+w+m9jP4K3Z3+sGu+U5QmgK7M8kjf
 NH7qvZZ81VeCXZKE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tdzVy-0003pJ-Dg for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Jan 2025 22:29:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1C86F5C613A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 31 Jan 2025 22:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADEEDC4CED1;
 Fri, 31 Jan 2025 22:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738362559;
 bh=QYCqaewGw/fEDB0FLcm50v51JOesOr9vxV6zfWBMiGs=;
 h=From:To:Cc:Subject:Date:From;
 b=eoFKkdk8f7T2ouE7ZjJ3CmuOMBotbZO1zogE4bWRslI3y/3Q6Bb0VI467cptW9jvK
 Z6986fInKW0yFnSyHHMGwWJQ7Plkt3HWnGz/M6hKlWKoExR+1I1WoR6XgonTLh0PbU
 1kr6qcSUNnbO6rwjf5J87iHHV4dqnuccJNUZZQcJO+xBSjcsW9DDoyzkCaVDQRP+dw
 hwi6+TRCFyYLCW6nr35YvA7QheGz/kODNM620g1A4iItfRxqiMYi9ctZUSoOcAMX/f
 BkaIwoemdgbdlWISSqOu3Zik2w13M3H3AeVSuZjwkrZv5Sp7nhc2ggvx8CKBjWRTmf
 7CtdkXQMru2LQ==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 31 Jan 2025 22:27:55 +0000
Message-ID: <20250131222914.1634961-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
MIME-Version: 1.0
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Note, let me keep improving this patch set, while trying to
 get some feedbacks from MM and API folks from [1]. If users clearly know
 which file-backed pages to reclaim in system view, they can use this ioctl()
 to register in advance and reclaim all at once later. 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tdzVy-0003pJ-Dg
Subject: [f2fs-dev] [PATCH 0/2 v8] add ioctl/sysfs to donate file-backed
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

Change log from v7:
 - change the sysfs entry to reclaim pages in all f2fs mounts

Change log from v6:
 - change sysfs entry name to reclaim_caches_kb

Jaegeuk Kim (2):
  f2fs: register inodes which is able to donate pages
  f2fs: add a sysfs entry to request donate file-backed pages

Jaegeuk Kim (2):
  f2fs: register inodes which is able to donate pages
  f2fs: add a sysfs entry to request donate file-backed pages

 Documentation/ABI/testing/sysfs-fs-f2fs |  7 ++
 fs/f2fs/debug.c                         |  3 +
 fs/f2fs/f2fs.h                          | 14 +++-
 fs/f2fs/file.c                          | 60 +++++++++++++++++
 fs/f2fs/inode.c                         | 14 ++++
 fs/f2fs/shrinker.c                      | 90 +++++++++++++++++++++++++
 fs/f2fs/super.c                         |  1 +
 fs/f2fs/sysfs.c                         | 63 +++++++++++++++++
 include/uapi/linux/f2fs.h               |  7 ++
 9 files changed, 258 insertions(+), 1 deletion(-)

-- 
2.48.1.362.g079036d154-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
