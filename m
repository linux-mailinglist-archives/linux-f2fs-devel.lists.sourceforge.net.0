Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BD693AB15
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jul 2024 04:17:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWRZ1-00046T-GX;
	Wed, 24 Jul 2024 02:17:11 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sWRYk-00045s-Ug
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 02:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HsVR5SV0620fVtCEMaWePw+/1iFYbvGE+/1xrqb+xHw=; b=mC/IMURcGHn0JKr9QpXxksaNNm
 jAA4CRGudWTPSX1uzfI+5qEbVMGwD6IcrhpFWe6aP2FyeNzFfy/sI+8LnVWvBl8+w7mmoIOgwk/qm
 I34a/9eyVwM+s4PluJIHBaEtMtIG15jP4VS5sHDEbHKJXLcLK+ePO+KlwXCQBzM1X670=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HsVR5SV0620fVtCEMaWePw+/1iFYbvGE+/1xrqb+xHw=; b=CMkyQAktDCGjM7T431U8biCwRk
 1sYMR7ViUmEa8oroOTselTHPXiH4LRDw0GmVUPxaxx8DNG3Nt4yvqFztK57Sd9XhaQe6Oy+QaeC9l
 oTUAkqUOhk9+o5SA0v60sSExEFZnOx/vm+PUwOO12Blp2+R3p2W7GwaZhfCCxUshtuBg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWRYi-0002Hk-B9 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 02:16:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 00F2360E2C;
 Wed, 24 Jul 2024 02:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0D85C4AF10;
 Wed, 24 Jul 2024 02:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721787406;
 bh=e2dCHd3n8q25XhOxzHvJ6i3RPXn9LxCn1diONk3KotU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=bMpDk9N7EkOjwmpSIaAklT8hKeoG5hdBDnUji25xGqzIqXwl2rfjVmaQ/8qQ2+Yek
 gOs+5otr1dYkrWn+WLf0ZC3HwosbZkdbdnUO0UGPhsVjWN98Q7xmyz2jNw6FzWgvOD
 9ndEKbh0olHi7p2k64uy+qnGbLmH6t8j1sa6XUSiGnrh7bgv/HP5UQRGPMlsdtpHmK
 qfGlbxz8w3UWIOg38XkCepKM8/51bHXqfVu1p7eW27zj2OOxvqss+E6rzPm4jCZyv6
 Geo/fzyYTMac242CPAQTv+006yg3TOQ8zCnWl4VapNKMakux9lOgHLCrG2vPZuFVE2
 akL++zdvOugdg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 94D30C43443; Wed, 24 Jul 2024 02:16:46 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <172178740660.17759.10253649840019036127.git-patchwork-notify@kernel.org>
Date: Wed, 24 Jul 2024 02:16:46 +0000
References: <20240606073353.47130-1-eugen.hristev@collabora.com>
In-Reply-To: <20240606073353.47130-1-eugen.hristev@collabora.com>
To: Eugen Hristev <eugen.hristev@collabora.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Christian Brauner <brauner@kernel.org>: On Thu, 6 Jun 2024 10:33:46 +0300
 you wrote: > Hello,
 > > I am trying to respin the series here : >
 https://www.spinics.net/lists/linux-ext4/msg85081.html
 > > I resent some of the v9 patches and got s [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: spinics.net]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sWRYi-0002Hk-B9
Subject: Re: [f2fs-dev] [PATCH v18 0/7] Case insensitive cleanup for
 ext4/f2fs
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
Cc: krisman@suse.de, brauner@kernel.org, kernel@collabora.com, tytso@mit.edu,
 ebiggers@google.com, jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Christian Brauner <brauner@kernel.org>:

On Thu,  6 Jun 2024 10:33:46 +0300 you wrote:
> Hello,
> 
> I am trying to respin the series here :
> https://www.spinics.net/lists/linux-ext4/msg85081.html
> 
> I resent some of the v9 patches and got some reviews from Gabriel,
> I did changes as requested and here is v18.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v18,1/7] ext4: Simplify the handling of cached casefolded names
    https://git.kernel.org/jaegeuk/f2fs/c/f776f02a2c96
  - [f2fs-dev,v18,2/7] f2fs: Simplify the handling of cached casefolded names
    https://git.kernel.org/jaegeuk/f2fs/c/632f4054b229
  - [f2fs-dev,v18,3/7] libfs: Introduce case-insensitive string comparison helper
    https://git.kernel.org/jaegeuk/f2fs/c/6a79a4e187bd
  - [f2fs-dev,v18,4/7] ext4: Reuse generic_ci_match for ci comparisons
    https://git.kernel.org/jaegeuk/f2fs/c/d76b92f61f3b
  - [f2fs-dev,v18,5/7] f2fs: Reuse generic_ci_match for ci comparisons
    https://git.kernel.org/jaegeuk/f2fs/c/d66858eb0c72
  - [f2fs-dev,v18,6/7] ext4: Move CONFIG_UNICODE defguards into the code flow
    https://git.kernel.org/jaegeuk/f2fs/c/d98c822232f8
  - [f2fs-dev,v18,7/7] f2fs: Move CONFIG_UNICODE defguards into the code flow
    https://git.kernel.org/jaegeuk/f2fs/c/28add38d545f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
