Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 220606DE1C0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Apr 2023 19:00:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmHM5-0008LW-32;
	Tue, 11 Apr 2023 17:00:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pmHM3-0008L8-4G
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 17:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F2IKzThatDxKaIPPYtkdupSxSWmO19y+aP5HP5MDzFU=; b=iDVEgjBi08qs9KQxiMmFhDjUwo
 +6AM2OHWlIe71d47Fyz7S76I6hR/g/7JeMRhwRCzsrr9XIooVOAbnPfLYu61jIVyoVnmDfvVM7vAs
 ZTs0rRnHs8y6UBNiwx2WIpFWU+2FELpTOVc8tEuTrDhXw0Q2LMHktrPvE4kBasvqQfgE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F2IKzThatDxKaIPPYtkdupSxSWmO19y+aP5HP5MDzFU=; b=ftXUEhxi6cPKFDdOlUuteNFVtn
 90mEi8YXogADd8S9ZKsorZMOAd9QKt5Y0Ec326hU3YgkBMNHZE6nPu8ugYMzEGsbwRXn729hr4PL4
 O6xvdvfG90i9CtG1YU19Po1rD5+MN8e7LaWfGiQ8lHmq7BtNEQCxwF7uYLYQEGklcFQw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmHM2-004G75-GN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 17:00:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 250B4629B0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Apr 2023 17:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11FE9C433A7;
 Tue, 11 Apr 2023 17:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681232420;
 bh=aJirYYVnV507CuqdHFL9yYz35QVzF4kkQPhyKYjmd94=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nk6jCMDRQOZ12KevU/XEk6UfbS8sZsm08gwJLobFPYj9YjVSnWXcNnOXZjoEHGJEo
 qK0AVOX6ShPpnPSHhmME56aQpIDcB62I4ITy0bop9tEMR/oqWU6izNqMktTE1z/XfO
 sc9MhpOoq4UXMph6YyLI7CdGXaYEvof7HP68YWsq1oLG58cD6e12HcPG0t7LVh7XnJ
 YY7zVQUue9d9/Pb9wVFRL51CkR/hXw5Rl2VnE9B2k+CkuPWPK7sk0db5qZMqSz/HR5
 qMFzh1QOOwyUxvO+HepHgei65BbibdSX4RnGjM/imFPA2Qdl8r2c+AiZsbuHrm+pDc
 MCe1THivk+jDw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 DF9BBE52449; Tue, 11 Apr 2023 17:00:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168123241991.4928.7987013426639567312.git-patchwork-notify@kernel.org>
Date: Tue, 11 Apr 2023 17:00:19 +0000
References: <20230410022012.1839127-1-chao@kernel.org>
In-Reply-To: <20230410022012.1839127-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 10 Apr 2023 10:20:12 +0800 you
 wrote: > i_crtime will never change after inode creation, so we don't need
 > to copy it into f2fs_inode_info.i_disk_time[3], and monitor its > change
 to decide w [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmHM2-004G75-GN
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unneeded in-memory i_crtime copy
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

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 10 Apr 2023 10:20:12 +0800 you wrote:
> i_crtime will never change after inode creation, so we don't need
> to copy it into f2fs_inode_info.i_disk_time[3], and monitor its
> change to decide whether updating inode page, remove related stuff.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/f2fs.h  | 5 +----
>  fs/f2fs/inode.c | 1 -
>  2 files changed, 1 insertion(+), 5 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: remove unneeded in-memory i_crtime copy
    https://git.kernel.org/jaegeuk/f2fs/c/c277991d7cf0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
