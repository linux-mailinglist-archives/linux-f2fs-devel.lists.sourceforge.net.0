Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF028A9191
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Apr 2024 05:33:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rxIWZ-0007nb-JT;
	Thu, 18 Apr 2024 03:33:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rxIWX-0007nT-DN
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Apr 2024 03:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HtDUzXDU3Yl+aCzbU6jBzPbvOYcdX1T2t2gZb3G+/t0=; b=Ad8Ge3S9kl0vpz5l6di0Zi2gTR
 fzEoVZtmkAm2TzBdXaUpq87c9cjIV6o0KRU+x02HgpOgCJ8SWFByk4XM+OOAJMndyhEYtgFhuU0WQ
 C17QpyKqJ/t2GENXGRy4j037VtHcBUBAsSGxWFnX5LG+XM0rPqNx4wo6ogUgaZie0Qos=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HtDUzXDU3Yl+aCzbU6jBzPbvOYcdX1T2t2gZb3G+/t0=; b=Gnzsp5fY0T977/J5qUvFYGhLTJ
 mnuvruZJHw9BOyP3yTV/9PlpvpcbG0Gc/8McvnGKtzUhALbhfOrnMb9rFEOsZUFIYuHnzVi6BlmJQ
 6yEPwVNAE6O06IctX6pPh2CGfbXEXeOGRWwYnN0AI4PoQi90XMkmPSgOa1StSbIl+6sc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rxIWW-0005p2-Pd for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Apr 2024 03:33:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 466BF611E3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Apr 2024 03:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2669BC113CC;
 Thu, 18 Apr 2024 03:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713411194;
 bh=uqbQDcCb4KtLmSPyByi5T+QvrKt80hHMqNZ40UdU0vc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=dRgqNGURsqtAA0Mdlc6wSAa//R5K24gE0urmQwsqC6laE1V9BwIpcYiW9SK3l/HeO
 13SQUSvG9PIme4jJ02Xjo3no3/WiBdk12vJHNXdRvc0+IUs0H4q1/WXzusJERVDWvL
 b1eb13R4qGIc1rkLglnOWmnWo/Hxff/5Wi1WFbsB/dHeEizNWpwqTj6Y1Z6LUnmoYb
 L9GDcC/Nh0wGKGDTsStSwgNM0PUoVQFsvTderYxv58j6Ivx/h5N9N5h22wm8z2dIjs
 S97SR1WEUnoK3GvXRozrJqlQzUuUk9tDO6Jg8W5OxQaKuSChKbmQNs/iaoQTLFkoaw
 FvII62FVILczw==
Message-ID: <afe91331-92a5-4ccf-b5b3-095a2d65f0d0@kernel.org>
Date: Thu, 18 Apr 2024 11:33:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240417211201.3919770-1-jaegeuk@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240417211201.3919770-1-jaegeuk@kernel.org>
X-Spam-Score: -6.9 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/18 5:12, Jaegeuk Kim wrote: > This reverts commit
 930e2607638d ("f2fs: remove obsolete whint_mode"), as we > decide to pass
 write hints to the disk. > > Signed-off-by: Jaegeuk Kim <jaegeuk@k [...] 
 Content analysis details:   (-6.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rxIWW-0005p2-Pd
Subject: Re: [f2fs-dev] [PATCH] f2fs: assign the write hint per stream by
 default
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

On 2024/4/18 5:12, Jaegeuk Kim wrote:
> This reverts commit 930e2607638d ("f2fs: remove obsolete whint_mode"), as we
> decide to pass write hints to the disk.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   Documentation/filesystems/f2fs.rst | 29 +++++++++++++++
>   fs/f2fs/data.c                     |  2 +
>   fs/f2fs/f2fs.h                     |  2 +
>   fs/f2fs/segment.c                  | 59 ++++++++++++++++++++++++++++++
>   4 files changed, 92 insertions(+)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index efc3493fd6f8..68a0885fb5e6 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -774,6 +774,35 @@ In order to identify whether the data in the victim segment are valid or not,
>   F2FS manages a bitmap. Each bit represents the validity of a block, and the
>   bitmap is composed of a bit stream covering whole blocks in main area.
>   
> +Write-hint Policy
> +-----------------
> +
> +F2FS sets the whint all the time with the below policy.

No user-based mode?

Thanks,

> +
> +===================== ======================== ===================
> +User                  F2FS                     Block
> +===================== ======================== ===================
> +N/A                   META                     WRITE_LIFE_NONE|REQ_META
> +N/A                   HOT_NODE                 WRITE_LIFE_NONE
> +N/A                   WARM_NODE                WRITE_LIFE_MEDIUM
> +N/A                   COLD_NODE                WRITE_LIFE_LONG
> +ioctl(COLD)           COLD_DATA                WRITE_LIFE_EXTREME
> +extension list        "                        "
> +
> +-- buffered io
> +N/A                   COLD_DATA                WRITE_LIFE_EXTREME
> +N/A                   HOT_DATA                 WRITE_LIFE_SHORT
> +N/A                   WARM_DATA                WRITE_LIFE_NOT_SET
> +
> +-- direct io
> +WRITE_LIFE_EXTREME    COLD_DATA                WRITE_LIFE_EXTREME
> +WRITE_LIFE_SHORT      HOT_DATA                 WRITE_LIFE_SHORT
> +WRITE_LIFE_NOT_SET    WARM_DATA                WRITE_LIFE_NOT_SET
> +WRITE_LIFE_NONE       "                        WRITE_LIFE_NONE
> +WRITE_LIFE_MEDIUM     "                        WRITE_LIFE_MEDIUM
> +WRITE_LIFE_LONG       "                        WRITE_LIFE_LONG
> +===================== ======================== ===================
> +
>   Fallocate(2) Policy
>   -------------------
>   
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 5d641fac02ba..ed7d08785fcf 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -465,6 +465,8 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
>   	} else {
>   		bio->bi_end_io = f2fs_write_end_io;
>   		bio->bi_private = sbi;
> +		bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi,
> +						fio->type, fio->temp);
>   	}
>   	iostat_alloc_and_bind_ctx(sbi, bio, NULL);
>   
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index dd530dc70005..b3b878acc86b 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3745,6 +3745,8 @@ void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
>   int __init f2fs_create_segment_manager_caches(void);
>   void f2fs_destroy_segment_manager_caches(void);
>   int f2fs_rw_hint_to_seg_type(enum rw_hint hint);
> +enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
> +			enum page_type type, enum temp_type temp);
>   unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
>   			unsigned int segno);
>   unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index f0da516ba8dc..daa94669f7ee 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3364,6 +3364,65 @@ int f2fs_rw_hint_to_seg_type(enum rw_hint hint)
>   	}
>   }
>   
> +/*
> + * This returns write hints for each segment type. This hints will be
> + * passed down to block layer as below by default.
> + *
> + * User                  F2FS                     Block
> + * ----                  ----                     -----
> + *                       META                     WRITE_LIFE_NONE|REQ_META
> + *                       HOT_NODE                 WRITE_LIFE_NONE
> + *                       WARM_NODE                WRITE_LIFE_MEDIUM
> + *                       COLD_NODE                WRITE_LIFE_LONG
> + * ioctl(COLD)           COLD_DATA                WRITE_LIFE_EXTREME
> + * extension list        "                        "
> + *
> + * -- buffered io
> + *                       COLD_DATA                WRITE_LIFE_EXTREME
> + *                       HOT_DATA                 WRITE_LIFE_SHORT
> + *                       WARM_DATA                WRITE_LIFE_NOT_SET
> + *
> + * -- direct io
> + * WRITE_LIFE_EXTREME    COLD_DATA                WRITE_LIFE_EXTREME
> + * WRITE_LIFE_SHORT      HOT_DATA                 WRITE_LIFE_SHORT
> + * WRITE_LIFE_NOT_SET    WARM_DATA                WRITE_LIFE_NOT_SET
> + * WRITE_LIFE_NONE       "                        WRITE_LIFE_NONE
> + * WRITE_LIFE_MEDIUM     "                        WRITE_LIFE_MEDIUM
> + * WRITE_LIFE_LONG       "                        WRITE_LIFE_LONG
> + */
> +enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
> +				enum page_type type, enum temp_type temp)
> +{
> +	switch (type) {
> +	case DATA:
> +		switch (temp) {
> +		case WARM:
> +			return WRITE_LIFE_NOT_SET;
> +		case HOT:
> +			return WRITE_LIFE_SHORT;
> +		case COLD:
> +			return WRITE_LIFE_EXTREME;
> +		default:
> +			return WRITE_LIFE_NONE;
> +		}
> +	case NODE:
> +		switch (temp) {
> +		case WARM:
> +			return WRITE_LIFE_MEDIUM;
> +		case HOT:
> +			return WRITE_LIFE_NONE;
> +		case COLD:
> +			return WRITE_LIFE_LONG;
> +		default:
> +			return WRITE_LIFE_NONE;
> +		}
> +	case META:
> +		return WRITE_LIFE_NONE;
> +	default:
> +		return WRITE_LIFE_NONE;
> +	}
> +}
> +
>   static int __get_segment_type_2(struct f2fs_io_info *fio)
>   {
>   	if (fio->type == DATA)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
