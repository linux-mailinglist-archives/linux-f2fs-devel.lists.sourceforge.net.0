Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D998C2E1D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 May 2024 02:50:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5awx-0006St-A3;
	Sat, 11 May 2024 00:50:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1s5aww-0006Sj-BI
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GThXhubQwXz60cNslvTBhJ9fV0EyveFXoD+Mv4DeYUg=; b=exA0UOWuTgWhpCXoqErsKEJFg2
 Tg5ri17dGqQiZAVJVGp82s3jKTGKM54/GG0USgxEzr9aoQSzoAAlN4DL60MGit39WeJ26NOd4axPm
 kooXIkk3VEiQ4aFdZzvAit/IEXnUnx6C/0beUrbrIhXbDUIKAzfPSzEvuGU1U1Z1quAk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GThXhubQwXz60cNslvTBhJ9fV0EyveFXoD+Mv4DeYUg=; b=SnfB2xFff8sB02FTrKGhi5zmxw
 ZAtea2p9SX6R490LmQemEUnKkpYqwNmkf/G2mBL9pvRYimyFcAurcALIZx1GmFqE4EttZUia8qAod
 dABRiDED5fcqv4s/ODZM6wwcszHYd6DXOIpu4mDMJnmcvKGCf1CY9aLDACy9ToQPKfeQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s5aww-00050j-KV for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 45B70CE1F38
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 May 2024 00:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1E87C4AF0F;
 Sat, 11 May 2024 00:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715388634;
 bh=Lm9UgoQ0EqF9fJAh2wacDF88Osv1XpcxXCrzsm+J6/U=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BnoE+l9xyxXgcfa24Y4kVBpFJHKqH3v8qaEBFeylWyz2Y6fbwJTVTG9PJ90JwQzHQ
 urNJyNTn6bEO4tDXR1LA5/XcwLGR39FDu8TxqriOhmguGqVn3ltv1EVs8w5vkVSVbb
 aSeO6OQGlEJ+oeLoTG8QvvLtrBawVzRa7PpxRAuGQAev4FL2nf6DeD9xahmxJUViNY
 VMei5Qxab/f5aM2u+OJFvEwe7daVR2KG0wdX0QjqiPXGB/qN7vZrJAdT2p5l68laVH
 egPfiqvQNtes4ovSXJmELIjdbruzLIpUnBVBtpo9zKU485d+XrTJBN9D/R4fjH61ix
 eJtGd2+CWNFOQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D67DCC54BA3; Sat, 11 May 2024 00:50:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171538863387.11229.8284477395784483205.git-patchwork-notify@kernel.org>
Date: Sat, 11 May 2024 00:50:33 +0000
References: <20240506103313.773503-1-chao@kernel.org>
In-Reply-To: <20240506103313.773503-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 6 May 2024 18:33:11 +0800 you wrote:
 > It missed to call dec_valid_node_count() to release node block count >
 in error path,
 fix it. > > Fixes: 141170b759e0 ("f2fs: fix to avoid use f2fs_bug_o
 [...] Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s5aww-00050j-KV
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: fix to release node block count in
 error path of f2fs_new_node_page()
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

On Mon,  6 May 2024 18:33:11 +0800 you wrote:
> It missed to call dec_valid_node_count() to release node block count
> in error path, fix it.
> 
> Fixes: 141170b759e0 ("f2fs: fix to avoid use f2fs_bug_on() in f2fs_new_node_page()")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/node.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/3] f2fs: fix to release node block count in error path of f2fs_new_node_page()
    (no matching commit)
  - [f2fs-dev,2/3] f2fs: fix to add missing iput() in gc_data_segment()
    https://git.kernel.org/jaegeuk/f2fs/c/a798ff17cd2d
  - [f2fs-dev,3/3] f2fs: fix to do sanity check on i_nid for inline_data inode
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
