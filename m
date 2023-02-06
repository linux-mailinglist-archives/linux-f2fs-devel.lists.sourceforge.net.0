Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8104868B48D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Feb 2023 04:40:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pOsMs-0006Qr-Un;
	Mon, 06 Feb 2023 03:40:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pOsMr-0006Qi-Et
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Feb 2023 03:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eK/raFUy4Nu2W6VhgJv3SqRs+xvVQ8QV7KH2bexrFlw=; b=g5nI1/FpQWxe49UU1dLMY93P3v
 VF5yONzRXgNJ406SoOHURLINLepo9MIJNY+zNfJm5zG4C42UrTqcZKZlCZy2/OUsC/sG2o9Qg3Fos
 /g+/7JauIeCYG7BPpfiDs9ItTpaObBuAr5apSJf8Vt/1TjDOC3vI3jJdM6y917UFNQQI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eK/raFUy4Nu2W6VhgJv3SqRs+xvVQ8QV7KH2bexrFlw=; b=awgsWaGlgJTn9H/rfKA+Z6/EUG
 rdYmgI4ji5SWXTXoX+yYtyR+exMe+bcInOswsQUzeUFXGxXRH0XBL7KsD0S0rBtseSCBIAFZFEST1
 Nv+YCAayNCXcfaPfv+dRL4Ek3LtiXK47sXbTA2tv5fQSs/6zwkLo1aI1c0PLE5129Jos=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pOsMp-0005dk-BI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Feb 2023 03:40:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EFBB4B80D25;
 Mon,  6 Feb 2023 03:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CE4FC4339C;
 Mon,  6 Feb 2023 03:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675654819;
 bh=cuUmVlIvx0t/MTXG+vkVHRIKWFYI/gJMPubicUdPKKk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=YXXH2KDrW8jrh5RZGN6u9Xcr8BONEkidH9bc9pqDZaJll0PjgcwqONAwyrQ0m4qU/
 T9/eQhSlXZcuQEF+qrVnwoWOUpP+9zaw+V0voBmvm+d2TVvpuRTjZMIJ5v94WhsH0e
 0r5rD6AierG0r0UMM8LYAQ5r8bYbrxqiLnjb+1P6oZ/67qXmi4U4F/FZaYp1PHs/Ho
 s720UgbRaG8lhRLDX/JMf1qS8fENc3JeyODENlQh3b1zGbBC3aylDX+KAIQXdnirHA
 cMgttt5cF1Y5DhFxnarywKSxB5PLEe6g9L+ZOnXQa4cqFnz8WyUmaK6b55cfASQlWr
 DZCQCc4x1n95w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 61924E55F00; Mon,  6 Feb 2023 03:40:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167565481939.5323.10753252080244168478.git-patchwork-notify@kernel.org>
Date: Mon, 06 Feb 2023 03:40:19 +0000
References: <20230203010239.216421-1-ebiggers@kernel.org>
In-Reply-To: <20230203010239.216421-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 2 Feb 2023 17:02:39 -0800 you wrote:
 > From: Eric Biggers <ebiggers@google.com> > > When writing a page from an
 encrypted file that is using > filesystem-layer encryption (not inline
 encryptio [...] 
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
X-Headers-End: 1pOsMp-0005dk-BI
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix cgroup writeback accounting with
 fs-layer encryption
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
Cc: willy@infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 stable@vger.kernel.org, tj@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu,  2 Feb 2023 17:02:39 -0800 you wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> When writing a page from an encrypted file that is using
> filesystem-layer encryption (not inline encryption), f2fs encrypts the
> pagecache page into a bounce page, then writes the bounce page.
> 
> It also passes the bounce page to wbc_account_cgroup_owner().  That's
> incorrect, because the bounce page is a newly allocated temporary page
> that doesn't have the memory cgroup of the original pagecache page.
> This makes wbc_account_cgroup_owner() not account the I/O to the owner
> of the pagecache page as it should.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix cgroup writeback accounting with fs-layer encryption
    https://git.kernel.org/jaegeuk/f2fs/c/844545c51a5b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
