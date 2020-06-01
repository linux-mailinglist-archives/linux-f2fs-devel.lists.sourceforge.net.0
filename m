Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 007021EAF9D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jun 2020 21:35:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jfqDL-0002YI-72; Mon, 01 Jun 2020 19:35:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1jfqDJ-0002Y2-PP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 19:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yd8dynrFpf/G1mm4omkjOEOxOrwVlPbrkdvAkY5+iJE=; b=CSUhjYORAWrPVdSfvT8YpWLuzm
 BdlHFixTGTfumAGeLucfNEFpSf46tY5r/aM7R5S3WL2a/6t4JantenDQgIWg8kRkA7HA6fZ/cjyCU
 4imheEa6UCtU72FFNP+U61ef4gpeh0J3iPdRTKJiNanvm/NXqxRTqevnMDmOSeqjW+K8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yd8dynrFpf/G1mm4omkjOEOxOrwVlPbrkdvAkY5+iJE=; b=DFuzikl9xcKla/A82ZNi0f5tTQ
 ARXT/9C98SEwv0Sj7V4GcEUHJEmYlN1eJ3CQRuMExgjJZKDeB0LgIKog61MDGoLyN/8Zdj2JSrKRy
 B/5UwufigeY7Ccree2yaixaxaFobNTYa1esYsYyPW9zNSLrGQAfCN5taw6MqMR4//qVY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jfqDE-004f0m-G5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 19:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591040103;
 bh=FG5YZrumuxu+SUe9tE67sVQlsmLyNC7e800RwFody5U=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=KeExiaz9m5h879IZ1BEQl3nEkk8hevGPTuX/HTBMuE2abZI2ifbmaB5R/CNVUeKdW
 Zy0uNXJWso9ocrLXtq6DWF3YggXoBfGdMb0/UA5DY/dnhFAeX+EgV/wRrplS8o/GUO
 WFI1fbrkwDNfuAwAhSlYazDURGbqszfUUDgf6SE0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200601063150.GB11054@sol.localdomain>
References: <20200601063150.GB11054@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200601063150.GB11054@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fsverity-for-linus
X-PR-Tracked-Commit-Id: 9cd6b593cfc9eaa476c9a3fa768b08bca73213d0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4d67829e11863072aec7cd1dd2939b1fd3eda17b
Message-Id: <159104010315.18844.6258170183596402649.pr-tracker-bot@kernel.org>
Date: Mon, 01 Jun 2020 19:35:03 +0000
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.5 (/)
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jfqDE-004f0m-G5
Subject: Re: [f2fs-dev] [GIT PULL] fsverity updates for 5.8
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Sun, 31 May 2020 23:31:50 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fsverity-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4d67829e11863072aec7cd1dd2939b1fd3eda17b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
