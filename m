Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CDB2FFF97
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jan 2021 10:57:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l2tBn-0006ML-UG; Fri, 22 Jan 2021 09:57:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1l2tBh-0006M5-L6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jan 2021 09:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4gEv32ZRpTQhWrGtggKvgx3+bR7J1XW83z2P+EiaMKc=; b=H3DGEvZEGNkNF9buiwQNk0vpbd
 BtplMNRwRo8eqUkq0LHy2Y9cEnKhdIWksbK+Rar1j2mnHshYbuBjdHxgoGoA2OHoLG2KV1zRGj6Je
 M7G77JHpVMz31qIrMJal6k+pqjNysINoYF5YmGlFALKPsEFFQoXzN1byYtlVlMpN2X+8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4gEv32ZRpTQhWrGtggKvgx3+bR7J1XW83z2P+EiaMKc=; b=mEjVVT1698F/SoTpBc/FZBZacG
 4PnOA8rx6NxU80BGOaTVhJ+7msJNkNkUJA6dXhXBgHrnXblOqDMy/b2t47z8r9yK2OdD+URxsRCdZ
 rhg+c3kJXb+v1LBB0PFbzmiS6dpb4xZoEkCRQSmvGrOt6PN5TPQOp3WpuGgSIrsWGyYI=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l2tBV-009Si5-RQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jan 2021 09:57:05 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DMZQC6mrtzj7xw;
 Fri, 22 Jan 2021 17:55:47 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 22 Jan
 2021 17:56:38 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <202101191726.YGvRr4k5-lkp@intel.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <adc43f9f-583b-fdb3-adcb-0ff94de57da4@huawei.com>
Date: Fri, 22 Jan 2021 17:56:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <202101191726.YGvRr4k5-lkp@intel.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1l2tBV-009Si5-RQ
Subject: Re: [f2fs-dev] [linux-next:master 2106/4407]
 fs/f2fs/super.c:470:12: warning: unused function 'f2fs_compress_set_level'
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk,

I've fix this compile warning due to c08e95fc6466 ("f2fs: compress: support compress level")

However the fix will conflict with
("f2fs: compress: deny setting unsupported compress algorithm")

So I rebase these two patches to 03a9a1a64a11 ("f2fs: relocate f2fs_precache_extents()")
with reversed order as below, please apply them with the right order:

1. 03a9a1a64a11 ("f2fs: relocate f2fs_precache_extents()")
2. [PATCH v3] f2fs: compress: deny setting unsupported compress algorithm
3. [PATCH v3] f2fs: compress: support compress level

On 2021/1/19 17:01, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   b4bb878f3eb3e604ebfe83bbc17eb7af8d99cbf4
> commit: ec0d0eb347b05377ad2e03c51cb1d08d6ed35619 [2106/4407] f2fs: compress: deny setting unsupported compress algorithm
> config: mips-randconfig-r033-20210119 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 22b68440e1647e16b5ee24b924986207173c02d1)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install mips cross compiling tool for clang build
>          # apt-get install binutils-mips-linux-gnu
>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ec0d0eb347b05377ad2e03c51cb1d08d6ed35619
>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>          git fetch --no-tags linux-next master
>          git checkout ec0d0eb347b05377ad2e03c51cb1d08d6ed35619
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> fs/f2fs/super.c:470:12: warning: unused function 'f2fs_compress_set_level'
>     static int f2fs_compress_set_level(struct f2fs_sb_info const char
>     ^
>     fatal error: error in backend: Nested variants found in inline asm string: ' .set push
>     .set mips64r2
>     .if ( 0x00 ) != -1)) 0x00 ) != -1)) : ($( static struct ftrace_branch_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace_branch"))) __if_trace = $( .func = __func__, .file = "arch/mips/include/asm/bitops.h", .line = 105, $); 0x00 ) != -1)) : $))) ) && ( 0 ); .set push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ; .endif
>     1: ll $0, $1
>     or $0, $2
>     sc $0, $1
>     beqz $0, 1b
>     .set pop
>     '
>     clang-12: error: clang frontend command failed with exit code 70 (use -v to see invocation)
>     clang version 12.0.0 (git://gitmirror/llvm_project 22b68440e1647e16b5ee24b924986207173c02d1)
>     Target: mipsel-unknown-linux-gnu
>     Thread model: posix
>     InstalledDir: /opt/cross/clang-22b68440e1/bin
>     clang-12: note: diagnostic msg:
>     Makefile arch fs include kernel scripts source usr
> 
> 
> vim +/f2fs_compress_set_level +470 fs/f2fs/super.c
> 
> ed318a6cc0b62044 Eric Biggers 2020-05-12  468
> 0ba061b9e957791e Chao Yu      2020-12-09  469  #ifdef CONFIG_F2FS_FS_COMPRESSION
> 0ba061b9e957791e Chao Yu      2020-12-09 @470  static int f2fs_compress_set_level(struct f2fs_sb_info *sbi, const char *str,
> 0ba061b9e957791e Chao Yu      2020-12-09  471  						int type)
> 0ba061b9e957791e Chao Yu      2020-12-09  472  {
> 0ba061b9e957791e Chao Yu      2020-12-09  473  	unsigned int level;
> 0ba061b9e957791e Chao Yu      2020-12-09  474  	int len;
> 0ba061b9e957791e Chao Yu      2020-12-09  475
> 0ba061b9e957791e Chao Yu      2020-12-09  476  	if (type == COMPRESS_LZ4)
> 0ba061b9e957791e Chao Yu      2020-12-09  477  		len = 3;
> 0ba061b9e957791e Chao Yu      2020-12-09  478  	else if (type == COMPRESS_ZSTD)
> 0ba061b9e957791e Chao Yu      2020-12-09  479  		len = 4;
> 0ba061b9e957791e Chao Yu      2020-12-09  480  	else
> 0ba061b9e957791e Chao Yu      2020-12-09  481  		return 0;
> 0ba061b9e957791e Chao Yu      2020-12-09  482
> 0ba061b9e957791e Chao Yu      2020-12-09  483  	if (strlen(str) == len)
> 0ba061b9e957791e Chao Yu      2020-12-09  484  		return 0;
> 0ba061b9e957791e Chao Yu      2020-12-09  485
> 0ba061b9e957791e Chao Yu      2020-12-09  486  	str += len;
> 0ba061b9e957791e Chao Yu      2020-12-09  487
> 0ba061b9e957791e Chao Yu      2020-12-09  488  	if (str[0] != ':') {
> 0ba061b9e957791e Chao Yu      2020-12-09  489  		f2fs_info(sbi, "wrong format, e.g. <alg_name>:<compr_level>");
> 0ba061b9e957791e Chao Yu      2020-12-09  490  		return -EINVAL;
> 0ba061b9e957791e Chao Yu      2020-12-09  491  	}
> 0ba061b9e957791e Chao Yu      2020-12-09  492  	if (kstrtouint(str + 1, 10, &level))
> 0ba061b9e957791e Chao Yu      2020-12-09  493  		return -EINVAL;
> 0ba061b9e957791e Chao Yu      2020-12-09  494  	if (type == COMPRESS_LZ4) {
> 0ba061b9e957791e Chao Yu      2020-12-09  495  #ifdef CONFIG_F2FS_FS_LZ4HC
> 0ba061b9e957791e Chao Yu      2020-12-09  496  		if (level < LZ4HC_MIN_CLEVEL || level > LZ4HC_MAX_CLEVEL) {
> 0ba061b9e957791e Chao Yu      2020-12-09  497  			f2fs_info(sbi, "invalid lz4hc compress level: %d", level);
> 0ba061b9e957791e Chao Yu      2020-12-09  498  			return -EINVAL;
> 0ba061b9e957791e Chao Yu      2020-12-09  499  		}
> 0ba061b9e957791e Chao Yu      2020-12-09  500  #else
> 0ba061b9e957791e Chao Yu      2020-12-09  501  		f2fs_info(sbi, "doesn't support lz4hc compression");
> 0ba061b9e957791e Chao Yu      2020-12-09  502  		return 0;
> 0ba061b9e957791e Chao Yu      2020-12-09  503  #endif
> 0ba061b9e957791e Chao Yu      2020-12-09  504  	} else if (type == COMPRESS_ZSTD) {
> 0ba061b9e957791e Chao Yu      2020-12-09  505  #ifdef CONFIG_F2FS_FS_ZSTD
> 0ba061b9e957791e Chao Yu      2020-12-09  506  		if (!level || level > ZSTD_maxCLevel()) {
> 0ba061b9e957791e Chao Yu      2020-12-09  507  			f2fs_info(sbi, "invalid zstd compress level: %d", level);
> 0ba061b9e957791e Chao Yu      2020-12-09  508  			return -EINVAL;
> 0ba061b9e957791e Chao Yu      2020-12-09  509  		}
> 0ba061b9e957791e Chao Yu      2020-12-09  510  #else
> 0ba061b9e957791e Chao Yu      2020-12-09  511  		f2fs_info(sbi, "doesn't support zstd compression");
> 0ba061b9e957791e Chao Yu      2020-12-09  512  #endif
> 0ba061b9e957791e Chao Yu      2020-12-09  513  	}
> 0ba061b9e957791e Chao Yu      2020-12-09  514  	F2FS_OPTION(sbi).compress_level = level;
> 0ba061b9e957791e Chao Yu      2020-12-09  515  	return 0;
> 0ba061b9e957791e Chao Yu      2020-12-09  516  }
> 0ba061b9e957791e Chao Yu      2020-12-09  517  #endif
> 0ba061b9e957791e Chao Yu      2020-12-09  518
> 
> :::::: The code at line 470 was first introduced by commit
> :::::: 0ba061b9e957791e8120b6acb589a26fa7bbbb53 f2fs: compress: support compress level
> 
> :::::: TO: Chao Yu <yuchao0@huawei.com>
> :::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
