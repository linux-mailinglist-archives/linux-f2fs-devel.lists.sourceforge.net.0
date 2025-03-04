Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 572ECA4E7CF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Mar 2025 18:10:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tpVmq-0006IB-3v;
	Tue, 04 Mar 2025 17:10:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tpVml-0006I3-VY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Mar 2025 17:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lNW4h9yoZI9P+uigbCXLQ88pE6T1nJEAZ0XYKYp804I=; b=HE+5q7ZE1ZDkL0WoXv4tsZkXMV
 UKVp4s4DSqEK3RiDU4OX2ezmltTBLdQTZhoBPfPGXFkXPZ+ssvdNjve8Oov+fV1rDmzaUMcyV5bSp
 MctA4PIA4u1JIidWFj3VpipfNQjTRIlSxs7DjPIH/b+0b+3FRtcRtqevl3m1Hn3gLs6Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lNW4h9yoZI9P+uigbCXLQ88pE6T1nJEAZ0XYKYp804I=; b=SS0vDI5gGSx1pxF2vTzplZbr8b
 VNA6eXBglcU2QdGboX3ypzzBzwiD+EpyDs0rzC5s0oozEopv0muZO4znXGTxCb62ZnM4bzuDKNzY6
 RzOi7bXh8G6jGLVBWTj/sHU60G4VxvsGoks7vaVg0F40aH84ZMShTmyg/1AJqyU3dobo=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tpVml-0004p3-Qo for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Mar 2025 17:10:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 57DE3A459E6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  4 Mar 2025 17:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D226BC4CEE5;
 Tue,  4 Mar 2025 17:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741108216;
 bh=KNixpme328BkPpO3f08aDQkLgSB0GOMOGQFqOcWIDAg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Qw1zIxZtOEJMdtXazA3ZGdqTbyXyiMi2doEL0xxrV8a5Dod4a7HNmfGBdxphketD6
 aJUlfnXd1YIqUrdpvhVWBFGDMXxfPcL2Rl/UaXDCtNnw5nRg+To1ub5oShlCvGs52+
 fL3yIrH78/XE9cl3UGiETYicfYLSyBiLHEg37+wkwT1OLpbhME47ZCYyzL5PsuHbMI
 Zthu+cW/+Bbk6mqrGCLuIWaoEhU6AK3pFZYbQjOb/iQLyMWUzBnlJKuTHby+O5aZN1
 1meL8OU51g7ewMpZAxVom9lvFflFGco6iaDxgQRXs7DfBtYMB9o6+TJ5g6Cn1MfBIH
 4kwnujfb25d4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAD91380AA7F; Tue,  4 Mar 2025 17:10:50 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174110824973.224349.3484276359744907676.git-patchwork-notify@kernel.org>
Date: Tue, 04 Mar 2025 17:10:49 +0000
References: <20250303032500.1310215-1-chao@kernel.org>
In-Reply-To: <20250303032500.1310215-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 3 Mar 2025 11:25:00 +0800 you wrote:
 > f2fs_recover_quota_begin() and f2fs_recover_quota_end() should be called
 > in pair, there is some cases we may skip calling f2fs_recover_quota_end(),
 > f [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tpVml-0004p3-Qo
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to call f2fs_recover_quota_end()
 correctly
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

On Mon,  3 Mar 2025 11:25:00 +0800 you wrote:
> f2fs_recover_quota_begin() and f2fs_recover_quota_end() should be called
> in pair, there is some cases we may skip calling f2fs_recover_quota_end(),
> fix it.
> 
> Fixes: e1bb7d3d9cbf ("f2fs: fix to recover quota data correctly")
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to call f2fs_recover_quota_end() correctly
    https://git.kernel.org/jaegeuk/f2fs/c/d8f5b91d77a6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
