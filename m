Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8F85F3BBE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Oct 2022 05:45:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ofYro-00077p-MY;
	Tue, 04 Oct 2022 03:45:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1ofYrn-00077j-4N
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Oct 2022 03:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/OoC0b58uo70powlQpwO+frLBMcD8k/GyQ5H9rxgH6o=; b=SZgH/bklCK/69L1KisLmeLSKU6
 tMMiILaZn1T8aP6zQ3M1XWfg72sy2QQBskVOgbmUzHl7iHmkiQo/PC86W4uZgEUTSL2bdV9DlsEun
 sXdg9+Eylg9eaBLcx9iIzdjkjb2QQIjFdNKsHE3Gk3mtAGgpWlorIvjqTWkuEWNl4AIQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/OoC0b58uo70powlQpwO+frLBMcD8k/GyQ5H9rxgH6o=; b=AEhnlU2aVAElpv4EF0FNCIwXNS
 aRynNrFzJENKwPy0Z6tlTyaYjqDSTFqSdKWNkxNgmvWj86Cwf0vPkDxSfjrRw/iZfuwoRX01aiX0R
 Eejqdh0KmXgf+N5+EETXTaylL8YIkvpTX+67UUSKPwnGoxywM7UEqrDMkvpWnCMDunHw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ofYrh-00Bqre-Qf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Oct 2022 03:45:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C91561252;
 Tue,  4 Oct 2022 03:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7667EC433B5;
 Tue,  4 Oct 2022 03:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664855093;
 bh=x7gd+EVcFPH1Kgn1LX7rIu4VGEoIDc3NvqgSFQjUiWw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=I0UwOOhK97s2oF2aqiE7cewDDiztY8T0WCXjsrNazD/FWEE05CALJvtw3qrRK5OMi
 lemOjZK+zG38BXijAeWL5bnJpDoZ7CjMNaX9RZbrkdMt/SqWtjYc2Wo5535LLLlg4b
 rgsgn/lLL2aINK8qD/wSaCyQjD87gW3PJ0DXB2zatZQr054jYoEw8QkHfPmasVKjNt
 tCsywGL5a0MDmxStLXSnh3CaUz1zeq2eSAwYfkerGx9aXg9SI0yRyMQdiJst3qrGJl
 Thao8PDDusuXGMO6EhmoUyZr3JJiRDZW7L/Pyho0Q6r3o+Gpq80YA+xACzUPAv2p0M
 CZXDZURGiYlPw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6318AE4D013; Tue,  4 Oct 2022 03:44:53 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YzpXpalOcvwp+keu@quark>
References: <YzpXpalOcvwp+keu@quark>
X-PR-Tracked-List-Id: <linux-ext4.vger.kernel.org>
X-PR-Tracked-Message-Id: <YzpXpalOcvwp+keu@quark>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
 tags/statx-dioalign-for-linus
X-PR-Tracked-Commit-Id: 61a223df421f698c253143014cfd384255b3cf1e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 725737e7c21d2d25a4312c2aaa82a52bd03e3126
Message-Id: <166485509340.18435.16538782233401144601.pr-tracker-bot@kernel.org>
Date: Tue, 04 Oct 2022 03:44:53 +0000
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Sun, 2 Oct 2022 20:31:49 -0700:
 > https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
 tags/statx-dioalign-for-linus
 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/725737e7c21d2d25a4312c2aaa82a52bd03e3126
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1ofYrh-00Bqre-Qf
Subject: Re: [f2fs-dev] [GIT PULL] STATX_DIOALIGN for 6.1
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Sun, 2 Oct 2022 20:31:49 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/statx-dioalign-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/725737e7c21d2d25a4312c2aaa82a52bd03e3126

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
