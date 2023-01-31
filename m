Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C059683622
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 20:10:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMw1b-0004DG-RR;
	Tue, 31 Jan 2023 19:10:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pMw1Y-0004Cz-UX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 19:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fdoLzBRPU98EserBGwRs0H94pL32OF3aBSHEnLljmYQ=; b=Cmq4Mwqe1QmTNNnnIlCkVaMWuZ
 2o5ufUwtyLQgV3YEqdGNwJZHc3XIIyNTCQm61Qm2SPqsYGyrhkh2W+MYafgxNYvFEoS/J1rvFT/Vh
 0txR4SBm9BVdLFRL5fhcv/vSXB+Xdaer7+EvXAocllZun4r1Hgu9JGnrv6F32mFP/Enk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fdoLzBRPU98EserBGwRs0H94pL32OF3aBSHEnLljmYQ=; b=afRUJ+Y4TguHIg2m+93F+1LHqg
 rd4TF20+B87mZgKPN4JNEkfdqG9trS99jkKK0AHHY23OJwQdIcEYK2p7rEa4UMSqpIu7FRamZFqoe
 rO42TcmqXmXvOZDIDGbXqm/TOHy33qtj6FE43w18MgXz6UA2bfScZpdtaW64h44qHoo4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMw1T-005sYx-RT for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 19:10:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8A435B81E6A;
 Tue, 31 Jan 2023 19:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EFDBC433EF;
 Tue, 31 Jan 2023 19:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675192220;
 bh=QgFOgXERNFxNM+2Q3JoMcsDg9vr2WS4VMxEOSjNbW6M=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=fQ6IIekeEi0/75UY0mAIlPOvj8qPVDYo1BhnsxBZx5DKAvo6iL0Oy/P2qMGTeUpVi
 pPx+C8KAVjbkHJUY4ypOSUBFgyiWzMGqi+bFsTX+xRFndq3gbdb7wPQcgF1yxdzwSt
 KgSHOHkMk5A0XiTFNWV9zl1FLwNd+LstqFEJxLTpicEMgeSupDxB7Df+kDImHwFn4b
 GDr7BfdsyPT5/iM8MVICrlhjbODxYsiCxdTgql1Ve/JeR5/I4qVsO3Da42JfRtvqFG
 4SgwnG0WNfz3MNYkndPTgXdldfgP3y17RIcFaedkN6NejU9POt5W4DIpngvG0W26Ow
 y+F94O95e1Jyg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0474EC4314C; Tue, 31 Jan 2023 19:10:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167519222001.20142.1808718951493834107.git-patchwork-notify@kernel.org>
Date: Tue, 31 Jan 2023 19:10:20 +0000
References: <20230119063625.466485-2-hch@lst.de>
In-Reply-To: <20230119063625.466485-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 19 Jan 2023 07:36:18 +0100 you
 wrote: > This function just assigns a summary entry. This can be done entirely
 > typesafe with an open code struct assignment that relies on array >
 indexing. > [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMw1T-005sYx-RT
Subject: Re: [f2fs-dev] [PATCH 1/8] f2fs: remove __add_sum_entry
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 19 Jan 2023 07:36:18 +0100 you wrote:
> This function just assigns a summary entry.  This can be done entirely
> typesafe with an open code struct assignment that relies on array
> indexing.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/f2fs/segment.c | 23 ++---------------------
>  1 file changed, 2 insertions(+), 21 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/8] f2fs: remove __add_sum_entry
    https://git.kernel.org/jaegeuk/f2fs/c/2163a691c5f3
  - [f2fs-dev,2/8] f2fs: simplify do_checkpoint
    https://git.kernel.org/jaegeuk/f2fs/c/bc6cc6f92b89
  - [f2fs-dev,3/8] f2fs: add a f2fs_curseg_valid_blocks helper
    https://git.kernel.org/jaegeuk/f2fs/c/0034f8954469
  - [f2fs-dev,4/8] f2fs: factor the read/write tracing logic into a helper
    (no matching commit)
  - [f2fs-dev,5/8] f2fs: refactor __allocate_new_segment
    https://git.kernel.org/jaegeuk/f2fs/c/53577f7c5b8b
  - [f2fs-dev,6/8] f2fs: remove __allocate_new_section
    https://git.kernel.org/jaegeuk/f2fs/c/b2164fbdb8f8
  - [f2fs-dev,7/8] f2fs: refactor next blk selection
    https://git.kernel.org/jaegeuk/f2fs/c/33234f9705d8
  - [f2fs-dev,8/8] f2fs: remove __has_curseg_space
    https://git.kernel.org/jaegeuk/f2fs/c/b8574d8c47eb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
