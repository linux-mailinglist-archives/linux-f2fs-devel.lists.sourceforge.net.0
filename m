Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF002214FA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jul 2020 21:18:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jvmvH-0000mP-Q0; Wed, 15 Jul 2020 19:18:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jvmvG-0000mG-GL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 19:18:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3gOgDJJ53W7R0CaXk11WYNT0jgUvBPDsRL0KumXlNpI=; b=h1yIHdvUwYT9Fw13wtQlNvbzyh
 kn2AZuju7BizQU6hjb2gADoWDBhlJ8jS3uyH2gxdK+TXoc4lj9hOZQ8APzQG1dEY49jaEyT/LJ3J1
 UZnhdwk1KqkVZ4HeqwcFJrRvvevgQkNeU8ZeqGQ1HOM9xUhAA7RWcWSy/Asdumzy5oRA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3gOgDJJ53W7R0CaXk11WYNT0jgUvBPDsRL0KumXlNpI=; b=K8gz8OXdiafr7yKlHu6cH6goot
 WU5Ejnq6Ne7Ut3DYOq8kgHlvDPCyyMfR+kj2t6xHjrlgxxZO1vP0UU7g2yUN4iKFG6zgJUq7/6w91
 n7C/kEJfAPPwcTKTy6W56+h4ROBhxVbXsoJkqwNuO0MFZRUnBKW2ZWQfZYaqgMRRg1UY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jvmvF-0099xP-5h
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 19:18:30 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D6822076C;
 Wed, 15 Jul 2020 19:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594840696;
 bh=6OFnwX9SjEpu5k0FpggHzzKLn9u2xyHn166yQlSt5qo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B3esGzS0lNeGVnwxh5w5IW4VtXheLYYupUJPUnMKHXDts/297oRxh+qzrk6CvUFVO
 xrfAlj2LpPmyCNAbsieWE45L5Skua/EcN99TZ//hCVTG7dGS9HPkUKjjri90mgf0JB
 Frt0ofrnANaIdAdE4M5tLOYV0Cr2oLN0YuYykCAs=
Date: Wed, 15 Jul 2020 12:18:16 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: lampahome <pahome.chen@mirlab.org>
Message-ID: <20200715191816.GC2232118@google.com>
References: <CAB3eZftzcywNU-cf7mRWqtj-74VqgzLHC32a6v_CycVcRsiu0A@mail.gmail.com>
 <20200710034114.GG545837@google.com>
 <CAB3eZfuaBhGPHDCt8v_9MrFW1byni17wzLtwG-Ny40q6jj9jkw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB3eZfuaBhGPHDCt8v_9MrFW1byni17wzLtwG-Ny40q6jj9jkw@mail.gmail.com>
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvmvF-0099xP-5h
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

This needs to be like this.
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/tree/tools/f2fs_io/f2fs_io.c#n357

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
