Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FD1312258
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Feb 2021 09:02:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l8f1B-0001ex-Rk; Sun, 07 Feb 2021 08:02:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1l8f1A-0001ep-FG
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Feb 2021 08:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j4FUk3nM5YOPvP8qEdTCpRD68yUTdM+3Ie9EAwqcZ0E=; b=K/6rNzaB0gy+xAWhKPoLnvqLbc
 KLhmJn7fopRF2G5lREWD10xT+izlZtnG2TgWSZtgtc2VftoKqNk2TIH2ne4JfNCNg8zF1St8nS312
 rFPtwNTG8IxgmWfF/qdZ4ShB5tqj2Ot/I4HYZl/M57DaPNbQeBkHdXv2t1e/KYD29XD0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j4FUk3nM5YOPvP8qEdTCpRD68yUTdM+3Ie9EAwqcZ0E=; b=Cqfw8HZ5wdBsgm4q6NY5Nj7/CF
 ohLomRONGuNF0UtqhxreV7EPVPaJxa8jUAhDSS2rlW/sJcxbeb3RESCzejg+HLDU9EezZqFpDT8XB
 0kCWDEjEM22mXwosTerOEJfytfEPTGd/g6id4RMOGoykKNyl2+IK2nF1Tu2uTiyZHuio=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1l8f0z-0007zt-4s
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Feb 2021 08:02:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BA2C64E02;
 Sun,  7 Feb 2021 08:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612684907;
 bh=JQzrq1MRRknUQVbsQI9IjA///ymlH5drgaU78MxNp4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kGxAEFMHm4BZoeFf1tOFxeRr7r09QtjCoBTxFRDdxsUEvSYRG+itkNzvROaEzHlzq
 cAGv8CwZ+x5cIMwK0vR9H5kWd+IMJUXKT8K/wSNQu/lM/K7zLZnJWhTl3OKMiHPFd0
 dEJ6nsD0RbRS9DwGVcPXikGC45FoEfDIlSPAlVbRzGQowU8XZawCB/Sii2XAEkQJSs
 g2EgBCSVOL5aT/jTa48oVBOLuYj4kyEF+zfsQlVQiUp+h/qB3dSXYy1RALtMB/V305
 x/g5ovIJy3IaLvVsU0ZBaKW9LCdhPZMX7DzhVmX+Wbte7vomS6KRc4shYZp6bn3c/g
 gcGo6QU6Vhk7g==
Date: Sun, 7 Feb 2021 00:01:45 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YB+ead3SvsQy5ULH@sol.localdomain>
References: <20210115181819.34732-1-ebiggers@kernel.org>
 <20210115181819.34732-4-ebiggers@kernel.org>
 <107cf2f2-a6fe-57c2-d17d-57679d7c612d@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <107cf2f2-a6fe-57c2-d17d-57679d7c612d@huawei.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l8f0z-0007zt-4s
Subject: Re: [f2fs-dev] [PATCH 3/6] fs-verity: add
 FS_IOC_READ_VERITY_METADATA ioctl
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Feb 07, 2021 at 03:46:43PM +0800, Chao Yu wrote:
> Hi Eric,
> 
> On 2021/1/16 2:18, Eric Biggers wrote:
> > +static int f2fs_ioc_read_verity_metadata(struct file *filp, unsigned long arg)
> > +{
> > +	if (!f2fs_sb_has_verity(F2FS_I_SB(file_inode(filp))))
> > +		return -EOPNOTSUPP;
> 
> One case is after we update kernel image, f2fs module may no longer support
> compress algorithm which current file was compressed with, to avoid triggering
> IO with empty compress engine (struct f2fs_compress_ops pointer):
> 
> It needs to add f2fs_is_compress_backend_ready() check condition here?
> 
> Thanks,
> 
> > +
> > +	return fsverity_ioctl_read_metadata(filp, (const void __user *)arg);
> > +}

In that case it wouldn't have been possible to open the file, because
f2fs_file_open() checks for it.  So it's not necessary to repeat the same check
in every operation on the file descriptor.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
