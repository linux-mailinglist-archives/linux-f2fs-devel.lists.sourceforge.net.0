Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 660DC52C0ED
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 May 2022 19:23:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrNOa-0006vx-T2; Wed, 18 May 2022 17:23:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nrNOa-0006vr-0W
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 17:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wPW6KWpxOFltIeW5UPbYeP+yJ2scX/iuF8DqzN8vr5Q=; b=AOrUd8lRvcLD/NQ3PGX+aBa85E
 WNxIdb1yPUlGOWytoW7PMie8DzTXQGnVE0OEwLu+klbfWM5KC/rULdTaCKe+qvnhbY4GMLpy+4w5O
 6PZ/GiTbKNSDoZORO+zMDFlZlCpg9Onlyg2jGeTHGZXLPn0GIJj+E5zFyMvNbWe0m9VU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wPW6KWpxOFltIeW5UPbYeP+yJ2scX/iuF8DqzN8vr5Q=; b=K
 vZJIxxk2zVh9D+NjPDMv2ho+MNpYv+dC6bhf4hjZfSGjwqeVAW6o0ChlADa+tifpHbNOQr8BmadIt
 AixUu8+gdMRsuuGMaAv4W6fTvDzw3LUrGu4MDOqVqnVVFOzh+BVIZUyPdno/bwPx8u29Brmi+1Su1
 LjuSGvU7Nlm0QWGs=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrNOX-0007Ke-W2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 17:23:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 706011F45484
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652894607;
 bh=YLLmZUREElcB6QXqzHwxccTA7cTmLYu0yInBvss0WkQ=;
 h=From:To:Cc:Subject:Date:From;
 b=WOXfJn4PkYBihSyvj9xRRBbIUqflUqURpDvMNzL1NpoAv8ARdyeCzXONlYxPWfdEk
 jGDIBVed5WmJouN2faiePxKQ0QKEN0XjjQIfsivcF78YG/93Ruli4wWEZv6LLMIz5M
 WtHNWTkK17UYC6gBqKQHOF7DtTHGqNmaLPSjHRsBFlq7N616aEjbSDrBS//YcxnCSX
 Ddib/YxbcqexCqRdVtdd2++o8q76MVLExhKFv9u8q8+dA4Q9mauFS36QHQBzl6ZmKw
 eOqnHqpnC7PyWP3RCDVUH0J2mZlXMXDhB5JTb0JGHxYMD9RDPk+XFdzibv8ljArcab
 QZe+0zUbWu3dw==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 ebiggers@kernel.org
Date: Wed, 18 May 2022 13:23:12 -0400
Message-Id: <20220518172320.333617-1-krisman@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Eric, Ted, This reworks the entire series to apply Eric's
 comments. Thank you for the feedback, Eric! The biggest change is the removal
 of unicode_name and the split of the libfs patch. It made the series much
 better to follow. I also dropped the hash patch, but there is still a minor
 cleanup on that [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
X-Headers-End: 1nrNOX-0007Ke-W2
Subject: [f2fs-dev] [PATCH v5 0/8] Clean up the case-insensitive lookup path
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
Cc: linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>,
 kernel@collabora.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric, Ted,

This reworks the entire series to apply Eric's comments.  Thank you for
the feedback, Eric!

The biggest change is the removal of unicode_name and the split of the
libfs patch.  It made the series much better to follow.  I also dropped
the hash patch, but there is still a minor cleanup on that code flow in
patch 4 ("ext4: Reuse generic_ci_match for ci comparisons").  I'd
appreciate your review there regarding fscrypt semantics.

This survives the quick group and generic/556 (casefold) tests.

* Original commit letter

The case-insensitive implementations in f2fs and ext4 have quite a bit
of duplicated code.  This series simplifies the ext4 version, with the
goal of extracting ext4_ci_compare into a helper library that can be
used by both filesystems.  It also reduces the clutter from many
codeguards for CONFIG_UNICODE; as requested by Linus, they are part of
the codeflow now.

While there, I noticed we can leverage the utf8 functions to detect
encoded names that are corrupted in the filesystem. Therefore, it also
adds an ext4 error on that scenario, to mark the filesystem as
corrupted.

This series survived passes of xfstests -g quick.

Gabriel Krisman Bertazi (8):
  ext4: Simplify the handling of cached insensitive names
  f2fs: Simplify the handling of cached insensitive names
  libfs: Introduce case-insensitive string comparison helper
  ext4: Reuse generic_ci_match for ci comparisons
  f2fs: Reuse generic_ci_match for ci comparisons
  ext4: Log error when lookup of encoded dentry fails
  ext4: Move CONFIG_UNICODE defguards into the code flow
  f2fs: Move CONFIG_UNICODE defguards into the code flow

 fs/ext4/ext4.h     |  39 ++++++++-------
 fs/ext4/namei.c    | 120 ++++++++++++++-------------------------------
 fs/ext4/super.c    |   4 +-
 fs/f2fs/dir.c      | 103 ++++++++++++--------------------------
 fs/f2fs/f2fs.h     |  15 +++++-
 fs/f2fs/namei.c    |  11 ++---
 fs/f2fs/recovery.c |   5 +-
 fs/f2fs/super.c    |   8 +--
 fs/libfs.c         |  65 ++++++++++++++++++++++++
 include/linux/fs.h |   4 ++
 10 files changed, 181 insertions(+), 193 deletions(-)

-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
