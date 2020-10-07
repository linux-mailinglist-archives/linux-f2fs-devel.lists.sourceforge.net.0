Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9044628687B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Oct 2020 21:42:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQFKf-0005Yq-SO; Wed, 07 Oct 2020 19:42:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kQFKe-0005Yj-UI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 19:42:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T7MdbPoYV4/BGYVTUXj33Hig/eEl0Ktb/nboWwxAgNs=; b=mmTg7mvxtgzTRT4mNS9yN+0fNE
 yvbgqYuQX07nYaeKHdXpJ5YS45SRpbuOjpsTxHBY7JnVNSwKREiavpF38cyUx8Jk4HOCf+xchRIuW
 vfC9ijq9SOC0spWC4jTxSGZdp9paSXbl1p500IfYfkQn8aoOijdr1I6aPWuUc1lJTfp4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T7MdbPoYV4/BGYVTUXj33Hig/eEl0Ktb/nboWwxAgNs=; b=Z957YjHCV4M8WpjwQzB+JEmkcD
 b+jhRiLqb7LqphX2+rEdyZSC7j8Kr4SM1xBk9k3P9+B2JoW+JaNyYJsLvnAqcYnfOCQ02mBWNrNZV
 0eNoRwNowwYrbJp1k/IYOnVcJiNO9wB9m27z/+vaDbGxvhah5q3i3DlYidlvT5LLCQdE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQFKU-006P8I-JV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 19:42:36 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95DA2206F0;
 Wed,  7 Oct 2020 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602099730;
 bh=fcZaRKhKRONbgjh2LH89ovWxbCtWBGsq9G8uD0aLCmU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2seMcJ7OJLjVr15fK2AP+yAx2ekirt2ecw90xHFdrIwDDMxPIIHzKv59uSdAVpb6M
 x0kYL1pHKI2p88SYIKbmZtqC47PDnADn3SYIICTLd7nZVaZOLFdOS4JV2BrqGPEbi+
 1riDyOKNmd0dnSOEONSDapv/LbzIf0lQ8uorGJk0=
Date: Wed, 7 Oct 2020 12:42:09 -0700
From: jaegeuk@kernel.org
To: Satya Tangirala <satyat@google.com>
Message-ID: <20201007194209.GB611836@google.com>
References: <20201005074133.1958633-1-satyat@google.com>
 <20201005074133.1958633-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005074133.1958633-2-satyat@google.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: makefile.am]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kQFKU-006P8I-JV
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs-tools: Introduce metadata
 encryption support
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Satya,

On 10/05, Satya Tangirala wrote:
> Introduce native metadata encryption support for F2FS. All blocks
> other than the super block are encrypted with the specified metadata
> encryption key and algorithm. The data unit number for each block is its
> block number in the filesystem.
> 
> This patch introduces two new options '-A' and '-M' for specifying metadata
> crypt options. '-A' takes the desired metadata encryption algorithm as
> argument. '-M' takes the linux key_serial of the metadata encryption key as
> the argument. The keyring key provided must be of a key type that supports
> reading the payload from userspace.

Could you please update manpages as well?

> 
> mkfs.f2fs takes both these arguments, and stores the encryption algorithm
> in the superblock of the FS.
> 
> The rest of the programs only take '-M', and use the encryption algorithm
> stored in the superblock of the FS.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  fsck/main.c                   |  47 ++++++-
>  fsck/mount.c                  |  33 ++++-
>  include/f2fs_fs.h             |  10 +-
>  include/f2fs_metadata_crypt.h |  21 ++++
>  lib/Makefile.am               |   4 +-
>  lib/f2fs_metadata_crypt.c     | 226 ++++++++++++++++++++++++++++++++++
>  lib/libf2fs_io.c              |  87 +++++++++++--
>  mkfs/f2fs_format.c            |   5 +-
>  mkfs/f2fs_format_main.c       |  33 ++++-
>  9 files changed, 446 insertions(+), 20 deletions(-)
>  create mode 100644 include/f2fs_metadata_crypt.h
>  create mode 100644 lib/f2fs_metadata_crypt.c
> 
> diff --git a/fsck/main.c b/fsck/main.c
> index 32559f1..6a4d867 100644
> --- a/fsck/main.c
> +++ b/fsck/main.c
> @@ -26,6 +26,8 @@
>  #include <stdbool.h>
>  #include "quotaio.h"
>  
> +#include "f2fs_metadata_crypt.h"
> +
>  struct f2fs_fsck gfsck;
>  
>  #ifdef WITH_ANDROID
> @@ -62,6 +64,7 @@ void fsck_usage()
>  			" (default 0)\n");
>  	MSG(0, "  -m <max-hash-collision>  set max cache hash collision"
>  			" (default 16)\n");
> +	MSG(0, "  -M Metadata encryption key_serial in keyring\n");
>  	MSG(0, "  -C encoding[:flag1,flag2] Set options for enabling"
>  			" casefolding\n");
>  	MSG(0, "  -d debug level [default:0]\n");
> @@ -92,6 +95,7 @@ void dump_usage()
>  	MSG(0, "  -S sparse_mode\n");
>  	MSG(0, "  -a [SSA dump segno from #1~#2 (decimal), for all 0~-1]\n");
>  	MSG(0, "  -b blk_addr (in 4KB)\n");
> +	MSG(0, "  -M Metadata encryption key_serial in keyring\n");
>  	MSG(0, "  -V print the version number and exit\n");
>  
>  	exit(1);
> @@ -107,6 +111,7 @@ void defrag_usage()
>  	MSG(0, "  -l length [default:512 (2MB)]\n");
>  	MSG(0, "  -t target block address [default: main_blkaddr + 2MB]\n");
>  	MSG(0, "  -i set direction as shrink [default: expand]\n");
> +	MSG(0, "  -M Metadata encryption key_serial in keyring\n");
>  	MSG(0, "  -V print the version number and exit\n");
>  	exit(1);
>  }
> @@ -119,6 +124,7 @@ void resize_usage()
>  	MSG(0, "  -i extended node bitmap, node ratio is 20%% by default\n");
>  	MSG(0, "  -s safe resize (Does not resize metadata)");
>  	MSG(0, "  -t target sectors [default: device size]\n");
> +	MSG(0, "  -M Metadata encryption key_serial in keyring\n");
>  	MSG(0, "  -V print the version number and exit\n");
>  	exit(1);
>  }
> @@ -129,6 +135,7 @@ void sload_usage()
>  	MSG(0, "[options]:\n");
>  	MSG(0, "  -C fs_config\n");
>  	MSG(0, "  -f source directory [path of the source directory]\n");
> +	MSG(0, "  -M Metadata encryption key_serial in keyring\n");
>  	MSG(0, "  -p product out directory\n");
>  	MSG(0, "  -s file_contexts\n");
>  	MSG(0, "  -S sparse_mode\n");
> @@ -200,7 +207,7 @@ void f2fs_parse_options(int argc, char *argv[])
>  	}
>  
>  	if (!strcmp("fsck.f2fs", prog)) {
> -		const char *option_string = ":aC:c:m:d:fg:O:p:q:StyV";
> +		const char *option_string = ":aC:c:m:M:d:fg:O:p:q:StyV";
>  		int opt = 0, val;
>  		char *token;
>  		struct option long_opt[] = {
> @@ -243,6 +250,12 @@ void f2fs_parse_options(int argc, char *argv[])
>  				c.cache_config.max_hash_collision =
>  						atoi(optarg);
>  				break;
> +			case 'M':
> +				if (f2fs_metadata_process_key(optarg)) {
> +					MSG(0, "Error: Invalid metadata key\n");
> +					fsck_usage();
> +				}
> +				break;
>  			case 'g':
>  				if (!strcmp(optarg, "android"))
>  					c.defset = CONF_ANDROID;
> @@ -345,7 +358,7 @@ void f2fs_parse_options(int argc, char *argv[])
>  				break;
>  		}
>  	} else if (!strcmp("dump.f2fs", prog)) {
> -		const char *option_string = "d:i:n:s:Sa:b:V";
> +		const char *option_string = "d:i:n:s:Sa:b:M:V";
>  		static struct dump_option dump_opt = {
>  			.nid = 0,	/* default root ino */
>  			.start_nat = -1,
> @@ -413,6 +426,12 @@ void f2fs_parse_options(int argc, char *argv[])
>  					ret = sscanf(optarg, "%x",
>  							&dump_opt.blk_addr);
>  				break;
> +			case 'M':
> +				if (f2fs_metadata_process_key(optarg)) {
> +					MSG(0, "Error: Invalid metadata key\n");
> +					dump_usage();
> +				}
> +				break;
>  			case 'V':
>  				show_version(prog);
>  				exit(0);
> @@ -427,7 +446,7 @@ void f2fs_parse_options(int argc, char *argv[])
>  
>  		c.private = &dump_opt;
>  	} else if (!strcmp("defrag.f2fs", prog)) {
> -		const char *option_string = "d:s:Sl:t:iV";
> +		const char *option_string = "d:M:s:Sl:t:iV";
>  
>  		c.func = DEFRAG;
>  		while ((option = getopt(argc, argv, option_string)) != EOF) {
> @@ -473,6 +492,12 @@ void f2fs_parse_options(int argc, char *argv[])
>  			case 'i':
>  				c.defrag_shrink = 1;
>  				break;
> +			case 'M':
> +				if (f2fs_metadata_process_key(optarg)) {
> +					MSG(0, "Error: Invalid metadata key\n");
> +					defrag_usage();
> +				}
> +				break;
>  			case 'V':
>  				show_version(prog);
>  				exit(0);
> @@ -485,7 +510,7 @@ void f2fs_parse_options(int argc, char *argv[])
>  				break;
>  		}
>  	} else if (!strcmp("resize.f2fs", prog)) {
> -		const char *option_string = "d:st:iV";
> +		const char *option_string = "d:M:st:iV";
>  
>  		c.func = RESIZE;
>  		while ((option = getopt(argc, argv, option_string)) != EOF) {
> @@ -515,6 +540,12 @@ void f2fs_parse_options(int argc, char *argv[])
>  			case 'i':
>  				c.large_nat_bitmap = 1;
>  				break;
> +			case 'M':
> +				if (f2fs_metadata_process_key(optarg)) {
> +					MSG(0, "Error: Invalid metadata key\n");
> +					resize_usage();
> +				}
> +				break;
>  			case 'V':
>  				show_version(prog);
>  				exit(0);
> @@ -527,7 +558,7 @@ void f2fs_parse_options(int argc, char *argv[])
>  				break;
>  		}
>  	} else if (!strcmp("sload.f2fs", prog)) {
> -		const char *option_string = "C:d:f:p:s:St:T:V";
> +		const char *option_string = "C:d:f:M:p:s:St:T:V";
>  #ifdef HAVE_LIBSELINUX
>  		int max_nr_opt = (int)sizeof(c.seopt_file) /
>  			sizeof(c.seopt_file[0]);
> @@ -553,6 +584,12 @@ void f2fs_parse_options(int argc, char *argv[])
>  			case 'f':
>  				c.from_dir = absolute_path(optarg);
>  				break;
> +			case 'M':
> +				if (f2fs_metadata_process_key(optarg)) {
> +					MSG(0, "Error: Invalid metadata key\n");
> +					sload_usage();
> +				}
> +				break;
>  			case 'p':
>  				c.target_out_dir = absolute_path(optarg);
>  				break;
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 8ebc5b0..7520a8a 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -11,6 +11,7 @@
>  #include "fsck.h"
>  #include "node.h"
>  #include "xattr.h"
> +#include "f2fs_metadata_crypt.h"
>  #include <locale.h>
>  #include <stdbool.h>
>  #ifdef HAVE_LINUX_POSIX_ACL_H
> @@ -561,6 +562,10 @@ void print_sb_state(struct f2fs_super_block *sb)
>  	if (f & cpu_to_le32(F2FS_FEATURE_COMPRESSION)) {
>  		MSG(0, "%s", " compression");
>  	}
> +	if (sb->metadata_crypt_alg) {
> +		MSG(0, "%s", " metadata_crypt");
> +	}
> +
>  	MSG(0, "\n");
>  	MSG(0, "Info: superblock encrypt level = %d, salt = ",
>  					sb->encryption_level);
> @@ -686,7 +691,7 @@ void update_superblock(struct f2fs_super_block *sb, int sb_mask)
>  	memcpy(buf + F2FS_SUPER_OFFSET, sb, sizeof(*sb));
>  	for (addr = SB0_ADDR; addr < SB_MAX_ADDR; addr++) {
>  		if (SB_MASK(addr) & sb_mask) {
> -			ret = dev_write_block(buf, addr);
> +			ret = dev_write_block_unencrypted(buf, addr);
>  			ASSERT(ret >= 0);
>  		}
>  	}
> @@ -927,6 +932,24 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
>  		return -1;
>  	}
>  
> +	/*
> +	 * Check that metadata encryption is enabled on superblock when metadata
> +	 * crypt key is specified
> +	 */
> +	if (get_sb(metadata_crypt_alg) && !c.metadata_crypt_key) {
> +		MSG(0, "\tFilesystem has metadata encryption, but we're missing the metadata encryption key.\n");
> +		return -1;
> +	}
> +
> +	/*
> +	 * Check that metadata encryption is disabled on superblock when metadata
> +	 * crypt key is not specified
> +	 */
> +	if (!get_sb(metadata_crypt_alg) && c.metadata_crypt_key) {
> +		MSG(0, "\tFilesystem has does not have metadata encryption, but a metadata encryption key was specified.\n");
> +		return -1;
> +	}
> +
>  	if (sanity_check_area_boundary(sb, sb_addr))
>  		return -1;
>  	return 0;
> @@ -940,7 +963,7 @@ int validate_super_block(struct f2fs_sb_info *sbi, enum SB_ADDR sb_addr)
>  	if (!sbi->raw_super)
>  		return -ENOMEM;
>  
> -	if (dev_read_block(buf, sb_addr))
> +	if (dev_read_block_unencrypted(buf, sb_addr))
>  		return -1;
>  
>  	memcpy(sbi->raw_super, buf + F2FS_SUPER_OFFSET,
> @@ -3499,6 +3522,12 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
>  	}
>  	sb = F2FS_RAW_SUPER(sbi);
>  
> +	/* Get metadata encryption algorithm */
> +	c.metadata_crypt_alg = get_sb(metadata_crypt_alg);
> +
> +	if (f2fs_metadata_verify_args())
> +		exit(1);
> +
>  	ret = check_sector_size(sb);
>  	if (ret)
>  		return -1;
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index b5bda13..6b1912d 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -441,6 +441,11 @@ struct f2fs_configuration {
>  
>  	/* cache parameters */
>  	dev_cache_config_t cache_config;
> +
> +	/* metadata encryption */
> +	__u8 *metadata_crypt_key;
> +	int metadata_crypt_key_len;
> +	int metadata_crypt_alg;
>  };
>  
>  #ifdef CONFIG_64BIT
> @@ -675,7 +680,8 @@ struct f2fs_super_block {
>  	__u8 hot_ext_count;		/* # of hot file extension */
>  	__le16  s_encoding;		/* Filename charset encoding */
>  	__le16  s_encoding_flags;	/* Filename charset encoding flags */
> -	__u8 reserved[306];		/* valid reserved region */
> +	__le32	metadata_crypt_alg;	/* The metadata encryption algorithm (FSCRYPT_MODE_*) */
> +	__u8 reserved[302];		/* valid reserved region */
>  	__le32 crc;			/* checksum of superblock */
>  } __attribute__((packed));
>  
> @@ -1237,12 +1243,14 @@ extern int dev_readahead(__u64, size_t UNUSED(len));
>  #endif
>  extern int dev_write(void *, __u64, size_t);
>  extern int dev_write_block(void *, __u64);
> +extern int dev_write_block_unencrypted(void *, __u64);
>  extern int dev_write_dump(void *, __u64, size_t);
>  /* All bytes in the buffer must be 0 use dev_fill(). */
>  extern int dev_fill(void *, __u64, size_t);
>  extern int dev_fill_block(void *, __u64);
>  
>  extern int dev_read_block(void *, __u64);
> +extern int dev_read_block_unencrypted(void *, __u64);
>  extern int dev_reada_block(__u64);
>  
>  extern int dev_read_version(void *, __u64, size_t);
> diff --git a/include/f2fs_metadata_crypt.h b/include/f2fs_metadata_crypt.h
> new file mode 100644
> index 0000000..d15873d
> --- /dev/null
> +++ b/include/f2fs_metadata_crypt.h
> @@ -0,0 +1,21 @@
> +/**
> + * f2fs_metadata_crypt.h
> + *
> + * Copyright (c) 2020 Google LLC
> + *
> + * Dual licensed under the GPL or LGPL version 2 licenses.
> + */
> +
> +#include <inttypes.h>
> +#include <linux/fscrypt.h>
> +
> +int f2fs_get_crypt_alg(const char *optarg);
> +
> +void f2fs_print_crypt_algs(void);
> +
> +int f2fs_metadata_process_key(const char *key_serial);
> +
> +int f2fs_metadata_verify_args(void);
> +
> +void *f2fs_metadata_crypt_blocks(void *src_buf, size_t len, __u64 blk_addr,
> +	bool encrypt);
> diff --git a/lib/Makefile.am b/lib/Makefile.am
> index 871d773..a82d753 100644
> --- a/lib/Makefile.am
> +++ b/lib/Makefile.am
> @@ -2,10 +2,10 @@
>  
>  lib_LTLIBRARIES = libf2fs.la
>  
> -libf2fs_la_SOURCES = libf2fs.c libf2fs_io.c libf2fs_zoned.c nls_utf8.c
> +libf2fs_la_SOURCES = libf2fs.c libf2fs_io.c libf2fs_zoned.c nls_utf8.c f2fs_metadata_crypt.c
>  libf2fs_la_CFLAGS = -Wall
>  libf2fs_la_CPPFLAGS = -I$(top_srcdir)/include
> -libf2fs_la_LDFLAGS = -version-info $(LIBF2FS_CURRENT):$(LIBF2FS_REVISION):$(LIBF2FS_AGE)
> +libf2fs_la_LDFLAGS = -lkeyutils -version-info $(LIBF2FS_CURRENT):$(LIBF2FS_REVISION):$(LIBF2FS_AGE)
>  
>  root_libdir=@root_libdir@
>  
> diff --git a/lib/f2fs_metadata_crypt.c b/lib/f2fs_metadata_crypt.c
> new file mode 100644
> index 0000000..faf399a
> --- /dev/null
> +++ b/lib/f2fs_metadata_crypt.c
> @@ -0,0 +1,226 @@
> +/**
> + * f2fs_metadata_crypt.c
> + *
> + * Copyright (c) 2020 Google LLC
> + *
> + * Dual licensed under the GPL or LGPL version 2 licenses.
> + */
> +#include <string.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <sys/socket.h>
> +#include <linux/if_alg.h>
> +#include <linux/socket.h>
> +#include <assert.h>
> +#include <errno.h>
> +#include <keyutils.h>
> +
> +#include "f2fs_fs.h"
> +#include "f2fs_metadata_crypt.h"
> +
> +extern struct f2fs_configuration c;
> +struct f2fs_crypt_mode {
> +	const char *friendly_name;
> +	const char *cipher_str;
> +	unsigned int keysize;
> +	unsigned int ivlen;
> +} f2fs_crypt_modes[] = {
> +	[FSCRYPT_MODE_AES_256_XTS] = {
> +		.friendly_name = "AES-256-XTS",
> +		.cipher_str = "xts(aes)",
> +		.keysize = 64,
> +		.ivlen = 16,
> +	},
> +	[FSCRYPT_MODE_ADIANTUM] = {
> +		.friendly_name = "Adiantum",
> +		.cipher_str = "adiantum(xchacha12,aes)",
> +		.keysize = 32,
> +		.ivlen = 32,
> +	},
> +};
> +#define MAX_IV_LEN 32
> +
> +void f2fs_print_crypt_algs(void)
> +{
> +	int i;
> +
> +	for (i = 1; i <= __FSCRYPT_MODE_MAX; i++) {
> +		if (!f2fs_crypt_modes[i].friendly_name)
> +			continue;
> +		MSG(0, "\t%s\n", f2fs_crypt_modes[i].friendly_name);
> +	}
> +}
> +
> +int f2fs_get_crypt_alg(const char *optarg)
> +{
> +	int i;
> +
> +	for (i = 1; i <= __FSCRYPT_MODE_MAX; i++) {
> +		if (f2fs_crypt_modes[i].friendly_name &&
> +		    !strcmp(f2fs_crypt_modes[i].friendly_name, optarg)) {
> +			return i;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int f2fs_metadata_process_key(const char *key_serial_str)
> +{
> +	key_serial_t key_serial = strtol(key_serial_str, NULL, 10);
> +
> +	c.metadata_crypt_key_len =
> +		keyctl_read_alloc(key_serial, (void **)&c.metadata_crypt_key);
> +
> +	if (c.metadata_crypt_key_len < 0)
> +		return errno;
> +
> +	return 0;
> +}
> +
> +int f2fs_metadata_verify_args(void)
> +{
> +	/* If neither specified, nothing to do */
> +	if (!c.metadata_crypt_key && !c.metadata_crypt_alg)
> +		return 0;
> +
> +	/* We need both specified */
> +	if (!c.metadata_crypt_key || !c.metadata_crypt_alg)
> +		return -EINVAL;
> +
> +	if (c.metadata_crypt_key_len !=
> +	    f2fs_crypt_modes[c.metadata_crypt_alg].keysize) {
> +		MSG(0, "\tMetadata encryption key length %d didn't match required size %d\n",
> +		    c.metadata_crypt_key_len,
> +		    f2fs_crypt_modes[c.metadata_crypt_alg].keysize);
> +
> +		return -EINVAL;
> +	}

Need to check sparse mode here?

And, what about multiple partition case?

> +
> +	return 0;
> +}
> +
> +void f2fs_metadata_crypt_gen_iv(struct af_alg_iv *iv, __u64 blk_addr)
> +{
> +	int i = 0;
> +
> +	memset(iv->iv, 0, iv->ivlen);
> +
> +	while (blk_addr > 0) {
> +		iv->iv[i] = blk_addr & 0xFF;
> +		blk_addr >>= 8;
> +		i++;
> +	}
> +}
> +
> +int f2fs_metadata_crypt_block(void *buf, size_t len, __u64 blk_addr,
> +			      bool encrypt)
> +{
> +	struct f2fs_crypt_mode *crypt_mode;
> +	int sockfd, fd;
> +	struct sockaddr_alg sa = {
> +		.salg_family = AF_ALG,
> +		.salg_type = "skcipher",
> +	};
> +	struct msghdr msg = {};
> +	struct cmsghdr *cmsg;
> +	char cbuf[CMSG_SPACE(4) + CMSG_SPACE(4 + MAX_IV_LEN)] = {0};
> +	int blk_offset;
> +	struct af_alg_iv *iv;
> +	struct iovec iov;
> +	int err;
> +
> +	crypt_mode = &f2fs_crypt_modes[c.metadata_crypt_alg];
> +	memcpy(sa.salg_name, crypt_mode->cipher_str,
> +	       strlen(crypt_mode->cipher_str));
> +
> +	sockfd = socket(AF_ALG, SOCK_SEQPACKET, 0);
> +	if (sockfd < 0)
> +		return errno;
> +	err = bind(sockfd, (struct sockaddr *)&sa, sizeof(sa));
> +	if (err) {
> +		MSG(0, "\tCouldn't bind crypto socket. Maybe support for the crypto algorithm isn't enabled?\n");
> +		close(sockfd);
> +		return errno;
> +	}
> +	err = setsockopt(sockfd, SOL_ALG, ALG_SET_KEY, c.metadata_crypt_key,
> +			 crypt_mode->keysize);
> +	if (err) {
> +		MSG(0, "\tCouldn't set crypto socket options.\n");
> +		close(sockfd);
> +		return errno;
> +	}
> +	fd = accept(sockfd, NULL, 0);
> +	if (fd < 0)
> +		goto err_out;
> +
> +	msg.msg_control = cbuf;
> +	msg.msg_controllen = sizeof(cbuf);
> +
> +	cmsg = CMSG_FIRSTHDR(&msg);
> +	cmsg->cmsg_level = SOL_ALG;
> +	cmsg->cmsg_type = ALG_SET_OP;
> +	cmsg->cmsg_len = CMSG_LEN(4);
> +	*(__u32 *)CMSG_DATA(cmsg) = encrypt ? ALG_OP_ENCRYPT : ALG_OP_DECRYPT;
> +
> +	cmsg = CMSG_NXTHDR(&msg, cmsg);
> +	cmsg->cmsg_level = SOL_ALG;
> +	cmsg->cmsg_type = ALG_SET_IV;
> +	cmsg->cmsg_len = CMSG_LEN(4 + MAX_IV_LEN);
> +	iv = (void *)CMSG_DATA(cmsg);
> +	iv->ivlen = crypt_mode->ivlen;
> +
> +	iov.iov_len = F2FS_BLKSIZE;
> +
> +	msg.msg_iov = &iov;
> +	msg.msg_iovlen = 1;
> +
> +	for (blk_offset = 0; blk_offset < len / F2FS_BLKSIZE; blk_offset++) {
> +		f2fs_metadata_crypt_gen_iv(iv, blk_addr + blk_offset);
> +
> +		iov.iov_base = (char *)buf + blk_offset * F2FS_BLKSIZE;
> +
> +		err = sendmsg(fd, &msg, 0);
> +		if (err < 0)
> +			goto err_out;
> +		err = read(fd, (char *)buf + blk_offset * F2FS_BLKSIZE,
> +			   F2FS_BLKSIZE);
> +		if (err < 0)
> +			goto err_out;
> +	}
> +
> +	close(fd);
> +	close(sockfd);
> +
> +	return 0;
> +
> +err_out:
> +	err = errno;
> +	close(fd);
> +	close(sockfd);
> +
> +	return err;
> +}
> +
> +void *f2fs_metadata_crypt_blocks(void *buf, size_t len, __u64 blk_addr,
> +	bool encrypt)
> +{
> +	int err = 0;
> +	void *enc_buf;
> +
> +	if (!c.metadata_crypt_key)
> +		return buf;
> +
> +	enc_buf = malloc(len);
> +	memcpy(enc_buf, buf, len);
> +
> +	err = f2fs_metadata_crypt_block(enc_buf, len, blk_addr, encrypt);
> +	if (err) {
> +		MSG(0, "\tFailed to en/decrypt blocks. Errno %d\n", err);
> +		free(enc_buf);
> +		return NULL;
> +	}
> +
> +	return enc_buf;
> +}
> diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
> index 138285d..f117e1e 100644
> --- a/lib/libf2fs_io.c
> +++ b/lib/libf2fs_io.c
> @@ -33,6 +33,7 @@
>  #include <assert.h>
>  #include <inttypes.h>
>  #include "f2fs_fs.h"
> +#include "f2fs_metadata_crypt.h"
>  
>  struct f2fs_configuration c;
>  
> @@ -499,10 +500,12 @@ static int sparse_write_blk(__u64 block, int count, const void *buf) { return 0;
>  static int sparse_write_zeroed_blk(__u64 block, int count) { return 0; }
>  #endif
>  
> -int dev_read(void *buf, __u64 offset, size_t len)
> +int __dev_read(void *buf, __u64 offset, size_t len, bool unencrypted)
>  {
>  	int fd;
> +	__u64 blk_addr = offset >> F2FS_BLKSIZE_BITS;
>  	int err;
> +	void *new_buf = NULL;
>  
>  	if (c.sparse_mode)
>  		return sparse_read_blk(offset / F2FS_BLKSIZE,
> @@ -521,9 +524,29 @@ int dev_read(void *buf, __u64 offset, size_t len)
>  		return -1;
>  	if (read(fd, buf, len) < 0)
>  		return -1;
> +	if (!unencrypted) {
> +		new_buf = f2fs_metadata_crypt_blocks(buf, len, blk_addr, false);
> +		if (!new_buf)
> +			return -1;
> +		if (new_buf != buf) {
> +			memcpy(buf, new_buf, len);
> +			free(new_buf);
> +		}
> +	}
> +
>  	return 0;
>  }
>  
> +int dev_read(void *buf, __u64 offset, size_t len)
> +{
> +	return __dev_read(buf, offset, len, false);
> +}
> +
> +int dev_read_unencrypted(void *buf, __u64 offset, size_t len)
> +{
> +	return __dev_read(buf, offset, len, true);
> +}
> +
>  #ifdef POSIX_FADV_WILLNEED
>  int dev_readahead(__u64 offset, size_t len)
>  #else
> @@ -541,13 +564,17 @@ int dev_readahead(__u64 offset, size_t UNUSED(len))
>  #endif
>  }
>  
> -int dev_write(void *buf, __u64 offset, size_t len)
> +int __dev_write(void *buf, __u64 offset, size_t len, bool unencrypted)
>  {
>  	int fd;
> +	__u64 blk_addr = offset >> F2FS_BLKSIZE_BITS;
> +	void *src_buf = buf;
> +	int err = -1;
>  
>  	if (c.dry_run)
>  		return 0;
>  
> +	/* TODO: handle sparse mode with metadata encryption */
>  	if (c.sparse_mode)
>  		return sparse_write_blk(offset / F2FS_BLKSIZE,
>  					len / F2FS_BLKSIZE, buf);
> @@ -562,11 +589,26 @@ int dev_write(void *buf, __u64 offset, size_t len)
>  	 */
>  	if (dcache_update_cache(fd, buf, (off64_t)offset, len) < 0)
>  		return -1;
> +	if (!unencrypted) {
> +		buf = f2fs_metadata_crypt_blocks(buf, len, blk_addr, true);
> +		if (!buf)
> +			return -1;
> +	}
>  	if (lseek64(fd, (off64_t)offset, SEEK_SET) < 0)
> -		return -1;
> +		goto out;
>  	if (write(fd, buf, len) < 0)
> -		return -1;
> -	return 0;
> +		goto out;
> +
> +	err = 0;
> +out:
> +	if (buf != src_buf)
> +		free(buf);
> +	return err;
> +}
> +
> +int dev_write(void *buf, __u64 offset, size_t len)
> +{
> +	return __dev_write(buf, offset, len, false);
>  }
>  
>  int dev_write_block(void *buf, __u64 blk_addr)
> @@ -574,6 +616,16 @@ int dev_write_block(void *buf, __u64 blk_addr)
>  	return dev_write(buf, blk_addr << F2FS_BLKSIZE_BITS, F2FS_BLKSIZE);
>  }
>  
> +static int dev_write_unencrypted(void *buf, __u64 offset, size_t len)
> +{
> +	return __dev_write(buf, offset, len, true);
> +}
> +
> +int dev_write_block_unencrypted(void *buf, __u64 blk_addr)
> +{
> +	return dev_write_unencrypted(buf, blk_addr << F2FS_BLKSIZE_BITS, F2FS_BLKSIZE);
> +}
> +
>  int dev_write_dump(void *buf, __u64 offset, size_t len)
>  {
>  	if (lseek64(c.dump_fd, (off64_t)offset, SEEK_SET) < 0)
> @@ -586,7 +638,11 @@ int dev_write_dump(void *buf, __u64 offset, size_t len)
>  int dev_fill(void *buf, __u64 offset, size_t len)
>  {
>  	int fd;
> +	__u64 blk_addr = offset >> F2FS_BLKSIZE_BITS;
> +	void *src_buf = buf;
> +	int err = -1;
>  
> +	/* TODO: handle sparse mode with metadata encryption */
>  	if (c.sparse_mode)
>  		return sparse_write_zeroed_blk(offset / F2FS_BLKSIZE,
>  						len / F2FS_BLKSIZE);
> @@ -598,11 +654,21 @@ int dev_fill(void *buf, __u64 offset, size_t len)
>  	/* Only allow fill to zero */
>  	if (*((__u8*)buf))
>  		return -1;
> -	if (lseek64(fd, (off64_t)offset, SEEK_SET) < 0)
> +
> +	buf = f2fs_metadata_crypt_blocks(buf, len, blk_addr, true);
> +	if (!buf)
>  		return -1;
> +
> +	if (lseek64(fd, (off64_t)offset, SEEK_SET) < 0)
> +		goto out;
>  	if (write(fd, buf, len) < 0)
> -		return -1;
> -	return 0;
> +		goto out;
> +
> +	err = 0;
> +out:
> +	if (buf != src_buf)
> +		free(buf);
> +	return err;
>  }
>  
>  int dev_fill_block(void *buf, __u64 blk_addr)
> @@ -615,6 +681,11 @@ int dev_read_block(void *buf, __u64 blk_addr)
>  	return dev_read(buf, blk_addr << F2FS_BLKSIZE_BITS, F2FS_BLKSIZE);
>  }
>  
> +int dev_read_block_unencrypted(void *buf, __u64 blk_addr)
> +{
> +	return dev_read_unencrypted(buf, blk_addr << F2FS_BLKSIZE_BITS, F2FS_BLKSIZE);
> +}
> +
>  int dev_reada_block(__u64 blk_addr)
>  {
>  	return dev_readahead(blk_addr << F2FS_BLKSIZE_BITS, F2FS_BLKSIZE);
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> index a6c542e..bf587bf 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -537,6 +537,9 @@ static int f2fs_prepare_super_block(void)
>  		set_sb(s_encoding_flags, c.s_encoding_flags);
>  	}
>  
> +	if (c.metadata_crypt_key)
> +		set_sb(metadata_crypt_alg, c.metadata_crypt_alg);
> +
>  	sb->feature = c.feature;
>  
>  	if (get_sb(feature) & F2FS_FEATURE_SB_CHKSUM) {
> @@ -1046,7 +1049,7 @@ static int f2fs_write_super_block(void)
>  	memcpy(zero_buff + F2FS_SUPER_OFFSET, sb, sizeof(*sb));
>  	DBG(1, "\tWriting super block, at offset 0x%08x\n", 0);
>  	for (index = 0; index < 2; index++) {
> -		if (dev_write_block(zero_buff, index)) {
> +		if (dev_write_block_unencrypted(zero_buff, index)) {
>  			MSG(1, "\tError: While while writing super_blk "
>  					"on disk!!! index : %d\n", index);
>  			free(zero_buff);
> diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
> index f2f0a80..8856850 100644
> --- a/mkfs/f2fs_format_main.c
> +++ b/mkfs/f2fs_format_main.c
> @@ -28,6 +28,7 @@
>  
>  #include "f2fs_fs.h"
>  #include "f2fs_format_utils.h"
> +#include "f2fs_metadata_crypt.h"
>  
>  #ifdef WITH_ANDROID
>  #include <sparse/sparse.h>
> @@ -44,6 +45,7 @@ static void mkfs_usage()
>  	MSG(0, "\nUsage: mkfs.f2fs [options] device [sectors]\n");
>  	MSG(0, "[options]:\n");
>  	MSG(0, "  -a heap-based allocation [default:0]\n");
> +	MSG(0, "  -A Metadata encryption algorithm\n");
>  	MSG(0, "  -c device1[,device2,...] up to 7 additional devices, except meta device\n");
>  	MSG(0, "  -d debug level [default:0]\n");
>  	MSG(0, "  -e [cold file ext list] e.g. \"mp3,gif,mov\"\n");
> @@ -54,6 +56,7 @@ static void mkfs_usage()
>  	MSG(0, "  -l label\n");
>  	MSG(0, "  -U uuid\n");
>  	MSG(0, "  -m support zoned block device [default:0]\n");
> +	MSG(0, "  -M Metadata encryption key_serial in keyring\n");
>  	MSG(0, "  -o overprovision percentage [default:auto]\n");
>  	MSG(0, "  -O feature1[,feature2,...] e.g. \"encrypt\"\n");
>  	MSG(0, "  -C [encoding[:flag1,...]] Support casefolding with optional flags\n");
> @@ -97,6 +100,12 @@ static void f2fs_show_info()
>  					f2fs_encoding2str(c.s_encoding));
>  	if (c.feature & le32_to_cpu(F2FS_FEATURE_PRJQUOTA))
>  		MSG(0, "Info: Enable Project quota\n");
> +
> +	if (c.metadata_crypt_key)
> +		MSG(0, "Info: Metadata key is %s\n", c.metadata_crypt_key);
> +
> +	if (c.metadata_crypt_alg)
> +		MSG(0, "Info: Metadata alg is %d\n", c.metadata_crypt_alg);
>  }
>  
>  static void add_default_options(void)
> @@ -125,7 +134,7 @@ static void add_default_options(void)
>  
>  static void f2fs_parse_options(int argc, char *argv[])
>  {
> -	static const char *option_string = "qa:c:C:d:e:E:g:il:mo:O:rR:s:S:z:t:T:U:Vfw:";
> +	static const char *option_string = "qa:A:c:C:d:e:E:g:il:mM:o:O:rR:s:S:z:t:T:U:Vfw:";
>  	int32_t option=0;
>  	int val;
>  	char *token;
> @@ -138,6 +147,14 @@ static void f2fs_parse_options(int argc, char *argv[])
>  		case 'a':
>  			c.heap = atoi(optarg);
>  			break;
> +		case 'A':
> +			c.metadata_crypt_alg = f2fs_get_crypt_alg(optarg);
> +			if (c.metadata_crypt_alg < 0) {
> +				MSG(0, "Error: invalid crypt algorithm specified. The choices are:");
> +				f2fs_print_crypt_algs();
> +				exit(1);
> +			}
> +			break;
>  		case 'c':
>  			if (c.ndevs >= MAX_DEVICES) {
>  				MSG(0, "Error: Too many devices\n");
> @@ -178,6 +195,12 @@ static void f2fs_parse_options(int argc, char *argv[])
>  		case 'm':
>  			c.zoned_mode = 1;
>  			break;
> +		case 'M':
> +			if (f2fs_metadata_process_key(optarg)) {
> +				MSG(0, "Error: Invalid metadata key\n");
> +				mkfs_usage();
> +			}
> +			break;
>  		case 'o':
>  			c.overprovision = atof(optarg);
>  			break;
> @@ -244,6 +267,14 @@ static void f2fs_parse_options(int argc, char *argv[])
>  		}
>  	}
>  
> +	if ((!!c.metadata_crypt_key) != (!!c.metadata_crypt_alg)) {
> +		MSG(0, "\tError: Both the metadata crypt key and crypt algorithm must be specified!");
> +		exit(1);
> +	}
> +
> +	if (f2fs_metadata_verify_args())
> +		exit(1);
> +
>  	add_default_options();

Need to check options after add_default_options()?

Thanks,

>  
>  	if (!(c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR))) {
> -- 
> 2.28.0.806.g8561365e88-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
