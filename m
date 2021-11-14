Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDED444F5CC
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Nov 2021 01:43:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mm3cI-0002RY-VQ; Sun, 14 Nov 2021 00:43:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <pr-tracker-bot@kernel.org>)
 id 1mm3cH-0002RO-Fi; Sun, 14 Nov 2021 00:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nn9AjdEQcar7Llgyb9C6TG4b0nffULvzuHJG+/GoWnQ=; b=frIbOIuFDByI9nTmP9pGhpOxGr
 dd3Ucqt6tNW9LRNqL9FBpdqSTfb6rbnFtGe4Wz+06qlj/XU/XxYjtkB4gKq8jhwZMv23RIX1aDO9k
 kRqjjZ3DEtieib4cWA8U20BB5PeYAN+lIBTXDUhhXWyls7aHj/3lOqLQiEqo0Vjj9OaM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nn9AjdEQcar7Llgyb9C6TG4b0nffULvzuHJG+/GoWnQ=; b=ZR/3bnLbdHTVUgAzuBFeeqWDOj
 HQYUTb6PsBiNY/olmUF0fVdJaefn1XM7l+fhMAnmQINMkoLFcTRgoeeKQrZOK5mdtXgBnj0ragGdj
 jTjBNXhUOZRUo6/c90llOnBUiD/GBZ018tOSeNfMGDgazPwrWWH/v6mYDvZ9SI5p5f8s=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mm3cG-0002Fa-2k; Sun, 14 Nov 2021 00:43:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 9821960F6E;
 Sun, 14 Nov 2021 00:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636850597;
 bh=kSQEnUJSy37aGANrQ0WdPrI9GiTPhxp3CH9jlHblAPo=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=t81FBQMT9zJaqYM4DVlFdGCyh6sbvtGes3NVDeMmoXbeqDi164d6XajAGsQ0fK8EO
 hfyFhNKirhXaqa0yr44VdyHdNZ9w89WXHV47MXn3W18Vz8nKk/hN/MtQhfcNeejJWb
 MmU7cGI1MU/jz8j9YgNx+5+IPlOTdbZO/FR2f8OuOwecSrvfsKK9/Zw6e8l5mG8MQu
 EZ9MaGj8mACg5OphZSz6ARieCBVkHEdF7ifinbTACHd09lrd9Yg/an8dz/7SHnMInd
 hyGHNCqkFL1MwD8zHsMkBJoK1veHfZyv9vWJejJyTaE/Q0u/hRZolTKwyznpro1qpo
 kDXJiqM3nSf9w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 785F9609E9;
 Sun, 14 Nov 2021 00:43:17 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20211109013058.22224-1-nickrterrell@gmail.com>
References: <20211109013058.22224-1-nickrterrell@gmail.com>
X-PR-Tracked-List-Id: <linux-btrfs.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211109013058.22224-1-nickrterrell@gmail.com>
X-PR-Tracked-Remote: git@github.com:terrelln/linux.git
 tags/zstd-for-linus-v5.16
X-PR-Tracked-Commit-Id: 0a8ea235837cc39f27c45689930aa97ae91d5953
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c8c109546a19613d323a319d0c921cb1f317e629
Message-Id: <163685059743.28431.13950472778417333186.pr-tracker-bot@kernel.org>
Date: Sun, 14 Nov 2021 00:43:17 +0000
To: Nick Terrell <nickrterrell@gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Mon, 8 Nov 2021 17:30:58 -0800:
 > git@github.com:terrelln/linux.git tags/zstd-for-linus-v5.16 has been merged
 into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/c8c109546a19613d323a319d0c921cb1f317e629
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mm3cG-0002Fa-2k
Subject: Re: [f2fs-dev] [GIT PULL] zstd changes for v5.16
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
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>,
 linux-kernel@vger.kernel.org, Tom Seewald <tseewald@gmail.com>,
 Chris Mason <clm@fb.com>, Jean-Denis Girard <jd.girard@sysnux.pf>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Paul Jones <paul@pauljones.id.au>,
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 Christoph Hellwig <hch@infradead.org>, Kernel Team <Kernel-team@fb.com>,
 Eric Biggers <ebiggers@kernel.org>, squashfs-devel@lists.sourceforge.net,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Nick Terrell <terrelln@fb.com>, Sedat Dilek <sedat.dilek@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, David Sterba <dsterba@suse.cz>,
 linux-f2fs-devel@lists.sourceforge.net, Petr Malat <oss@malat.biz>,
 linux-crypto@vger.kernel.org, Felix Handte <felixh@fb.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-btrfs@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Mon,  8 Nov 2021 17:30:58 -0800:

> git@github.com:terrelln/linux.git tags/zstd-for-linus-v5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c8c109546a19613d323a319d0c921cb1f317e629

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
