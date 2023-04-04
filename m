Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5086D55CB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 03:18:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjVJc-0007mH-7I;
	Tue, 04 Apr 2023 01:18:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pjVJa-0007mB-OJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 01:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=//ZW0TEZujqY4La+qdggtKnadXfW1RDj35TArO/EaKU=; b=kdPVegzBujL1gM8iwIDYXJ2rTt
 4EHvYS5EgtgPafn2f/ZnUSFULQGNOd/RX72v5FgKbCS2rRM4cr+NelCjaZCOeR/eZarmISoHwsXmQ
 yDULr7vpjlnzqZKxenxW+qvu0APsFLQSEAZSL0bYLhi7wH5fGoV13trZftxhMse1y+Wc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=//ZW0TEZujqY4La+qdggtKnadXfW1RDj35TArO/EaKU=; b=N0cVdlfeVAPIFCOdrI80w7Npsx
 I92XeF9FoilNQdzNxM1UfavaeuJb1Vqi7QICBetUjM0gq/t1qlGM6M3PQ/5BPayoEuZlcFm3RZgag
 sEtmoZsCkd6KVw6wIeBfMX/58QOkginnomzwlvv3Yd69X4arTC3Fo/LNj9RUKXX2AM5U=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjVJZ-00EAB1-6j for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 01:18:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CCC3A61698
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  4 Apr 2023 01:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7498EC433EF;
 Tue,  4 Apr 2023 01:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680571099;
 bh=omvd1hoh8VRO0NpDO8klPxjFF4gsouVc4emYNNhV+x0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=QqWBg9qvN/7v6mfGsRigTTa1XLb2wufnvh1I5ezXp3RTvT1D2UL3oiqMcLUTwGLAe
 ZWwmXOdG4Z0Od6LQw1ZqPXXa/8VVcUwdTv7deH8F6xkCKxwZAU9Vp0nxYWEnd3z5pE
 1N7YfHM5LG2SMHsZ+ISwW9QNxh+kKi209HTEsT3QKl6qTnZMsiLc+baDmdTe+Jib9d
 wC1pPEh501SdPY0iBkyl4+kQVYh9HtBwsQfiOL0wYOnT+U9Y3ZlIc7heu/z8j/aitO
 SIlh9DYqBVjuferu2LB76GBNtcDXOxkpWM6pBlJ/AsIdIISOJ5Odj4JaDg8T7Go7Z4
 ELoh0B3+cbC1g==
Message-ID: <07d1c848-fd1e-7e5e-6b56-90ac2a1a86ef@kernel.org>
Date: Tue, 4 Apr 2023 09:18:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20230403165038.3018949-1-jaegeuk@kernel.org>
 <ZCsEytDjqEjQDPiO@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZCsEytDjqEjQDPiO@google.com>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/4 0:54, Jaegeuk Kim wrote: > We got a kernel panic
 if old_addr is NULL. > > https://bugzilla.kernel.org/show_bug.cgi?id=217266
 > > BUG: kernel NULL pointer dereference, address: 000000000000 [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjVJZ-00EAB1-6j
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix null pointer panic in
 tracepoint in __replace_atomic_write_block
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/4 0:54, Jaegeuk Kim wrote:
> We got a kernel panic if old_addr is NULL.
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=217266
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000000
>   Call Trace:
>    <TASK>
>    f2fs_commit_atomic_write+0x619/0x990 [f2fs a1b985b80f5babd6f3ea778384908880812bfa43]
>    __f2fs_ioctl+0xd8e/0x4080 [f2fs a1b985b80f5babd6f3ea778384908880812bfa43]
>    ? vfs_write+0x2ae/0x3f0
>    ? vfs_write+0x2ae/0x3f0
>    __x64_sys_ioctl+0x91/0xd0
>    do_syscall_64+0x5c/0x90
>    entry_SYSCALL_64_after_hwframe+0x72/0xdc
>   RIP: 0033:0x7f69095fe53f
> 
> Fixes: 2f3a9ae990a7 ("f2fs: introduce trace_f2fs_replace_atomic_write_block")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Thanks for fixing this. :)

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
