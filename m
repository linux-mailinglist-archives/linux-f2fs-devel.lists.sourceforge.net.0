Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F590AB0071
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 18:30:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzRYesK+qBJnXWOyuvB5jBnpJa8V69j0pll0NfEiPkk=; b=T8ftlwQoSuB01W43GHASM2+iar
	sD52aUrZKFCxYVsQZUD8es14q38bw970IYammrsy/ZFE18UiTSTfa8RZ7Tbe1pwg3RmLfxlPelfNS
	wO9ygP9OQHWXmeWG9Y8W+ufVN54oKCAHYJhOdqUleie490+4PzYMv/NkTsQzvKNBBLAU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uD48P-0005CZ-6x;
	Thu, 08 May 2025 16:30:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uD48N-0005CN-Sm
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 16:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=whHncxzvrTSWU5FfGMzNI/LXG4ld3bzbNRgx1qtQmNc=; b=OhtM0piG9d9CBecjm73j9V1+J3
 96OhhLhbqtaRIPtSaPeThz4epWRAfRVe3r7W7P877Tem+5auAzCCiZL653WD+jZx++dUc4gixFF0r
 pL2jJwYC48dBvnRSx3K7BJSiN9W0dt27Wprp9V4vZ6/V82zoMOu29m6IZJCRSfUzW2zw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=whHncxzvrTSWU5FfGMzNI/LXG4ld3bzbNRgx1qtQmNc=; b=K5oSXCKihSR+jVFe4pz8671uIW
 Tw3VtZxTotDD0yG9IH2pzk5+kd9oxwi0jZsjSzhjGX9I/PIKLrR+n479/eA5YJgtJs4zpR7PUz/kY
 3Loxnz48PRqtU6xWeudriCwmY8CBAMJgmdyKAeNglS6Bb+1IViNtMiqEEq0Gb9JG6EHc=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uD48N-0007fs-5Z for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 16:30:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 717E8A4DFA7;
 Thu,  8 May 2025 16:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E446C4CEE7;
 Thu,  8 May 2025 16:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746721796;
 bh=emnJpzLvbQJrpPs3WoUmBKPR9xHTU7DnXmw4yOQRzLI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tU+rjwtk17GU2wRRyE/SFme6MQYTwywF9tNYFSPdYwEtrmfYdmVRFir3yozKw9hDT
 LLsYip1ZNfh0d9Flxat3o7ppXslLx7LJ0Vo6ux48bJa71fh8xQmdp+ZgaQA5XdOVea
 mxwjJPZnnk8ZqNdpCaBy+se/VgtMMa6ToG5qiIUlb1BEmzEGgmeG7OGEqYMq1gV6bH
 99N92c8ghBRYZPAMLIzKdE4Hn2i+Oey2pv7RpNj30MZQ3Y45cYXru2MvQNlfq0tZne
 zjgZFST/5saA4SC4dMQkRxJp58ecGg6loX1xOqURBtKin2ArpaZIPcCPExWYrbaDfU
 VF0LoWmACrF4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAFDD380AA70; Thu,  8 May 2025 16:30:35 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174672183439.2971823.3514035495469424112.git-patchwork-notify@kernel.org>
Date: Thu, 08 May 2025 16:30:34 +0000
References: <20250505092613.3451524-2-hch@lst.de>
In-Reply-To: <20250505092613.3451524-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 5 May 2025 11:25:58 +0200 you wrote:
 > __f2fs_write_meta_folio can only return 0 or AOP_WRITEPAGE_ACTIVATE. >
 As part of phasing out AOP_WRITEPAGE_ACTIVATE,
 switch to a bool return > instead. [...] 
 Content analysis details:   (-3.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uD48N-0007fs-5Z
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: return bool from
 __f2fs_write_meta_folio
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

On Mon,  5 May 2025 11:25:58 +0200 you wrote:
> __f2fs_write_meta_folio can only return 0 or AOP_WRITEPAGE_ACTIVATE.
> As part of phasing out AOP_WRITEPAGE_ACTIVATE, switch to a bool return
> instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/f2fs/checkpoint.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/4] f2fs: return bool from __f2fs_write_meta_folio
    https://git.kernel.org/jaegeuk/f2fs/c/39122e454419
  - [f2fs-dev,2/4] f2fs: don't return AOP_WRITEPAGE_ACTIVATE from f2fs_write_single_data_page
    (no matching commit)
  - [f2fs-dev,3/4] f2fs: simplify return value handling in f2fs_fsync_node_pages
    (no matching commit)
  - [f2fs-dev,4/4] f2f2: return bool from __write_node_folio
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
