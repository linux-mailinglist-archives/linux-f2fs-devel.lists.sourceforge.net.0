Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E797522F3D2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Jul 2020 17:28:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k052t-0005lV-JA; Mon, 27 Jul 2020 15:28:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bevan@bi-co.net>) id 1k052s-0005lO-MU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jul 2020 15:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1897gRpuDRhCayoLAHbvsJmka5u5Fyietxk26kYdxeE=; b=CcUou4SzgyG9tyO2tgfcSawDBC
 AYhIvR8ihnmQJHY9RBeocEB25maAkXGFIuggIp4AUf9gJ7nDmIgaKvDkVMCx9uerEsTtLx/VPkT+g
 iLqEFxsiw8lTK6k5NHdtPLHeCS4up59Nf57tp5NuAtI7YfTZmVH63t6uQLvdOCehH+e0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1897gRpuDRhCayoLAHbvsJmka5u5Fyietxk26kYdxeE=; b=Ijbo8IUd/eD78h7SEHN5ytvO10
 udOBNKgcSnyiKGH63qBwDBoQBVxDVHRsMfy3fTWn7FURVOwX+Opa8Mh26CuFZ/HhA8qOdyLFqmEu5
 phAHEpsnM6xm7Tal6V3wO2eD9rlWJDnIpBnanuaoFUH6/bIMhRIgZegU0unWJ7nRBgBg=;
Received: from voltaic.bi-co.net ([134.119.3.22])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k052n-004C8P-Vy
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jul 2020 15:28:06 +0000
Received: from zenpad (aftr-95-222-27-128.unity-media.net [95.222.27.128])
 by voltaic.bi-co.net (Postfix) with ESMTPSA id C7D5220937;
 Mon, 27 Jul 2020 17:02:54 +0200 (CEST)
Message-ID: <8e0c3d4372c46ba587e26f5633d3eadf21fb648c.camel@bi-co.net>
From: Michael =?ISO-8859-1?Q?La=DF?= <bevan@bi-co.net>
To: Chao Yu <yuchao0@huawei.com>, Norbert Lange <nolange79@gmail.com>
Date: Mon, 27 Jul 2020 17:02:54 +0200
In-Reply-To: <c05c0e81-ea55-99e0-0060-df803b3586b6@huawei.com>
References: <f3094e40-13ff-ea31-faf1-9e78867f4a8d@huawei.com>
 <20200724081125.3376-1-nolange79@gmail.com>
 <c05c0e81-ea55-99e0-0060-df803b3586b6@huawei.com>
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1k052n-004C8P-Vy
Subject: Re: [f2fs-dev] Possible issues with fsck of f2fs root
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Am Samstag, den 25.07.2020, 10:06 +0800 schrieb Chao Yu:
> On 2020/7/24 16:11, Norbert Lange wrote:
> > 
> > $ fsck.f2fs -a /dev/mmcblk0p5; echo $?
> > Info: Fix the reported corruption.
> > Info: Mounted device!
> > Info: Check FS only on RO mounted device
> > Error: Failed to open the device!
> > 255
> 
> I tried ext4, it acts the same as f2fs... except different return
> value.
> 
> fsck -t ext4 -a /dev/zram1; echo $?
> fsck 1.45.0 (6-Mar-2019)
> /dev/zram1 is mounted.
> e2fsck: Cannot continue, aborting.
> 
> 
> 8
> 
> fsck -t ext4 -a -f /dev/zram1; echo $?
> fsck 1.45.0 (6-Mar-2019)
> Warning!  /dev/zram1 is mounted.
> /dev/zram1: 11/1179648 files (0.0% non-contiguous), 118065/4718592
> blocks
> 0
> 
> I'd like to know what behavior of fsck does systemd expect?
> fsck -a should work (check & report or check & report & repaire)
> on readonly mounted device?

I think the return value is exactly the problem here. See fsck(8) (
https://linux.die.net/man/8/fsck) which specifies the return values.
Systemd looks at these and decides how to proceed:

https://github.com/systemd/systemd/blob/a859abf062cef1511e4879c4ee39c6036ebeaec8/src/fsck/fsck.c#L407

That means, if fsck.f2fs returns 255, then
the FSCK_SYSTEM_SHOULD_REBOOT bit is set and systemd will reboot.

Best regards,
Michael



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
