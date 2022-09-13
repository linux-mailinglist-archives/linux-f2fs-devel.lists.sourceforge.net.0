Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA0D5B681A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Sep 2022 08:44:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXzf8-0006RB-EC;
	Tue, 13 Sep 2022 06:44:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oXzf6-0006R5-HG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 06:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bv6rn897yo97tAInNH3O3D+nTm7k7OgcFu/6DlJ7Kmk=; b=IxCmOBQwi8CQjfLINwLfs1Zg5c
 iRCdKKnjwlu1SQVZe/9AKy7bgzW++ykBFn4qWc7kf++5AwjI3o4gtvElpLVxHs38dK1j5+hvpkOa9
 UuIk2NCJgfwAZcZvSDFYxqsy4ihLi52k+yJQXUnI+oM9zDftgQ8579pySZ8t/fGhsSSM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bv6rn897yo97tAInNH3O3D+nTm7k7OgcFu/6DlJ7Kmk=; b=hlGE6upYkfGnTW6adYgVEFSk/I
 Jz8ECH7IfnTbuVkoBoLiJMwjJbSDEaG6d/bL9f1I/qDLKJE7td4dZDrSYk1IMV7ItEeThSDRl4li7
 OuEo5+4ptEoI6ylEaQNNQP3xAkS1rpPvrqIMpVzItC+nUB0PY3BCbb7Iw0rLE8xC/P2c=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oXzf4-006d4I-9W for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 06:44:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0A7FAB80DFE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Sep 2022 06:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F0EC433C1;
 Tue, 13 Sep 2022 06:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663051470;
 bh=0e9xHpDVUmc8i3sNd336+sReKkmZIVLIQ0HMJ/k2lbw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=S5aRUfxdIXYuJPeMRwCwwVPHQdoxY1IV8PHIqccGRdOwJL6B2XCOLzW+tV5+ZUNhX
 jaLVJc1Jlm8nvDc7LMLNBptPTB9aWLLZVLVxOPucOlJFKbFgVkMeJH3Pq9Sm9ibYhk
 0wWiHBPlTdZO5XxwSb75tRyEuupHghBGAP9hNfy4NllflSuSAASYI1dfs3NSa4DlE5
 KBydAI+DCRa+XdH7KmTW87CSwVhVRQj+B8t2YPc5aFuXWdtQ35EJFuUmHo7hmvvKbq
 vxqJgcD3PXQjUQN9hTP8CjwsHqDMprGa2hLnaedMnAwlaHLtPyJpkXGGzekjUGhxEB
 JJVdyLyk+UAFA==
Message-ID: <4efaecb4-7179-ae6c-05b6-49a168b3c8bd@kernel.org>
Date: Tue, 13 Sep 2022 14:44:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220830225358.300027-1-chao@kernel.org>
 <YxlNGeh6Sr4isEFf@google.com>
 <0af788ed-8797-22a2-ae0c-433fdd6a2188@kernel.org>
 <YxlRMRA7AVIusfav@google.com>
 <e5abac5f-433b-62d4-b2fa-974b5f978d61@kernel.org>
 <Yx9SulcDlMfO/hiW@google.com>
 <6c54e0b1-9c75-af90-565b-61174ddb5cbc@kernel.org>
 <YyAbBroLzLPaSyCF@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YyAbBroLzLPaSyCF@google.com>
X-Spam-Score: -7.4 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/13 13:54, Jaegeuk Kim wrote: > On 09/13, Chao Yu
 wrote: >> On 2022/9/12 23:39, Jaegeuk Kim wrote: >>> On 09/08, Chao Yu wrote:
 >>>> On 2022/9/8 10:19, Jaegeuk Kim wrote: >>>>> On 09/08, Chao [...] 
 Content analysis details:   (-7.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oXzf4-006d4I-9W
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to disallow getting inner inode
 via f2fs_iget()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/9/13 13:54, Jaegeuk Kim wrote:
> On 09/13, Chao Yu wrote:
>> On 2022/9/12 23:39, Jaegeuk Kim wrote:
>>> On 09/08, Chao Yu wrote:
>>>> On 2022/9/8 10:19, Jaegeuk Kim wrote:
>>>>> On 09/08, Chao Yu wrote:
>>>>>> On 2022/9/8 10:02, Jaegeuk Kim wrote:
>>>>>>> On 08/31, Chao Yu wrote:
>>>>>>>> From: Chao Yu <chao.yu@oppo.com>
>>>>>>>>
>>>>>>>> Introduce f2fs_iget_inner() for f2fs_fill_super() to get inner inode:
>>>>>>>> meta inode, node inode or compressed inode, and add f2fs_check_nid_range()
>>>>>>>> in f2fs_iget() to avoid getting inner inode from external interfaces.
>>>>>>>
>>>>>>> So, we don't want to check the range of inner inode numbers? What'd be the
>>>>>>> way to check it's okay?
>>>>>>
>>>>>> For node_ino, meta_ino, root_ino, we have checked them in sanity_check_raw_super()
>>>>>> as below:
>>>>>>
>>>>>> 	/* check reserved ino info */
>>>>>> 	if (le32_to_cpu(raw_super->node_ino) != 1 ||
>>>>>> 		le32_to_cpu(raw_super->meta_ino) != 2 ||
>>>>>> 		le32_to_cpu(raw_super->root_ino) != 3) {
>>>>>> 		f2fs_info(sbi, "Invalid Fs Meta Ino: node(%u) meta(%u) root(%u)",
>>>>>> 			  le32_to_cpu(raw_super->node_ino),
>>>>>> 			  le32_to_cpu(raw_super->meta_ino),
>>>>>> 			  le32_to_cpu(raw_super->root_ino));
>>>>>> 		return -EFSCORRUPTED;
>>>>>> 	}
>>>>>>
>>>>>> compressed_ino should always be NM_I(sbi)->max_nid, it can be checked in
>>>>>> f2fs_init_compress_inode()?
>>>>>
>>>>> Hmm, I'm not sure whether we really need this patch, since it'd look better
>>>>> to handle all the iget with single f2fs_iget?
>>>>
>>>> Well, the main concern is previously f2fs_iget() won't check validation for inner
>>>> inode due to it will skip do_read_inode() - f2fs_check_nid_range(), so that in a
>>>> fuzzed image, caller may pass inner ino into f2fs_iget(), result in incorrect use
>>>> of inner inode. So I add f2fs_check_nid_range() in prior to f2fs_iget_inner() in
>>>> f2fs_iget() as below to detect and avoid this case.
>>>
>>> FWIW, sanity_check_raw_super() checked the inode numbers.
>>
>> However, previously, f2fs_iget() will return inner inode to caller directly, if caller
>> passes meta_ino, node_ino or compress_ino to f2fs_iget()?
> 
> Do you want to do sanity check on corrupted dentry? If so, how about checking

Yes, including:

- corrupted ino in dentry
- corrupted ino of orphan inode

As I replied in this thread:

https://lore.kernel.org/lkml/b1c74dc1-8d01-9041-9469-036273c5618d@kernel.org/

> it in f2fs_iget instead?
> 
> 	if (is_meta_ino(ino)) {
> 		if (!(inode->i_state & I_NEW)
> 			return -EFSCORRUPTED;
> 		goto make_now;
> 	}

Fine to me, let me revise in v3.

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>>>>>> +struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>>>>>>>> +{
>>>>>>>> +	int ret;
>>>>>>>> +
>>>>>>>> +	ret = f2fs_check_nid_range(F2FS_SB(sb), ino);
>>>>>>>> +	if (ret)
>>>>>>>> +		return ERR_PTR(ret);
>>>>>>>> +
>>>>>>>> +	return f2fs_iget_inner(sb, ino);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
