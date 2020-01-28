Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BB014C3A7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jan 2020 00:40:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iwaSq-0004Ym-Us; Tue, 28 Jan 2020 23:40:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1iwaSp-0004Ya-Sl
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jan 2020 23:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vrlZ0nVCfkwotcqRs42PAQErikqPofy20q8uJJ+ulkY=; b=hil/zoae9/MpkxzQSIMvWxX3FF
 cIMXnSA3Wj75fx0wvZGx2QQzgQPxzhIfTiQjX/SXOr0OHvsDsfkD0eolQ3W/1cEPUVph3sFoZiMS7
 6K1SeluMtPc4wYpA8qblYUnw+rpuJEs0vRdAbtjPzFXL5b6M3ncU8ehGk7mjAP3GNJJQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vrlZ0nVCfkwotcqRs42PAQErikqPofy20q8uJJ+ulkY=; b=GttC1rZzupGEQw7UbBl8NDJNsr
 SXYnoiF9HPXD2DngZMUl39bhKf//Ac5NzNu0XPK90k32PcxdPPZ4hvEZzlZoi8yMRmMCU+RnTB9N1
 e2lpqW96kZCFptV2wXmV11mSYgl/waA9Vu00HRs1ntFCtaGWcHIE9lAzJFsK1VL5qqbQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iwaSo-003OAH-O5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jan 2020 23:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580254802;
 bh=9uTx239fooQ7plHBZTD5UrhlEffcj1C8aMwsaCAAq7A=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=NyIceaZsXCVYbOokVaYNLUJfCu61F+S/qyKlSpWbLDTRehexksnLX99Iv4zylcp+3
 Zy8b8dsSMMMJCa8+nPif1Mov4/azHx09UOn59K+SznaP3Fx2a9+Ip597Aurp4wtrvG
 Av69XK6AbmvHS+YgMHu9oaZ8p+OUcwQsBu0h79dw=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200128014944.GB960@sol.localdomain>
References: <20200128014944.GB960@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200128014944.GB960@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fsverity-for-linus
X-PR-Tracked-Commit-Id: da3a3da4e6c68459618a1043dcb12b450312a4e2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c8994374d90b5823b3b29a5e5d8648ac418b57b4
Message-Id: <158025480250.16364.14659123775629628109.pr-tracker-bot@kernel.org>
Date: Tue, 28 Jan 2020 23:40:02 +0000
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
X-Headers-End: 1iwaSo-003OAH-O5
Subject: Re: [f2fs-dev] [GIT PULL] fsverity updates for 5.6
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
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Victor Hsieh <victorhsieh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Mon, 27 Jan 2020 17:49:44 -0800:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fsverity-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c8994374d90b5823b3b29a5e5d8648ac418b57b4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
