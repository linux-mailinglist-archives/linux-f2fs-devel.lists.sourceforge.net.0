Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC55F820122
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Dec 2023 20:10:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rJIFl-0000AZ-FR;
	Fri, 29 Dec 2023 19:10:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rJIFj-0000AT-4I
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Dec 2023 19:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OG7dgkQl81XbvpVYXlypZ5YU/TsE60YGywXocanORJc=; b=UMS35VEfCqfTwqVwM5Dd7e2eZG
 gKuMwPqF8fSF2kHMdDbJ9HpOu/3TFCxWIoq4MzGP8jzPaNdpeWY3f5BbCOs43M2dbuM+0vG15ue8x
 udAtFgDITdYVBuRb3JCc5j3iFoeyMG92fNx8RSjmK3PibdUF13g+1C38UZmRKLAWrA88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OG7dgkQl81XbvpVYXlypZ5YU/TsE60YGywXocanORJc=; b=Dz55jN4BiG6tAGr+Ie/pijQZJF
 NTXA+VNgkbdfBBDGf4dRXyHJy8q9esoYzgRGajhAKVjN+JOsYJTKIHGq9qOfQ/FPvPp/Rjowwf1Mp
 iE757Ire9UyQhVarzzpipTFiIlAI9UN7VSmpRVkt/SE8wPamnN3yDgkrMv7wvvp2zlcA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rJIFi-0005NX-8v for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Dec 2023 19:10:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9953ECE18E7;
 Fri, 29 Dec 2023 19:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9B74C433CA;
 Fri, 29 Dec 2023 19:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703877024;
 bh=1u6y4yARCqRY7+e2rXMY/Xf05MSeoSpwpaXcLPm8MmU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=YaoBjIYhg7svxuhYCMisexTJeVOQ1uWK7jiHzv0Qdln9Gemz7XTwo7u1D8HUBuS9C
 NmtWpP7yW/qc8TYjViYqOWK1unjORvoCNr5RrV72K6RsMzPChSJWbszg9wffceMHVn
 S1AmBOr6sb81cZn8Vqz/SRqKxIBu9SK1GFGKk5Znl7fDh0Lm8XYAvFeqyzyMddmWN/
 QyYJm4/phqECiX4vpS5DxG6tlq2U4CWh+cdua8zVoRyUtJGUStfiBUf61W3BbwcyuL
 Rvm6HOWSsQn7kYSSaReh3xV5GPoeuYSt9B+fAxspM3qvYxytaHsifNF4jVCRoKRFco
 Frph1nx2LtB2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A10D8E333D8; Fri, 29 Dec 2023 19:10:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170387702465.8173.9564076529806115023.git-patchwork-notify@kernel.org>
Date: Fri, 29 Dec 2023 19:10:24 +0000
References: <20231222032901.3861649-1-yangyongpeng1@oppo.com>
In-Reply-To: <20231222032901.3861649-1-yangyongpeng1@oppo.com>
To: Yongpeng Yang <yangyongpeng1@oppo.com>
X-Spam-Score: -5.1 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 22 Dec 2023 11:29:00 +0800 you
 wrote: > The {struct f2fs_sb_info}->dir_level can be modified through the
 sysfs > interface, but its value range is not limited. If the value exceeds
 > MAX_DIR_H [...] 
 Content analysis details:   (-5.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rJIFi-0005NX-8v
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: Constrain the modification range
 of dir_level in the sysfs
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

On Fri, 22 Dec 2023 11:29:00 +0800 you wrote:
> The {struct f2fs_sb_info}->dir_level can be modified through the sysfs
> interface, but its value range is not limited. If the value exceeds
> MAX_DIR_HASH_DEPTH and the mount options include "noinline_dentry",
> the following error will occur:
> [root@fedora ~]# mount -o noinline_dentry /dev/sdb  /mnt/sdb/
> [root@fedora ~]# echo 128 > /sys/fs/f2fs/sdb/dir_level
> [root@fedora ~]# cd /mnt/sdb/
> [root@fedora sdb]# mkdir test
> [root@fedora sdb]# cd test/
> [root@fedora test]# mkdir test
> mkdir: cannot create directory 'test': Argument list too long
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: Constrain the modification range of dir_level in the sysfs
    https://git.kernel.org/jaegeuk/f2fs/c/0145eed6ed32
  - [f2fs-dev,2/2] f2fs: Add error handling for negative returns from do_garbage_collect
    https://git.kernel.org/jaegeuk/f2fs/c/19ec1d31fa56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
