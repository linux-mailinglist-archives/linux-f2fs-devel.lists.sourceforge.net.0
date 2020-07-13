Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BDD21DF36
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2020 19:57:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jv2hw-0001Je-Ac; Mon, 13 Jul 2020 17:57:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jv2hu-0001JS-Mj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jul 2020 17:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IDEDvZ1KhWCckkgm+pGeu6gQm9rIv3F0Ni7iMfynom8=; b=b6y51bCJAiCXpTthHWMCm+wc2z
 2JJb6UNJ5cL3mfI+dCAqGXuaF9I/Mf1WrK2XXsxI9jD+fgzwJlcElLbKyyT9ixMwdc0LWxtR2IzME
 cFHmom41xHlyM4gPlgw0JVj3k1QeuXY5AX5VAXujDZk+ovvFA11mWuC6n/OXnPSlRAzo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IDEDvZ1KhWCckkgm+pGeu6gQm9rIv3F0Ni7iMfynom8=; b=TYHRJywlJwoWqpzeJ1LhJ6KGg/
 DpvOO/qE2H+AxOUjoanWOzmdU+aueRq7t+ShSj7BjUHoI4K1dqCuXDX/brynuQt1q+VimcCJcHbfd
 hb0fMfJ4Ov2PwvrDYZU3E+298M90UwY//v6Bb7wUGU+qTueW2bA9lD3pnMSBe4xSsi4A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jv2hs-001nKN-Ld
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jul 2020 17:57:38 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EFC6A206F5;
 Mon, 13 Jul 2020 17:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594663039;
 bh=4lGqok9ZnMLUmMBJcKRnIAK2Gz+SOEYye9V1B97Hjds=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gCVD4DESvGA39dT5lS+tpqrkYSJ4mkM0oKPyr011us5cUkVWlN3Pq5iGQPpIrUXH4
 ZWxAzIy0ptsbHZLofYMVgUmlupsljctP0+Om9MjCxoXPrt3Gy85xpZgGf75PWa6hva
 t13PEPAlRzK+1c1k/eiTSpMAADrG52iscQ9DVWG4=
Date: Mon, 13 Jul 2020 10:57:18 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: lampahome <pahome.chen@mirlab.org>
Message-ID: <20200713175718.GA2910046@google.com>
References: <CAB3eZftzcywNU-cf7mRWqtj-74VqgzLHC32a6v_CycVcRsiu0A@mail.gmail.com>
 <20200710034114.GG545837@google.com>
 <CAB3eZfuaBhGPHDCt8v_9MrFW1byni17wzLtwG-Ny40q6jj9jkw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB3eZfuaBhGPHDCt8v_9MrFW1byni17wzLtwG-Ny40q6jj9jkw@mail.gmail.com>
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
X-Headers-End: 1jv2hs-001nKN-Ld
Subject: Re: [f2fs-dev] possible to allocate a full segment for a direct IO
 with blocksize 2MB?
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

On 07/10, lampahome wrote:
> >
> > 1. fd = create()
> > 2. ioctl(fd, F2FS_IOC_SET_PIN_FILE)
> > 3. fallocate(1GB)
> >  -> will allocate 2MB segments to the 1GB space
> >
> >
> I tried but it shows ioctl failed: Bad address.

Hmm, can I ask which kernel you're using?

Thanks,

> 
> Code below:
> #define _GNU_SOURCE
> #include <stdlib.h>
> #include <stdio.h>
> #include <sys/ioctl.h>
> #include <fcntl.h>
> #include <unistd.h>
> #include <string.h>
> #include <sys/param.h>
> #include <sys/types.h>
> #include <sys/stat.h>
> #include <stdint.h>
> 
> typedef uint32_t __u32;
> 
> #define F2FS_IOCTL_MAGIC                0xf5
> #define F2FS_IOC_SET_PIN_FILE           _IOW(F2FS_IOCTL_MAGIC, 13, __u32)
> 
> int main() {
>  char prefix[] = "/mnt/f2fsdir/";
>  char path[5][10] = {"ggg1","ggg2","ggg3","ggg4","ggg5"};
>  int i, num=1, ret;
>  int fd;
>  FILE *fp;
>  off_t off = 0;
>  off_t size = 512;
>  char buf[256];
>  mode_t mode = S_IWUSR | S_IWGRP | S_IWOTH | S_IRUSR | S_IRGRP | S_IROTH;
> 
> 
>  for (int j=0;j<num;j++) {
>   memset(buf, 0, sizeof(buf));
>   snprintf(buf, sizeof(buf), "%s%s", prefix, path[j]);
>   fd = creat(buf, mode);
>   if (fd < 0)
>    perror("open fd failed");
> 
>   ret = ioctl(fd, F2FS_IOC_SET_PIN_FILE);
>   if (ret < 0)
>    perror("ioctl failed");
> 
>   if (fallocate(fd, 0, off, size)<0)
>    perror("could not allocate");
> 
>   close(fd);
>  }
> 
>  return 0;
> }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
