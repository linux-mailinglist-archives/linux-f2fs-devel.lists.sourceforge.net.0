Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8DA80E0AB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Dec 2023 02:05:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rCrDM-0003yD-1w;
	Tue, 12 Dec 2023 01:05:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rCrDL-0003y7-72
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Dec 2023 01:05:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mrXmipuWF8nzBE+uBUCPkjoBYxpVRmH2Fk3+w/+rlLA=; b=DVpFoMlb3McKvE793Nl2gKpIC9
 uISaxMQerIfVmTbX6F6rdMtGezDS0sHhcN8szNjreKPGheV0ZkKu9ojTHH7XTyif6vcx2UGVad5Ts
 UA2j3BK7f0gqIOyzhTJBXrCLMZqw1Q3uHSyhRJHWnrsSKOvhOCRq5mMJj0AwWxYQ0l48=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mrXmipuWF8nzBE+uBUCPkjoBYxpVRmH2Fk3+w/+rlLA=; b=PLZfNQw3a6wI/5uWP2IQ31TpvQ
 lr4xUnDbkptHiZ83kud2KF/vlwZjNrpQzErrWdRPRGkRO0DABZLB7WMd+tmxfoNVN2X0Q0yRvhIhZ
 TYYBoj2Pg14JIazXK1TbJVhgR9JQU4LLQ+THcfOeea/ZT82bTvytqPm61osIpnG7aMrw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rCrDG-0006dS-Kj for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Dec 2023 01:05:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 89CBEB810E8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Dec 2023 01:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148FEC433C8;
 Tue, 12 Dec 2023 01:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702343117;
 bh=gdeYmzLGW6q5hnej08l9tQkVl0oulGvc8W5Uv0V0XJ8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=S8nkUR+eJnFc4803EYqwm1jnlA4pKdl+goIF7OpuC/PzMZpNlElrOu6B5a8nSHAuU
 g96ltQKNBehLQlDsesGAaTn+vxLfhhRrQcmXBi67Ggd+D4BrNnM4tdMr0ejRskWPyb
 VeI/LsDc4hwOS3QGi32Ul1F8kjbb4/EhrnlNLkT3rhot5/3ovNLPgj5/PM+MBIHSSx
 xrF+yE6qqZNLUVxX3yublQapAxkv9aztESZmnOtsNCOFuRyEWVXsJOGEEByiA/snF5
 kZ72AETixuOiR9pOmZ1Z5iZfeeR7VgxYu4QUGiXTlYWnW0iHh+YPDRqgoxU8cJbbde
 +3L1bv95hg13g==
Message-ID: <5884e300-5384-4a49-9f8d-8cced50f4e6d@kernel.org>
Date: Tue, 12 Dec 2023 09:05:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20231210113547.3412782-1-chao@kernel.org>
 <20231210113547.3412782-5-chao@kernel.org> <ZXeJKCNrxcit0eTC@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZXeJKCNrxcit0eTC@google.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/12/12 6:11, Jaegeuk Kim wrote: > On 12/10, Chao Yu
 wrote: >> This patch adds i_size check during compress inode conversion in
 order >> to avoid .page_mkwrite races w/ conversion. > > Which rac [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rCrDG-0006dS-Kj
Subject: Re: [f2fs-dev] [PATCH 5/6] f2fs: fix to restrict condition of
 compress inode conversion
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

On 2023/12/12 6:11, Jaegeuk Kim wrote:
> On 12/10, Chao Yu wrote:
>> This patch adds i_size check during compress inode conversion in order
>> to avoid .page_mkwrite races w/ conversion.
> 
> Which race condition do you see?

Something like:

- f2fs_setflags_common
  - check S_ISREG && F2FS_HAS_BLOCKS
					- mkwrite
					 - f2fs_get_block_locked
					  : update metadata in old inode's disk layout
  - set_compress_context

Thanks,

> 
>>
>> Fixes: 4c8ff7095bef ("f2fs: support data compression")
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/f2fs.h | 8 +++++++-
>>   fs/f2fs/file.c | 5 ++---
>>   2 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 65294e3b0bef..c9b8a1953913 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -4397,13 +4397,19 @@ static inline int set_compress_context(struct inode *inode)
>>   #endif
>>   }
>>   
>> +static inline bool inode_has_data(struct inode *inode)
>> +{
>> +	return (S_ISREG(inode->i_mode) &&
>> +		(F2FS_HAS_BLOCKS(inode) || i_size_read(inode)));
>> +}
>> +
>>   static inline bool f2fs_disable_compressed_file(struct inode *inode)
>>   {
>>   	struct f2fs_inode_info *fi = F2FS_I(inode);
>>   
>>   	if (!f2fs_compressed_file(inode))
>>   		return true;
>> -	if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))
>> +	if (inode_has_data(inode))
>>   		return false;
>>   
>>   	fi->i_flags &= ~F2FS_COMPR_FL;
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 1a3c29a9a6a0..8af4b29c3e1a 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -1922,8 +1922,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>>   
>>   			f2fs_down_write(&F2FS_I(inode)->i_sem);
>>   			if (!f2fs_may_compress(inode) ||
>> -					(S_ISREG(inode->i_mode) &&
>> -					F2FS_HAS_BLOCKS(inode))) {
>> +					inode_has_data(inode)) {
>>   				f2fs_up_write(&F2FS_I(inode)->i_sem);
>>   				return -EINVAL;
>>   			}
>> @@ -3996,7 +3995,7 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
>>   		goto out;
>>   	}
>>   
>> -	if (F2FS_HAS_BLOCKS(inode)) {
>> +	if (inode_has_data(inode)) {
>>   		ret = -EFBIG;
>>   		goto out;
>>   	}
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
