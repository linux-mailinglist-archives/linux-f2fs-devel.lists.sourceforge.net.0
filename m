Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D29F65DC4A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 19:40:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pD8g6-00018r-KQ;
	Wed, 04 Jan 2023 18:39:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pD8g5-00018i-4W
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 18:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OV+LvgRYUK0qUr93kisnVLi2WZ1tw9zWIivRsspmnkA=; b=F+5eHr8xTNA7OtYTHLeOOnMxiK
 ZCrBmsttndIqtp/NlJHq+hnKeL/gDa8NFMuC1aFQE9uJznaRMb5bHGyJ58dGO0OMCRcVIgaPweTrS
 1wufrxS2Xlcb7TSia6Lho2fnTDj/92/uZX3OXgmC2mIBofaH4A5DpA782ZttsB1wmRpU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OV+LvgRYUK0qUr93kisnVLi2WZ1tw9zWIivRsspmnkA=; b=G
 biJQAMiOmhEjU5buQYPgr8gOToLXZih/TczxD0nNs3kVZ25zQscn3/ERdBYtqL74mt2qocCRT4Csb
 us8foXpd7dj39+EWS68f39s12p2ZcVWnL7SSlfzfO01tqanH/aSyFDkB3oxRr84U3bgQ5l0DHY/g0
 0yyyDDTGt1YHii9c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pD8g1-0006Sq-LW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 18:39:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4571A617DC;
 Wed,  4 Jan 2023 18:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93CE2C433EF;
 Wed,  4 Jan 2023 18:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672857583;
 bh=8ga8ySSJ1fC4ktF45D7o9yH4mmlkK2JDpm4yXrP3Nks=;
 h=Date:From:To:Cc:Subject:From;
 b=hhK5e4kSZ/5JDbyvvR3xoEcxNFV+AqX1zjFRbK+nnpwy8KFEs5ZaVm/NSL/xIpd27
 i2Y2rbWBwphzy0PA6WzcGE80YTNvk5J29EId7bhe8acNaDYusjRsKkJhocMNVJLDx0
 dcj5kxqJJDysDCMkecf3+l1/m6OwYHpMBs5zebdy9p+V74QvvBZUv2b5wd7bAEZSNb
 PyviPIbhNo+2JPnP16UNteYK2FT/jtCzfFiQ52qTBm9U1UnjOfOfK3ZmKVQpgQq6pE
 cQJqUG2S9uJtk7HWhVsoWC+FP590p2n1gQS1L8TH5MO4B+dKhi/1Jqd8iMsuVfZy4z
 pSpNz2aIFnZLA==
Date: Wed, 4 Jan 2023 10:39:41 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Y7XH7fSoURcqoUQW@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks,
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pD8g1-0006Sq-LW
Subject: [f2fs-dev] [GIT PULL] f2fs fix for 6.2-rc3
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Linus,

Could you please consider this pull request?

Thanks,

The following changes since commit 69b41ac87e4a664de78a395ff97166f0b2943210:

  Merge tag 'for-6.2-rc2-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux (2023-01-02 11:06:18 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-fix-6.2-rc3

for you to fetch changes up to df9d44b645b83fffccfb4e28c1f93376585fdec8:

  f2fs: let's avoid panic if extent_tree is not created (2023-01-03 08:59:06 -0800)

----------------------------------------------------------------
f2fs-fix-6.2-rc3

This series fixes the below three bugs introduced in 6.2-rc1.

- fix a null pointer dereference in f2fs_issue_flush, which occurs by the
combination of mount/remount options.

- fix a bug in per-block age-based extent_cache newly introduced in 6.2-rc1,
which reported a wrong age information in extent_cache.

- fix a kernel panic if extent_tree was not created, which was caught by a
wrong BUG_ON.

----------------------------------------------------------------
Chao Yu (1):
      f2fs: fix to avoid NULL pointer dereference in f2fs_issue_flush()

Jaegeuk Kim (4):
      f2fs: initialize extent_cache parameter
      f2fs: don't mix to use union values in extent_info
      f2fs: should use a temp extent_info for lookup
      f2fs: let's avoid panic if extent_tree is not created

 fs/f2fs/data.c         |  2 +-
 fs/f2fs/extent_cache.c | 34 ++++++++++++++++++----------------
 fs/f2fs/file.c         |  2 +-
 fs/f2fs/segment.c      | 13 +++++--------
 4 files changed, 25 insertions(+), 26 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
