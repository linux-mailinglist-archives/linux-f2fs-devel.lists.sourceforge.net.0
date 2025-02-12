Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C98CAA31C1D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Feb 2025 03:35:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ti2bC-0004f6-7I;
	Wed, 12 Feb 2025 02:35:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ti2bA-0004f0-Jn
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Feb 2025 02:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8adAQCNrZ+QQ9cEPurDv3X8GOTU5tVODL7oXCF/WzI8=; b=KQqEegBYckR/gg7YokvnTWc6f5
 eexISNhZPygTrx884Y8IeSohIch53FO/O1M4BpUQRaAjRpHiL2ftRYZkN9T3WWYa8ekw4zuGXpgi0
 vps+t+JF8vzDQNg5AcSI1FtOrgpINr0FFEUjhWc8Km47RwjhL0C2rGZ9WB6MVJNIn9vU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8adAQCNrZ+QQ9cEPurDv3X8GOTU5tVODL7oXCF/WzI8=; b=k
 VJMpeZrDehjw20a/w9gzrSU/yQm7U8Krw5Qo3fMRUELBO55wdBVN5iKRtIbZfM2flU/aXrAJvk5lx
 0pKrRq9IniJ8ZgELtSDnC6IOcCEgIgLqYNPtILljNZNuiooj6HxqBzb1NYdeGkpGmdISMirexVksy
 B9S7WLnUtdVNIW40=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ti2b9-0000Ma-Cv for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Feb 2025 02:35:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 783BA5C56D7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Feb 2025 02:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B484C4CEDD;
 Wed, 12 Feb 2025 02:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739327724;
 bh=4k8gRvSUnnFtDJKlgB+W3NkTIdMqjf/Wnhl/MOXYQeQ=;
 h=From:To:Cc:Subject:Date:From;
 b=V+b/MQTg67xmsPuQDXNdM++t3OKZ98motiv0JlCIT+PJ113nIdoII8XZ4s1rr3PQS
 KUiISdPADo/mZnv6lKk+bvy49kBjZREtppBe57iz/49lfwSVsQzVT3t5RdyZgvl3g7
 rSDvGfKpCeq2+yCnVuaiSeuJPrea6EGlzWqlA8YHy3XD9LyNn+kfog6feOzDYYl4JG
 XM0yKmtetmrjPEbpRdaoMctebfrCLuZo1yPvyQZpYuyBg6iTEOHE5/BR/mpK6U7zQo
 qYx7CA5Q1dcr7pak39X7zefiKHE2TTmlW5mEySAiqABBZNpbO0dsdvOhGy1CI7OI7t
 nFMCQzlU+Ml7Q==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 12 Feb 2025 02:31:55 +0000
Message-ID: <20250212023518.897942-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
MIME-Version: 1.0
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch series does not add new API,
 but implements POSIX_FADV_NOREUSE
 where it keeps the page ranges in the f2fs superblock and add a way for users
 to reclaim the pages manually. Change log from v8: - remove new APIs, but
 use fadvise(POSIX_FADV_NOREUSE) 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ti2b9-0000Ma-Cv
Subject: [f2fs-dev] [PATCH 0/2 v9] reclaim file-backed pages given
 POSIX_FADV_NOREUSE
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

This patch series does not add new API, but implements POSIX_FADV_NOREUSE where
it keeps the page ranges in the f2fs superblock and add a way for users to
reclaim the pages manually.

Change log from v8:
 - remove new APIs, but use fadvise(POSIX_FADV_NOREUSE)

Jaegeuk Kim (2):
  f2fs: keep POSIX_FADV_NOREUSE ranges
  f2fs: add a sysfs entry to reclaim POSIX_FADV_NOREUSE pages

 Documentation/ABI/testing/sysfs-fs-f2fs |  7 ++
 fs/f2fs/debug.c                         |  3 +
 fs/f2fs/f2fs.h                          | 14 +++-
 fs/f2fs/file.c                          | 60 +++++++++++++++--
 fs/f2fs/inode.c                         | 14 ++++
 fs/f2fs/shrinker.c                      | 90 +++++++++++++++++++++++++
 fs/f2fs/super.c                         |  1 +
 fs/f2fs/sysfs.c                         | 63 +++++++++++++++++
 8 files changed, 246 insertions(+), 6 deletions(-)

-- 
2.48.1.601.g30ceb7b040-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
