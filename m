Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0506B8AB8B1
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Apr 2024 04:29:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ry0U2-0001FB-RV;
	Sat, 20 Apr 2024 02:29:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ry0U1-0001F1-1N
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Apr 2024 02:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P/f2rMWxqF1zp8eOW38+zco3CfRfJdAYA5IrRKbOixc=; b=CY3DFPzSoQQAce8nU/BcbyfVit
 Mdmpp79b5uCc19823EMlazkJ5VUCELaTFtvcIekpTfUS0d/o5pDl46Oec1WP8QExoFLFs3ADhYF96
 pEu9l0F2VR1hvflRRUbmIEeLLVHLntjT645D7RYGA14lJfos7C2ThbaVoU9YN3jrBZgs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P/f2rMWxqF1zp8eOW38+zco3CfRfJdAYA5IrRKbOixc=; b=U8dIDhgCL/aB4rwGYo5gyig4gY
 yKlBRGA1ZdjXjeX3jgO8oVBRUML3AL4tYmBT/G+WoaqnCYwO3yFfDxb4J08icD9TEZfkgBpNF2MBW
 76krdcuVUZ6cSmbOpx8QhgatqVd2FFPIJYlpnuHTH1WXtmLFwEDA0rQ4+0RE9f9/igmE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ry0Tz-0006GM-Bn for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Apr 2024 02:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 95F2061A1B;
 Sat, 20 Apr 2024 02:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FECC072AA;
 Sat, 20 Apr 2024 02:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713580169;
 bh=Zj+Ogh39xK3UVqRSVy/m/GTxBKMVuCZMKLD1aaqY2AY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rcPk9puFrwkLZLePcpkE1JwO+26xtTkFCtyWJzrcHUZW9C8FJVR1RWPIWXe4ZY8ms
 OevZaopOValGfzX7etqqftS2dWYabEpMbfwqL23vJdUoMGdQblYdmJqgwmd5K2S44f
 7FvpSYbvBGmDwht/jk61zgIAiQzYGYu3fBRAOCv2HoFTk5GFLfS3V6Jil5briTRmVE
 xgfqW0V7sVpQasvPan3SNKHxrR235cviMPfnZqqSTG+Ypnkf/bL57iicYu4UWb3R4x
 +VXYEnB4iVqMGcgWJdZOPwsZfzv9NWE/4SqnFS98tUyqZV27YxotuPnpdW/CxJwfoW
 n9ppBb68NI1SQ==
Message-ID: <feb59013-b002-4064-8d50-656af2790897@kernel.org>
Date: Sat, 20 Apr 2024 10:29:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240418033334.861570-1-chao@kernel.org>
 <ZiKvg81HxG088cwm@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <ZiKvg81HxG088cwm@google.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/20 1:53, Jaegeuk Kim wrote: > Thanks, Chao, > >
 If you don't mind, can I merge this into my patch. Ok? No problem. :) Thanks, 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ry0Tz-0006GM-Bn
Subject: Re: [f2fs-dev] [PATCH] f2fs: assign write hint in direct write IO
 path
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
Cc: Hyunchul Lee <cheol.lee@lge.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/4/20 1:53, Jaegeuk Kim wrote:
> Thanks, Chao,
> 
> If you don't mind, can I merge this into my patch. Ok?

No problem. :)

Thanks,

> 
> On 04/18, Chao Yu wrote:
>> f2fs has its own write_hint policy, let's assign write hint for
>> direct write bio.
>>
>> Cc: Hyunchul Lee <cheol.lee@lge.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/f2fs.h    |  1 +
>>   fs/f2fs/file.c    | 15 ++++++++++++++-
>>   fs/f2fs/segment.c | 17 +++++++++++------
>>   3 files changed, 26 insertions(+), 7 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index b3b878acc86b..3f7196122574 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -3722,6 +3722,7 @@ void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
>>   			block_t old_addr, block_t new_addr,
>>   			unsigned char version, bool recover_curseg,
>>   			bool recover_newaddr);
>> +int f2fs_get_segment_temp(int seg_type);
>>   int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>>   			block_t old_blkaddr, block_t *new_blkaddr,
>>   			struct f2fs_summary *sum, int type,
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index ac1ae85f3cc3..d382f8bc2fbe 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -4685,8 +4685,21 @@ static int f2fs_dio_write_end_io(struct kiocb *iocb, ssize_t size, int error,
>>   	return 0;
>>   }
>>   
>> +static void f2fs_dio_write_submit_io(const struct iomap_iter *iter,
>> +					struct bio *bio, loff_t file_offset)
>> +{
>> +	struct inode *inode = iter->inode;
>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>> +	int seg_type = f2fs_rw_hint_to_seg_type(inode->i_write_hint);
>> +	enum temp_type temp = f2fs_get_segment_temp(seg_type);
>> +
>> +	bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi, DATA, temp);
>> +	submit_bio(bio);
>> +}
>> +
>>   static const struct iomap_dio_ops f2fs_iomap_dio_write_ops = {
>> -	.end_io = f2fs_dio_write_end_io,
>> +	.end_io		= f2fs_dio_write_end_io,
>> +	.submit_io	= f2fs_dio_write_submit_io,
>>   };
>>   
>>   static void f2fs_flush_buffered_write(struct address_space *mapping,
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index daa94669f7ee..2206199e8099 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -3502,6 +3502,15 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>>   	}
>>   }
>>   
>> +int f2fs_get_segment_temp(int seg_type)
>> +{
>> +	if (IS_HOT(seg_type))
>> +		return HOT;
>> +	else if (IS_WARM(seg_type))
>> +		return WARM;
>> +	return COLD;
>> +}
>> +
>>   static int __get_segment_type(struct f2fs_io_info *fio)
>>   {
>>   	int type = 0;
>> @@ -3520,12 +3529,8 @@ static int __get_segment_type(struct f2fs_io_info *fio)
>>   		f2fs_bug_on(fio->sbi, true);
>>   	}
>>   
>> -	if (IS_HOT(type))
>> -		fio->temp = HOT;
>> -	else if (IS_WARM(type))
>> -		fio->temp = WARM;
>> -	else
>> -		fio->temp = COLD;
>> +	fio->temp = f2fs_get_segment_temp(type);
>> +
>>   	return type;
>>   }
>>   
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
