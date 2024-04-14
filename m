Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 896798A436D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Apr 2024 17:33:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rw1qv-0005bc-6a;
	Sun, 14 Apr 2024 15:33:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rw1qt-0005b4-EN
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3URD8JR9p2nS8A8tapBKnd3iyNNQhbQqXuLD++zFcPQ=; b=FNXJfGOzo6PAH0cg722rnUiugf
 +oP4uSd1BLScc4DGBV0TGAdJ1rKdK69vd2fsk230DhjiGloEcnCY/JxuXWBKuIF6KAaYtoun+eCbN
 gfFmnKUOIeelB0PhJmx/M4HMu1R9M2KlIoFDlBytJ+BdgxMH9sMBis26EBIl9QQ3/mEk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3URD8JR9p2nS8A8tapBKnd3iyNNQhbQqXuLD++zFcPQ=; b=VKyfHDOWc9nLhzYFXRWN3eIMgW
 p+RNR76nvFet430FTdHVXkZdK28xOF5r64bTrTWCtwUJ5Fb7bjnUZ3I7/5tk/1upb3INtPM0y/b0G
 jPoZTUwaHp9n0nXd4JTeHVUWgm18Ekzj7mguPHwHrYkXdLNpRhDA8Nj6felWNSyBir40=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rw1qs-0003YG-LJ for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:33:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7834060B76;
 Sun, 14 Apr 2024 15:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CB0DC4AF48;
 Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713108765;
 bh=i/6QaGlaCv3KFEh/epsSeKYK/O3DnO3Wl/IJ5qbHsyc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Ixgj0WG45U1svFl8JkYJldy00Yr3jGm4ICxlZaHKYAPFAK8QdLG/Z9Ek/DDKeeyHx
 8Q3cVy/GCpQ5Opzzm3chRA2dz+TeM3wurH6UCJ/+rTLh08ZKj5aFL4jZfp7ltUHqEo
 WuUHRj/Oqo7kdIJfChoORNWova6fCGdxvrVQZSA7ZW2wWq8YDuM1GFFsVaDWtFQUmR
 FyxkJM7aYPHc/QHNME84O0yY3fwR126GSHnv8VEe2n2p/JGmlXonPgcpZIwxi0pNt3
 EeioKlYynraWGKtiofBTEtgfDgHZCffRl1OKiJC0FCcPQXiM4a9Dq8aSyLIhnJs/rj
 TH6sYjCyeNi0Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 731D3C54BD1; Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171310876546.3156.9489013504825208651.git-patchwork-notify@kernel.org>
Date: Sun, 14 Apr 2024 15:32:45 +0000
References: <20240327074223.2216487-1-chao@kernel.org>
In-Reply-To: <20240327074223.2216487-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 27 Mar 2024 15:42:23 +0800 you
 wrote: > As reported by Yi Zhang in mailing list [1],
 kernel warning was catched
 > during zbd/010 test as below: > > ./check zbd/010 > zbd/010 (test gap zone
 sup [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: gitlab.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rw1qs-0003YG-LJ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: multidev: fix to recognize valid
 zero block address
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
Cc: shinichiro.kawasaki@wdc.com, jaegeuk@kernel.org, yi.zhang@redhat.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 27 Mar 2024 15:42:23 +0800 you wrote:
> As reported by Yi Zhang in mailing list [1], kernel warning was catched
> during zbd/010 test as below:
> 
> ./check zbd/010
> zbd/010 (test gap zone support with F2FS)                    [failed]
>     runtime    ...  3.752s
>     something found in dmesg:
>     [ 4378.146781] run blktests zbd/010 at 2024-02-18 11:31:13
>     [ 4378.192349] null_blk: module loaded
>     [ 4378.209860] null_blk: disk nullb0 created
>     [ 4378.413285] scsi_debug:sdebug_driver_probe: scsi_debug: trim
> poll_queues to 0. poll_q/nr_hw = (0/1)
>     [ 4378.422334] scsi host15: scsi_debug: version 0191 [20210520]
>                      dev_size_mb=1024, opts=0x0, submit_queues=1, statistics=0
>     [ 4378.434922] scsi 15:0:0:0: Direct-Access-ZBC Linux
> scsi_debug       0191 PQ: 0 ANSI: 7
>     [ 4378.443343] scsi 15:0:0:0: Power-on or device reset occurred
>     [ 4378.449371] sd 15:0:0:0: Attached scsi generic sg5 type 20
>     [ 4378.449418] sd 15:0:0:0: [sdf] Host-managed zoned block device
>     ...
>     (See '/mnt/tests/gitlab.com/api/v4/projects/19168116/repository/archive.zip/storage/blktests/blk/blktests/results/nodev/zbd/010.dmesg'
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: multidev: fix to recognize valid zero block address
    https://git.kernel.org/jaegeuk/f2fs/c/33e62cd7b4c2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
