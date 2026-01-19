Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B0AD3AACC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 14:54:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIvRX7IQJ1iLeMfEaWEpNn74D1Hbx5zdAIUxyqMmNnA=; b=bH4wOzbxFvqSvucnXeP8hFPFBa
	k0T5A1trT5ZmQa8g/zdQKsPWEacYUuiMcrIMXLA7TzMca1vFFlnape6/YzZL2V2oTDo6zdb29Qomu
	W+6K7D26MFtEzKwvL2rineHJEZFFQ2+s9s5X3A7gm5mtvoLNi+B3UlzWJzHBy+Zw6vjI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhpiC-0004cB-CW;
	Mon, 19 Jan 2026 13:54:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vhpiB-0004bs-GE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 13:54:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tt6dcvloWEjwPsvdVN7w1qbDxgEt+M9s98nrZsV4U5I=; b=hp+qmfXWIAb9/dS6x5bHBFZ32g
 bZMd1I3YSfWiYUNw163A35hB4EMJ11Pf/qywpU883F89NrQVt8n8QLxAlKY50arZizqds1SHSkKoc
 ebtq2zSzMlDLlvUJYPO+mdxMWIyQJRh8EK/au0+HEP5JeQj8UoRFRDT22NDtkzgIzWp4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tt6dcvloWEjwPsvdVN7w1qbDxgEt+M9s98nrZsV4U5I=; b=ibV9VQU402AKZ/buOeFZFd2X+j
 MoAvUMWYKpMW1b9jzEHCRQglFZ8ewd1KzQwb8wROo17HFuLenhBFJV8KmAYZqHz/1UuqmiycII7So
 e2Q2bMtnUatBmhfZJbLPsjqGxFU44PHedIoSur7VPT7DcWamoQNhxmRF1FCZOMcC0Tus=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhpiA-0005rG-NY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 13:54:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0369D60140
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Jan 2026 13:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD551C116C6;
 Mon, 19 Jan 2026 13:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768830859;
 bh=kIiV1cpOSAVYFXN98zr3kJCPzJ94ghSMEoN307bP05s=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=rvSzXPCPcYmCF8tm+y+ffFj+fojra7yqw+SpL1IjOcCtQdgZ0MqKIczvib6rPDJbs
 QHFkiZFNL6sBKm2RWvDtR3tCWJvNZ1LHjsEd8Rx0xJlcQwaqyxDRUkI/eFWwojYnVX
 PdBdNiscO9arhl8tMmYEgJ1d/qoneEtXNgciZnzak6jD84dW9i+scteV7AHbwC8hJ6
 DAjdrqB1UneqLPPKjeRoxks2N+ZCFEev3A2xECsUiiwvOewoiINWqZ7Z7uoU6YgT1V
 SLSXLXEUf9H1aryxrdFdjtFod+mzqNfoL4YVJHb8urArAJ99ZVOF4mokdsUatAn+S2
 tbWnMN47ZRjIA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B5EE53A54A38; Mon, 19 Jan 2026 13:50:50 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176883064952.1419958.10222160142034612724.git-patchwork-notify@kernel.org>
Date: Mon, 19 Jan 2026 13:50:49 +0000
References: <20260112074917.40107-1-chao@kernel.org>
In-Reply-To: <20260112074917.40107-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 12 Jan 2026 15:49:15 +0800 you
 wrote: > Add node footer sanity check during node folio's writeback, if sanity
 > check fails, let's shutdown filesystem to avoid looping to redirty > and
 writeba [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhpiA-0005rG-NY
Subject: Re: [f2fs-dev] [PATCH v5 1/3] f2fs: fix to do sanity check on node
 footer in __write_node_folio()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 12 Jan 2026 15:49:15 +0800 you wrote:
> Add node footer sanity check during node folio's writeback, if sanity
> check fails, let's shutdown filesystem to avoid looping to redirty
> and writeback in .writepages.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v5:
> - split original [patch 1/2] to two, in this patch, just use
> sanity_check_node_footer() to do sanity check during writeback.
>  fs/f2fs/node.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev,v5,1/3] f2fs: fix to do sanity check on node footer in __write_node_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/0a736109c9d2
  - [f2fs-dev,v5,2/3] f2fs: fix to do sanity check on node footer in {read, write}_end_io
    (no matching commit)
  - [f2fs-dev,v5,3/3] f2fs: detect more inconsistent cases in sanity_check_node_footer()
    https://git.kernel.org/jaegeuk/f2fs/c/93ffb6c28ff1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
