Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F362DA21B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Dec 2020 21:56:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1koutn-0008Vb-FP; Mon, 14 Dec 2020 20:56:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1koutm-0008VR-VL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Dec 2020 20:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZCvYkVNA6efi8yus+M5IZiPKHZDAd9Y9vmXy3c2CiKA=; b=kn2Ibx5F7hhYv1JLhs1z16epAJ
 tRd3ZnhZC1gq831XM/7w52e+3tpqhxK0mhHmwmNDpH7pcJvdOyxH7KCRKgKc80vC37fv56VAscrxr
 w4cGj2XnaGEpWyASbLVYatoBPuE2KWvdfOClafpm0BcEX4egmmFcrPpYwX63VxCDafnM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZCvYkVNA6efi8yus+M5IZiPKHZDAd9Y9vmXy3c2CiKA=; b=Rvspz/yeAhYz8DUxW/xrgeVLC7
 Cn5Dht+fPsp+Mzia+zLiHgRIOGYEjxO43x6XrZqasooZma3tiTAvfW1j8ksk6qi39+OBqtPlSsXjJ
 WUPp10AcRt/yjCW6Arxi7n3vbZQpWwks6PigFnUzEVnman5YF82HNfvFl0bHmNpO5y7o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1koutk-00D1Uk-Qg
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Dec 2020 20:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607979389;
 bh=SYq1bIYMrR7dKenr5O6tsqn7Cs9DoPJBsBbmjg3Pi4w=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=D5RYJr1xHimBJzu0z4RPdsPgwzc83vHfyuniQ8o8Ypw/C58SdGKFotbwWwt8kUMEC
 aSr191iwAitghakUcscUOHJlfdEvkbLS7A1P3aAeSDVRAjUfTEw7yXy0/b6sJPs2JU
 jJIgNFuBuhFbgR7D4f9W0IxZjGN4RIro0rwuBEfQXhB3SPvfNHLHPPTGT0+ILjjkmj
 Z3HaPRCzQBk6RTGY4QQoe+xhv5wnXGzQFRFdp1oz56afzCMC+/YVdzpj7zoqzuBZ+s
 ZmHvBkGQYTLYrZKijUzX9ytGRe5b0BIHN6txWgodrLePpiLCvO2opPorLSXQZlh/Rw
 wcEDaxnFxsQKA==
From: pr-tracker-bot@kernel.org
In-Reply-To: <X9b910/Ldj6kdljm@sol.localdomain>
References: <X9b910/Ldj6kdljm@sol.localdomain>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <X9b910/Ldj6kdljm@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fsverity-for-linus
X-PR-Tracked-Commit-Id: bde493349025ca0559e2fff88592935af3b8df19
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 51895d58c7c0c65afac21570cc14a7189942959a
Message-Id: <160797938955.26822.4023695605419451387.pr-tracker-bot@kernel.org>
Date: Mon, 14 Dec 2020 20:56:29 +0000
To: Eric Biggers <ebiggers@kernel.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1koutk-00D1Uk-Qg
Subject: Re: [f2fs-dev] [GIT PULL] fsverity updates for 5.11
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

The pull request you sent on Sun, 13 Dec 2020 21:53:27 -0800:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fsverity-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/51895d58c7c0c65afac21570cc14a7189942959a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
