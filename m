Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5461D6D715B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 02:35:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjr7n-0005au-4v;
	Wed, 05 Apr 2023 00:35:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pjr7k-0005an-HG
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 00:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0bsk+BkDowxvPdwUIfF/QhzF53tiyXbdWpKrmQnbj8w=; b=C/vB/1P0ar2MfT3ZQoJuaded75
 ChIfY/cE42wLM767uXDH6rNClPrRWT7+HjGWAL+ClyPxGtkO/KzZ+P/2QbCH4hczfH1d3odc+qfxh
 aWIdf9T/lZ0IhNH248MIA9hkbVxPM/YD9zBBN4TW/866uGXmtwyL+saD/UyBJ7TzPAzM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0bsk+BkDowxvPdwUIfF/QhzF53tiyXbdWpKrmQnbj8w=; b=HrDHIpZMu3RKzqv+AO2xuBRNzu
 nSu2x28iQwO2TllpehqpPt7bFOQdfeBfsuF0y3NqLGMhcY2yeh+rQUqbbmUmTKGabJWjZuZdUMTNB
 LJkiDxQFTB517ofC7s3iwi8ZBMKI+RPVT5+ucQFnaWdzPA8WJZNmRKt84W+JHHtimMwo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjr7e-00FWKp-C8 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 00:35:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A91163A06;
 Wed,  5 Apr 2023 00:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778E9C433EF;
 Wed,  5 Apr 2023 00:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680654926;
 bh=mwyGRFVE7UXU4VltUnClGeQB9w/yKZov+rkmzpNbM7M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Le3fqn8WuECi4wtHkaO/GkVlYAF1Z4ZCEfhJ1FzLfSxmMR500cNi2LpgxfTswhzou
 LZr045meU2rt1qbQOZlISDiymqJFAn7MVEh037VpmhN57pF7A5WeXJsTWu5iSzZ+y4
 kytSvQ4kt+C5w92Le6AY4Hg8CsgddJAq0bq91DxjESj76oqL6p/hWZLbmRcI1h2G5c
 0ihhvavPq4qgyu4cAUpaEWGZaL+PbO27xDzGnPepGXCYdlpVBubXiWbkr2GOyzHLHt
 kERrOaGz1BNR8qZvvXM/Fo+7unvzhtk5JKRMadV/KIHFPRrUKL8jY25ycJNP/3wbfS
 +aQlA9UMzd11g==
Message-ID: <0a85063f-ec04-d7e8-83bc-c716aeb9e79a@kernel.org>
Date: Wed, 5 Apr 2023 08:35:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <CGME20230321001251epcms2p4c1fd48495643dbfca2cf82a433490bb8@epcms2p4>
 <20230321001251epcms2p4c1fd48495643dbfca2cf82a433490bb8@epcms2p4>
 <48f18a16-c6d8-3df4-55c5-11546e7dde35@kernel.org>
 <ZCsGfTM1SjLblTVG@google.com>
 <87c74724-da3d-c5fd-b70d-b80a48ec058e@kernel.org>
 <ZCyV8ZSrj1rlJslZ@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZCyV8ZSrj1rlJslZ@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/5 5:26, Jaegeuk Kim wrote: > On 04/04,
 Chao Yu wrote:
 >> On 2023/4/4 1:01, Jaegeuk Kim wrote: >>> On 04/01, Chao Yu wrote: >>>>
 On 2023/3/21 8:12, Yonggil Song wrote: >>>>> When f2fs tries t [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjr7e-00FWKp-C8
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Fix system crash due to lack of
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/5 5:26, Jaegeuk Kim wrote:
> On 04/04, Chao Yu wrote:
>> On 2023/4/4 1:01, Jaegeuk Kim wrote:
>>> On 04/01, Chao Yu wrote:
>>>> On 2023/3/21 8:12, Yonggil Song wrote:
>>>>> When f2fs tries to checkpoint during foreground gc in LFS mode, system
>>>>> crash occurs due to lack of free space if the amount of dirty node and
>>>>> dentry pages generated by data migration exceeds free space.
>>>>> The reproduction sequence is as follows.
>>>>>
>>>>>     - 20GiB capacity block device (null_blk)
>>>>>     - format and mount with LFS mode
>>>>>     - create a file and write 20,000MiB
>>>>>     - 4k random write on full range of the file
>>>>>
>>>>>     RIP: 0010:new_curseg+0x48a/0x510 [f2fs]
>>>>>     Code: 55 e7 f5 89 c0 48 0f af c3 48 8b 5d c0 48 c1 e8 20 83 c0 01 89 43 6c 48 83 c4 28 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc <0f> 0b f0 41 80 4f 48 04 45 85 f6 0f 84 ba fd ff ff e9 ef fe ff ff
>>>>>     RSP: 0018:ffff977bc397b218 EFLAGS: 00010246
>>>>>     RAX: 00000000000027b9 RBX: 0000000000000000 RCX: 00000000000027c0
>>>>>     RDX: 0000000000000000 RSI: 00000000000027b9 RDI: ffff8c25ab4e74f8
>>>>>     RBP: ffff977bc397b268 R08: 00000000000027b9 R09: ffff8c29e4a34b40
>>>>>     R10: 0000000000000001 R11: ffff977bc397b0d8 R12: 0000000000000000
>>>>>     R13: ffff8c25b4dd81a0 R14: 0000000000000000 R15: ffff8c2f667f9000
>>>>>     FS: 0000000000000000(0000) GS:ffff8c344ec80000(0000) knlGS:0000000000000000
>>>>>     CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>>     CR2: 000000c00055d000 CR3: 0000000e30810003 CR4: 00000000003706e0
>>>>>     DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>>>>     DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>>>>>     Call Trace:
>>>>>     <TASK>
>>>>>     allocate_segment_by_default+0x9c/0x110 [f2fs]
>>>>>     f2fs_allocate_data_block+0x243/0xa30 [f2fs]
>>>>>     ? __mod_lruvec_page_state+0xa0/0x150
>>>>>     do_write_page+0x80/0x160 [f2fs]
>>>>>     f2fs_do_write_node_page+0x32/0x50 [f2fs]
>>>>>     __write_node_page+0x339/0x730 [f2fs]
>>>>>     f2fs_sync_node_pages+0x5a6/0x780 [f2fs]
>>>>>     block_operations+0x257/0x340 [f2fs]
>>>>>     f2fs_write_checkpoint+0x102/0x1050 [f2fs]
>>>>>     f2fs_gc+0x27c/0x630 [f2fs]
>>>>>     ? folio_mark_dirty+0x36/0x70
>>>>>     f2fs_balance_fs+0x16f/0x180 [f2fs]
>>>>>
>>>>> This patch adds checking whether free sections are enough before checkpoint
>>>>> during gc.
>>>>>
>>>>> Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
>>>>> ---
>>>>>     fs/f2fs/gc.c      | 10 ++++++++--
>>>>>     fs/f2fs/gc.h      |  2 ++
>>>>>     fs/f2fs/segment.h | 27 ++++++++++++++++++++++-----
>>>>>     3 files changed, 32 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>>>>> index 4546e01b2ee0..dd563866d3c9 100644
>>>>> --- a/fs/f2fs/gc.c
>>>>> +++ b/fs/f2fs/gc.c
>>>>> @@ -1773,6 +1773,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>>>>>     		.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
>>>>>     	};
>>>>>     	unsigned int skipped_round = 0, round = 0;
>>>>> +	unsigned int need_lower = 0, need_upper = 0;
>>>>>     	trace_f2fs_gc_begin(sbi->sb, gc_type, gc_control->no_bg_gc,
>>>>>     				gc_control->nr_free_secs,
>>>>> @@ -1858,8 +1859,13 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>>>>>     		}
>>>>>     	}
>>>>> -	/* Write checkpoint to reclaim prefree segments */
>>>>> -	if (free_sections(sbi) < NR_CURSEG_PERSIST_TYPE &&
>>>>> +	ret = get_need_secs(sbi, &need_lower, &need_upper);
>>>>
>>>> Can we avoid calling has_curseg_enough_space() for this case?
>>>
>>> Why? :P
>>
>> We won't check the return value of get_need_secs(), so it's not needed to call
>> has_curseg_enough_space() in get_need_secs() in this path, right?
> 
> I see. Thanks. I think we can do like this:
> 
> Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
> [Jaegeuk Kim: code clean-up]
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Better, thanks! :)

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
