Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B029B37E1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 18:40:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5TjX-0005UY-7o;
	Mon, 28 Oct 2024 17:40:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t5TjV-0005UF-Hw
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J7HORIs4RAG1VqOetH5CF0vQI5uqYvd+1TGsl2XIL0o=; b=JKXSJ7u3l/rZKuaUPbQwY5KRr2
 onfQ8yQw2NAAMS1e767dAZmNfnIDVcjbIg8luoqFE3IyIHpYo1sXMXnnknQr/1cBQclZWQOWR99CZ
 xPuerFipT6fGmtAdWewD72tKi65T7/umwAv2nTPQH/VcnOk5f1KY63CfYBZFZZ46zpHw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J7HORIs4RAG1VqOetH5CF0vQI5uqYvd+1TGsl2XIL0o=; b=lUoxBeSxpfkF4wTzO80hHqU4Gm
 L0Rp1gbCr7JGkV9FP/0KuJZfyANFPCsDhUJTrAJBBa3dc7dS6FkC1BU+r8epbG+FfqKdx7DsU/TmN
 WHeE3gpGv71tK9smGyu/TRz1YnZhmZaoS8tDH/ihADrGtZj0x3gul/Tb8fIEr3kNGRMw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5TjU-0005Ho-TJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2A746A42A22;
 Mon, 28 Oct 2024 17:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9EA7C4CEC3;
 Mon, 28 Oct 2024 17:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730137237;
 bh=IYZJMW0PqsDnvR/T7OuWRv3s0dXr/XWCPZbw4RXqxRo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XR4H32rxcjEjPoPeuFQAvvMMz5gyTuYrAgu/ik9SYyH22+ofCDhC69O2OQwcJkOoN
 wnEn0d6fDFDwfnj+lsIIvP5z/iQ06/buiCAT+ZH52Hrvm+n2D1ttVIO/3lKsjHRscf
 JinZ/qtlxP6Ii4DhTJkm3w+jf3hTFfmB4fZEjfprq8wgSUbMt4LbT0NYZsFvWo6Qt+
 ji8SVfigolnnwRXNG/GnQNxLV8er7jITBDGnYGtvzHgRdmE5ORv3iKU2QT0EnSK9dl
 reR+1IbPauMODCuGOIIAA9UdYo0Em3ye9BZG1RsqaIkhslP/262gvJG6v0LV76tdBR
 o0G57wPjbTDdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70C6D380AC1C; Mon, 28 Oct 2024 17:40:46 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173013724524.126843.7666285909402123945.git-patchwork-notify@kernel.org>
Date: Mon, 28 Oct 2024 17:40:45 +0000
References: <20240929080011.3802327-1-hanqi@vivo.com>
In-Reply-To: <20240929080011.3802327-1-hanqi@vivo.com>
To: Qi Han <hanqi@vivo.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 29 Sep 2024 02:00:10 -0600 you
 wrote: > After release a file and subsequently reserve it, the FSCK flag is
 set > when the file is deleted, as shown in the following backtrace: > >
 F2FS-fs (dm- [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5TjU-0005Ho-TJ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: fix inconsistent update
 of i_blocks in release_compress_blocks and reserve_compress_blocks
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

On Sun, 29 Sep 2024 02:00:10 -0600 you wrote:
> After release a file and subsequently reserve it, the FSCK flag is set
> when the file is deleted, as shown in the following backtrace:
> 
> F2FS-fs (dm-48): Inconsistent i_blocks, ino:401231, iblocks:1448, sectors:1472
> fs_rec_info_write_type+0x58/0x274
> f2fs_rec_info_write+0x1c/0x2c
> set_sbi_flag+0x74/0x98
> dec_valid_block_count+0x150/0x190
> f2fs_truncate_data_blocks_range+0x2d4/0x3cc
> f2fs_do_truncate_blocks+0x2fc/0x5f0
> f2fs_truncate_blocks+0x68/0x100
> f2fs_truncate+0x80/0x128
> f2fs_evict_inode+0x1a4/0x794
> evict+0xd4/0x280
> iput+0x238/0x284
> do_unlinkat+0x1ac/0x298
> __arm64_sys_unlinkat+0x48/0x68
> invoke_syscall+0x58/0x11c
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: compress: fix inconsistent update of i_blocks in release_compress_blocks and reserve_compress_blocks
    https://git.kernel.org/jaegeuk/f2fs/c/26413ce18e85

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
