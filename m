Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A57781E6CE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2019 04:10:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQjMu-00058B-Jt; Wed, 15 May 2019 02:10:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hQjMt-000583-BQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 02:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dudc5SQCQJKX5qrUGSXj5UDVNT6JWesC4Ku/XKjX4tQ=; b=g3X4vVGPXqybHgp6NVc4Q5inW5
 vhcxy3k0zmPXPAiXI1b7iGo1REbzhTo2ThnPNmDTylXf/V7xgo5zx6nRkkmPkh37pV1cUrCYXIHe2
 0KObQct29m8UOIctLKyov/H9dkzBGYX0lUzHaJiEnoOSvtrquUFX0lRABhHFJWMwgxAI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dudc5SQCQJKX5qrUGSXj5UDVNT6JWesC4Ku/XKjX4tQ=; b=Ioux/YNFQcI2iImWTQ3cKCBM+p
 2iNg84nwXIM5fW6o/mVz+ctJGtNaor240dznuRBruZRB0ShRhqR0fbedGndZOFoARwWXgmqDPDE+y
 nXqI6ogtFcP+XWNG1LFXDfejs2kXH9JuA2lEUSAL9DYbnHnYPjcw3l36zYSX39PmI+5g=;
Received: from szxga08-in.huawei.com ([45.249.212.255] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hQjMr-0049Hx-1y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 02:10:07 +0000
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 1591216C19F9C9222DD8;
 Wed, 15 May 2019 10:09:56 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 15 May 2019 10:09:55 +0800
Received: from [10.134.22.195] (10.134.22.195) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 15 May 2019 10:09:54 +0800
To: zhaowuyun <zhaowuyun@wingtech.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <000801d50a4f$a957dee0$fc079ca0$@wingtech.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <390dd5c5-942c-315a-6c68-6213ad9efc05@huawei.com>
Date: Wed, 15 May 2019 10:09:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <000801d50a4f$a957dee0$fc079ca0$@wingtech.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-ClientProxiedBy: dggeme715-chm.china.huawei.com (10.1.199.111) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mkf2fsuserimg.sh]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hQjMr-0049Hx-1y
Subject: Re: [f2fs-dev] [PATCH v2 1/2] mkfs.f2fs: write fill chunk in sparse
 file for zeroed block
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
Cc: jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Wuyun,

Thanks for the test for both sparse file enhancement patches. :)

On 2019/5/14 20:22, zhaowuyun wrote:
> Hi Chao,
> 
> using the same steps, 
> make the userdata partition dirty and fastboot-flash userdata.img to see the mount is successful or not
> 
> to test the patch, confirm that issue is fixed by this patch.
> Hope to see it accepted.
> 
> Tested-by: zhaowuyun <zhaowuyun@wingtech.com>
> 
> Best Wishes,
> Zac (zhaowuyun@wingtech.com)
> 
>>
>> As zhaowuyun reported:
>>
>> we met one problem of f2fs, and found one issue of make_f2fs, so I write
>> this email to search for your help to confirm this issue.
>>
>> The issue was found on one of Android projects. We use f2fs as the
>> filesystem of userdata, and make sparse userdata.img using following
>> command, which invoked in script mkf2fsuserimg.sh make_f2fs -S $SIZE -f -O
>> encrypt -O quota -O verity $MKFS_OPTS $OUTPUT_FILE
>>
>> use fastboot to flash this userdata.img to device, and it encountered f2fs
>> problem and leading to the mount fail of data partition.
>>
>> we can make this issue 100% persent reproduced by making the data
>> partition dirty before flashing userdata.img.
>>
>> suspect that issue is caused by the dirty data in the data partition.
>> so we checked that source code of make_f2fs in f2fs-tool, found that when
>> making f2fs, it use dev_fill to do some process:
>>
>> ...
>>
>> we change code to the following, and the issue is gone.
>>
>> if (c.sparse_mode)
>>        return dev_write(buf, offset, len);
>>
>> Chao Yu:
>>>
>>> After checking the codes, IIUC, I guess the problem here is, unlike
>>> img2simg, mkfs.f2fs won't record zeroed block in sparse image, so
>>> during transforming to normal image, some critical region like
>>> NAT/SIT/CP.payload area weren't be zeroed correctly, later kernel may
>>> load obsoleting data from those region.
>>>
>>> Also, The way you provide will obviously increase the size of sparse
>>> file, since with it we need to write all zeroed blocks of
>>> NAT/SIT/CP.payload to sparse file, it's not needed.
>>>
>>> Not sure, maybe we should use sparse_file_add_fill() to record zeroed
>>> blocks, so that this will make formatted image more like img2simged one.
>>
>> Jaegeuk:
>>> We have to call sparse_file_add_fill() for dev_fill().
>>
>> This patch fixes to support writing fill chunk sparse file for those zeroed
>> blocks in mkfs.f2fs.
>>
>> Reported-by: zhaowuyun <zhaowuyun@wingtech.com>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>> v2:
>> - don't return -EEXIST if block[x] has non-zeroed data.
>>  lib/libf2fs_io.c | 84 +++++++++++++++++++++++++++++++++++++++-------
>> --
>>  1 file changed, 69 insertions(+), 15 deletions(-)
>>
>> diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c index f848510..4d0ea0d 100644
>> --- a/lib/libf2fs_io.c
>> +++ b/lib/libf2fs_io.c
>> @@ -36,6 +36,7 @@ struct f2fs_configuration c;  struct sparse_file
>> *f2fs_sparse_file;  static char **blocks;  u_int64_t blocks_count;
>> +static char *zeroed_block;
>>  #endif
>>
>>  static int __get_device_fd(__u64 *offset) @@ -103,6 +104,8 @@ static int
>> sparse_write_blk(__u64 block, int count, const void *buf)
>>
>>  	for (i = 0; i < count; ++i) {
>>  		cur_block = block + i;
>> +		if (blocks[cur_block] == zeroed_block)
>> +			blocks[cur_block] = NULL;
>>  		if (!blocks[cur_block]) {
>>  			blocks[cur_block] = calloc(1, F2FS_BLKSIZE);
>>  			if (!blocks[cur_block])
>> @@ -114,6 +117,20 @@ static int sparse_write_blk(__u64 block, int count,
>> const void *buf)
>>  	return 0;
>>  }
>>
>> +static int sparse_write_zeroed_blk(__u64 block, int count) {
>> +	int i;
>> +	__u64 cur_block;
>> +
>> +	for (i = 0; i < count; ++i) {
>> +		cur_block = block + i;
>> +		if (blocks[cur_block])
>> +			continue;
>> +		blocks[cur_block] = zeroed_block;
>> +	}
>> +	return 0;
>> +}
>> +
>>  #ifdef SPARSE_CALLBACK_USES_SIZE_T
>>  static int sparse_import_segment(void *UNUSED(priv), const void *data,
>>  		size_t len, unsigned int block, unsigned int nr_blocks) @@ -
>> 129,11 +146,17 @@ static int sparse_import_segment(void *UNUSED(priv),
>> const void *data, int len,
>>  	return sparse_write_blk(block, nr_blocks, data);  }
>>
>> -static int sparse_merge_blocks(uint64_t start, uint64_t num)
>> +static int sparse_merge_blocks(uint64_t start, uint64_t num, int zero)
>>  {
>>  	char *buf;
>>  	uint64_t i;
>>
>> +	if (zero) {
>> +		blocks[start] = NULL;
>> +		return sparse_file_add_fill(f2fs_sparse_file, 0x0,
>> +					F2FS_BLKSIZE * num, start);
>> +	}
>> +
>>  	buf = calloc(num, F2FS_BLKSIZE);
>>  	if (!buf) {
>>  		fprintf(stderr, "failed to alloc %llu\n", @@ -156,6 +179,7 @@
>> static int sparse_merge_blocks(uint64_t start, uint64_t num)  #else  static int
>> sparse_read_blk(__u64 block, int count, void *buf) { return 0; }  static int
>> sparse_write_blk(__u64 block, int count, const void *buf) { return 0; }
>> +static int sparse_write_zeroed_blk(__u64 block, int count) { return 0;
>> +}
>>  #endif
>>
>>  int dev_read(void *buf, __u64 offset, size_t len) @@ -235,7 +259,8 @@ int
>> dev_fill(void *buf, __u64 offset, size_t len)
>>  	int fd;
>>
>>  	if (c.sparse_mode)
>> -		return 0;
>> +		return sparse_write_zeroed_blk(offset / F2FS_BLKSIZE,
>> +						len / F2FS_BLKSIZE);
>>
>>  	fd = __get_device_fd(&offset);
>>  	if (fd < 0)
>> @@ -307,6 +332,12 @@ int f2fs_init_sparse_file(void)
>>  		return -1;
>>  	}
>>
>> +	zeroed_block = calloc(1, F2FS_BLKSIZE);
>> +	if (!zeroed_block) {
>> +		MSG(0, "\tError: Calloc Failed for zeroed block!!!\n");
>> +		return -1;
>> +	}
>> +
>>  	return sparse_file_foreach_chunk(f2fs_sparse_file, true, false,
>>  				sparse_import_segment, NULL);
>>  #else
>> @@ -315,7 +346,8 @@ int f2fs_init_sparse_file(void)  #endif  }
>>
>> -#define MAX_CHUNK_SIZE (1 * 1024 * 1024 * 1024ULL)
>> +#define MAX_CHUNK_SIZE		(1 * 1024 * 1024 * 1024ULL)
>> +#define MAX_CHUNK_COUNT		(MAX_CHUNK_SIZE /
>> F2FS_BLKSIZE)
>>  int f2fs_finalize_device(void)
>>  {
>>  	int i;
>> @@ -336,24 +368,44 @@ int f2fs_finalize_device(void)
>>  		}
>>
>>  		for (j = 0; j < blocks_count; ++j) {
>> -			if (!blocks[j] && chunk_start != -1) {
>> -				ret = sparse_merge_blocks(chunk_start,
>> -							j - chunk_start);
>> -				chunk_start = -1;
>> -			} else if (blocks[j] && chunk_start == -1) {
>> -				chunk_start = j;
>> -			} else if (blocks[j] && (chunk_start != -1) &&
>> -				 (j + 1 - chunk_start >=
>> -					(MAX_CHUNK_SIZE / F2FS_BLKSIZE)))
>> {
>> +			if (chunk_start != -1) {
>> +				if (j - chunk_start >= MAX_CHUNK_COUNT) {
>> +					ret =
>> sparse_merge_blocks(chunk_start,
>> +							j - chunk_start, 0);
>> +					ASSERT(!ret);
>> +					chunk_start = -1;
>> +				}
>> +			}
>> +
>> +			if (chunk_start == -1) {
>> +				if (!blocks[j])
>> +					continue;
>> +
>> +				if (blocks[j] == zeroed_block) {
>> +					ret = sparse_merge_blocks(j, 1, 1);
>> +					ASSERT(!ret);
>> +				} else {
>> +					chunk_start = j;
>> +				}
>> +			} else {
>> +				if (blocks[j] && blocks[j] != zeroed_block)
>> +					continue;
>> +
>>  				ret = sparse_merge_blocks(chunk_start,
>> -							  j + 1 - chunk_start);
>> +						j - chunk_start, 0);
>> +				ASSERT(!ret);
>> +
>> +				if (blocks[j] == zeroed_block) {
>> +					ret = sparse_merge_blocks(j, 1, 1);
>> +					ASSERT(!ret);
>> +				}
>> +
>>  				chunk_start = -1;
>>  			}
>> -			ASSERT(!ret);
>>  		}
>>  		if (chunk_start != -1) {
>>  			ret = sparse_merge_blocks(chunk_start,
>> -						blocks_count - chunk_start);
>> +						blocks_count - chunk_start,
>> 0);
>>  			ASSERT(!ret);
>>  		}
>>
>> @@ -365,6 +417,8 @@ int f2fs_finalize_device(void)
>>  			free(blocks[j]);
>>  		free(blocks);
>>  		blocks = NULL;
>> +		free(zeroed_block);
>> +		zeroed_block = NULL;
>>  		f2fs_sparse_file = NULL;
>>  	}
>>  #endif
>> --
>> 2.18.0.rc1
> 
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
