Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CBE523D82
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 May 2022 21:32:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nos4D-0001pt-8x; Wed, 11 May 2022 19:32:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nos4A-0001pi-P5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 19:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xQwLrEWORaYJiRu+kXjqbctu8Kb/hVUlReH1MwlWlAU=; b=ON0AMzU1HL9DeziO74tf6EklCt
 5jMt3uRuGaG4nDHJ0UttqDRXOLV0wR+mmylf2aZ45I5V+gjfkWMCnBt4ssgQqPzui5LnRVvcAzdYt
 lF4DAtlguSiasszy1BWKnHz7JUaekdHTMU6mKZ+F6LJL4ylapbAflif7ZM3jz5e8rmfU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xQwLrEWORaYJiRu+kXjqbctu8Kb/hVUlReH1MwlWlAU=; b=B
 QQcjFB1jwl/1/aQay7wqCNyWLyA1okDRKurVBt0iRaB6+7mBBJ/4Rmro7b5zI0EuDZZPAAfv5ka/p
 5hEPj76uhxL8Ii7Zk6dXn25by2VnzqgMAwTjkseC3WCka/mQN2A7dtj2/rliccHq1DOAAFdyeaVs7
 LiOc4NDsvWEcYrFk=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nos44-0093g6-Q2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 19:32:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id C53011F42914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652297515;
 bh=YVY7Dsj2P/gpMxAXakIigK52MS4RKuWy4L2G7t4v4ns=;
 h=From:To:Cc:Subject:Date:From;
 b=njLxSzNxseww7v2/JuRZpGc16AWA+FBP9wCkyyUOSmMNMH5EAmkvg2pVq1baaz/i4
 BzZJHSxMys7Yijf6wyRcfrufLRTBySTCtLvkLUEkL3HNPgMajilAFZbXJNtNfdFOc2
 zeR7IL6TBM/giBK0xABWc6iZYV9xFZJ5PEEs1SvONWnTWRxXE8GQtnlWf8wDpb3baQ
 LvfjCNYrP6Z1YmVyIKx4U6Swxt7O996r+r4BjLhvob7S3y2wiaMlrfvNpNhLfSLscg
 oTGZwYyUOhkNtPXxq5F4/eL3BUuGc0WIGQ78zXoP2kBz9U1DRDLFEoYICL+n9oFHuW
 tzlGv3g9l+B1w==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	jaegeuk@kernel.org
Date: Wed, 11 May 2022 15:31:36 -0400
Message-Id: <20220511193146.27526-1-krisman@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The case-insensitive implementations in f2fs and ext4 have
 quite a bit of duplicated code. This series simplifies the ext4 version,
 with the goal of extracting ext4_ci_compare into a helper library th [...]
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
X-Headers-End: 1nos44-0093g6-Q2
Subject: [f2fs-dev] [PATCH v4 00/10] Clean up the case-insensitive lookup
 path
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
Cc: ebiggers@kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>, kernel@collabora.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

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

Gabriel Krisman Bertazi (10):
  ext4: Match the f2fs ci_compare implementation
  ext4: Simplify the handling of cached insensitive names
  f2fs: Simplify the handling of cached insensitive names
  ext4: Implement ci comparison using unicode_name
  ext4: Simplify hash check on ext4_match
  ext4: Log error when lookup of encoded dentry fails
  ext4: Move ext4_match_ci into libfs
  f2fs: Reuse generic_ci_match for ci comparisons
  ext4: Move CONFIG_UNICODE defguards into the code flow
  f2fs: Move CONFIG_UNICODE defguards into the code flow

 fs/ext4/ext4.h     |  41 +++++++--------
 fs/ext4/namei.c    | 126 ++++++++++++++-------------------------------
 fs/ext4/super.c    |   4 +-
 fs/f2fs/dir.c      | 103 ++++++++++++------------------------
 fs/f2fs/f2fs.h     |   3 +-
 fs/f2fs/namei.c    |  12 ++---
 fs/f2fs/recovery.c |   5 +-
 fs/f2fs/super.c    |  22 ++++----
 fs/libfs.c         |  61 ++++++++++++++++++++++
 include/linux/fs.h |   8 +++
 10 files changed, 185 insertions(+), 200 deletions(-)

-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
