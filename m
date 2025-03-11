Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FCCA5CFE9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Mar 2025 20:50:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ts5cI-0005Js-ED;
	Tue, 11 Mar 2025 19:50:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1ts5cH-0005Ji-6P
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 19:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZwBp+WDmjys6+amNjEyXiC4NP0WUenqBKLUUFg21xYk=; b=QhsyQ7GSNANmlULn6IA80QDUwe
 E/e3xcPd81HMgEle5YT1b9aKe/Z2zbz86dQRrk5I+DblqJcIVheER9I5tb5Bb5bpj+EC9W/rjTGxb
 efT2KHNNeYOVPTUeM7Y05MDbmvFG4Rf/FVB1jFWyFRZTqt7/8Bo0DV9SAevDVjFM1vGI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZwBp+WDmjys6+amNjEyXiC4NP0WUenqBKLUUFg21xYk=; b=OXNipOeMG6O+0U5BFD2DZVxE29
 Z8z5nKKngpzMmeLb31TNtTOVRJU410Zyap2Twb3vdVIHdRKuaTaPdqWJDemh8HOKvdDo+cEl1+bNT
 WKI3atjB2QlXdktrqMee0AWN8LAtPIhDmZKDSkDpPTOTFF176R/uVMnRMqw3DB0LDwx8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ts5c7-0002iQ-Ry for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 19:50:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 23253A464A9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Mar 2025 19:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FB9C4CEE9;
 Tue, 11 Mar 2025 19:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741722601;
 bh=zhU+YAurbMexCiQ10t2HtbZUnnw8b93XeIzc9Zk2DCU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=qd5FpiOZHOYsrt025Vohs7QvIlnKFX5vbbkQzrZVhxgZ76+GjIORlYzcBdoVQOtqm
 iDdvlGKAGbe+r8fEU7NvKXYKfQynMIPCREQZQC+TLw/K+VjVVWJd1T6RW9IDSQANv9
 PAMjUDe6k3EZS5vA4RbyaEy1zjf6aDJ9QW45KNcAwOiStcPtkzsQyLN2e97PG0PtgJ
 Al3TPoAtAzUbhxcic032SUVuIWHbZqrAemy5eDTMlh8gLpPfj33xuVHHDXw3qwKgfi
 Jwq62Bx96+P7cWBzApcMUnSdN0ONJGm/itFuejO0p89upjZTHHoSwI9b0M+L9HEbiw
 5TAUheZUIta7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 348BD380AC1C; Tue, 11 Mar 2025 19:50:37 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174172263600.214029.2439800128963864972.git-patchwork-notify@kernel.org>
Date: Tue, 11 Mar 2025 19:50:36 +0000
References: <20250305091148.2086015-1-chao@kernel.org>
In-Reply-To: <20250305091148.2086015-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 5 Mar 2025 17:11:46 +0800 you wrote:
 > This patch introduces a new wrapper f2fs_get_inode_page(), then, caller
 > can use it to load inode block to page cache, meanwhile it will do sanity
 > che [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ts5c7-0002iQ-Ry
Subject: Re: [f2fs-dev] [PATCH v2 1/3] f2fs: do sanity check on inode footer
 in f2fs_get_inode_page()
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

On Wed,  5 Mar 2025 17:11:46 +0800 you wrote:
> This patch introduces a new wrapper f2fs_get_inode_page(), then, caller
> can use it to load inode block to page cache, meanwhile it will do sanity
> check on inode footer.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - fix node_type in f2fs_get_inode_folio()
>  fs/f2fs/data.c   |  6 ++---
>  fs/f2fs/dir.c    |  2 +-
>  fs/f2fs/f2fs.h   |  3 ++-
>  fs/f2fs/file.c   |  2 +-
>  fs/f2fs/inline.c | 22 +++++++++----------
>  fs/f2fs/inode.c  |  4 ++--
>  fs/f2fs/node.c   | 57 +++++++++++++++++++++++++++++++++---------------
>  fs/f2fs/node.h   |  6 +++++
>  fs/f2fs/xattr.c  |  4 ++--
>  9 files changed, 67 insertions(+), 39 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v2,1/3] f2fs: do sanity check on inode footer in f2fs_get_inode_page()
    https://git.kernel.org/jaegeuk/f2fs/c/1cf6b5670af1
  - [f2fs-dev,v2,2/3] f2fs: do sanity check on xattr node footer in f2fs_get_xnode_page()
    https://git.kernel.org/jaegeuk/f2fs/c/2aac2538a97d
  - [f2fs-dev,v2,3/3] f2fs: introduce FAULT_INCONSISTENT_FOOTER
    https://git.kernel.org/jaegeuk/f2fs/c/1788971e0bfa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
