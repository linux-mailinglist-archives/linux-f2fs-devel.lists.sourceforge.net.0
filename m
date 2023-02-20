Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC43669D591
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Feb 2023 22:12:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pUDS0-0006pB-KP;
	Mon, 20 Feb 2023 21:11:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1pUDRz-0006p5-3k
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Feb 2023 21:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5r0SvNeycPwKIrxLvVenX9fCdsque3rgk6gpcQMuVe4=; b=ZYbh3H8FWhiFO3Zv/Rtg6vkmhG
 x5WUS2RsJpy4LTQc9JfEdIn6PGuo9GlKvja949clFX9JcPBOLEv1EEXUyf7Qu/SoJzse/zyCANx0l
 1nGii5F1hkB+GOrcHcuJOKkqTPklAsHuRbEfoio7PlaClfD43kGlEFfzJ+s2smXlCxBw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5r0SvNeycPwKIrxLvVenX9fCdsque3rgk6gpcQMuVe4=; b=nEtZRB/9UtClhv9HUrpPyVtWgt
 YjpMzGWmVQ+OvEWi5I0AG5mL/2SF9zieHni2UPi6pBaXVJ+1lqYuYywiv1Nl6T4FQowVQlvlnGeot
 Fqm2Z/npr/6rMv9aZQgOukEzA+bbvs1ERKW2lJKd2ShQIndDlH8qES3x8xXwi2t6xBj8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pUDRw-0003WG-QS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Feb 2023 21:11:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1D1F1B80DC6;
 Mon, 20 Feb 2023 21:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D040CC4339B;
 Mon, 20 Feb 2023 21:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676927502;
 bh=6g4NDisHRG4qmLpa8BDv5tH4TBrlHaYvx8l5KIe7WXw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=sdoTBEeNBYdtVmrVdNW//ChctssgK3NklmOKxnCz0WQyVtRiMbNshiNUHLRikVrtK
 0LldUTSs15SzOMN8Ysxw3oPzk+RurcCGYQI9GlMEcrutCkEL0Zi6f7RFvShUcCElAd
 lyrHaN73u9XSfWSTvXtWcRPeyRnfSXwGzOvvaFcciZh3W4gO4cUvCihHDYCsvJzrgH
 c54e21B4a8tM4g+HPZGk3O3mTuM1EAwzOiD2yCMqhY9H3A5EPImcnwL5Q4+3ohORZE
 TxstAJ+wnZDN2OMeBVZqTtwcmOjSPFMDxA61gfnawhf5gNfYL0FEtjboqdMBCVbaWS
 ASCNuC0W/itdA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B98B8E68D20; Mon, 20 Feb 2023 21:11:42 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y/KLHT3zaA0QFhVJ@sol.localdomain>
References: <Y/KLHT3zaA0QFhVJ@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Y/KLHT3zaA0QFhVJ@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fsverity/linux.git
 tags/fsverity-for-linus
X-PR-Tracked-Commit-Id: 51e4e3153ebc32d3280d5d17418ae6f1a44f1ec1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6639c3ce7fd217c22b26aa9f2a3cb69dc19221f8
Message-Id: <167692750275.16986.16446454723187739663.pr-tracker-bot@kernel.org>
Date: Mon, 20 Feb 2023 21:11:42 +0000
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Sun, 19 Feb 2023 12:48:29 -0800:
 > https://git.kernel.org/pub/scm/fs/fsverity/linux.git tags/fsverity-for-linus
 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/6639c3ce7fd217c22b26aa9f2a3cb69dc19221f8
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pUDRw-0003WG-QS
Subject: Re: [f2fs-dev] [GIT PULL] fsverity updates for 6.3
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
Cc: fsverity@lists.linux.dev, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-btrfs@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Sun, 19 Feb 2023 12:48:29 -0800:

> https://git.kernel.org/pub/scm/fs/fsverity/linux.git tags/fsverity-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6639c3ce7fd217c22b26aa9f2a3cb69dc19221f8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
