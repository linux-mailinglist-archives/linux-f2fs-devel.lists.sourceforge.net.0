Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8ADA7407C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Mar 2025 22:58:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txvEq-0004Mn-DE;
	Thu, 27 Mar 2025 21:58:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1txvEo-0004Me-Oa
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 21:58:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cdv9JRegSNswIU8NCARaciRk1V+G0Rq8cpGTpJkqjUo=; b=LXq7LDahpMl7/QXFG4ujsqansG
 yX59tGqRED1a2EcweDp1o4PKplED7r/pUcGZHUFiPG7ILHRnakLVSKgVBEmCxGXuiPfEVq47SFjL8
 PTw5uwzW2TqmirWhJoVfpW8i9M0sL/2NQLlXKsEZRRvuPdEz6+NOUk/n996hiS+LDhfU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cdv9JRegSNswIU8NCARaciRk1V+G0Rq8cpGTpJkqjUo=; b=LwhmV/P/d/muXllDLKaApMm0kZ
 g91fNB+/XsTd0LAcWLIjxfCFj640fV5HhJ2kp4xdJ2KWmsk/zjnpB/bwP3oeSHQAecVvp0G8jg5/n
 GQJuT7UeZLGCHBcgaBBlNL6wB/A0BltYCmveVVAr58eUAkSGGKO7n8w+jaAXzMub2Q2M=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txvEe-0008Up-IH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 21:58:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D004AA42F20;
 Thu, 27 Mar 2025 21:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3B8C4CEDD;
 Thu, 27 Mar 2025 21:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743112669;
 bh=yrJ82et3mj4de5bHGMGo8C0V7xBVxSQ6fqTazodMdsM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XJN7psxHDpp4GXjsNfkTOLtqTVZ25oYnkuVwp26YN2Zc14nkLj5oolvFlHVpgw/Hf
 2+QLJBavHNVCJHD7dNlv/nUwJSiFEoZxKh13Ck6po89Wfc+HDJGmn9ZCLT/2nEYTsn
 ZCNqmMwiknbXVoIe1BVly3J35P4V2Ues6kHiWw7T/Fbp5HKRM8q2FU4VtZns+Pl4M4
 iMKo5wPw9kFkOHrWNUkZaYpS1oQOs32jeUUbxnOzcHugglnQBemyiVO1AxMnmoGzkX
 E7T7NMIUxYyEjZnIJyzqBg6e0wnITTul1cNUAOFb7EnVC5oIvRGtGM4SfWjAFzSVOr
 Sc84sNn3gBiSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAEBB380AAFD; Thu, 27 Mar 2025 21:58:26 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174311270549.2230226.7159828218594723399.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 21:58:25 +0000
References: <cover.1737135484.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1737135484.git.mchehab+huawei@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jonathan Corbet <corbet@lwn.net>: On Fri, 17 Jan 2025 18:59:29 +0100 you
 wrote: > Hi Jon/Greg, > > The main goal of this RFC is to give a heads up
 of a work I've been doing to > replace the get_abi.pl script with a python
 version. > > [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1txvEe-0008Up-IH
Subject: Re: [f2fs-dev] [PATCH RFC 00/10] Improve ABI documentation
 generation
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
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, gregkh@linuxfoundation.org,
 james.clark@linaro.org, suzuki.poulose@arm.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 johannes@sipsolutions.net, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jonathan Corbet <corbet@lwn.net>:

On Fri, 17 Jan 2025 18:59:29 +0100 you wrote:
> Hi Jon/Greg,
> 
> The main goal of this RFC is to give a heads up of a work I've been doing to
> replace the get_abi.pl script with a python version.
> 
> Patches 1-6 are OK to be applied:
> - Patch 1 changes the sort criteria of the ABI generation to use alphabetic order:
>   currently, it is *almost* alphabetic, but, on some cases, it orders on a different
>   way. No changes at the content, just at the order.
>   I wrote it mainly to use the same sort criteria as the new tool, but IMO it is
>   worth applying even before we switch to the python version.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,RFC,05/10] ABI: sysfs-fs-f2fs: fix date tags
    https://git.kernel.org/jaegeuk/f2fs/c/90800df0da78

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
