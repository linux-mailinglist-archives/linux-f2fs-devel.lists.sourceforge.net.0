Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33682241499
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Aug 2020 03:37:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k5JEd-0001A9-Ql; Tue, 11 Aug 2020 01:37:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1k5JEc-0001A2-PY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 01:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FUi57VR2LKhfYZ0H6iFfyTOFHrkPqrNkcPXcibEZrPk=; b=GvUNWMbHotOcea7tjn0hNpvaDi
 Eo3ydQH2HdC+tfgGodbfTzq7oQ61QXJEcZKiD+HQRHjW/xhYIx5yXJrxa7+to1opqRZNx/QeP1v4x
 ueAPoeHjH1vMcwyuQhvjUP05xqXMndvfC3Eu4aZ/6rfBWoueeTKzpdohUWj7WtLEObl4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FUi57VR2LKhfYZ0H6iFfyTOFHrkPqrNkcPXcibEZrPk=; b=EisAZwYDVWcBgXunRow2h7ONTx
 j+AxmHpAiQrcxutHzpil1nh305yX45Vx6C7G0XPNT5zL9eiIn7oyKqTS0fXdQIWyNtuFzX996u75g
 lHOoH++GinjNmAR2kkqoNhdQG3V77nHvALez2WDkBJthtJS0efGXRnXI82xGiNCCqrTY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k5JEZ-006jXZ-T3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 01:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597109855;
 bh=xEbGhnireVGdt46pTRSkRF7mxZ0rK2wJ73BUXjbqdx0=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=PsP0YN0dNM5ftz4br8wbHNKOMAVF/ZJErixi769k8GlmyOY+9T6vbylp/coKbwOgf
 F7XCGV7I6vxU8TekeD4Bo1TB9pxQlrIKBzvCYxY3tu/ZKVXnLGTuidNUlfUzgQxVRm
 7/TpTLhxGnJOGaC+T+xDqSskvN8p20RfsGLedymc=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200810191121.GA2745602@google.com>
References: <20200810191121.GA2745602@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200810191121.GA2745602@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.9-rc1
X-PR-Tracked-Commit-Id: 828add774f0d2bf930cdeca6c982c1fbcdd846bb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 086ba2ec163b638abd2a90ef3e8bab0238d02e56
Message-Id: <159710985521.12600.4650817315516671423.pr-tracker-bot@kernel.org>
Date: Tue, 11 Aug 2020 01:37:35 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1k5JEZ-006jXZ-T3
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 5.9-rc1
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Mon, 10 Aug 2020 12:11:21 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.9-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/086ba2ec163b638abd2a90ef3e8bab0238d02e56

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
