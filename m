Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AEBC50026
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 23:51:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5PQYG59/+zsvl/e7Ipoa6Z1nYg8dORY0P/Xrxjl8lk=; b=hLNr4XbdQo28PO1wNMBiGOvcNM
	6iZdyf6NPPeXUgQyOw/HYp7WIXeIdl+vNOEglnNqph/jwnc2L93BJmEBkq752ANQp6P9oIDr7mfQW
	ea53mIOMLgT+Cy+fA6BDAVcLDlKGZB1xVpbPhB8N8ojFrwQnLl+f1MwobUV4DiLLfUS4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIxCc-000306-3r;
	Tue, 11 Nov 2025 22:51:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vIxCa-0002zr-MN
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lpk33tyqt2+jpTFRHIMfVqSAVRgluSrRuXSbdbgbxgM=; b=ZV4omtRKw017W3+yV1O/nntUBx
 PZlkRHYJEugrgxzAL7IySgP/S6YSb9mZSrWnA1qf991EaFQw9VSGAM/dVGr5o19jd5QPeEDQw4qcX
 pYQnGTnGN030n7nANNNtPNMuO/kq9lva5dLiLqsn7vQaD3Ws3IQjT2i7yQeBxkjVbdW0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lpk33tyqt2+jpTFRHIMfVqSAVRgluSrRuXSbdbgbxgM=; b=RJ+bTyalg6j5nlC5Y2abmSmAHK
 6g2KotN0EzqPmZs+jz5/7EY82eJB9Occ5rW+Z4/3gJ1K0AKbIisfhsLiukbt8lfY1oRyLNq5dtcXY
 tyFWFhFJXe4XYwn6yrbaTzTeHTfPQUUI38EvEe7unvg2ggVSLy8s25b+HjOeByErOv9w=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIxCZ-00047l-W5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:51:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6C3FB600AD;
 Tue, 11 Nov 2025 22:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB9FC113D0;
 Tue, 11 Nov 2025 22:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762901453;
 bh=pnYPgV1/kV0KNl2wqSooNI4BldWEB/mQ+fVGd1Z+pwc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=VYscEzPvG9y+04A1wO6HrUv/TkufhJXBvfcN5mnQ0t0xkf08ulS9RRuNXTh+6OMZj
 LNC+uGlf7r+cKwcTK6orQlO1UN0/vdjRnaegQPuCC6vncmUFU8iKpTickky4QAlZMA
 BP/TkJy0Y8XZh8wiGjlW1zM4febmOCEKSB4V8BIDN8HqaV/lTd1k+kWpmaS9pxjOsQ
 45BdVeo78b5GtS6y9LfmZL2U4lUzGYDGY1UbMwiXlDohhP3Je24WpsrJpoyUcXDnLI
 JRkc1BjFvEdkQrK86NL+f/IqfoKujp27b1nCW1BMU+hVCq0YVMZtGLK5OyCBFXMB9D
 m6NeT8Tbgl5yA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70EE4380DBCD; Tue, 11 Nov 2025 22:50:24 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176290142299.3596344.2753827119628915512.git-patchwork-notify@kernel.org>
Date: Tue, 11 Nov 2025 22:50:22 +0000
References: <cover.1762339963.git.zlatistiv@gmail.com>
In-Reply-To: <cover.1762339963.git.zlatistiv@gmail.com>
To: Nikola Z. Ivanov <zlatistiv@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 5 Nov 2025 13:09:41 +0200 you wrote:
 > This series is provoked by syzbot warnings caused by corrupted directory
 > inode with i_nlink == 1 that passes the initial sanity check which will
 > only [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vIxCZ-00047l-W5
Subject: Re: [f2fs-dev] [PATCH v4 0/2] f2fs: Add sanity checks before
 unlinking and loading inodes
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
Cc: david.hunter.linux@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, khalid@kernel.org,
 skhan@linuxfoundation.org, jaegeuk@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  5 Nov 2025 13:09:41 +0200 you wrote:
> This series is provoked by syzbot warnings caused by corrupted directory
> inode with i_nlink == 1 that passes the initial sanity check which will
> only mark the filesystem as corrupted in case i_nlink == 0.
> 
> Tests:
> - fio/fsmark parallel create/unlink on VM with f2fs root filesystem.
> - syzbot
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v4,1/2] f2fs: Rename f2fs_unlink exit label
    https://git.kernel.org/jaegeuk/f2fs/c/7b4827ce2d2a
  - [f2fs-dev,v4,2/2] f2fs: Add sanity checks before unlinking and loading inodes
    https://git.kernel.org/jaegeuk/f2fs/c/d43f8de77d6c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
