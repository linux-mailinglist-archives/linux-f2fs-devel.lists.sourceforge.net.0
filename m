Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 018B07A88ED
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Sep 2023 17:50:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qizTF-0001Nh-Pl;
	Wed, 20 Sep 2023 15:50:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qizTE-0001NZ-VX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 15:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D1gqVz3/9A+uO8G9sxzbgA1mNhvBB28PNuYZoyZ9gp0=; b=XISdynsqEnv1tVNHokej+VyhYq
 Vu1GPInj701cuKin+rFrkJ7cVR5qpgQTnywztjihSyOuWVYyY+WemFQlPRP0+6NshrmT1DYiZfhrN
 oSp13tPdiacDa1vKoUgYvHgBt2Dm2SA1+CLxybPH+dHPhSu3ugFL9r8S+o80x4UeGR/0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D1gqVz3/9A+uO8G9sxzbgA1mNhvBB28PNuYZoyZ9gp0=; b=eFz7J+g7H05W5A9BJC+y2XvwM7
 OC3x2APratt1Mv/0LxdURZkKuvKklgChhdaZneq/rFlwwugvEFRBMflHHT7YaWoDB2mV6ChZv2hgR
 zjfQKt8mO0SIkeSD9xyptFUHlNFoue/yk5WsU5RWK9BqtEbOE5nbIn8WhG0RqBg7PB3s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qizTD-00GvPn-9c for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 15:50:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE8F261CFE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Sep 2023 15:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53AC4C433CA;
 Wed, 20 Sep 2023 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695225025;
 bh=i6ZrC8twPkdmMTcCFAxDTNOGE1x2JCRDQFyKX/X5q/A=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DtHyO333m9sIjpXf28lydAgurEtbjB6KBsVg7OM41DNBwDs7dTY/UjnAXyMBELbdl
 EfpCAqWaF9nB/QsXDKnjYDfSN1EU1VosrluDn/gzDCb6xiySodlt9mnRlH7q6+S799
 kYdP7M8UwqEX1SYZs5xpa9OkBmhAw4c+pPHxQD/nQupvrCtFZWssZs349VKf2oooqF
 rPh9juQJ+UtRG8SljZUdxEUu2wlpGe591a8/S5iqM+JLvRRGN3ek/FWIIDTJh3YaCz
 nwuZN0535iHQp4l9EppFOZaF9IhfpQvpKUMy2SRfRMOs44vLB6KLeJPtStqDwwwHJ9
 RDxxQpr/cBJcg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2F853C40C5E; Wed, 20 Sep 2023 15:50:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169522502519.22557.11952566114540568403.git-patchwork-notify@kernel.org>
Date: Wed, 20 Sep 2023 15:50:25 +0000
References: <20230828140417.2951796-1-chao@kernel.org>
In-Reply-To: <20230828140417.2951796-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 28 Aug 2023 22:04:14 +0800 you
 wrote: > With below mount option and testcase, it hangs kernel. > > 1. mount
 -t f2fs -o compress_log_size=5 /dev/vdb /mnt/f2fs > 2. touch /mnt/f2fs/file
 > 3. cha [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qizTD-00GvPn-9c
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: compress: fix deadloop in
 f2fs_write_cache_pages()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 28 Aug 2023 22:04:14 +0800 you wrote:
> With below mount option and testcase, it hangs kernel.
> 
> 1. mount -t f2fs -o compress_log_size=5 /dev/vdb /mnt/f2fs
> 2. touch /mnt/f2fs/file
> 3. chattr +c /mnt/f2fs/file
> 4. dd if=/dev/zero of=/mnt/f2fs/file bs=1MB count=1
> 5. sync
> 6. dd if=/dev/zero of=/mnt/f2fs/file bs=111 count=11 conv=notrunc
> 7. sync
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/4] f2fs: compress: fix deadloop in f2fs_write_cache_pages()
    https://git.kernel.org/jaegeuk/f2fs/c/c5d3f9b7649a
  - [f2fs-dev,2/4] f2fs: compress: fix to avoid use-after-free on dic
    https://git.kernel.org/jaegeuk/f2fs/c/b0327c84e91a
  - [f2fs-dev,3/4] f2fs: compress: do sanity check on cluster when CONFIG_F2FS_CHECK_FS is on
    https://git.kernel.org/jaegeuk/f2fs/c/2aaea533bf06
  - [f2fs-dev,4/4] f2fs: compress: fix to avoid redundant compress extension
    https://git.kernel.org/jaegeuk/f2fs/c/7e1b150fece0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
