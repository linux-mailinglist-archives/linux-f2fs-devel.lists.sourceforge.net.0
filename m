Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D03FB283FE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 18:40:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNZGTwEFOGTT9EgDPsKOYD5GIDLOkbkjZgT6DBDOl2w=; b=QRsZaufKJhnCQH4pOsIuZ/DCtp
	sy/h2MyXNWmfIhSjR/1QiB4k23M57IlGUE/xNX3HGWLwo3VxAxWKT6Z8b3L9LzpahTcf9DI9zOxIY
	K0luTSLA6wARnGrjjhOuCwqiv14guzRWwomWJGy9917JbhBPp9U+HgX1HCHyfBigTNF0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umxTX-0002yo-N7;
	Fri, 15 Aug 2025 16:40:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1umxTW-0002yY-GS
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KNID5HeuBXihLPE25V/Yd7vjz2q9US3AG/tGJMSwrmY=; b=B1rnMRh85/YxMqWMHD3UZVYRES
 kMof6ygtd7k+wBrNqc5tbdaXS8CQWYlnxwA0IG773/EhdxPdjhWzjNvMUSHgGIOmaXDbviVdsAzEx
 dhVAK94phl4SczDwn24Puoi+TSqzsZhF4bSMeX89e7UT8AS70GzWiI1+KKZqweYchQHk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KNID5HeuBXihLPE25V/Yd7vjz2q9US3AG/tGJMSwrmY=; b=nFtOx7D7EYFHeRJSWsxJSsbRjL
 Scbizpyp72ub7Wjog4a44hPfeBOwTN4zh0Eta7GMNglnQ5zxUxAjOKCAcwAJtNLtQWDnRGvJlGoxB
 8+X9PM/YgtxlBim84yWVbcLo2DdIwnHUBeR2qQV7sOEF6j08vB/oPUPpIqmrcdd6ZHwM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umxTW-00018w-OP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:40:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7A0BB4644A;
 Fri, 15 Aug 2025 16:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C532C4CEEB;
 Fri, 15 Aug 2025 16:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755276008;
 bh=RhBMzittFhmG7ktz9MBDQLEthMJkvOD/tT2dKiafvtM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Usb42rLsJ9pyDlv1rhmuuQXoNkNRRimTnGuy1Qc0xN7qFH/aXuUIdwYrN+24r5hKB
 Acdqv0BF8o7X1vRWhcJx49vWFL3sDaRK/2tojpx+Zry1ZhibDwgTQy6pTGRUt8cn2C
 YIYKyPNsmZfAm/BK8O///4btqVDze9uY6czWuVEekMaPbVxTnn+Bbo0VVLYZP2JeX7
 EHvliz/osyIo/mc8NMj92XWhmNapZoEdoee9USx0mAAZyQ7PnH0dOjuqF1gjQJX/AL
 fFNaFi1uAgkhZY04Kd2HpDPbYwN4bqOTtu2qE9jdlCkx7cRcGY76ASl9HtxGlV7jPc
 PfYobG2faibrA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADC8839D0C3D; Fri, 15 Aug 2025 16:40:20 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175527601949.1161945.7999749862771332410.git-patchwork-notify@kernel.org>
Date: Fri, 15 Aug 2025 16:40:19 +0000
References: <20250807133501.551848-1-guochunhai@vivo.com>
In-Reply-To: <20250807133501.551848-1-guochunhai@vivo.com>
To: Chunhai Guo <guochunhai@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 7 Aug 2025 21:35:01 +0800 you wrote:
 > This patch allows privileged users to reserve nodes via the > 'reserve_node'
 mount option, which is similar to the existing > 'reserve_root' option. >
 > [...] Content analysis details:   (-0.2 points, 5.0 required)
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
X-Headers-End: 1umxTW-00018w-OP
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: add reserved nodes for privileged
 users
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

On Thu,  7 Aug 2025 21:35:01 +0800 you wrote:
> This patch allows privileged users to reserve nodes via the
> 'reserve_node' mount option, which is similar to the existing
> 'reserve_root' option.
> 
> "-o reserve_node=<N>" means <N> nodes are reserved for privileged
> users only.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v6] f2fs: add reserved nodes for privileged users
    https://git.kernel.org/jaegeuk/f2fs/c/a3b0697610ba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
