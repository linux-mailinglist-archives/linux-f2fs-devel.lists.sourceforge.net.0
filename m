Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E96A57D8B5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jul 2022 04:43:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oEide-0000S0-Fm; Fri, 22 Jul 2022 02:43:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1oEidd-0000Ru-A5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 02:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tKoIBvSZM29jErQHIsMqOMGQZfSyzIGL2pSK8Iz96Kk=; b=KgEUSDoreerX+pAS+pBB0NNSaw
 8CDXKt2anjG23Da8FQFg1UWfBFqYTnply2SvrCf3B8CAbN/AvN+nIny6UdWQNW1yUYg7JNzwBI2Vp
 /Z5kUidTMldKedq1l4mN0qFrgn7TDEIaT9ZVDACQHROW/Fb60vMfzOHHLExe6XxN2pf8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tKoIBvSZM29jErQHIsMqOMGQZfSyzIGL2pSK8Iz96Kk=; b=b1kPAgTongbA7NrcDUkg31RKTr
 O2HPLxKbs2bxz66+8MKYrtqMEqclDsym7ELewHXNa2ePSz1lM8dx8xNpfk10jsqU4NtNfR/Ggnx5x
 8cPaZ7wMaYfPCRA/y04PMccw0wFVvK8D9NEVbm3Eq9VDYFRubn7q7Fv5ou0IY6/1i6uI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oEidX-0004qi-6x
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 02:43:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD23D6200E;
 Fri, 22 Jul 2022 02:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20340C3411E;
 Fri, 22 Jul 2022 02:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658457799;
 bh=/nLfBny++QJC2G15ji7Jr16oDuC0KkPWGQcXsMuiKi4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WLNsAbWq+O8lSxcCO5rRft70tFlZn2LKl/xrgVQtb6AH1C7Gogcg2orjH8O3xm6YF
 NRrv/lLVzrGQAMRDB0PppYtvxh6T/FPn0QydS6eh8pKkZZTwRYHtnGi79dHYQspO/I
 8zuyHIX/kYldyeUQPno2/XaEPHyjQCUCBYV5jP7QMzn7LfhiRA4iSoE3YAJYSGWYfm
 dBrBlno1TOhL32WFykL8e5RhK/dkX1j8V8wgjBzWh71ZZwSDmh4nYl9AVryWti3Qrb
 aIl/fwB1xtJCHHaeDj3Jy/lS+s7XSh6xYfpQam63QQJ50uIfEz5DFCv19SWdZaCwLf
 eD/3UGJ6W2zMw==
Date: Thu, 21 Jul 2022 19:43:17 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Guowei Du <duguoweisz@gmail.com>
Message-ID: <YtoOxTyWPFUpw/Y0@google.com>
References: <20220718081038.2279-1-duguoweisz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220718081038.2279-1-duguoweisz@gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/18,
 Guowei Du wrote: > From: duguowei <duguowei@xiaomi.com>
 > > If there are more than one f2fs sbi, there will be more > discard threads.
 But the comm is too long to show dev > minor. So, chang [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oEidX-0004qi-6x
Subject: Re: [f2fs-dev] [PATCH] f2fs: modify task name prefix
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
Cc: linux-kernel@vger.kernel.org, duguowei <duguowei@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/18, Guowei Du wrote:
> From: duguowei <duguowei@xiaomi.com>
> 
> If there are more than one f2fs sbi, there will be more
> discard threads. But the comm is too long to show dev
> minor. So, change the default prefix of thread from
> "f2fs_discard" to "f2fs_dcd".

That looks quite unreadable. What about unmap?

> 
> Before:
> $ ps -e | grep f2fs
> 1628 ?        00:00:00 f2fs_ckpt-7:10
> 1629 ?        00:00:00 f2fs_flush-7:10
> 1630 ?        00:00:00 f2fs_discard-7:
> 1631 ?        00:00:00 f2fs_gc-7:10
> 2030 ?        00:00:00 f2fs_ckpt-7:27
> 2031 ?        00:00:00 f2fs_flush-7:27
> 2032 ?        00:00:00 f2fs_discard-7:
> 2033 ?        00:00:00 f2fs_gc-7:27
> 
> After:
> $ ps -e | grep f2fs
> 1628 ?        00:00:00 f2fs_ckpt-7:10
> 1629 ?        00:00:00 f2fs_flush-7:10
> 1630 ?        00:00:00 f2fs_dcd-7:10
> 1631 ?        00:00:00 f2fs_gc-7:10
> 2030 ?        00:00:00 f2fs_ckpt-7:27
> 2031 ?        00:00:00 f2fs_flush-7:27
> 2032 ?        00:00:00 f2fs_dcd-7:27
> 2033 ?        00:00:00 f2fs_gc-7:27
> 
> Signed-off-by: duguowei <duguowei@xiaomi.com>
> ---
>  fs/f2fs/segment.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 874c1b9c41a2..2eeefcbe62db 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2018,7 +2018,7 @@ int f2fs_start_discard_thread(struct f2fs_sb_info *sbi)
>  		return 0;
>  
>  	dcc->f2fs_issue_discard = kthread_run(issue_discard_thread, sbi,
> -				"f2fs_discard-%u:%u", MAJOR(dev), MINOR(dev));
> +				"f2fs_dcd-%u:%u", MAJOR(dev), MINOR(dev));
>  	if (IS_ERR(dcc->f2fs_issue_discard))
>  		err = PTR_ERR(dcc->f2fs_issue_discard);
>  
> -- 
> 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
