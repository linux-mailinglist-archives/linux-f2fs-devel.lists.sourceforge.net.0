Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B80961C86C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 May 2019 14:22:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wsbGI/k0X3LWzckV29piN6VMAOPMSmyPsOfT6eNL4vI=; b=HSVRjNfGDtcrtTr/Q5MTJ+HgKJ
	lQYNAjCNF8gtRraH9q1reaiHxYE8Pm2GJQkfW+cxdZS0xlz8vwGrPjKj+2wboyiaiQNBGh3H4p7ku
	X2+ALGWdzGf9NKp6/URa8f3z/F8yb5bpFxZtF5FXsLORzqYiFfgP8JTefOnW9SXwrGaU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQWRt-0000yc-VZ; Tue, 14 May 2019 12:22:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <zhaowuyun@wingtech.com>) id 1hQWRt-0000yR-5e
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 12:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hgYLsx9yYN8Ypu9fcKLx9ixhPx+OFgvtqOubhJlFAaU=; b=ZLluQBl55H0wZSHcHu5TZPxfvn
 YvYZk4VAOgcAHYBsM3TJ7H/gKUrDMo2AQT1eCCHBvtjelcIq1CyzCW4axuf0HiJ82Fph5rkyn9pT4
 YWcOT2mWAl5v3DOYlDgWqGdE0qMS87pVNCbno8hkrHBn4y/yiARaO0dB2VIUi8pPR3bY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hgYLsx9yYN8Ypu9fcKLx9ixhPx+OFgvtqOubhJlFAaU=; b=k
 3KGszT2vtzeFP9Td48TldyCDL26IYe/pMXoMYAwojQ2pJAS9qV84k9eokIFtaeowvZ6xaAJiUHh1G
 nsfnxc3KWqdPzXWrY+H2QD7uReKobHOqqI+RhTJN3MbdRPY8ditirYwZxRSYPQsv5WPWErKuJx30q
 eDYSV77sUPBSDtUE=;
Received: from mail.wingtech.com ([180.166.216.14])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.90_1) id 1hQWRr-00GXlu-BJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 12:22:25 +0000
Received: from zhaowuyun ([192.168.50.243]) (user=zhaowuyun mech=LOGIN bits=0)
 by mail.wingtech.com  with ESMTP id x4ECMD1F003880-x4ECMD1G003880;
 Tue, 14 May 2019 20:22:13 +0800
To: "'Chao Yu'" <yuchao0@huawei.com>, <linux-f2fs-devel@lists.sourceforge.net>
Date: Tue, 14 May 2019 20:22:13 +0800
Message-ID: <000801d50a4f$a957dee0$fc079ca0$@wingtech.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdUKT6jh/Fr3/ob2RMSQgX26h0ZflA==
Content-Language: zh-cn
X-FEAS-AUTH-USER: zhaowuyun
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [180.166.216.14 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hQWRr-00GXlu-BJ
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
From: zhaowuyun via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: zhaowuyun <zhaowuyun@wingtech.com>
Cc: jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

using the same steps, 
make the userdata partition dirty and fastboot-flash userdata.img to see the mount is successful or not

to test the patch, confirm that issue is fixed by this patch.
Hope to see it accepted.

Tested-by: zhaowuyun <zhaowuyun@wingtech.com>

Best Wishes,
Zac (zhaowuyun@wingtech.com)

> 
> As zhaowuyun reported:
> 
> we met one problem of f2fs, and found one issue of make_f2fs, so I write
> this email to search for your help to confirm this issue.
> 
> The issue was found on one of Android projects. We use f2fs as the
> filesystem of userdata, and make sparse userdata.img using following
> command, which invoked in script mkf2fsuserimg.sh make_f2fs -S $SIZE -f -O
> encrypt -O quota -O verity $MKFS_OPTS $OUTPUT_FILE
> 
> use fastboot to flash this userdata.img to device, and it encountered f2fs
> problem and leading to the mount fail of data partition.
> 
> we can make this issue 100% persent reproduced by making the data
> partition dirty before flashing userdata.img.
> 
> suspect that issue is caused by the dirty data in the data partition.
> so we checked that source code of make_f2fs in f2fs-tool, found that when
> making f2fs, it use dev_fill to do some process:
> 
> ...
> 
> we change code to the following, and the issue is gone.
> 
> if (c.sparse_mode)
>        return dev_write(buf, offset, len);
> 
> Chao Yu:
> >
> > After checking the codes, IIUC, I guess the problem here is, unlike
> > img2simg, mkfs.f2fs won't record zeroed block in sparse image, so
> > during transforming to normal image, some critical region like
> > NAT/SIT/CP.payload area weren't be zeroed correctly, later kernel may
> > load obsoleting data from those region.
> >
> > Also, The way you provide will obviously increase the size of sparse
> > file, since with it we need to write all zeroed blocks of
> > NAT/SIT/CP.payload to sparse file, it's not needed.
> >
> > Not sure, maybe we should use sparse_file_add_fill() to record zeroed
> > blocks, so that this will make formatted image more like img2simged one.
> 
> Jaegeuk:
> > We have to call sparse_file_add_fill() for dev_fill().
> 
> This patch fixes to support writing fill chunk sparse file for those zeroed
> blocks in mkfs.f2fs.
> 
> Reported-by: zhaowuyun <zhaowuyun@wingtech.com>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> v2:
> - don't return -EEXIST if block[x] has non-zeroed data.
>  lib/libf2fs_io.c | 84 +++++++++++++++++++++++++++++++++++++++-------
> --
>  1 file changed, 69 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c index f848510..4d0ea0d 100644
> --- a/lib/libf2fs_io.c
> +++ b/lib/libf2fs_io.c
> @@ -36,6 +36,7 @@ struct f2fs_configuration c;  struct sparse_file
> *f2fs_sparse_file;  static char **blocks;  u_int64_t blocks_count;
> +static char *zeroed_block;
>  #endif
> 
>  static int __get_device_fd(__u64 *offset) @@ -103,6 +104,8 @@ static int
> sparse_write_blk(__u64 block, int count, const void *buf)
> 
>  	for (i = 0; i < count; ++i) {
>  		cur_block = block + i;
> +		if (blocks[cur_block] == zeroed_block)
> +			blocks[cur_block] = NULL;
>  		if (!blocks[cur_block]) {
>  			blocks[cur_block] = calloc(1, F2FS_BLKSIZE);
>  			if (!blocks[cur_block])
> @@ -114,6 +117,20 @@ static int sparse_write_blk(__u64 block, int count,
> const void *buf)
>  	return 0;
>  }
> 
> +static int sparse_write_zeroed_blk(__u64 block, int count) {
> +	int i;
> +	__u64 cur_block;
> +
> +	for (i = 0; i < count; ++i) {
> +		cur_block = block + i;
> +		if (blocks[cur_block])
> +			continue;
> +		blocks[cur_block] = zeroed_block;
> +	}
> +	return 0;
> +}
> +
>  #ifdef SPARSE_CALLBACK_USES_SIZE_T
>  static int sparse_import_segment(void *UNUSED(priv), const void *data,
>  		size_t len, unsigned int block, unsigned int nr_blocks) @@ -
> 129,11 +146,17 @@ static int sparse_import_segment(void *UNUSED(priv),
> const void *data, int len,
>  	return sparse_write_blk(block, nr_blocks, data);  }
> 
> -static int sparse_merge_blocks(uint64_t start, uint64_t num)
> +static int sparse_merge_blocks(uint64_t start, uint64_t num, int zero)
>  {
>  	char *buf;
>  	uint64_t i;
> 
> +	if (zero) {
> +		blocks[start] = NULL;
> +		return sparse_file_add_fill(f2fs_sparse_file, 0x0,
> +					F2FS_BLKSIZE * num, start);
> +	}
> +
>  	buf = calloc(num, F2FS_BLKSIZE);
>  	if (!buf) {
>  		fprintf(stderr, "failed to alloc %llu\n", @@ -156,6 +179,7 @@
> static int sparse_merge_blocks(uint64_t start, uint64_t num)  #else  static int
> sparse_read_blk(__u64 block, int count, void *buf) { return 0; }  static int
> sparse_write_blk(__u64 block, int count, const void *buf) { return 0; }
> +static int sparse_write_zeroed_blk(__u64 block, int count) { return 0;
> +}
>  #endif
> 
>  int dev_read(void *buf, __u64 offset, size_t len) @@ -235,7 +259,8 @@ int
> dev_fill(void *buf, __u64 offset, size_t len)
>  	int fd;
> 
>  	if (c.sparse_mode)
> -		return 0;
> +		return sparse_write_zeroed_blk(offset / F2FS_BLKSIZE,
> +						len / F2FS_BLKSIZE);
> 
>  	fd = __get_device_fd(&offset);
>  	if (fd < 0)
> @@ -307,6 +332,12 @@ int f2fs_init_sparse_file(void)
>  		return -1;
>  	}
> 
> +	zeroed_block = calloc(1, F2FS_BLKSIZE);
> +	if (!zeroed_block) {
> +		MSG(0, "\tError: Calloc Failed for zeroed block!!!\n");
> +		return -1;
> +	}
> +
>  	return sparse_file_foreach_chunk(f2fs_sparse_file, true, false,
>  				sparse_import_segment, NULL);
>  #else
> @@ -315,7 +346,8 @@ int f2fs_init_sparse_file(void)  #endif  }
> 
> -#define MAX_CHUNK_SIZE (1 * 1024 * 1024 * 1024ULL)
> +#define MAX_CHUNK_SIZE		(1 * 1024 * 1024 * 1024ULL)
> +#define MAX_CHUNK_COUNT		(MAX_CHUNK_SIZE /
> F2FS_BLKSIZE)
>  int f2fs_finalize_device(void)
>  {
>  	int i;
> @@ -336,24 +368,44 @@ int f2fs_finalize_device(void)
>  		}
> 
>  		for (j = 0; j < blocks_count; ++j) {
> -			if (!blocks[j] && chunk_start != -1) {
> -				ret = sparse_merge_blocks(chunk_start,
> -							j - chunk_start);
> -				chunk_start = -1;
> -			} else if (blocks[j] && chunk_start == -1) {
> -				chunk_start = j;
> -			} else if (blocks[j] && (chunk_start != -1) &&
> -				 (j + 1 - chunk_start >=
> -					(MAX_CHUNK_SIZE / F2FS_BLKSIZE)))
> {
> +			if (chunk_start != -1) {
> +				if (j - chunk_start >= MAX_CHUNK_COUNT) {
> +					ret =
> sparse_merge_blocks(chunk_start,
> +							j - chunk_start, 0);
> +					ASSERT(!ret);
> +					chunk_start = -1;
> +				}
> +			}
> +
> +			if (chunk_start == -1) {
> +				if (!blocks[j])
> +					continue;
> +
> +				if (blocks[j] == zeroed_block) {
> +					ret = sparse_merge_blocks(j, 1, 1);
> +					ASSERT(!ret);
> +				} else {
> +					chunk_start = j;
> +				}
> +			} else {
> +				if (blocks[j] && blocks[j] != zeroed_block)
> +					continue;
> +
>  				ret = sparse_merge_blocks(chunk_start,
> -							  j + 1 - chunk_start);
> +						j - chunk_start, 0);
> +				ASSERT(!ret);
> +
> +				if (blocks[j] == zeroed_block) {
> +					ret = sparse_merge_blocks(j, 1, 1);
> +					ASSERT(!ret);
> +				}
> +
>  				chunk_start = -1;
>  			}
> -			ASSERT(!ret);
>  		}
>  		if (chunk_start != -1) {
>  			ret = sparse_merge_blocks(chunk_start,
> -						blocks_count - chunk_start);
> +						blocks_count - chunk_start,
> 0);
>  			ASSERT(!ret);
>  		}
> 
> @@ -365,6 +417,8 @@ int f2fs_finalize_device(void)
>  			free(blocks[j]);
>  		free(blocks);
>  		blocks = NULL;
> +		free(zeroed_block);
> +		zeroed_block = NULL;
>  		f2fs_sparse_file = NULL;
>  	}
>  #endif
> --
> 2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
