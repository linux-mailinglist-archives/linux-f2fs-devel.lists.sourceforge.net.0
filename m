Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2039752C94C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 May 2022 03:41:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrVAA-0002qX-0L; Thu, 19 May 2022 01:41:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nrVA8-0002qR-R4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 01:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TOSFMQpyD/DjSbWOT1eZ+rjNyZM6llU3me+0ZONkNVU=; b=bbKRnXfDpYPNNKEoVVacWqEILd
 HpC8PkR1KHVdspWxcjl0SOI0DQxU6av+/UMgCKWwJ93PvtV1OGeu9XVdEXACCPcGEjtKEZtta1oOS
 D+ncjRGVxt7QyKFFOqJmilgVgsZ5vKdAoMIZq4Ei3Sn9jMDDVMV3Z+cHLpL+v+GCFTSI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TOSFMQpyD/DjSbWOT1eZ+rjNyZM6llU3me+0ZONkNVU=; b=B
 iNnXD9YLvVrFg/QLn5173X+RXb/K/L7YGv+N3msd6o6oNiihwrJv1/9SU4WSRL+p1Pqaf6MeShIeT
 BefBJS6cLdhV6AFRnqs2GCtCL7o9utd/ZXxSDFXnJeVy3AJiP9mTVypYO7JU42DzOfGCmVU7uPv8h
 khi+Q8x3IUKUbQzM=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrVA5-0001T4-Gw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 01:41:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 7EB0D1F45360
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652924459;
 bh=cDPrEKf0JU2IBDHkl3+Mv2tvpcr+3lXlXVKIov5p0GA=;
 h=From:To:Cc:Subject:Date:From;
 b=iLkvZgWYP+ALK8iXHf9zqiw76OICiqcdmx1mw1Xn0FloGlQe/Z486G8+1Fprw+ZN3
 /SFHFq2dqLv4lzjWqky6AOKodVt8ZfLA2WOc0UejC9dUtpk1PiUg9QdB/PoA1GlYlR
 SfcHrpKNtiIqvMbfNYMN8lZaVjSCyN8Wed+kZpZRGdZfHrTU4U32/rll5wTIIYjtNz
 kOvmiyH1lA98J75meUbNn6WkPGlTAb76e+uupJOvLJWKpn8ILKT7kG2QiAalEjuZpM
 vzECsjFLiyy2TJPdGniIMmt9Y9P4FkPeO4ZRt18VXYbnRG9y9rUjx+1KuuemJEcC+p
 Dg+aXselu+OoA==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 ebiggers@kernel.org
Date: Wed, 18 May 2022 21:40:36 -0400
Message-Id: <20220519014044.508099-1-krisman@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Eric, Ted, Sorry for the second submission of this series
 on the same day. Just a batch of simple fixes, so I hope it is getting close
 to merging. This is v6 of this series (thank you for the feedback!) . This
 picks up a few r-b tags and apply the comments from Eric. No big changes,
 all documented in the respective patches. Once again, tested wi [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nrVA5-0001T4-Gw
Subject: [f2fs-dev] [PATCH v6 0/8] Clean up the case-insensitive lookup path
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

Sorry for the second submission of this series on the same day.  Just a
batch of simple fixes, so I hope it is getting close to merging.

This is v6 of this series (thank you for the feedback!) .  This picks up
a few r-b tags and apply the comments from Eric.  No big changes, all
documented in the respective patches.  Once again, tested with fstests
generic/556.

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

 fs/ext4/ext4.h     |  49 +++++++++---------
 fs/ext4/namei.c    | 120 ++++++++++++++-------------------------------
 fs/ext4/super.c    |   4 +-
 fs/f2fs/dir.c      | 103 ++++++++++++--------------------------
 fs/f2fs/f2fs.h     |  15 +++++-
 fs/f2fs/namei.c    |  11 ++---
 fs/f2fs/recovery.c |   5 +-
 fs/f2fs/super.c    |   8 +--
 fs/libfs.c         |  68 +++++++++++++++++++++++++
 include/linux/fs.h |   4 ++
 10 files changed, 187 insertions(+), 200 deletions(-)

-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
