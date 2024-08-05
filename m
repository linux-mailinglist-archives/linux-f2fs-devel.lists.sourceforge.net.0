Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B491A948608
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2024 01:31:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sb7Aa-0007Lf-Hd;
	Mon, 05 Aug 2024 23:31:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sb7AT-0007K9-T3
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Aug 2024 23:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mohzRqGp0lB1XD6NTabSPNvOOfz9/mphFADFxt2Z3hY=; b=Uu6f+9RaE5SRX2Hoyy/g+XTIwW
 N9INKSfA5PBs8/tbW957Zj3NdRv5pj4n2BIiFbTseTvid1c2sOw3BwFXAT/uWIpZsl8mesFsaHJ67
 6BEk9LM3iteEMxh+95QsdCIzfQxQB1jMADAWg8fJdOVapFd521Syke1JnEikP+tmFUrc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mohzRqGp0lB1XD6NTabSPNvOOfz9/mphFADFxt2Z3hY=; b=Y2tOsnll+CddX13ZyxiaKjpZch
 csQD8QpzA4vE4Ydb/urDWnUC6zFfyhGVogLC8MREd63bdTjxUHhoxyrgaAMWGQnJhjIl215HpjnVr
 jfuYBnDPEd2wu+y3j1qrNfQkW7JJx8cjaJArJjUMdk4Ohm+23PyRm/kVtiITPOP6VEXE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sb7AS-0005BD-NJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Aug 2024 23:31:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E46F060EC9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  5 Aug 2024 23:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CCE8C4AF62;
 Mon,  5 Aug 2024 23:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722900652;
 bh=JB9tHugh5uz1t6hACHVOqtzb1kHKTIVf1m+7h7eV5Uk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jy4+WdYzgUpAAveKz+mEPJ8TCm1ihX4hZd7WwbqGxCXWYN7P30ZRJzo0GcKXjb6bW
 AhgDk0SQTWgRZxnbXRPhHpSo8d7p/ivP4NS582WZSmZ7JEKH9O0Cqd1L5qb1eNcABC
 k1xBa0PM8J2UlUSp41wOKDP/HkJ7TphzNXkx2EVlLp2tekZAh5SfZZHGGg2kRF6TTI
 c2XFbtkfhJht3sldXIVRjLyeCqxuD/dKvWpiNek2xbjPk9K90FdZbdb32PdburL8N2
 zLGgiE36yPE1c32OZ4X9WtG0YaNXHjadEYoNZQfDvdIbWP0A5dY5vlc6jmbG4yFo6N
 UyCTTKpDjH85A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 21668D20ABC; Mon,  5 Aug 2024 23:30:52 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <172290065212.2803.17197676609534608059.git-patchwork-notify@kernel.org>
Date: Mon, 05 Aug 2024 23:30:52 +0000
References: <20240627071521.1557830-1-chao@kernel.org>
In-Reply-To: <20240627071521.1557830-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 27 Jun 2024 15:15:21 +0800 you
 wrote: > If lfs mode is on, buffered read may race w/ OPU dio write as below, 
 > it may cause buffered read hits unwritten data unexpectly, and for > dio
 read, th [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
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
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sb7AS-0005BD-NJ
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to avoid racing in between read
 and OPU dio write
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

On Thu, 27 Jun 2024 15:15:21 +0800 you wrote:
> If lfs mode is on, buffered read may race w/ OPU dio write as below,
> it may cause buffered read hits unwritten data unexpectly, and for
> dio read, the race condition exists as well.
> 
> Thread A			Thread B
> - f2fs_file_write_iter
>  - f2fs_dio_write_iter
>   - __iomap_dio_rw
>    - f2fs_iomap_begin
>     - f2fs_map_blocks
>      - __allocate_data_block
>       - allocated blkaddr #x
>        - iomap_dio_submit_bio
> 				- f2fs_file_read_iter
> 				 - filemap_read
> 				  - f2fs_read_data_folio
> 				   - f2fs_mpage_readpages
> 				    - f2fs_map_blocks
> 				     : get blkaddr #x
> 				    - f2fs_submit_read_bio
> 				IRQ
> 				- f2fs_read_end_io
> 				 : read IO on blkaddr #x complete
> IRQ
> - iomap_dio_bio_end_io
>  : direct write IO on blkaddr #x complete
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3] f2fs: fix to avoid racing in between read and OPU dio write
    https://git.kernel.org/jaegeuk/f2fs/c/415ea641b020

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
