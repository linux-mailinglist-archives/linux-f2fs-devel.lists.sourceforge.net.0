Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F82AB0072
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 18:30:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwOQSk3EXxgdLGSttXHIEDIPLqH1SXoNhvM8kAXBI5U=; b=mi28J/S/bOuR3aFfagJCAXq5u8
	STkQM6Yk4lKyul+LdI/zRd7orJmwus5ow2bD+QJoeOztzgZL4X4wUBncOsIJpEdWypf5dm2N6zNL0
	CNF329DgBBaSCPdghWRYUT2xjSst2aXnsr4PhuBklg/njgT35BrhlSglYwUfNVFVif6I=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uD48M-0005EZ-6S;
	Thu, 08 May 2025 16:30:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uD48E-0005Df-Aq
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 16:29:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OYmhdkvEJqEH6V1rT99esUnfUbllCovL5w1fWurb10M=; b=N1h+Vf6DQ3cf/C5mwbUYdAJ5in
 2R+yyOnuqZf6Ge/Fk36d5foKREimu+/Yf3Wo19dxudKY/72H0/sGS3pw01r4x4g6oNtP+f2lG2v/A
 iZi4XEYbFVCwkV0wA+qNHnSTdPTUMCA5ehtUH9CX1BBa+BW4Io2Zzb7k4qqchKS+1oJA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OYmhdkvEJqEH6V1rT99esUnfUbllCovL5w1fWurb10M=; b=AwcPAJbeNpgv7fonHWCYhR5srI
 DhRYfCiMmPeQ0f9906A0vwRfT9HID92HFu7840Nlcrgfu9L/mRdOF8VMqoVFsXzZxjOCCDThY+eui
 77SLANyboRnWQsGNzAUg/pjEefaNVc0PncJEDSsuhLWD3S2wZUL0PqKii9VlqxoXdGL4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uD48D-0007ez-JC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 16:29:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DF3B660008;
 Thu,  8 May 2025 16:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9057BC4CEE7;
 Thu,  8 May 2025 16:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746721791;
 bh=c05nwsF/Xsj3ZZ0udY2Gc5dtMsXMs8vJzGIq6HHgV7o=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=GKhuGYf1nw/QHswWp155Zar4n0RUfca1/0d160veT51Bc0tnKmcOitaBDKdMt8k8d
 EXGdTkOugUgON7hRkQLqdFfPhOCWn26q8kBcHVdnMCYphP+Pu1niHNjT5eF28hBG53
 jCpEIXiPLvcp104roIEFnMQ/dtrK/bzzXTweT/s3PkL6mlFmL4uBQ3Ix1ILrDgTdWL
 Ak7eVihTMyLa8OlczX74d3rKdAN/fsL7VHKkzgC9xo+Mc+fUdMATqChBQcrbdwRs5H
 FIlFs6k/IH6gM0JqSXDCNKpholTu6CrRs6b4+PDN07eacUgnAeEu+f21N+gl8CsTOc
 s7IBciTEmxKnw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7118D380AA70; Thu,  8 May 2025 16:30:31 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174672183025.2971823.13421016836031371111.git-patchwork-notify@kernel.org>
Date: Thu, 08 May 2025 16:30:30 +0000
References: <20250508051520.4169795-2-hch@lst.de>
In-Reply-To: <20250508051520.4169795-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 8 May 2025 07:14:27 +0200 you wrote:
 > From: Chao Yu <chao@kernel.org> > > If __write_node_folio() failed, it
 will return AOP_WRITEPAGE_ACTIVATE, > the incorrect return value may be passed
 to [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uD48D-0007ez-JC
Subject: Re: [f2fs-dev] [PATCH 1/6] f2fs: fix to return correct error number
 in f2fs_sync_node_pages()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu,  8 May 2025 07:14:27 +0200 you wrote:
> From: Chao Yu <chao@kernel.org>
> 
> If __write_node_folio() failed, it will return AOP_WRITEPAGE_ACTIVATE,
> the incorrect return value may be passed to userspace in below path,
> fix it.
> 
> - sync_filesystem
>  - sync_fs
>   - f2fs_issue_checkpoint
>    - block_operations
>     - f2fs_sync_node_pages
>      - __write_node_folio
>      : return AOP_WRITEPAGE_ACTIVATE
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/6] f2fs: fix to return correct error number in f2fs_sync_node_pages()
    https://git.kernel.org/jaegeuk/f2fs/c/43ba56a043b1
  - [f2fs-dev,2/6] f2fs: return bool from __f2fs_write_meta_folio
    https://git.kernel.org/jaegeuk/f2fs/c/39122e454419
  - [f2fs-dev,3/6] f2fs: remove wbc->for_reclaim handling
    https://git.kernel.org/jaegeuk/f2fs/c/402dd9f02ce4
  - [f2fs-dev,4/6] f2fs: always unlock the page in f2fs_write_single_data_page
    https://git.kernel.org/jaegeuk/f2fs/c/84c5d16711a3
  - [f2fs-dev,5/6] f2fs: simplify return value handling in f2fs_fsync_node_pages
    https://git.kernel.org/jaegeuk/f2fs/c/0638f28b3062
  - [f2fs-dev,6/6] f2fs: return bool from __write_node_folio
    https://git.kernel.org/jaegeuk/f2fs/c/80f31d2a7e5f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
