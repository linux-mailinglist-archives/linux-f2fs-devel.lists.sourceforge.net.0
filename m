Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBE393BCED
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2024 09:13:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWsfE-00014p-8h;
	Thu, 25 Jul 2024 07:13:25 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sWsfD-00014j-Fy
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 07:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3GqZv8ycwaFSYNYXFmgdp2qWXTqR6e/YqMPBC9mVUUM=; b=kaK/1l4xvXO0+tK9E9pJWM8Quk
 omOmRxYLRKwMto26zdmlUMpm3m5IYhsX9tgOIYWb5JZw3fJJW/Q09tYk+J+uRAdRqbFdwAA2F4MaA
 xm0FfTvKCP6V15uu4nYDLgP5ogwIXmtI2feAn9nh6RtSsdo4BHQFGejBclcHHq/2wvks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3GqZv8ycwaFSYNYXFmgdp2qWXTqR6e/YqMPBC9mVUUM=; b=OgookbX6g1Xvi+WM+/agpIQse1
 6X/jCTXPTx46ttYsJgs+N8rqOU3HJoVPvSakuTJN3jZ6CaRH+BjHedJZ431z2v+OHZGaLmvQvOziS
 bJ+LakqDz9LJzozXlpxtst6RRzSC/Ewz3j78OnBejpUNIpywRqYxaEgC2pkAbinsIa8Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWsfD-0008JN-C0 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 07:13:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EE24460F1A;
 Thu, 25 Jul 2024 07:13:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB0CC116B1;
 Thu, 25 Jul 2024 07:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721891592;
 bh=iznDeLtQSiFdYyE2zhnhjv/lPgCAZdyjML0IA41Ovtw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AdT8Ku7jXtEHlxLNdUSvJm9JkyfK+RnAg0zhubyW+jiIhyA3TosLqHW3tsKV3CDbU
 A3vz3SuqCPLcoDIKPDvxgnjEyKYmiZR5x5vTrsfi4y64zYv6i3oJ//pF1YbssXjTHV
 Z9zt07UMNUlK7gQuKlET4ySJRHGhVbRFjmDKlnnhXSKfPxkWv64fkosl3Y/jnSVVxp
 6cxWNeehf31fY+LABonaUtcRMAYzaWUVTQBJCv4RMVN3OZ50nIrqzznNhno6oxdz4C
 0XIiWVEfM0MJAcY9Mt3LDwX+uVsIQLZanx0WswAGMIzUgIBHktIvZyyyFI7abCuWRP
 kFb21NS9kKdog==
Message-ID: <87e6efe0-0ce4-4ae2-84a4-9b86f35090b3@kernel.org>
Date: Thu, 25 Jul 2024 15:13:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wu Bo <bo.wu@vivo.com>
References: <fd64e14e-7a77-4fe4-9569-f7342c68953b@kernel.org>
 <20240725035119.2843004-1-bo.wu@vivo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240725035119.2843004-1-bo.wu@vivo.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/25 11:51, Wu Bo wrote: > On Thu, Jul 25, 2024 at
 10:33:33AM +0800, Chao Yu wrote: >> On 2024/7/24 18:35, Wu Bo wrote: >>>
 The cp_ver of node footer is useful when analyzing data corruption > [...]
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sWsfD-0008JN-C0
Subject: Re: [f2fs-dev] [PATCH] dump.f2fs: add checkpoint version to dump_nat
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
Cc: wubo.oduw@gmail.com, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/25 11:51, Wu Bo wrote:
> On Thu, Jul 25, 2024 at 10:33:33AM +0800, Chao Yu wrote:
>> On 2024/7/24 18:35, Wu Bo wrote:
>>> The cp_ver of node footer is useful when analyzing data corruption
>>> issues.
>>>
>>> Signed-off-by: Wu Bo <bo.wu@vivo.com>
>>> ---
>>>    fsck/dump.c | 33 ++++++++++++++++++---------------
>>>    1 file changed, 18 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/fsck/dump.c b/fsck/dump.c
>>> index 8d5613e..ca38101 100644
>>> --- a/fsck/dump.c
>>> +++ b/fsck/dump.c
>>> @@ -21,7 +21,7 @@
>>>    #endif
>>>    #include <locale.h>
>>> -#define BUF_SZ	80
>>> +#define BUF_SZ	256
>>
>> 128 is fine?
> 
> This buffer is located in the stack. Making it a little bigger shouldn't cause a
> performance drop, right?

Yup,

> 128 seems prone to overflow if additional information is added later.

The message will be truncated rather than it will causing overflow and
overwriting random stack size, so, it's safe now?

How about expanding it once it's not enough?

> 
>>
>>>    /* current extent info */
>>>    struct extent_info dump_extent;
>>> @@ -38,6 +38,7 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
>>>    {
>>>    	struct f2fs_nat_block *nat_block;
>>>    	struct f2fs_node *node_block;
>>> +	struct node_footer *footer;
>>>    	nid_t nid;
>>>    	pgoff_t block_addr;
>>>    	char buf[BUF_SZ];
>>> @@ -47,6 +48,7 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
>>>    	ASSERT(nat_block);
>>>    	node_block = (struct f2fs_node *)calloc(F2FS_BLKSIZE, 1);
>>>    	ASSERT(node_block);
>>> +	footer = F2FS_NODE_FOOTER(node_block);
>>>    	fd = open("dump_nat", O_CREAT|O_WRONLY|O_TRUNC, 0666);
>>>    	ASSERT(fd >= 0);
>>> @@ -54,6 +56,7 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
>>>    	for (nid = start_nat; nid < end_nat; nid++) {
>>>    		struct f2fs_nat_entry raw_nat;
>>>    		struct node_info ni;
>>> +		int len;
>>>    		if(nid == 0 || nid == F2FS_NODE_INO(sbi) ||
>>>    					nid == F2FS_META_INO(sbi))
>>>    			continue;
>>> @@ -66,15 +69,15 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
>>>    			ret = dev_read_block(node_block, ni.blk_addr);
>>>    			ASSERT(ret >= 0);
>>>    			if (ni.blk_addr != 0x0) {
>>> -				memset(buf, 0, BUF_SZ);
>>> -				snprintf(buf, BUF_SZ,
>>> +				len = snprintf(buf, BUF_SZ,
>>>    					"nid:%5u\tino:%5u\toffset:%5u"
>>> -					"\tblkaddr:%10u\tpack:%d\n",
>>> +					"\tblkaddr:%10u\tpack:%d"
>>> +					"\tcp_ver:0x%08x\n",
>>>    					ni.nid, ni.ino,
>>> -					le32_to_cpu(F2FS_NODE_FOOTER(node_block)->flag) >>
>>> -						OFFSET_BIT_SHIFT,
>>> -					ni.blk_addr, pack);
>>> -				ret = write(fd, buf, strlen(buf));
>>> +					le32_to_cpu(footer->flag) >> OFFSET_BIT_SHIFT,
>>> +					ni.blk_addr, pack,
>>> +					(uint32_t)le64_to_cpu(footer->cp_ver));
>>
>> (uint64_t)le64_to_cpu(footer->cp_ver) ?
> 
> Is the upper 32 bits used for CRC?
> I've noticed that the checkpoint version dumped is always 32 bits long.
> To better compare with the current checkpoint, I only print the lower 32 bits here.

Do you want to compare high 32-bits crc value in cp_ver w/ crc value
in CP? maybe you can dump them to two hexadecimal numbers?

Thanks,

> 
>>
>>> +				ret = write(fd, buf, len);
>>>    				ASSERT(ret >= 0);
>>>    			}
>>>    		} else {
>>> @@ -87,15 +90,15 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
>>>    			ret = dev_read_block(node_block, ni.blk_addr);
>>>    			ASSERT(ret >= 0);
>>> -			memset(buf, 0, BUF_SZ);
>>> -			snprintf(buf, BUF_SZ,
>>> +			len = snprintf(buf, BUF_SZ,
>>>    				"nid:%5u\tino:%5u\toffset:%5u"
>>> -				"\tblkaddr:%10u\tpack:%d\n",
>>> +				"\tblkaddr:%10u\tpack:%d"
>>> +				"\tcp_ver:0x%08x\n",
>>>    				ni.nid, ni.ino,
>>> -				le32_to_cpu(F2FS_NODE_FOOTER(node_block)->flag) >>
>>> -					OFFSET_BIT_SHIFT,
>>> -				ni.blk_addr, pack);
>>> -			ret = write(fd, buf, strlen(buf));
>>> +				le32_to_cpu(footer->flag) >> OFFSET_BIT_SHIFT,
>>> +				ni.blk_addr, pack,
>>> +				(uint32_t)le64_to_cpu(footer->cp_ver));
>>
>> Ditto,
>>
>> Thanks,
>>
>>> +			ret = write(fd, buf, len);
>>>    			ASSERT(ret >= 0);
>>>    		}
>>>    	}
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
