Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F35663456
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Jan 2023 23:51:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pF0zI-0007JG-Gs;
	Mon, 09 Jan 2023 22:51:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pF0zE-0007Iu-DL
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jan 2023 22:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yr8frYcZlKmZXwxrlUgqlyqy7IY0y4rCTrO01bbneIQ=; b=SN2ErtPUfRZxs+cDNgxXLr+rFx
 6zbr6g7cTtGELP4h2pPreRbwauTitYNTrSzxEZ+4thHbuX7m7+DDPV6W49cbjYja6wW9zWwvMam7d
 sxLolMhrMkHX6t4m41+EJFVOv3EOOhURwXZT3c4VOrrXuR7UteVGaw0h6xqOVI03StQQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yr8frYcZlKmZXwxrlUgqlyqy7IY0y4rCTrO01bbneIQ=; b=VGRN+6JmTm+w04JIJ1hGWPGuWz
 XQOYVBdlv3xoCDjUpUhDWszteQSJbsCCNWoFBrKgYf+pKTygn152YL6Z5DEdsdqTPbRVIpX/l7XTz
 lpmQQj6RROmkKTNdZ0+Pypgs3z91Ty+alzeSlX52h+oycEREv9c5zl9UM/IX0+eCm7+0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pF0zD-00C4Ty-RQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jan 2023 22:51:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3C63861447;
 Mon,  9 Jan 2023 22:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 779F1C433F1;
 Mon,  9 Jan 2023 22:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673304674;
 bh=2UpUFwC82Fb4dTT0Yyly7IoKML7l+v+VN61ZdGQn780=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MlD2W+JFcKCEy2igDIBvaF6DUGVp0wi9HJupGXBN2odEKFnIAVz9waeHkKmq53DgB
 MO1JnRcxHFVvOyI6Qv/5VqaqMZZFHEKK7zOjXTy3DtKKV5Fv06q0n1WYvmQujpezGL
 Xyws1pdMK+0YgNp6Hl/vI9ZlNgqq59QoNAjbijKKNJUXdZVndogz+84MSVDxZvwh/A
 Pm66d2NUl9olurK9x9IR5nDjql16pYCB3jhi3oeu7+s9zkDlZ3NcBGGmpO0vWYy6r3
 pBark1/hH2rdpey5Vv7Y0E6vu1UviNrfrovI2AUluKEpPEl8gEW8GUrE60RC6nxNum
 z0CRdUabOZzTg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5C314E4D005; Mon,  9 Jan 2023 22:51:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167330467437.13717.6089635302778662185.git-patchwork-notify@kernel.org>
Date: Mon, 09 Jan 2023 22:51:14 +0000
References: <38010b42-afd3-5394-09df-2378b7b5d10f@omp.ru>
In-Reply-To: <38010b42-afd3-5394-09df-2378b7b5d10f@omp.ru>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 20 Dec 2022 20:17:32 +0300 you
 wrote: > In expand_inode_data(), the 'new_size' local variable is initialized
 to > the result of i_size_read(), however this value isn't ever used, so
 we > can d [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pF0zD-00C4Ty-RQ
Subject: Re: [f2fs-dev] [PATCH REPOST] f2fs: file: drop useless initializer
 in expand_inode_data()
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
Cc: jaegeuk@kernel.org, lvc-patches@linuxtesting.org,
 lvc-project@linuxtesting.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 20 Dec 2022 20:17:32 +0300 you wrote:
> In expand_inode_data(), the 'new_size' local variable is initialized to
> the result of i_size_read(), however this value isn't ever used,  so we
> can drop this initializer...
> 
> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
> analysis tool.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,REPOST] f2fs: file: drop useless initializer in expand_inode_data()
    https://git.kernel.org/jaegeuk/f2fs/c/39bee2e6acc2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
