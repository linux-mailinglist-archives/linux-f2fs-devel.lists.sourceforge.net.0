Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C43A7FAFF6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Nov 2023 03:13:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7nbP-0000yq-V7;
	Tue, 28 Nov 2023 02:13:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r7nbO-0000yk-Ge
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 02:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8GImPcLcg5lIrHSA1sUddozesFNAizSxKlh0kyvdp60=; b=GGPO0gOn3WKe46mDXaAv11VIHj
 aak4+kIxv/lC+va0mfMLfydHNRCkrjvqlpnk1+uegcWLkb5NggCoUydY9vpY2lohVPFuLTLauZh0D
 VVhwgbJaOij3yW2KRfGu2JcPD4pmLUDJAu0HWKmgznXb/lx9+j6ZQCa09YbaGHkb+hPs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8GImPcLcg5lIrHSA1sUddozesFNAizSxKlh0kyvdp60=; b=bzfA68lo3JOmM2Nbn9REllnITt
 entpXKsjyYylLPAuaMDnrOKTdBN3L7+KmRzQx1vite4UMqIexnm84qUkEB/udlB/nWn79xubGXwYn
 fT+Z851bd5VfAEAeTNgU8IYa/rgLP8f64cvK2wbmZBc+VRS1OImT75Vpu3rZKxTovp0k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7nbN-0007EI-SC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 02:13:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4784D61453;
 Tue, 28 Nov 2023 02:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD33C433C8;
 Tue, 28 Nov 2023 02:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701137594;
 bh=K00S5Yanj+6jxErg6y5RpnCOWOcJmkZS0lfYvqVWtPA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NdRuarqJvq8z+crp6qrhaQpkPN2NcSRbz5Xu4gr1Kyv5alhOCAAlO6VsauwkTCO6S
 mnkwiYAZBv00rorYRmfU5cnCsojjOZKeLgife0IlNYlJ3noepmE7K0dI7ioiyhO3TJ
 WcZcLIxPbEIq3m8IuTc+ukoNB7jeGKf9hwdQ+AsLPn8vpDrgJCgxGHVFj4GULVCm5x
 /MV824/mn7ORoBJbYT2yWMWs30agJdVNrPnbeaq0FkfTiVMx9YCNg5fygqvcIqayym
 YXhWFwFTw/iskvvATb0aXrLcyszoiuyR7HTZsxQlWTkdTY0rt+kE/IgL7IK+eUNUbi
 nzPtP0Gq0TvFg==
Message-ID: <a9d45834-1ccf-8387-6b90-a88e0cc0772e@kernel.org>
Date: Tue, 28 Nov 2023 10:13:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1700788128-29002-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1700788128-29002-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -7.1 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/11/24 9:08,
 Zhiguo Niu wrote: > The current pending_discard
 attr just only shows the discard_cmd_cnt > information, which is not very
 meaningful. More discard information > can be shown so tha [...] 
 Content analysis details:   (-7.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r7nbN-0007EI-SC
Subject: Re: [f2fs-dev] [PATCH] f2fs: show more discard stat by sysfs
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
Cc: hongyu.jin@unisoc.com, niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/11/24 9:08, Zhiguo Niu wrote:
> The current pending_discard attr just only shows the discard_cmd_cnt
> information, which is not very meaningful. More discard information
> can be shown so that we can check them through sysfs when needed.

What about adding this entry to /sys/fs/f2fs/<dev>/stat/?

> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>   fs/f2fs/sysfs.c | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 417fae96..f98e680 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -134,13 +134,22 @@ static ssize_t cp_status_show(struct f2fs_attr *a,
>   	return sysfs_emit(buf, "%x\n", le32_to_cpu(F2FS_CKPT(sbi)->ckpt_flags));
>   }
>   
> -static ssize_t pending_discard_show(struct f2fs_attr *a,
> +static ssize_t discard_stat_show(struct f2fs_attr *a,
>   		struct f2fs_sb_info *sbi, char *buf)
>   {
> -	if (!SM_I(sbi)->dcc_info)
> +	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> +
> +	if (!dcc)
>   		return -EINVAL;
> -	return sysfs_emit(buf, "%llu\n", (unsigned long long)atomic_read(
> -				&SM_I(sbi)->dcc_info->discard_cmd_cnt));

It's better to keep the old one for any potential user.

> +
> +	return sysfs_emit(buf, "%llu, %llu, %llu, %u\n",
> +			(unsigned long long)atomic_read(
> +				&dcc->discard_cmd_cnt),
> +			(unsigned long long)atomic_read(
> +				&dcc->issued_discard),
> +			(unsigned long long)atomic_read(
> +				&dcc->queued_discard),
> +			dcc->undiscard_blks);
>   }
>   
>   static ssize_t gc_mode_show(struct f2fs_attr *a,
> @@ -1016,7 +1025,7 @@ static ssize_t f2fs_sb_feature_show(struct f2fs_attr *a,
>   F2FS_GENERAL_RO_ATTR(encoding);
>   F2FS_GENERAL_RO_ATTR(mounted_time_sec);
>   F2FS_GENERAL_RO_ATTR(main_blkaddr);
> -F2FS_GENERAL_RO_ATTR(pending_discard);
> +F2FS_GENERAL_RO_ATTR(discard_stat);

It needs to adjust Documentation/ABI/testing/sysfs-fs-f2fs.

Thanks,

>   F2FS_GENERAL_RO_ATTR(gc_mode);
>   #ifdef CONFIG_F2FS_STAT_FS
>   F2FS_GENERAL_RO_ATTR(moved_blocks_background);
> @@ -1074,7 +1083,7 @@ static ssize_t f2fs_sb_feature_show(struct f2fs_attr *a,
>   	ATTR_LIST(discard_urgent_util),
>   	ATTR_LIST(discard_granularity),
>   	ATTR_LIST(max_ordered_discard),
> -	ATTR_LIST(pending_discard),
> +	ATTR_LIST(discard_stat),
>   	ATTR_LIST(gc_mode),
>   	ATTR_LIST(ipu_policy),
>   	ATTR_LIST(min_ipu_util),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
