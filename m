Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D9990579C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2024 17:56:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHQKr-00043C-44;
	Wed, 12 Jun 2024 15:56:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sHQKd-00042U-Fr
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 15:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hv+cst/YZg3bSHDLfTd5qvpJMihe/cCbA8iMyvhzdms=; b=HonWl9pBHiHSPJNRElXzq8912f
 vyxT2MCdTcsFh93tGFV37esJwd/EZjBfIuXZTgrHBUHtuDq2JowSCMSTFLZp7zDnghnjEMYNEy5VZ
 GY/QpojpDVlQdsL07VbJEu1W312gFVA7ZV8MgkKBSBA03QGFsxBTgcVMVCTeoDoLe2Yg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hv+cst/YZg3bSHDLfTd5qvpJMihe/cCbA8iMyvhzdms=; b=JNoOMLT0aDBZfX1PKAtaspTX3i
 INR3nFbnyUyb2f29KEIJy7M3LgyrudlP5QBLBXb7UBLvBZVBpF23Q5VA8mpaVMcMaQhBHZ5wCMI5e
 /2BiRgt+C8kQmvlhgaBzOQws5TuwI7INtnPdnxyLPpzOv52mO1M8IkeTrC9b5IxMHK90=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHQKc-0007Sp-W1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 15:56:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BEB3B614DD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Jun 2024 15:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89176C4AF1C;
 Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718207757;
 bh=c3FMlagO4HhbTzrgPecz6RKU3l5fy3h1uoMfDBquvuY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jFdjzOKq0QfNuyRJKUIX53p1TWUF4Jqt6Gn1h14i6f2nUpw/qk5WT1ga4WLCFUW8/
 7iJ/PpmlgabK5a7jKfsUCrCDerHtBd3mOAWaivowbOC26qO7P4S48VOkBIHsoTmURr
 7cww1VUd/TrH49B+4KA9xFccuXq2WV948S3pDJWMLmnPLdtQQxIseE/HEdwD77Y33x
 5wppROmrDmcelhhA5Dvk3a0FG/Kb/FkYackp25y+7utUos45hC/eF3Qy5xFYdPIJfm
 6W2Jc9IZpSUAa8AnPyxHlmKOd0rv88SjxVgBaeMwqkzd3XByG1ebu9VzAY4/s/pLEs
 /nxB16kMzaJ9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7ED9FC4361A; Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171820775751.32393.2721044204636659523.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jun 2024 15:55:57 +0000
References: <20240515081233.2463848-1-chao@kernel.org>
In-Reply-To: <20240515081233.2463848-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 15 May 2024 16:12:33 +0800 you
 wrote: > FS_IOC_GETFSSYSFSPATH ioctl expects sysfs sub-path of a filesystem,
 the > format can be "$FSTYP/$SYSFS_IDENTIFIER" under /sys/fs, it can helps
 to > stan [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sHQKc-0007Sp-W1
Subject: Re: [f2fs-dev] [PATCH] f2fs: add support for FS_IOC_GETFSSYSFSPATH
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

On Wed, 15 May 2024 16:12:33 +0800 you wrote:
> FS_IOC_GETFSSYSFSPATH ioctl expects sysfs sub-path of a filesystem, the
> format can be "$FSTYP/$SYSFS_IDENTIFIER" under /sys/fs, it can helps to
> standardizes exporting sysfs datas across filesystems.
> 
> This patch wires up FS_IOC_GETFSSYSFSPATH for f2fs, it will output
> "f2fs/<dev>".
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: add support for FS_IOC_GETFSSYSFSPATH
    https://git.kernel.org/jaegeuk/f2fs/c/cc260b66c4cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
