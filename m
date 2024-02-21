Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D38D885E53A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Feb 2024 19:10:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcr3M-0001qA-1v;
	Wed, 21 Feb 2024 18:10:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rcr3K-0001py-Kd
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 18:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eWhPcyamVk53pv33w17fWpdKIHlsNrKSp4U4lzEMaLs=; b=KOTFQa5zXBb+WXkevWOUJHvBaz
 C5z4O73PUOz3cMY+5m8lYZhp21phBuXXval5k3fRfjr0ACLgl0IJIuHP9Wgqmldr3Cv8Gb6XWG7Hh
 QcwtwGFOaxyhVYLbOZxfg7cc4bnm5gi7VcK50UXD9cKMJzkXOV/T9cJNh6tg//zdCc6g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eWhPcyamVk53pv33w17fWpdKIHlsNrKSp4U4lzEMaLs=; b=SSQb27Nk1rMzbOIU/tIXIzRHpK
 4DdqfGyKThoico7wQ2Hets8rCiX7osFzjMUW/khKZjK4ztzCH8Lvc9LueqFFKrP1vNjiV7q+FXGvN
 jyHXMhg3ngW2l9iiCo4iDC53ZPcqxBBiy0jyQ2fxYiELjoC23ORVvEOCG4UlY2LbNjfE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcr3J-0001SJ-85 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 18:10:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 12C4B615A8;
 Wed, 21 Feb 2024 18:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 233BDC43141;
 Wed, 21 Feb 2024 18:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708539031;
 bh=D3VHAVujjlQdlZLhGPclUNxbE7zRbfrABrdLiN7PwtI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=l8AkQm+Kt7+SR0ek3u+SVbP2MhkL/+H/DS/ht1bmjy3or8frwhLjbIeXSaX6ENVI3
 0nyVzR21c/Jbr8qJ9BjdbEGMc+SmnVo0CDIs0Zripf2pz+QFYsIHhKjvRSrobkxIWA
 TO/zOn5RiOJzpYHZJulLLIiad1zp7DAe1+7Y5NQceebijC/b+8JobCgAOVamS4o3H5
 FoguZ5JLW2m6GL8jNbs2lj1doIUtMSk9dWSnkbII7o/Vxjj784hHElRdS64vjpSlzn
 lsdI+nii5QCiVQU8hJVyjREI2cnoC3jbJsiHh5/TKRDH7BnwzU3y5y/9AG5ByoBAhU
 Dgi0Bz5KxLEqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0D804D84BCF; Wed, 21 Feb 2024 18:10:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170853903104.7043.2702423489092363254.git-patchwork-notify@kernel.org>
Date: Wed, 21 Feb 2024 18:10:31 +0000
References: <20240201073858.104773-1-huangxiaojia2@huawei.com>
In-Reply-To: <20240201073858.104773-1-huangxiaojia2@huawei.com>
To: Huang Xiaojia <huangxiaojia2@huawei.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 1 Feb 2024 15:38:58 +0800 you wrote:
 > From: HuangXiaojia <huangxiaojia2@huawei.com> > > Use folio in
 f2fs_read_merkle_tree_page
 to reduce folio & page converisons > from find_get_page_flags a [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcr3J-0001SJ-85
Subject: Re: [f2fs-dev] [Patch-next] f2fs: Use folio in
 f2fs_read_merkle_tree_page
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

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 1 Feb 2024 15:38:58 +0800 you wrote:
> From: HuangXiaojia <huangxiaojia2@huawei.com>
> 
> Use folio in f2fs_read_merkle_tree_page to reduce folio & page converisons
> from find_get_page_flags and read_mapping_page functions. But the return
> value should be the exact page.
> 
> Signed-off-by: HuangXiaojia <huangxiaojia2@huawei.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,Patch-next] f2fs: Use folio in f2fs_read_merkle_tree_page
    https://git.kernel.org/jaegeuk/f2fs/c/defcf26adff9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
