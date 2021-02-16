Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2FF31CD8B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Feb 2021 17:07:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lC2sI-0003PI-VQ; Tue, 16 Feb 2021 16:06:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lC2sH-0003Mh-Vt
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Feb 2021 16:06:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yXf2oib6au4qLmS/QGoeJRhPUBk6jwVbIKbisbBERUI=; b=TqG5981WPBFEfULqkcRVahT0JN
 0fWiN8dwr3zkvaN+fVb/fIHRecGWnGtGtluZLNaV+spbfHzDUtXXWulL5DNX7wRO37EkQCsBPEA30
 a9Ackt67DLeji+jP90g3kZEfrjveuk8Amc4wMq/meYxKpK6YNmd6o/g2MWhfBG65c5vU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yXf2oib6au4qLmS/QGoeJRhPUBk6jwVbIKbisbBERUI=; b=UEfjkrPnATmVtIX15TUI2q4YN/
 LHLXLU2Sn3JgQco0N+qCByn4UGcq8lKhLVvuH3LHr91Y9TgM/MvHu5Vz94J9N1qBtULTnfMlBMXcj
 9Gvi+99utcrgpwGss0173zzZS5VKTBFpNK6qwLQihWGTvHWOR3ElnkdnvzJZzsoW7/S8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lC2nX-0004io-O4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Feb 2021 16:02:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48EE064D9E;
 Tue, 16 Feb 2021 16:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613491314;
 bh=l6/5LBsbR707EoNddPeSU3FLZ1tinzwO70bFrC7F7OI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P6zK3DErAM/8NUCKP3gzL/NLfQ2GnoZNYLH82+6wJG3XmUCvqwANCpYcbw3iJ1v6h
 PIyO+NzhpmyCcqPrxClnAt1P75ZOJnniY3l4flC5+UgVgPysWC5op6dyfWHXg80lch
 vz/FVuiWiEo14WcLLDrgjWR4TSLY5X8J4X9Zd9Fc4w7yNOLhNwxSo2zVlXwlJRQxy2
 gUpSJctAE7nbyDRFGIQUg78Kq+5tuCUZ1MEQmDaBCk2hwqNOKpiQYj2+IPipvuoDT5
 l9sFdKtxLAtcH6VHjlDP4gn1rMDuZPxC8E8Ll8A+yERE699/37WgJyySJpZTNss1HT
 iEDloCm+PZG6A==
Date: Tue, 16 Feb 2021 08:01:52 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Park Ju Hyung <qkrwngud825@gmail.com>
Message-ID: <YCvscBgjQoD4cCMV@google.com>
References: <20210214094311.43639-1-qkrwngud825@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210214094311.43639-1-qkrwngud825@gmail.com>
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
X-Headers-End: 1lC2nX-0004io-O4
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: add VM disk files to hot data
 types
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

Thanks, applied. :)

On 02/14, Park Ju Hyung wrote:
> Similar to .db files, these are randomly updated extremely frequently.
> 
> Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
> ---
>  mkfs/f2fs_format.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> index a6c542e8e1f0..dbb5bb3e2ba7 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -96,6 +96,13 @@ const char *media_ext_lists[] = {
>  
>  const char *hot_ext_lists[] = {
>  	"db",
> +
> +#ifndef WITH_ANDROID
> +	/* Virtual machines */
> +	"vmdk", // VMware or VirtualBox
> +	"vdi", // VirtualBox
> +	"qcow2", // QEMU
> +#endif
>  	NULL
>  };
>  
> -- 
> 2.30.0
> 
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
