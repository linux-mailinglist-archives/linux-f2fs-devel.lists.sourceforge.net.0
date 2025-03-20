Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 766F2A6A660
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Mar 2025 13:42:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tvFDd-0004Uj-8J;
	Thu, 20 Mar 2025 12:41:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tvFDY-0004UH-3Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Mar 2025 12:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=na8LmWQOfj0MgQjlUR0mlW3uMsogyGF2G0JxcUgh00Y=; b=hpyshX54Ixq/iaKOJAEHnKDdHw
 gzqsPCef6SlVnyk0jl+7hixcajkDKZ6aEHI/IM61P409mmjeQu8PBthr1Fj6XdAc5HVtfTbmGoQSj
 z2CLdzlW5SS2NwD8TxFxPz50vN8gD4O40vh8DoGkq2GIJb0YFma4rlJeLnMXctYiHrZw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=na8LmWQOfj0MgQjlUR0mlW3uMsogyGF2G0JxcUgh00Y=; b=kB3eX5uq/GFyc0BzGkZNA7AiuF
 83wHq5s/AmN4r4rv9JUSs5hb0IZfDVM3YXFGBTvfolTmEsLcK0WRF/Wk3R66v5F2xMg0JZJ+/rrPT
 vM909Bxu+LDY+qFwtOxRck3rWOBg91G7OPoOoJ9lBd6Jdfa+B6A/y/xDdV1G1PiuXGRI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tvFDO-0001ET-6U for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Mar 2025 12:41:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 586E642B8F;
 Thu, 20 Mar 2025 12:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576D5C4CEDD;
 Thu, 20 Mar 2025 12:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742474487;
 bh=1LBArdjddpu7N883Cn90h1cTpic2/j1Zga7ecYskBGQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=sobMYlc/4UpaIR9+ngSrB0i2CxGHgKYiNySWSif9DPb/tbyJpYFKYdMqyXzXatSk5
 mJjtqCF89s3yFWDQD15KHissM9kaaWpN/LNR5O+37kQMiTf6i2YD9jNBuQPC3TkvSO
 B/Nm93sS8nCOydBSqt2R1fD7qtoYLknPUw0wFqTipob112C9q1lBg7mRoSJCEdUfmy
 rpRU0r9rA9l/m325LTJovkcqEo7jeTkGso5gj0JjXJeWLegOF/eyq4A8ueW/NIHTar
 7chUDYr5YndHgQthP4QoHV1mCmDtqgITLodk5FBOtK4ZfAurLFZ1xiYcINui9lB8Z2
 NG12n9O9T86vw==
Message-ID: <435dba58-fa47-44cf-add0-58ee32462d6d@kernel.org>
Date: Thu, 20 Mar 2025 20:41:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: LongPing Wei <weilongping@oppo.com>,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
References: <20250320065247.2364883-1-weilongping@oppo.com>
Content-Language: en-US
In-Reply-To: <20250320065247.2364883-1-weilongping@oppo.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/3/20 14:52, LongPing Wei wrote: > An error occurs
 when the file length exceeds 4 GiB. > For example: > touch test.img > truncate
 -s 10G test.img > mkfs.f2fs test.img > mkdir mnt > mount -t f2f [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tvFDO-0001ET-6U
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: fix incorrect return type of
 f2fs_max_file_offset
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: zhengliang@oppo.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/3/20 14:52, LongPing Wei wrote:
> An error occurs when the file length exceeds 4 GiB.
> For example:
> touch test.img
> truncate -s 10G test.img
> mkfs.f2fs test.img
> mkdir mnt
> mount -t f2fs -o loop test.img mnt
> dd if=/dev/zero of=mnt/testfile bs=1G count=5
> sync
> umount mnt
> fsck.f2fs -M test.img
> 
> /testfile 1319936-1320447[ASSERT] (dump_data_blk: 285) blkaddr == NULL_ADDR

Good catch! Seems it will affect several tools including fsck, dump and
sload.

> 
> Signed-off-by: Zheng Liang <zhengliang@oppo.com>
> Signed-off-by: LongPing Wei <weilongping@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> ---
>   include/f2fs_fs.h | 2 +-
>   lib/libf2fs.c     | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index bb40adc..f206994 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -1610,7 +1610,7 @@ extern int utf8_to_utf16(char *, const char *, size_t, size_t);
>   extern int utf16_to_utf8(char *, const char *, size_t, size_t);
>   extern int log_base_2(uint32_t);
>   extern unsigned int addrs_per_page(struct f2fs_inode *, bool);
> -extern unsigned int f2fs_max_file_offset(struct f2fs_inode *);
> +extern u64 f2fs_max_file_offset(struct f2fs_inode *);
>   extern __u32 f2fs_inode_chksum(struct f2fs_node *);
>   extern __u32 f2fs_checkpoint_chksum(struct f2fs_checkpoint *);
>   extern int write_inode(struct f2fs_node *, u64, enum rw_hint);
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index ecd22d4..d2579d7 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -527,7 +527,7 @@ unsigned int addrs_per_page(struct f2fs_inode *i, bool is_inode)
>   	return ALIGN_DOWN(addrs, 1 << i->i_log_cluster_size);
>   }
>   
> -unsigned int f2fs_max_file_offset(struct f2fs_inode *i)
> +u64 f2fs_max_file_offset(struct f2fs_inode *i)
>   {
>   	if (!LINUX_S_ISREG(le16_to_cpu(i->i_mode)) ||
>   			!(le32_to_cpu(i->i_flags) & F2FS_COMPR_FL))



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
