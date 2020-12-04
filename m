Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DA92CE4DC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 02:19:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkzkh-0003Lr-33; Fri, 04 Dec 2020 01:19:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kkzkS-0003LK-QL
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 01:19:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TCgPhXOmxvalx6g1Vx1mlakcJF3PER9zZxv+5A345Sc=; b=N2wTsqRUPqK67gz3sDTtDRBmBu
 cNqhHQBEMzRfGmA8oWrDfQ5IFd4/xT8EjgPq7ch/jr1P5OUQGhIXflMoWzNKe5GUtc1XpP7/HrA8M
 EbvVSEyp4v7Vi/267Mmm56kKNwXuUYnRSRBQb7psBLGvU0D+x6wfr50M2NvCHkt9sIrI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TCgPhXOmxvalx6g1Vx1mlakcJF3PER9zZxv+5A345Sc=; b=l84rM8jH+FaauOlMVWr+58KCNu
 CzC1wTVsS7BLLxBpNyKBS1jTi+1WWAztYysO4uosr/NEiaZjjWCl3RJiILfEwAlSK0jUSVnGrlHdw
 Dzs4IhXKfumsbQouihsGT6NlA/15thb6Az6f9Det46LZ+tlXv/dOyvXkj+VYiAxr3dlQ=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkzkJ-00EH3x-Ph
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 01:19:00 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CnFFW06kwz15Q6h;
 Fri,  4 Dec 2020 09:18:07 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 4 Dec 2020
 09:18:31 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20201203061715.60447-1-yuchao0@huawei.com>
 <X8k9UoUKcyThlJNU@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <8d735b5a-7940-6409-bcfe-d5a855a74d74@huawei.com>
Date: Fri, 4 Dec 2020 09:18:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <X8k9UoUKcyThlJNU@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kkzkJ-00EH3x-Ph
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: compress: support compress level
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/4 3:32, Eric Biggers wrote:
> On Thu, Dec 03, 2020 at 02:17:15PM +0800, Chao Yu wrote:
>> +config F2FS_FS_LZ4HC
>> +	bool "LZ4HC compression support"
>> +	depends on F2FS_FS_COMPRESSION
>> +	depends on F2FS_FS_LZ4
>> +	select LZ4HC_COMPRESS
>> +	default y
>> +	help
>> +	  Support LZ4HC compress algorithm, if unsure, say Y.
>> +
> 
> It would be helpful to mention that LZ4HC is on-disk compatible with LZ4.

Sure, let me update description.

> 
>>   static int lz4_compress_pages(struct compress_ctx *cc)
>>   {
>>   	int len;
>>   
>> +#ifdef CONFIG_F2FS_FS_LZ4HC
>> +	return lz4hc_compress_pages(cc);
>> +#endif
> 
> This looks wrong; it always calls lz4hc compression even for regular lz4.

It's fine. lz4hc_compress_pages() will call LZ4_compress_HC() only when
compress level is set.

> 
>>   static int parse_options(struct super_block *sb, char *options, bool is_remount)
>>   {
>>   	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>> @@ -886,10 +939,22 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>>   			if (!strcmp(name, "lzo")) {
>>   				F2FS_OPTION(sbi).compress_algorithm =
>>   								COMPRESS_LZO;
>> -			} else if (!strcmp(name, "lz4")) {
>> +			} else if (!strncmp(name, "lz4", 3)) {
> 
> strcmp() is fine, no need for strncmp().

Actually, I reuse "lz4" mount option parameter, to enable lz4hc algorithm, user
only need to specify compress level after "lz4" string, e.g.
compress_algorithm=lz4, f2fs use lz4 algorithm
compress_algorithm=lz4:xx, f2fs use lz4hc algorithm with compress level xx.

So, I use !strncmp(name, "lz4", 3) here.

> 
>> @@ -1547,6 +1612,9 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
>>   	}
>>   	seq_printf(seq, ",compress_algorithm=%s", algtype);
>>   
>> +	if (!F2FS_OPTION(sbi).compress_level)
>> +		seq_printf(seq, ":%d", F2FS_OPTION(sbi).compress_level);
>> +
> 
> This looks wrong; it only prints compress_level if it is 0.

Yes, will fix.

> 
>> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
>> index 55be7afeee90..2dcc63fe8494 100644
>> --- a/include/linux/f2fs_fs.h
>> +++ b/include/linux/f2fs_fs.h
>> @@ -275,6 +275,9 @@ struct f2fs_inode {
>>   			__u8 i_compress_algorithm;	/* compress algorithm */
>>   			__u8 i_log_cluster_size;	/* log of cluster size */
>>   			__le16 i_compress_flag;		/* compress flag */
>> +						/* 0 bit: chksum flag
>> +						 * [10,15] bits: compress level
>> +						 */
> 
> What is the use case for storing the compression level on-disk?

One case I can image is if user wants to specify different compress level for
different algorithm in separated files.

e.g.
mount -o comrpess_algorithm=zstd:10 /dev/sdc /f2fs
touch fileA;
write fileA;
mount -o remount,comrpess_algorithm=lz4:8 /f2fs
write fileA;
touch fileB;
write fileB;

Thanks,

> 
> Keep in mind that compression levels are an implementation detail; the exact
> compressed data that is produced by a particular algorithm at a particular
> compression level is *not* a stable interface.  It can change when the
> compressor is updated, as long as the output continues to be compatible with the
> decompressor.
> 
> So does compression level really belong in the on-disk format?
> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
