Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D8E74927F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jul 2023 02:18:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHChd-00061w-9Z;
	Thu, 06 Jul 2023 00:18:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qHChY-00061h-8c
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 00:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I9j04/I1S7+3cFTAbgiD9QSlOTdyw3ycSGVvSrPmnms=; b=JOKmVe/nTLiO2QitPk2QW5XTxb
 7b5mOSje1U+ao+TWf5Se5+KP3TmMNLe6xsvLiMRo2+JFIR3hF4nD8Bb/fp6sDVCBT0TfiVXf77yoS
 CyEk3krpITCfgE1ClQn/mq2udCKZD9off+Y3zlyueg+jSY2X4pgMvkxcGDmEehqByIR4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I9j04/I1S7+3cFTAbgiD9QSlOTdyw3ycSGVvSrPmnms=; b=PoUkXWF+mQp0mO6BlMuCxIA1i9
 0X3GMMbbcDL1lUugxFKPZ5eUHf01MFhrm5GAhjUQ7ysjEogZRHzdMMAu8gpVvxzG92dCZOrU6PD+w
 ArxszRuYSnChd6bturuT+y7hJrK6sXV269ZnJZ3p91Ofbmi/fD1VD4GfEIv2ZJMWy1+I=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHChY-007tJN-92 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 00:18:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B73C961843;
 Thu,  6 Jul 2023 00:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 123E5C433B7;
 Thu,  6 Jul 2023 00:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688602695;
 bh=n19H1bNzyKgXIdlxXeVLq/pVMrGObknKs8lwRwrUP90=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=L0+ViUP6R7pGw/hqVLlqlhVenRrVaizDIJiQDp1b5Nqfi/6MgrNNXgX5VOirFTZr7
 7G2hYmfDpiRL3WvTUeFd59G3OFJRltfq5vjRmdiVeXUDS5iHVk94kuNxgIJvLWauzz
 mOXsaxvGRndBuMlcYOA8xzWMF3/drk2LGQqLXrTBzoBBoUMHRSS+fdSjOaMH2sFyQ7
 P1CSil5dqpGkX8VsubftoxF+dV2Wq47plE0wRTG6SzKcnFMWZkgMxW8aXW/6GWn+fb
 YyXFEztb5MEZ+ZIIluSVdTxp0rAQnRWpkjk3UZcTo8t6giHCCuMHOnirYJ77EyxIf9
 LhoISi3RR/cJw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 DA85AC691F0; Thu,  6 Jul 2023 00:18:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168860269488.29151.5197726531516627453.git-patchwork-notify@kernel.org>
Date: Thu, 06 Jul 2023 00:18:14 +0000
References: <20230522135018.2742245-20-dhowells@redhat.com>
In-Reply-To: <20230522135018.2742245-20-dhowells@redhat.com>
To: David Howells <dhowells@redhat.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jens Axboe <axboe@kernel.dk>: On Mon, 22 May 2023 14:50:06 +0100 you wrote:
 > Provide a splice_read wrapper for f2fs. This does some checks and tracing
 > before calling filemap_splice_read() and will update the iostats > afterward
 [...] Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHChY-007tJN-92
Subject: Re: [f2fs-dev] [PATCH v22 19/31] f2fs: Provide a splice-read wrapper
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, hdanton@sina.com,
 jack@suse.cz, david@redhat.com, logang@deltatee.com, jlayton@kernel.org,
 brauner@kernel.org, willy@infradead.org, linux-kernel@vger.kernel.org,
 hch@infradead.org, linux-mm@kvack.org, viro@zeniv.linux.org.uk, jgg@nvidia.com,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, torvalds@linux-foundation.org,
 hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jens Axboe <axboe@kernel.dk>:

On Mon, 22 May 2023 14:50:06 +0100 you wrote:
> Provide a splice_read wrapper for f2fs.  This does some checks and tracing
> before calling filemap_splice_read() and will update the iostats
> afterwards.  Direct I/O is handled by the caller.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Christoph Hellwig <hch@lst.de>
> cc: Al Viro <viro@zeniv.linux.org.uk>
> cc: Jens Axboe <axboe@kernel.dk>
> cc: Jaegeuk Kim <jaegeuk@kernel.org>
> cc: Chao Yu <chao@kernel.org>
> cc: linux-f2fs-devel@lists.sourceforge.net
> cc: linux-fsdevel@vger.kernel.org
> cc: linux-block@vger.kernel.org
> cc: linux-mm@kvack.org
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v22,19/31] f2fs: Provide a splice-read wrapper
    https://git.kernel.org/jaegeuk/f2fs/c/ceb11d0e2da2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
