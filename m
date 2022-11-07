Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A313761FD90
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Nov 2022 19:30:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1os6se-0003Y1-Pp;
	Mon, 07 Nov 2022 18:29:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1os6sd-0003Xs-52
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Nov 2022 18:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4uj+R6UXJOeEzcSyLcUr21hQRVYaIuJRF1KetCA0k/A=; b=lS3bHpTrcnezeUCV+AMFLysyfE
 OXLC0dERozV4lNyy+yfWgI3DUy8vUMwiVCeCFiYkAdpFJfDDzMMGR3aa6iS4WLCmTM+I+295Q51z9
 O7G3KfP+lsQi5rgt/YRzu76dDPg9p2Rn/XBa27MgQUg3WXUAXdklrVXsYnAW6edD1KNw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4uj+R6UXJOeEzcSyLcUr21hQRVYaIuJRF1KetCA0k/A=; b=MQwRrV89VG12OS9Jgh8jBpFO+l
 iyN8ySxNmejA1HBzLbFaNngxIkvmtgaqpufSlTlqsx4pu7w6iiT02HnhE2l2sE1/1Q0/SBkAdfOeg
 8sNeb9Tkhtp6uwAVrB3iVlxWprnvOE33C1pOqm4VMIpOCE7GN2kik635a77VvHpPMr4I=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1os6sc-00052P-8F for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Nov 2022 18:29:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E98E3B81614;
 Mon,  7 Nov 2022 18:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4E8C433C1;
 Mon,  7 Nov 2022 18:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667845786;
 bh=RleFIJ19EIjYun3T5mhwYBHqIeaFPrPEjF/L+QsTRHA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W4HRnjIuj+Q7p+dL0+imqQPNyYDX+i+xNplmtZlhI+oOY1yuxhUSEienrlYmqdfib
 ybC2lLz9knzQTQo+9iWpKG1d7Pm7T66QNVQ9/Xy0zKyzDopJ7UxvSB/tVYp5eYhYBp
 sjl8g7jCXEYPrws5IA1HbuBmip5ZiU8R9eORXzJJwx7t843KEJEh2oub8c4PUvxSyB
 R67YnT2O3N6vNA/EcjYvGtvZAGv5XoL19ISvq9HWwOJ6LFCu+nsoXAIK/WVyDmyQN1
 kNqzRFpvV0XDXCv2I/8AZSFBld4GGIlXRSo8OsB3tzMnOnUYGf7HJ1R3wu6/6aXVAo
 tTBxsnn2aDnxw==
Date: Mon, 7 Nov 2022 10:29:44 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y2lOmCIt5gZmFJ5H@sol.localdomain>
References: <20221106094855.131967-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221106094855.131967-1-chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Nov 06, 2022 at 05:48:55PM +0800, Chao Yu wrote: >
 Wei Chen reports a kernel bug as blew: > > INFO: task syz-executor.0:29056
 blocked for more than 143 seconds. > Not tainted 5.15.0-rc5 #1 > " [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1os6sc-00052P-8F
Subject: Re: [f2fs-dev] [PATCH] f2fs: speed up f2fs_empty_dir()
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
Cc: Wei Chen <harperchen1110@gmail.com>, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Nov 06, 2022 at 05:48:55PM +0800, Chao Yu wrote:
> Wei Chen reports a kernel bug as blew:
> 
> INFO: task syz-executor.0:29056 blocked for more than 143 seconds.
>       Not tainted 5.15.0-rc5 #1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz-executor.0  state:D stack:14632 pid:29056 ppid:  6574 flags:0x00000004
> Call Trace:
>  __schedule+0x4a1/0x1720
>  schedule+0x36/0xe0
>  rwsem_down_write_slowpath+0x322/0x7a0
>  fscrypt_ioctl_set_policy+0x11f/0x2a0
>  __f2fs_ioctl+0x1a9f/0x5780
>  f2fs_ioctl+0x89/0x3a0
>  __x64_sys_ioctl+0xe8/0x140
>  do_syscall_64+0x34/0xb0
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> Eric did some investigation on this issue, quoted from reply of Eric:
> 
> "Well, the quality of this bug report has a lot to be desired (not on
> upstream kernel, reproducer is full of totally irrelevant stuff, not
> sent to the mailing list of the filesystem whose disk image is being
> fuzzed, etc.).  But what is going on is that f2fs_empty_dir() doesn't
> consider the case of a directory with an extremely large i_size on a
> malicious disk image.
> 
> Specifically, the reproducer mounts an f2fs image with a directory
> that has an i_size of 14814520042850357248, then calls
> FS_IOC_SET_ENCRYPTION_POLICY on it.
> 
> That results in a call to f2fs_empty_dir() to check whether the
> directory is empty.  f2fs_empty_dir() then iterates through all
> 3616826182336513 blocks the directory allegedly contains to check
> whether any contain anything.  i_rwsem is held during this, so
> anything else that tries to take it will hang."
> 
> In order to solve this issue, let's use f2fs_get_next_page_offset()
> to speed up iteration by skipping holes for all below functions:
> - f2fs_empty_dir
> - f2fs_readdir
> - find_in_level
> 
> The way why we can speed up iteration was described in
> 'commit 3cf4574705b4 ("f2fs: introduce get_next_page_offset to speed
> up SEEK_DATA")'.
> 
> Meanwhile, in f2fs_empty_dir(), let's use f2fs_find_data_page()
> instead f2fs_get_lock_data_page(), due to i_rwsem was held in
> caller of f2fs_empty_dir(), there shouldn't be any races, so it's
> fine to not lock dentry page during lookuping dirents in the page.
> 
> Link: https://lore.kernel.org/lkml/536944df-a0ae-1dd8-148f-510b476e1347@kernel.org/T/
> Reported-by: Wei Chen <harperchen1110@gmail.com>
> Cc: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/data.c | 17 ++++++++++++-----
>  fs/f2fs/dir.c  | 34 ++++++++++++++++++++++++----------
>  fs/f2fs/f2fs.h |  5 +++--
>  fs/f2fs/gc.c   |  4 ++--
>  4 files changed, 41 insertions(+), 19 deletions(-)

Thanks.  I'm not an expert on all the details, but this patch looks good to me.

Given that it optimizes lookups and readdirs too, a better title for the patch
might be something like "f2fs: optimize iteration over sparse directories".

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
