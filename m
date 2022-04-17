Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C11C85046E3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Apr 2022 08:55:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nfyon-0006c5-BM; Sun, 17 Apr 2022 06:55:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nfyom-0006bz-5Y
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Apr 2022 06:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9EnP7VxHnHdcjB+yqtno1RlecuGPvDV2ttK1C4RtUHI=; b=Ul1UHRJVGdL/YdjAceHJe75JJC
 KUFjzh2rYGOsuIdzUiNsNuAd0pQKzPN2smkz0auhauArjBKYt8bnj0Vd5+nRsqEqPWFBZ7iJLU2RM
 mLTth2DMs/ybHbUVKob9i9grFebkULy3eJcqHLW0muEkTCrw6RRKM5rFVlMFjsVi03+M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9EnP7VxHnHdcjB+yqtno1RlecuGPvDV2ttK1C4RtUHI=; b=T4gW1vB7Jd+wMeDLMrIVGLK8+7
 +feYhnt94uB/E9Xld+jnuSXgJCWTlyTtNVDE6zZgoFAXfjsFE1kNyc9y87UEjScO8NujT0GA0Rruk
 M9UkzPJp/PcotSpHWa8397rxpC8qvNTlblpnCahsYgn6rFXx/3Fp3ijQSu7WcyXgCuW8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nfyoi-001ull-5s
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Apr 2022 06:55:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AFFB16112F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 17 Apr 2022 06:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DE0C385A7;
 Sun, 17 Apr 2022 06:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650178522;
 bh=8OuAouHw/QXVOEC4ptQed+yz6u6Ut5mUHhE6SJFh6ME=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=CNw02Yw7xd3rCVoVWcZYKH1ld6uXC38hTSdp3ODqDTFqvvXgleMSk+/7UVnJyRuyz
 LYVj0Fwtas/6SEse7UgpwwGovvj7Xs4BlntKOlcKVpblmoN1GT4AvR32XtEFLixlby
 Z3sCg5Tdp4SVAF64taNtnTfaCdDlLeHA9j8gBTOEghcygle3aaV+UYgBjzzbAszcxi
 epYhiY1Bd8MIwBsp0WN3ujP1s4FUnHKhQMFDeSri8+g1frJBCnLwjOy0WjUoP8DDhD
 g6PVEzwpjnV36awfgB3X2SSIvJxMbc3v0BJEM7ODhglkwtVT+mxv2kICA8ASjm2r2o
 RTmJtOfCoH8sA==
Message-ID: <d22c42f8-525a-a0a6-2fef-a43b2fc3a2c7@kernel.org>
Date: Sun, 17 Apr 2022 14:55:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220413154920.2024872-1-jaegeuk@kernel.org>
 <20220413154920.2024872-2-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220413154920.2024872-2-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/4/13 23:49,
 Jaegeuk Kim wrote: > Let's attach io_flags
 to bio only, so that we can merge IOs given original > io_flags only. > >
 Fixes: 64bf0eef0171 ("f2fs: pass the bio operation to bio_alloc [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nfyoi-001ull-5s
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: keep io_flags to avoid IO split
 due to different op_flags in two fio holders
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/4/13 23:49, Jaegeuk Kim wrote:
> Let's attach io_flags to bio only, so that we can merge IOs given original
> io_flags only.
> 
> Fixes: 64bf0eef0171 ("f2fs: pass the bio operation to bio_alloc_bioset")

Nice catch.

Wasn't this bug introduced by:

commit da9953b729c1 ("f2fs: introduce sysfs/data_io_flag to attach REQ_META/FUA")

static void __attach_data_io_flag(struct f2fs_io_info *fio)
{
...
        if ((1 << fio->temp) & meta_flag)
                fio->op_flags |= REQ_META;
        if ((1 << fio->temp) & fua_flag)
                fio->op_flags |= REQ_FUA;
...

Thanks,

> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/data.c | 33 +++++++++++++++++++++------------
>   1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index acc523f893ba..fcf0daa386de 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -387,11 +387,23 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
>   	return 0;
>   }
>   
> -static void __attach_io_flag(struct f2fs_io_info *fio, unsigned int io_flag)
> +static unsigned int f2fs_io_flags(struct f2fs_io_info *fio)
>   {
>   	unsigned int temp_mask = (1 << NR_TEMP_TYPE) - 1;
> -	unsigned int fua_flag = io_flag & temp_mask;
> -	unsigned int meta_flag = (io_flag >> NR_TEMP_TYPE) & temp_mask;
> +	unsigned int fua_flag, meta_flag, io_flag;
> +	unsigned int op_flags = 0;
> +
> +	if (fio->op != REQ_OP_WRITE)
> +		return 0;
> +	if (fio->type == DATA)
> +		io_flag = fio->sbi->data_io_flag;
> +	else if (fio->type == NODE)
> +		io_flag = fio->sbi->node_io_flag;
> +	else
> +		return 0;
> +
> +	fua_flag = io_flag & temp_mask;
> +	meta_flag = (io_flag >> NR_TEMP_TYPE) & temp_mask;
>   
>   	/*
>   	 * data/node io flag bits per temp:
> @@ -400,9 +412,10 @@ static void __attach_io_flag(struct f2fs_io_info *fio, unsigned int io_flag)
>   	 * Cold | Warm | Hot | Cold | Warm | Hot |
>   	 */
>   	if ((1 << fio->temp) & meta_flag)
> -		fio->op_flags |= REQ_META;
> +		op_flags |= REQ_META;
>   	if ((1 << fio->temp) & fua_flag)
> -		fio->op_flags |= REQ_FUA;
> +		op_flags |= REQ_FUA;
> +	return op_flags;
>   }
>   
>   static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
> @@ -412,14 +425,10 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
>   	sector_t sector;
>   	struct bio *bio;
>   
> -	if (fio->type == DATA)
> -		__attach_io_flag(fio, sbi->data_io_flag);
> -	else if (fio->type == NODE)
> -		__attach_io_flag(fio, sbi->node_io_flag);
> -
>   	bdev = f2fs_target_device(sbi, fio->new_blkaddr, &sector);
> -	bio = bio_alloc_bioset(bdev, npages, fio->op | fio->op_flags, GFP_NOIO,
> -			       &f2fs_bioset);
> +	bio = bio_alloc_bioset(bdev, npages,
> +				fio->op | fio->op_flags | f2fs_io_flags(fio),
> +				GFP_NOIO, &f2fs_bioset);
>   	bio->bi_iter.bi_sector = sector;
>   	if (is_read_io(fio->op)) {
>   		bio->bi_end_io = f2fs_read_end_io;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
