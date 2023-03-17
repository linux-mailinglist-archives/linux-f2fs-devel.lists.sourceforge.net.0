Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 239F56BDE6C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Mar 2023 03:02:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pczQi-0005hH-UH;
	Fri, 17 Mar 2023 02:02:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1pczQg-0005hA-Ei
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Mar 2023 02:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HzuXTIGhsJtmn+7K+M/XpU65FRNGqAod8SGW99Rw/90=; b=T/9zzhqLFV7Ufkuu59Fd7Df32G
 f3aQSm6T9y1KucQKW0rfxW+biYPdqR1a36y4ELkvscN/kqGDAMNhVBsT0fDN6ETHHa5onLxWugje7
 H+PUGpERYFcxnJUiS8LlV2quFFh2La4pI+YnlQHx+k3/RlP3kF9f2P2jNeGYebaH4v4w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HzuXTIGhsJtmn+7K+M/XpU65FRNGqAod8SGW99Rw/90=; b=dms0d2na+JV8asFyoqjD36pJ1w
 2otdHkVglXyFwf0u0fDIgR12dR3MZpuq/5vAijhyfpX7F+NgfWzG38w3qOsdAJbUgvCPvNYlgMuqP
 yYex6+GBoGdXruL0MfKTyvlwLUCiSJq3D6RgAzCEgvvlApiPiJHcJ9rED+s+bcBaKGHE=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pczQb-0003aD-Hn for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Mar 2023 02:02:51 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230317020233epoutp03c80ec03df1cfd2609aef592f420552f9~NEnqh9S8Q2471724717epoutp03M
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Mar 2023 02:02:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230317020233epoutp03c80ec03df1cfd2609aef592f420552f9~NEnqh9S8Q2471724717epoutp03M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1679018554;
 bh=HzuXTIGhsJtmn+7K+M/XpU65FRNGqAod8SGW99Rw/90=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=Y3Ydni+mTyloHfip/pPkg8U35msx7zyLwUU4DSoWINRTvf9YOYGXB3JpOCCqlHZjG
 d6qa2Zivm3HGdS86k4VYrSXrSdzAIsteQCu6ggvAuj1FqpSSS19EwOxJbeNKJ31HRl
 yT2VfodnxIgdDx1uWCrO3s0gzvjtoUtzeke6KNfw=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20230317020233epcas2p1ac37ad088bea59e1cc0220fa2e0bb0d3~NEnqUHUfO1891918919epcas2p1_;
 Fri, 17 Mar 2023 02:02:33 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.91]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Pd6pJ5TyYz4x9Q3; Fri, 17 Mar
 2023 02:02:32 +0000 (GMT)
X-AuditID: b6c32a45-8bdf87000001f1e7-07-6413ca3805aa
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 0F.E4.61927.83AC3146; Fri, 17 Mar 2023 11:02:32 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <ZBNOKq/EYNMnMSFi@google.com>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230317020232epcms2p8674f817aeddbcf3aaf6a64f9fa77d5c3@epcms2p8>
Date: Fri, 17 Mar 2023 11:02:32 +0900
X-CMS-MailID: 20230317020232epcms2p8674f817aeddbcf3aaf6a64f9fa77d5c3
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFKsWRmVeSWpSXmKPExsWy7bCmha7FKeEUg51r5SxOTz3LZPFk/Sxm
 i0uL3C0u75rD5sDisWlVJ5vH7gWfmTw+b5ILYI7KtslITUxJLVJIzUvOT8nMS7dV8g6Od443
 NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBWqakUJaYUwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVK
 LUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM6Ysoun4LtexeTvu1gbGLeodTFyckgImEi8
 Wd3F1sXIxSEksINRYubr04xdjBwcvAKCEn93CIPUCAuESExceIAJxBYSUJK4dqCXBSKuL7F5
 8TJ2EJtNQFfi74blYLaIgIrEoUWX2UFmMgvsZ5S407ODCWIZr8SM9qcsELa0xPblWxlBbE4B
 LYm+DfvYIeIaEj+W9TJD2KISN1e/ZYex3x+bzwhhi0i03jsLVSMo8eDnbqi4pMSiQ+ehduVL
 /F1xnQ3CrpHY2tAGFdeXuNaxkQXiR1+JnafSQMIsAqoSL/5thRrjInH82hew8cwC8hLb385h
 BilnFtCUWL9LH8SUEFCWOHKLBaKCT6Lj8F92mAd3zHsCtUhNYvOmzawQtozEhcdtUNM9JH7N
 PMk6gVFxFiKcZyHZNQth1wJG5lWMYqkFxbnpqcVGBYbwmE3Oz93ECE50Wq47GCe//aB3iJGJ
 g/EQowQHs5IIbziLQIoQb0piZVVqUX58UWlOavEhRlOgLycyS4km5wNTbV5JvKGJpYGJmZmh
 uZGpgbmSOK+07clkIYH0xJLU7NTUgtQimD4mDk6pBqbIooDp5UFXDt7fWmEbmZ38eEHskg16
 l75EXVrtuvQuQ6+NxOub8nI9XRzqIn4Bf5o2MOtt3TONkWHLF46Aear15wRmik95F+P5QE+7
 o8OQaYFTztkJ3yb5VOUefGug6rNhvrGLR0pkXvK0LeY/M92FPQ/NbWtSXSSSoaN6Q0m+w6I/
 PktJI/fpxsT5ttFJ0klHV7G/+tgfeWBqHVdcDMPPVJ3fx/grY48U7UwIUb+6iLM1siYx47yG
 kcgdjxPBdv06Uu3dxxIUM/Z+aFnqZhX6aGE8n/IXr5k3bziX3sgLikqrs92WJeWsaPFhwRHJ
 iJIrORo12WzSzFuNY4U99seo/JvB91bgz+GFOY5KLMUZiYZazEXFiQDUxc/N/QMAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230314074733epcms2p511d7a7fa11d5b54ac2fbaa840db3f1cb
References: <ZBNOKq/EYNMnMSFi@google.com>
 <20230314074733epcms2p511d7a7fa11d5b54ac2fbaa840db3f1cb@epcms2p5>
 <CGME20230314074733epcms2p511d7a7fa11d5b54ac2fbaa840db3f1cb@epcms2p8>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 03/14,
 Yonggil Song wrote: >> When f2fs tries to checkpoint
 during foreground gc in LFS mode, system >> crash occurs due to lack of free
 space if the amount of dirty node and >> dentry pages gener [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pczQb-0003aD-Hn
Subject: Re: [f2fs-dev] (2) [PATCH v1] f2fs: Fix system crash due to lack of
 free space in LFS
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
Reply-To: yonggil.song@samsung.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>On 03/14, Yonggil Song wrote:
>> When f2fs tries to checkpoint during foreground gc in LFS mode, system
>> crash occurs due to lack of free space if the amount of dirty node and
>> dentry pages generated by data migration exceeds free space.
>> The reproduction sequence is as follows.
>> 
>>  - 20GiB capacity block device (null_blk)
>>  - format and mount with LFS mode
>>  - create a file and write 20,000MiB
>>  - 4k random write on full range of the file
>> 
>>  RIP: 0010:new_curseg+0x48a/0x510 [f2fs]
>>  Code: 55 e7 f5 89 c0 48 0f af c3 48 8b 5d c0 48 c1 e8 20 83 c0 01 89 43 6c 48 83 c4 28 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc <0f> 0b f0 41 80 4f 48 04 45 85 f6 0f 84 ba fd ff ff e9 ef fe ff ff
>>  RSP: 0018:ffff977bc397b218 EFLAGS: 00010246
>>  RAX: 00000000000027b9 RBX: 0000000000000000 RCX: 00000000000027c0
>>  RDX: 0000000000000000 RSI: 00000000000027b9 RDI: ffff8c25ab4e74f8
>>  RBP: ffff977bc397b268 R08: 00000000000027b9 R09: ffff8c29e4a34b40
>>  R10: 0000000000000001 R11: ffff977bc397b0d8 R12: 0000000000000000
>>  R13: ffff8c25b4dd81a0 R14: 0000000000000000 R15: ffff8c2f667f9000
>>  FS: 0000000000000000(0000) GS:ffff8c344ec80000(0000) knlGS:0000000000000000
>>  CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>  CR2: 000000c00055d000 CR3: 0000000e30810003 CR4: 00000000003706e0
>>  DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>  DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>>  Call Trace:
>>  <TASK>
>>  allocate_segment_by_default+0x9c/0x110 [f2fs]
>>  f2fs_allocate_data_block+0x243/0xa30 [f2fs]
>>  ? __mod_lruvec_page_state+0xa0/0x150
>>  do_write_page+0x80/0x160 [f2fs]
>>  f2fs_do_write_node_page+0x32/0x50 [f2fs]
>>  __write_node_page+0x339/0x730 [f2fs]
>>  f2fs_sync_node_pages+0x5a6/0x780 [f2fs]
>>  block_operations+0x257/0x340 [f2fs]
>>  f2fs_write_checkpoint+0x102/0x1050 [f2fs]
>>  f2fs_gc+0x27c/0x630 [f2fs]
>>  ? folio_mark_dirty+0x36/0x70
>>  f2fs_balance_fs+0x16f/0x180 [f2fs]
>> 
>> This patch adds checking whether free sections are enough before checkpoint
>> during gc.
>> 
>> Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
>> ---
>>  fs/f2fs/gc.c      |  7 ++++++-
>>  fs/f2fs/segment.h | 26 +++++++++++++++++++++-----
>>  2 files changed, 27 insertions(+), 6 deletions(-)
>> 
>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>> index 4546e01b2ee0..b22f49a6f128 100644
>> --- a/fs/f2fs/gc.c
>> +++ b/fs/f2fs/gc.c
>> @@ -1773,6 +1773,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>>  		.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
>>  	};
>>  	unsigned int skipped_round = 0, round = 0;
>> +	unsigned int nr_needed_secs = 0, node_blocks = 0, dent_blocks = 0;
>>  
>>  	trace_f2fs_gc_begin(sbi->sb, gc_type, gc_control->no_bg_gc,
>>  				gc_control->nr_free_secs,
>> @@ -1858,8 +1859,12 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>>  		}
>>  	}
>>  
>> +	/* need more three extra sections for writer's data/node/dentry */
>> +	nr_needed_secs = get_min_need_secs(sbi, &node_blocks, &dent_blocks) + 3;
>
>	get_min_need_secs(&lower, &upper)
>	{
>		...
>
>		*lower = node_secs + dent_secs;
>		*upper = *lower + (node_blocks ? 1 : 0) + (dent_blocks ? 1 : 0);
>	}
>
>> +	nr_needed_secs += ((node_blocks ? 1 : 0) + (dent_blocks ? 1 : 0));
>> +
>>  	/* Write checkpoint to reclaim prefree segments */
>> -	if (free_sections(sbi) < NR_CURSEG_PERSIST_TYPE &&
>> +	if (free_sections(sbi) <= nr_needed_secs &&
>
>#define NR_GC_CHECKPOINT_SECS	(3)	/* data/node/dentry sections */
>
>	if (free_sections(sbi) <= upper + NR_GC_CHECKPOINT_SECS &&
>
>>  				prefree_segments(sbi)) {
>>  		ret = f2fs_write_checkpoint(sbi, &cpc);
>>  		if (ret)
>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
>> index be8f2d7d007b..ac11c47bfe37 100644
>> --- a/fs/f2fs/segment.h
>> +++ b/fs/f2fs/segment.h
>> @@ -605,8 +605,11 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>>  	return true;
>>  }
>>  
>> -static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
>> -					int freed, int needed)
>> +/*
>> + * calculate the minimum number of sections (needed) for dirty node/dentry
>> + */
>> +static inline unsigned int get_min_need_secs(struct f2fs_sb_info *sbi,
>> +		unsigned int *node_blocks, unsigned int *dent_blocks)
>>  {
>>  	unsigned int total_node_blocks = get_pages(sbi, F2FS_DIRTY_NODES) +
>>  					get_pages(sbi, F2FS_DIRTY_DENTS) +
>> @@ -614,15 +617,28 @@ static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
>>  	unsigned int total_dent_blocks = get_pages(sbi, F2FS_DIRTY_DENTS);
>>  	unsigned int node_secs = total_node_blocks / CAP_BLKS_PER_SEC(sbi);
>>  	unsigned int dent_secs = total_dent_blocks / CAP_BLKS_PER_SEC(sbi);
>> -	unsigned int node_blocks = total_node_blocks % CAP_BLKS_PER_SEC(sbi);
>> -	unsigned int dent_blocks = total_dent_blocks % CAP_BLKS_PER_SEC(sbi);
>> +
>> +	f2fs_bug_on(sbi, (!node_blocks || !dent_blocks));
>> +
>> +	*node_blocks = total_node_blocks % CAP_BLKS_PER_SEC(sbi);
>> +	*dent_blocks = total_dent_blocks % CAP_BLKS_PER_SEC(sbi);
>> +
>> +	return (node_secs + dent_secs);
>> +}
>> +
>> +static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
>> +					int freed, int needed)
>> +{
>> +	unsigned int node_blocks = 0;
>> +	unsigned int dent_blocks = 0;
>>  	unsigned int free, need_lower, need_upper;
>>  
>>  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
>>  		return false;
>>  
>>  	free = free_sections(sbi) + freed;
>> -	need_lower = node_secs + dent_secs + reserved_sections(sbi) + needed;
>> +	need_lower = get_min_need_secs(sbi, &node_blocks, &dent_blocks) + needed +
>> +				reserved_sections(sbi);
>>  	need_upper = need_lower + (node_blocks ? 1 : 0) + (dent_blocks ? 1 : 0);
>>  
>>  	if (free > need_upper)
>> -- 
>> 2.34.1

Thanks for your review.
I'll send a patch v2 soon.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
