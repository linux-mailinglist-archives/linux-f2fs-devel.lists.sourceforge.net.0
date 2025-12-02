Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B7FC9C8F5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 02 Dec 2025 19:13:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MuIJnfW0//lAlzWRu3ChK3XaRyEg75Vja2MBUqzwag=; b=HRf0GNRdCGqeHjT5NbHC/aVkFR
	7TdHJmWbpnRurgHRNFoNuavEYAXhKOzoMKMLYXOD1LfbAUH2uU8ZDpCHtPR6/ReU3eaZpGFmqAaXI
	YoPxHyulzU7HuSUwaJpqoeGQGzxdAxEuYkILdM9ceKvx19kExJR0R+rzdJDrZpeyD/do=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQUsE-0000zx-Ol;
	Tue, 02 Dec 2025 18:13:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vQUsC-0000zb-9R
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 18:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GMYdKBdVVSf3+ByadrnA2niYzn8SH+S7DL69JiIFoFk=; b=j6lx5kRg1q0Q4lAeIxdBYDgNPh
 /ge4vDcGf4DT8hfeAizj32otZW+V3roq0gK2p4JPU9aFB6AZN9VIBk7SY+dJVPQIQFh46lMeqh9NO
 lRQN0mHzlJRgCFFvhdCEwEdFF3ajwsd6rCbMfsVCEPy3lZc+2rvdYJ/LQLkWfO7yz8Vc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GMYdKBdVVSf3+ByadrnA2niYzn8SH+S7DL69JiIFoFk=; b=gQULGrgFCQK+z93/ICuJ2CItOr
 MLlD5uekDqhaiOIkuToCgcOXKkZWh7vTRk8t88wSf+pYS3HVJ5E+Vtx+AwY1rI49sJRBEiTY3H0lO
 KTwEY5evx29juhcmjlTs+flh8NT2W6pg8FR51ICW8gmYV8zGutIlrtI3DGo3T1RzV344=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQUsC-0005bk-Bv for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 18:13:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 10B7143F77
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Dec 2025 18:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60F1C4CEF1;
 Tue,  2 Dec 2025 18:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764699186;
 bh=mQWAz18YXE6xzH5OPpVxcj1suj9h3uk7lh0eQKmAVYE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CM/2E1pm3JeNMZep2bhRY6Rda24zZTn5/lBxjW0IDGBfK7ADmfRRiblEqZf/MVWhT
 u+Nws43KgogpMiA+PS3wpmw1f/HeqN9AP7FZ5jwUmDZdwnYCNoSogYQBKr5gz9AmFR
 OsMMyk3t5eHPw/clxDkgzgdqRVhDlKRy0AyIYakoLHpqHbxPcey4CGqQRbxSXwX/XK
 SRArTuaNRpyWfi7BzK6ZYWUyEI6P8lnat+Xn6FoMeCcEt19AgnHT9F78atHh1laXWn
 GIlmRbceqEO423A4+mwwRLAdCiUYALg7ILKM2/RCksIQrRKjRehBU4htjs70MkGcWd
 Oj0SqPxCoMH3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 78DE43A54A3A; Tue,  2 Dec 2025 18:10:07 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176469900630.3331097.9220204670598646853.git-patchwork-notify@kernel.org>
Date: Tue, 02 Dec 2025 18:10:06 +0000
References: <20251128092534.1607427-1-chao@kernel.org>
In-Reply-To: <20251128092534.1607427-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 28 Nov 2025 17:25:34 +0800 you
 wrote: > cat /sys/kernel/debug/f2fs/status > > Main area: 17 segs, 17 secs
 17 zones > TYPE blkoff segno secno zoneno dirty_seg full_seg valid_blk >
 - COLD data: [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQUsC-0005bk-Bv
Subject: Re: [f2fs-dev] [PATCH] f2fs: support to show curseg.next_blkoff in
 debugfs
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

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 28 Nov 2025 17:25:34 +0800 you wrote:
> cat /sys/kernel/debug/f2fs/status
> 
> Main area: 17 segs, 17 secs 17 zones
>     TYPE           blkoff    segno    secno   zoneno  dirty_seg   full_seg  valid_blk
>   - COLD   data:        0        4        4        4          0          0          0
>   - WARM   data:        0        7        7        7          0          0          0
>   - HOT    data:        1        5        5        5          2          0        512
>   - Dir   dnode:        3        0        0        0          1          0          2
>   - File  dnode:        0        1        1        1          0          0          0
>   - Indir nodes:        0        2        2        2          0          0          0
>   - Pinned file:        0       -1       -1       -1
>   - ATGC   data:        0       -1       -1       -1
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: support to show curseg.next_blkoff in debugfs
    https://git.kernel.org/jaegeuk/f2fs/c/20f3430406ae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
