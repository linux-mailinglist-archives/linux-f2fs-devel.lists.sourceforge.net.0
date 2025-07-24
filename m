Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B089DB1125C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 22:30:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZJqSMB6Y4xd2LKY8lxinc4xdTPbsU8DXZxo5U/Bymk=; b=TGPQECtAKKIpIbtCiOGUbLFwVb
	kKKdt5nZnOFPk7fG/zVjoTnjaI+QlwnVUhFCXpjVaVi2VmJr4ZFi7+MQn1dggaMyDfdvnoOsI8cTn
	b0OAm28RwBwzkbC1kESSsQ/QOKqf+xe7TYdSUVaB8LXiVODSkZ/MtfzpOW+eu9dPHZE4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uf2Zo-0006pX-Of;
	Thu, 24 Jul 2025 20:30:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uf2Zm-0006pJ-Su
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 20:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zlVzF09tHu1eRhWfB6jxD6gdV7jaXMQE08GHSb5JXdQ=; b=ert8TO3ZmCpyDLNbFbeRSFRzlS
 ayzAOze3vVaKsZ8D4MxzSfLxrtjVefU6FeQIX1XXjPEbyZE9kZKuQbJithzRBcgPKAGet9SVPYa2O
 C3ZduvYZh1W7OH9/X9SMaZVXB29mCKzauCmLTvZUaj7TkcS7lXCxZmLE1VR91dRAZTcc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zlVzF09tHu1eRhWfB6jxD6gdV7jaXMQE08GHSb5JXdQ=; b=RydWPnsmTMworxO+aomu+KHstY
 RKVCzQCFfMpx0n7Ii12O2nLw1SSha+AF8TEMwi5xZhCs5IYup30KxWbmC7/LD95KPhml9ScOn+WAd
 XPGTwOKJLQfK23rF9eR+Jpkm76JT7c4szYSHTVx2dcvSH5VbiB+Y+9thdkcAIlBu7FGQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uf2Zn-00012z-4R for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 20:30:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BCC585C6503;
 Thu, 24 Jul 2025 20:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64501C4CEED;
 Thu, 24 Jul 2025 20:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753388992;
 bh=BZpbmUrqv5U1Lw5E78QhNGYMQWS5dqtWVkYTRYBinaU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=PY4mg5v73VvkCedsRsFwhKvzFW8s37UvJI5cApze9k4JR8ik8IJ5rqaPgsFR2ocDG
 HYXV64XQjXedHEzOlOO6twfMc9++HgjIQpmK74hKoGeTmM3ByiZ0XiDh81ckE7plJ8
 rotc2ZO4xj+2RPx9rYwOZaiQU1BP0Y/W1lT3sBHHn+uzpSk1CU0T9a9HMyYeVxC31I
 yj9dsOKZ2jLVyTOPkObBdZj3tdV3Ub+FxU8O/3W1ncQqQNr8MPTR1tizl6NnjLVvJo
 ZIGj/Y7HjoqGmwCVSr4usb25hLBEu8hxt1zh09nkPzrq4s+sDsQksDQnUVmwoBUx5W
 FBLczeD23r1ng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70D0D383BF4E; Thu, 24 Jul 2025 20:30:11 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175338901026.2519964.16198621184448578981.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jul 2025 20:30:10 +0000
References: <20250723145837.187089-1-masonzhang.linuxer@gmail.com>
In-Reply-To: <20250723145837.187089-1-masonzhang.linuxer@gmail.com>
To: mason.zhang <masonzhang.linuxer@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 23 Jul 2025 22:58:37 +0800 you
 wrote: > No functional changes. > > Signed-off-by: mason.zhang
 <masonzhang.linuxer@gmail.com>
 > --- > fs/f2fs/gc.c | 7 +------ > 1 file changed, 1 insertion(+), [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uf2Zn-00012z-4R
Subject: Re: [f2fs-dev] [PATCH] f2fs: merge the two conditions to avoid code
 duplication
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 23 Jul 2025 22:58:37 +0800 you wrote:
> No functional changes.
> 
> Signed-off-by: mason.zhang <masonzhang.linuxer@gmail.com>
> ---
>  fs/f2fs/gc.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: merge the two conditions to avoid code duplication
    https://git.kernel.org/jaegeuk/f2fs/c/b93bf64e349b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
