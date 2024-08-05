Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EDF9485F6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2024 01:31:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sb7AT-0000Vj-7t;
	Mon, 05 Aug 2024 23:31:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sb7AJ-0000VD-H7
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Aug 2024 23:30:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RzPQloPSDcjyj3p18ji965oiI7wpJ3EFi+S5/iB9wtM=; b=LF56Q8DK/wlpvathNbJnE2xfwY
 1xCwZ3RVIGMMgJRp5461y5HELTmD6g3r3Dm//iPVtcZLZCxKeqrw7zdiPcP8Ue8+53ONJu8KKX1L7
 /B2202r94W2r4I7MGUlH5LKXUEFfDrmvUL5d1HrZhRSPhrdcz7+EdNg4DMQAHeFSVtB0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RzPQloPSDcjyj3p18ji965oiI7wpJ3EFi+S5/iB9wtM=; b=hjaMfY8mLSx1BpxTgPWfbYk5vv
 +jEO3eBtbKLR/uOT3FN4aTPZCfZ3iD0C85iUHSOU9paAjX6vUDfvRw92/J8uxiX/ra2jBSXqazAVa
 YUMpMc2zaiikX2rWOws1HLTHNuVqB8mDu0CK5x69f6AUo9wU0OuahVyLNHwVOTCOZCO4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sb7AH-00059t-Pf for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Aug 2024 23:30:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7177760EB3;
 Mon,  5 Aug 2024 23:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAE35C4AF0F;
 Mon,  5 Aug 2024 23:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722900651;
 bh=X7ausYPDDFnL539kbYS2qwmsnC8TcaLxcrV/4ugzBLU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=O4YTc9sWjimtkICsL+mDWcgVSigSYVDD1C5Pn0COjmh7EraFGynstCs8goqdosuop
 AJ8xLiCvrZTEanpO/C4oen2UDpGR/b8TqbXS3SdzIKqBo+iQ4+I/5RbGoZEZs9W0/5
 oUkLntNV3CEUMzrUpw9IUe9X1WajbQD6TeDzEac2JoQrjg4u0wOT9NQ8X8qS8GjiRg
 OYS7HZK0TGzDmzhPZjP8NjxDjyDNAEw8cTLo/3yckqSQwzHCbX3NGECfBcVyC/oUuN
 PkWpd4eAV+2+9rZnK/2mb9bzsYLjB7mRi9BY7FMF5plRZKbszLFuhmBSqeDkOCVhhV
 drXi3ojhRmfeg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CF486D20AA6; Mon,  5 Aug 2024 23:30:51 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <172290065184.2803.16077457643424916047.git-patchwork-notify@kernel.org>
Date: Mon, 05 Aug 2024 23:30:51 +0000
References: <20240625031351.3586955-1-chao@kernel.org>
In-Reply-To: <20240625031351.3586955-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 25 Jun 2024 11:13:48 +0800 you
 wrote: > Case #1: > SQLite App GC Thread Kworker Shrinker > -
 f2fs_ioc_start_atomic_write
 > > - f2fs_ioc_commit_atomic_write > - f2fs_commit_atomic_write > - fil [...]
 Content analysis details:   (-5.3 points, 6.0 required)
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sb7AH-00059t-Pf
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: atomic: fix to avoid racing w/ GC
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
 daehojeong@google.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 25 Jun 2024 11:13:48 +0800 you wrote:
> Case #1:
> SQLite App		GC Thread		Kworker		Shrinker
> - f2fs_ioc_start_atomic_write
> 
> - f2fs_ioc_commit_atomic_write
>  - f2fs_commit_atomic_write
>   - filemap_write_and_wait_range
>   : write atomic_file's data to cow_inode
> 								echo 3 > drop_caches
> 								to drop atomic_file's
> 								cache.
> 			- f2fs_gc
> 			 - gc_data_segment
> 			  - move_data_page
> 			   - set_page_dirty
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/4] f2fs: atomic: fix to avoid racing w/ GC
    https://git.kernel.org/jaegeuk/f2fs/c/1a0bd289a5db
  - [f2fs-dev,2/4] f2fs: atomic: fix to not allow GC to pollute atomic_file
    https://git.kernel.org/jaegeuk/f2fs/c/7566a155c666
  - [f2fs-dev,3/4] f2fs: atomic: fix to truncate pagecache before on-disk metadata truncation
    (no matching commit)
  - [f2fs-dev,4/4] f2fs: atomic: fix to forbid dio in atomic_file
    https://git.kernel.org/jaegeuk/f2fs/c/374a8881ce4c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
