Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E572E948602
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2024 01:31:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sb7AU-00012v-W0;
	Mon, 05 Aug 2024 23:31:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sb7AJ-00012A-Fe
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Aug 2024 23:31:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QI51opC7KD1vANyMspI/F92VlKxnx9igF/eL3mKOWfA=; b=NGwI4Xi+9QZDEUMd4CB5U7ng73
 DGMc6xVKsU50lY8coii+2j5EPaL2NWVKgA741gvyu6nEELbj3bPG1NTPNkNdL6gxqZQGbrgEaaJe4
 14pJseGFTOf7wbZsr++TYlVtxXfBvsLXDa8sdZ8GnWdXZ3nnFF1rx7V9CXsbiA7AZhbo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QI51opC7KD1vANyMspI/F92VlKxnx9igF/eL3mKOWfA=; b=BVsLZeUyAoRKYzFJpM67kwoXjk
 bU3A3ox+aeD5qznAQrBJdwN+A4UPENn6S4wXRc8FjsUWTs94WgF+Fk6kvZNR8B41uV4HbHrOpMmKc
 KY47xEh6qP3OIa6h4nSv8Eq5zp21EMZBY0rBHo1M2Wn2J5PFIhmsSme4mrA8I1gyxAoI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sb7AJ-00059y-FL for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Aug 2024 23:31:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C3786CE0BB0;
 Mon,  5 Aug 2024 23:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD84AC4AF11;
 Mon,  5 Aug 2024 23:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722900651;
 bh=Wh51ZHgQcyh0zd1MDxB5eTQ+FzwRqW7yMqfoRE3VMbk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CZAomYw5RPntrjFHWbtiFkfi3lM6eZ0tIoasIlqI3TLzWzel+O15SmXRmsS6cChFm
 0gT/M6cmKYRfjOdfYWxN9amf1siP93iJvdY5h/DsIdT3+5oH9WKJrE3FHo1QnjOB89
 yzBzOrzTRP2oFqjVzhLor79Ay01jI67L67KuVNPzsYrVUwJ8/ECe5NBUcFWwrgSWls
 NpTPYnMOwkT9XFAdrg848FnOibkgpIhgNYrzzKxhKEVjgWWF0/sQFbJZKa6wgZei1P
 t6n8xvXv/2ZJtWnUHtpxfEchf7K6yNgBH0r8sL0sdwN8lnO8Uc4FZ4LYTPSKccIrXM
 H1Wf18PTad1rg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C6BF0D20ABC; Mon,  5 Aug 2024 23:30:51 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <172290065181.2803.9692794676706839195.git-patchwork-notify@kernel.org>
Date: Mon, 05 Aug 2024 23:30:51 +0000
References: <1721975246-32345-1-git-send-email-zhiguo.niu@unisoc.com>
In-Reply-To: <1721975246-32345-1-git-send-email-zhiguo.niu@unisoc.com>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 26 Jul 2024 14:27:26 +0800 you
 wrote: > This is a supplement to commit 6d1451bf7f84 ("f2fs: fix to use
 per-inode
 maxbytes") > for some missed cases, also cleanup redundant code in f2fs_llseek.
 [...] Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sb7AJ-00059y-FL
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix to use per-inode maxbytes and
 cleanup
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 26 Jul 2024 14:27:26 +0800 you wrote:
> This is a supplement to commit 6d1451bf7f84 ("f2fs: fix to use per-inode maxbytes")
> for some missed cases, also cleanup redundant code in f2fs_llseek.
> 
> Cc: Chengguang Xu <cgxu519@mykernel.net>
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
> v2: use Macro F2FS_BLK_TO_BYTES
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,V2] f2fs: fix to use per-inode maxbytes and cleanup
    https://git.kernel.org/jaegeuk/f2fs/c/a6c12809975b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
