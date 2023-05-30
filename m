Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C407171D8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 01:40:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q48xA-00075N-8u;
	Tue, 30 May 2023 23:40:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1q48x8-00075H-Ln
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 23:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SUwC9jURQbSe5FpjG3KTUJuJbDj/W3hNP7Qv7IwlnVM=; b=Lz6dI/sB6Rlmt7FwkznDARilp1
 5xncwYMvtwM2o5cAq9LiXqOIhRN4VN7lsk5xgYHesrYSzbVVe4UP0ZumfbEsH2lA+pjbb3M7OH/eG
 7u9DymCbO75OJ4UBUQneoH90YkJ4tMVNj0FhhWynuIiLevO3YYtZ1w5snYFw/sU39YI0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SUwC9jURQbSe5FpjG3KTUJuJbDj/W3hNP7Qv7IwlnVM=; b=I600eZ+fZXzoObQWdTqicknBeV
 vH9ZPGmie/Hiuu7iX/IfA5CMmmXo9QwlqMPD/X3NNZpPCyNEhuIjhMp2alSyGY0rWevqoK7s1O3mL
 6AqcFhLUhWUI1cpN98SXH4b1twp2TrB1iV1FLPdwup2vwlzu2oYG5Ns1kfl+1uqQSJdQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q48x4-006wkQ-PZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 23:40:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 600986354F;
 Tue, 30 May 2023 23:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 429FAC433A0;
 Tue, 30 May 2023 23:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685490024;
 bh=X2D/1a1qdK0++0GVnVTUuU8tD+5QP3hQ8D+IOu9ggiI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=kaHUTYTq6NQmZcM5+V5T+3gOXuTYdbf10V/3EBLA2qEbcu3te5I7w9OIr6xBtxALQ
 FWHU0msvz/mAh4O2EAffmxDSitq1G6xbt166qcVdQ4NwSupHO1Zyz+BWYzvNjmgPoe
 PYkNWnnjaElmGQ8k7kw+ltjvLWIl5cHMqvp588mVwCcOg0EwlU4KgZkGmMnNk5ajFv
 Jid6cfvOowEXsnhVtedK2hLSkOSV1+EgXWS+MYoHboBAmtDeniic41pw6SYVeu38H+
 5gP5ASTJhJo9nsprlT3V/O/aiJXlz5RWj7ORoVYzByUXSUvxbD+2BJ8W74jAhwkIu9
 v3DYWxWuWRzjw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2A6DDE21EC5; Tue, 30 May 2023 23:40:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168549002416.8773.766514446956426834.git-patchwork-notify@kernel.org>
Date: Tue, 30 May 2023 23:40:24 +0000
References: <20230523061725.650692-1-chao@kernel.org>
In-Reply-To: <20230523061725.650692-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 23 May 2023 14:17:25 +0800 you
 wrote: > butt3rflyh4ck reports a bug as below: > > When a thread always calls
 F2FS_IOC_RESIZE_FS to resize fs, if resize fs is > failed, f2fs kernel thread
 would [...] 
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
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q48x4-006wkQ-PZ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid NULL pointer
 dereference f2fs_write_end_io()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, butterflyhuangxx@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 23 May 2023 14:17:25 +0800 you wrote:
> butt3rflyh4ck reports a bug as below:
> 
> When a thread always calls F2FS_IOC_RESIZE_FS to resize fs, if resize fs is
> failed, f2fs kernel thread would invoke callback function to update f2fs io
> info, it would call  f2fs_write_end_io and may trigger null-ptr-deref in
> NODE_MAPPING.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix to avoid NULL pointer dereference f2fs_write_end_io()
    https://git.kernel.org/jaegeuk/f2fs/c/9318465d0e82

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
