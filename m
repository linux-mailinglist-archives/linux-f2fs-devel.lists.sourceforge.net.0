Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3145F3BBD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Oct 2022 05:45:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ofYro-0003qO-CQ;
	Tue, 04 Oct 2022 03:45:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1ofYrm-0003qI-V0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Oct 2022 03:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qf03lHLkIAtjNVDKqi89f8SHXQd1Zela0dRJw2MPH9E=; b=kCNJU2ZfLxygl1sygjtXB8NjdJ
 ZEhh4VZp/1cWwRin2lNxTQQaYzxYInFJv3umUP/MJEB0RzP4auoHXcnCRfBvqR1dLD2x4Uj3OBVbE
 oFNgfHFKl2pPx36SROzfrqYt/HZzV7yntm93zxNQ+6T2beT67rKZOGX9jKZFZRCRM+ss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qf03lHLkIAtjNVDKqi89f8SHXQd1Zela0dRJw2MPH9E=; b=fQ8QXVc3IjnHrTrKSID2InRrS/
 XuFka/f/h7c6KQ1hQ7/c8V/bHPi3M1FUhtWgeIGPY31PgsId3aVuykkMilgYnPt2vDadIM52nvw1I
 q5tpIG+bbenobAFknoi6lgq77SezNtBbHZTUkZsNqO6IOBPFiE1lx6vnLQTxf0AbHZdA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ofYrh-0000j9-Qe for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Oct 2022 03:45:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A7ECCB818FC;
 Tue,  4 Oct 2022 03:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5ECE5C433D7;
 Tue,  4 Oct 2022 03:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664855093;
 bh=QXEoLo1dKWbjRA3Zt6TXmiZvUSJjyNbwwOlKDlL1NAs=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=gWveEPYzx5AH+T1YmlA4iOwhhrea6wFD5bVYGBs1il6oYjkJ4bivt+5qY5sYi8hg6
 8IMzvdujb+Z3atrRc0rjQn8yScBSUXJDYb6VBspkMNns+rurWIEI4aV2KGzRsrzNby
 zNslCoPpfkkvURRdX7x+WaHPZI4CEJxj9kSUBxpXh6pHA8cZFoDjVawUAFfTHajOd3
 8ghbr/pXYQPRRmhLwUYm7igpANf0DG30ZLXZah3FDSx4hJTj6g82UpAIiSXbO5z3B2
 KyQ9BrawmXWNu16KqBBwVkiLF6DRXCwa1sN6KQSdsM71hNEyYE0OLuhDD4lvcXS+Io
 qyZTK0tnCGoJg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 44292C072E7; Tue,  4 Oct 2022 03:44:53 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YzpQMx1FiZp/PsM3@quark>
References: <YzpQMx1FiZp/PsM3@quark>
X-PR-Tracked-List-Id: <linux-ext4.vger.kernel.org>
X-PR-Tracked-Message-Id: <YzpQMx1FiZp/PsM3@quark>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: 0e91fc1e0f5c70ce575451103ec66c2ec21f1a6e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 438b2cdd17a6c9df607f574bd13b6b637795a411
Message-Id: <166485509327.18435.1743382934950044503.pr-tracker-bot@kernel.org>
Date: Tue, 04 Oct 2022 03:44:53 +0000
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Sun, 2 Oct 2022 20:00:03 -0700:
 > https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus
 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/438b2cdd17a6c9df607f574bd13b6b637795a411
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ofYrh-0000j9-Qe
Subject: Re: [f2fs-dev] [GIT PULL] fscrypt updates for 6.1
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
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Sun, 2 Oct 2022 20:00:03 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/438b2cdd17a6c9df607f574bd13b6b637795a411

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
