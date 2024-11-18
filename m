Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B189D16A7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2024 18:01:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tD57g-0002JA-KM;
	Mon, 18 Nov 2024 17:01:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tD57P-0002IU-7L
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 17:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/fwXoKCNGDj6b+p3ivQYm4zuSi5ERP47c/Py4deTrvM=; b=MfOnQlcuVMui+9xA3TCRK4Zk+o
 XS5vO8FSwnwbf2Lj+qMQzcHctM5m6zjDYjFrJUQSw4caIChS7UAcLEEq33oobD9QIJ0LL7SPzRlCq
 l6Km8HagsIx9N8/950I50iQWq46ZkbbWnrIbyb6Gpqv7dvjNHHHgjuApbgUzCOFxgz0g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/fwXoKCNGDj6b+p3ivQYm4zuSi5ERP47c/Py4deTrvM=; b=dGTt+ErOaIBJHE7yBMlBtbVSBR
 GNoHBxtRs9BSiX3QK6Cu9cHOjcZVMq3/i3igw7FeaMRHTxH1KZlvhUBDcpvLn+/85iz1zWbyOpDk1
 ZSp2ur6eTPhkRM6gYCydufE1oKpci55kzARavm3Nz76L939m35hBS86f6J5aqWXI7ixg=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tD577-0000yM-Ol for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 17:00:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7B12DA416F2;
 Mon, 18 Nov 2024 16:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5BCC4CED6;
 Mon, 18 Nov 2024 17:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731949231;
 bh=pt9p5kclLLeN/+fpCGfjargQCDSHIstJnKgShg8P1Q8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Tdose/qI25BUA+KS0D+KQ10UKrzpLf97p5KcnkjEdRvKzYjSDnTOgpXWUX2ACXRmw
 O6o/q5TVUMm/9mmCtiqGA7zNeQ9w3neOm3bATB7RvslktDm4enFOgZ5gn3SjGu/M/V
 6BRgQ/yJXPl3jFNEL9yfKd1wtxwsRr7WiFOJbYWXIq0inlhmKV0LxV4C1tFVAL1Uu/
 G+PoA/GGy3n77Zd3gjEmHQMNXBQxbZvsE6r8znmMUZoK+6KQVWUPPMGW5sBdC0WFKt
 U17gxT8Q24dHYl0DlQs5jvyyere0tLQAgR49aS/2EsIVt+SmRWGBRaq6Skf4jJggD+
 IEXCzFnwtfrZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70DA03809A80; Mon, 18 Nov 2024 17:00:44 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173194924303.4109060.813014636748252195.git-patchwork-notify@kernel.org>
Date: Mon, 18 Nov 2024 17:00:43 +0000
References: <20241104013551.218037-1-chao@kernel.org>
In-Reply-To: <20241104013551.218037-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 4 Nov 2024 09:35:51 +0800 you wrote:
 > f2fs_map_blocks() supports to map continuous holes or preallocated > address,
 we should avoid setting F2FS_MAP_MAPPED for these cases > only, otherwise,
 [...] Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tD577-0000yM-Ol
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to map blocks correctly for
 direct write
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
Cc: jaegeuk@kernel.org, oliver.sang@intel.com, linux-kernel@vger.kernel.org,
 chrubis@suse.cz, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  4 Nov 2024 09:35:51 +0800 you wrote:
> f2fs_map_blocks() supports to map continuous holes or preallocated
> address, we should avoid setting F2FS_MAP_MAPPED for these cases
> only, otherwise, it may fail f2fs_iomap_begin(), and make direct
> write fallbacking to use buffered IO and flush, result in performance
> regression.
> 
> Fixes: 9f0f6bf42714 ("f2fs: support to map continuous holes or preallocated address")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202409122103.e45aa13b-oliver.sang@intel.com
> Cc: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix to map blocks correctly for direct write
    https://git.kernel.org/jaegeuk/f2fs/c/5dd00ebda337

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
