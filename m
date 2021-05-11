Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D6F379FE8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 08:45:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgM8r-0004O5-E7; Tue, 11 May 2021 06:45:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1lgM8j-0004Nm-Sg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 06:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TrdDGr8W3Mjo+2ybFJjLJZ0JLN2ULmH26bDyKhnBmHk=; b=apLfgtEvXcylBRamr9DziP9aMn
 pJV0C3pfhwfAgWn4HLpSvIF0rfjcm6EKFewOXQsbmoZCB+kRD3Arj98QfECVpjtUwzNoBJfrZAIrS
 IIKs0EUONlNdsH4fAzYKjlcyZ+njFfr3xkXq61mqD8ktEGRi8x6YOcnNZ+tnFzWn9SYc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TrdDGr8W3Mjo+2ybFJjLJZ0JLN2ULmH26bDyKhnBmHk=; b=HA6dwsbLnEk99s9ktM9LL4IZrV
 aCuv7yNTqjYMgE/poOA1FfZVPKPiEMp+A/WwPZ+kYZPqcR6Cde1IlAHRNUEjLz07nI6cklzb0WoyY
 ZZxRs2MIq4LspjhbHPJOEhd6mvOxWh260SzziZaHyusgM3Q5RNTj0kIOpmVk4Jg6b/4s=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgM8d-003UYH-Lp
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 06:45:10 +0000
Received: from dggemx753-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FfSyY4qxKz5vt6;
 Tue, 11 May 2021 14:42:13 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 14:44:52 +0800
To: kernel test robot <lkp@intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <202105111323.jd5vYmHN-lkp@intel.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <09581936-5fe8-fd69-df5b-835b6db089ac@huawei.com>
Date: Tue, 11 May 2021 14:44:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <202105111323.jd5vYmHN-lkp@intel.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-ClientProxiedBy: dggemx704-chm.china.huawei.com (10.1.199.51) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lgM8d-003UYH-Lp
Subject: Re: [f2fs-dev] [f2fs:dev-test 12/12] fs/f2fs/super.c:4194:31:
 error: implicit declaration of function 'COMPRESS_MAPPING'
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
Cc: clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

Thanks for the report.

On 2021/5/11 13:41, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
> head:   55b45e3a3bbcbc02828c32e3ba3f413634046fd2
> commit: 55b45e3a3bbcbc02828c32e3ba3f413634046fd2 [12/12] f2fs: compress: add compress_inode to cache compressed blocks
> config: x86_64-randconfig-a003-20210511 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project a0fed635fe1701470062495a6ffee1c608f3f1bc)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install x86_64 cross compiling tool for clang build
>          # apt-get install binutils-x86-64-linux-gnu
>          # https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?id=55b45e3a3bbcbc02828c32e3ba3f413634046fd2
>          git remote add f2fs https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
>          git fetch --no-tags f2fs dev-test
>          git checkout 55b45e3a3bbcbc02828c32e3ba3f413634046fd2
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All error/warnings (new ones prefixed by >>):
> 
>>> fs/f2fs/super.c:4194:31: error: implicit declaration of function 'COMPRESS_MAPPING' [-Werror,-Wimplicit-function-declaration]
>                             truncate_inode_pages_final(COMPRESS_MAPPING(sbi));
>                                                        ^
>>> fs/f2fs/super.c:4194:31: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct address_space *' [-Wint-conversion]
>                             truncate_inode_pages_final(COMPRESS_MAPPING(sbi));
>                                                        ^~~~~~~~~~~~~~~~~~~~~
>     include/linux/mm.h:2651:62: note: passing argument to parameter here
>     extern void truncate_inode_pages_final(struct address_space *);
>                                                                  ^
>     1 warning and 1 error generated.

I have fixed this in my repo:

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=dev&id=c2c4e40ae1815d4a6f4143a5af4a38c4a76ba9f7

@@ -4162,6 +4186,15 @@ static void kill_f2fs_super(struct super_block *sb)
  		f2fs_stop_gc_thread(sbi);
  		f2fs_stop_discard_thread(sbi);

+#ifdef CONFIG_F2FS_FS_COMPRESSION
+		/*
+		 * latter evict_inode() can bypass checking and invalidating
+		 * compress inode cache.
+		 */
+		if (test_opt(sbi, COMPRESS_CACHE))
+			truncate_inode_pages_final(COMPRESS_MAPPING(sbi));
+#endif

Thanks,

> 
> 
> vim +/COMPRESS_MAPPING +4194 fs/f2fs/super.c
> 
>    4179	
>    4180	static void kill_f2fs_super(struct super_block *sb)
>    4181	{
>    4182		if (sb->s_root) {
>    4183			struct f2fs_sb_info *sbi = F2FS_SB(sb);
>    4184	
>    4185			set_sbi_flag(sbi, SBI_IS_CLOSE);
>    4186			f2fs_stop_gc_thread(sbi);
>    4187			f2fs_stop_discard_thread(sbi);
>    4188	
>    4189			/*
>    4190			 * latter evict_inode() can bypass checking and invalidating
>    4191			 * compress inode cache.
>    4192			 */
>    4193			if (test_opt(sbi, COMPRESS_CACHE))
>> 4194				truncate_inode_pages_final(COMPRESS_MAPPING(sbi));
>    4195	
>    4196			if (is_sbi_flag_set(sbi, SBI_IS_DIRTY) ||
>    4197					!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
>    4198				struct cp_control cpc = {
>    4199					.reason = CP_UMOUNT,
>    4200				};
>    4201				f2fs_write_checkpoint(sbi, &cpc);
>    4202			}
>    4203	
>    4204			if (is_sbi_flag_set(sbi, SBI_IS_RECOVERED) && f2fs_readonly(sb))
>    4205				sb->s_flags &= ~SB_RDONLY;
>    4206		}
>    4207		kill_block_super(sb);
>    4208	}
>    4209	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
