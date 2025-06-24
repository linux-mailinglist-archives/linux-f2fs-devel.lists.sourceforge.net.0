Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 610A7AE58AF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jun 2025 02:40:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j69BH+inp2tAHfXoOSYZ4EFAmkWwydGR9QckUgD8Fm0=; b=SmIQc5JRJISAGGg7i+ryaIsHtT
	/G2gt0nWEDy/PKxEM42feo/3zVSTNjbe0Lw2zqYHTonu0w2bF6Q6EXsfrHmSXrAZuetfD91vqQe01
	4x59LI+K5g0Ajqxo3aXmRgkV+jUSzuIJ++0IH3HpvmHCAuAc7TKd79OFNGOcyYLaepXE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uTriX-0007kv-0c;
	Tue, 24 Jun 2025 00:40:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uTriI-0007kZ-Jw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 00:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i8IyB11778uza5mg6LPy2j0XwxJ37VALof5BBGc2N68=; b=HlX4fjbOdXO14ALcKUuKaoHJS1
 Ms1jCu8ybG7ipH/qyxISCdZjudGSYqW3FwkgOUeUzCVwsKhhqpEZIiIukU+v/9/s4zk7R9w/2XC+Z
 RfQaY++4B6vcNleeQ9bWKSX73OcTOfejLkBxwnT7UO/YI4m5884NWKv/X7pf209S+paY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i8IyB11778uza5mg6LPy2j0XwxJ37VALof5BBGc2N68=; b=QnNeRm7bAQXcp64n/54aXZU0Et
 6vU/QWIQaHwb5G4UW+943xOpziqpjyrL2hhZSmVWl43aQDiQpFj2lHV1U8o3xRefbSQRkGio4bRWz
 /d3UqHBsfweU/mxSp58hjR9Qerg1TOxV+LIzWPAYewEOQXZQaSITlRF9JvVe2aayNUvg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uTriI-0006y4-4e for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 00:40:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CE9554A81A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Jun 2025 00:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5B9C4CEEF;
 Tue, 24 Jun 2025 00:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750725627;
 bh=Vw0rDlCFR3NyeAfHaqBbTRF/+72oWG6AmjXEOttkzGM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=E/0uIP0yOarNjmFAQLyY1UR2Uvo1y+PI1Lwbs1XXTqlNL90/SJTMllm8WfnwvSvPh
 yoqt7HrPYmKUZ7isWKLlwl/KyMeMvIRXz21ddo9ioH8KqBjroPn52wWc4E709VKMQM
 OGeRWSkRtaw7oRUzEP1RcRBEcWwec93Q+jeNmcVv5yfJTI71dGSb1PzsvmKEYz5FKS
 zPx88dFJDHPOxUjZRPBoMxbZy9TxNC+iYtXM8Ploc5pQlN0zrwBbCHEYR2ElTfJWGE
 Uy7SuQIAgZ1NujwMxsY2ja62UClq/v9azzzUZ8Kzz/nToIeQE8MSUvvLbjQ+MJaV5w
 eagTtJRqLU75g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAEB539FEB7D; Tue, 24 Jun 2025 00:40:55 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175072565474.3346761.5612358001909141915.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:40:54 +0000
References: <20250609072712.792834-1-chao@kernel.org>
In-Reply-To: <20250609072712.792834-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 9 Jun 2025 15:27:12 +0800 you wrote:
 > F2FS-fs (dm-55): access invalid blkaddr:972878540 > Call trace: >
 dump_backtrace+0xec/0x128
 > show_stack+0x18/0x28 > dump_stack_lvl+0x40/0x88 > dump_stac [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uTriI-0006y4-4e
Subject: Re: [f2fs-dev] [PATCH] f2fs: handle nat.blkaddr corruption in
 f2fs_get_node_info()
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

On Mon,  9 Jun 2025 15:27:12 +0800 you wrote:
> F2FS-fs (dm-55): access invalid blkaddr:972878540
> Call trace:
>  dump_backtrace+0xec/0x128
>  show_stack+0x18/0x28
>  dump_stack_lvl+0x40/0x88
>  dump_stack+0x18/0x24
>  __f2fs_is_valid_blkaddr+0x360/0x3b4
>  f2fs_is_valid_blkaddr+0x10/0x20
>  f2fs_get_node_info+0x21c/0x60c
>  __write_node_page+0x15c/0x734
>  f2fs_sync_node_pages+0x4f8/0x700
>  f2fs_write_checkpoint+0x4a8/0x99c
>  __checkpoint_and_complete_reqs+0x7c/0x20c
>  issue_checkpoint_thread+0x4c/0xd8
>  kthread+0x11c/0x1b0
>  ret_from_fork+0x10/0x20
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: handle nat.blkaddr corruption in f2fs_get_node_info()
    https://git.kernel.org/jaegeuk/f2fs/c/1773f63d108b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
