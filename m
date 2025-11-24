Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C39C8228A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 19:51:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mnz/IsOd4D1dKkpx9fMDPSsxZ8j6BnCenBohi71uCFE=; b=eUgr3HMdX5F79s6CZJrqvjlDfC
	v7ZyhY6HKwff3/zAXnUJtBrMaXLQp6YLqkKNZ/AP+4Q1ji+Yd+eiUCqPvMmeWRAHMN1RsKCvHscrs
	yQqQcvNmi7cGV+90asZYqwfaK0kzwQS0HT4M4yLTa1LZbc4U8uCRrXmY87itxq3a8uKM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNbeN-0008WH-Bp;
	Mon, 24 Nov 2025 18:50:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vNbeL-0008Vy-Fz
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 18:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7z/XyG14aF0a8KW1/HqdQ+5YuBjG5fpNj9sOKg7k/cc=; b=StMsdD76SNHnpsdp4nRJ6mz9L+
 A4u0rUfoQDs/wS40twytanpyyoOOP0NpOtXTQ26DqQGqwBYnFaJPqU8Y8bEM4qfKAonU3jNOWKIR/
 h2hUs/fBEOlUrUd9nmJYKndJMj93J0VkLZKjVBpxxBSizWUGFrgAbj/MxjwX5jqZ6v20=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7z/XyG14aF0a8KW1/HqdQ+5YuBjG5fpNj9sOKg7k/cc=; b=ihGoJxKBTPj6ktm/oUQUP8BT4A
 FjXn82ReR2S4k0+5TfiBZkAVN+x0Ir60XtvySRcNESN01lIdk3cmpJVl+SifJAbMIvrf3JWMv0Qbb
 O8D+K2YNw7M++mJt0nhrah2tj29zvftpM8ShyNhajmQ+K6BCvH4LtDVhxyiRJLH4baAE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNbeL-0002en-02 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 18:50:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6616B601A7;
 Mon, 24 Nov 2025 18:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104B3C116C6;
 Mon, 24 Nov 2025 18:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764010251;
 bh=Lc2rgNw0FBZB7sMzSaFcGumFZq9VWirjAsP2esRZd+I=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Qpx4HciwZWwrS5FeBQwj6PE+DcmgEevKz8fRIWxiSNa4Osz6rz8dQth5AWG/xDoF5
 kqiTp/82HhbnrmXu4QL1yOqGkHexMh3Qmi52jQon6BSJWdegEeaetvvBAHAiCMGAlb
 SyHqxOpW/clCvBkGzffWvuIHCzmvNSgefMRxmyp6XOKZKnOegQ4EYH0JBjxNvvBKJe
 pRWV27jIVu33XS49vY5KYy65fhP9RR+s3PGqfwFseGz9/b1Q1eBJ9SBE60mcGPHu5f
 SnvOuo/qOaVQm4c9735Y7tGjkQ+XI9z2in/pwxWP/dInDVhr3RNcraihrlNC5tZ71m
 rrVBFBBXNsuDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3428D3A86296; Mon, 24 Nov 2025 18:50:15 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176401021399.42009.9871104675547871251.git-patchwork-notify@kernel.org>
Date: Mon, 24 Nov 2025 18:50:13 +0000
References: <20251117122754.297742-1-nogunix@gmail.com>
In-Reply-To: <20251117122754.297742-1-nogunix@gmail.com>
To: Masaharu Noguchi <nogunix@gmail.com>
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 17 Nov 2025 21:27:54 +0900 you
 wrote: > Sphinx's LaTeX builder fails when converting the nested ASCII tables
 in > f2fs.rst, producing the following error: > > "Markup is unsupported
 in LaTeX: [...] 
 Content analysis details:   (0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vNbeL-0002en-02
Subject: Re: [f2fs-dev] [PATCH v5] docs: f2fs: wrap ASCII tables in literal
 blocks to fix LaTeX build
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
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, akiyks@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 bagasdotme@gmail.com, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 17 Nov 2025 21:27:54 +0900 you wrote:
> Sphinx's LaTeX builder fails when converting the nested ASCII tables in
> f2fs.rst, producing the following error:
> 
>   "Markup is unsupported in LaTeX: longtable does not support nesting a table."
> 
> Wrap the affected ASCII tables in literal code blocks to force Sphinx to
> render them verbatim. This prevents nested longtables and fixes the PDF
> build failure on Sphinx 8.2.x.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v5] docs: f2fs: wrap ASCII tables in literal blocks to fix LaTeX build
    https://git.kernel.org/jaegeuk/f2fs/c/c0ee17208345

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
