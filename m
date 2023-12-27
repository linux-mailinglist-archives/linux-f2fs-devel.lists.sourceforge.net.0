Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2355281EB0E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Dec 2023 02:05:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rIIM8-0001Mu-EZ;
	Wed, 27 Dec 2023 01:05:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rIIM7-0001Mo-Mx
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Dec 2023 01:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dEx1sjVHnbvKTwuV53pNEwfFEf3Yw01aeQgFayJVuDk=; b=fgjP2Jb0GIoX6Jv1DD8kflncWL
 pQ9Q7HDgUpOZdp458yJYPsYdVomXChfvHtcSsgbKgE8X9yBzyNFcqgVngHLIEcOoLmQ3Rz3t0SOY3
 Qiv2g6Ypr1XWYXSnJzr+r87ha1NC+k01LywU/FkP/CUxlx3cTAWF89UTu6daWxWtypaY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dEx1sjVHnbvKTwuV53pNEwfFEf3Yw01aeQgFayJVuDk=; b=ma3Bo/0tJHyebm46BbNGh7wRFM
 IeiIrkyHOElQYo/vOYItR4/XADj7Mz1Atd/MbTOgl2AxcamN/AGB1hrVWTWpOHnMTHR//Txgpsqbi
 aAOHS60AgJwkqvVc0n8m39RHjr0FvHHggrnktdvvihFMlN+vtXTvI2x/ANSGJ/UNBn+0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rIIM6-0005SZ-NF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Dec 2023 01:05:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 4B98AB80B63
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Dec 2023 01:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16A6C433C8;
 Wed, 27 Dec 2023 01:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703639092;
 bh=Yaq8MVAV2pEvBgI5YB3Fdymm0zCj071d01eFoMGANNA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Afuu6wVWCPR9h+jQq1UrLqjUKFxQS2sZET6g9LalUfIurewPqVgqrKdrCndAiC6AW
 S8/VN4NbEJNOimzrww/7mLgUzxeDcBmNPWL/r+DDih9aclMN7pJa9IAsczKv+lvcro
 8U8PHbctviBjuXEvv4m5ki+IzcnA9Me9UmYxerY7SzhxR9M/FhsFGhfJFuuD2BXPic
 EfesFxl3sjPziwyFX6OV80S7GwT3e4FiduJf+vUJmmIabODs8m58zwvB3vEbnwLbkr
 cFF5N1finq1FlqpE/9OuKK1tEOcICQbaDAAaXueqoVKloPCBnvm3LP5LmXQjvnSj/Y
 ZnoLGPF/4E4Dw==
Message-ID: <35f160e2-a9e4-4f76-af32-de00dce05fa1@kernel.org>
Date: Wed, 27 Dec 2023 09:04:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20231220135934.3471407-1-chao@kernel.org>
 <ZYs_S0VLFFnV1g-3@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZYs_S0VLFFnV1g-3@google.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/12/27 5:02, Jaegeuk Kim wrote: > On 12/20, Chao Yu
 wrote: >> If data block in compressed cluster is not persisted with metadata
 >> during checkpoint, after SPOR, the data may be corrupted, let [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.9 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rIIM6-0005SZ-NF
Subject: Re: [f2fs-dev] [PATCH 1/6] f2fs: compress: fix to guarantee
 persisting compressed blocks by CP
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

On 2023/12/27 5:02, Jaegeuk Kim wrote:
> On 12/20, Chao Yu wrote:
>> If data block in compressed cluster is not persisted with metadata
>> during checkpoint, after SPOR, the data may be corrupted, let's
>> guarantee to write compressed page by checkpoint.
>>
>> Fixes: 4c8ff7095bef ("f2fs: support data compression")
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/compress.c |  3 ++-
>>   fs/f2fs/data.c     | 12 +++++++++---
>>   fs/f2fs/f2fs.h     |  3 ++-
>>   3 files changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index 5b076329e9bf..1122db8cc0b0 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -1442,6 +1442,7 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
>>   	struct f2fs_sb_info *sbi = bio->bi_private;
>>   	struct compress_io_ctx *cic =
>>   			(struct compress_io_ctx *)page_private(page);
>> +	enum count_type type = WB_DATA_TYPE(page);
>>   	int i;
>>   
>>   	if (unlikely(bio->bi_status))
>> @@ -1449,7 +1450,7 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
>>   
>>   	f2fs_compress_free_page(page);
>>   
>> -	dec_page_count(sbi, F2FS_WB_DATA);
>> +	dec_page_count(sbi, type);
>>   
>>   	if (atomic_dec_return(&cic->pending_pages))
>>   		return;
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index d28c97282e68..6c72a6e86ba8 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -48,7 +48,7 @@ void f2fs_destroy_bioset(void)
>>   	bioset_exit(&f2fs_bioset);
>>   }
>>   
>> -static bool __is_cp_guaranteed(struct page *page)
>> +bool f2fs_is_cp_guaranteed(struct page *page)
>>   {
>>   	struct address_space *mapping = page->mapping;
>>   	struct inode *inode;
>> @@ -66,7 +66,7 @@ static bool __is_cp_guaranteed(struct page *page)
>>   		return true;
>>   
>>   	if (f2fs_is_compressed_page(page))
>> -		return false;
>> +		return true;
>>   	if ((S_ISREG(inode->i_mode) && IS_NOQUOTA(inode)) ||
>>   			page_private_gcing(page))
>>   		return true;
>> @@ -1007,6 +1007,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>>   	enum page_type btype = PAGE_TYPE_OF_BIO(fio->type);
>>   	struct f2fs_bio_info *io = sbi->write_io[btype] + fio->temp;
>>   	struct page *bio_page;
>> +	enum count_type type;
>>   
>>   	f2fs_bug_on(sbi, is_read_io(fio->op));
>>   
>> @@ -1046,7 +1047,12 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>>   	/* set submitted = true as a return value */
>>   	fio->submitted = 1;
>>   
>> -	inc_page_count(sbi, WB_DATA_TYPE(bio_page));
>> +	type = WB_DATA_TYPE(bio_page);
>> +	/* override count type if page is compressed one */
>> +	if (fio->compressed_page)
>> +		type = WB_DATA_TYPE(fio->compressed_page);
> 
> Doesn't bio_page already point fio->compressed_page?

Please check below codes, bio_page will point to fio->encrypted_page if
both software encryption feature and compression feature are on, for this
case, we still need to account F2FS_WB_CP_DATA.

	if (fio->encrypted_page)
		bio_page = fio->encrypted_page;
	else if (fio->compressed_page)
		bio_page = fio->compressed_page;
	else
		bio_page = fio->page;

Thanks,

> 
>> +
>> +	inc_page_count(sbi, type);
>>   
>>   	if (io->bio &&
>>   	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 76e9a8682e38..bcb3940ab5ba 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -1092,7 +1092,7 @@ struct f2fs_sm_info {
>>    * f2fs monitors the number of several block types such as on-writeback,
>>    * dirty dentry blocks, dirty node blocks, and dirty meta blocks.
>>    */
>> -#define WB_DATA_TYPE(p)	(__is_cp_guaranteed(p) ? F2FS_WB_CP_DATA : F2FS_WB_DATA)
>> +#define WB_DATA_TYPE(p)	(f2fs_is_cp_guaranteed(p) ? F2FS_WB_CP_DATA : F2FS_WB_DATA)
>>   enum count_type {
>>   	F2FS_DIRTY_DENTS,
>>   	F2FS_DIRTY_DATA,
>> @@ -3824,6 +3824,7 @@ void f2fs_init_ckpt_req_control(struct f2fs_sb_info *sbi);
>>    */
>>   int __init f2fs_init_bioset(void);
>>   void f2fs_destroy_bioset(void);
>> +bool f2fs_is_cp_guaranteed(struct page *page);
>>   int f2fs_init_bio_entry_cache(void);
>>   void f2fs_destroy_bio_entry_cache(void);
>>   void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, struct bio *bio,
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
