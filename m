Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F10572A1D47
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 Nov 2020 11:30:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZAdF-0003Gp-0r; Sun, 01 Nov 2020 10:30:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1kZAdC-0003Gg-Tb
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Nov 2020 10:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FSbv+vGAfbshFYcSeja7FJLP7k61ca1G5dRn0fz9+nM=; b=dDxVFNcx7luRSECfEnak8EOJSK
 5IyFO4NIhyktAqt49UNo050Fc6Prqjdqox1qFlNEwLZoWqmWiuxO9RcEiM9n4MpjzRTvZKv7kyDG5
 DhMBbRs9RfazY2fagcfikk5WHkoTs1RgFIYq+Bo07jMHXr23VtM+XXP6hABBNCqv6bFU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FSbv+vGAfbshFYcSeja7FJLP7k61ca1G5dRn0fz9+nM=; b=XAg2Kf9DhME5iT/fXd8bCtzbdB
 XMYcPKFSXzMmPg7vjdVrMwrOHBu31NAaz7r39+8aaR2nR2VO3Cssd2v7W0oWaEALBa8Lv+w/YyFYo
 njeFJfKKtv8PaDjqI5iA0SdR4hQaMvWn3245YUQoX0qzTkvf+06kV93larrip0vucvdg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZAd5-0053Tz-IN
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Nov 2020 10:30:38 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A957E20709;
 Sun,  1 Nov 2020 10:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604226621;
 bh=uBOxgKGox72Khbv7lHPCWHnvMnC3J+LhFgAQQopAVW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PsZc0CNMRSOPIv5SATUZJDagBRiPVhMPpvYxGP99Rcv0eGc6EZl9qE7oqL/xu8MGk
 UUdAcmz7buYJ05NClfswKpy601VQ96XPxL+xhlBJSXCrwztcGRm1GpsWPekHzqqfvn
 FCtbvR0HETcrhosbUWm8Tglq1ys0oNS6Aoli8J+s=
Date: Sun, 1 Nov 2020 11:31:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20201101103104.GB2558892@kroah.com>
References: <20201031195809.377983-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201031195809.377983-1-ebiggers@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kZAd5-0053Tz-IN
Subject: Re: [f2fs-dev] [PATCH 4.4] f2fs crypto: avoid unneeded memory
 allocation in ->readdir
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Oct 31, 2020 at 12:58:09PM -0700, Eric Biggers wrote:
> From: Chao Yu <yuchao0@huawei.com>
> 
> commit e06f86e61d7a67fe6e826010f57aa39c674f4b1b upstream.
> [This backport fixes a regression in 4.4-stable caused by commit
> 11a6e8f89521 ("f2fs: check memory boundary by insane namelen"), which
> depended on this missing commit.  This bad backport broke f2fs
> encryption because it moved the incrementing of 'bit_pos' to earlier in
> f2fs_fill_dentries() without accounting for it being used in the
> encrypted dir case.  This caused readdir() on encrypted directories to
> start failing.  Tested with 'kvm-xfstests -c f2fs -g encrypt'.]
> 
> When decrypting dirents in ->readdir, fscrypt_fname_disk_to_usr won't
> change content of original encrypted dirent, we don't need to allocate
> additional buffer for storing mirror of it, so get rid of it.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/f2fs/dir.c | 7 -------
>  1 file changed, 7 deletions(-)

Now queued up, thanks.

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
