Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5673D7DC349
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Oct 2023 00:50:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qxc1a-0004Rr-K0;
	Mon, 30 Oct 2023 23:50:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1qxc1Y-0004Rl-M0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Oct 2023 23:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MA3yLpkdcI8/8X9SLUZt7KG937s4S2y7kAepEI526Ls=; b=PVIscl9vmtL4DbT3UKo5u/QSm/
 ePqvszEXip9HqFT+OhXFwKYo6Y7Kl8kFi27MbDWX2V0dkmDj+PvwpWiKo4FZscVWJ+gFCFjVNqU41
 9WZgGC7MONS9tFw6c/z3DukwgCxgypZI+MS+/STmDMesJpgvDh/JeJ3nr+yOQVY5toY8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MA3yLpkdcI8/8X9SLUZt7KG937s4S2y7kAepEI526Ls=; b=mzvxhLID9Kx6uDcfN5YMlB8nMk
 1yvKwki/HnV5Q7ozufVo5Ge48055FQF3NPjb4Wyd6gVZbjIsUDu+cIgPjZWYOYuCQbGFvXgMmtigQ
 QmiMDUVfJEftbZRgK+IKYof/o2he/Xu2QNd4FmWtRbFyLW8MisU4ZvnyrrkEMpjOOJH8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qxc1U-0004nu-LX for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Oct 2023 23:50:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BD0A3CE1686;
 Mon, 30 Oct 2023 23:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4769C4167D;
 Mon, 30 Oct 2023 23:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698709804;
 bh=YRuUm4bfW2EB4ANBzXvcekrGTyABOCWpea4WyLpA9kE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=tFLJlvO+xv7S4as4euBltdN0oU+rxy6zacIym/GuIP/H2Ou9f7/Xin0j/KPnPJwIz
 sj98p3Vldxet+2fsIyrhSOywkiOaxThF8vTr+BXLzLLBmVh8uNiqjftnwYcV+O0DLX
 TIaEIQVt4/zp1KKY4UQfRYf1MltOG/KUh+eU808ZFO2jxHiwQ/0nLV7OTykJqV2TBe
 5Q3wF7R2/yp6eKy5DtM7b5mfHSVKOnrDCfMots+XogV2XkSb30msQI2ZsQGCpQ2nFR
 Nad4sNGVVFWdgbMsGQjN4inlu8Ewj1HKkkMVxnsp/GolIbI83aqmHFAzc/iFQaJ5T4
 pQXgjpdUG096Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C8140E00092; Mon, 30 Oct 2023 23:50:04 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20231030040419.GA43439@sol.localdomain>
References: <20231030040419.GA43439@sol.localdomain>
X-PR-Tracked-List-Id: <linux-btrfs.vger.kernel.org>
X-PR-Tracked-Message-Id: <20231030040419.GA43439@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/linux.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: 15baf55481de700f8c4494cddb80ec4f4575548b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8829687a4ac1d484639425a691da46f6e361aec1
Message-Id: <169870980481.17163.6617828174238746064.pr-tracker-bot@kernel.org>
Date: Mon, 30 Oct 2023 23:50:04 +0000
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -3.0 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Sun, 29 Oct 2023 21:04:19 -0700:
 > https://git.kernel.org/pub/scm/fs/fscrypt/linux.git tags/fscrypt-for-linus
 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/8829687a4ac1d484639425a691da46f6e361aec1
 Content analysis details:   (-3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qxc1U-0004nu-LX
Subject: Re: [f2fs-dev] [GIT PULL] fscrypt updates for 6.7
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
 linux-btrfs@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Sun, 29 Oct 2023 21:04:19 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/linux.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8829687a4ac1d484639425a691da46f6e361aec1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
