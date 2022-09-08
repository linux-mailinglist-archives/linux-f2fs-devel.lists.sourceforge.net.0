Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7838D5B125D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Sep 2022 04:12:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oW71V-0006MX-OO;
	Thu, 08 Sep 2022 02:12:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oW71H-0006MB-9E
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Sep 2022 02:11:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JbRHhzdyKB2WSaRWuBdWVCoOP/2hfKEZCqHoOH66o2o=; b=a/7y8NvGa/aSeCew/SNRwWuCXk
 TkODrU4Ep+orW50ejumsjf0DjC0liLwPdg/2avtMXZgUY1Ug33duxtu9fR3f0oYrsDOtrP6WTf4Db
 zFfcUv7jyDjQTKE65a66K1f/MfCdsm3L15KcvRWrMOd8sok0hhybID+HVijTfGaWRNTU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JbRHhzdyKB2WSaRWuBdWVCoOP/2hfKEZCqHoOH66o2o=; b=ev3CwlvFvnZik+XHMjRzpHi9h0
 DPkHuzpxX8Ip8xw1g8YftADS6DAJD2kI7AYhDmH6Z7incS04eJ6to4WLDC1IAV2L9eL0zop6/TTgz
 W6nTRsxVA9woWpiNkbdWIFQ2DFb/nxhcL/tVMbzi4cqLTymIjSpuR6lopPEDxQZdDrcE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oW71G-001hF9-Ae for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Sep 2022 02:11:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DFFD0B81F53;
 Thu,  8 Sep 2022 02:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA44C433D6;
 Thu,  8 Sep 2022 02:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662603106;
 bh=uV6fHvWLrW9oUUvLJaMCTiPsk7SdJN2d7KArwXblLIw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WnvRvutecSNrVpSDb638Iel8sGedSJvts/q3V43cr3GKiXQRsM3Ct9+PdiDhbpFdd
 0CKIRvzNkvdLgUx8kopOQ9PrTDQtSvLRiCs3elts1MX6mTNubvycW5qvZybPnRKexL
 ByxHrI0ZM1+Tfd7gkPwS7HTgOM75Bm7L1pPb7EMzwihylCDt90+4g9VDCPTBwU8QrA
 4a7ewnntBkDFse3EqoOa8MU2lokucpEWUl9OmUYG0HFJgsMMGiNjPag0Ska4EvIftD
 iPD60l3dcoVONldzRew44Z377pL16yofkaZVnz1OAlDo99FNO200cj0xkeVooEE0Ea
 x3lH2PnP3jSuQ==
Message-ID: <0af788ed-8797-22a2-ae0c-433fdd6a2188@kernel.org>
Date: Thu, 8 Sep 2022 10:11:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20220830225358.300027-1-chao@kernel.org>
 <YxlNGeh6Sr4isEFf@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YxlNGeh6Sr4isEFf@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/8 10:02, Jaegeuk Kim wrote: > On 08/31, Chao Yu
 wrote: >> From: Chao Yu <chao.yu@oppo.com> >> >> Introduce f2fs_iget_inner()
 for f2fs_fill_super() to get inner inode: >> meta inode, node ino [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
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
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oW71G-001hF9-Ae
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

On 2022/9/8 10:02, Jaegeuk Kim wrote:
> On 08/31, Chao Yu wrote:
>> From: Chao Yu <chao.yu@oppo.com>
>>
>> Introduce f2fs_iget_inner() for f2fs_fill_super() to get inner inode:
>> meta inode, node inode or compressed inode, and add f2fs_check_nid_range()
>> in f2fs_iget() to avoid getting inner inode from external interfaces.
> 
> So, we don't want to check the range of inner inode numbers? What'd be the
> way to check it's okay?

For node_ino, meta_ino, root_ino, we have checked them in sanity_check_raw_super()
as below:

	/* check reserved ino info */
	if (le32_to_cpu(raw_super->node_ino) != 1 ||
		le32_to_cpu(raw_super->meta_ino) != 2 ||
		le32_to_cpu(raw_super->root_ino) != 3) {
		f2fs_info(sbi, "Invalid Fs Meta Ino: node(%u) meta(%u) root(%u)",
			  le32_to_cpu(raw_super->node_ino),
			  le32_to_cpu(raw_super->meta_ino),
			  le32_to_cpu(raw_super->root_ino));
		return -EFSCORRUPTED;
	}

compressed_ino should always be NM_I(sbi)->max_nid, it can be checked in
f2fs_init_compress_inode()?

Thanks,

> 
>>
>> Signed-off-by: Chao Yu <chao.yu@oppo.com>
>> ---
>> v2:
>> - don't override errno from f2fs_check_nid_range()
>> - fix compile error
>>   fs/f2fs/compress.c |  2 +-
>>   fs/f2fs/f2fs.h     |  1 +
>>   fs/f2fs/inode.c    | 13 ++++++++++++-
>>   fs/f2fs/super.c    |  4 ++--
>>   4 files changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index 730256732a9e..c38b22bb6432 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -1947,7 +1947,7 @@ int f2fs_init_compress_inode(struct f2fs_sb_info *sbi)
>>   	if (!test_opt(sbi, COMPRESS_CACHE))
>>   		return 0;
>>   
>> -	inode = f2fs_iget(sbi->sb, F2FS_COMPRESS_INO(sbi));
>> +	inode = f2fs_iget_inner(sbi->sb, F2FS_COMPRESS_INO(sbi));
>>   	if (IS_ERR(inode))
>>   		return PTR_ERR(inode);
>>   	sbi->compress_inode = inode;
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 408d8034ed74..35f9e1a6a1bf 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -3467,6 +3467,7 @@ int f2fs_pin_file_control(struct inode *inode, bool inc);
>>   void f2fs_set_inode_flags(struct inode *inode);
>>   bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct page *page);
>>   void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page);
>> +struct inode *f2fs_iget_inner(struct super_block *sb, unsigned long ino);
>>   struct inode *f2fs_iget(struct super_block *sb, unsigned long ino);
>>   struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino);
>>   int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink);
>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>> index 6d11c365d7b4..965f87c1dd63 100644
>> --- a/fs/f2fs/inode.c
>> +++ b/fs/f2fs/inode.c
>> @@ -480,7 +480,7 @@ static int do_read_inode(struct inode *inode)
>>   	return 0;
>>   }
>>   
>> -struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>> +struct inode *f2fs_iget_inner(struct super_block *sb, unsigned long ino)
>>   {
>>   	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>>   	struct inode *inode;
>> @@ -568,6 +568,17 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>>   	return ERR_PTR(ret);
>>   }
>>   
>> +struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>> +{
>> +	int ret;
>> +
>> +	ret = f2fs_check_nid_range(F2FS_SB(sb), ino);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return f2fs_iget_inner(sb, ino);
>> +}
>> +
>>   struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino)
>>   {
>>   	struct inode *inode;
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index b8e5fe244596..a5f5e7483791 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -4157,7 +4157,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>>   		goto free_xattr_cache;
>>   
>>   	/* get an inode for meta space */
>> -	sbi->meta_inode = f2fs_iget(sb, F2FS_META_INO(sbi));
>> +	sbi->meta_inode = f2fs_iget_inner(sb, F2FS_META_INO(sbi));
>>   	if (IS_ERR(sbi->meta_inode)) {
>>   		f2fs_err(sbi, "Failed to read F2FS meta data inode");
>>   		err = PTR_ERR(sbi->meta_inode);
>> @@ -4265,7 +4265,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>>   		goto free_nm;
>>   
>>   	/* get an inode for node space */
>> -	sbi->node_inode = f2fs_iget(sb, F2FS_NODE_INO(sbi));
>> +	sbi->node_inode = f2fs_iget_inner(sb, F2FS_NODE_INO(sbi));
>>   	if (IS_ERR(sbi->node_inode)) {
>>   		f2fs_err(sbi, "Failed to read node inode");
>>   		err = PTR_ERR(sbi->node_inode);
>> -- 
>> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
