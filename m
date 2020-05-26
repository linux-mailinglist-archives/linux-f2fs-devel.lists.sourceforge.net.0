Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0275B1E1954
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2020 04:27:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jdPJ7-0001nh-5Q; Tue, 26 May 2020 02:27:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jdPIz-0001nE-7I
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 May 2020 02:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AzjylsIp10OlAuluBdfJmKZKediat9Q+S5OGzdPhinU=; b=ens6dKImv+URFp4168iJUcdv2D
 3907wU+48I5Zujetv4BRgfaaF8A0ADtaXKEJ5KyZgSMdM4kCdDt470c8yj9i1EknQtjWzgAxXnOnO
 ydQOKnMW9mtCG1C1WJGiPxvjLQrnNNOn01/CwaABZWdoOTaKmZTAjqsjdjd/IjgEgJcA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AzjylsIp10OlAuluBdfJmKZKediat9Q+S5OGzdPhinU=; b=M3HbSFLZ47usd5Ti3q2ve1NWYy
 D+qPKfpuLkx7xjZF7WzelIxXB/QxP3W0E/MMjkMv7IqEyWnKUe0YCZb3HSyB6oshh9Ai0rbwJ3XS2
 QQEe017xWM3GMoEqLbAcIJ3MtLqETj/J5/1+LiULSZugt3PkcreAOgy5/R/bj8T511p0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jdPIx-0073v2-Oq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 May 2020 02:27:01 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39E75207CB;
 Tue, 26 May 2020 02:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590460007;
 bh=IRexk2qEq0V/2dZrkQJ/vuTfY8AyigncyrAexqvlikw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pf4UFIuRIcBgi5zETsDt+9a4y5XQtcgbzJWhRscy6EZTyCitLXo6fyppesanvnsB+
 j+U0oXCYJtdcSnSpIMhZ+8xuslVddZoc3+dXEIPT+xXNZT6ZnK/HuWvOp/B2d/r5BP
 VdQRh7rUbRCvj3L4pnwsQeHN+x3KWwQpWKDnHqxE=
Date: Mon, 25 May 2020 19:26:46 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200526022646.GA226136@google.com>
References: <20200526015917.GB207949@google.com>
 <9a09da49-9b3d-68c3-f47f-40bb7e4309b8@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a09da49-9b3d-68c3-f47f-40bb7e4309b8@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: run.sh]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jdPIx-0073v2-Oq
Subject: Re: [f2fs-dev] Discard issue
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
Cc: Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/26, Chao Yu wrote:
> Hi Jaegeuk,
> 
> On 2020/5/26 9:59, Jaegeuk Kim wrote:
> > Hi Chao,
> > 
> > I'm hitting segment.c:1065 when running longer fsstress (1000s) with error
> 
> (1000s) do you mean time in single round or total time of multi rounds?
> 
> > injection. Do you have any issue from your side?
> 
> I haven't hit that before, in my test, in single round, fsstress won't last long
> time (normally about 10s+ for each round).
> 
> Below is por_fsstress() implementation in my code base:
> 
> por_fsstress()
> {
>         _fs_opts
> 
>         while true; do
>                 ltp/fsstress -x "echo 3 > /proc/sys/vm/drop_caches" -X 10 -r -f fsync=8 -f sync=0 -f write=4 -f dwrite=2 -f truncate=6 -f allocsp=0 -f bulkstat=0 -f bulkstat1=0 -f freesp=0 -f zero=1 -f collapse=1 -f insert=1 -f resvsp=0 -f unresvsp=0 -S t -p 20 -n 200000 -d $TESTDIR/test &
>                 sleep 10
>                 src/godown $TESTDIR
>                 killall fsstress
>                 sleep 5
>                 umount $TESTDIR
>                 if [ $? -ne 0 ]; then
>                         for i in `seq 1 50`
>                         do
>                                 umount $TESTDIR
>                                 if [ $? -eq 0]; then
>                                         break
>                                 fi
>                                 sleep 5
>                         done
>                 fi
>                 echo 3 > /proc/sys/vm/drop_caches
>                 _fsck
>                 _mount f2fs
>                 rm $TESTDIR/testfile
>                 touch $TESTDIR/testfile
>                 umount $TESTDIR
>                 _fsck
>                 _mount f2fs
>                 _rm_50
>         done
> }
> 
> Did you update this code?
> 
> Could you share more test configuration, like mkfs option, device size, mount option,
> new por_fsstress() implementation if it exists? I can try to reproduce this issue
> in my env.

I just changed, in __run_godown_fsstress(), sleep 1000 instead of 10.

https://github.com/jaegeuk/xfstests-f2fs/blob/f2fs/run.sh#L249

./run.sh por_fsstress

> 
> Thanks,
> 
> > 
> > Thanks,
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
