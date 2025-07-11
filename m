Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA18B021C8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Jul 2025 18:30:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anw7P0f0G2zv+YjiWWj0ca2oC+/KXFTwFJ5DIy1cl4w=; b=MKKlyklDv91ALOFJoq0oIXa7sq
	+byzqffcQ7joNevnHONUyDoY73xZzXMLuqZX2YFd3jqbNSI5PVTZgSDem0vau2GG7TBWgLVD7PHZX
	sswL7m0d8iJA/QDFko/CDQlhOgc+Zc2XSO82KaK/aBJZ7+wd0wp29cA4gIA5lcfKsY6A=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uaGdP-0004oq-R2;
	Fri, 11 Jul 2025 16:30:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uaGdN-0004nh-8e
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 16:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k0bQL3pDdikn9fszSnn0O4VEzOVXpYjSyjP6MhsxigU=; b=XPxSxoZlvjvS0cnOReKChcUIir
 jRI+ZHczIBuSztqG1OwQaJwZiCim5FJmkWKflt46liAou7W2tQOOfGfexGrS4+q0lHqDLhqa5VqA+
 ynGzZmAI2ov+fvQKNPaX0dMWPx0cu1p1SbyQoBlCkUN1TeC8jgQoIitoEOx6JUpzuL4U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k0bQL3pDdikn9fszSnn0O4VEzOVXpYjSyjP6MhsxigU=; b=VxXX3AkV5v4SPjH3RNxdjJ8zen
 lRFY9buvAKuCXhDYC1xAwM47wvyZ2qBdmFHS2gl1VF5fC6b3nmZDnBScxuQ7UVQPS2O73siqSzevy
 R2UEqWqjcvllL2/XjfrGFulOAL2YcB3qdsRUN8CAPm3NAWUq6r1hptCPtxXKeO4KT9oA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uaGdL-0006UT-I6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 16:29:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 28D7143F0A;
 Fri, 11 Jul 2025 16:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07BB1C4CEEF;
 Fri, 11 Jul 2025 16:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752251389;
 bh=2OGQGgPpKvvNdMjGBIOmpAcS0bNRC4IugzOe+tpf3aM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=TesEnwQGrpHC2OLod6aPqiCZcNw8EHJmjNIYTld6j4TcvWVRRBaIOplawF1kwmfTe
 dN3Ej7vKYpwMNT3/FduE/QB66bt/6tJtVaGOSqBqn3WvFaap8WwrCKAAlmfKlMTS4H
 1F3IH95k4BqxyxczCDrU6yKtOtfzzD0kuNubS3R3X69XO9Ac/YDOCJdsVIZG08Wvl5
 8S7rRMVoIe4ALFslCmykFy8slTL1raNM66op/h3I2TwlR0BF3h+JO6H7gm1zP5kvjl
 k7+hiNO5ldIFRYbLCcafPxr/WINDn53qvOGWkIoKrm+bKwsa/R984NiN613TTc5/gP
 ciNL0qXCzlW9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3402B383B275; Fri, 11 Jul 2025 16:30:12 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175225141074.2328592.18102776950880358340.git-patchwork-notify@kernel.org>
Date: Fri, 11 Jul 2025 16:30:10 +0000
References: <20250420154647.1233033-1-sandeen@redhat.com>
In-Reply-To: <20250420154647.1233033-1-sandeen@redhat.com>
To: Eric Sandeen <sandeen@redhat.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 20 Apr 2025 10:24:59 -0500 you
 wrote: > This is a forward-port of Hongbo's original f2fs mount API conversion,
 > posted last August at >
 https://lore.kernel.org/linux-f2fs-devel/20240814023912 [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uaGdL-0006UT-I6
Subject: Re: [f2fs-dev] [PATCH 0/7 V2] f2fs: new mount API conversion
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun, 20 Apr 2025 10:24:59 -0500 you wrote:
> This is a forward-port of Hongbo's original f2fs mount API conversion,
> posted last August at
> https://lore.kernel.org/linux-f2fs-devel/20240814023912.3959299-1-lihongbo22@huawei.com/
> 
> I had been trying to approach this with a little less complexity,
> but in the end I realized that Hongbo's approach (which follows
> the ext4 approach) was a good one, and I was not making any progrss
> myself. ;)
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/7] f2fs: Add fs parameter specifications for mount options
    https://git.kernel.org/jaegeuk/f2fs/c/a3277c98b64f
  - [f2fs-dev,2/7] f2fs: move the option parser into handle_mount_opt
    (no matching commit)
  - [f2fs-dev,3/7] f2fs: Allow sbi to be NULL in f2fs_printk
    https://git.kernel.org/jaegeuk/f2fs/c/405e5e00bfee
  - [f2fs-dev,4/7] f2fs: Add f2fs_fs_context to record the mount options
    (no matching commit)
  - [f2fs-dev,5/7] f2fs: separate the options parsing and options checking
    (no matching commit)
  - [f2fs-dev,6/7] f2fs: introduce fs_context_operation structure
    https://git.kernel.org/jaegeuk/f2fs/c/54e12a4e0209
  - [f2fs-dev,7/7] f2fs: switch to the new mount api
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
