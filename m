Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96696859D3B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Feb 2024 08:45:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rbyL7-0005m4-0F;
	Mon, 19 Feb 2024 07:45:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1rbyL5-0005ly-5R
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 07:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xfb98ifZxtgfk0FrBQ27pMggksHXdZtA4KVxyeVm22M=; b=go2cfZ+ZwHAK9GUdM6KwHFejU0
 +ouNgFEL20+Cvzyr9gbfaTwkkZ6MBX1I78biy17S5X5aJPibTWEVh8lqaQDaGOyARoY1Db9f5KKuw
 KPTOfwI/a/46/qrIGJZe+H3rYn4BO2U11CGyeC0nYWm+/LOJnquzreKAR+dVsvhT7mUs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Xfb98ifZxtgfk0FrBQ27pMggksHXdZtA4KVxyeVm22M=; b=P
 Q1HVXuEVbLc5QEknbQEy+xSAKJjZ53buTECDa3qQUcHAJjcZ7kGzh4uaRDJZi4T5uxU7W/3yzuNTC
 CCfVKUw/jnO1/HqWdQY+SNgGl7UNwWgAaVoLHlCrIExVbAz3BU+ZqQkqt0XaMFkDAL9BIEzS1DdCe
 CiJqIJkoLuIxIsBo=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rbyL0-0008Qp-J2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 07:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708328708;
 bh=dkkqNU9Xxp9enfjdxL9e7K/3u9KUJSsAKMkxSSoP1Io=;
 h=From:To:Cc:Subject:Date:From;
 b=Ebj5/QhaG3HZApjRYhlACf8z7GHZNT2N4R7cgEf5Du3xszCv3ScZA5bW28/VjjHHv
 cIhomjRJMA/KDIV3lLn9SepLrO3oyVo16DYbwFYG0QfTNnouVUhD/H9BpmceceeQ/A
 XENaX+Nt6iuglJ1Ehr6elVvHwska+T73u2dGKdDz2jtZ2wLZM3PeKWaqztGteFkbOx
 ZzdUWEaMhk65Er2YA4aT5J5RGOFUV13mMsMLbc98JJis/G7+0KTVqV9Khk8Q5J1I14
 OD3nk/I+YqgUCH//F0J/gHQXsuqR7ndjAsP2B/a7KU6GajL9/DZF0eoRNAeRZ7C/s9
 9RpOdi4Bhbymg==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3118E378003D;
 Mon, 19 Feb 2024 07:45:04 +0000 (UTC)
To: tytso@mit.edu, adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org,
 jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Date: Mon, 19 Feb 2024 09:44:49 +0200
Message-Id: <20240219074457.24578-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, I am trying to respin the series here :
 https://www.spinics.net/lists/linux-ext4/msg85081.html
 I resent some of the v9 patches and got some reviews from Gabriel, I did
 changes as requested and here is v11. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rbyL0-0008Qp-J2
Subject: [f2fs-dev] [PATCH v11 0/8] Cache insensitive cleanup for ext4/f2fs
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
From: Eugen Hristev via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: krisman@suse.de, brauner@kernel.org, jack@suse.cz,
 linux-kernel@vger.kernel.org, eugen.hristev@collabora.com,
 viro@zeniv.linux.org.uk, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

I am trying to respin the series here :
https://www.spinics.net/lists/linux-ext4/msg85081.html

I resent some of the v9 patches and got some reviews from Gabriel,
I did changes as requested and here is v11.

Changes in v11:
- revert to the original v9 implementation for the comparison helper.

Changes in v10:
- reworked a bit the comparison helper to improve performance by
first performing the exact lookup.


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

 fs/ext4/crypto.c   |  19 ++-----
 fs/ext4/ext4.h     |  35 +++++++-----
 fs/ext4/namei.c    | 129 ++++++++++++++++-----------------------------
 fs/ext4/super.c    |   4 +-
 fs/f2fs/dir.c      | 105 +++++++++++-------------------------
 fs/f2fs/f2fs.h     |  17 +++++-
 fs/f2fs/namei.c    |  10 ++--
 fs/f2fs/recovery.c |   5 +-
 fs/f2fs/super.c    |   8 +--
 fs/libfs.c         |  67 +++++++++++++++++++++++
 include/linux/fs.h |   4 ++
 11 files changed, 198 insertions(+), 205 deletions(-)

-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
