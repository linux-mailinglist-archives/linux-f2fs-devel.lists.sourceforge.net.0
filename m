Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3C38C2E0B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 May 2024 02:50:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5awi-00058C-Q3;
	Sat, 11 May 2024 00:50:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1s5awh-000586-Mx
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=suiVwUi3D4jY48UeWYRG7gYuVn1vIPgD916L5C8pPEs=; b=g5RELtcR5p8gxLwQIj1hlyEXN2
 9eKYZo/1kUsN7KxxRnAUvBnBVCP6T+Oslz2UY0Y9ox/rRgvLHK6T+3QZl6l96tTuSoz2HO/Whpmyu
 pCtrrnGBu+2eeSMHn0J+8Wp4WvsVouHj3PfAV88i0idDhZl/BhOygTI/4JZK8e6Y0Ol8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=suiVwUi3D4jY48UeWYRG7gYuVn1vIPgD916L5C8pPEs=; b=IrglpV4iJcA61+GMgBxKGFb40v
 fr1PBf5opwVQky8eN7quMSQeBoZJjypbgb+RDCgTkbNiu9IYOaJLV3Fboyc9S4IB8Ixzdu3AWYg5x
 cV84ZFTblISYHfqKyQ3PF86p7/af5xn4B/qYoXk6qIdeRG4bRcrkjQzs152ABtv+1tpU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s5awi-0004yk-8T for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 29E1C62038
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 May 2024 00:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D43FBC2BBFC;
 Sat, 11 May 2024 00:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715388633;
 bh=UURFY8r6IzMFK8eicn2U3n+2WWbClvjMqKKMxWH0TDs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=HxLOwnMY/pPHJVJ1MP88HcDxMuBc6DsBSNgq6hxeDu6kO5oa1MOEqPRO+1FHJFLVh
 O6ax8eKjql05OpHY4kY3byFFdDCD7bMc6I8AHmHzbBeIF4ADOvuThoT8N6luSIpXVZ
 SwOpqmnoOd/S2mT+T8uYxBexar4WH/kfqXOnLiGUeLC/v7qmfQLVqaTgkBLz3f9E0e
 CtAxqgzTO2vr3+1vqTaDWnSN/g/0dBN14oiqTDgL6lugCzy/G9rX9byYFY+srO7trm
 N5HX/fcNcTUVp5i9t6ssUOK0WBRBByC2mp0OLEj7MzX2jB+eaFc1SLUMoXj0gkERAy
 1UAt60P0BX9oA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B37E7E7C114; Sat, 11 May 2024 00:50:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171538863373.11229.5565331058940503874.git-patchwork-notify@kernel.org>
Date: Sat, 11 May 2024 00:50:33 +0000
References: <20240506104140.776986-1-chao@kernel.org>
In-Reply-To: <20240506104140.776986-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 6 May 2024 18:41:36 +0800 you wrote:
 > Previously,
 we account reserved blocks and compressed blocks into > @compr_blocks, 
 then, f2fs_i_compr_blocks_update(,compr_blocks) will > update i_compr_ [...]
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s5awi-0004yk-8T
Subject: Re: [f2fs-dev] [PATCH 1/5] f2fs: compress: fix to update
 i_compr_blocks correctly
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

On Mon,  6 May 2024 18:41:36 +0800 you wrote:
> Previously, we account reserved blocks and compressed blocks into
> @compr_blocks, then, f2fs_i_compr_blocks_update(,compr_blocks) will
> update i_compr_blocks incorrectly, fix it.
> 
> Meanwhile, for the case all blocks in cluster were reserved, fix to
> update dn->ofs_in_node correctly.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/5] f2fs: compress: fix to update i_compr_blocks correctly
    https://git.kernel.org/jaegeuk/f2fs/c/186e7d71534d
  - [f2fs-dev,2/5] f2fs: compress: fix error path of inc_valid_block_count()
    https://git.kernel.org/jaegeuk/f2fs/c/043c832371cd
  - [f2fs-dev,3/5] f2fs: compress: fix typo in f2fs_reserve_compress_blocks()
    https://git.kernel.org/jaegeuk/f2fs/c/a3a0bc6c2239
  - [f2fs-dev,4/5] f2fs: compress: fix to cover {reserve, release}_compress_blocks() w/ cp_rwsem lock
    https://git.kernel.org/jaegeuk/f2fs/c/0a4ed2d97cb6
  - [f2fs-dev,5/5] f2fs: compress: don't allow unaligned truncation on released compress inode
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
