Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7917F835B32
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jan 2024 07:44:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rRo3B-00062m-PT;
	Mon, 22 Jan 2024 06:44:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dan.carpenter@linaro.org>) id 1rRo3A-00062f-DB
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 06:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G5xHkIHav/DyHDr3s4AUIxAaw4nqa+rIE0HQuqV2AoY=; b=a+k7zuc15NqoW1zEaIh4I0NLAJ
 xDdctS7lglmCoGcWSMYL4tHia22SfxJJNIGkCfsPCBho0G7TPfU19sfqY/wrmrXHmsvKyQGzBDCTE
 QKNy4p0y745KwywnYMmqwWsn4FPg18q/SJUkyjbOt8Ovm3dJWmIYWuKvK9f+jZh1Bwnk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=G5xHkIHav/DyHDr3s4AUIxAaw4nqa+rIE0HQuqV2AoY=; b=X
 UurwHvEhhcZGP5lazO9Z/ktaEcjX2DBgEVyRakG/mI3QsuUBLGbi2Aa2RqwrE33moYTgYoZZvdqzA
 bmiLCGP/cxOKzyq9w5mmV3NglpAXLcIj3J6aWk8u1ut1mrdlR65Q7RPGrAK9pZmqb4BSsF2oy5qye
 C3HB4VhBu7X92jos=;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rRo39-0006HY-OQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 06:44:53 +0000
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-339208f5105so2432400f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 21 Jan 2024 22:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705905881; x=1706510681; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=G5xHkIHav/DyHDr3s4AUIxAaw4nqa+rIE0HQuqV2AoY=;
 b=xteXjZlacBkBBoXI8mrfSR4LGeVNa4vTEATP40+q2bxPLxYTfGOSHZHSkuVnJkxxTj
 IHLNmhon6lm9KgmYB2ZzTRAD9zGKgSgG543IXSJa8FRSRUluu3vtlwlr5YGl+yI9S59u
 kUqQ3qQmpv1bWxPhw6RwNGDpvCkGJ2RJbGj0OBarppxTwijaiYlTTZzfxDkLwTBI/JZo
 nFBXo69R6+tJRs5NkNmLxSVOK1EKYEM1pKGRWDE9HBboEO81cipDtVDsT0lvVZo+4XPP
 jeiD97aDAOIO4oUpUjybnMpsAvyhT3bvYzkbBrp6yzKsV/TyJrw6vyk715PBWMqwahc/
 oZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705905881; x=1706510681;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G5xHkIHav/DyHDr3s4AUIxAaw4nqa+rIE0HQuqV2AoY=;
 b=a00GnH4CQr9uCtrqmKLxO/PDG2ciedZdwkId1c0heg0EyIhhyfIJOD6MYunkguy76G
 l8fAUw4CZM58ZyaeU6qIdHX/rpSh5ns74aX+iRbrOj6uTPsQakx9XTpuBbsNtXPKYuK1
 Nt7y4RXzPY4C25ux5ApbRGrswigds+Yf+USDtUE2Xaj3pNZK5k5uQ8yIBtQ1988zmSfb
 v6zhhZu2rQa25B08Mhocssxnm292BQQuG9oegCMBL8a2Uiy9hxXrsCIa64ZeKwtNyLW1
 LR36q3BRJf6aptLqXDDXbSgf9j4U7EE/ellMKCh0VY7z+t57nRRnfJ7uDJMlF/KqZYpL
 GdUQ==
X-Gm-Message-State: AOJu0YyfxB5y6xE5AuDVqmiG4FUGVvZ6qgxxqSiI4dPJSs2zBwGZLLuB
 3R7AVbJQHdJzDSpjeCUN9jWjiw0N7qsF3uV0BgI6aM7E7SF9bJCXiU3P7wxT5YU=
X-Google-Smtp-Source: AGHT+IG67cw43mThfXEsC9o9+iXpXAmakGy90SkFFf1P6ebKwfwMmhLzILumIpwFFYr7EL1DHjc5bA==
X-Received: by 2002:a05:6000:18a2:b0:339:3814:c7ce with SMTP id
 b2-20020a05600018a200b003393814c7cemr334880wri.178.1705905880957; 
 Sun, 21 Jan 2024 22:44:40 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 p17-20020adfcc91000000b003377680c55bsm8302984wrj.16.2024.01.21.22.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 22:44:40 -0800 (PST)
Date: Mon, 22 Jan 2024 09:44:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Wenjie Qi <qwjhust@gmail.com>,
 jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-ID: <397e7ad5-5c49-474a-b32e-ac1d24289862@moroto.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240116140513.1222-1-qwjhust@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Wenjie,
 kernel test robot noticed the following build warnings:
 https://git-scm.com/docs/git-format-patch#_base_tree_information] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.46 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.46 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rRo39-0006HY-OQ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix zoned block device information
 initialization
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
Cc: Wenjie Qi <qwjhust@gmail.com>, lkp@intel.com, hustqwj@hust.edu.cn,
 oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Wenjie,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenjie-Qi/f2fs-fix-zoned-block-device-information-initialization/20240116-220824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20240116140513.1222-1-qwjhust%40gmail.com
patch subject: [PATCH v2] f2fs: fix zoned block device information initialization
config: x86_64-randconfig-161-20240119 (https://download.01.org/0day-ci/archive/20240120/202401201237.ovVyEKvs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202401201237.ovVyEKvs-lkp@intel.com/

New smatch warnings:
fs/f2fs/super.c:2393 f2fs_remount() warn: missing error code 'err'

Old smatch warnings:
fs/f2fs/super.c:4040 read_raw_super_block() warn: possible memory leak of 'super'

vim +/err +2393 fs/f2fs/super.c

4b2414d04e9912 Chao Yu        2017-08-08  2371  
df728b0f6954c3 Jaegeuk Kim    2016-03-23  2372  	/* recover superblocks we couldn't write due to previous RO mount */
1751e8a6cb935e Linus Torvalds 2017-11-27  2373  	if (!(*flags & SB_RDONLY) && is_sbi_flag_set(sbi, SBI_NEED_SB_WRITE)) {
df728b0f6954c3 Jaegeuk Kim    2016-03-23  2374  		err = f2fs_commit_super(sbi, false);
dcbb4c10e6d969 Joe Perches    2019-06-18  2375  		f2fs_info(sbi, "Try to recover all the superblocks, ret: %d",
dcbb4c10e6d969 Joe Perches    2019-06-18  2376  			  err);
df728b0f6954c3 Jaegeuk Kim    2016-03-23  2377  		if (!err)
df728b0f6954c3 Jaegeuk Kim    2016-03-23  2378  			clear_sbi_flag(sbi, SBI_NEED_SB_WRITE);
df728b0f6954c3 Jaegeuk Kim    2016-03-23  2379  	}
df728b0f6954c3 Jaegeuk Kim    2016-03-23  2380  
458c15dfbce62c Chao Yu        2023-05-23  2381  	default_options(sbi, true);
26666c8a4366de Chao Yu        2014-09-15  2382  
696c018c7718f5 Namjae Jeon    2013-06-16  2383  	/* parse mount options */
ed318a6cc0b620 Eric Biggers   2020-05-12  2384  	err = parse_options(sb, data, true);
696c018c7718f5 Namjae Jeon    2013-06-16  2385  	if (err)
696c018c7718f5 Namjae Jeon    2013-06-16  2386  		goto restore_opts;
696c018c7718f5 Namjae Jeon    2013-06-16  2387  
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2388  #ifdef CONFIG_BLK_DEV_ZONED
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2389  	if (sbi->max_active_zones && sbi->max_active_zones < F2FS_OPTION(sbi).active_logs) {
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2390  		f2fs_err(sbi,
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2391  			"zoned: max active zones %u is too small, need at least %u active zones",
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2392  				 sbi->max_active_zones, F2FS_OPTION(sbi).active_logs);
ed7a1efe8afd55 Wenjie Qi      2024-01-16 @2393  		goto restore_opts;

err = -EINVAL?

ed7a1efe8afd55 Wenjie Qi      2024-01-16  2394  	}
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2395  #endif
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2396  
b62e71be2110d8 Chao Yu        2023-04-23  2397  	/* flush outstanding errors before changing fs state */
b62e71be2110d8 Chao Yu        2023-04-23  2398  	flush_work(&sbi->s_error_work);
b62e71be2110d8 Chao Yu        2023-04-23  2399  
696c018c7718f5 Namjae Jeon    2013-06-16  2400  	/*
696c018c7718f5 Namjae Jeon    2013-06-16  2401  	 * Previous and new state of filesystem is RO,
876dc59eb1f013 Gu Zheng       2014-04-11  2402  	 * so skip checking GC and FLUSH_MERGE conditions.
696c018c7718f5 Namjae Jeon    2013-06-16  2403  	 */
1751e8a6cb935e Linus Torvalds 2017-11-27  2404  	if (f2fs_readonly(sb) && (*flags & SB_RDONLY))
696c018c7718f5 Namjae Jeon    2013-06-16  2405  		goto skip;
696c018c7718f5 Namjae Jeon    2013-06-16  2406  
d78dfefcde9d31 Chao Yu        2023-04-04  2407  	if (f2fs_dev_is_readonly(sbi) && !(*flags & SB_RDONLY)) {
a7d9fe3c338870 Jaegeuk Kim    2021-05-21  2408  		err = -EROFS;
a7d9fe3c338870 Jaegeuk Kim    2021-05-21  2409  		goto restore_opts;
a7d9fe3c338870 Jaegeuk Kim    2021-05-21  2410  	}
a7d9fe3c338870 Jaegeuk Kim    2021-05-21  2411  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
