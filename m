Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1071D6FB659
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 May 2023 20:34:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pw5h6-00042x-Cn;
	Mon, 08 May 2023 18:34:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pw5h4-00042q-Mb
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 May 2023 18:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZLDtmJotQDmcAvT9TI31K4nKKNNZ1UweqC1YRXcEQ7A=; b=HugqzLFxxOeYty4YwYK/2mBAXX
 Kmf62q+4LsGx3gKNQE0DF4vHBCok5xd3jHdlkYJ7Z0nFT8TGL9nbYnGXaRJEx6Yx8EkbpVvMRvdw+
 /gFsveorgb8uW6GCb4nJ0rXIDEVGSHIkfPVnX91i03gMWfglVeKn5S+OiDIbVELwBa7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZLDtmJotQDmcAvT9TI31K4nKKNNZ1UweqC1YRXcEQ7A=; b=QbvmYZR0Q8Db8wgm3oxJgNKsA9
 VvitbQ30hfwHIFeoPJ6sTyZOoVRjFNwzmHDa33ZD9fFUAxPcmCrmAWQrL7FPPMikjli2t7l/ncPHM
 broVmSnneF5r3lDon2/trgqhRrrFlmzFw+OhDJu5BpQdKLT03CpFMlxWlfGE7FN/mLX4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pw5h0-002LNb-7H for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 May 2023 18:34:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D10C862008;
 Mon,  8 May 2023 18:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A7C6C4339B;
 Mon,  8 May 2023 18:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683570867;
 bh=OXx9cx5GunHISUYEshg8K7KNDsiUW8n0oQxIlts6wrU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KzeGKOlrWBn+K/WXqBlAJ+YlyLVQoVVLLmZpYXA8yCt5V5b229Ws++lVjayOI/PLy
 P9kLOcjqy5927uX7D97USi64NoP2ywUC7jPnROLeRknDEuKx+fPGnATAtqO8GTvHMi
 qAW3jH1iDc/ZaKy6SzE2NHN12AhIYDz4folwtVkZPTD8VzoOpXxB4HKiQi3o+kGnVr
 QsDU9D62OLlA5F98LYkeVj83zJb4jdFhzorFs4EQK6w3J4sysDn1eUcR4SfPBtNXSi
 n31hLQ0DNa9VzRWzu3rBXvFXlZvbIGxqcewUahl16MnWIpKhSXFB/t6l9vaMnMXytX
 aoGXVfYzc3QxA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0C9C3C3959F; Mon,  8 May 2023 18:34:27 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168357086704.2764.10149891359140329817.git-patchwork-notify@kernel.org>
Date: Mon, 08 May 2023 18:34:27 +0000
References: <20230424234648.577673-1-lizetao1@huawei.com>
In-Reply-To: <20230424234648.577673-1-lizetao1@huawei.com>
To: Li Zetao <lizetao1@huawei.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 24 Apr 2023 23:46:48 +0000 you
 wrote: > After the commit "0a4ee518185", this "goto" statement was redundant, 
 > remote it for clean code. > > Signed-off-by: Li Zetao <lizetao1@huawei.com>
 > --- [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pw5h0-002LNb-7H
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: remove redundant goto statement
 in f2fs_read_single_page()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 24 Apr 2023 23:46:48 +0000 you wrote:
> After the commit "0a4ee518185", this "goto" statement was redundant,
> remote it for clean code.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  fs/f2fs/data.c | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev,-next] f2fs: remove redundant goto statement in f2fs_read_single_page()
    https://git.kernel.org/jaegeuk/f2fs/c/1223e432d9e1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
