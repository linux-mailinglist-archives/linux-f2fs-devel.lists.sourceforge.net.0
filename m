Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BADA978B98B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Aug 2023 22:27:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qaipl-0005nF-93;
	Mon, 28 Aug 2023 20:27:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qaipj-0005n9-Uw
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 20:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YLwBGfFdgKQr03/PdiCbTJsRywIM7NHTR4+l0cSRT+w=; b=FfnKX+NisghU16VnrxoIjG/K3L
 a07C8qTtEeex3mux92Bx+9mfG/UaWjet2UmxcS1hhh8fjSKyFFnTpxgidfT/4I++02zyInkvocs3R
 Hndkof1X0BVya2aoU9d/fsNREgL7Mi4pegGDVUMY9J2fGMAyfEswI3J2cJF1H7sbi5ts=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YLwBGfFdgKQr03/PdiCbTJsRywIM7NHTR4+l0cSRT+w=; b=PTf8luuOcbYabyQKTIKUXGSq7N
 Wa87vDGnWgjBcHAxEvAeMO1FnRZ1B3Pzwj8znKz0bfJ1LNwVZ3qfPmicbe/HdxSnjb7GFy6MfovCr
 EIPCVJi7dv7JN0KouZSiaYXrBmGDm/uw+mfwK5KeGMzbVTRpzmobEipYjxiM7GiYhbLk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qaipk-00175s-47 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 20:27:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70E7E61593;
 Mon, 28 Aug 2023 20:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B9EC433C8;
 Mon, 28 Aug 2023 20:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693254449;
 bh=6zEXwjzNs8fVM4245jOoTOSFO2Y0kvpShOMaA7beabg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kIYBMHLqlX8HXTgVYqaykORt3ngn2EWV8la2Ig8WNuB6nyzgnWdbWrts242y1V6xP
 B9620nLLHBmQMyjBekrR9nqj537Y+dqZfa0rWHXRhF2B0sRVKmFj2WMkqV6TQEjFQN
 +SCxlTvNNlcGf3e16otn2TQpb2dPQ0CNASescrzfhcMbEnI0I0jvGHDfHmRVyJEoS0
 zCYf+l1MxFp3fGAlU2X466/QU9cO8mR6QUEVoAJ/OuewG9rugTq2kzWUciQz49oo9e
 61wVcEQZJgKCwaRj4MV7YaTHVnuUr5/4XGvSxqOHWaBS7DuhnWbPMFZVb8WQFTV5hq
 5LX0PmyUxsJ4A==
Date: Mon, 28 Aug 2023 13:27:28 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <ZO0DMFmiiULzfFQB@google.com>
References: <20230825224400.2206278-1-drosen@google.com>
 <20230825224400.2206278-8-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825224400.2206278-8-drosen@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch somehow reveals struct size assertions. You can
 get it when running fsck from the used f2fs partition. On 08/25,
 Daniel Rosenberg
 wrote: > This adds support for 4K and 16K block size using the same binary.
 > mkfs can choose block size via the -b option, with other tools getting
 > the blocksize from the [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qaipk-00175s-47
Subject: Re: [f2fs-dev] [PATCH v2 7/7] f2fs-tools: Support different block
 sizes
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
Cc: kernel-team@android.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch somehow reveals struct size assertions.
You can get it when running fsck from the used f2fs partition.

On 08/25, Daniel Rosenberg wrote:
> This adds support for 4K and 16K block size using the same binary.
> mkfs can choose block size via the -b option, with other tools getting
> the blocksize from the superblock.
> 
> On mount time, we can't rely on block size for the location for the
> superblock, since that information is in the superblock. If the first
> superblock is corrupt, we will attempt to find the second superblock at
> a 4K block offset, and then a 16K block offset if that fails.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fsck/fsck.h             |  3 ---
>  fsck/mount.c            | 25 ++++++++++++++++++++-----
>  include/f2fs_fs.h       | 10 +++++++---
>  lib/libf2fs.c           |  2 ++
>  mkfs/f2fs_format_main.c | 12 +++++++++++-
>  5 files changed, 40 insertions(+), 12 deletions(-)
> 
> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index 89d0b22..091b5d8 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -127,9 +127,6 @@ struct f2fs_fsck {
>  };
>  
>  #define BLOCK_SZ		F2FS_BLKSIZE
> -struct block {
> -	unsigned char buf[BLOCK_SZ];
> -};
>  
>  enum NODE_TYPE {
>  	TYPE_INODE = 37,
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 6220d91..0ba087e 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -994,11 +994,15 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
>  		return -1;
>  
>  	blocksize = 1 << get_sb(log_blocksize);
> -	if (F2FS_BLKSIZE != blocksize) {
> -		MSG(0, "Invalid blocksize (%u), supports only (%u)\n",
> -			blocksize, F2FS_BLKSIZE);
> +	if (blocksize < F2FS_MIN_BLKSIZE || blocksize > F2FS_MAX_BLKSIZE) {
> +		MSG(0, "Invalid blocksize (%u), must be between 4KB and 16KB\n",
> +			blocksize);
>  		return -1;
>  	}
> +	c.blksize_bits = get_sb(log_blocksize);
> +	c.blksize = blocksize;
> +	c.sectors_per_blk = F2FS_BLKSIZE / c.sector_size;
> +	check_block_struct_sizes();
>  
>  	/* check log blocks per segment */
>  	if (get_sb(log_blocks_per_seg) != 9) {
> @@ -3854,9 +3858,20 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
>  	sbi->active_logs = NR_CURSEG_TYPE;
>  	ret = validate_super_block(sbi, SB0_ADDR);
>  	if (ret) {
> +		/* Assuming 4K Block Size */
> +		c.blksize_bits = 12;
> +		c.blksize = 1 << c.blksize_bits;
> +		MSG(0, "Looking for secondary superblock assuming 4K Block Size\n");
>  		ret = validate_super_block(sbi, SB1_ADDR);
> -		if (ret)
> -			return -1;
> +		if (ret) {
> +			/* Trying 16K Block Size */
> +			c.blksize_bits = 14;
> +			c.blksize = 1 << c.blksize_bits;
> +			MSG(0, "Looking for secondary superblock assuming 16K Block Size\n");
> +			ret = validate_super_block(sbi, SB1_ADDR);
> +			if (ret)
> +				return -1;
> +		}
>  	}
>  	sb = F2FS_RAW_SUPER(sbi);
>  
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index adbd381..a5587d3 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -392,7 +392,7 @@ static inline uint64_t bswap_64(uint64_t val)
>  #define MAX_DEVICES		8
>  
>  #define F2FS_BYTES_TO_BLK(bytes)    ((bytes) >> F2FS_BLKSIZE_BITS)
> -#define F2FS_BLKSIZE_BITS 12	/* 4KB block */
> +#define F2FS_BLKSIZE_BITS c.blksize_bits
>  
>  /* for mkfs */
>  #define	F2FS_NUMBER_OF_CHECKPOINT_PACK	2
> @@ -400,6 +400,7 @@ static inline uint64_t bswap_64(uint64_t val)
>  #define	DEFAULT_SECTORS_PER_BLOCK	(1 << (F2FS_BLKSIZE_BITS - SECTOR_SHIFT))
>  #define	DEFAULT_BLOCKS_PER_SEGMENT	512
>  #define DEFAULT_SEGMENTS_PER_SECTION	1
> +#define DEFAULT_BLKSIZE_BITS		12	/* 4096	*/
>  
>  #define VERSION_LEN		256
>  #define VERSION_TIMESTAMP_LEN	4
> @@ -628,9 +629,10 @@ enum {
>   */
>  #define F2FS_SUPER_OFFSET		1024	/* byte-size offset */
>  #define F2FS_MIN_LOG_SECTOR_SIZE	9	/* 9 bits for 512 bytes */
> -#define F2FS_MAX_LOG_SECTOR_SIZE	F2FS_BLKSIZE_BITS	/* 12 bits for 4096 bytes */
> -#define F2FS_BLKSIZE			(1 << F2FS_BLKSIZE_BITS)/* support only 4KB block */
> +#define F2FS_MAX_LOG_SECTOR_SIZE	F2FS_BLKSIZE_BITS	/* max sector size is block size */
> +#define F2FS_MIN_BLKSIZE		4096
>  #define F2FS_MAX_BLKSIZE		16384
> +#define F2FS_BLKSIZE			c.blksize	/* support configurable block size */
>  #define F2FS_MAX_EXTENSION		64	/* # of extension entries */
>  #define F2FS_EXTENSION_LEN		8	/* max size of extension */
>  #define F2FS_BLK_ALIGN(x)	(((x) + F2FS_BLKSIZE - 1) / F2FS_BLKSIZE)
> @@ -1510,6 +1512,8 @@ struct f2fs_configuration {
>  	uint32_t lpf_ino;
>  	uint32_t root_uid;
>  	uint32_t root_gid;
> +	uint32_t blksize;
> +	uint32_t blksize_bits;
>  
>  	/* defragmentation parameters */
>  	int defrag_shrink;
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index 8f2cc3b..995e42d 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -686,6 +686,8 @@ void f2fs_init_configuration(void)
>  
>  	memset(&c, 0, sizeof(struct f2fs_configuration));
>  	c.ndevs = 1;
> +	c.blksize = 1 << DEFAULT_BLKSIZE_BITS;
> +	c.blksize_bits = DEFAULT_BLKSIZE_BITS;
>  	c.sectors_per_blk = DEFAULT_SECTORS_PER_BLOCK;
>  	c.blks_per_seg = DEFAULT_BLOCKS_PER_SEGMENT;
>  	c.wanted_total_sectors = -1;
> diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
> index b2b84dd..349ee75 100644
> --- a/mkfs/f2fs_format_main.c
> +++ b/mkfs/f2fs_format_main.c
> @@ -50,6 +50,7 @@ static void mkfs_usage()
>  	MSG(0, "\nUsage: mkfs.f2fs [options] device [sectors]\n");
>  	MSG(0, "[options]:\n");
>  	MSG(0, "  -a heap-based allocation [default:0]\n");
> +	MSG(0, "  -b filesystem block size [default:4096]\n");
>  	MSG(0, "  -c device1[,device2,...] up to 7 additional devices, except meta device\n");
>  	MSG(0, "  -d debug level [default:0]\n");
>  	MSG(0, "  -e [cold file ext list] e.g. \"mp3,gif,mov\"\n");
> @@ -175,7 +176,7 @@ static void add_default_options(void)
>  
>  static void f2fs_parse_options(int argc, char *argv[])
>  {
> -	static const char *option_string = "qa:c:C:d:e:E:g:hil:mo:O:rR:s:S:z:t:T:U:Vfw:Z:";
> +	static const char *option_string = "qa:b:c:C:d:e:E:g:hil:mo:O:rR:s:S:z:t:T:U:Vfw:Z:";
>  	static const struct option long_opts[] = {
>  		{ .name = "help", .has_arg = 0, .flag = NULL, .val = 'h' },
>  		{ .name = NULL, .has_arg = 0, .flag = NULL, .val = 0 }
> @@ -192,6 +193,15 @@ static void f2fs_parse_options(int argc, char *argv[])
>  		case 'a':
>  			c.heap = atoi(optarg);
>  			break;
> +		case 'b':
> +			c.blksize = atoi(optarg);
> +			c.blksize_bits = log_base_2(c.blksize);
> +			c.sectors_per_blk = DEFAULT_SECTORS_PER_BLOCK;
> +			if ((1 << c.blksize_bits) != c.blksize) {
> +				MSG(0, "Error: Block size must be power of 2");
> +				mkfs_usage();
> +			}
> +			break;
>  		case 'c':
>  			if (c.ndevs >= MAX_DEVICES) {
>  				MSG(0, "Error: Too many devices\n");
> -- 
> 2.42.0.rc2.253.gd59a3bf2b4-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
