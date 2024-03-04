Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2F0870966
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Mar 2024 19:20:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhCvW-0002TP-CC;
	Mon, 04 Mar 2024 18:20:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rhCvT-0002TG-2H
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 18:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gaef5BaaM1j0lTjSKD5TKPYlspQaNhVe2LhNiV4YyhU=; b=SrB0094msAdmG/gsj8EelA+CDz
 1+o4PkeM13BvUQQGXvkCzUUe2AD0bpWTYdiWOT3AnV2jNEQW+O11fxcTNhUu110+3WXtfB2ACtvTB
 L9B3HvOBmpshqmSfa+fydcaV5ymjHGHXmsTQzTrrAgw3XBGkXXReYLpE9sKHzvCJTMkE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gaef5BaaM1j0lTjSKD5TKPYlspQaNhVe2LhNiV4YyhU=; b=EjDj1G+ozbiAleY5MNtP+3WM1d
 NCdNqHmtzbkyQr7imE3QDgEXTZzEpa/7hfzsqf9mhzEfmsi9u8cxiz8BLpuHS6gCDUZewg5UdDugZ
 70XIm6TZVNMZyOgHc+9K7X7w7ijD7V+zRaJNM6XBeFn1TVFv+aFP/hEOSMeP7e3GKpNs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhCvN-0002fa-C5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 18:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 024E161049
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Mar 2024 18:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 113D1C43330;
 Mon,  4 Mar 2024 18:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709576429;
 bh=lTbK2fW4sd5g7yN9587jwyOUJdCj3ya2dZC91nk0tOM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Cpm8IWRmhRN6aGArbKrbu6AynKWoRY3VFI74Yhsj6b1GKa0eJAyAafpc+KdMcMrju
 oEkbgyffn5N4+IHT5Jzylw38cxhzk7jA00GSPLZoYHuVQqom3j4zrPxKh20ZayAnjH
 DlI5aWOd+3twcQd4Sovd21Y618Sjd3zDPC7xk9+wbvAANeVQg+I3yiCaOJIrXUVkZZ
 U5Z9LpLWcm8wH169HGsqlKukpj8i4qav4B9cTqwyLj5sG0ymnAGiwBPtluujy09wXm
 NV/s653c4ozrKDFMqEXFoiBNu4nBJtYmpSKASaiFvFHXKixpAwKAmR6W/9AXpvn2w7
 NEBGPDBXCNA8Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 F109DD9A4BB; Mon,  4 Mar 2024 18:20:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170957642898.16816.15329403645520818007.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 18:20:28 +0000
References: <20240226031916.2420870-1-chao@kernel.org>
In-Reply-To: <20240226031916.2420870-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 26 Feb 2024 11:19:16 +0800 you
 wrote: > In f2fs_insert_range(),
 it missed to check return value of > filemap_write_and_wait_range(), 
 fix it. > > Meanwhile, just return error number once __exch [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1rhCvN-0002fa-C5
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to check return value in
 f2fs_insert_range()
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

On Mon, 26 Feb 2024 11:19:16 +0800 you wrote:
> In f2fs_insert_range(), it missed to check return value of
> filemap_write_and_wait_range(), fix it.
> 
> Meanwhile, just return error number once __exchange_data_block()
> fails.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to check return value in f2fs_insert_range()
    https://git.kernel.org/jaegeuk/f2fs/c/2fc2bcc8d399

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
