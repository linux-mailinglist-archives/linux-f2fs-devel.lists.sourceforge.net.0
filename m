Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C985B1320
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Sep 2022 06:04:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oW8mR-0008Fz-7h;
	Thu, 08 Sep 2022 04:04:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oW8mP-0008Fs-TF
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Sep 2022 04:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JpSkwjXuTD7IJF4w4LR/1RjqE1USIEjM8ForX6jmZGQ=; b=jeptfwLwGsFKnsaVEXXuzrg4OG
 RYVFCy52A52h2Iz5ArCS3GNeU77ePe1LySDCSXGe2dDrzR5TmM3b9IwLx9B8t0PMD2Yt3PT35p2d7
 yIYj2w225BdEKIDHPUzMfh/3NPlDWz28ngLAWxf7VedXnADoCIl1tGioVQZTNwZW8bss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JpSkwjXuTD7IJF4w4LR/1RjqE1USIEjM8ForX6jmZGQ=; b=H1JcDnUguJcYz7MwfPdL4x1lmq
 nO/SrR5p2IVLWEXk5QR3S9cMSTTQbTPBXMKA8RS4paSNfhU4Wvks0gLS9qCTHSZVV7A7dBvgSPKc8
 9lxuOyRH7fvcQo5AcpV0dNKTYw/y1UPGVh9B9CnlWGD+OQT0UotMcW2rygYC+b4WMlew=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oW8mL-001len-Ds for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Sep 2022 04:04:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 59DEEB81DA8;
 Thu,  8 Sep 2022 04:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBA6C433D6;
 Thu,  8 Sep 2022 04:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662609865;
 bh=Pfin36yBLsukYe8SxnQDOOnpwg+6JrrFz2Da5ksuDMs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=t5uQD0Q62vRDkpq8WSGrOioapgY0CfwupxkOvS43tvfhGtfd7YwCBjH2g5XtG4qHV
 hjqe30gZhGCW9LAokV8GqL81N8CT7acbkiMUxfq5r/gdSlWYdan7LnErkjzxoNZzEt
 IC8OjxgCDO1R2JXtmsY4c9qzNstU1t7L4Q42cLdwFhOWG6GW4Sm/jB6MKuE6oUNWMk
 5nVMwG6UnzCZfj8TFQ2SjUqIz1sctnSyuPtQXKeChT0SR34L6WclaI/7mVaejdOFQE
 wk4DImX/z6d3nP2A/4eYF6oML5bHM4Z1yB6kfAxQ7DhfY6TpsqbUHdTSy7IGm5kFlq
 Pk2IEqcuDEETg==
Message-ID: <e5abac5f-433b-62d4-b2fa-974b5f978d61@kernel.org>
Date: Thu, 8 Sep 2022 12:04:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220830225358.300027-1-chao@kernel.org>
 <YxlNGeh6Sr4isEFf@google.com>
 <0af788ed-8797-22a2-ae0c-433fdd6a2188@kernel.org>
 <YxlRMRA7AVIusfav@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YxlRMRA7AVIusfav@google.com>
X-Spam-Score: -9.4 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/8 10:19, Jaegeuk Kim wrote: > On 09/08, Chao Yu
 wrote: >> On 2022/9/8 10:02, Jaegeuk Kim wrote: >>> On 08/31, Chao Yu wrote:
 >>>> From: Chao Yu <chao.yu@oppo.com> >>>> >>>> Introduce f2fs_ig [...] 
 Content analysis details:   (-9.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -4.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oW8mL-001len-Ds
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

On 2022/9/8 10:19, Jaegeuk Kim wrote:
> On 09/08, Chao Yu wrote:
>> On 2022/9/8 10:02, Jaegeuk Kim wrote:
>>> On 08/31, Chao Yu wrote:
>>>> From: Chao Yu <chao.yu@oppo.com>
>>>>
>>>> Introduce f2fs_iget_inner() for f2fs_fill_super() to get inner inode:
>>>> meta inode, node inode or compressed inode, and add f2fs_check_nid_range()
>>>> in f2fs_iget() to avoid getting inner inode from external interfaces.
>>>
>>> So, we don't want to check the range of inner inode numbers? What'd be the
>>> way to check it's okay?
>>
>> For node_ino, meta_ino, root_ino, we have checked them in sanity_check_raw_super()
>> as below:
>>
>> 	/* check reserved ino info */
>> 	if (le32_to_cpu(raw_super->node_ino) != 1 ||
>> 		le32_to_cpu(raw_super->meta_ino) != 2 ||
>> 		le32_to_cpu(raw_super->root_ino) != 3) {
>> 		f2fs_info(sbi, "Invalid Fs Meta Ino: node(%u) meta(%u) root(%u)",
>> 			  le32_to_cpu(raw_super->node_ino),
>> 			  le32_to_cpu(raw_super->meta_ino),
>> 			  le32_to_cpu(raw_super->root_ino));
>> 		return -EFSCORRUPTED;
>> 	}
>>
>> compressed_ino should always be NM_I(sbi)->max_nid, it can be checked in
>> f2fs_init_compress_inode()?
> 
> Hmm, I'm not sure whether we really need this patch, since it'd look better
> to handle all the iget with single f2fs_iget?

Well, the main concern is previously f2fs_iget() won't check validation for inner
inode due to it will skip do_read_inode() - f2fs_check_nid_range(), so that in a
fuzzed image, caller may pass inner ino into f2fs_iget(), result in incorrect use
of inner inode. So I add f2fs_check_nid_range() in prior to f2fs_iget_inner() in
f2fs_iget() as below to detect and avoid this case.

>>>> +struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	ret = f2fs_check_nid_range(F2FS_SB(sb), ino);
>>>> +	if (ret)
>>>> +		return ERR_PTR(ret);
>>>> +
>>>> +	return f2fs_iget_inner(sb, ino);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
