Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D4B6D2C32
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Apr 2023 03:01:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1piPcI-00082f-Oz;
	Sat, 01 Apr 2023 01:01:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1piPcH-00082Z-3D
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Apr 2023 01:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mC5lgCpWiVErRdOUsS4kk+MDBnluSPTGN4PngsFM3Zo=; b=g03gvOaCuH10fhxkrR1lkP0lsR
 zqyxlhESt9a7QUNm1WfY/ciS6OcbtK/ZISU2bhNRtj5xjhIT3gOpPkR2E1Eq+wuS0/gtqN7ySdR5q
 mLJTR1UHYCzqVRvF+HYTZD4goRnNlp/zwzsbIM3MjkqEW2Nltp4163Wg3jnvrfNPqc+E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mC5lgCpWiVErRdOUsS4kk+MDBnluSPTGN4PngsFM3Zo=; b=NGoc7fHkESKE1dEDsZz4VPl8OT
 c5ZaQC592xT6TtrPJyWULGyGB/JafMS2xKwx/cffw1fwxXYNXFiTpO5rDXpgpfNzLhErZYyF9iVvw
 twIGbwehSqpSLptUzooMKGhgJtTqGT/5XqsPQh72cIGVVAKfXYOcfNmFmLJ38wKwbeqs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1piPcG-00BRqy-FD for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Apr 2023 01:01:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97307B8322C;
 Sat,  1 Apr 2023 01:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70020C433EF;
 Sat,  1 Apr 2023 01:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680310863;
 bh=tt7ZGatFV1hjdhv+xFUnZBFTFezV1KSetDds2ucKZNs=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=janccKIkv8gk5FEqwL/V+sypzlpq4VKfugp40dB6anoP5nnRNthYLPOkEfwEJ7cdJ
 j7MogpyMRpzNioQVQhOZpLQSKoBI1jVCSBDSwEia/Ga+jgrS1tewbGxgUNjygTltw0
 vZ8ixmvySVtuX7D4ZpF76C3li+cBtzLsH1+1UwFs+nXq+XRYmRNBnPa9OovYqYo4+/
 fFECcg/GgLz0FVsEwhTi1U936XArQt5FUSoSNJrCtUqHmwMROp8LLBf2rt7BH8OCoT
 jrpo3I3356eoXIB0tiZFTO5HeQp4NmQXBwsdra2KKn9gbSkF9iM3upx92YFOa5V1ih
 Vo3P/JEDThlrw==
Message-ID: <ec3f83d3-c00c-17d5-c967-2e3e7a4798c7@kernel.org>
Date: Sat, 1 Apr 2023 09:00:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Bo Ye <bo.ye@mediatek.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 xiongping1 <xiongping1@xiaomi.com>, qixiaoyu1 <qixiaoyu1@xiaomi.com>
References: <20230331092658.72386-1-bo.ye@mediatek.com>
 <20230331092658.72386-2-bo.ye@mediatek.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230331092658.72386-2-bo.ye@mediatek.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/3/31 17:26,
 Bo Ye wrote: > From: Qilin Tan <qilin.tan@mediatek.com>
 > > Need add __pack for struct extent_info to align to memory > layout of
 struct rb_entry. Jaegeuk has fixed this bug w/ below patchset, please check
 it: Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1piPcG-00BRqy-FD
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add __pack attribute for
 extent_info
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
Cc: Qilin Tan <qilin.tan@mediatek.com>, yongdong.zhang@mediatek.com,
 linux-kernel@vger.kernel.org, light.hsieh@mediatek.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-mediatek@lists.infradead.org,
 browse.zhang@mediatek.com, linux-arm-kernel@lists.infradead.org,
 peng.zhou@mediatek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/3/31 17:26, Bo Ye wrote:
> From: Qilin Tan <qilin.tan@mediatek.com>
> 
> Need add __pack for struct extent_info to align to memory
> layout of struct rb_entry.

Jaegeuk has fixed this bug w/ below patchset, please check it:

https://lore.kernel.org/linux-f2fs-devel/20230313201216.924234-1-jaegeuk@kernel.org/

Thanks,

> 
> struct rb_entry {
>      struct rb_node rb_node;     /* rb node located in rb-tree */
>      union {
>          struct {
>              unsigned int ofs;   /* start offset of the entry */
>              unsigned int len;   /* length of the entry */
>          };
>          unsigned long long key;     /* 64-bits key */
>      } __packed;
> };
> 
> struct extent_info {
>      unsigned int fofs;      /* start offset in a file */
>      unsigned int len;       /* length of the extent */
>      union {
>          ...
>          /* block age extent_cache */
>          struct {
>              /* block age of the extent */
>              unsigned long long age;
>              /* last total blocks allocated */
>              unsigned long long last_blocks;
>          };
> };
> 
> The new fields(age, last_blocks) are u64 in change 71644dff4811, it
> cause the memory alignment based on 8 bytes in some complier. So the
> field fofs and len are alloced with 8 bytes and using the last 4 byts.
> Its memory is not aligned with struct rb_entry. the ofs of rb_entry
> pointer to a invalid value and cause writing file failed.
> 
> struct extent_info's offset should be 12 rather than 16 from the
> beginning of struct rb_entry.
> 
> The offset dump for the bad case as:
> kworker/u16:6: [name:f2fs&]f2fs_lookup_rb_tree_for_insert:MTK_DEBUG: ino=1629 re=0xc675dc08 ofs=0 re->ofs=0, re->len=68 ei=0xc675dc18 ei.fofs=68 ei.len=277
> 
> Fixes: 71644dff4811 ("f2fs: add block_age-based extent cache")
> Signed-off-by: Bo Ye <bo.ye@mediatek.com>
> Signed-off-by: Qilin Tan <qilin.tan@mediatek.com>
> ---
>   fs/f2fs/f2fs.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index b0ab2062038a..7c690667a42f 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -660,7 +660,7 @@ struct extent_info {
>   			unsigned long long last_blocks;
>   		};
>   	};
> -};
> +} __packed;
>   
>   struct extent_node {
>   	struct rb_node rb_node;		/* rb node located in rb-tree */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
