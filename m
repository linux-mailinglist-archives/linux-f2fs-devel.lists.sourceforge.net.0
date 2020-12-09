Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8962D3D49
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Dec 2020 09:25:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmunJ-0001pJ-PT; Wed, 09 Dec 2020 08:25:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kmunI-0001p8-65
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 08:25:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6jMzCr/Q+TXCq7p10VEwBg2ba8cimNpalsDo4TTrWqw=; b=dSn7OO0R1KIGvu3UBEmJehHeBr
 3FnUVvJeuARVQdMqIyo3yndlrTVGRBwHhAPgqGIOPPXEY3XF4qYVlE3JasEElouCCtqxQyj5VOarl
 aX9UMDiZ0sY6WUhuLQ7cpdzmdTOed5rwe1JnDdsze+eArsbslsZNbvXyauzoTX4KqBQ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6jMzCr/Q+TXCq7p10VEwBg2ba8cimNpalsDo4TTrWqw=; b=KxuVus98s0PSfsI+L+z8byI1wr
 5HkD6rf23Iv26alhnFNfqQzBkLQY/EKWmbZZKeUdDpgfCh8/JoGHFnCPO2WPeBW/HQSoq/Ucn6yCG
 UNkhrZ2ZSNCqx9uKWKOLDN9CKQGXSKUYyLwPYRvOCRSQM9zKlDyFwvUHp+hrUXzP8fE8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmun9-004gQf-MJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 08:25:52 +0000
Date: Wed, 9 Dec 2020 00:25:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607502332;
 bh=PMrNU6Eh4JPyhHMH2Ub8x5UyuXOYpcnLJSiXjTAHbXM=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=PdowoOGBSvtDu6ax5/aLZsyKfM+igJDhhFfUVKGlMwjvoKHFI/I2pke6RWdkZm0//
 4QyK/myuXZstBgiEtXuR+RKyuyx9TVbAEw6zSpV7A5IZHuhtIPCMIzs1+rcDvmZcDX
 bxE8sHBL41JTgyVDFxEr1yJQ416ALgRIfN8y5tGvBrmUu2iM7e+NpONxkyREskBikI
 ejmYmH2Z/XSWg1V7yi8sTN6ctQ38WeWa6FDCTq7978gI17Bon+l4UcMNFXDsannTey
 uODEePtPU9XWGuak++Opi5/dMXAp/rj6zA7DtJixCdhzsmWm8wmHUeHsYSR8ASi3Wr
 a0bSP48j9zAHQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X9CJ+skrzIekm0lk@google.com>
References: <20201203065615.402494-1-daeho43@gmail.com>
 <86651979-2c6a-59de-a03d-9c0437703de5@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86651979-2c6a-59de-a03d-9c0437703de5@huawei.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kmun9-004gQf-MJ
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add F2FS_IOC_DECOMPRESS_FILE and
 F2FS_IOC_COMPRESS_FILE
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/09, Chao Yu wrote:
> On 2020/12/3 14:56, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> > +	f2fs_balance_fs(F2FS_I_SB(inode), true);
> 
> Trivial cleanup:
> 
> f2fs_balance_fs(sbi, true);
> 
> > +	f2fs_balance_fs(F2FS_I_SB(inode), true);
> 
> Ditto,
> 
> Jaegeuk could fix this directly?

Let's fix this later, since I'd like to freeze -next branch as much as possible.

> 
> Thanks,
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
