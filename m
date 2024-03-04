Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB98870967
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Mar 2024 19:20:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhCvc-0006AD-0u;
	Mon, 04 Mar 2024 18:20:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rhCvb-00069y-22
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 18:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F8VgTj8mX8lj/2DLnL6kPJHjX8TCvjNW/1HMPnUdz8U=; b=PvRfoXv/d+n2cd0h0hprSJXXlF
 e1eWeSoK5hnafegtIBzYbCINrese0bUVO2VbmMCTccd4BueXUiPk9kOCSN/KbX0iiIeCGRc1P8n4A
 RuVbONvZcIOyS6IIBqBj8xPzw6Y9ZpWdO1bQfuVt8Jot2RGmpgLhY5E8qxDaGrJg/clo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F8VgTj8mX8lj/2DLnL6kPJHjX8TCvjNW/1HMPnUdz8U=; b=nGbNHvZK44lcfS/hgGYvFkvDds
 zx6E0Sogu6+UDDTr8IPkJBoVUsJZ14+Bhiv0fAwmIJ2lBMdrI69oIX6T2yfKpvHK9Se5nNm7HPebo
 laEug4yqjAH0Ffipltf3jfSmi+XEDRLBuoWQ/LSjNScte0FZQonR+Sr8g5X6C16HLxd4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhCvU-0002g7-5Y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 18:20:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 950A1CE16AC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Mar 2024 18:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BC1EC4166C;
 Mon,  4 Mar 2024 18:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709576429;
 bh=t0ZE3fuXMKbZQWvtdv7075xw9wqlU8kEK4OZdYpNEnI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=X8Avz4dHUd89U6+LNm6Hfe0xsVR2mJePRT8J32cS95S+x6/PaCdn5u+jrxbHHPRkg
 gg+7vNXkZMg6fIWGTw73A4rPI9Vw/93nwPZQBwhNLyxnqXT7pbHQcm98lD/XsQLWQo
 pg+rWqlOd2kj+DuH82e6q/4IWYnv7FbsGIMZTrRRMzDfyFvylvSdamXRF3Xg+BLu3n
 UODi5xsPn7F9IhHgQXbq6PSs9CETuNwZXUTIYWcD7YME1XaEA15yaZ8DpQA+57/6Dv
 03Al+u5caf3hOxeADtIned0RuJF8LkcsGpBpIY3qN/iddai8atDleFEWtYiWkT0WJz
 d8xPYm6GsSNpQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0ADE1D88F8A; Mon,  4 Mar 2024 18:20:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170957642904.16816.7612730438346906986.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 18:20:29 +0000
References: <20240225063628.2086320-1-chao@kernel.org>
In-Reply-To: <20240225063628.2086320-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 25 Feb 2024 14:36:28 +0800 you
 wrote: > @type in f2fs_allocate_data_block() indicates log header's type,
 it > can be CURSEG_COLD_DATA_PINNED or CURSEG_ALL_DATA_ATGC, rather than >
 type of data [...] 
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rhCvU-0002g7-5Y
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to use correct segment type in
 f2fs_allocate_data_block()
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

On Sun, 25 Feb 2024 14:36:28 +0800 you wrote:
> @type in f2fs_allocate_data_block() indicates log header's type, it
> can be CURSEG_COLD_DATA_PINNED or CURSEG_ALL_DATA_ATGC, rather than
> type of data/node, however IS_DATASEG()/IS_NODESEG() only accept later
> one, fix it.
> 
> Fixes: 093749e296e2 ("f2fs: support age threshold based garbage collection")
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix to use correct segment type in f2fs_allocate_data_block()
    https://git.kernel.org/jaegeuk/f2fs/c/732485823782

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
