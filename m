Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B5C842E32
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jan 2024 21:50:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUv44-0002og-Cx;
	Tue, 30 Jan 2024 20:50:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rUv42-0002oO-KU
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jan 2024 20:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/zXXthE5sf6mEMMmCjP0ThT8gL8fL+nchkTuONWQ38s=; b=AFtfXVEwv9qAaE6CkofFVzvalu
 JkoD1JPcUyYtVKJz01uufdcmfNxxjzFAbFbDXeKHV7g7iCJmsZVihBpyLyJ8Ghzl09uLpOI50uT6a
 dUg17e38KH9X9kG2t3n9+h44TO1yvIdHOZkTSkUgvo6pl40VsPHjzLAcNbPsCpPiRRoI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/zXXthE5sf6mEMMmCjP0ThT8gL8fL+nchkTuONWQ38s=; b=g5Xim5/gKqTB4jTEEVOWe2r19F
 x4LIWkIW2oAmzjTpsyTtUG4P20WlAl1yUWjl9dP0Lm0WD61tNGGabXlTd1cJ01M42GCnU/kQYSVn1
 H7N6Hx2UX/zZFjStDkFvJK0Mh729yxF2PTSx+na+aZhqfbNuM3b1D3s3jeTzXjMy/tyM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUv41-00016n-PG for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jan 2024 20:50:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B18C3CE1CCB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Jan 2024 20:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E00E3C433A6;
 Tue, 30 Jan 2024 20:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706647825;
 bh=64/LeL2k+UjUg6/nAXzx8iXURymnJck5XBIH+3IRkjI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MB/YiCOC4uyvx7BN4uXBMWnHtueM4znJQAfrvH420X9tCNDFC9/DItWHkTABswouF
 HcYzZvyqIU2pyNeRRGgqWNcg2VryZWNOf9wmMf7iFDvKvhsioFr1hXdYx0yEsoH7OQ
 /PIeWVzSql8aCBDCxXvemmDe7RE+SP0swmQWDAE5mZ9LlFJqon2JfKXmPJglvNF4p+
 cqBq0r6dWWDozt+iEIQ7Le5iUBgTyBbP+rc0wXiuXiC4bdRdfUjjGJa6Hpb/Z5K3vk
 GRvQKE2Vu4a79ZptWdGl7VgfSn815tUgBnz9rVd8txazYZbIb3W3PRd/u7lpMQVAYO
 YMhcfIQOkCebA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C51A2C395F3; Tue, 30 Jan 2024 20:50:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170664782580.32692.7563939117930612868.git-patchwork-notify@kernel.org>
Date: Tue, 30 Jan 2024 20:50:25 +0000
References: <20240122022313.3054810-1-chao@kernel.org>
In-Reply-To: <20240122022313.3054810-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 22 Jan 2024 10:23:13 +0800 you
 wrote: > - f2fs_disable_compressed_file > - check inode_has_data > -
 f2fs_file_mmap
 > - mkwrite > - f2fs_get_block_locked > : update metadata in compressed >
 ino [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rUv41-00016n-PG
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: fix to cover
 f2fs_disable_compressed_file() w/ i_sem
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

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 22 Jan 2024 10:23:13 +0800 you wrote:
> - f2fs_disable_compressed_file
>   - check inode_has_data
> 					- f2fs_file_mmap
> 					- mkwrite
> 					 - f2fs_get_block_locked
> 					 : update metadata in compressed
> 					   inode's disk layout
>   - fi->i_flags &= ~F2FS_COMPR_FL
>   - clear_inode_flag(inode, FI_COMPRESSED_FILE);
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: compress: fix to cover f2fs_disable_compressed_file() w/ i_sem
    https://git.kernel.org/jaegeuk/f2fs/c/9f100ecdedc3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
