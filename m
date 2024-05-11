Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0128C2E14
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 May 2024 02:50:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5aws-00059Y-TT;
	Sat, 11 May 2024 00:50:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1s5awr-000596-G3
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GWQuZzuyV6WTCS0jNx+Yq1enbrY3Sq7EateBQZZG5kY=; b=bq864/cLqMLy9wg3DaMF3rMaVu
 CQ2lTUj7J05+n80vbExUrvmwnuPj5HCwX3mDDDMKo7A696f2D3ZnYmruwEM+fClT8CKAjejAq9Y5g
 pk4dyBftWf+0zMJTA7YXwJhZO/EwWHRRlZ3LV0Mzd3STm2phvpfq7wbPhMyOHdE6P+vY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GWQuZzuyV6WTCS0jNx+Yq1enbrY3Sq7EateBQZZG5kY=; b=Zz8gJsX36p/MjLtqMaAI51WIrq
 OMhZ4mYP3ccrhlaV7QPG5alH/IDHIwmoPqW0xNr9a1wkC7RBGEHlBTKCU1W2leFzVLz4QSsgleXra
 ax+e4ObiJC5PiKQYH7J1GrpyLU7oNOwwq+4KFIHTIZWlBK4OLUiyWsiXA8GMy4/EGhZ8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s5awr-0004ze-Uj for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6AD23CE1F40
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 May 2024 00:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DB18C4DDE8;
 Sat, 11 May 2024 00:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715388634;
 bh=7+8lbIyUYwurNknKC/k7UJyRmT+SDoPbDodvcJKpVIg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=gL01o3whIHfyxjv1QztCCV3oNfoXLA9NFcWyXN6pEG0pauWrOApIiwDyHU79QlX0i
 qm9fSOsNU3lmB/FuFpsh7Ei7rhby92LiNUkx4Dz5zg/DxWd5ceTtNzhrbVXAsbeb6/
 A2KdtePislDGBftnBgfMzQaGJRHIaE2vCa1iC1aQ9AfCQSlqdq5+T0V/RVRZuSS5Sr
 Ir0jQyIT5vAMeMjoEOb5yqcDX67wiOICPuJFK5yvR8BqQE7w5IjhPV90iUzo13UZAZ
 6mj/vRLneTM9b1PrxhM7PrCsgQz9FDhzDfAxyb28GfGJPo1MYtOTkqJhVMoF89u/Qa
 ELfH1YThSLOaw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 336EAC54BA1; Sat, 11 May 2024 00:50:34 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171538863420.11229.14176789629360065013.git-patchwork-notify@kernel.org>
Date: Sat, 11 May 2024 00:50:34 +0000
References: <20240510033339.300331-1-chao@kernel.org>
In-Reply-To: <20240510033339.300331-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 10 May 2024 11:33:39 +0800 you
 wrote: > f2fs image may be corrupted after below testcase: > - mkfs.f2fs -O
 extra_attr,compression -f /dev/vdb > - mount /dev/vdb /mnt/f2fs > - touch
 /mnt/f2fs/f [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s5awr-0004ze-Uj
Subject: Re: [f2fs-dev] [PATCH v3 5/5] f2fs: compress: don't allow unaligned
 truncation on released compress inode
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

On Fri, 10 May 2024 11:33:39 +0800 you wrote:
> f2fs image may be corrupted after below testcase:
> - mkfs.f2fs -O extra_attr,compression -f /dev/vdb
> - mount /dev/vdb /mnt/f2fs
> - touch /mnt/f2fs/file
> - f2fs_io setflags compression /mnt/f2fs/file
> - dd if=/dev/zero of=/mnt/f2fs/file bs=4k count=4
> - f2fs_io release_cblocks /mnt/f2fs/file
> - truncate -s 8192 /mnt/f2fs/file
> - umount /mnt/f2fs
> - fsck.f2fs /dev/vdb
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,5/5] f2fs: compress: don't allow unaligned truncation on released compress inode
    https://git.kernel.org/jaegeuk/f2fs/c/29ed2b5dd521

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
