Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF9A3792EF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 17:43:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg84N-0000q1-79; Mon, 10 May 2021 15:43:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lg84L-0000pa-D4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 15:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BjFBsWPShV0xPJ8w68KgDHrrlD9GWtzsqFTijYhy34k=; b=Uxjg7OXfPylczqaABdc0pw6sMA
 cRF1Rb90INNOefud/gyCWehwGF3R6b3FOI0Dg4swvVd0al/2AHG/uRlfwhZzOD5aFZU13jTryBsyf
 EGE/Y4fcTLIQLo0uXiuPGMAEijVs3t31qu/CuyCklMhdZsH5V0EndhZjlS1sp15Nzzpk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BjFBsWPShV0xPJ8w68KgDHrrlD9GWtzsqFTijYhy34k=; b=lznH4+2vNkfnPA7lKjttFwCKcL
 iE2DiybHivQNp9PiBLv3irTze92SN4Pllqwjay3y2sxWqMnTTysL3DBpnzFseq4QNev0+pqjSOmE+
 2SAcIK72sQZUXmu/YlwLhILTJ6jrYFgSBJHXDoj7Z1aOlvuwfo/rfYNHwiZ97pTR+ONU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lg84J-002K46-Jy
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 15:43:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA4B1611C1;
 Mon, 10 May 2021 15:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620661414;
 bh=XtnUvkZmm64kXOKsc0Oi6S+b2S08vRNxv3fNO+vbr7s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NPpDtlqpnnVRy8zibJHRQ2H9jF0P2Dfs7eOLa/4Ab7LXEXXzIu/AqVAzjS10zAoBD
 7FmcPwSqoVqlnLo546cs78kY724HrhoUGILRhDvuVs9sNy59G/jmy1qs4TgKrdUZcz
 MpaIX2hb9dqWUp7XBAbK7jUkvsgJzZ0fVL3nhS6LNY58lP+B0fpiXUJPnWnO42o4uM
 olfQUue6W07EKHjuGSYuf8Zm246XoICtxyDuQN/+NuvH4hkPqBx3RCzSMm5/1qfOMd
 +ZeRDR0xtbMCyH5oDDalRFNEy2d1cm9iPez5B3//+V2oaMnO6MGxpbcwbLi3D2taw8
 IYGCI/28Og4eQ==
Date: Mon, 10 May 2021 08:43:32 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <YJlUpHJLONlORWWl@google.com>
References: <20210507094455.1695-1-changfengnan@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210507094455.1695-1-changfengnan@vivo.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lg84J-002K46-Jy
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: compress: avoid unnecessary check
 in f2fs_prepare_compress_overwrite
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

On 05/07, Fengnan Chang wrote:
> when write compressed file with O_TRUNC, there will be a lot of
> unnecessary check valid blocks in f2fs_prepare_compress_overwrite,
> especially when written in page size, remove it.
> 
> This patch will not bring significant performance improvements, I test
> this on mobile phone, use androbench, the sequential write test case was
> open file with O_TRUNC, set write size to 4KB,  performance improved
> about 2%-3%. If write size set to 32MB, performance improved about 0.5%.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>  fs/f2fs/data.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index cf935474ffba..b9ec7b182f45 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3303,9 +3303,17 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  	if (f2fs_compressed_file(inode)) {
>  		int ret;
> +		pgoff_t end = (i_size_read(inode) + PAGE_SIZE - 1) >> PAGE_SHIFT;
> 
>  		*fsdata = NULL;
> 
> +		/*
> +		 * when write pos is bigger than inode size ,f2fs_prepare_compress_overwrite
> +		 * always return 0, so check pos first to avoid this.
> +		 */
> +		if (index >= end)
> +			goto repeat;

What if there're existing clusters beyond i_size? Given performance impacts,
do we really need this?

> +
>  		ret = f2fs_prepare_compress_overwrite(inode, pagep,
>  							index, fsdata);
>  		if (ret < 0) {
> --
> 2.29.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
