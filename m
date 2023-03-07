Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A136AEB1D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Mar 2023 18:40:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pZbId-0001iE-KV;
	Tue, 07 Mar 2023 17:40:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pZbIc-0001i3-Mg
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Mar 2023 17:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cuOke+nCzuU5i4mz2PQrXE7Ef+BsLrTnR1SxRTwHPO0=; b=e+QF1+TobpmF3aw/6LVxUQCPXO
 E1fNe0BAAtL1utwpF4OVJ/3KQ6w2HzsWEzXoW5e6Gzl8Bh1v6j62+/pZDam6c3pGp6H2+jewwFT0U
 gspVPITUizc0m/rI7VKwkSlcIhoBndOxI7K6GOZ5lgTDsiSJ5pZ0elK2kQANj/dD+mwM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cuOke+nCzuU5i4mz2PQrXE7Ef+BsLrTnR1SxRTwHPO0=; b=ctlChzcDRV9j9/m1p7p3qOnYDJ
 5RYuIdroS8amjlQUbsxL1zZ5KlZOMKR/n+UTYYZXULc3GEWMx6+g2ZD1GFbYfV1+g4Suh/gyhv0Ff
 0DDaJE4fYCCf+SK2SvP69hl7qmXb+eI0OxXEKy6UKtyEq7+8eLWlOMY+YOyUdNDESJpY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pZbIc-002P0D-JD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Mar 2023 17:40:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1FBC561501;
 Tue,  7 Mar 2023 17:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF6E9C4339C;
 Tue,  7 Mar 2023 17:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678210824;
 bh=nBD87ebtYyHOkt7XNSc1hkyvm5TVpFYpPKLC7O5xbSg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oWFJqa5qjySzpMRgbD+E6Vsqs+wW2DJyUAeWohs7eGUror17bo3tg2sPSoO0KZZL8
 p5mBcgIkqMsd4T61tDBd5ak6bOI5aLvy3g8l9svpn5MripXzDZE+9AdPYHQn+7bIIO
 0ikJ9qAY79TKfCFBt+kHdnGLlgqbFaVLKT/PrwQQ4v5p7OXuidAh3NGR5//TwAApjA
 4e4C8G8FLFpRolu+ExS59KkLQVgfMyBN05fKR7JgkHbbhd24GZ+BGjgGGx0WnF1+L7
 s9tVgv68N+vsjJQaSZH1itlkEwcvG4fxePy++NSJlfhfLoNWTnk9mcTJDjduJMlK57
 bSpWv3XIWjPwg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C2A50E61B67; Tue,  7 Mar 2023 17:40:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167821082479.1693.18260840022075703789.git-patchwork-notify@kernel.org>
Date: Tue, 07 Mar 2023 17:40:24 +0000
References: <20230306122549.236561-1-douglas.raillard@arm.com>
In-Reply-To: <20230306122549.236561-1-douglas.raillard@arm.com>
To: Douglas RAILLARD <douglas.raillard@arm.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 6 Mar 2023 12:25:49 +0000 you wrote:
 > From: Douglas Raillard <douglas.raillard@arm.com> > > Fix the nid_t field
 so that its size is correctly reported in the text > format embedded in
 trace.d [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pZbIc-002P0D-JD
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix f2fs_truncate_partial_nodes ftrace
 event
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
Cc: linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 linux-f2fs-devel@lists.sourceforge.net, mhiramat@kernel.org,
 jaegeuk@kernel.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  6 Mar 2023 12:25:49 +0000 you wrote:
> From: Douglas Raillard <douglas.raillard@arm.com>
> 
> Fix the nid_t field so that its size is correctly reported in the text
> format embedded in trace.dat files. As it stands, it is reported as
> being of size 4:
> 
>         field:nid_t nid[3];     offset:24;      size:4; signed:0;
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: Fix f2fs_truncate_partial_nodes ftrace event
    https://git.kernel.org/jaegeuk/f2fs/c/3ccc99d5a4ea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
