Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2AA5A710F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Aug 2022 00:45:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oT9yr-0008LE-Qo;
	Tue, 30 Aug 2022 22:45:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oT9yl-0008L3-EC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Aug 2022 22:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lYJ7pWaJQ9zYtuQvfE6cioYKdwTSx4sLmFmAdx9yI6k=; b=BA/r77xehL/ND7A2M8bAACKRyT
 45whHvEKPwWj7AX8MX6KXy4C9h0n8gJeuZSzrlnLOEiUOu5M9sBu17xYCUrJlUomWIFoiGxEkdhor
 rgFtlr2xTtGXTm+0X5OHrdxTiqFd+J5Hyb0A5Zrl6WVXvfoV9Oi+p8ksWTyp1pLzdUDE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lYJ7pWaJQ9zYtuQvfE6cioYKdwTSx4sLmFmAdx9yI6k=; b=HKdkeo/yRPzt7iq1H9aVIZXfLo
 cwewQCvLOPtGu7WjA0lLvfULVPIhvwZlU4ZN6v9f8x5EHdjMW344X8j5sA4wBcqqvRPHiiKN/mbnD
 7kb0vruzd8op+ISvx2Fr8EJPT2P02l4pWiCISt5LCkAps1zY4xQunvleWk7p4a55FAos=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oT9yi-0084vm-EN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Aug 2022 22:45:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 235B1B81D9F;
 Tue, 30 Aug 2022 22:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9016C433D6;
 Tue, 30 Aug 2022 22:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661899488;
 bh=cyRVqocYikABXBEFjBEpFUrn8ly9LlwBG3w4/jaRINg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WljNquIlEza3oah5WIlJjNp1TVa+5HdDoJXRWjS8aoBN5hi1u0q7ttH6DmPmLWawM
 qnKOyOgJg7hKpovyX9urrbFCKrf+XKWNB4POT2yIWyDltTRDwG56j/szI473FPJBp5
 30/khFQdQVSjG2iJYydbJVc5onQQ03Actqmq2aeRkjn7Trec6lnLGGVglXbh6E1Clf
 75lV1xJsbry4tXTM1olwe8YPQZFzMqAKNTw8PMM7reoNFI1xj8nqG2NBfxa8bRBXcR
 9vEESjFFNl3iyJsNtwiRzjdo/KjVtYcWpPQhN7phXd2ohpZ56CiKIWDccdI8EAiC0D
 uymJ/BNa7XBNQ==
Message-ID: <b1c74dc1-8d01-9041-9469-036273c5618d@kernel.org>
Date: Wed, 31 Aug 2022 06:44:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220830103625.79034-1-chao@kernel.org>
 <Yw5SdK5ItK9P/NUj@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Yw5SdK5ItK9P/NUj@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/8/31 2:09, Jaegeuk Kim wrote: > On 08/30, Chao Yu
 wrote: >> From: Chao Yu <chao.yu@oppo.com> >> >> Introduce f2fs_iget_inner()
 for f2fs_fill_super() to get inner inode: >> meta inode, node ino [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oT9yi-0084vm-EN
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to disallow getting inner inode
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

On 2022/8/31 2:09, Jaegeuk Kim wrote:
> On 08/30, Chao Yu wrote:
>> From: Chao Yu <chao.yu@oppo.com>
>>
>> Introduce f2fs_iget_inner() for f2fs_fill_super() to get inner inode:
>> meta inode, node inode or compressed inode, and add f2fs_check_nid_range()
>> in f2fs_iget() to avoid getting inner inode from external interfaces.
>>
>> Signed-off-by: Chao Yu <chao.yu@oppo.com>
>> ---
>>   fs/f2fs/compress.c |  2 +-
>>   fs/f2fs/f2fs.h     |  1 +
>>   fs/f2fs/inode.c    | 10 +++++++++-
>>   fs/f2fs/super.c    |  4 ++--
>>   4 files changed, 13 insertions(+), 4 deletions(-)
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
>> index 6d11c365d7b4..0ab3ae9b2110 100644
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
>> @@ -568,6 +568,14 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>>   	return ERR_PTR(ret);
>>   }
>>   
>> +struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>> +{
>> +	if (f2fs_check_nid_range(F2FS_SB(sb), ino))
>> +		return -EINVAL;
> 
> EINVAL or EFSCORRUPTED used in f2fs_check_nid_range?

Oh, I guess returning EFSCORRUPTED will be better.

> Do we have a report on this before?

Not yet, but I guess it is possible in a fuzzed image like below paths, due to
we will not check ino before pass it to f2fs_iget(), and then f2fs_iget() will
find/return a hashed internal inode to caller, which should be avoided.

case #1
recover_dentry()

	de = __f2fs_find_entry(dir, &fname, &page);
	if (de && inode->i_ino == le32_to_cpu(de->ino))
		goto out_put;

	if (de) {
		einode = f2fs_iget_retry(inode->i_sb, le32_to_cpu(de->ino));
		if (IS_ERR(einode)) {
			WARN_ON(1);
			err = PTR_ERR(einode);
			if (err == -ENOENT)
				err = -EEXIST;
			goto out_put;
		}

case #2
static int recover_orphan_inode(struct f2fs_sb_info *sbi, nid_t ino)
{
	struct inode *inode;
	struct node_info ni;
	int err;

	inode = f2fs_iget_retry(sbi->sb, ino);

Thanks,

> 
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
