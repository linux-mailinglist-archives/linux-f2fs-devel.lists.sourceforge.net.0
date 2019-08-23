Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AFA9B2F2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Aug 2019 17:04:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i1B7P-0001D0-14; Fri, 23 Aug 2019 15:04:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i1B7N-0001Cr-9A
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 15:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jrRVpj0CgyoVOoivgeCvrk1DvOi33KPZyMTcMqkiaZs=; b=kAyzaTFcw7yXruTrb3z3FxTNKC
 O8igkGHLORtJrhDrdKf66YTp/QEyqKu0IkuzzGXLracSkuMHR4oNhdfhPJAQNAU0yT0M2zVGRpsNj
 ydcid9SQZjCN1PwZlHxR5ykO9yudhMmSBR4hn7kmbqQumfbmRB3VDL6fKs1nOXemojmM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jrRVpj0CgyoVOoivgeCvrk1DvOi33KPZyMTcMqkiaZs=; b=KKmGFTIdg6S9CSVhPS2XPdsvlT
 YjBS/loJgIZIvtAPeKvWEVmGlXpc+uat4NUuYSiQYcsFqTXK3/ds5aylZYQ4d4NPuNgYhI/DkJptP
 qUHp6K5LHe6v4Tb73HvZ2fvTTxEW/PGJeTO60jfjxQSzIBWPD/xOvyd3Tp9GmooosaYM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i1B7M-00HXC2-0N
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 15:04:45 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 64D652133F;
 Fri, 23 Aug 2019 15:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566572678;
 bh=S7IRiPTB+mcbMOQ4u/zMRvy0kBdgByp4jelGLBzh1j0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fw84Td+SU6YfZiIvi7txGszFYVWeLQp/J5bSJE4bbr1L7ytEDpvo3HEWfuNGeF7de
 cgv+TFdeFr+p7jgWVG2sk39M7aLxAl7vfXoDtoyApeqtVOUKXORXlrcP+SOqkI74/d
 BliiNAgOIjqYyI15zSP0llVxdawF/0OkcOsF5ch0=
Date: Fri, 23 Aug 2019 08:04:37 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190823150437.GB35310@jaegeuk-macbookpro.roam.corp.google.com>
References: <3bc8584e-651c-9578-c25a-40c60b5cfbdb@huawei.com>
 <dfd847fe-0c6d-f2a1-db50-d637a685d13b@huawei.com>
 <20190822194915.GB99916@jaegeuk-macbookpro.roam.corp.google.com>
 <ca722330-d7f4-4e6b-8129-ae48357db85a@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca722330-d7f4-4e6b-8129-ae48357db85a@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i1B7M-00HXC2-0N
Subject: Re: [f2fs-dev] f2fs_symlink bug
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/23, Chao Yu wrote:
> On 2019/8/23 3:49, Jaegeuk Kim wrote:
> > On 08/21, Chao Yu wrote:
> >> Ping,
> >>
> >> On 2019/8/12 20:01, Chao Yu wrote:
> >>> Hi Jaegeuk,
> >>>
> >>> In por_fsstress testcase, fsck reports below inconsistent status, I found one
> >>> path can cause this case.
> >>>
> >>> [FIX] (fsck_chk_inode_blk:1002)  --> Symlink: recover 0x1425 with i_size=4096
> >>> [ASSERT] (fsck_chk_inode_blk:1030)  --> ino: 0x1425 chksum:0x6983d47, but
> >>> calculated one is: 0xdb284b35
> >>> [FIX] (fsck_chk_inode_blk:1036)  --> ino: 0x1425 recover, i_inode_checksum=
> >>> 0x6983d47 -> 0xdb284b35
> >>>
> >>> - f2fs_symlink
> >>>  - page_symlink failed -> f2fs_write_failed() will truncate size to zero
> >>>   - f2fs_unlink failed -> symlink inode w/o data will remain in fs
> >>>
> >>> Not sure, but one choice of fix is to treat symlink as fs meta like we did for
> >>> directory, so that checkpoint can take care of all data/node of symlink, any
> >>> thoughts?
> > 
> > Hmm, how's the possible to get very long path name requiring another data block?
> 
> It can with below script, which is actually existed case in fsstress.
> 
> #!/bin/bash
> 
> for (( i = 0; i < 4095; i++ )); do
>         if [ $((i % 255)) -eq 0 ]
>         then
>                 filename=$filename"/"
>         else
>                 filename=$filename"0"
>         fi
> done
> 
> ln -s $filename /f2fs_mount_point/symlink
> 
> > If it's fitted in inline_data, it's more easy to guarantee that, right?
> 
> If the length of symlink is 4095, not sure inline space is enough even we can
> compress symlink...

I meant real usecases larger than 3.5KB. There's no posix rule to guarantee
this. IOWs, it's known behavior across filesystems.

> 
> Thanks,
> 
> > 
> >>>
> >>>
> >>> _______________________________________________
> >>> Linux-f2fs-devel mailing list
> >>> Linux-f2fs-devel@lists.sourceforge.net
> >>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> >>> .
> >>>
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
