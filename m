Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC907BC3D9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Oct 2023 03:39:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qowHv-0005lZ-BY;
	Sat, 07 Oct 2023 01:39:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qowHu-0005lS-HH
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Oct 2023 01:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j6sNZCKnEQokM+uyM5VFZouUjjj71QVVWqBGcaYslaw=; b=KwNN7rDxd/q7vA3pLfPIKzAjZe
 E4s90AdG9qXUxF/OvD3tmJv7RPp1AZHQG1tAwB3jpFFn/v7kfT/Q+YYnT7OGxUAxR4cPlnnAE+uyY
 FxcCzD8xDR81tRpG/tfyyu5VFSShPNZ8wzBFLZ4GuXyYHxwCCTx1Fig7w8SwXmNnYrcc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j6sNZCKnEQokM+uyM5VFZouUjjj71QVVWqBGcaYslaw=; b=dIo3mZC7Zf7WXYokYSXGMuV/Ip
 1JrXnB0zuI+IuVHudbEUcU1Am4A+VrNosYfglJjbB9DXsZTgXgTc7RSMN2U47rWrLYHOX0vE6Z/f4
 xiIMgzaDrM+9QAUlueTw2VfxUwqt5aBqye2P1am2BmGbVOf8HOO3zi2B4XnUDdJfOUJ8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qowHr-004gYi-O4 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Oct 2023 01:39:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E5ACDCE27F3;
 Sat,  7 Oct 2023 01:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C255C433C7;
 Sat,  7 Oct 2023 01:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696642753;
 bh=rPEFVhkJbavRhduSugGv8Bpbd12aQ4MMBNkNgyLZsG0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=My44mYggaL/DpjDM4YY3VTvGDvCrrsNK7YsosV6YQeCBso9q7UIHWswct/6TJQ1tq
 YoowysLf/z9oUvq50221n0asCv5IbRTaeglm0dHjFwh1JzGfyqfPkDpMnfJTiIRzBJ
 VhmIhYuw7u5673VdN8iFAG2Xy7THr8rsk048LfBR9nghM/A3aVmciaHKWyWx+WvsE9
 2li5TTXbM5QIoXzVHOz6t8IKAwF/Fdnhyp6BoJpmc1KZqAbXRILNo37gzqbj1JjVQ5
 UoZXeXC+ejLN8OYJ5cWAVn3err+pZBaxnB6xq2oD+pcHDDlVas3WwLP9shDdrplg0r
 eSuJUN5BXHrOA==
Message-ID: <17d0aa0a-2851-becd-21c3-3567a89fd82a@kernel.org>
Date: Sat, 7 Oct 2023 09:39:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Wu Bo <bo.wu@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <cover.1695890686.git.bo.wu@vivo.com>
 <c6c4f47e6048164218b18dd2e299faf9c9b0a3d7.1695890686.git.bo.wu@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <c6c4f47e6048164218b18dd2e299faf9c9b0a3d7.1695890686.git.bo.wu@vivo.com>
X-Spam-Score: -3.7 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/9/28 17:20, Wu Bo wrote: > Use IS_CUR_SEGNO() here
 can make code more concise and readable. It missed to add your signed-off
 tag here, otherwise the patch looks good to me. Thanks, 
 Content analysis details:   (-3.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.8 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qowHr-004gYi-O4
Subject: Re: [f2fs-dev] [PATCH v2 1/3] f2fs-tools: use 'IS_CUR_SEGNO()' to
 check if it is current segment
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
Cc: Wu Bo <wubo.oduw@gmail.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/9/28 17:20, Wu Bo wrote:
> Use IS_CUR_SEGNO() here can make code more concise and readable.

It missed to add your signed-off tag here, otherwise the patch looks good to me.

Thanks,

> ---
>   fsck/mount.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index df0314d..e4372cf 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -2532,16 +2532,8 @@ void build_sit_area_bitmap(struct f2fs_sb_info *sbi)
>   		ptr += SIT_VBLOCK_MAP_SIZE;
>   
>   		if (se->valid_blocks == 0x0 && is_usable_seg(sbi, segno)) {
> -			if (le32_to_cpu(sbi->ckpt->cur_node_segno[0]) == segno ||
> -				le32_to_cpu(sbi->ckpt->cur_data_segno[0]) == segno ||
> -				le32_to_cpu(sbi->ckpt->cur_node_segno[1]) == segno ||
> -				le32_to_cpu(sbi->ckpt->cur_data_segno[1]) == segno ||
> -				le32_to_cpu(sbi->ckpt->cur_node_segno[2]) == segno ||
> -				le32_to_cpu(sbi->ckpt->cur_data_segno[2]) == segno) {
> -				continue;
> -			} else {
> +			if (!IS_CUR_SEGNO(sbi, segno))
>   				free_segs++;
> -			}
>   		} else {
>   			sum_vblocks += se->valid_blocks;
>   		}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
