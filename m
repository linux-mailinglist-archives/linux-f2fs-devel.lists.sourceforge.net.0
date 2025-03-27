Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DC5A74079
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Mar 2025 22:58:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txvEb-0004Lr-K2;
	Thu, 27 Mar 2025 21:57:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1txvEb-0004Ll-8F
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 21:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yTsosmWFDJrYKDTB6WugqLLuQdtSDG4EgVM0MUY2hyQ=; b=mwFAOjxyz1THJ+yJlk2WMopaQh
 iOqFeJ3mRSa07cnnqq3JZ1Jr3CF09lDTHBxZb4rCTkux0xwhECpE5vHZVFXBJBAJ+PCmzKgpzx0QG
 R2HuRpc78o7x97NggD6dg7PLfu4ay5N6AODYa8N8uQl51qf7JcyLIxsSytHHCOTNYSF8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yTsosmWFDJrYKDTB6WugqLLuQdtSDG4EgVM0MUY2hyQ=; b=Yq+SsyL/T6H58cIbYXqZrKDCXT
 MDoWZZsmTV8ZBnEYQ5UvidYowXwTfn17AKxtp5lKyFmJhq3rM9QX87SfzueDA0BGHjQ1VripWG8vT
 Q7QCxGh7aNmfaHSSAO72VGNpBwltloBLVkGeqY38Sq8IsYkCV4k4vWGZcxUygQKmlsPs=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txvEb-0008UN-2D for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 21:57:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5E4E5A42F23;
 Thu, 27 Mar 2025 21:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BF0C4CEDD;
 Thu, 27 Mar 2025 21:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743112670;
 bh=2JaAn98f3WVVTUV4zPmAkU4cOoVTOpFjAd0eloNL26s=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=B6COfFjlmv44H/k8P+/lDonPywmqiVsjydXWYBGmwJNHXItK56LsIYYCHHQsNCi4m
 c8rDyU3SMmrjRXWXb4ZOTIUkAjf05A0hKeJKoHpRLXReBDGuzUUW/eZaSoDTyRK3BK
 Khjkc7cJSoPNhaOvjjnbXbD02ffpLYPlRS6fC9xq8J88o17qUC+1K/ophEYU+IZCQJ
 iv1KIjQaCTnZm+pVc/Q5fL2DhtGYEeQcDDS7ejfsxW3Ab5DPvDhRvhFhRTA17cABWY
 KgAGz2fwz++ipPkeXUlTM6Vzuk/lcC0EZZ4SLuQabCgAHXkMoLioP57G+iE7wt0m0Z
 +AB0AExum5kcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7109C380AAFD; Thu, 27 Mar 2025 21:58:28 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174311270700.2230226.6627341491675246186.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 21:58:27 +0000
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jonathan Corbet <corbet@lwn.net>: On Tue, 28 Jan 2025 01:05:49 +0100 you
 wrote: > Hi Jon/Greg, > > That's the second version of my RFC patches meant
 to modenize the ABI > parser that I wrote in Perl. > > I originally started
 it due to [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1txvEb-0008UN-2D
Subject: Re: [f2fs-dev] [RFC v2 00/38] Improve ABI documentation generation
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
Cc: linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 gregkh@linuxfoundation.org, coresight@lists.linaro.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-hardening@vger.kernel.org, workflows@vger.kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jonathan Corbet <corbet@lwn.net>:

On Tue, 28 Jan 2025 01:05:49 +0100 you wrote:
> Hi Jon/Greg,
> 
> That's the second version of my RFC patches meant to modenize the ABI
> parser that I wrote in Perl.
> 
> I originally started it due to some issues I noticed when searching for
> ABI symbols. While I could just go ahead and fix the already existing
> script, I noticed that the script maintainance didn't have much care over
> all those years, probably because it is easier to find Python programmers
> those days.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,RFC,v2,10/38] ABI: sysfs-fs-f2fs: fix date tags
    https://git.kernel.org/jaegeuk/f2fs/c/90800df0da78

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
