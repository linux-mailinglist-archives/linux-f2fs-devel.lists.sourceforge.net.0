Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD693C289E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Jul 2021 19:42:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m1uVm-0004Z1-SU; Fri, 09 Jul 2021 17:42:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1m1uVl-0004Yc-Op
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Jul 2021 17:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SOR1kX0qi3ECZAAHHoeWwKyf9wNBCeGcuo5FaQOl2OM=; b=NjXNWHPMAoGHEpQ6jkOs2BgDI6
 UJWUPNEDOf6cFNY6wGWuSSqcf9Hs1nKdnSt8coWETLUEhMj3G6cj7izL5c03p1X1lqGQeHUZqpnMe
 rJHqEHmFnxRPrdKfoHI2e1ti54uJETsrXeIKt+zLnWAfXE75/H2A2Z3/2JqmafRghj1s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SOR1kX0qi3ECZAAHHoeWwKyf9wNBCeGcuo5FaQOl2OM=; b=YBIRvXiadGcN90hOCr1stLg/Lw
 GXxYgheykJ928RnBEcir74QtAnh+sNGzzvC1KyW61F65jiZ+oUasNrRrxCCsK3QeQKuYEcrA53AB2
 b9hbtebpZiV17dnjG+dgv/tmWtFav+D05nNLpKKSA0wygUe+2WGoNpUJeEBnhmEFOdMM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m1uVd-002G9E-MT
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Jul 2021 17:42:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 11625613CA;
 Fri,  9 Jul 2021 17:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625852500;
 bh=HMjoup3QJmViBUshHyxqOCKugInk17QcT2upaR2x/MU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=gZa8kT0Xu/nP89WVzw+cUSyeEpJERqauPt4H9oNWoVaIj8Ibq3jwkxa7w+dnl3yj7
 +sLTgnGn4bu2yo3EvsUCze02blDiXwTiI4LQjZSBfQWPvWxB3yPLwTCH3uuBD317ws
 C+TjIGZaujK+5jgwRg4AkhgBl2UKZIr+5+OZYyyzEfWgNlqjjUVe1CdriRkhyhS3af
 emwQ4jQLNgg3PcbGbShcCb2eaCjX8wIzAD00/l3xcLkq51Z0d6I4BQMorT4ckxJyJA
 6wLE/G384MQ9K18wI5xPjVgNgWZ6F3OFQf6dhgt0ulzcFL3G9IXg5CqZEqhjawKunw
 13kf1f81oFciw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0B4CA609F6;
 Fri,  9 Jul 2021 17:41:40 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YOYHejl3CgABOnhP@google.com>
References: <YOYHejl3CgABOnhP@google.com>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <YOYHejl3CgABOnhP@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.14-rc1
X-PR-Tracked-Commit-Id: 28607bf3aa6f9762b32dc7f1ed0488823c0651b8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 227c4d507c71acb7bece298a98d83e5b44433f62
Message-Id: <162585250004.25269.13552956569503185512.pr-tracker-bot@kernel.org>
Date: Fri, 09 Jul 2021 17:41:40 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m1uVd-002G9E-MT
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 5.14-rc1
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

The pull request you sent on Wed, 7 Jul 2021 12:58:50 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/227c4d507c71acb7bece298a98d83e5b44433f62

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
