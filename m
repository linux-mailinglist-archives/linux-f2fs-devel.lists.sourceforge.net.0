Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B485338F5B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Mar 2021 15:04:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lKiP8-0000HQ-Sc; Fri, 12 Mar 2021 14:04:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1lKiOz-0000Gs-Em
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Mar 2021 14:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QG6nGkZf4NuFjY4AOpFss6W+gTep3SauFypxHdCIQdw=; b=EfOBAwxOnug3zRaRHuBTtGNbsp
 8uLy3GGvXLqy5QaCNYNTnd4wC1p3oBzaTio/g4vcToQvrssCzRvubUVxD2VHLAY+1GIfVvAPAUInA
 hthe2Jov0qo8chs4yVHLZQmQsenAJyRK2tEdPG9LHOsFBvmCm1XL+yPU94LM0oS++deA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QG6nGkZf4NuFjY4AOpFss6W+gTep3SauFypxHdCIQdw=; b=G8IYLfwjXUN8CJWA15UBOiOKc2
 OzUMnOzjCvHGyZuNfkNOyDVpn3lNr32fD445swS99+eQQNz/R+JMPikIcIkzz1dzVe1QSNfDt0SP7
 S1vKB0GOYzvy+8DfhOWMYnZa30LgmEgC4cDsBBh2f/iI63XRKwQNHbqlQCbEO5rN8BKA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lKiOt-005i7P-IN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Mar 2021 14:04:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7BAD064FFB;
 Fri, 12 Mar 2021 14:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615557850;
 bh=Z08KZd6XrMC6qRWdyb9R0p3Owz2c8ouzIqWGshwdS5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vJE8acp0N06zbLPyerx23BzjyRy1DimyrdB/y9XdHQ+nQR0Jh0dZHJVWPdqJtJR1V
 fs65+hQUbaUrfleJ/Srfak8oSBFLXeEQ88fm0CdvIET/cI9thvVbsnJbCS93LRoziH
 YtXwJnQrNVNf4NDU1/Q/CoW5mwovfuLw5apyfsdk=
Date: Fri, 12 Mar 2021 15:04:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <YEt00vJ6oVfoRjSJ@kroah.com>
References: <20210312122531.2717093-1-daeho43@gmail.com>
 <YEtg8U7whCVV2tQt@kroah.com>
 <CACOAw_zhZ0OgT-KCBmD_H6_U=CZCNY44D-ojH2AZah2cbAvdAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_zhZ0OgT-KCBmD_H6_U=CZCNY44D-ojH2AZah2cbAvdAQ@mail.gmail.com>
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lKiOt-005i7P-IN
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: add sysfs nodes to get runtime
 compression stat
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

On Fri, Mar 12, 2021 at 10:56:13PM +0900, Daeho Jeong wrote:
> Thanks for suggesting me sysfs_emit().
> 
> For atomic values, actually, those are needed for writer part, not reader.
> 
> +#define add_compr_block_stat(inode, blocks)                            \
> +       do {                                                            \
> +               struct f2fs_sb_info *sbi = F2FS_I_SB(inode);            \
> +               int diff = F2FS_I(inode)->i_cluster_size - blocks;      \
> +               atomic64_add(blocks, &sbi->compr_written_block);        \
> +               atomic64_add(diff, &sbi->compr_saved_block);            \
> +       } while (0)
> 
> I needed a protection here, because they might be updated in the race condition.

Why?  What are you trying to protect from "racing" here?

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
