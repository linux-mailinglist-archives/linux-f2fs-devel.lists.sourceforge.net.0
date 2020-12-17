Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB96E2DCC6E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 07:25:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpmij-0007lv-FV; Thu, 17 Dec 2020 06:25:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kpmii-0007lg-KL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 06:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+idwvyCp9ssGCfWrPadw/r0jal+d5oZ+bNH6Ih5AT+w=; b=K8/E20S5V+OYMV/kfEf7rroOSt
 zStqXmjPkq/gw3oRoj4JIZ/ldeP1djBOg905eZrqUtioC+J8JNAwe9OurrXIDITL6Jv/qn0VXhL/L
 NJh3akiJVP5wTlzmt7xzmGBviZZPfHk9QXqD8KNmkmOy6wbcvuWh40ABAF7mQZYNFFhM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+idwvyCp9ssGCfWrPadw/r0jal+d5oZ+bNH6Ih5AT+w=; b=D1NRuedzeeEUWwyy2ydHUAY+TK
 BtuVDqVGtcmySNEEo630rkpVuxTP6UEA1kmdHG28QZzoE28qU1UR8y/aXVAhcagBkwP3cK85+CHe4
 tLHn814GhXkaLXL0jX2rw08zOYXHZKqqPBIcOmMf6ixkYUEpUIVmgU4sQvMJ6I6LDsXg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kpmiT-00HIdg-VQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 06:25:00 +0000
Date: Wed, 16 Dec 2020 22:24:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608186280;
 bh=OI+1faOQWmRfP51UoZ06kZld5a7lhf9RNyDAWFziIT8=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=FWi6ftQj38xjFTvUrALEwTWhOjHd5nkIiqIkkxHXtmz07vAGAUw/TwR2oDkzaeI7j
 7dBbHI28RhzCAroeVSyVYTwpJp5ql3s5h1UIPtNhg1hoYHM+Q/p+ICmrpXbvMZbB0p
 G78cKDCyga5hXknxNeDRtYMSCFRX5V9OG/IilXVfJmaCs44LC9DwGRGU4S1eRH73bJ
 eKEFo+bj68nGcdv8d1DvkonSP6RoYjogwusC9klP67YbzTKQ4byxCemXakGdczXy/i
 QvQJPtIay3R742Lu16Z2LlcNcINV979HrRAOD3lskYRemrJkr2BFkLxN6GPdQz14Z8
 3PzZbNiD1BapQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X9r5phvHEKL8K8RS@google.com>
References: <1607918093-204-1-git-send-email-guoweichao@oppo.com>
 <3a9ee603-5ad3-8ee5-7dff-d40bd47b3f9b@huawei.com>
 <08854b69-717e-672e-de85-f1e41c6edd9e@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08854b69-717e-672e-de85-f1e41c6edd9e@huawei.com>
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
 for more information. [URIs: oppo.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kpmiT-00HIdg-VQ
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to set inode->i_mode correctly for
 posix_acl_update_mode
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
Cc: fh@oppo.com, linux-f2fs-devel@lists.sourceforge.net,
 Bin Shu <shubin@oppo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/16, Chao Yu wrote:
> Jaegeuk,
> 
> Do you remember why we use i_acl_mode to store acl related mode?
> Can we get rid of it?

IIRC, it is used for error handling, so it seems we can't remove it.

> 
> Thanks,
> 
> On 2020/12/16 17:16, Chao Yu wrote:
> > On 2020/12/14 11:54, Weichao Guo wrote:
> > > We should update the ~S_IRWXUGO part of inode->i_mode in __setattr_copy,
> > > because posix_acl_update_mode updates mode based on inode->i_mode,
> > > which finally overwrites the ~S_IRWXUGO part of i_acl_mode with old i_mode.
> > > 
> > > Testcase to reproduce this bug:
> > > 0. adduser abc
> > > 1. mkfs.f2fs /dev/sdd
> > > 2. mount -t f2fs /dev/sdd /mnt/f2fs
> > > 3. mkdir /mnt/f2fs/test
> > > 4. setfacl -m u:abc:r /mnt/f2fs/test
> > > 5. chmod +s /mnt/f2fs/test
> > 
> > Good catch!
> > 
> > > 
> > > Signed-off-by: Weichao Guo <guoweichao@oppo.com>
> > > Signed-off-by: Bin Shu <shubin@oppo.com>
> > 
> > Reviewed-by: Chao Yu <yuchao0@huawei.com>
> > 
> > Thanks,
> > 
> > 
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
