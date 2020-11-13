Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C40ED2B136D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Nov 2020 01:44:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kdNCS-0000QC-LW; Fri, 13 Nov 2020 00:44:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1kdNCR-0000Q5-7C
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Nov 2020 00:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1f2/bJJb9PlBYZmD3UslbVOSUrBGjVhe16PNuH0rPjc=; b=O48vAmEgtoIHt8hFVPhyf0k9R3
 m++CwBoL1K8kF1e9lIQj7aZfhhpIWyBiXS66CID5QqOdpG1C3HiGcWSbZPAMiAEKlLQPcBPBjY6yJ
 uM6GOM/ZNscwYSt5YzN2UWBONjiL//O1HuVjC1BaD6gcWBHTUUTMWv1VWKmMcRHrdX6Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1f2/bJJb9PlBYZmD3UslbVOSUrBGjVhe16PNuH0rPjc=; b=GbOk0WVX7nrsb4tMgiFVkWCH3o
 FUJyvGUYT1phpdSWCTFtf5ggAubPMUr74jbfU98BNjCWz45343J6TOrDjYBysf8X3xWPKShvmVLXq
 lQuTFAsAuyqQJYr7nO0iNS0tNcr6CCV2Xy4ujL7GKWhnG2FDw+fbRUnOCFlTOPxiMmvk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kdNCD-001PT5-5w
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Nov 2020 00:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605228238;
 bh=BIe5HMjS9gt50Hxj+EvtbJmyK6vmFdQ/47oHVfN9Wac=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=v4aVOxObp/Bh95+DWGWwHvPWYLKI4tS+miiHRyVUCTSXsFZh3G/gb8ZOkRRqtCo41
 xrm/mGmBFFzW8H42Ri1vam2cM2NS3jcU+hyfixzrtf7UMa06AnEFZFOWKWz+18D6Bm
 MLTqgGg0h0LsHGmUdJFJYaYlfABEtJXjGxHXDVSY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <X63CTrVsH3WD+xcE@sol.localdomain>
References: <X63CTrVsH3WD+xcE@sol.localdomain>
X-PR-Tracked-List-Id: <linux-ext4.vger.kernel.org>
X-PR-Tracked-Message-Id: <X63CTrVsH3WD+xcE@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: d19d8d345eecd9247cbe6cbf27aef271bd88aba7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 585e5b17b92dead8a3aca4e3c9876fbca5f7e0ba
Message-Id: <160522823863.10618.11737091089665240139.pr-tracker-bot@kernel.org>
Date: Fri, 13 Nov 2020 00:43:58 +0000
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
X-Headers-End: 1kdNCD-001PT5-5w
Subject: Re: [f2fs-dev] [GIT PULL] another fscrypt fix for 5.10-rc4
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
Cc: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Thu, 12 Nov 2020 15:16:30 -0800:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/585e5b17b92dead8a3aca4e3c9876fbca5f7e0ba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
