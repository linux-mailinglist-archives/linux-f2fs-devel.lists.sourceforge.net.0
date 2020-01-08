Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED84C134158
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jan 2020 13:00:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ipA17-0007M0-Lj; Wed, 08 Jan 2020 12:00:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ipA17-0007Lq-7k
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 12:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VHb4xx4mUA9c2jNFSqmeUS3sGsBJPIkWF/AwJU3YUlY=; b=LgVhgcW/iHZT7Jp89IAsEtHpFX
 YYjozz0KxgsISiWFggIXVhzse5DLWRp10fsAbf4YBgZZMgGjmA7eD1qVpYW4H3CSgzdoSmGL1QTgd
 55NdJp9aU5K+wDl0k8H861IEuIt3Wq60BflOOcZRgP671sYncDmcV2GSn4o2D87nIz+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VHb4xx4mUA9c2jNFSqmeUS3sGsBJPIkWF/AwJU3YUlY=; b=QR3PSrzDYhMc+E8/r8Ni7r6Zdf
 OQjGGjM4VRXDkP2ZplAMUh5jdJp2vwZHHzvi0lavXtEBbRzdl/bvXy3RUG6+btStt6FW8+Gb2Q1wa
 rvo6mfSSW2csMr9Zj/unPZ+toX12/yemvXRm3xqtTcVxsCpDVznU68TsPf6xGWDLoWOo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ipA0y-00DGEt-7w
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 12:00:53 +0000
Received: from localhost (c-98-234-77-170.hsd1.ca.comcast.net [98.234.77.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 913C8206DA;
 Wed,  8 Jan 2020 12:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578484838;
 bh=PAeybtyZqMyHhLyEpHpzDmjvvQJloWmair75CBeupyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KPmwl6vUKd+QXJvtZC4rdu/sLQkl/MTU7te/IU0yxKEcRppY7tWZhgHRQDSq5Djxv
 0ni71UmBfqmN+A03d8v7yqM46L/+avh6CgeHl5qhOa13IeJVUh1fm+Jv2oha8hBWsU
 D35ILQM6l4skaYfuFnfrUWmsGvHXD+bZ3kFnVcJY=
Date: Wed, 8 Jan 2020 04:00:38 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200108120038.GB28331@jaegeuk-macbookpro.roam.corp.google.com>
References: <4c6cf8418236145f7124ac61eb2908ad@natalenko.name>
 <2c4cafd35d1595a62134203669d7c244@natalenko.name>
 <20200106183450.GC50058@jaegeuk-macbookpro.roam.corp.google.com>
 <ee2cb1d7a6c1b51e1c8277a8feaafe6d@natalenko.name>
 <815fbd14-0fbd-9c44-8d86-4ab13a12dc7f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <815fbd14-0fbd-9c44-8d86-4ab13a12dc7f@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
X-Headers-End: 1ipA0y-00DGEt-7w
Subject: Re: [f2fs-dev] Multidevice f2fs mount after disk rearrangement
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
Cc: linux-f2fs-devel@lists.sourceforge.net,
 Oleksandr Natalenko <oleksandr@natalenko.name>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/08, Chao Yu wrote:
> On 2020/1/7 2:40, Oleksandr Natalenko via Linux-f2fs-devel wrote:
> > Hi.
> > 
> > On 06.01.2020 19:34, Jaegeuk Kim wrote:
> >> Thank you for investigating this ahead of me. :) Yes, the device list 
> >> is stored
> >> in superblock, so hacking it manually should work.
> >>
> >> Let me think about a tool to tune that.
> > 
> > Thank you both for the replies.
> > 
> > IIUC, tune.f2fs is not there yet. I saw a submission, but I do not see 
> > it as accepted, right?
> > 
> > Having this in tune.f2fs would be fine (assuming the assertion is 
> > replaced with some meaningful hint message), but wouldn't it be more 
> > convenient for an ordinary user to have implemented something like:
> > 
> > # mount -t f2fs /dev/sdb -o nextdev=/dev/sdc /mnt/fs
> 
> Hmm... sounds reasonable, however, the risk is obvious, if we mount with wrong
> primary device, filesystem can be aware that with metadata sanity check, if we
> mount with wrong secondary/... devices by mistake (or intentionally, people
> may think filesystem should be aware illegal parameters....), filesystem won't
> be aware of that, then metadata/data will be inconsistent...
> 
> Although that may also happen when we use tunesb.f2fs, but fsck.f2fs can be
> followed to verify the modification of tunesb.f2fs, that would be much safer.
> 
> So I suggest we can do that in tools first, maybe implement nextdev mount option
> if we have added metadata in secondary/... device.

+1, it'd be risky for user to give the device list whenever mounting the
filesystem. There'll be subtle corner cases where f2fs needs to deal with
given ambiguous sets between superblock and mount option.

> 
> Thanks,
> 
> > 
> > Hm?
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
