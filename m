Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DE4135155
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jan 2020 03:29:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ipNZv-0006KO-Ao; Thu, 09 Jan 2020 02:29:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ipNZt-0006K6-CZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jan 2020 02:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jJKUsylpIV/w5ceaWXY+6Q4M/JI58rLO1KoRdFxEvLU=; b=KI5LVJJ9qa/yxu7C0gn5QzI+ru
 3NM7KyrirQrmzVAH+qSxRRe3fYmvZJPhtafMUIw3744YnbSPguc1Vo+lSA0A8SJZo7NB3Pw5KryGz
 StY10iBQXLzFbRpwSEgy9rNo1t9uVZ83KT2e2URY4uWHPJFnrl6KuXvO/yN1VhMCcSuw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jJKUsylpIV/w5ceaWXY+6Q4M/JI58rLO1KoRdFxEvLU=; b=don6kHNtEtzKuXwn2piThevTQ5
 Y8+DSVcImqG29P7LkZtOu4i7+OSmCXFUtUQfHA2OFy8ynf89mNYq1sK5G9REWFk6XWHGExlK7Wx+b
 HMwLG6uXMyQQQMeB3NepuEwo3WImGQzf9ejpJjaTlTKFWxyvyGVexcqyMfsBjD2HADF8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ipNZr-00E0Ci-3j
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jan 2020 02:29:41 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D9B92067D;
 Thu,  9 Jan 2020 02:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578536971;
 bh=f7IEBaGJooV1gl0g+Lp0AXtQKquEJ4EFoMLUn+hicbw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ES2f5jyWm1lCHCPuuV0qkwtlxpfDqadLgkamg3skDnA9adkUQlA+NO7uqNmXMsp6A
 s4IsQaB1axAHV+PPNAivSZqSKpDDFxLkDikl4+gAFSR9hjq0n4uxp+SX4wOo2JzJkJ
 Vee5oPkecZJt968VEU8pS70Tqrw2MtLmSd+A3w2c=
Date: Wed, 8 Jan 2020 18:29:30 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>
Message-ID: <20200109022930.GC42219@jaegeuk-macbookpro.roam.corp.google.com>
References: <20200108182655.GA10257@lazy.lzy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108182655.GA10257@lazy.lzy>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ipNZr-00E0Ci-3j
Subject: Re: [f2fs-dev] TRIM issue
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On 01/08, Piergiorgio Sartor wrote:
> Hi all,
> 
> I've a small box, with Fedora 31 up-to-date.
> 
> The system has LUKS + LVM + f2fs.
> 
> Since kernel 5.3.16-300.fc31.x86_64 the fstrim.service,
> triggered by the systemd service fstrim.timer or from
> command line, does return an error:
> 
> Starting Discard unused blocks on filesystems from /etc/fstab...
> fstrim: /home: FITRIM ioctl failed: Read-only file system
> fstrim: /: FITRIM ioctl failed: Read-only file system
> fstrim.service: Main process exited, code=exited, status=32/n/a
> fstrim.service: Failed with result 'exit-code'.
> Failed to start Discard unused blocks on filesystems from /etc/fstab.

It smells like trying fstrim along with /etc/fstab before mounting the
partitions?

> 
> Note the following:
> 1) Both /home and / are rw
> 2) LUKS and LVM allow discard to the underlying device
> 3) An other PC, with same layout, but ext4, does work as expected
> 4) kernel 5.4.7-200.fc31.x86_64 (latest for f31) has same result
> 5) fstrim -vA or -va does not return an error, exit code is 0,
> but it always says 0 (zero) bytes are trimmed:
> 
> /home: 0 B (0 bytes) trimmed on /dev/mapper/fedora--server-home
> /: 0 B (0 bytes) trimmed on /dev/mapper/fedora--server-root

This is normal. Since f2fs issues discard commands asynchronously, fstrim
just collects discard candidates and returns right away. Later, it will
actually issue the candidates in background. Whereas, if it was mounted as
"-o nodiscard", fstrim will wait for whole discard commands being issued
and completed as you expect.

Thanks,

> 
> 6) mount shows that the f2fs mounts have "discard" flag
> 
> So, I suspect there is something with f2fs which somehow
> confuses the trimming process.
> 
> I had a quick search, but I could not find any other
> similar report, except one about systemd, but that
> does not seem related.
> 
> Any idea? Suggestions?
> Debugging possibilities?
> 
> Thanks a lot in advance,
> 
> bye,
> 
> -- 
> 
> piergiorgio
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
