Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8796AB7000
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Sep 2019 02:20:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iAkBL-0003Sp-Rf; Thu, 19 Sep 2019 00:20:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1iAkBK-0003SZ-EZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Sep 2019 00:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zOMwNaGiih/gkSUc7MMyit7cZtHV2PvdkeiSD3Mab10=; b=K7ImjodhOal3Cs3aJsvJJig67y
 XF5WaUE7YxJmLr/SIoDYGn9ZHoOvcpjgpPzPK1p9XXxg0voKzXwhYJFJjb+TK0f0B06MG7yiTQmtp
 EZpjzqchP4mZNppQ0xfb4qY3pJAs/dODH8+xgFrVW4iiGwSy9MCiUy/bjDiFyz+uIiA8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zOMwNaGiih/gkSUc7MMyit7cZtHV2PvdkeiSD3Mab10=; b=kfTTXfr95kin6OmnBXW0/2K7UV
 sG5PSR/WLW0neTDjRbmNQLvSg9U+M9u9bQcco3Th354fpjrVR5dOl4HwgWHEJy5Pe664IgJI0fM4Q
 sOiPZSfYBsILzAEMwlYQwbDcaYFoZ1VA6rk8XKPgUpnCTOH2Bm3zVo3wjBJHyUru2V2Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1iAkBI-0034yY-Nl
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Sep 2019 00:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568852415;
 bh=Kgnmdq9f4tydvkTaAzsFlsaT7RZYMwPGjy6eZyrv2lg=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=d4TYbWotbCsYwIReC6TqfGLqYzZ83KC56t979ih9FDQTPr7IfbE0f5p7dLiPIIOqg
 NCKzukI+2Hka2uUCA4sOvoKLK31ijYnyt5jdN+CsHO4N1CyMWrm8exGDvlc/q6deD6
 cUVAtOMjNAHxacwwUFywbfjnrJ7WSFDHxHPCpjVA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190916052053.GB8269@sol.localdomain>
References: <20190916052053.GB8269@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190916052053.GB8269@sol.localdomain>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fsverity-for-linus
X-PR-Tracked-Commit-Id: 95ae251fe82838b85c6d37e5a1775006e2a42ae0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f60c55a94e1d127186566f06294f2dadd966e9b4
Message-Id: <156885241510.15091.4135567870760674350.pr-tracker-bot@kernel.org>
Date: Thu, 19 Sep 2019 00:20:15 +0000
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iAkBI-0034yY-Nl
Subject: Re: [f2fs-dev] [GIT PULL] fs-verity for 5.4
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
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Sun, 15 Sep 2019 22:20:53 -0700:

> git://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fsverity-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f60c55a94e1d127186566f06294f2dadd966e9b4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
