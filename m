Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC6797769A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Sep 2024 03:54:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sovWC-0006yM-Ub;
	Fri, 13 Sep 2024 01:54:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sovWC-0006yG-4Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Sep 2024 01:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ABD0bFqSomDX/dG94h2fU3tA9fe/Hq+0/Egm1fx4OZk=; b=lybERVSFLgCQ7MuIAc5kiNd8SR
 pFa6brHl3mcnJ4vZ1hz9GVdLF9jeY3lGe3UYqWnZDjGiO+eQmQAfb79VhezCn8V25G1GIM9bMKPPi
 vFI21f8fpj52piPYnel2c7O71aek43bS0vmtbrgETBwrAFMCoEUUovU+vqxpENjAwXLo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ABD0bFqSomDX/dG94h2fU3tA9fe/Hq+0/Egm1fx4OZk=; b=GQzh6hbTtmJgmv02XCtrj10ex4
 PoRQuBUtbkgtg6Lc0D2VCi4z8Coy0+Aiy85Irm0CCOPi+RbTe5ahoMiT9ycHfMh+NkMMqB/mAWoNR
 PVhM5x5AfuPWxBOn7s4d8hQkT9vwJjR7HDnx8dYvjmuW0LBpvpCJtFB5NXbQsfYhgEiM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sovWC-0007gA-63 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Sep 2024 01:54:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 41DCF5C3AC4;
 Fri, 13 Sep 2024 01:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA799C4CEC3;
 Fri, 13 Sep 2024 01:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726192469;
 bh=mft9FtluiUsNO+9kFzODvOo8dIa6ktLqqwZBmeJrdcs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=GlsFXUGINl89AIv1C6rvqRudlda4DMG0gy1hhRbPY8zpkptnxahawEGtsr/tDOAxi
 E8lMCwkX9L7OUg3gUL/Hq0puQxMunt/1RBm92n8Su9c8kn7uBqlnRqeDWEpVp9uTFt
 R5/rivfTLGYXW8n2hgC2gKG4ridkZYUNc7dxgA7X0uFw9TfuoC0WbKuJ3MttKnGcJk
 e1QKrCA1pD8zP4unHxAmfPkJ/WNxG8g+EiSkH6yk+5AcPm384HIvf8rJ2PoRiPr42g
 y7u22WxFtns0P+OXWapXkGwpIPiKx5z6Q/57Fc8e9QHjXJNqH+v8eGZheL2bT5tXqL
 S5fG2aRK1/LSg==
Message-ID: <f617ac0c-5ac8-439d-8283-41a68086ff63@kernel.org>
Date: Fri, 13 Sep 2024 09:54:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kernel test robot <oliver.sang@intel.com>
References: <202409122131.d6e2f8c1-oliver.sang@intel.com>
Content-Language: en-US
In-Reply-To: <202409122131.d6e2f8c1-oliver.sang@intel.com>
X-Spam-Score: -4.1 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/12 21:50, kernel test robot wrote: > > > Hello,
 > > kernel test robot noticed "xfstests.generic.091.fail" on: > > commit:
 5c8764f8679e659c5cb295af7d32279002d13735 ("f2fs: fix to force buffer [...]
 Content analysis details:   (-4.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 1.2 SUBJ_LACKS_WORDS       Subject is not short yet lacks words
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sovWC-0007gA-63
Subject: Re: [f2fs-dev] [linus:master] [f2fs] 5c8764f867:
 xfstests.generic.091.fail
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: lkp@intel.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Barry Song <v-songbaohua@oppo.com>,
 oe-lkp@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/9/12 21:50, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "xfstests.generic.091.fail" on:
> 
> commit: 5c8764f8679e659c5cb295af7d32279002d13735 ("f2fs: fix to force buffered IO on inline_data inode")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Can you please try below fix for xfstests?

https://lore.kernel.org/fstests/20240911035333.364961-1-chao@kernel.org/

Thanks,

> 
> in testcase: xfstests
> version: xfstests-x86_64-b1465280-1_20240909
> with following parameters:
> 
> 	disk: 4HDD
> 	fs: f2fs
> 	test: generic-091
> 
> 
> 
> compiler: gcc-12
> test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz (Skylake) with 28G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202409122131.d6e2f8c1-oliver.sang@intel.com
> 
> 2024-09-11 03:13:26 export TEST_DIR=/fs/sda1
> 2024-09-11 03:13:26 export TEST_DEV=/dev/sda1
> 2024-09-11 03:13:26 export FSTYP=f2fs
> 2024-09-11 03:13:26 export SCRATCH_MNT=/fs/scratch
> 2024-09-11 03:13:26 mkdir /fs/scratch -p
> 2024-09-11 03:13:26 export SCRATCH_DEV=/dev/sda4
> 2024-09-11 03:13:26 export MKFS_OPTIONS="-f"
> 2024-09-11 03:13:27 echo generic/091
> 2024-09-11 03:13:27 ./check generic/091
> FSTYP         -- f2fs
> PLATFORM      -- Linux/x86_64 lkp-skl-d01 6.10.0-rc3-00027-g5c8764f8679e #1 SMP PREEMPT_DYNAMIC Wed Sep 11 10:37:47 CST 2024
> MKFS_OPTIONS  -- -f /dev/sda4
> MOUNT_OPTIONS -- -o acl,user_xattr /dev/sda4 /fs/scratch
> 
> generic/091       [failed, exit status 1]- output mismatch (see /lkp/benchmarks/xfstests/results//generic/091.out.bad)
>      --- tests/generic/091.out	2024-09-09 16:31:23.000000000 +0000
>      +++ /lkp/benchmarks/xfstests/results//generic/091.out.bad	2024-09-11 03:14:07.468026185 +0000
>      @@ -1,7 +1,55 @@
>       QA output created by 091
>       fsx -N 10000 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
>      -fsx -N 10000 -o 8192 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
>      -fsx -N 10000 -o 32768 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
>      -fsx -N 10000 -o 8192 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
>      -fsx -N 10000 -o 32768 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
>      -fsx -N 10000 -o 128000 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -W
>      ...
>      (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/091.out /lkp/benchmarks/xfstests/results//generic/091.out.bad'  to see the entire diff)
> Ran: generic/091
> Failures: generic/091
> Failed 1 of 1 tests
> 
> 
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240912/202409122131.d6e2f8c1-oliver.sang@intel.com
> 
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
