Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7814A3E263B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 10:36:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBvL3-0008UI-W5; Fri, 06 Aug 2021 08:36:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1mBvL1-0008UA-FB
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 08:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uRIFSXE74HhmAp16eXVa2ViFKtnVimxVe36qZhKYiAA=; b=CN8RKuH/RWGZAfLvcH5xwMNaks
 WXn/Pqa1r0cwy0ahUVnHPBk4lpryF+ugRjATZDC863V2fhihBSqE9HIXQi4RcZHum1kGvV61j2wJv
 4X5qouf6+thOo1MNjckq+n/Uzl+52B23ejnzFaEEfP71rRoozrOh8qsRiERb1fIW/Vts=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uRIFSXE74HhmAp16eXVa2ViFKtnVimxVe36qZhKYiAA=; b=dqayVfbTU3wMLp7RKeDseI4Hig
 Qlb+n2ME4yiPseYBv4w3b7d8iJsD3WtJjscAAiJmDQG/yMgFOZwgQyXZMckYE8q2ztHSs3AfMuIfU
 44PxI2G3aJ3pFh4icFMi8MXySy+Zv9PxCgEipa6PgbhVBc4DNbQad98L2B7E4WJr4NEk=;
Received: from mail-m17654.qiye.163.com ([59.111.176.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBvKt-0001Po-SS
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 08:36:19 +0000
Received: from [172.25.44.145] (unknown [58.251.74.232])
 by mail-m17654.qiye.163.com (Hmail) with ESMTPA id D39F220229;
 Fri,  6 Aug 2021 16:36:03 +0800 (CST)
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
References: <20210723023131.131137-1-changfengnan@vivo.com>
From: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <a906c95e-3b7f-fe0e-d016-ae6e76564dc8@vivo.com>
Date: Fri, 6 Aug 2021 16:35:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210723023131.131137-1-changfengnan@vivo.com>
Content-Language: en-US
X-HM-Spam-Status: e1kIDxoPDggYFB8eWUFWSldZCBgUCR5ZQVlLVUtZV1kWDxoPAgseWUFZKD
 YvK1lXWShZQUhPN1dZLVlBSVdZCQ4XHghZQVkyNS06NzI*QUtVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kzo6Ajo6PD8BISs1KEg2TA02
 IhMwFAxVSlVKTUlDSUhDQk1IQkJNVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOSlVMT1VJSElZV1kIAVlBSUhKTTcG
X-HM-Tid: 0a7b1a9ae4f7d9fdkuwsd39f220229
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.6 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mBvKt-0001Po-SS
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: compress: allow write compress
 released file after truncate to zero
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

Um.. I think this version should be ok.

Thanks.

On 2021/7/23 10:31, Fengnan Chang wrote:
> For compressed file, after release compress blocks, don't allow write
> direct, but we should allow write direct after truncate to zero.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/file.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6afd4562335f..094f6546fd00 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -740,6 +740,14 @@ int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
>   		return err;
>   
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
> +	/*
> +	 * For compressed file, after release compress blocks, don't allow write
> +	 * direct, but we should allow write direct after truncate to zero.
> +	 */
> +	if (f2fs_compressed_file(inode) && !free_from
> +			&& is_inode_flag_set(inode, FI_COMPRESS_RELEASED))
> +		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
> +
>   	if (from != free_from) {
>   		err = f2fs_truncate_partial_cluster(inode, from, lock);
>   		if (err)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
