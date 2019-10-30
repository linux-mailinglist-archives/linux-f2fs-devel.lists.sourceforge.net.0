Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6349EA203
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2019 17:46:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPr78-00030P-74; Wed, 30 Oct 2019 16:46:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iPr77-00030H-3U
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 16:46:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1yDu4ZEWXeujnRaRL6JuXFkZ8H+IciGerUdmBq8tLFk=; b=G3rlsl7tc5OXXlSt0rmYEjSK6o
 gNzB4a+KaHF3TcgjRZLNlAboeFFRqegIJT7NPlshcmPfCm4cOoFCnF+jY0i/xYXjnhD5xiZzm7jqW
 d3TwOXt3F55zBlc7aHnLJZGgPyGsXu22JmdxCYwjpZhir/jv6pwDAI0K5MeDa/ON8YK8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1yDu4ZEWXeujnRaRL6JuXFkZ8H+IciGerUdmBq8tLFk=; b=lFEKCCxMHGmc61SD+RXRlwzk0S
 N/ibpk2mVofJZZdEIf2Bnzh0KVM1UUcpKcg5ozqaULYz8wISLsyG/NeJ6zH0PDTTB+/ZDm3u7tJmC
 RhXI8sf++yaTmtHWSLewgAbhcMQk7fgtgTq0063JfMAo0E6xAWDFAX8Dz84kkOSdc/Q8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iPr75-0091Ik-9d
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 16:46:29 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B5B02087E;
 Wed, 30 Oct 2019 16:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572453981;
 bh=wOl8mKPZdXCHMA25vruaNs/fO3gv/0+eDVcEjia0i7I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i2VTwuqtlOsQy80qRYzYJDczKJ0ZMfk86A3nsg+vb5z/JhtSoAwskbTkoRzM0oav2
 P5qmiXbA6SrsjnnfDDcnZdpc30jypXX/JNKE5DHSje+kw+wF1dyG4G7HmnACrdpaMm
 1jSITBTemnKqNaqSg/OztHN/ILcQPDocVNc/bTiU=
Date: Wed, 30 Oct 2019 09:46:20 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Robin Hsu <robinhsu@google.com>
Message-ID: <20191030164620.GC34056@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191029074728.171082-1-robinhsu@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191029074728.171082-1-robinhsu@google.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iPr75-0091Ik-9d
Subject: Re: [f2fs-dev] [PATCH 1/2] libf2fs_io: Add user-space cache
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Robin,

Could you please address this build errors for mac build?

libf2fs_io.c:85:38: error: use of undeclared identifier 'false'
static bool dcache_exit_registered = false;
                                     ^
libf2fs_io.c:95:34: error: use of undeclared identifier 'false'
static bool dcache_initialized = false;
                                 ^
libf2fs_io.c:127:4: warning: format specifies type 'unsigned long' but the argument has type 'off64_t' (aka 'long long') [-Wformat]
                        dcache_config.num_cache_entry,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
libf2fs_io.c:128:4: warning: format specifies type 'unsigned long' but the argument has type 'off64_t' (aka 'long long') [-Wformat]
                        useCnt,
                        ^~~~~~
libf2fs_io.c:129:4: warning: format specifies type 'long' but the argument has type 'int64_t' (aka 'long long') [-Wformat]
                        dcache_raccess,
                        ^~~~~~~~~~~~~~
libf2fs_io.c:130:4: warning: format specifies type 'long' but the argument has type 'int64_t' (aka 'long long') [-Wformat]
                        dcache_rhit,
                        ^~~~~~~~~~~
libf2fs_io.c:131:4: warning: format specifies type 'long' but the argument has type 'int64_t' (aka 'long long') [-Wformat]
                        dcache_rmiss,
                        ^~~~~~~~~~~~
libf2fs_io.c:132:4: warning: format specifies type 'long' but the argument has type 'int64_t' (aka 'long long') [-Wformat]
                        dcache_rreplace);
                        ^~~~~~~~~~~~~~~
libf2fs_io.c:140:23: error: use of undeclared identifier 'false'
        dcache_initialized = false;
                             ^
libf2fs_io.c:222:23: error: use of undeclared identifier 'true'
        dcache_initialized = true;
                             ^
libf2fs_io.c:225:28: error: use of undeclared identifier 'true'
                dcache_exit_registered = true;
                                         ^
libf2fs_io.c:273:24: error: use of undeclared identifier 'true'
        dcache_valid[entry] = true;
                              ^
libf2fs_io.c:363:50: error: use of undeclared identifier 'true'
        return dcache_update_rw(fd, buf, offset, count, true);
                                                        ^
libf2fs_io.c:369:50: error: use of undeclared identifier 'false'
        return dcache_update_rw(fd, buf, offset, count, false);


On 10/29, Robin Hsu wrote:
> Implemented cache options in F2FS configuration 'c':
> 	* use c.cache_config.num_cache_entry to set the number of
> 	  cache entries (in block), minimum 1024, or 0 to disable cache.
> 	* use c.cache_config.max_hash_collision to set maximum hash
> 	  collision (max 16).
> 	* use c.cache_config.dbg_en to enable printing of debug messages.
> 
> Signed-off-by: Robin Hsu <robinhsu@google.com>
> ---
>  include/f2fs_fs.h |  20 +++
>  lib/libf2fs_io.c  | 317 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 337 insertions(+)
> 
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index 84f3f3e..a386e61 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -3,6 +3,8 @@
>   *
>   * Copyright (c) 2012 Samsung Electronics Co., Ltd.
>   *             http://www.samsung.com/
> + * Copyright (c) 2019 Google Inc.
> + *             http://www.google.com/
>   *
>   * Dual licensed under the GPL or LGPL version 2 licenses.
>   *
> @@ -329,6 +331,18 @@ struct device_info {
>  	size_t zone_blocks;
>  };
>  
> +typedef off_t	off64_t;
> +
> +typedef struct {
> +	/* Value 0 means no cache, minimum 1024 */
> +	off64_t num_cache_entry;
> +
> +	/* Value 0 means always overwrite (no collision allowed). maximum 16 */
> +	unsigned max_hash_collision;
> +
> +	bool dbg_en;
> +} dev_cache_config_t;
> +
>  struct f2fs_configuration {
>  	u_int32_t reserved_segments;
>  	u_int32_t new_reserved_segments;
> @@ -419,6 +433,9 @@ struct f2fs_configuration {
>  
>  	/* precomputed fs UUID checksum for seeding other checksums */
>  	u_int32_t chksum_seed;
> +
> +	/* cache parameters */
> +	dev_cache_config_t cache_config;
>  };
>  
>  #ifdef CONFIG_64BIT
> @@ -1185,6 +1202,9 @@ extern int f2fs_init_sparse_file(void);
>  extern int f2fs_finalize_device(void);
>  extern int f2fs_fsync_device(void);
>  
> +extern void dcache_init(void);
> +extern void dcache_release(void);
> +
>  extern int dev_read(void *, __u64, size_t);
>  #ifdef POSIX_FADV_WILLNEED
>  extern int dev_readahead(__u64, size_t);
> diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
> index 4d0ea0d..4888b6e 100644
> --- a/lib/libf2fs_io.c
> +++ b/lib/libf2fs_io.c
> @@ -3,6 +3,8 @@
>   *
>   * Copyright (c) 2013 Samsung Electronics Co., Ltd.
>   *             http://www.samsung.com/
> + * Copyright (c) 2019 Google Inc.
> + *             http://www.google.com/
>   *
>   * Dual licensed under the GPL or LGPL version 2 licenses.
>   */
> @@ -64,6 +66,309 @@ static inline off64_t lseek64(int fd, __u64 offset, int set)
>  }
>  #endif
>  
> +/* ---------- dev_cache, Least Used First (LUF) policy  ------------------- */
> +/*
> + * Least used block will be the first victim to be replaced when max hash
> + * collision exceeds
> + */
> +static bool *dcache_valid; /* is the cached block valid? */
> +static off64_t  *dcache_blk; /* which block it cached */
> +static uint64_t *dcache_lastused; /* last used ticks for cache entries */
> +static char *dcache_buf; /* cached block data */
> +static uint64_t dcache_usetick; /* current use tick */
> +
> +static int64_t dcache_raccess;
> +static int64_t dcache_rhit;
> +static int64_t dcache_rmiss;
> +static int64_t dcache_rreplace;
> +
> +static bool dcache_exit_registered = false;
> +
> +/*
> + *  Shadow config:
> + *
> + *  Active set of the configurations.
> + *  Global configuration 'dcache_config' will be transferred here when
> + *  when dcache_init() is called
> + */
> +static dev_cache_config_t dcache_config = {0, 16, 1};
> +static bool dcache_initialized = false;
> +
> +#define MIN_NUM_CACHE_ENTRY  ((off64_t)1024)
> +#define MAX_MAX_HASH_COLLISION  16
> +
> +static int dcache_relocate_offset0[] = {
> +	20, -20, 40, -40, 80, -80, 160, -160,
> +	320, -320, 640, -640, 1280, -1280, 2560, -2560,
> +};
> +static int dcache_relocate_offset[16];
> +
> +static void dcache_print_statistics(void)
> +{
> +	off64_t i;
> +	off64_t useCnt;
> +
> +	/* Number of used cache entries */
> +	useCnt = 0;
> +	for (i = 0; i < dcache_config.num_cache_entry; i++)
> +		if (dcache_valid[i])
> +			++useCnt;
> +
> +	/*
> +	 *  c: number of cache entries
> +	 *  u: used entries
> +	 *  RA: number of read access blocks
> +	 *  CH: cache hit
> +	 *  CM: cache miss
> +	 *  Repl: read cache replaced
> +	 */
> +	printf ("\nc, u, RA, CH, CM, Repl=\n");
> +	printf ("%lu %lu %ld %ld %ld %ld\n",
> +			dcache_config.num_cache_entry,
> +			useCnt,
> +			dcache_raccess,
> +			dcache_rhit,
> +			dcache_rmiss,
> +			dcache_rreplace);
> +}
> +
> +void dcache_release(void)
> +{
> +	if (!dcache_initialized)
> +		return;
> +
> +	dcache_initialized = false;
> +
> +	if (c.cache_config.dbg_en)
> +		dcache_print_statistics();
> +
> +	if (dcache_blk != NULL)
> +		free(dcache_blk);
> +	if (dcache_lastused != NULL)
> +		free(dcache_lastused);
> +	if (dcache_buf != NULL)
> +		free(dcache_buf);
> +	if (dcache_valid != NULL)
> +		free(dcache_valid);
> +	dcache_config.num_cache_entry = 0;
> +	dcache_blk = NULL;
> +	dcache_lastused = NULL;
> +	dcache_buf = NULL;
> +	dcache_valid = NULL;
> +}
> +
> +// return 0 for success, error code for failure.
> +static int dcache_alloc_all(int n)
> +{
> +	if ((dcache_blk = (off64_t *) malloc(sizeof(off64_t) * n)) == NULL
> +		|| (dcache_lastused = (uint64_t *)
> +				malloc(sizeof(uint64_t) * n)) == NULL
> +		|| (dcache_buf = (char *) malloc (F2FS_BLKSIZE * n)) == NULL
> +		|| (dcache_valid = (bool *) malloc(sizeof(bool) * n)) == NULL)
> +	{
> +		dcache_release();
> +		return -1;
> +	}
> +	dcache_config.num_cache_entry = n;
> +	return 0;
> +}
> +
> +static void dcache_relocate_init(void)
> +{
> +	int i;
> +	int n0 = (sizeof(dcache_relocate_offset0)
> +			/ sizeof(dcache_relocate_offset0[0]));
> +	int n = (sizeof(dcache_relocate_offset)
> +			/ sizeof(dcache_relocate_offset[0]));
> +
> +	ASSERT(n == n0);
> +	for (i = 0; i < n && i < dcache_config.max_hash_collision; i++) {
> +		if (abs(dcache_relocate_offset0[i])
> +				> dcache_config.num_cache_entry / 2) {
> +			dcache_config.max_hash_collision = i;
> +			break;
> +		}
> +		dcache_relocate_offset[i] =
> +				dcache_config.num_cache_entry
> +				+ dcache_relocate_offset0[i];
> +	}
> +}
> +
> +void dcache_init(void)
> +{
> +	off64_t n;
> +
> +	if (c.cache_config.num_cache_entry == 0)
> +		return;
> +
> +	/* release previous cache init, if any */
> +	dcache_release();
> +
> +	dcache_blk = NULL;
> +	dcache_lastused = NULL;
> +	dcache_buf = NULL;
> +	dcache_valid = NULL;
> +
> +	dcache_config = c.cache_config;
> +
> +	n = max(MIN_NUM_CACHE_ENTRY, dcache_config.num_cache_entry);
> +
> +	/* halve alloc size until alloc succeed, or min cache reached */
> +	while (dcache_alloc_all(n) != 0 && n !=  MIN_NUM_CACHE_ENTRY)
> +		n = max(MIN_NUM_CACHE_ENTRY, n/2);
> +
> +	/* must be the last: data dependent on num_cache_entry */
> +	dcache_relocate_init();
> +	dcache_initialized = true;
> +
> +	if (!dcache_exit_registered) {
> +		dcache_exit_registered = true;
> +		atexit(dcache_release); /* auto release */
> +	}
> +}
> +
> +static inline char *dcache_addr(off64_t entry)
> +{
> +	return dcache_buf + F2FS_BLKSIZE * entry;
> +}
> +
> +/* relocate on (n+1)-th collision */
> +static inline off64_t dcache_relocate(off64_t entry, int n)
> +{
> +	return (entry + dcache_relocate_offset[n]) %
> +			dcache_config.num_cache_entry;
> +}
> +
> +static off64_t dcache_find(off64_t blk)
> +{
> +	register off64_t n = dcache_config.num_cache_entry;
> +	register unsigned m = dcache_config.max_hash_collision;
> +	off64_t entry, least_used, target;
> +	unsigned try;
> +
> +	target = least_used = entry = blk % n;
> +
> +	for (try = 0; try < m; try++) {
> +		if (!dcache_valid[target] || dcache_blk[target] == blk)
> +			return target;  /* found target or empty cache slot */
> +		if (dcache_lastused[target] < dcache_lastused[least_used])
> +			least_used = target;
> +		target = dcache_relocate(entry, try); /* next target */
> +	}
> +	return least_used;  /* max search reached, return least used slot */
> +}
> +
> +/* Physical read into cache */
> +static int dcache_io_read(int fd, off64_t entry, off64_t offset, off64_t blk)
> +{
> +	if (lseek64(fd, (off64_t)offset, SEEK_SET) < 0) {
> +		MSG(0, "\n lseek64 fail.\n");
> +		return -1;
> +	}
> +	if (read(fd, dcache_buf + entry * F2FS_BLKSIZE, F2FS_BLKSIZE) < 0) {
> +		MSG(0, "\n read() fail.\n");
> +		return -1;
> +	}
> +	dcache_lastused[entry] = ++dcache_usetick;
> +	dcache_valid[entry] = true;
> +	dcache_blk[entry] = blk;
> +	return 0;
> +}
> +
> +/*
> + *  - Note: Read/Write are not symmetric:
> + *       For read, we need to do it block by block, due to the cache nature:
> + *           some blocks may be cached, and others don't.
> + *       For write, since we always do a write-thru, we can join all writes into one,
> + *       and write it once at the caller.  This function updates the cache for write, but
> + *       not the do a physical write.  The caller is responsible for the physical write.
> + *  - Note: We concentrate read/write together, due to the fact of similar structure to find
> + *          the relevant cache entries
> + *  - Return values:
> + *       0: success
> + *       1: cache not available (uninitialized)
> + *      -1: error
> + */
> +static int dcache_update_rw(int fd, void *buf, off64_t offset,
> +		size_t byte_count, bool is_write)
> +{
> +	off64_t blk;
> +	int32_t addr_in_blk;
> +	off64_t start;
> +
> +	if (!dcache_initialized)
> +		dcache_init(); /* auto initialize */
> +
> +	if (!dcache_initialized)
> +		return 1; /* not available */
> +
> +	blk = offset / F2FS_BLKSIZE;
> +	addr_in_blk = offset % F2FS_BLKSIZE;
> +	start = blk * F2FS_BLKSIZE;
> +
> +	while (byte_count != 0) {
> +		int32_t cur_size = min(byte_count,
> +				(size_t)(F2FS_BLKSIZE - addr_in_blk));
> +		off64_t entry = dcache_find(blk);
> +
> +		if (!is_write)
> +			++dcache_raccess;
> +
> +		if (dcache_valid[entry] && dcache_blk[entry] == blk) {
> +			/* cache hit */
> +			if (is_write)  /* write: update cache */
> +				memcpy(dcache_addr(entry) + addr_in_blk,
> +					buf, cur_size);
> +			else
> +				++dcache_rhit;
> +		} else {
> +			/* cache miss */
> +			if (!is_write) {
> +				int err;
> +				++dcache_rmiss;
> +				if (dcache_valid[entry])
> +					++dcache_rreplace;
> +				/* read: physical I/O read into cache */
> +				err = dcache_io_read(fd, entry, start, blk);
> +				if (err)
> +					return err;
> +			}
> +		}
> +
> +		/* read: copy data from cache */
> +		/* write: nothing to do, since we don't do physical write. */
> +		if (!is_write)
> +			memcpy(buf, dcache_addr(entry) + addr_in_blk,
> +				cur_size);
> +
> +		/* next block */
> +		++blk;
> +		buf += cur_size;
> +		offset += F2FS_BLKSIZE;
> +		byte_count -= cur_size;
> +		addr_in_blk = 0;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * dcache_update_cache() just update cache, won't do physical I/O.
> + * Thus even no error, we need normal non-cache I/O for actual write
> + *
> + * return value: 1: cache not available
> + *               0: success, -1: I/O error
> + */
> +inline int dcache_update_cache(int fd, void *buf, off64_t offset, size_t count)
> +{
> +	return dcache_update_rw(fd, buf, offset, count, true);
> +}
> +
> +/* handles read into cache + read into buffer  */
> +inline int dcache_read(int fd, void *buf, off64_t offset, size_t count)
> +{
> +	return dcache_update_rw(fd, buf, offset, count, false);
> +}
> +
>  /*
>   * IO interfaces
>   */
> @@ -185,6 +490,7 @@ static int sparse_write_zeroed_blk(__u64 block, int count) { return 0; }
>  int dev_read(void *buf, __u64 offset, size_t len)
>  {
>  	int fd;
> +	int err;
>  
>  	if (c.sparse_mode)
>  		return sparse_read_blk(offset / F2FS_BLKSIZE,
> @@ -194,6 +500,11 @@ int dev_read(void *buf, __u64 offset, size_t len)
>  	if (fd < 0)
>  		return fd;
>  
> +	/* err = 1: cache not available, fall back to non-cache R/W */
> +	/* err = 0: success, err=-1: I/O error */
> +	err = dcache_read(fd, buf, (off64_t)offset, len);
> +	if (err <= 0)
> +		return err;
>  	if (lseek64(fd, (off64_t)offset, SEEK_SET) < 0)
>  		return -1;
>  	if (read(fd, buf, len) < 0)
> @@ -233,6 +544,12 @@ int dev_write(void *buf, __u64 offset, size_t len)
>  	if (fd < 0)
>  		return fd;
>  
> +	/*
> +	 * dcache_update_cache() just update cache, won't do I/O.
> +	 * Thus even no error, we need normal non-cache I/O for actual write
> +	 */
> +	if (dcache_update_cache(fd, buf, (off64_t)offset, len) < 0)
> +		return -1;
>  	if (lseek64(fd, (off64_t)offset, SEEK_SET) < 0)
>  		return -1;
>  	if (write(fd, buf, len) < 0)
> -- 
> 2.24.0.rc0.303.g954a862665-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
