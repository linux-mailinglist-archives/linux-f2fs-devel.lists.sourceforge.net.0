Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 824877FF967
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Nov 2023 19:31:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r8loa-0002T3-IW;
	Thu, 30 Nov 2023 18:31:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1r8loS-0002SV-5H
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Nov 2023 18:31:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ATczglZAzfpjyzRzcnsnH8JYesl4vtpmRWOibktcIF8=; b=NZV7NL3K6gqw7fskpI7UBZsvlg
 Ho8+aXzyW2nSrZcqImW8E2QTifoh5eyKbSGP6jNiGsH8KeAN9FoEfVY/jFP008FjuyUx2UI/m7cO6
 +1gJnXWkDMgUnI8AOhy0twDVriGrU10EPcBCLF+W6Bcp63MOu25miQ5Kg6cuSNDEGL4A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ATczglZAzfpjyzRzcnsnH8JYesl4vtpmRWOibktcIF8=; b=FfahX6gLvegYgE3zDyrmVk5Ivi
 +EqGQyu/GeGxHm+WWUevoJhhCCYA8i7wPlLN/8M2+YHe6LzDx3KjQQSiI7LSQFUavquTladahy5oU
 eUKeaMjj7gZF/VNRWRyxFc6Rs0/TX6i0YEyNyRjZH1OX0N5XI3xxkgHeYBZcn/WtRAuY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r8loL-0006TP-7a for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Nov 2023 18:30:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7BD7661FBC;
 Thu, 30 Nov 2023 18:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4845C433C9;
 Thu, 30 Nov 2023 18:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701369028;
 bh=kQn4AiZUKODpHAH30bUaozR+Aw/LCTbXYBY4J3YyzbA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=TrobcIcaVF8EBGiZNo8CpGUs2eqsDE55RGSNEoODBHmc+Dp37KEnvjVN0a4CnvhKD
 tt/Pan86ORM8hme3ANm5YwInrxlbQrhzOVGD/O2WrZCtaqNZ/JedlfgTv3iUxfqdz/
 o2eXKQVwczKj7+wQN7u92H8dLg7vM059wNsZMzSJi/KZQAPQ6m8kNwk3NtaehmO0o1
 bOgNmKrzMbuh/QpioF6yLMTGTgFKjNxCY1olmXI/xOS3Zmk//1A7ZQzUULhCUh4H/0
 jnJhUF/d81jIZSRXXsk+VTicwmUyhMeB8vG+PR2pADlGEMZ9cdaKPr92XbYgVBgiqE
 2sdWXYIrUlEQA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 AF84FDFAA9F; Thu, 30 Nov 2023 18:30:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170136902871.21709.7868505476251651988.git-patchwork-notify@kernel.org>
Date: Thu, 30 Nov 2023 18:30:28 +0000
References: <20231128092516.2882629-1-chao@kernel.org>
In-Reply-To: <20231128092516.2882629-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 28 Nov 2023 17:25:16 +0800 you
 wrote: > As Al reported in link[1]: > > f2fs_rename() > ... > if (old_dir
 != new_dir && !whiteout) > f2fs_set_link(old_inode, old_dir_entry,
 > old_dir_page, new_ [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r8loL-0006TP-7a
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid dirent corruption
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, jack@suse.cz,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 28 Nov 2023 17:25:16 +0800 you wrote:
> As Al reported in link[1]:
> 
> f2fs_rename()
> ...
> 	if (old_dir != new_dir && !whiteout)
> 		f2fs_set_link(old_inode, old_dir_entry,
> 					old_dir_page, new_dir);
> 	else
> 		f2fs_put_page(old_dir_page, 0);
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid dirent corruption
    https://git.kernel.org/jaegeuk/f2fs/c/53edb549565f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
