Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F89C37F328
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 May 2021 08:41:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lh52T-0006GV-Gs; Thu, 13 May 2021 06:41:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lh52P-0006GK-9p
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 May 2021 06:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0VQCxDZLEQ077RZUfswStg2hEngRuHptx53chyqOXFA=; b=AyZIKiBmTldQ+qJroxEtx9R590
 wJyni6gbT/dSfH/6GF+4ftfyq4nAltO0LNTRwdRMRn20+7PEmOnhh7wnxVjLv2aWcSjX5zYgEwVm1
 fl5Oj+yXwv22qhllDSqTwb2vOYnmKHREADXEZaJz7vp8ym0t6Nx1lMpbi7YPk7q0X7mM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0VQCxDZLEQ077RZUfswStg2hEngRuHptx53chyqOXFA=; b=GsA+6BDKaFtwKhmb/budAMUbU1
 aGF/721IndHOTcLAzDedG2735r0JbkzQwOMYYPmwm9Wj/ZsMXPQKNEDhOUl3lw38aDZFv7nXoGJzh
 ZZd3BFQTeonxDIg9iV3TZwQ5fvsFLdC2KzvcDMUl99J56gdnDjKQANtsC7pHJHzsEIOY=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lh527-006OaX-H1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 May 2021 06:41:39 +0000
Received: from dggemx753-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FghlS23xZz19HhY;
 Thu, 13 May 2021 14:36:52 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 13 May 2021 14:41:07 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210511061121.GD8539@xsang-OptiPlex-9020>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <1c763372-61ef-38b7-c0bd-2ba1b4047dcc@huawei.com>
Date: Thu, 13 May 2021 14:41:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210511061121.GD8539@xsang-OptiPlex-9020>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-ClientProxiedBy: dggemx704-chm.china.huawei.com (10.1.199.51) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lh527-006OaX-H1
Subject: Re: [f2fs-dev] [f2fs] 36e4d95891: ltp.swapon03.fail
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

I checked LTP's testcase, swapfile it created has only 40KB, so
no matter how we migrate its blocks, the whole swapfile can not
aligned to section size, and we can't say there is no such case
in real user scenario.

Thoughts? can we revert to let swap IO go through f2fs page cache?
I mean tag SWP_FS_OPS during swapon(), then we need to fix trim
issue in swapfile.c.

libs/libltpswap/libswap.c

/*
  * Make a swap file
  */
int make_swapfile(const char *swapfile, int safe)
{
	if (!tst_fs_has_free(".", sysconf(_SC_PAGESIZE) * 10, TST_BYTES))
		tst_brk(TBROK, "Insufficient disk space to create swap file");

	/* create file */
	if (tst_fill_file(swapfile, 0, sysconf(_SC_PAGESIZE), 10) != 0)
		tst_brk(TBROK, "Failed to create swapfile");

	/* make the file swapfile */
	const char *argv[2 + 1];
	argv[0] = "mkswap";
	argv[1] = swapfile;
	argv[2] = NULL;

	return tst_cmd(argv, "/dev/null", "/dev/null", safe);
}

On 2021/5/11 14:11, kernel test robot wrote:
> 
> 
> Greeting,
> 
> FYI, we noticed the following commit (built with gcc-9):
> 
> commit: 36e4d95891ed37eb98a660babec749be3fb35fd9 ("f2fs: check if swapfile is section-alligned")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> 
> in testcase: ltp
> version: ltp-x86_64-14c1f76-1_20210318
> with following parameters:
> 
> 	disk: 1HDD
> 	fs: f2fs
> 	test: syscalls-04
> 	ucode: 0xe2
> 
> test-description: The LTP testsuite contains a collection of tools for testing the Linux kernel and related features.
> test-url: http://linux-test-project.github.io/
> 
> 
> on test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz with 32G memory
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> 
> 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> 
> 2021-05-07 06:09:26 ln -sf /usr/bin/genisoimage /usr/bin/mkisofs
> 2021-05-07 06:09:26 ./runltp -f syscalls-04 -d /fs/sda1/tmpdir
> INFO: creating /lkp/benchmarks/ltp/output directory
> INFO: creating /lkp/benchmarks/ltp/results directory
> Checking for required user/group ids
> 
> 'nobody' user id and group found.
> 'bin' user id and group found.
> 'daemon' user id and group found.
> Users group found.
> Sys group found.
> Required users/groups exist.
> If some fields are empty or look unusual you may have an old version.
> Compare to the current minimal requirements in Documentation/Changes.
> 
> /etc/os-release
> PRETTY_NAME="Debian GNU/Linux 10 (buster)"
> NAME="Debian GNU/Linux"
> VERSION_ID="10"
> VERSION="10 (buster)"
> VERSION_CODENAME=buster
> ID=debian
> HOME_URL="https://www.debian.org/"
> SUPPORT_URL="https://www.debian.org/support"
> BUG_REPORT_URL="https://bugs.debian.org/"
> 
> uname:
> Linux lkp-skl-d02 5.12.0-rc2-00408-g36e4d95891ed #1 SMP Sun Apr 18 15:27:41 CST 2021 x86_64 GNU/Linux
> 
> /proc/cmdline
> ip=::::lkp-skl-d02::dhcp root=/dev/ram0 user=lkp job=/lkp/jobs/scheduled/lkp-skl-d02/ltp-1HDD-f2fs-syscalls-04-ucode=0xe2-debian-10.4-x86_64-20200603.cgz-36e4d95891ed37eb98a660babec749be3fb35fd9-20210507-21194-1abea5d-8.yaml ARCH=x86_64 kconfig=x86_64-rhel-8.3 branch=linus/master commit=36e4d95891ed37eb98a660babec749be3fb35fd9 BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-9/36e4d95891ed37eb98a660babec749be3fb35fd9/vmlinuz-5.12.0-rc2-00408-g36e4d95891ed max_uptime=2100 RESULT_ROOT=/result/ltp/1HDD-f2fs-syscalls-04-ucode=0xe2/lkp-skl-d02/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/36e4d95891ed37eb98a660babec749be3fb35fd9/8 LKP_SERVER=internal-lkp-server nokaslr selinux=0 debug apic=debug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=100 net.ifnames=0 printk.devkmsg=on panic=-1 softlockup_panic=1 nmi_watchdog=panic oops=panic load_ramdisk=2 prompt_ramdisk=0 drbd.minor_count=8 systemd.log_level=err ignore_loglevel console=tty0 earlyprintk=ttyS0,115200 console=ttyS0,115200 vga=normal rw
> 
> Gnu C                  gcc (Debian 8.3.0-6) 8.3.0
> Clang
> Gnu make               4.2.1
> util-linux             2.33.1
> mount                  linux 2.33.1 (libmount 2.33.1: selinux, smack, btrfs, namespaces, assert, debug)
> modutils               26
> e2fsprogs              1.44.5
> Linux C Library        > libc.2.28
> Dynamic linker (ldd)   2.28
> Procps                 3.3.15
> Net-tools              2.10-alpha
> iproute2               iproute2-ss190107
> iputils                iputils-s20180629
> ethtool                4.19
> Kbd                    119:
> Sh-utils               8.30
> Modules Loaded         dm_mod f2fs xfs libcrc32c ipmi_devintf ipmi_msghandler sd_mod t10_pi sg intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel i915 kvm intel_gtt drm_kms_helper irqbypass crct10dif_pclmul crc32_pclmul mei_wdt crc32c_intel ghash_clmulni_intel wmi_bmof syscopyarea ahci sysfillrect sysimgblt libahci mei_me fb_sys_fops rapl intel_cstate mei libata drm intel_uncore intel_pch_thermal wmi video intel_pmc_core acpi_pad ip_tables
> 
> free reports:
>                total        used        free      shared  buff/cache   available
> Mem:       32754220      343508    29823812       21796     2586900    29595396
> Swap:             0           0           0
> 
> cpuinfo:
> Architecture:        x86_64
> CPU op-mode(s):      32-bit, 64-bit
> Byte Order:          Little Endian
> Address sizes:       39 bits physical, 48 bits virtual
> CPU(s):              4
> On-line CPU(s) list: 0-3
> Thread(s) per core:  1
> Core(s) per socket:  4
> Socket(s):           1
> NUMA node(s):        1
> Vendor ID:           GenuineIntel
> CPU family:          6
> Model:               94
> Model name:          Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
> Stepping:            3
> CPU MHz:             3200.000
> CPU max MHz:         3600.0000
> CPU min MHz:         800.0000
> BogoMIPS:            6399.96
> Virtualization:      VT-x
> L1d cache:           32K
> L1i cache:           32K
> L2 cache:            256K
> L3 cache:            6144K
> NUMA node0 CPU(s):   0-3
> Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1d
> 
> AppArmor enabled
> 
> SELinux mode: unknown
> no big block device was specified on commandline.
> Tests which require a big block device are disabled.
> You can specify it with option -z
> COMMAND:    /lkp/benchmarks/ltp/bin/ltp-pan   -e -S   -a 2546     -n 2546 -p -f /fs/sda1/tmpdir/ltp-ctEC1rCkVQ/alltests -l /lkp/benchmarks/ltp/results/LTP_RUN_ON-2021_05_07-06h_09m_26s.log  -C /lkp/benchmarks/ltp/output/LTP_RUN_ON-2021_05_07-06h_09m_26s.failed -T /lkp/benchmarks/ltp/output/LTP_RUN_ON-2021_05_07-06h_09m_26s.tconf
> LOG File: /lkp/benchmarks/ltp/results/LTP_RUN_ON-2021_05_07-06h_09m_26s.log
> FAILED COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2021_05_07-06h_09m_26s.failed
> TCONF COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2021_05_07-06h_09m_26s.tconf
> Running tests.......
> <<<test_start>>>
> tag=access01 stime=1620367766
> cmdline="access01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> access01.c:241: TPASS: access(accessfile_rwx, F_OK) as root passed
> access01.c:241: TPASS: access(accessfile_rwx, F_OK) as nobody passed
> access01.c:241: TPASS: access(accessfile_rwx, X_OK) as root passed
> access01.c:241: TPASS: access(accessfile_rwx, X_OK) as nobody passed
> access01.c:241: TPASS: access(accessfile_rwx, W_OK) as root passed
> access01.c:241: TPASS: access(accessfile_rwx, W_OK) as nobody passed
> access01.c:241: TPASS: access(accessfile_rwx, R_OK) as root passed
> access01.c:241: TPASS: access(accessfile_rwx, R_OK) as nobody passed
> access01.c:241: TPASS: access(accessfile_rwx, R_OK|W_OK) as root passed
> access01.c:241: TPASS: access(accessfile_rwx, R_OK|W_OK) as nobody passed
> access01.c:241: TPASS: access(accessfile_rwx, R_OK|X_OK) as root passed
> access01.c:241: TPASS: access(accessfile_rwx, R_OK|X_OK) as nobody passed
> access01.c:241: TPASS: access(accessfile_rwx, W_OK|X_OK) as root passed
> access01.c:241: TPASS: access(accessfile_rwx, W_OK|X_OK) as nobody passed
> access01.c:241: TPASS: access(accessfile_rwx, R_OK|W_OK|X_OK) as root passed
> access01.c:241: TPASS: access(accessfile_rwx, R_OK|W_OK|X_OK) as nobody passed
> access01.c:241: TPASS: access(accessfile_x, X_OK) as root passed
> access01.c:241: TPASS: access(accessfile_x, X_OK) as nobody passed
> access01.c:241: TPASS: access(accessfile_w, W_OK) as root passed
> access01.c:241: TPASS: access(accessfile_w, W_OK) as nobody passed
> access01.c:241: TPASS: access(accessfile_r, R_OK) as root passed
> access01.c:241: TPASS: access(accessfile_r, R_OK) as nobody passed
> access01.c:238: TPASS: access(accessfile_r, X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessfile_r, X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessfile_r, W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessfile_w, R_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessfile_w, X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessfile_w, X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessfile_x, R_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessfile_x, W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessfile_r, W_OK|X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessfile_r, W_OK|X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessfile_r, R_OK|X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessfile_r, R_OK|X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessfile_r, R_OK|W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessfile_r, R_OK|W_OK|X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessfile_r, R_OK|W_OK|X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessfile_w, W_OK|X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessfile_w, W_OK|X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessfile_w, R_OK|X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessfile_w, R_OK|X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessfile_w, R_OK|W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessfile_w, R_OK|W_OK|X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessfile_w, R_OK|W_OK|X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessfile_x, W_OK|X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessfile_x, R_OK|X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessfile_x, R_OK|W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessfile_x, R_OK|W_OK|X_OK) as nobody: EACCES (13)
> access01.c:241: TPASS: access(accessfile_r, W_OK) as root passed
> access01.c:241: TPASS: access(accessfile_r, R_OK|W_OK) as root passed
> access01.c:241: TPASS: access(accessfile_w, R_OK) as root passed
> access01.c:241: TPASS: access(accessfile_w, R_OK|W_OK) as root passed
> access01.c:241: TPASS: access(accessfile_x, R_OK) as root passed
> access01.c:241: TPASS: access(accessfile_x, W_OK) as root passed
> access01.c:241: TPASS: access(accessfile_x, R_OK|W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_r/accessfile_r, F_OK) as root passed
> access01.c:241: TPASS: access(accessdir_r/accessfile_r, R_OK) as root passed
> access01.c:241: TPASS: access(accessdir_r/accessfile_r, W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_r/accessfile_w, F_OK) as root passed
> access01.c:241: TPASS: access(accessdir_r/accessfile_w, R_OK) as root passed
> access01.c:241: TPASS: access(accessdir_r/accessfile_w, W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_r/accessfile_x, F_OK) as root passed
> access01.c:241: TPASS: access(accessdir_r/accessfile_x, R_OK) as root passed
> access01.c:241: TPASS: access(accessdir_r/accessfile_x, W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_r/accessfile_x, X_OK) as root passed
> access01.c:241: TPASS: access(accessdir_w/accessfile_r, F_OK) as root passed
> access01.c:241: TPASS: access(accessdir_w/accessfile_r, R_OK) as root passed
> access01.c:241: TPASS: access(accessdir_w/accessfile_r, W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_w/accessfile_w, F_OK) as root passed
> access01.c:241: TPASS: access(accessdir_w/accessfile_w, R_OK) as root passed
> access01.c:241: TPASS: access(accessdir_w/accessfile_w, W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_w/accessfile_x, F_OK) as root passed
> access01.c:241: TPASS: access(accessdir_w/accessfile_x, R_OK) as root passed
> access01.c:241: TPASS: access(accessdir_w/accessfile_x, W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_w/accessfile_x, X_OK) as root passed
> access01.c:241: TPASS: access(accessdir_x/accessfile_r, F_OK) as root passed
> access01.c:241: TPASS: access(accessdir_x/accessfile_r, F_OK) as nobody passed
> access01.c:241: TPASS: access(accessdir_x/accessfile_r, R_OK) as root passed
> access01.c:241: TPASS: access(accessdir_x/accessfile_r, R_OK) as nobody passed
> access01.c:241: TPASS: access(accessdir_x/accessfile_r, W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_x/accessfile_w, F_OK) as root passed
> access01.c:241: TPASS: access(accessdir_x/accessfile_w, F_OK) as nobody passed
> access01.c:241: TPASS: access(accessdir_x/accessfile_w, R_OK) as root passed
> access01.c:241: TPASS: access(accessdir_x/accessfile_w, W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_x/accessfile_w, W_OK) as nobody passed
> access01.c:241: TPASS: access(accessdir_x/accessfile_x, F_OK) as root passed
> access01.c:241: TPASS: access(accessdir_x/accessfile_x, F_OK) as nobody passed
> access01.c:241: TPASS: access(accessdir_x/accessfile_x, R_OK) as root passed
> access01.c:241: TPASS: access(accessdir_x/accessfile_x, W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_x/accessfile_x, X_OK) as root passed
> access01.c:241: TPASS: access(accessdir_x/accessfile_x, X_OK) as nobody passed
> access01.c:241: TPASS: access(accessdir_rw/accessfile_r, F_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rw/accessfile_r, R_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rw/accessfile_r, W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rw/accessfile_w, F_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rw/accessfile_w, R_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rw/accessfile_w, W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rw/accessfile_x, F_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rw/accessfile_x, R_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rw/accessfile_x, W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rw/accessfile_x, X_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rx/accessfile_r, F_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rx/accessfile_r, F_OK) as nobody passed
> access01.c:241: TPASS: access(accessdir_rx/accessfile_r, R_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rx/accessfile_r, R_OK) as nobody passed
> access01.c:241: TPASS: access(accessdir_rx/accessfile_r, W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rx/accessfile_w, F_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rx/accessfile_w, F_OK) as nobody passed
> access01.c:241: TPASS: access(accessdir_rx/accessfile_w, R_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rx/accessfile_w, W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rx/accessfile_w, W_OK) as nobody passed
> access01.c:241: TPASS: access(accessdir_rx/accessfile_x, F_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rx/accessfile_x, F_OK) as nobody passed
> access01.c:241: TPASS: access(accessdir_rx/accessfile_x, R_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rx/accessfile_x, W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rx/accessfile_x, X_OK) as root passed
> access01.c:241: TPASS: access(accessdir_rx/accessfile_x, X_OK) as nobody passed
> access01.c:241: TPASS: access(accessdir_wx/accessfile_r, F_OK) as root passed
> access01.c:241: TPASS: access(accessdir_wx/accessfile_r, F_OK) as nobody passed
> access01.c:241: TPASS: access(accessdir_wx/accessfile_r, R_OK) as root passed
> access01.c:241: TPASS: access(accessdir_wx/accessfile_r, R_OK) as nobody passed
> access01.c:241: TPASS: access(accessdir_wx/accessfile_r, W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_wx/accessfile_w, F_OK) as root passed
> access01.c:241: TPASS: access(accessdir_wx/accessfile_w, F_OK) as nobody passed
> access01.c:241: TPASS: access(accessdir_wx/accessfile_w, R_OK) as root passed
> access01.c:241: TPASS: access(accessdir_wx/accessfile_w, W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_wx/accessfile_w, W_OK) as nobody passed
> access01.c:241: TPASS: access(accessdir_wx/accessfile_x, F_OK) as root passed
> access01.c:241: TPASS: access(accessdir_wx/accessfile_x, F_OK) as nobody passed
> access01.c:241: TPASS: access(accessdir_wx/accessfile_x, R_OK) as root passed
> access01.c:241: TPASS: access(accessdir_wx/accessfile_x, W_OK) as root passed
> access01.c:241: TPASS: access(accessdir_wx/accessfile_x, X_OK) as root passed
> access01.c:241: TPASS: access(accessdir_wx/accessfile_x, X_OK) as nobody passed
> access01.c:238: TPASS: access(accessdir_r/accessfile_r, F_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_r/accessfile_r, R_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_r/accessfile_r, W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_r/accessfile_r, X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessdir_r/accessfile_r, X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_r/accessfile_w, F_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_r/accessfile_w, R_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_r/accessfile_w, W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_r/accessfile_w, X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessdir_r/accessfile_w, X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_r/accessfile_x, F_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_r/accessfile_x, R_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_r/accessfile_x, W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_r/accessfile_x, X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_w/accessfile_r, F_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_w/accessfile_r, R_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_w/accessfile_r, W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_w/accessfile_r, X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessdir_w/accessfile_r, X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_w/accessfile_w, F_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_w/accessfile_w, R_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_w/accessfile_w, W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_w/accessfile_w, X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessdir_w/accessfile_w, X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_w/accessfile_x, F_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_w/accessfile_x, R_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_w/accessfile_x, W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_w/accessfile_x, X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_x/accessfile_r, W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_x/accessfile_r, X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessdir_x/accessfile_r, X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_x/accessfile_w, R_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_x/accessfile_w, X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessdir_x/accessfile_w, X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_x/accessfile_x, R_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_x/accessfile_x, W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rw/accessfile_r, F_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rw/accessfile_r, R_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rw/accessfile_r, W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rw/accessfile_r, X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rw/accessfile_r, X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rw/accessfile_w, F_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rw/accessfile_w, R_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rw/accessfile_w, W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rw/accessfile_w, X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rw/accessfile_w, X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rw/accessfile_x, F_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rw/accessfile_x, R_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rw/accessfile_x, W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rw/accessfile_x, X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rx/accessfile_r, W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rx/accessfile_r, X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rx/accessfile_r, X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rx/accessfile_w, R_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rx/accessfile_w, X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rx/accessfile_w, X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rx/accessfile_x, R_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_rx/accessfile_x, W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_wx/accessfile_r, W_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_wx/accessfile_r, X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessdir_wx/accessfile_r, X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_wx/accessfile_w, R_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_wx/accessfile_w, X_OK) as root: EACCES (13)
> access01.c:238: TPASS: access(accessdir_wx/accessfile_w, X_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_wx/accessfile_x, R_OK) as nobody: EACCES (13)
> access01.c:238: TPASS: access(accessdir_wx/accessfile_x, W_OK) as nobody: EACCES (13)
> 
> Summary:
> passed   199
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=capset04 stime=1620367766
> cmdline="capset04"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_buffers.c:55: TINFO: Test is using guarded buffers
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> capset04.c:27: TINFO: Test capset() for a different process
> capset04.c:31: TPASS: capset(): EPERM (1)
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=chown03_16 stime=1620367766
> cmdline="chown03_16"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/chown/../utils/compat_tst_16.h:153: TCONF: 16-bit version of chown() is not supported on your platform
> 
> Summary:
> passed   0
> failed   0
> broken   0
> skipped  1
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=32 corefile=no
> cutime=0 cstime=1
> <<<test_end>>>
> <<<test_start>>>
> tag=chroot01 stime=1620367766
> cmdline="chroot01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> chroot01    1  TPASS  :  chroot set errno to EPERM.
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=clock_nanosleep03 stime=1620367766
> cmdline="clock_nanosleep03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_kconfig.c:64: TINFO: Parsing kernel config '/proc/config.gz'
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> clock_nanosleep03.c:53: TINFO: Testing variant: vDSO or syscall with libc spec
> clock_nanosleep03.c:100: TPASS: clock_nanosleep() slept correctly 100210
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> clock_nanosleep03.c:53: TINFO: Testing variant: syscall with old kernel spec
> clock_nanosleep03.c:100: TPASS: clock_nanosleep() slept correctly 100183
> 
> Summary:
> passed   2
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=clock_gettime01 stime=1620367766
> cmdline="clock_gettime01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> clock_gettime01.c:76: TINFO: Testing variant: vDSO or syscall with libc spec
> clock_gettime01.c:104: TPASS: clock_gettime(2): clock CLOCK_REALTIME passed
> clock_gettime01.c:104: TPASS: clock_gettime(2): clock CLOCK_MONOTONIC passed
> clock_gettime01.c:104: TPASS: clock_gettime(2): clock CLOCK_PROCESS_CPUTIME_ID passed
> clock_gettime01.c:104: TPASS: clock_gettime(2): clock CLOCK_THREAD_CPUTIME_ID passed
> clock_gettime01.c:104: TPASS: clock_gettime(2): clock CLOCK_REALTIME_COARSE passed
> clock_gettime01.c:104: TPASS: clock_gettime(2): clock CLOCK_MONOTONIC_COARSE passed
> clock_gettime01.c:104: TPASS: clock_gettime(2): clock CLOCK_MONOTONIC_RAW passed
> clock_gettime01.c:104: TPASS: clock_gettime(2): clock CLOCK_BOOTTIME passed
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> clock_gettime01.c:76: TINFO: Testing variant: syscall with old kernel spec
> clock_gettime01.c:104: TPASS: clock_gettime(2): clock CLOCK_REALTIME passed
> clock_gettime01.c:104: TPASS: clock_gettime(2): clock CLOCK_MONOTONIC passed
> clock_gettime01.c:104: TPASS: clock_gettime(2): clock CLOCK_PROCESS_CPUTIME_ID passed
> clock_gettime01.c:104: TPASS: clock_gettime(2): clock CLOCK_THREAD_CPUTIME_ID passed
> clock_gettime01.c:104: TPASS: clock_gettime(2): clock CLOCK_REALTIME_COARSE passed
> clock_gettime01.c:104: TPASS: clock_gettime(2): clock CLOCK_MONOTONIC_COARSE passed
> clock_gettime01.c:104: TPASS: clock_gettime(2): clock CLOCK_MONOTONIC_RAW passed
> clock_gettime01.c:104: TPASS: clock_gettime(2): clock CLOCK_BOOTTIME passed
> 
> Summary:
> passed   16
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=clock_settime02 stime=1620367766
> cmdline="clock_settime02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> clock_settime02.c:107: TINFO: Testing variant: syscall with old kernel spec
> clock_settime02.c:152: TPASS: clock_settime(CLOCK_REALTIME): failed as expected: EFAULT (14)
> clock_settime02.c:152: TPASS: clock_settime(CLOCK_REALTIME): failed as expected: EINVAL (22)
> clock_settime02.c:152: TPASS: clock_settime(CLOCK_REALTIME): failed as expected: EINVAL (22)
> clock_settime02.c:152: TPASS: clock_settime(CLOCK_REALTIME): failed as expected: EINVAL (22)
> clock_settime02.c:152: TPASS: clock_settime(CLOCK_MONOTONIC): failed as expected: EINVAL (22)
> clock_settime02.c:152: TPASS: clock_settime(INVALID/UNKNOWN CLOCK): failed as expected: EINVAL (22)
> clock_settime02.c:152: TPASS: clock_settime(INVALID/UNKNOWN CLOCK): failed as expected: EINVAL (22)
> clock_settime02.c:152: TPASS: clock_settime(CLOCK_MONOTONIC_COARSE): failed as expected: EINVAL (22)
> clock_settime02.c:152: TPASS: clock_settime(CLOCK_MONOTONIC_RAW): failed as expected: EINVAL (22)
> clock_settime02.c:152: TPASS: clock_settime(CLOCK_BOOTTIME): failed as expected: EINVAL (22)
> clock_settime02.c:152: TPASS: clock_settime(CLOCK_PROCESS_CPUTIME_ID): failed as expected: EINVAL (22)
> clock_settime02.c:152: TPASS: clock_settime(CLOCK_THREAD_CPUTIME_ID): failed as expected: EINVAL (22)
> 
> Summary:
> passed   12
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=clone02 stime=1620367766
> cmdline="clone02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> clone02     1  TPASS  :  Test Passed
> clone02     2  TPASS  :  Test Passed
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=clone04 stime=1620367766
> cmdline="clone04"
> contacts=""
> analysis=exit
> <<<test_output>>>
> clone04     1  TPASS  :  expected failure; Got EINVAL
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=clone08 stime=1620367766
> cmdline="clone08"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> clone08.c:72: TINFO: running CLONE_PARENT
> clone08.c:116: TPASS: clone and forked child has the same parent
> clone08.c:72: TINFO: running CLONE_CHILD_SETTID
> clone08.c:134: TPASS: clone() correctly set ctid
> clone08.c:72: TINFO: running CLONE_PARENT_SETTID
> clone08.c:144: TPASS: clone() correctly set ptid
> clone08.c:72: TINFO: running CLONE_THREAD
> clone08.c:223: TPASS: clone has the same thread id
> clone08.c:213: TPASS: futex exit on ctid change, ctid: 0
> 
> Summary:
> passed   5
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=1
> <<<test_end>>>
> <<<test_start>>>
> tag=close_range01 stime=1620367766
> cmdline="close_range01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
> tst_supported_fs_types.c:89: TINFO: Kernel supports ext2
> tst_supported_fs_types.c:51: TINFO: mkfs.ext2 does exist
> tst_supported_fs_types.c:89: TINFO: Kernel supports ext3
> tst_supported_fs_types.c:51: TINFO: mkfs.ext3 does exist
> tst_supported_fs_types.c:89: TINFO: Kernel supports ext4
> tst_supported_fs_types.c:51: TINFO: mkfs.ext4 does exist
> tst_supported_fs_types.c:89: TINFO: Kernel supports xfs
> tst_supported_fs_types.c:51: TINFO: mkfs.xfs does exist
> tst_supported_fs_types.c:89: TINFO: Kernel supports btrfs
> tst_supported_fs_types.c:51: TINFO: mkfs.btrfs does exist
> tst_supported_fs_types.c:89: TINFO: Kernel supports vfat
> tst_supported_fs_types.c:51: TINFO: mkfs.vfat does exist
> tst_supported_fs_types.c:115: TINFO: Filesystem exfat is not supported
> tst_supported_fs_types.c:119: TINFO: FUSE does support ntfs
> tst_supported_fs_types.c:51: TINFO: mkfs.ntfs does exist
> tst_supported_fs_types.c:89: TINFO: Kernel supports tmpfs
> tst_supported_fs_types.c:38: TINFO: mkfs is not needed for tmpfs
> tst_test.c:1379: TINFO: Testing on ext2
> tst_test.c:889: TINFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
> mke2fs 1.44.5 (15-Dec-2018)
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> tst_capability.c:29: TINFO: Dropping CAP_SYS_ADMIN(21)
> close_range01.c:134: TINFO: Plain close range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:138: TINFO: Set UNSHARE and close range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:142: TINFO: Set CLOEXEC on range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:146: TINFO: Set UNSHARE and CLOEXEC on range
> close_range01.c:188: TPASS: No kernel taints
> tst_test.c:1379: TINFO: Testing on ext3
> tst_test.c:889: TINFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
> mke2fs 1.44.5 (15-Dec-2018)
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> tst_capability.c:29: TINFO: Dropping CAP_SYS_ADMIN(21)
> close_range01.c:134: TINFO: Plain close range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:138: TINFO: Set UNSHARE and close range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:142: TINFO: Set CLOEXEC on range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:146: TINFO: Set UNSHARE and CLOEXEC on range
> close_range01.c:188: TPASS: No kernel taints
> tst_test.c:1379: TINFO: Testing on ext4
> tst_test.c:889: TINFO: Formatting /dev/loop0 with ext4 opts='' extra opts=''
> mke2fs 1.44.5 (15-Dec-2018)
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> tst_capability.c:29: TINFO: Dropping CAP_SYS_ADMIN(21)
> close_range01.c:134: TINFO: Plain close range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:138: TINFO: Set UNSHARE and close range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:142: TINFO: Set CLOEXEC on range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:146: TINFO: Set UNSHARE and CLOEXEC on range
> close_range01.c:188: TPASS: No kernel taints
> tst_test.c:1379: TINFO: Testing on xfs
> tst_test.c:889: TINFO: Formatting /dev/loop0 with xfs opts='' extra opts=''
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> tst_capability.c:29: TINFO: Dropping CAP_SYS_ADMIN(21)
> close_range01.c:134: TINFO: Plain close range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:138: TINFO: Set UNSHARE and close range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:142: TINFO: Set CLOEXEC on range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:146: TINFO: Set UNSHARE and CLOEXEC on range
> close_range01.c:188: TPASS: No kernel taints
> tst_test.c:1379: TINFO: Testing on btrfs
> tst_test.c:889: TINFO: Formatting /dev/loop0 with btrfs opts='' extra opts=''
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> tst_capability.c:29: TINFO: Dropping CAP_SYS_ADMIN(21)
> close_range01.c:134: TINFO: Plain close range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:138: TINFO: Set UNSHARE and close range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:142: TINFO: Set CLOEXEC on range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:146: TINFO: Set UNSHARE and CLOEXEC on range
> close_range01.c:188: TPASS: No kernel taints
> tst_test.c:1379: TINFO: Testing on vfat
> tst_test.c:889: TINFO: Formatting /dev/loop0 with vfat opts='' extra opts=''
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> tst_capability.c:29: TINFO: Dropping CAP_SYS_ADMIN(21)
> close_range01.c:134: TINFO: Plain close range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:138: TINFO: Set UNSHARE and close range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:142: TINFO: Set CLOEXEC on range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:146: TINFO: Set UNSHARE and CLOEXEC on range
> close_range01.c:188: TPASS: No kernel taints
> tst_test.c:1379: TINFO: Testing on ntfs
> tst_test.c:889: TINFO: Formatting /dev/loop0 with ntfs opts='' extra opts=''
> The partition start sector was not specified for /dev/loop0 and it could not be obtained automatically.  It has been set to 0.
> The number of sectors per track was not specified for /dev/loop0 and it could not be obtained automatically.  It has been set to 0.
> The number of heads was not specified for /dev/loop0 and it could not be obtained automatically.  It has been set to 0.
> To boot from a device, Windows needs the 'partition start sector', the 'sectors per track' and the 'number of heads' to be set.
> Windows will not be able to boot from this device.
> tst_test.c:900: TINFO: Trying FUSE...
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> tst_capability.c:29: TINFO: Dropping CAP_SYS_ADMIN(21)
> close_range01.c:134: TINFO: Plain close range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:138: TINFO: Set UNSHARE and close range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:142: TINFO: Set CLOEXEC on range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:146: TINFO: Set UNSHARE and CLOEXEC on range
> close_range01.c:188: TPASS: No kernel taints
> tst_test.c:1379: TINFO: Testing on tmpfs
> tst_test.c:889: TINFO: Skipping mkfs for TMPFS filesystem
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> tst_capability.c:29: TINFO: Dropping CAP_SYS_ADMIN(21)
> close_range01.c:134: TINFO: Plain close range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:138: TINFO: Set UNSHARE and close range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:142: TINFO: Set CLOEXEC on range
> close_range01.c:188: TPASS: No kernel taints
> close_range01.c:146: TINFO: Set UNSHARE and CLOEXEC on range
> close_range01.c:188: TPASS: No kernel taints
> 
> Summary:
> passed   32
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=5 termination_type=exited termination_id=0 corefile=no
> cutime=8 cstime=93
> <<<test_end>>>
> <<<test_start>>>
> tag=connect02 stime=1620367771
> cmdline="connect02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> connect02.c:125: TPASS: Nothing bad happened, probably
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=3
> <<<test_end>>>
> <<<test_start>>>
> tag=delete_module01 stime=1620367771
> cmdline="delete_module01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> tst_module.c:70: TCONF: Failed to find module 'dummy_del_mod.ko'
> 
> Summary:
> passed   0
> failed   0
> broken   0
> skipped  1
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=32 corefile=no
> cutime=0 cstime=1
> <<<test_end>>>
> <<<test_start>>>
> tag=dup01 stime=1620367771
> cmdline="dup01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> dup01.c:23: TPASS: dup(4) returned 5
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=dup07 stime=1620367771
> cmdline="dup07"
> contacts=""
> analysis=exit
> <<<test_output>>>
> dup07       1  TPASS  :  Passed in read mode.
> dup07       2  TPASS  :  Passed in write mode.
> dup07       3  TPASS  :  Passed in read/write mode.
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=dup3_01 stime=1620367771
> cmdline="dup3_01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> dup3_01     1  TPASS  :  dup3(O_CLOEXEC) PASSED
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=execl01 stime=1620367771
> cmdline="execl01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> execl01_child.c:20: TPASS: execl01_child executed
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=execvp01 stime=1620367771
> cmdline="execvp01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> execvp01_child.c:20: TPASS: execvp01_child executed
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=fchown04_16 stime=1620367771
> cmdline="fchown04_16"
> contacts=""
> analysis=exit
> <<<test_output>>>
> mke2fs 1.44.5 (15-Dec-2018)
> fchown04_16    0  TINFO  :  Found free device 0 '/dev/loop0'
> fchown04_16    0  TINFO  :  Formatting /dev/loop0 with ext2 opts='' extra opts=''
> fchown04_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/fchown/../utils/compat_16.h:156: 16-bit version of fchown() is not supported on your platform
> fchown04_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/fchown/../utils/compat_16.h:156: Remaining cases not appropriate for configuration
> <<<execution_status>>>
> initiation_status="ok"
> duration=1 termination_type=exited termination_id=32 corefile=no
> cutime=0 cstime=3
> <<<test_end>>>
> <<<test_start>>>
> tag=fchownat02 stime=1620367772
> cmdline="fchownat02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> fchownat02    1  TPASS  :  fchownat() test AT_SYMLINK_NOFOLLOW success
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=fcntl08_64 stime=1620367772
> cmdline="fcntl08_64"
> contacts=""
> analysis=exit
> <<<test_output>>>
> fcntl08     1  TPASS  :  fcntl returned 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=fcntl14_64 stime=1620367772
> cmdline="fcntl14_64"
> contacts=""
> analysis=exit
> <<<test_output>>>
> fcntl14     0  TINFO  :  Enter block 1: without mandatory locking
> fcntl14     1  TPASS  :  testcase:1 PASSED
> fcntl14     2  TPASS  :  testcase:2 PASSED
> fcntl14     3  TPASS  :  testcase:3 PASSED
> fcntl14     4  TPASS  :  testcase:4 PASSED
> fcntl14     5  TPASS  :  testcase:5 PASSED
> fcntl14     6  TPASS  :  testcase:6 PASSED
> fcntl14     7  TPASS  :  testcase:7 PASSED
> fcntl14     8  TPASS  :  testcase:8 PASSED
> fcntl14     9  TPASS  :  testcase:9 PASSED
> fcntl14    10  TPASS  :  testcase:10 PASSED
> fcntl14    11  TPASS  :  testcase:11 PASSED
> fcntl14    12  TPASS  :  testcase:12 PASSED
> fcntl14    13  TPASS  :  testcase:13 PASSED
> fcntl14    14  TPASS  :  testcase:14 PASSED
> fcntl14    15  TPASS  :  testcase:15 PASSED
> fcntl14    16  TPASS  :  testcase:16 PASSED
> fcntl14    17  TPASS  :  testcase:17 PASSED
> fcntl14    18  TPASS  :  testcase:18 PASSED
> fcntl14    19  TPASS  :  testcase:19 PASSED
> fcntl14    20  TPASS  :  testcase:20 PASSED
> fcntl14    21  TPASS  :  testcase:21 PASSED
> fcntl14    22  TPASS  :  testcase:22 PASSED
> fcntl14    23  TPASS  :  testcase:23 PASSED
> fcntl14    24  TPASS  :  testcase:24 PASSED
> fcntl14    25  TPASS  :  testcase:25 PASSED
> fcntl14    26  TPASS  :  testcase:26 PASSED
> fcntl14    27  TPASS  :  testcase:27 PASSED
> fcntl14    28  TPASS  :  testcase:28 PASSED
> fcntl14    29  TPASS  :  testcase:29 PASSED
> fcntl14    30  TPASS  :  testcase:30 PASSED
> fcntl14    31  TPASS  :  testcase:31 PASSED
> fcntl14    32  TPASS  :  testcase:32 PASSED
> fcntl14    33  TPASS  :  testcase:33 PASSED
> fcntl14    34  TPASS  :  testcase:34 PASSED
> fcntl14    35  TPASS  :  testcase:35 PASSED
> fcntl14    36  TPASS  :  testcase:36 PASSED
> fcntl14    37  TPASS  :  Block 1, test 1 PASSED
> fcntl14    38  TPASS  :  testcase:37 PASSED
> fcntl14    39  TPASS  :  testcase:38 PASSED
> fcntl14    40  TPASS  :  testcase:39 PASSED
> fcntl14    41  TPASS  :  testcase:40 PASSED
> fcntl14    42  TPASS  :  testcase:41 PASSED
> fcntl14    43  TPASS  :  testcase:42 PASSED
> fcntl14    44  TPASS  :  testcase:43 PASSED
> fcntl14    45  TPASS  :  testcase:44 PASSED
> fcntl14    46  TPASS  :  testcase:45 PASSED
> fcntl14    47  TPASS  :  Block 1, test 2 PASSED
> fcntl14     0  TINFO  :  Exit block 1
> fcntl14     0  TINFO  :  Enter block 2: with mandatory locking
> fcntl14    48  TPASS  :  testcase:1 PASSED
> fcntl14    49  TPASS  :  testcase:2 PASSED
> fcntl14    50  TPASS  :  testcase:3 PASSED
> fcntl14    51  TPASS  :  testcase:4 PASSED
> fcntl14    52  TPASS  :  testcase:5 PASSED
> fcntl14    53  TPASS  :  testcase:6 PASSED
> fcntl14    54  TPASS  :  testcase:7 PASSED
> fcntl14    55  TPASS  :  testcase:8 PASSED
> fcntl14    56  TPASS  :  testcase:9 PASSED
> fcntl14    57  TPASS  :  testcase:10 PASSED
> fcntl14    58  TPASS  :  testcase:11 PASSED
> fcntl14    59  TPASS  :  testcase:12 PASSED
> fcntl14    60  TPASS  :  testcase:13 PASSED
> fcntl14    61  TPASS  :  testcase:14 PASSED
> fcntl14    62  TPASS  :  testcase:15 PASSED
> fcntl14    63  TPASS  :  testcase:16 PASSED
> fcntl14    64  TPASS  :  testcase:17 PASSED
> fcntl14    65  TPASS  :  testcase:18 PASSED
> fcntl14    66  TPASS  :  testcase:19 PASSED
> fcntl14    67  TPASS  :  testcase:20 PASSED
> fcntl14    68  TPASS  :  testcase:21 PASSED
> fcntl14    69  TPASS  :  testcase:22 PASSED
> fcntl14    70  TPASS  :  testcase:23 PASSED
> fcntl14    71  TPASS  :  testcase:24 PASSED
> fcntl14    72  TPASS  :  testcase:25 PASSED
> fcntl14    73  TPASS  :  testcase:26 PASSED
> fcntl14    74  TPASS  :  testcase:27 PASSED
> fcntl14    75  TPASS  :  testcase:28 PASSED
> fcntl14    76  TPASS  :  testcase:29 PASSED
> fcntl14    77  TPASS  :  testcase:30 PASSED
> fcntl14    78  TPASS  :  testcase:31 PASSED
> fcntl14    79  TPASS  :  testcase:32 PASSED
> fcntl14    80  TPASS  :  testcase:33 PASSED
> fcntl14    81  TPASS  :  testcase:34 PASSED
> fcntl14    82  TPASS  :  testcase:35 PASSED
> fcntl14    83  TPASS  :  testcase:36 PASSED
> fcntl14    84  TPASS  :  Block 2, test 1 PASSED
> fcntl14    85  TPASS  :  testcase:37 PASSED
> fcntl14    86  TPASS  :  testcase:38 PASSED
> fcntl14    87  TPASS  :  testcase:39 PASSED
> fcntl14    88  TPASS  :  testcase:40 PASSED
> fcntl14    89  TPASS  :  testcase:41 PASSED
> fcntl14    90  TPASS  :  testcase:42 PASSED
> fcntl14    91  TPASS  :  testcase:43 PASSED
> fcntl14    92  TPASS  :  testcase:44 PASSED
> fcntl14    93  TPASS  :  testcase:45 PASSED
> fcntl14    94  TPASS  :  Block 2, test 2 PASSED
> fcntl14     0  TINFO  :  Exit block 2
> fcntl14     0  TINFO  :  Enter block 3
> fcntl14    95  TPASS  :  Test with negative whence locking PASSED
> fcntl14     0  TINFO  :  Exit block 3
> fcntl14     0  TINFO  :  Enter block 4
> fcntl14    96  TPASS  :  Test of locks on file PASSED
> fcntl14     0  TINFO  :  Exit block 4
> <<<execution_status>>>
> initiation_status="ok"
> duration=5 termination_type=exited termination_id=0 corefile=no
> cutime=2 cstime=2
> <<<test_end>>>
> <<<test_start>>>
> tag=fcntl23_64 stime=1620367777
> cmdline="fcntl23_64"
> contacts=""
> analysis=exit
> <<<test_output>>>
> fcntl23     1  TPASS  :  fcntl(tfile_3130, F_SETLEASE, F_RDLCK)
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=fcntl37_64 stime=1620367777
> cmdline="fcntl37_64"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> tst_capability.c:29: TINFO: Dropping CAP_SYS_RESOURCE(24)
> fcntl37.c:42: TINFO: F_SETPIPE_SZ and size is beyond 1<<31
> fcntl37.c:50: TPASS: F_SETPIPE_SZ failed as expected: EINVAL (22)
> fcntl37.c:42: TINFO: F_SETPIPE_SZ and size < data stored in pipe
> fcntl37.c:50: TPASS: F_SETPIPE_SZ failed as expected: EBUSY (16)
> fcntl37.c:42: TINFO: F_SETPIPE_SZ and size is over limit for unpriviledged user
> fcntl37.c:50: TPASS: F_SETPIPE_SZ failed as expected: EPERM (1)
> 
> Summary:
> passed   3
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=fdatasync01 stime=1620367777
> cmdline="fdatasync01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> fdatasync01    1  TPASS  :  fdatasync() successful
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=fdatasync02 stime=1620367777
> cmdline="fdatasync02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> fdatasync02    1  TPASS  :  Expected failure for invalid file descriptor, errno: 9
> fdatasync02    2  TPASS  :  Expected failure for file descriptor to a special file, errno: 22
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=flock02 stime=1620367777
> cmdline="flock02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> flock02.c:46: TPASS: flock() failed expectedly: EBADF (9)
> flock02.c:46: TPASS: flock() failed expectedly: EINVAL (22)
> flock02.c:46: TPASS: flock() failed expectedly: EINVAL (22)
> 
> Summary:
> passed   3
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=flock04 stime=1620367777
> cmdline="flock04"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> flock04.c:61: TPASS: Parent had shared lock
> flock04.c:36: TPASS:  Child acquiring shared lock got 0
> flock04.c:39: TPASS:  Child acquiring exclusive lock got -1
> flock04.c:61: TPASS: Parent had exclusive lock
> flock04.c:39: TPASS:  Child acquiring shared lock got -1
> flock04.c:39: TPASS:  Child acquiring exclusive lock got -1
> 
> Summary:
> passed   6
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=fmtmsg01 stime=1620367777
> cmdline="fmtmsg01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> fmtms01     1  TPASS  :  Test passed
> fmtms01     2  TPASS  :  Test passed
> fmtms01     3  TPASS  :  Test passed
> fmtms01     4  TPASS  :  Test passed
> fmtms01     5  TPASS  :  Test passed
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=fork01 stime=1620367777
> cmdline="fork01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> fork01      1  TPASS  :  fork() returned 3148
> fork01      2  TPASS  :  child pid and fork() return agree: 3148
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=fork13 stime=1620367777
> cmdline="fork13 -i 1000000"
> contacts=""
> analysis=exit
> <<<test_output>>>
> fork13      1  TPASS  :  1000000 pids forked, all passed
> <<<execution_status>>>
> initiation_status="ok"
> duration=101 termination_type=exited termination_id=0 corefile=no
> cutime=6642 cstime=3759
> <<<test_end>>>
> <<<test_start>>>
> tag=fsopen02 stime=1620367878
> cmdline="fsopen02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> fsopen02.c:49: TPASS: invalid-fs: fsopen() failed as expected: ENODEV (19)
> fsopen02.c:49: TPASS: invalid-flags: fsopen() failed as expected: EINVAL (22)
> 
> Summary:
> passed   2
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=fstatat01 stime=1620367878
> cmdline="fstatat01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> fstatat01    1  TPASS  :  fstatat failed as expected: TEST_ERRNO=SUCCESS(0): Success
> fstatat01    2  TPASS  :  fstatat failed as expected: TEST_ERRNO=SUCCESS(0): Success
> fstatat01    3  TPASS  :  fstatat failed as expected: TEST_ERRNO=ENOTDIR(20): Not a directory
> fstatat01    4  TPASS  :  fstatat failed as expected: TEST_ERRNO=EBADF(9): Bad file descriptor
> fstatat01    5  TPASS  :  fstatat failed as expected: TEST_ERRNO=EINVAL(22): Invalid argument
> fstatat01    6  TPASS  :  fstatat failed as expected: TEST_ERRNO=SUCCESS(0): Success
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=fsync02 stime=1620367878
> cmdline="fsync02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> fsync02.c:99: TPASS: fsync succeeded in an acceptable amount of time
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=2
> <<<test_end>>>
> <<<test_start>>>
> tag=fsync04 stime=1620367878
> cmdline="fsync04"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
> tst_supported_fs_types.c:89: TINFO: Kernel supports ext2
> tst_supported_fs_types.c:51: TINFO: mkfs.ext2 does exist
> tst_supported_fs_types.c:89: TINFO: Kernel supports ext3
> tst_supported_fs_types.c:51: TINFO: mkfs.ext3 does exist
> tst_supported_fs_types.c:89: TINFO: Kernel supports ext4
> tst_supported_fs_types.c:51: TINFO: mkfs.ext4 does exist
> tst_supported_fs_types.c:89: TINFO: Kernel supports xfs
> tst_supported_fs_types.c:51: TINFO: mkfs.xfs does exist
> tst_supported_fs_types.c:89: TINFO: Kernel supports btrfs
> tst_supported_fs_types.c:51: TINFO: mkfs.btrfs does exist
> tst_supported_fs_types.c:89: TINFO: Kernel supports vfat
> tst_supported_fs_types.c:51: TINFO: mkfs.vfat does exist
> tst_supported_fs_types.c:115: TINFO: Filesystem exfat is not supported
> tst_supported_fs_types.c:119: TINFO: FUSE does support ntfs
> tst_supported_fs_types.c:51: TINFO: mkfs.ntfs does exist
> tst_supported_fs_types.c:148: TINFO: Skipping tmpfs as requested by the test
> tst_test.c:1379: TINFO: Testing on ext2
> tst_test.c:889: TINFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
> mke2fs 1.44.5 (15-Dec-2018)
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> fsync04.c:50: TPASS: Test file synced to device
> tst_test.c:1379: TINFO: Testing on ext3
> tst_test.c:889: TINFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
> mke2fs 1.44.5 (15-Dec-2018)
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> fsync04.c:50: TPASS: Test file synced to device
> tst_test.c:1379: TINFO: Testing on ext4
> tst_test.c:889: TINFO: Formatting /dev/loop0 with ext4 opts='' extra opts=''
> mke2fs 1.44.5 (15-Dec-2018)
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> fsync04.c:50: TPASS: Test file synced to device
> tst_test.c:1379: TINFO: Testing on xfs
> tst_test.c:889: TINFO: Formatting /dev/loop0 with xfs opts='' extra opts=''
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> fsync04.c:50: TPASS: Test file synced to device
> tst_test.c:1379: TINFO: Testing on btrfs
> tst_test.c:889: TINFO: Formatting /dev/loop0 with btrfs opts='' extra opts=''
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> fsync04.c:50: TPASS: Test file synced to device
> tst_test.c:1379: TINFO: Testing on vfat
> tst_test.c:889: TINFO: Formatting /dev/loop0 with vfat opts='' extra opts=''
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> fsync04.c:50: TPASS: Test file synced to device
> tst_test.c:1379: TINFO: Testing on ntfs
> tst_test.c:889: TINFO: Formatting /dev/loop0 with ntfs opts='' extra opts=''
> The partition start sector was not specified for /dev/loop0 and it could not be obtained automatically.  It has been set to 0.
> The number of sectors per track was not specified for /dev/loop0 and it could not be obtained automatically.  It has been set to 0.
> The number of heads was not specified for /dev/loop0 and it could not be obtained automatically.  It has been set to 0.
> To boot from a device, Windows needs the 'partition start sector', the 'sectors per track' and the 'number of heads' to be set.
> Windows will not be able to boot from this device.
> tst_test.c:900: TINFO: Trying FUSE...
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> fsync04.c:50: TPASS: Test file synced to device
> 
> Summary:
> passed   7
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=7 termination_type=exited termination_id=0 corefile=no
> cutime=7 cstime=114
> <<<test_end>>>
> <<<test_start>>>
> tag=getdomainname01 stime=1620367885
> cmdline="getdomainname01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> getdomainname01    1  TPASS  :  getdomainname() returned 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=geteuid01_16 stime=1620367885
> cmdline="geteuid01_16"
> contacts=""
> analysis=exit
> <<<test_output>>>
> geteuid01_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/geteuid/../utils/compat_16.h:107: 16-bit version of geteuid() is not supported on your platform
> geteuid01_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/geteuid/../utils/compat_16.h:107: Remaining cases not appropriate for configuration
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=32 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=getitimer01 stime=1620367885
> cmdline="getitimer01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> getitimer01    1  TPASS  :  functionality is ok
> getitimer01    2  TPASS  :  functionality is ok
> getitimer01    3  TPASS  :  functionality is ok
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=getitimer02 stime=1620367885
> cmdline="getitimer02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> getitimer02    1  TPASS  :  expected failure - errno = 14 - Bad address
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=getresgid03_16 stime=1620367885
> cmdline="getresgid03_16"
> contacts=""
> analysis=exit
> <<<test_output>>>
> getresgid03    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/getresgid/../utils/compat_16.h:151: 16-bit version of getresgid() is not supported on your platform
> getresgid03    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/getresgid/../utils/compat_16.h:151: Remaining cases not appropriate for configuration
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=32 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=getresuid03_16 stime=1620367885
> cmdline="getresuid03_16"
> contacts=""
> analysis=exit
> <<<test_output>>>
> getresuid03    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/getresuid/../utils/compat_16.h:141: 16-bit version of getresuid() is not supported on your platform
> getresuid03    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/getresuid/../utils/compat_16.h:141: Remaining cases not appropriate for configuration
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=32 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=get_mempolicy02 stime=1620367885
> cmdline="get_mempolicy02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> tst_numa.c:191: TINFO: Found 1 NUMA memory nodes
> get_mempolicy02.c:79: TPASS: policy: MPOL_DEFAULT, invalid address: EFAULT (14)
> get_mempolicy02.c:79: TPASS: policy: MPOL_DEFAULT, invalid flags, no target: EINVAL (22)
> 
> Summary:
> passed   2
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=getsid01 stime=1620367885
> cmdline="getsid01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> getsid01    1  TPASS  :  session ID is correct
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=getsockopt02 stime=1620367885
> cmdline="getsockopt02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> getsockopt02.c:66: TPASS: Test passed
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=getxattr03 stime=1620367885
> cmdline="getxattr03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> getxattr03    1  TPASS  :  getxattr(2) returned correct value
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=ioctl_loop07 stime=1620367885
> cmdline="ioctl_loop07"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
> ioctl_loop07.c:125: TINFO: original loop size 2048 sectors
> ioctl_loop07.c:83: TINFO: When sizelimit is greater than loopsize by using LOOP_SET_STATUS64
> ioctl_loop07.c:62: TPASS: /sys/block/loop0/size = 2048
> ioctl_loop07.c:63: TPASS: /sys/block/loop0/loop/sizelimit = 4194304
> ioctl_loop07.c:66: TPASS: LOOP_GET_STATUS64 gets correct lo_sizelimit(4194304)
> ioctl_loop07.c:83: TINFO: When sizelimit is less than loopsize by using LOOP_SET_STATUS64
> ioctl_loop07.c:62: TPASS: /sys/block/loop0/size = 1024
> ioctl_loop07.c:63: TPASS: /sys/block/loop0/loop/sizelimit = 524288
> ioctl_loop07.c:66: TPASS: LOOP_GET_STATUS64 gets correct lo_sizelimit(524288)
> ioctl_loop07.c:83: TINFO: When sizelimit is greater than loopsize by using LOOP_CONFIGURE
> ioctl_loop07.c:62: TPASS: /sys/block/loop0/size = 2048
> ioctl_loop07.c:63: TPASS: /sys/block/loop0/loop/sizelimit = 4194304
> ioctl_loop07.c:66: TPASS: LOOP_GET_STATUS64 gets correct lo_sizelimit(4194304)
> ioctl_loop07.c:83: TINFO: When sizelimit is less than loopsize by using LOOP_CONFIGURE
> ioctl_loop07.c:62: TPASS: /sys/block/loop0/size = 1024
> ioctl_loop07.c:63: TPASS: /sys/block/loop0/loop/sizelimit = 524288
> ioctl_loop07.c:66: TPASS: LOOP_GET_STATUS64 gets correct lo_sizelimit(524288)
> 
> Summary:
> passed   12
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=1 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=10
> <<<test_end>>>
> <<<test_start>>>
> tag=ioctl_ns03 stime=1620367886
> cmdline="ioctl_ns03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> ioctl_ns03.c:42: TPASS: NS_GET_OWNER_UID fails, UTS namespace
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=fanotify09 stime=1620367886
> cmdline="fanotify09"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
> tst_test.c:889: TINFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
> mke2fs 1.44.5 (15-Dec-2018)
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> fanotify09.c:246: TINFO: Test #0: Events on non-dir child with both parent and mount marks
> fanotify09.c:191: TPASS: group 0 got event: mask 2 pid=992 fd=7 filename=/fs/sda1/tmpdir/ltp-ctEC1rCkVQ/kMCgwq/mntpoint/tfile_992
> fanotify09.c:335: TPASS: group 1 got no event
> fanotify09.c:335: TPASS: group 2 got no event
> fanotify09.c:246: TINFO: Test #1: Events on non-dir child and subdir with both parent and mount marks
> fanotify09.c:191: TPASS: group 0 got event: mask 2 pid=992 fd=7 filename=/fs/sda1/tmpdir/ltp-ctEC1rCkVQ/kMCgwq/mntpoint/tfile_992
> fanotify09.c:191: TPASS: group 0 got event: mask 10 pid=992 fd=8 filename=/fs/sda1/tmpdir/ltp-ctEC1rCkVQ/kMCgwq/mntpoint/testdir
> fanotify09.c:335: TPASS: group 1 got no event
> fanotify09.c:335: TPASS: group 2 got no event
> fanotify09.c:246: TINFO: Test #2: Events on non-dir child and parent with both parent and mount marks
> fanotify09.c:191: TPASS: group 0 got event: mask 2 pid=992 fd=7 filename=/fs/sda1/tmpdir/ltp-ctEC1rCkVQ/kMCgwq/mntpoint/tfile_992
> fanotify09.c:191: TPASS: group 0 got event: mask 10 pid=992 fd=8 filename=/fs/sda1/tmpdir/ltp-ctEC1rCkVQ/kMCgwq/mntpoint
> fanotify09.c:335: TPASS: group 1 got no event
> fanotify09.c:335: TPASS: group 2 got no event
> fanotify09.c:246: TINFO: Test #3: Events on non-dir child and subdir with both parent and subdir marks
> fanotify09.c:191: TPASS: group 0 got event: mask 2 pid=992 fd=7 filename=/fs/sda1/tmpdir/ltp-ctEC1rCkVQ/kMCgwq/mntpoint/tfile_992
> fanotify09.c:191: TPASS: group 0 got event: mask 10 pid=992 fd=8 filename=/fs/sda1/tmpdir/ltp-ctEC1rCkVQ/kMCgwq/mntpoint/testdir
> fanotify09.c:335: TPASS: group 1 got no event
> fanotify09.c:335: TPASS: group 2 got no event
> fanotify09.c:246: TINFO: Test #4: Events on non-dir children with both parent and mount marks
> fanotify09.c:191: TPASS: group 0 got event: mask 2 pid=992 fd=7 filename=/fs/sda1/tmpdir/ltp-ctEC1rCkVQ/kMCgwq/mntpoint/tfile_992
> fanotify09.c:191: TPASS: group 0 got event: mask 10 pid=992 fd=8 filename=/fs/sda1/tmpdir/ltp-ctEC1rCkVQ/kMCgwq/mntpoint/testfile
> fanotify09.c:191: TPASS: group 1 got event: mask 10 pid=992 fd=7 filename=/fs/sda1/tmpdir/ltp-ctEC1rCkVQ/kMCgwq/mntpoint/testfile
> fanotify09.c:191: TPASS: group 2 got event: mask 10 pid=992 fd=7 filename=/fs/sda1/tmpdir/ltp-ctEC1rCkVQ/kMCgwq/mntpoint/testfile
> fanotify09.c:246: TINFO: Test #5: Events on non-dir child with both parent and mount marks and filename info
> fanotify09.c:191: TPASS: group 0 got event: mask 2 pid=992 fd=-1 filename=tfile_992
> fanotify09.c:191: TPASS: group 0 got event: mask 10 pid=992 fd=-1 filename=testfile
> fanotify09.c:191: TPASS: group 1 got event: mask 10 pid=992 fd=7 filename=/fs/sda1/tmpdir/ltp-ctEC1rCkVQ/kMCgwq/mntpoint/testfile
> fanotify09.c:191: TPASS: group 2 got event: mask 10 pid=992 fd=7 filename=/fs/sda1/tmpdir/ltp-ctEC1rCkVQ/kMCgwq/mntpoint/testfile
> 
> Summary:
> passed   23
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=1 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=3
> <<<test_end>>>
> <<<test_start>>>
> tag=fanotify17 stime=1620367887
> cmdline="fanotify17"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
> tst_test.c:889: TINFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
> mke2fs 1.44.5 (15-Dec-2018)
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> fanotify17.c:243: TINFO: max_fanotify_groups=129 max_fanotify_marks=8192
> fanotify17.c:176: TINFO: Test #0: Global groups limit in init user ns
> fanotify17.c:133: TPASS: Created 129 groups - below groups limit (129)
> fanotify17.c:176: TINFO: Test #1: Global groups limit in privileged user ns
> fanotify17.c:179: TCONF: fanotify inside user namespace is not supported
> fanotify17.c:176: TINFO: Test #2: Local groups limit in unprivileged user ns
> fanotify17.c:179: TCONF: fanotify inside user namespace is not supported
> fanotify17.c:176: TINFO: Test #3: Local marks limit in unprivileged user ns
> fanotify17.c:179: TCONF: fanotify inside user namespace is not supported
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  3
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=4
> <<<test_end>>>
> <<<test_start>>>
> tag=keyctl06 stime=1620367887
> cmdline="keyctl06"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> keyctl06.c:60: TPASS: KEYCTL_READ returned full count but didn't overrun the buffer
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=1
> <<<test_end>>>
> <<<test_start>>>
> tag=kcmp01 stime=1620367887
> cmdline="kcmp01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> kcmp01.c:86: TPASS: kcmp() returned the expected value
> kcmp01.c:86: TPASS: kcmp() returned the expected value
> kcmp01.c:86: TPASS: kcmp() returned the expected value
> kcmp01.c:86: TPASS: kcmp() returned the expected value
> kcmp01.c:86: TPASS: kcmp() returned the expected value
> 
> Summary:
> passed   5
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=kill08 stime=1620367887
> cmdline="kill08"
> contacts=""
> analysis=exit
> <<<test_output>>>
> kill08      1  TPASS  :  received expected signal 9
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=kill09 stime=1620367887
> cmdline="kill09"
> contacts=""
> analysis=exit
> <<<test_output>>>
> kill09      1  TPASS  :  kill(1025, SIGKILL) returned 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=lchown01_16 stime=1620367887
> cmdline="lchown01_16"
> contacts=""
> analysis=exit
> <<<test_output>>>
> lchown01_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/lchown/../utils/compat_16.h:161: 16-bit version of lchown() is not supported on your platform
> lchown01_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/lchown/../utils/compat_16.h:161: Remaining cases not appropriate for configuration
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=32 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=lchown02_16 stime=1620367887
> cmdline="lchown02_16"
> contacts=""
> analysis=exit
> <<<test_output>>>
> lchown02_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/lchown/../utils/compat_16.h:161: 16-bit version of lchown() is not supported on your platform
> lchown02_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/lchown/../utils/compat_16.h:161: Remaining cases not appropriate for configuration
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=32 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=lgetxattr01 stime=1620367887
> cmdline="lgetxattr01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> lgetxattr01.c:77: TPASS: lgetxattr() got expected value
> lgetxattr01.c:90: TPASS: lgetxattr() failed as expected: ENODATA (61)
> 
> Summary:
> passed   2
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=lgetxattr02 stime=1620367887
> cmdline="lgetxattr02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> lgetxattr02.c:63: TPASS: lgetxattr() failed as expected: ENODATA (61)
> lgetxattr02.c:63: TPASS: lgetxattr() failed as expected: ERANGE (34)
> lgetxattr02.c:63: TPASS: lgetxattr() failed as expected: EFAULT (14)
> 
> Summary:
> passed   3
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=link04 stime=1620367887
> cmdline="link04"
> contacts=""
> analysis=exit
> <<<test_output>>>
> link04      1  TPASS  :  link(<non-existent file>, <nefile>): TEST_ERRNO=ENOENT(2): No such file or directory
> link04      2  TPASS  :  link(<path is empty string>, <nefile>): TEST_ERRNO=ENOENT(2): No such file or directory
> link04      3  TPASS  :  link(<path contains a non-existent file>, <nefile>): TEST_ERRNO=ENOENT(2): No such file or directory
> link04      4  TPASS  :  link(<path contains a regular file>, <nefile>): TEST_ERRNO=ENOTDIR(20): Not a directory
> link04      5  TPASS  :  link(<pathname too long>, <nefile>): TEST_ERRNO=ENAMETOOLONG(36): File name too long
> link04      6  TPASS  :  link(<invalid address>, <nefile>): TEST_ERRNO=EFAULT(14): Bad address
> link04      7  TPASS  :  link(<regfile>, <empty string>): TEST_ERRNO=ENOENT(2): No such file or directory
> link04      8  TPASS  :  link(<regfile>, <path contains a non-existent file>): TEST_ERRNO=ENOENT(2): No such file or directory
> link04      9  TPASS  :  link(<regfile>, <path contains a regular file>): TEST_ERRNO=ENOENT(2): No such file or directory
> link04     10  TPASS  :  link(<regfile>, <pathname too long>): TEST_ERRNO=ENAMETOOLONG(36): File name too long
> link04     11  TPASS  :  link(<regfile>, <invalid address>): TEST_ERRNO=EFAULT(14): Bad address
> link04     12  TPASS  :  link(<regfile>, <regfile2>): TEST_ERRNO=EEXIST(17): File exists
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=link05 stime=1620367887
> cmdline="link05"
> contacts=""
> analysis=exit
> <<<test_output>>>
> link05      1  TPASS  :  link(lkfile_1033, lkfile_1033[1-1000]) ret 0 for 1000 files,stat linkcounts match 1000
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=1
> <<<test_end>>>
> <<<test_start>>>
> tag=lstat02 stime=1620367887
> cmdline="lstat02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> lstat02.c:72: TPASS: lstat() failed as expected: EACCES (13)
> lstat02.c:72: TPASS: lstat() failed as expected: ENOENT (2)
> lstat02.c:72: TPASS: lstat() failed as expected: EFAULT (14)
> lstat02.c:72: TPASS: lstat() failed as expected: ENAMETOOLONG (36)
> lstat02.c:72: TPASS: lstat() failed as expected: ENOTDIR (20)
> lstat02.c:72: TPASS: lstat() failed as expected: ELOOP (40)
> 
> Summary:
> passed   6
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=mbind01 stime=1620367887
> cmdline="mbind01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> mbind01.c:169: TINFO: case MPOL_DEFAULT
> mbind01.c:216: TPASS: Test passed
> mbind01.c:169: TINFO: case MPOL_DEFAULT (target exists)
> mbind01.c:216: TPASS: Test passed
> mbind01.c:169: TINFO: case MPOL_BIND (no target)
> mbind01.c:216: TPASS: Test passed
> mbind01.c:169: TINFO: case MPOL_BIND
> mbind01.c:216: TPASS: Test passed
> mbind01.c:169: TINFO: case MPOL_INTERLEAVE (no target)
> mbind01.c:216: TPASS: Test passed
> mbind01.c:169: TINFO: case MPOL_INTERLEAVE
> mbind01.c:216: TPASS: Test passed
> mbind01.c:169: TINFO: case MPOL_PREFERRED (no target)
> mbind01.c:216: TPASS: Test passed
> mbind01.c:169: TINFO: case MPOL_PREFERRED
> mbind01.c:216: TPASS: Test passed
> mbind01.c:169: TINFO: case UNKNOWN_POLICY
> mbind01.c:216: TPASS: Test passed
> mbind01.c:169: TINFO: case MPOL_DEFAULT (invalid flags)
> mbind01.c:216: TPASS: Test passed
> mbind01.c:169: TINFO: case MPOL_PREFERRED (invalid nodemask)
> mbind01.c:216: TPASS: Test passed
> 
> Summary:
> passed   11
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=2
> <<<test_end>>>
> <<<test_start>>>
> tag=memcpy01 stime=1620367887
> cmdline="memcpy01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> memcpy1     1  TPASS  :  Test passed
> memcpy1     2  TPASS  :  Test passed
> memcpy1     3  TPASS  :  Test passed
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=mknod01 stime=1620367887
> cmdline="mknod01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> mknod01     1  TPASS  :  mknod(test_node, 0100777, 0) returned 0
> mknod01     2  TPASS  :  mknod(test_node, 010777, 0) returned 0
> mknod01     3  TPASS  :  mknod(test_node, 020777, 259) returned 0
> mknod01     4  TPASS  :  mknod(test_node, 060777, 0) returned 0
> mknod01     5  TPASS  :  mknod(test_node, 0104700, 0) returned 0
> mknod01     6  TPASS  :  mknod(test_node, 0102700, 0) returned 0
> mknod01     7  TPASS  :  mknod(test_node, 0106700, 0) returned 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=mknod07 stime=1620367887
> cmdline="mknod07"
> contacts=""
> analysis=exit
> <<<test_output>>>
> mke2fs 1.44.5 (15-Dec-2018)
> mknod07     0  TINFO  :  Found free device 0 '/dev/loop0'
> mknod07     0  TINFO  :  Formatting /dev/loop0 with ext2 opts='' extra opts=''
> mknod07     1  TPASS  :  mknod failed as expected: TEST_ERRNO=EACCES(13): Permission denied
> mknod07     2  TPASS  :  mknod failed as expected: TEST_ERRNO=EACCES(13): Permission denied
> mknod07     3  TPASS  :  mknod failed as expected: TEST_ERRNO=EPERM(1): Operation not permitted
> mknod07     4  TPASS  :  mknod failed as expected: TEST_ERRNO=EPERM(1): Operation not permitted
> mknod07     5  TPASS  :  mknod failed as expected: TEST_ERRNO=EROFS(30): Read-only file system
> mknod07     6  TPASS  :  mknod failed as expected: TEST_ERRNO=ELOOP(40): Too many levels of symbolic links
> <<<execution_status>>>
> initiation_status="ok"
> duration=1 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=2
> <<<test_end>>>
> <<<test_start>>>
> tag=mmap06 stime=1620367888
> cmdline="mmap06"
> contacts=""
> analysis=exit
> <<<test_output>>>
> mmap06      1  TPASS  :  mmap failed with EACCES
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=mmap07 stime=1620367888
> cmdline="mmap07"
> contacts=""
> analysis=exit
> <<<test_output>>>
> mmap07      1  TPASS  :  mmap failed with EACCES
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=mount06 stime=1620367888
> cmdline="mount06"
> contacts=""
> analysis=exit
> <<<test_output>>>
> mke2fs 1.44.5 (15-Dec-2018)
> mount06     0  TINFO  :  Found free device 0 '/dev/loop0'
> mount06     0  TINFO  :  Formatting /dev/loop0 with ext2 opts='' extra opts=''
> mount06     1  TPASS  :  move mount is ok
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=2
> <<<test_end>>>
> <<<test_start>>>
> tag=move_pages03 stime=1620367888
> cmdline="move_pages03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> move_pages03    1  TCONF  :  move_pages_support.c:407: at least 2 allowed NUMA nodes are required
> move_pages03    2  TCONF  :  move_pages_support.c:407: Remaining cases not appropriate for configuration
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=32 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=move_pages11 stime=1620367888
> cmdline="move_pages11"
> contacts=""
> analysis=exit
> <<<test_output>>>
> move_pages11    1  TCONF  :  move_pages_support.c:407: at least 2 allowed NUMA nodes are required
> move_pages11    2  TCONF  :  move_pages_support.c:407: Remaining cases not appropriate for configuration
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=32 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=mq_timedreceive01 stime=1620367888
> cmdline="mq_timedreceive01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> mq_timedreceive01.c:140: TINFO: Testing variant: vDSO or syscall with libc spec
> mq_timedreceive01.c:224: TPASS: mq_timedreceive() returned 0, priority 0, length: 8192
> mq_timedreceive01.c:224: TPASS: mq_timedreceive() returned 1, priority 0, length: 8192
> mq_timedreceive01.c:224: TPASS: mq_timedreceive() returned 8192, priority 0, length: 8192
> mq_timedreceive01.c:224: TPASS: mq_timedreceive() returned 1, priority 32767, length: 8192
> /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedreceive/../utils/mq.h:70: TINFO: receive 1/1 message
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EMSGSIZE (90)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EBADF (9)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EBADF (9)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EBADF (9)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EAGAIN/EWOULDBLOCK (11)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EINVAL (22)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EINVAL (22)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EINVAL (22)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: ETIMEDOUT (110)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EINTR (4)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EFAULT (14)
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> mq_timedreceive01.c:140: TINFO: Testing variant: syscall with old kernel spec
> mq_timedreceive01.c:224: TPASS: mq_timedreceive() returned 0, priority 0, length: 8192
> mq_timedreceive01.c:224: TPASS: mq_timedreceive() returned 1, priority 0, length: 8192
> mq_timedreceive01.c:224: TPASS: mq_timedreceive() returned 8192, priority 0, length: 8192
> mq_timedreceive01.c:224: TPASS: mq_timedreceive() returned 1, priority 32767, length: 8192
> /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedreceive/../utils/mq.h:70: TINFO: receive 1/1 message
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EMSGSIZE (90)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EBADF (9)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EBADF (9)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EBADF (9)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EAGAIN/EWOULDBLOCK (11)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EINVAL (22)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EINVAL (22)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EINVAL (22)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: ETIMEDOUT (110)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EINTR (4)
> mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EFAULT (14)
> 
> Summary:
> passed   30
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=1 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=1
> <<<test_end>>>
> <<<test_start>>>
> tag=mremap02 stime=1620367889
> cmdline="mremap02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> mremap02    1  TPASS  :  mremap() Failed, 'invalid argument specified' - errno 22
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=msgctl04 stime=1620367889
> cmdline="msgctl04"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> msgctl04.c:59: TPASS: msgctl(1, 2, 0x5593a295f840): EACCES (13)
> msgctl04.c:59: TPASS: msgctl(2, 2, 0xffffffffffffffff): EFAULT (14)
> msgctl04.c:59: TPASS: msgctl(2, 1, 0xffffffffffffffff): EFAULT (14)
> msgctl04.c:59: TPASS: msgctl(2, -1, 0x5593a295f840): EINVAL (22)
> msgctl04.c:59: TPASS: msgctl(-1, 2, 0x5593a295f840): EINVAL (22)
> msgctl04.c:59: TPASS: msgctl(-1, 1, 0x5593a295f840): EINVAL (22)
> msgctl04.c:59: TPASS: msgctl(0, 0, (nil)): EPERM (1)
> 
> Summary:
> passed   7
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=msgget01 stime=1620367889
> cmdline="msgget01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> msgget01.c:45: TPASS: message received = message sent
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=msgrcv01 stime=1620367889
> cmdline="msgrcv01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> msgrcv01.c:38: TPASS: message received(hello) = message sent(hello)
> msgrcv01.c:45: TPASS: queue bytes and number of queues matched
> msgrcv01.c:49: TPASS: PID of last msgrcv(2) matched
> msgrcv01.c:56: TPASS: msg_rtime = 1620367889 in [1620367889, 1620367889]
> 
> Summary:
> passed   4
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=munmap03 stime=1620367889
> cmdline="munmap03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> munmap03    1  TPASS  :  failed as expected: TEST_ERRNO=EINVAL(22): Invalid argument
> munmap03    2  TPASS  :  failed as expected: TEST_ERRNO=EINVAL(22): Invalid argument
> munmap03    3  TPASS  :  failed as expected: TEST_ERRNO=EINVAL(22): Invalid argument
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=nice02 stime=1620367889
> cmdline="nice02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> nice02.c:46: TPASS: nice(50) passed
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=nice03 stime=1620367889
> cmdline="nice03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> nice03.c:47: TPASS: nice(2) passed
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=open08 stime=1620367889
> cmdline="open08"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> open08.c:84: TPASS: expected failure - errno = 17 : File exists
> open08.c:84: TPASS: expected failure - errno = 21 : Is a directory
> open08.c:84: TPASS: expected failure - errno = 20 : Not a directory
> open08.c:84: TPASS: expected failure - errno = 36 : File name too long
> open08.c:84: TPASS: expected failure - errno = 13 : Permission denied
> open08.c:84: TPASS: expected failure - errno = 14 : Bad address
> 
> Summary:
> passed   6
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=open09 stime=1620367889
> cmdline="open09"
> contacts=""
> analysis=exit
> <<<test_output>>>
> open09      1  TPASS  :  Test passed in O_WRONLY.
> open09      2  TPASS  :  Test passed in O_RDONLY.
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=openat02 stime=1620367889
> cmdline="openat02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> openat02    1  TPASS  :  test O_APPEND for openat success
> openat02    2  TPASS  :  test O_CLOEXEC for openat success
> openat02    3  TPASS  :  test O_LARGEFILE for openat success
> openat02    4  TCONF  :  openat02.c:237: test O_NOATIME flag for openat needs filesystems which are mounted without noatime and relatime
> openat02    5  TPASS  :  test O_NOFOLLOW for openat success
> openat02    6  TPASS  :  test O_TRUNC for openat success
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=openat202 stime=1620367889
> cmdline="openat202"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_buffers.c:55: TINFO: Test is using guarded buffers
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> openat202.c:58: TPASS: open /proc/version: openat2() passed
> openat202.c:58: TPASS: open magiclinks: openat2() passed
> openat202.c:58: TPASS: open symlinks: openat2() passed
> openat202.c:74: TPASS: resolve-no-xdev: openat2() failed as expected: EXDEV (18)
> openat202.c:74: TPASS: resolve-no-magiclinks: openat2() failed as expected: ELOOP (40)
> openat202.c:74: TPASS: resolve-no-symlinks: openat2() failed as expected: ELOOP (40)
> openat202.c:74: TPASS: resolve-beneath: openat2() failed as expected: EXDEV (18)
> openat202.c:74: TPASS: resolve-beneath: openat2() failed as expected: EXDEV (18)
> openat202.c:74: TPASS: resolve-no-in-root: openat2() failed as expected: ENOENT (2)
> 
> Summary:
> passed   9
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=open_by_handle_at02 stime=1620367889
> cmdline="open_by_handle_at02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> tst_buffers.c:55: TINFO: Test is using guarded buffers
> open_by_handle_at02.c:99: TPASS: invalid-dfd: open_by_handle_at() failed as expected: EBADF (9)
> open_by_handle_at02.c:99: TPASS: stale-dfd: open_by_handle_at() failed as expected: ESTALE (116)
> open_by_handle_at02.c:99: TPASS: invalid-file-handle: open_by_handle_at() failed as expected: EFAULT (14)
> open_by_handle_at02.c:99: TPASS: high-file-handle-size: open_by_handle_at() failed as expected: EINVAL (22)
> open_by_handle_at02.c:99: TPASS: zero-file-handle-size: open_by_handle_at() failed as expected: EINVAL (22)
> tst_capability.c:29: TINFO: Dropping CAP_DAC_READ_SEARCH(2)
> tst_capability.c:41: TINFO: Permitting CAP_DAC_READ_SEARCH(2)
> open_by_handle_at02.c:99: TPASS: no-capability: open_by_handle_at() failed as expected: EPERM (1)
> open_by_handle_at02.c:99: TPASS: symlink: open_by_handle_at() failed as expected: ELOOP (40)
> 
> Summary:
> passed   7
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=mincore01 stime=1620367889
> cmdline="mincore01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> mincore01    1  TPASS  :  failed as expected: TEST_ERRNO=EINVAL(22): Invalid argument
> mincore01    2  TPASS  :  failed as expected: TEST_ERRNO=EFAULT(14): Bad address
> mincore01    3  TPASS  :  failed as expected: TEST_ERRNO=ENOMEM(12): Cannot allocate memory
> mincore01    4  TPASS  :  failed as expected: TEST_ERRNO=ENOMEM(12): Cannot allocate memory
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=1
> <<<test_end>>>
> <<<test_start>>>
> tag=newuname01 stime=1620367889
> cmdline="newuname01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> newuname01    1  TPASS  :  newuname call succeed: return value = 0
> newuname01    0  TINFO  :  This system is Linux
> newuname01    0  TINFO  :  The system infomation is :
> newuname01    0  TINFO  :  System is Linux on x86_64 hardware
> newuname01    0  TINFO  :  Nodename is lkp-skl-d02
> newuname01    0  TINFO  :  Version is 5.12.0-rc2-00408-g36e4d95891ed, #1 SMP Sun Apr 18 15:27:41 CST 2021
> newuname01    0  TINFO  :  Domainname is (none)
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=pipe02 stime=1620367889
> cmdline="pipe02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> pipe02.c:86: TPASS: Child killed by SIGPIPE
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=pipe03 stime=1620367889
> cmdline="pipe03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> pipe03.c:30: TPASS: expected failure writing to read end of pipe: EBADF (9)
> pipe03.c:39: TPASS: expected failure reading from write end of pipe: EBADF (9)
> 
> Summary:
> passed   2
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=pivot_root01 stime=1620367889
> cmdline="pivot_root01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> pivot_root01.c:158: TPASS: pivot_root succeeded
> pivot_root01.c:173: TPASS: pivot_root failed as expectedly: EBUSY (16)
> pivot_root01.c:173: TPASS: pivot_root failed as expectedly: EINVAL (22)
> pivot_root01.c:173: TPASS: pivot_root failed as expectedly: ENOTDIR (20)
> pivot_root01.c:173: TPASS: pivot_root failed as expectedly: EPERM (1)
> 
> Summary:
> passed   5
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=prctl03 stime=1620367889
> cmdline="prctl03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> prctl03.c:73: TPASS: prctl(PR_SET_CHILD_SUBREAPER) succeeded
> prctl03.c:46: TPASS: prctl(PR_GET_CHILD_SUBREAPER) got expected 0
> prctl03.c:88: TPASS: PPID of orphaned process was reparented
> prctl03.c:101: TPASS: wait() got orphaned process, pid 1099, status 0
> prctl03.c:108: TPASS: received SIGCHLD from orphaned process
> prctl03.c:46: TPASS: prctl(PR_GET_CHILD_SUBREAPER) got expected 1
> 
> Summary:
> passed   6
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=prctl05 stime=1620367889
> cmdline="prctl05"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> prctl05.c:43: TPASS: prctl(PR_SET_NAME, 'prctl05_test') succeeded
> prctl05.c:57: TPASS: prctl(PR_GET_NAME) succeeded, thread name is prctl05_test
> prctl05.c:62: TPASS: /proc/self/task/1101/comm = 'prctl05_test'
> prctl05.c:63: TPASS: /proc/self/comm = 'prctl05_test'
> prctl05.c:43: TPASS: prctl(PR_SET_NAME, 'prctl05_test_xxxxx') succeeded
> prctl05.c:57: TPASS: prctl(PR_GET_NAME) succeeded, thread name is prctl05_test_xx
> prctl05.c:62: TPASS: /proc/self/task/1101/comm = 'prctl05_test_xx'
> prctl05.c:63: TPASS: /proc/self/comm = 'prctl05_test_xx'
> 
> Summary:
> passed   8
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=pread02 stime=1620367889
> cmdline="pread02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> pread02     1  TPASS  :  pread() fails, file descriptor is a PIPE or FIFO, errno:29
> pread02     2  TPASS  :  pread() fails, specified offset is -ve or invalid, errno:22
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=preadv01_64 stime=1620367889
> cmdline="preadv01_64"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_buffers.c:55: TINFO: Test is using guarded buffers
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> preadv01.c:81: TPASS: Preadv(2) read 64 bytes successfully with content 'a' expectedly
> preadv01.c:81: TPASS: Preadv(2) read 64 bytes successfully with content 'a' expectedly
> preadv01.c:81: TPASS: Preadv(2) read 32 bytes successfully with content 'b' expectedly
> 
> Summary:
> passed   3
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=preadv02_64 stime=1620367889
> cmdline="preadv02_64"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> preadv02.c:89: TPASS: preadv() failed as expected: EINVAL (22)
> preadv02.c:89: TPASS: preadv() failed as expected: EINVAL (22)
> preadv02.c:89: TPASS: preadv() failed as expected: EINVAL (22)
> preadv02.c:89: TPASS: preadv() failed as expected: EFAULT (14)
> preadv02.c:89: TPASS: preadv() failed as expected: EBADF (9)
> preadv02.c:89: TPASS: preadv() failed as expected: EBADF (9)
> preadv02.c:89: TPASS: preadv() failed as expected: EISDIR (21)
> preadv02.c:89: TPASS: preadv() failed as expected: ESPIPE (29)
> 
> Summary:
> passed   8
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=prot_hsymlinks stime=1620367889
> cmdline="prot_hsymlinks"
> contacts=""
> analysis=exit
> <<<test_output>>>
> prot_hsymlinks    0  TINFO  :   --- HARDLINKS AND SYMLINKS RESTRICTIONS TEST ---
> prot_hsymlinks    1  TPASS  :  Expect: can follow symlink '.../link_1', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks    2  TPASS  :  Expect: can follow symlink '.../link_1', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks    3  TPASS  :  Expect: can follow symlink '.../link_2', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks    4  TPASS  :  Expect: can follow symlink '.../link_2', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks    5  TPASS  :  Expect: can follow symlink '.../tmp_root/link_3', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks    6  TPASS  :  Expect: can follow symlink '.../tmp_root/link_3', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks    7  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_4', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks    8  TPASS  :  Expect: can follow symlink '.../tmp_root/link_4', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks    9  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_5', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks   10  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_5', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks   11  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_6', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks   12  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_6', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks   13  TPASS  :  Expect: can create hardlink '.../root.hs' to '.../link_7', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks   14  TPASS  :  Expect: can't create hardlink '.../root.hs' to '.../link_8', owner 'root', curr.user 'hsym', w(0)
> prot_hsymlinks   15  TPASS  :  Expect: can create hardlink '.../root.hs' to '.../tmp_root/link_9', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks   16  TPASS  :  Expect: can't create hardlink '.../root.hs' to '.../tmp_root/link_10', owner 'root', curr.user 'hsym', w(0)
> prot_hsymlinks   17  TPASS  :  Expect: can create hardlink '.../root.hs' to '.../tmp_hsym/link_11', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks   18  TPASS  :  Expect: can't create hardlink '.../root.hs' to '.../tmp_hsym/link_12', owner 'root', curr.user 'hsym', w(0)
> prot_hsymlinks   19  TPASS  :  Expect: can follow symlink '.../link_13', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   20  TPASS  :  Expect: can follow symlink '.../link_13', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   21  TPASS  :  Expect: can follow symlink '.../link_14', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   22  TPASS  :  Expect: can follow symlink '.../link_14', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   23  TPASS  :  Expect: can follow symlink '.../tmp_root/link_15', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   24  TPASS  :  Expect: can follow symlink '.../tmp_root/link_15', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   25  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_16', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   26  TPASS  :  Expect: can follow symlink '.../tmp_root/link_16', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   27  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_17', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks   28  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_17', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks   29  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_18', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks   30  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_18', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks   31  TPASS  :  Expect: can create hardlink '.../root.hs_w' to '.../link_19', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks   32  TPASS  :  Expect: can create hardlink '.../root.hs_w' to '.../link_20', owner 'root', curr.user 'hsym', w(1)
> prot_hsymlinks   33  TPASS  :  Expect: can create hardlink '.../root.hs_w' to '.../tmp_root/link_21', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks   34  TPASS  :  Expect: can create hardlink '.../root.hs_w' to '.../tmp_root/link_22', owner 'root', curr.user 'hsym', w(1)
> prot_hsymlinks   35  TPASS  :  Expect: can create hardlink '.../root.hs_w' to '.../tmp_hsym/link_23', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks   36  TPASS  :  Expect: can create hardlink '.../root.hs_w' to '.../tmp_hsym/link_24', owner 'root', curr.user 'hsym', w(1)
> prot_hsymlinks   37  TPASS  :  Expect: can follow symlink '.../link_25', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   38  TPASS  :  Expect: can follow symlink '.../link_25', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   39  TPASS  :  Expect: can follow symlink '.../link_26', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   40  TPASS  :  Expect: can follow symlink '.../link_26', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   41  TPASS  :  Expect: can follow symlink '.../tmp_root/link_27', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   42  TPASS  :  Expect: can follow symlink '.../tmp_root/link_27', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   43  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_28', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   44  TPASS  :  Expect: can follow symlink '.../tmp_root/link_28', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   45  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_29', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks   46  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_29', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks   47  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_30', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks   48  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_30', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks   49  TPASS  :  Expect: can follow symlink '.../link_31', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   50  TPASS  :  Expect: can follow symlink '.../link_31', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   51  TPASS  :  Expect: can follow symlink '.../link_32', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   52  TPASS  :  Expect: can follow symlink '.../link_32', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   53  TPASS  :  Expect: can follow symlink '.../tmp_root/link_33', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   54  TPASS  :  Expect: can follow symlink '.../tmp_root/link_33', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   55  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_34', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   56  TPASS  :  Expect: can follow symlink '.../tmp_root/link_34', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   57  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_35', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks   58  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_35', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks   59  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_36', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks   60  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_36', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks   61  TPASS  :  Expect: can create hardlink '.../root/local_root.hs' to '.../link_37', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks   62  TPASS  :  Expect: can't create hardlink '.../root/local_root.hs' to '.../link_38', owner 'root', curr.user 'hsym', w(0)
> prot_hsymlinks   63  TPASS  :  Expect: can create hardlink '.../root/local_root.hs' to '.../tmp_root/link_39', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks   64  TPASS  :  Expect: can't create hardlink '.../root/local_root.hs' to '.../tmp_root/link_40', owner 'root', curr.user 'hsym', w(0)
> prot_hsymlinks   65  TPASS  :  Expect: can create hardlink '.../root/local_root.hs' to '.../tmp_hsym/link_41', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks   66  TPASS  :  Expect: can't create hardlink '.../root/local_root.hs' to '.../tmp_hsym/link_42', owner 'root', curr.user 'hsym', w(0)
> prot_hsymlinks   67  TPASS  :  Expect: can follow symlink '.../link_43', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   68  TPASS  :  Expect: can follow symlink '.../link_43', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   69  TPASS  :  Expect: can follow symlink '.../link_44', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   70  TPASS  :  Expect: can follow symlink '.../link_44', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   71  TPASS  :  Expect: can follow symlink '.../tmp_root/link_45', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   72  TPASS  :  Expect: can follow symlink '.../tmp_root/link_45', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   73  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_46', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   74  TPASS  :  Expect: can follow symlink '.../tmp_root/link_46', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   75  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_47', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks   76  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_47', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks   77  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_48', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks   78  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_48', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks   79  TPASS  :  Expect: can create hardlink '.../tmp_root/root.hs' to '.../link_49', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks   80  TPASS  :  Expect: can't create hardlink '.../tmp_root/root.hs' to '.../link_50', owner 'root', curr.user 'hsym', w(0)
> prot_hsymlinks   81  TPASS  :  Expect: can create hardlink '.../tmp_root/root.hs' to '.../tmp_root/link_51', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks   82  TPASS  :  Expect: can't create hardlink '.../tmp_root/root.hs' to '.../tmp_root/link_52', owner 'root', curr.user 'hsym', w(0)
> prot_hsymlinks   83  TPASS  :  Expect: can create hardlink '.../tmp_root/root.hs' to '.../tmp_hsym/link_53', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks   84  TPASS  :  Expect: can't create hardlink '.../tmp_root/root.hs' to '.../tmp_hsym/link_54', owner 'root', curr.user 'hsym', w(0)
> prot_hsymlinks   85  TPASS  :  Expect: can follow symlink '.../link_55', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   86  TPASS  :  Expect: can follow symlink '.../link_55', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   87  TPASS  :  Expect: can follow symlink '.../link_56', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   88  TPASS  :  Expect: can follow symlink '.../link_56', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   89  TPASS  :  Expect: can follow symlink '.../tmp_root/link_57', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   90  TPASS  :  Expect: can follow symlink '.../tmp_root/link_57', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   91  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_58', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks   92  TPASS  :  Expect: can follow symlink '.../tmp_root/link_58', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks   93  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_59', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks   94  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_59', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks   95  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_60', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks   96  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_60', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks   97  TPASS  :  Expect: can create hardlink '.../tmp_root/root.hs_w' to '.../link_61', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks   98  TPASS  :  Expect: can create hardlink '.../tmp_root/root.hs_w' to '.../link_62', owner 'root', curr.user 'hsym', w(1)
> prot_hsymlinks   99  TPASS  :  Expect: can create hardlink '.../tmp_root/root.hs_w' to '.../tmp_root/link_63', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks  100  TPASS  :  Expect: can create hardlink '.../tmp_root/root.hs_w' to '.../tmp_root/link_64', owner 'root', curr.user 'hsym', w(1)
> prot_hsymlinks  101  TPASS  :  Expect: can create hardlink '.../tmp_root/root.hs_w' to '.../tmp_hsym/link_65', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks  102  TPASS  :  Expect: can create hardlink '.../tmp_root/root.hs_w' to '.../tmp_hsym/link_66', owner 'root', curr.user 'hsym', w(1)
> prot_hsymlinks  103  TPASS  :  Expect: can follow symlink '.../link_67', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  104  TPASS  :  Expect: can follow symlink '.../link_67', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  105  TPASS  :  Expect: can follow symlink '.../link_68', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  106  TPASS  :  Expect: can follow symlink '.../link_68', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  107  TPASS  :  Expect: can follow symlink '.../tmp_root/link_69', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  108  TPASS  :  Expect: can follow symlink '.../tmp_root/link_69', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  109  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_70', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  110  TPASS  :  Expect: can follow symlink '.../tmp_root/link_70', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  111  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_71', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  112  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_71', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  113  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_72', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  114  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_72', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  115  TPASS  :  Expect: can follow symlink '.../link_73', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  116  TPASS  :  Expect: can follow symlink '.../link_73', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  117  TPASS  :  Expect: can follow symlink '.../link_74', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  118  TPASS  :  Expect: can follow symlink '.../link_74', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  119  TPASS  :  Expect: can follow symlink '.../tmp_root/link_75', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  120  TPASS  :  Expect: can follow symlink '.../tmp_root/link_75', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  121  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_76', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  122  TPASS  :  Expect: can follow symlink '.../tmp_root/link_76', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  123  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_77', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  124  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_77', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  125  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_78', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  126  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_78', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  127  TPASS  :  Expect: can create hardlink '.../tmp_root/root/local_root.hs' to '.../link_79', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks  128  TPASS  :  Expect: can't create hardlink '.../tmp_root/root/local_root.hs' to '.../link_80', owner 'root', curr.user 'hsym', w(0)
> prot_hsymlinks  129  TPASS  :  Expect: can create hardlink '.../tmp_root/root/local_root.hs' to '.../tmp_root/link_81', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks  130  TPASS  :  Expect: can't create hardlink '.../tmp_root/root/local_root.hs' to '.../tmp_root/link_82', owner 'root', curr.user 'hsym', w(0)
> prot_hsymlinks  131  TPASS  :  Expect: can create hardlink '.../tmp_root/root/local_root.hs' to '.../tmp_hsym/link_83', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks  132  TPASS  :  Expect: can't create hardlink '.../tmp_root/root/local_root.hs' to '.../tmp_hsym/link_84', owner 'root', curr.user 'hsym', w(0)
> prot_hsymlinks  133  TPASS  :  Expect: can follow symlink '.../link_85', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  134  TPASS  :  Expect: can follow symlink '.../link_85', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  135  TPASS  :  Expect: can follow symlink '.../link_86', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  136  TPASS  :  Expect: can follow symlink '.../link_86', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  137  TPASS  :  Expect: can follow symlink '.../tmp_root/link_87', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  138  TPASS  :  Expect: can follow symlink '.../tmp_root/link_87', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  139  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_88', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  140  TPASS  :  Expect: can follow symlink '.../tmp_root/link_88', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  141  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_89', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  142  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_89', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  143  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_90', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  144  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_90', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  145  TPASS  :  Expect: can create hardlink '.../tmp_hsym/root.hs' to '.../link_91', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks  146  TPASS  :  Expect: can't create hardlink '.../tmp_hsym/root.hs' to '.../link_92', owner 'root', curr.user 'hsym', w(0)
> prot_hsymlinks  147  TPASS  :  Expect: can create hardlink '.../tmp_hsym/root.hs' to '.../tmp_root/link_93', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks  148  TPASS  :  Expect: can't create hardlink '.../tmp_hsym/root.hs' to '.../tmp_root/link_94', owner 'root', curr.user 'hsym', w(0)
> prot_hsymlinks  149  TPASS  :  Expect: can create hardlink '.../tmp_hsym/root.hs' to '.../tmp_hsym/link_95', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks  150  TPASS  :  Expect: can't create hardlink '.../tmp_hsym/root.hs' to '.../tmp_hsym/link_96', owner 'root', curr.user 'hsym', w(0)
> prot_hsymlinks  151  TPASS  :  Expect: can follow symlink '.../link_97', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  152  TPASS  :  Expect: can follow symlink '.../link_97', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  153  TPASS  :  Expect: can follow symlink '.../link_98', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  154  TPASS  :  Expect: can follow symlink '.../link_98', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  155  TPASS  :  Expect: can follow symlink '.../tmp_root/link_99', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  156  TPASS  :  Expect: can follow symlink '.../tmp_root/link_99', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  157  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_100', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  158  TPASS  :  Expect: can follow symlink '.../tmp_root/link_100', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  159  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_101', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  160  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_101', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  161  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_102', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  162  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_102', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  163  TPASS  :  Expect: can create hardlink '.../tmp_hsym/root.hs_w' to '.../link_103', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks  164  TPASS  :  Expect: can create hardlink '.../tmp_hsym/root.hs_w' to '.../link_104', owner 'root', curr.user 'hsym', w(1)
> prot_hsymlinks  165  TPASS  :  Expect: can create hardlink '.../tmp_hsym/root.hs_w' to '.../tmp_root/link_105', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks  166  TPASS  :  Expect: can create hardlink '.../tmp_hsym/root.hs_w' to '.../tmp_root/link_106', owner 'root', curr.user 'hsym', w(1)
> prot_hsymlinks  167  TPASS  :  Expect: can create hardlink '.../tmp_hsym/root.hs_w' to '.../tmp_hsym/link_107', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks  168  TPASS  :  Expect: can create hardlink '.../tmp_hsym/root.hs_w' to '.../tmp_hsym/link_108', owner 'root', curr.user 'hsym', w(1)
> prot_hsymlinks  169  TPASS  :  Expect: can follow symlink '.../link_109', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  170  TPASS  :  Expect: can follow symlink '.../link_109', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  171  TPASS  :  Expect: can follow symlink '.../link_110', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  172  TPASS  :  Expect: can follow symlink '.../link_110', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  173  TPASS  :  Expect: can follow symlink '.../tmp_root/link_111', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  174  TPASS  :  Expect: can follow symlink '.../tmp_root/link_111', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  175  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_112', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  176  TPASS  :  Expect: can follow symlink '.../tmp_root/link_112', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  177  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_113', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  178  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_113', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  179  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_114', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  180  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_114', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  181  TPASS  :  Expect: can follow symlink '.../link_115', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  182  TPASS  :  Expect: can follow symlink '.../link_115', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  183  TPASS  :  Expect: can follow symlink '.../link_116', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  184  TPASS  :  Expect: can follow symlink '.../link_116', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  185  TPASS  :  Expect: can follow symlink '.../tmp_root/link_117', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  186  TPASS  :  Expect: can follow symlink '.../tmp_root/link_117', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  187  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_118', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  188  TPASS  :  Expect: can follow symlink '.../tmp_root/link_118', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  189  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_119', owner 'root', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  190  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_119', owner 'root', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  191  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_120', owner 'hsym', src.owner 'root', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  192  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_120', owner 'hsym', src.owner 'root', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  193  TPASS  :  Expect: can create hardlink '.../tmp_hsym/root/local_root.hs' to '.../link_121', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks  194  TPASS  :  Expect: can't create hardlink '.../tmp_hsym/root/local_root.hs' to '.../link_122', owner 'root', curr.user 'hsym', w(0)
> prot_hsymlinks  195  TPASS  :  Expect: can create hardlink '.../tmp_hsym/root/local_root.hs' to '.../tmp_root/link_123', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks  196  TPASS  :  Expect: can't create hardlink '.../tmp_hsym/root/local_root.hs' to '.../tmp_root/link_124', owner 'root', curr.user 'hsym', w(0)
> prot_hsymlinks  197  TPASS  :  Expect: can create hardlink '.../tmp_hsym/root/local_root.hs' to '.../tmp_hsym/link_125', owner 'root', curr.user 'root', w(1)
> prot_hsymlinks  198  TPASS  :  Expect: can't create hardlink '.../tmp_hsym/root/local_root.hs' to '.../tmp_hsym/link_126', owner 'root', curr.user 'hsym', w(0)
> prot_hsymlinks  199  TPASS  :  Expect: can follow symlink '.../link_127', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  200  TPASS  :  Expect: can follow symlink '.../link_127', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  201  TPASS  :  Expect: can follow symlink '.../link_128', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  202  TPASS  :  Expect: can follow symlink '.../link_128', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  203  TPASS  :  Expect: can follow symlink '.../tmp_root/link_129', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  204  TPASS  :  Expect: can follow symlink '.../tmp_root/link_129', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  205  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_130', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  206  TPASS  :  Expect: can follow symlink '.../tmp_root/link_130', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  207  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_131', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  208  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_131', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  209  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_132', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  210  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_132', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  211  TPASS  :  Expect: can create hardlink '.../hsym.hs' to '.../link_133', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  212  TPASS  :  Expect: can create hardlink '.../hsym.hs' to '.../link_134', owner 'hsym', curr.user 'hsym', w(1)
> prot_hsymlinks  213  TPASS  :  Expect: can create hardlink '.../hsym.hs' to '.../tmp_root/link_135', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  214  TPASS  :  Expect: can create hardlink '.../hsym.hs' to '.../tmp_root/link_136', owner 'hsym', curr.user 'hsym', w(1)
> prot_hsymlinks  215  TPASS  :  Expect: can create hardlink '.../hsym.hs' to '.../tmp_hsym/link_137', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  216  TPASS  :  Expect: can create hardlink '.../hsym.hs' to '.../tmp_hsym/link_138', owner 'hsym', curr.user 'hsym', w(1)
> prot_hsymlinks  217  TPASS  :  Expect: can follow symlink '.../link_139', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  218  TPASS  :  Expect: can follow symlink '.../link_139', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  219  TPASS  :  Expect: can follow symlink '.../link_140', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  220  TPASS  :  Expect: can follow symlink '.../link_140', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  221  TPASS  :  Expect: can follow symlink '.../tmp_root/link_141', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  222  TPASS  :  Expect: can follow symlink '.../tmp_root/link_141', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  223  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_142', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  224  TPASS  :  Expect: can follow symlink '.../tmp_root/link_142', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  225  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_143', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  226  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_143', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  227  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_144', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  228  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_144', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  229  TPASS  :  Expect: can create hardlink '.../hsym.hs_w' to '.../link_145', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  230  TPASS  :  Expect: can create hardlink '.../hsym.hs_w' to '.../link_146', owner 'hsym', curr.user 'hsym', w(0)
> prot_hsymlinks  231  TPASS  :  Expect: can create hardlink '.../hsym.hs_w' to '.../tmp_root/link_147', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  232  TPASS  :  Expect: can create hardlink '.../hsym.hs_w' to '.../tmp_root/link_148', owner 'hsym', curr.user 'hsym', w(0)
> prot_hsymlinks  233  TPASS  :  Expect: can create hardlink '.../hsym.hs_w' to '.../tmp_hsym/link_149', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  234  TPASS  :  Expect: can create hardlink '.../hsym.hs_w' to '.../tmp_hsym/link_150', owner 'hsym', curr.user 'hsym', w(0)
> prot_hsymlinks  235  TPASS  :  Expect: can follow symlink '.../link_151', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  236  TPASS  :  Expect: can follow symlink '.../link_151', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  237  TPASS  :  Expect: can follow symlink '.../link_152', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  238  TPASS  :  Expect: can follow symlink '.../link_152', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  239  TPASS  :  Expect: can follow symlink '.../tmp_root/link_153', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  240  TPASS  :  Expect: can follow symlink '.../tmp_root/link_153', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  241  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_154', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  242  TPASS  :  Expect: can follow symlink '.../tmp_root/link_154', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  243  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_155', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  244  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_155', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  245  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_156', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  246  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_156', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  247  TPASS  :  Expect: can follow symlink '.../link_157', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  248  TPASS  :  Expect: can follow symlink '.../link_157', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  249  TPASS  :  Expect: can follow symlink '.../link_158', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  250  TPASS  :  Expect: can follow symlink '.../link_158', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  251  TPASS  :  Expect: can follow symlink '.../tmp_root/link_159', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  252  TPASS  :  Expect: can follow symlink '.../tmp_root/link_159', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  253  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_160', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  254  TPASS  :  Expect: can follow symlink '.../tmp_root/link_160', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  255  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_161', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  256  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_161', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  257  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_162', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  258  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_162', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  259  TPASS  :  Expect: can create hardlink '.../hsym/local_hsym.hs' to '.../link_163', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  260  TPASS  :  Expect: can create hardlink '.../hsym/local_hsym.hs' to '.../link_164', owner 'hsym', curr.user 'hsym', w(1)
> prot_hsymlinks  261  TPASS  :  Expect: can create hardlink '.../hsym/local_hsym.hs' to '.../tmp_root/link_165', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  262  TPASS  :  Expect: can create hardlink '.../hsym/local_hsym.hs' to '.../tmp_root/link_166', owner 'hsym', curr.user 'hsym', w(1)
> prot_hsymlinks  263  TPASS  :  Expect: can create hardlink '.../hsym/local_hsym.hs' to '.../tmp_hsym/link_167', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  264  TPASS  :  Expect: can create hardlink '.../hsym/local_hsym.hs' to '.../tmp_hsym/link_168', owner 'hsym', curr.user 'hsym', w(1)
> prot_hsymlinks  265  TPASS  :  Expect: can follow symlink '.../link_169', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  266  TPASS  :  Expect: can follow symlink '.../link_169', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  267  TPASS  :  Expect: can follow symlink '.../link_170', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  268  TPASS  :  Expect: can follow symlink '.../link_170', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  269  TPASS  :  Expect: can follow symlink '.../tmp_root/link_171', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  270  TPASS  :  Expect: can follow symlink '.../tmp_root/link_171', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  271  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_172', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  272  TPASS  :  Expect: can follow symlink '.../tmp_root/link_172', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  273  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_173', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  274  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_173', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  275  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_174', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  276  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_174', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  277  TPASS  :  Expect: can create hardlink '.../tmp_root/hsym.hs' to '.../link_175', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  278  TPASS  :  Expect: can create hardlink '.../tmp_root/hsym.hs' to '.../link_176', owner 'hsym', curr.user 'hsym', w(1)
> prot_hsymlinks  279  TPASS  :  Expect: can create hardlink '.../tmp_root/hsym.hs' to '.../tmp_root/link_177', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  280  TPASS  :  Expect: can create hardlink '.../tmp_root/hsym.hs' to '.../tmp_root/link_178', owner 'hsym', curr.user 'hsym', w(1)
> prot_hsymlinks  281  TPASS  :  Expect: can create hardlink '.../tmp_root/hsym.hs' to '.../tmp_hsym/link_179', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  282  TPASS  :  Expect: can create hardlink '.../tmp_root/hsym.hs' to '.../tmp_hsym/link_180', owner 'hsym', curr.user 'hsym', w(1)
> prot_hsymlinks  283  TPASS  :  Expect: can follow symlink '.../link_181', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  284  TPASS  :  Expect: can follow symlink '.../link_181', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  285  TPASS  :  Expect: can follow symlink '.../link_182', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  286  TPASS  :  Expect: can follow symlink '.../link_182', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  287  TPASS  :  Expect: can follow symlink '.../tmp_root/link_183', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  288  TPASS  :  Expect: can follow symlink '.../tmp_root/link_183', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  289  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_184', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  290  TPASS  :  Expect: can follow symlink '.../tmp_root/link_184', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  291  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_185', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  292  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_185', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  293  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_186', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  294  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_186', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  295  TPASS  :  Expect: can create hardlink '.../tmp_root/hsym.hs_w' to '.../link_187', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  296  TPASS  :  Expect: can create hardlink '.../tmp_root/hsym.hs_w' to '.../link_188', owner 'hsym', curr.user 'hsym', w(0)
> prot_hsymlinks  297  TPASS  :  Expect: can create hardlink '.../tmp_root/hsym.hs_w' to '.../tmp_root/link_189', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  298  TPASS  :  Expect: can create hardlink '.../tmp_root/hsym.hs_w' to '.../tmp_root/link_190', owner 'hsym', curr.user 'hsym', w(0)
> prot_hsymlinks  299  TPASS  :  Expect: can create hardlink '.../tmp_root/hsym.hs_w' to '.../tmp_hsym/link_191', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  300  TPASS  :  Expect: can create hardlink '.../tmp_root/hsym.hs_w' to '.../tmp_hsym/link_192', owner 'hsym', curr.user 'hsym', w(0)
> prot_hsymlinks  301  TPASS  :  Expect: can follow symlink '.../link_193', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  302  TPASS  :  Expect: can follow symlink '.../link_193', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  303  TPASS  :  Expect: can follow symlink '.../link_194', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  304  TPASS  :  Expect: can follow symlink '.../link_194', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  305  TPASS  :  Expect: can follow symlink '.../tmp_root/link_195', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  306  TPASS  :  Expect: can follow symlink '.../tmp_root/link_195', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  307  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_196', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  308  TPASS  :  Expect: can follow symlink '.../tmp_root/link_196', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  309  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_197', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  310  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_197', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  311  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_198', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  312  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_198', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  313  TPASS  :  Expect: can follow symlink '.../link_199', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  314  TPASS  :  Expect: can follow symlink '.../link_199', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  315  TPASS  :  Expect: can follow symlink '.../link_200', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  316  TPASS  :  Expect: can follow symlink '.../link_200', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  317  TPASS  :  Expect: can follow symlink '.../tmp_root/link_201', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  318  TPASS  :  Expect: can follow symlink '.../tmp_root/link_201', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  319  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_202', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  320  TPASS  :  Expect: can follow symlink '.../tmp_root/link_202', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  321  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_203', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  322  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_203', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  323  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_204', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  324  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_204', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  325  TPASS  :  Expect: can create hardlink '.../tmp_root/hsym/local_hsym.hs' to '.../link_205', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  326  TPASS  :  Expect: can create hardlink '.../tmp_root/hsym/local_hsym.hs' to '.../link_206', owner 'hsym', curr.user 'hsym', w(1)
> prot_hsymlinks  327  TPASS  :  Expect: can create hardlink '.../tmp_root/hsym/local_hsym.hs' to '.../tmp_root/link_207', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  328  TPASS  :  Expect: can create hardlink '.../tmp_root/hsym/local_hsym.hs' to '.../tmp_root/link_208', owner 'hsym', curr.user 'hsym', w(1)
> prot_hsymlinks  329  TPASS  :  Expect: can create hardlink '.../tmp_root/hsym/local_hsym.hs' to '.../tmp_hsym/link_209', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  330  TPASS  :  Expect: can create hardlink '.../tmp_root/hsym/local_hsym.hs' to '.../tmp_hsym/link_210', owner 'hsym', curr.user 'hsym', w(1)
> prot_hsymlinks  331  TPASS  :  Expect: can follow symlink '.../link_211', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  332  TPASS  :  Expect: can follow symlink '.../link_211', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  333  TPASS  :  Expect: can follow symlink '.../link_212', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  334  TPASS  :  Expect: can follow symlink '.../link_212', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  335  TPASS  :  Expect: can follow symlink '.../tmp_root/link_213', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  336  TPASS  :  Expect: can follow symlink '.../tmp_root/link_213', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  337  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_214', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  338  TPASS  :  Expect: can follow symlink '.../tmp_root/link_214', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  339  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_215', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  340  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_215', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  341  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_216', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  342  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_216', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  343  TPASS  :  Expect: can create hardlink '.../tmp_hsym/hsym.hs' to '.../link_217', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  344  TPASS  :  Expect: can create hardlink '.../tmp_hsym/hsym.hs' to '.../link_218', owner 'hsym', curr.user 'hsym', w(1)
> prot_hsymlinks  345  TPASS  :  Expect: can create hardlink '.../tmp_hsym/hsym.hs' to '.../tmp_root/link_219', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  346  TPASS  :  Expect: can create hardlink '.../tmp_hsym/hsym.hs' to '.../tmp_root/link_220', owner 'hsym', curr.user 'hsym', w(1)
> prot_hsymlinks  347  TPASS  :  Expect: can create hardlink '.../tmp_hsym/hsym.hs' to '.../tmp_hsym/link_221', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  348  TPASS  :  Expect: can create hardlink '.../tmp_hsym/hsym.hs' to '.../tmp_hsym/link_222', owner 'hsym', curr.user 'hsym', w(1)
> prot_hsymlinks  349  TPASS  :  Expect: can follow symlink '.../link_223', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  350  TPASS  :  Expect: can follow symlink '.../link_223', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  351  TPASS  :  Expect: can follow symlink '.../link_224', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  352  TPASS  :  Expect: can follow symlink '.../link_224', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  353  TPASS  :  Expect: can follow symlink '.../tmp_root/link_225', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  354  TPASS  :  Expect: can follow symlink '.../tmp_root/link_225', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  355  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_226', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  356  TPASS  :  Expect: can follow symlink '.../tmp_root/link_226', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  357  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_227', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  358  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_227', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  359  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_228', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  360  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_228', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  361  TPASS  :  Expect: can create hardlink '.../tmp_hsym/hsym.hs_w' to '.../link_229', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  362  TPASS  :  Expect: can create hardlink '.../tmp_hsym/hsym.hs_w' to '.../link_230', owner 'hsym', curr.user 'hsym', w(0)
> prot_hsymlinks  363  TPASS  :  Expect: can create hardlink '.../tmp_hsym/hsym.hs_w' to '.../tmp_root/link_231', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  364  TPASS  :  Expect: can create hardlink '.../tmp_hsym/hsym.hs_w' to '.../tmp_root/link_232', owner 'hsym', curr.user 'hsym', w(0)
> prot_hsymlinks  365  TPASS  :  Expect: can create hardlink '.../tmp_hsym/hsym.hs_w' to '.../tmp_hsym/link_233', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  366  TPASS  :  Expect: can create hardlink '.../tmp_hsym/hsym.hs_w' to '.../tmp_hsym/link_234', owner 'hsym', curr.user 'hsym', w(0)
> prot_hsymlinks  367  TPASS  :  Expect: can follow symlink '.../link_235', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  368  TPASS  :  Expect: can follow symlink '.../link_235', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  369  TPASS  :  Expect: can follow symlink '.../link_236', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  370  TPASS  :  Expect: can follow symlink '.../link_236', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  371  TPASS  :  Expect: can follow symlink '.../tmp_root/link_237', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  372  TPASS  :  Expect: can follow symlink '.../tmp_root/link_237', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  373  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_238', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  374  TPASS  :  Expect: can follow symlink '.../tmp_root/link_238', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  375  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_239', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  376  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_239', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  377  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_240', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  378  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_240', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  379  TPASS  :  Expect: can follow symlink '.../link_241', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  380  TPASS  :  Expect: can follow symlink '.../link_241', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  381  TPASS  :  Expect: can follow symlink '.../link_242', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  382  TPASS  :  Expect: can follow symlink '.../link_242', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  383  TPASS  :  Expect: can follow symlink '.../tmp_root/link_243', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  384  TPASS  :  Expect: can follow symlink '.../tmp_root/link_243', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  385  TPASS  :  Expect: can't follow symlink '.../tmp_root/link_244', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'root'
> prot_hsymlinks  386  TPASS  :  Expect: can follow symlink '.../tmp_root/link_244', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'root'
> prot_hsymlinks  387  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_245', owner 'root', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  388  TPASS  :  Expect: can't follow symlink '.../tmp_hsym/link_245', owner 'root', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  389  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_246', owner 'hsym', src.owner 'hsym', curr.user 'root', dir.owner 'hsym'
> prot_hsymlinks  390  TPASS  :  Expect: can follow symlink '.../tmp_hsym/link_246', owner 'hsym', src.owner 'hsym', curr.user 'hsym', dir.owner 'hsym'
> prot_hsymlinks  391  TPASS  :  Expect: can create hardlink '.../tmp_hsym/hsym/local_hsym.hs' to '.../link_247', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  392  TPASS  :  Expect: can create huserdel: hsym mail spool (/var/mail/hsym) not found
> userdel: hsym home directory (/home/hsym) not found
> ardlink '.../tmp_hsym/hsym/local_hsym.hs' to '.../link_248', owner 'hsym', curr.user 'hsym', w(1)
> prot_hsymlinks  393  TPASS  :  Expect: can create hardlink '.../tmp_hsym/hsym/local_hsym.hs' to '.../tmp_root/link_249', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  394  TPASS  :  Expect: can create hardlink '.../tmp_hsym/hsym/local_hsym.hs' to '.../tmp_root/link_250', owner 'hsym', curr.user 'hsym', w(1)
> prot_hsymlinks  395  TPASS  :  Expect: can create hardlink '.../tmp_hsym/hsym/local_hsym.hs' to '.../tmp_hsym/link_251', owner 'hsym', curr.user 'root', w(1)
> prot_hsymlinks  396  TPASS  :  Expect: can create hardlink '.../tmp_hsym/hsym/local_hsym.hs' to '.../tmp_hsym/link_252', owner 'hsym', curr.user 'hsym', w(1)
> prot_hsymlinks    0  TINFO  :  All test-cases have been completed, summary: - symlinks  test:	PASS - hardlinks test:	PASS
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=2
> <<<test_end>>>
> <<<test_start>>>
> tag=ptrace08 stime=1620367889
> cmdline="ptrace08"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> tst_kernel.c:83: TINFO: uname.machine=x86_64 kernel is 64bit
> ptrace08.c:99: TINFO: Trying address 0xffff800000000000
> ptrace08.c:129: TPASS: ptrace() breakpoint with kernel addr failed: EINVAL (22)
> ptrace08.c:99: TINFO: Trying address 0xffffffffffffffff
> ptrace08.c:129: TPASS: ptrace() breakpoint with kernel addr failed: EINVAL (22)
> ptrace08.c:99: TINFO: Trying address 0xffffbfffffffffff
> ptrace08.c:129: TPASS: ptrace() breakpoint with kernel addr failed: EINVAL (22)
> 
> Summary:
> passed   3
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=pwritev01 stime=1620367889
> cmdline="pwritev01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> pwritev01.c:85: TPASS: writev() wrote 64 bytes successfully with content 'a' expectedly
> pwritev01.c:85: TPASS: writev() wrote 64 bytes successfully with content 'a' expectedly
> pwritev01.c:85: TPASS: writev() wrote 64 bytes successfully with content 'a' expectedly
> 
> Summary:
> passed   3
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=1
> <<<test_end>>>
> <<<test_start>>>
> tag=pwritev01_64 stime=1620367889
> cmdline="pwritev01_64"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> pwritev01.c:85: TPASS: writev() wrote 64 bytes successfully with content 'a' expectedly
> pwritev01.c:85: TPASS: writev() wrote 64 bytes successfully with content 'a' expectedly
> pwritev01.c:85: TPASS: writev() wrote 64 bytes successfully with content 'a' expectedly
> 
> Summary:
> passed   3
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=quotactl03 stime=1620367889
> cmdline="quotactl03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_kconfig.c:64: TINFO: Parsing kernel config '/proc/config.gz'
> tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
> tst_test.c:889: TINFO: Formatting /dev/loop0 with xfs opts='' extra opts=''
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> quotactl03.c:64: TPASS: quotactl() failed with ENOENT as expected
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=4
> <<<test_end>>>
> <<<test_start>>>
> tag=readlink01A stime=1620367889
> cmdline="symlink01 -T readlink01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> readlink01    1  TPASS  :  Reading of symbolic link file contents checks out ok
> readlink01    2  TPASS  :  Reading of symbolic link file contents checks out ok
> readlink01    3  TPASS  :  Reading a symbolic link which exceeds maximum pathname error is caught
> readlink01    4  TPASS  :  Reading a nonsymbolic link file error condition is caught.  EINVAL is returned
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=reboot02 stime=1620367889
> cmdline="reboot02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> reboot02.c:49: TPASS: INVALID_PARAMETER: EINVAL (22)
> reboot02.c:55: TPASS: LINUX_REBOOT_CMD_CAD_ON: EPERM (1)
> 
> Summary:
> passed   2
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=remap_file_pages01 stime=1620367889
> cmdline="remap_file_pages01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> remap_file_pages01    1  TPASS  :  Non-Linear shm file OK
> remap_file_pages01    2  TPASS  :  Non-Linear /tmp/ file OK
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=1
> <<<test_end>>>
> <<<test_start>>>
> tag=remap_file_pages02 stime=1620367889
> cmdline="remap_file_pages02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> remap_file_pages02.c:86: TPASS: remap_file_pages(2) start is not valid MAP_SHARED mapping: EINVAL (22)
> remap_file_pages02.c:86: TPASS: remap_file_pages(2) start is invalid: EINVAL (22)
> remap_file_pages02.c:86: TPASS: remap_file_pages(2) size is invalid: EINVAL (22)
> remap_file_pages02.c:86: TPASS: remap_file_pages(2) prot is invalid: EINVAL (22)
> 
> Summary:
> passed   4
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=rename04 stime=1620367889
> cmdline="rename04"
> contacts=""
> analysis=exit
> <<<test_output>>>
> rename04    1  TPASS  :  rename() returned ENOTEMPTY
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=renameat201 stime=1620367889
> cmdline="renameat201"
> contacts=""
> analysis=exit
> <<<test_output>>>
> renameat201    1  TPASS  :  renameat2() returned the expected value: TEST_ERRNO=EEXIST(17): File exists
> renameat201    2  TPASS  :  renameat2() returned the expected value: TEST_ERRNO=SUCCESS(0): Success
> renameat201    3  TPASS  :  renameat2() returned the expected value: TEST_ERRNO=ENOENT(2): No such file or directory
> renameat201    4  TPASS  :  renameat2() returned the expected value: TEST_ERRNO=SUCCESS(0): Success
> renameat201    5  TPASS  :  renameat2() returned the expected value: TEST_ERRNO=EINVAL(22): Invalid argument
> renameat201    6  TPASS  :  renameat2() returned the expected value: TEST_ERRNO=EINVAL(22): Invalid argument
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=rmdir02 stime=1620367889
> cmdline="rmdir02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> rmdir02.c:92: TPASS: rmdir() failed as expected: ENOTEMPTY (39)
> rmdir02.c:92: TPASS: rmdir() failed as expected: ENAMETOOLONG (36)
> rmdir02.c:92: TPASS: rmdir() failed as expected: ENOENT (2)
> rmdir02.c:92: TPASS: rmdir() failed as expected: ENOTDIR (20)
> rmdir02.c:92: TPASS: rmdir() failed as expected: EFAULT (14)
> rmdir02.c:92: TPASS: rmdir() failed as expected: ELOOP (40)
> rmdir02.c:92: TPASS: rmdir() failed as expected: EROFS (30)
> rmdir02.c:92: TPASS: rmdir() failed as expected: EBUSY (16)
> rmdir02.c:92: TPASS: rmdir() failed as expected: EINVAL (22)
> 
> Summary:
> passed   9
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=rt_tgsigqueueinfo01 stime=1620367889
> cmdline="rt_tgsigqueueinfo01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> rt_tgsigqueueinfo01.c:65: TPASS: Test signal to self succeeded
> rt_tgsigqueueinfo01.c:96: TPASS: Test signal to different thread succeeded
> rt_tgsigqueueinfo01.c:96: TPASS: Test signal to different thread succeeded
> 
> Summary:
> passed   3
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=sched_rr_get_interval02 stime=1620367889
> cmdline="sched_rr_get_interval02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> sched_rr_get_interval02.c:34: TINFO: Testing variant: vDSO or syscall with libc spec
> sched_rr_get_interval02.c:52: TPASS: sched_rr_get_interval() passed
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> sched_rr_get_interval02.c:34: TINFO: Testing variant: syscall with old kernel spec
> sched_rr_get_interval02.c:52: TPASS: sched_rr_get_interval() passed
> 
> Summary:
> passed   2
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=1 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=sched_setparam02 stime=1620367890
> cmdline="sched_setparam02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> sched_setparam02    1  TPASS  :  Test with policy SCHED_FIFO Passed
> sched_setparam02    2  TPASS  :  Test with policy SCHED_RR Passed
> sched_setparam02    3  TPASS  :  Test with SCHED_OTHER Passed
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=sched_setscheduler02 stime=1620367890
> cmdline="sched_setscheduler02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> sched_setscheduler02    1  TPASS  :  got EPERM
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=1
> <<<test_end>>>
> <<<test_start>>>
> tag=sched_setaffinity01 stime=1620367890
> cmdline="sched_setaffinity01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> sched_setaffinity01.c:83: TPASS: sched_setaffinity() failed: EFAULT (14)
> sched_setaffinity01.c:83: TPASS: sched_setaffinity() failed: EINVAL (22)
> sched_setaffinity01.c:83: TPASS: sched_setaffinity() failed: ESRCH (3)
> sched_setaffinity01.c:83: TPASS: sched_setaffinity() failed: EPERM (1)
> 
> Summary:
> passed   4
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=sched_getaffinity01 stime=1620367890
> cmdline="sched_getaffinity01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> sched_getaffinity01.c:88: TINFO: system has 4 processor(s).
> sched_getaffinity01.c:76: TPASS: cpuset size = 128, enabled cpus 4
> sched_getaffinity01.c:39: TPASS: sched_getaffinity() failed: EFAULT (14)
> sched_getaffinity01.c:39: TPASS: sched_getaffinity() failed: EINVAL (22)
> sched_getaffinity01.c:39: TPASS: sched_getaffinity() failed: ESRCH (3)
> 
> Summary:
> passed   4
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=select03 stime=1620367890
> cmdline="select03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> select_var.h:109: TINFO: Testing libc select()
> select03.c:65: TPASS: Negative nfds: select() failed as expected: EINVAL (22)
> select03.c:65: TPASS: Invalid readfds: select() failed as expected: EBADF (9)
> select03.c:65: TPASS: Invalid writefds: select() failed as expected: EBADF (9)
> select03.c:65: TPASS: Invalid exceptfds: select() failed as expected: EBADF (9)
> select03.c:65: TPASS: Faulty readfds: select() failed as expected: EFAULT (14)
> select03.c:65: TPASS: Faulty writefds: select() failed as expected: EFAULT (14)
> select03.c:65: TPASS: Faulty exceptfds: select() failed as expected: EFAULT (14)
> select03.c:65: TPASS: Faulty timeout: select() failed as expected: EFAULT (14)
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> select_var.h:112: TINFO: Testing SYS_select syscall
> select03.c:65: TPASS: Negative nfds: select() failed as expected: EINVAL (22)
> select03.c:65: TPASS: Invalid readfds: select() failed as expected: EBADF (9)
> select03.c:65: TPASS: Invalid writefds: select() failed as expected: EBADF (9)
> select03.c:65: TPASS: Invalid exceptfds: select() failed as expected: EBADF (9)
> select03.c:65: TPASS: Faulty readfds: select() failed as expected: EFAULT (14)
> select03.c:65: TPASS: Faulty writefds: select() failed as expected: EFAULT (14)
> select03.c:65: TPASS: Faulty exceptfds: select() failed as expected: EFAULT (14)
> select03.c:65: TPASS: Faulty timeout: select() failed as expected: EFAULT (14)
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> select_var.h:115: TINFO: Testing SYS_pselect6 syscall
> select03.c:65: TPASS: Negative nfds: select() failed as expected: EINVAL (22)
> select03.c:65: TPASS: Invalid readfds: select() failed as expected: EBADF (9)
> select03.c:65: TPASS: Invalid writefds: select() failed as expected: EBADF (9)
> select03.c:65: TPASS: Invalid exceptfds: select() failed as expected: EBADF (9)
> select03.c:65: TPASS: Faulty readfds: select() failed as expected: EFAULT (14)
> select03.c:65: TPASS: Faulty writefds: select() failed as expected: EFAULT (14)
> select03.c:65: TPASS: Faulty exceptfds: select() failed as expected: EFAULT (14)
> select03.c:65: TPASS: Faulty timeout: select() failed as expected: EFAULT (14)
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> select_var.h:118: TINFO: Testing SYS_pselect6 time64 syscall
> select_var.h:83: TCONF: __NR_pselect6 time64 variant not supported
> select_var.h:83: TCONF: __NR_pselect6 time64 variant not supported
> select_var.h:83: TCONF: __NR_pselect6 time64 variant not supported
> select_var.h:83: TCONF: __NR_pselect6 time64 variant not supported
> select_var.h:83: TCONF: __NR_pselect6 time64 variant not supported
> select_var.h:83: TCONF: __NR_pselect6 time64 variant not supported
> select_var.h:83: TCONF: __NR_pselect6 time64 variant not supported
> select_var.h:83: TCONF: __NR_pselect6 time64 variant not supported
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> select_var.h:121: TINFO: Testing SYS__newselect syscall
> select_var.h:89: TCONF: syscall(-1) __NR__newselect not supported
> select_var.h:89: TCONF: syscall(-1) __NR__newselect not supported
> select_var.h:89: TCONF: syscall(-1) __NR__newselect not supported
> select_var.h:89: TCONF: syscall(-1) __NR__newselect not supported
> select_var.h:89: TCONF: syscall(-1) __NR__newselect not supported
> select_var.h:89: TCONF: syscall(-1) __NR__newselect not supported
> select_var.h:89: TCONF: syscall(-1) __NR__newselect not supported
> select_var.h:89: TCONF: syscall(-1) __NR__newselect not supported
> 
> Summary:
> passed   24
> failed   0
> broken   0
> skipped  16
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=semctl05 stime=1620367890
> cmdline="semctl05"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> semctl05.c:45: TPASS: semctl() with the value to set is less than zero: ERANGE (34)
> semctl05.c:45: TPASS: semctl() with the value to set are too large: ERANGE (34)
> semctl05.c:45: TPASS: semctl() with the value to set is too large: ERANGE (34)
> 
> Summary:
> passed   3
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=sendfile02 stime=1620367890
> cmdline="sendfile02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> sendfile02    1  TPASS  :  functionality of sendfile() is correct
> sendfile02    2  TPASS  :  functionality of sendfile() is correct
> sendfile02    3  TPASS  :  functionality of sendfile() is correct
> sendfile02    4  TPASS  :  functionality of sendfile() is correct
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=sendfile09_64 stime=1620367890
> cmdline="sendfile09_64"
> contacts=""
> analysis=exit
> <<<test_output>>>
> sendfile09_64    1  TPASS  :  Test sendfile(2) with offset at 0
> sendfile09_64    2  TPASS  :  Test sendfile(2) with offset at 3GB
> <<<execution_status>>>
> initiation_status="ok"
> duration=1 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=113
> <<<test_end>>>
> <<<test_start>>>
> tag=sendmsg03 stime=1620367891
> cmdline="sendmsg03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> ../../../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
> ../../../../include/tst_fuzzy_sync.h:346: TINFO: loop = 1024, delay_bias = 0
> ../../../../include/tst_fuzzy_sync.h:335: TINFO: start_a - start_b: { avg =   -37ns, avg_dev =    12ns, dev_ratio = 0.32 }
> ../../../../include/tst_fuzzy_sync.h:335: TINFO: end_a - start_a  : { avg =  1845ns, avg_dev =   205ns, dev_ratio = 0.11 }
> ../../../../include/tst_fuzzy_sync.h:335: TINFO: end_b - start_b  : { avg =   797ns, avg_dev =   163ns, dev_ratio = 0.20 }
> ../../../../include/tst_fuzzy_sync.h:335: TINFO: end_a - end_b    : { avg =  1011ns, avg_dev =   154ns, dev_ratio = 0.15 }
> ../../../../include/tst_fuzzy_sync.h:335: TINFO: spins            : { avg =   645  , avg_dev =    98  , dev_ratio = 0.15 }
> ../../../../include/tst_fuzzy_sync.h:534: TINFO: Reached deviation ratios < 0.10, introducing randomness
> ../../../../include/tst_fuzzy_sync.h:537: TINFO: Delay range is [-487, 948]
> ../../../../include/tst_fuzzy_sync.h:346: TINFO: loop = 1050, delay_bias = 0
> ../../../../include/tst_fuzzy_sync.h:335: TINFO: start_a - start_b: { avg =   -53ns, avg_dev =     5ns, dev_ratio = 0.09 }
> ../../../../include/tst_fuzzy_sync.h:335: TINFO: end_a - start_a  : { avg =  1519ns, avg_dev =    82ns, dev_ratio = 0.05 }
> ../../../../include/tst_fuzzy_sync.h:335: TINFO: end_b - start_b  : { avg =   782ns, avg_dev =    59ns, dev_ratio = 0.08 }
> ../../../../include/tst_fuzzy_sync.h:335: TINFO: end_a - end_b    : { avg =   685ns, avg_dev =    39ns, dev_ratio = 0.06 }
> ../../../../include/tst_fuzzy_sync.h:335: TINFO: spins            : { avg =   428  , avg_dev =    26  , dev_ratio = 0.06 }
> ../../../../include/tst_fuzzy_sync.h:685: TINFO: Exceeded execution loops, requesting exit
> sendmsg03.c:100: TPASS: Nothing bad happened, probably
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=1 termination_type=exited termination_id=0 corefile=no
> cutime=111 cstime=51
> <<<test_end>>>
> <<<test_start>>>
> tag=setfsgid01 stime=1620367892
> cmdline="setfsgid01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> setfsgid01    1  TPASS  :  setfsgid() returned expected value : 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=setfsgid01_16 stime=1620367892
> cmdline="setfsgid01_16"
> contacts=""
> analysis=exit
> <<<test_output>>>
> setfsgid01_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/setfsgid/../utils/compat_16.h:122: 16-bit version of setfsgid() is not supported on your platform
> setfsgid01_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/setfsgid/../utils/compat_16.h:122: Remaining cases not appropriate for configuration
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=32 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=setfsuid04_16 stime=1620367892
> cmdline="setfsuid04_16"
> contacts=""
> analysis=exit
> <<<test_output>>>
> setfsuid04_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/setfsuid/../utils/compat_16.h:117: 16-bit version of setfsuid() is not supported on your platform
> setfsuid04_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/setfsuid/../utils/compat_16.h:117: Remaining cases not appropriate for configuration
> setfsuid04_16    0  TINFO  :  Child process returned TCONF
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=32 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=setgid03_16 stime=1620367892
> cmdline="setgid03_16"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/setgid/../utils/compat_tst_16.h:94: TCONF: 16-bit version of setgid() is not supported on your platform
> 
> Summary:
> passed   0
> failed   0
> broken   0
> skipped  1
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=32 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=setregid01_16 stime=1620367892
> cmdline="setregid01_16"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/setregid/../utils/compat_tst_16.h:128: TCONF: 16-bit version of setregid() is not supported on your platform
> 
> Summary:
> passed   0
> failed   0
> broken   0
> skipped  1
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=32 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=setresgid03_16 stime=1620367892
> cmdline="setresgid03_16"
> contacts=""
> analysis=exit
> <<<test_output>>>
> setresgid03_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/setresgid/../utils/compat_16.h:146: 16-bit version of setresgid() is not supported on your platform
> setresgid03_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/setresgid/../utils/compat_16.h:146: Remaining cases not appropriate for configuration
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=32 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=setresuid03 stime=1620367892
> cmdline="setresuid03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> setresuid03    1  TPASS  :  setresuid(65534, -1, -1) failed as expected.
> setresuid03    0  TINFO  :  real uid = 0, effective uid = 2, and saved uid = 2 as expected
> setresuid03    2  TPASS  :  setresuid(-1, -1, 65534) failed as expected.
> setresuid03    0  TINFO  :  real uid = 0, effective uid = 2, and saved uid = 2 as expected
> setresuid03    3  TPASS  :  setresuid(-1, 65534, -1) failed as expected.
> setresuid03    0  TINFO  :  real uid = 0, effective uid = 2, and saved uid = 2 as expected
> setresuid03    0  TINFO  :  Child process returned TPASS
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=setresuid03_16 stime=1620367892
> cmdline="setresuid03_16"
> contacts=""
> analysis=exit
> <<<test_output>>>
> setresuid03_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/setresuid/../utils/compat_16.h:136: 16-bit version of setresuid() is not supported on your platform
> setresuid03_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/setresuid/../utils/compat_16.h:136: Remaining cases not appropriate for configuration
> setresuid03_16    0  TINFO  :  Child process returned TCONF
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=32 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=setresuid05 stime=1620367892
> cmdline="setresuid05"
> contacts=""
> analysis=exit
> <<<test_output>>>
> setresuid05    1  TPASS  :  setresuid succeeded as expected
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=setreuid01 stime=1620367892
> cmdline="setreuid01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> setreuid01    1  TPASS  :  setreuid -  Don't change either real or effective uid returned 0
> setreuid01    2  TPASS  :  setreuid -  change effective to effective uid returned 0
> setreuid01    3  TPASS  :  setreuid -  change real to real uid returned 0
> setreuid01    4  TPASS  :  setreuid -  change effective to real uid returned 0
> setreuid01    5  TPASS  :  setreuid -  try to change real to current real returned 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=setreuid04_16 stime=1620367892
> cmdline="setreuid04_16"
> contacts=""
> analysis=exit
> <<<test_output>>>
> setreuid04_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/setreuid/../utils/compat_16.h:127: 16-bit version of setreuid() is not supported on your platform
> setreuid04_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/setreuid/../utils/compat_16.h:127: Remaining cases not appropriate for configuration
> setreuid04_16    0  TINFO  :  Child process returned TCONF
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=32 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=setsockopt07 stime=1620367892
> cmdline="setsockopt07"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_kconfig.c:64: TINFO: Parsing kernel config '/proc/config.gz'
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> ../../../../include/tst_fuzzy_sync.h:685: TINFO: Exceeded execution loops, requesting exit
> setsockopt07.c:120: TPASS: Cannot reproduce bug
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=19 termination_type=exited termination_id=0 corefile=no
> cutime=1289 cstime=1
> <<<test_end>>>
> <<<test_start>>>
> tag=setxattr03 stime=1620367911
> cmdline="setxattr03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> setxattr03.c:98: TPASS: Set attr to immutable file: EPERM (1)
> setxattr03.c:98: TPASS: Set attr to append-only file: EPERM (1)
> 
> Summary:
> passed   2
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=shmat01 stime=1620367911
> cmdline="shmat01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> shmat01.c:124: TPASS: shmat() succeeded to attach NULL address
> shmat01.c:124: TPASS: shmat() succeeded to attach aligned address
> shmat01.c:124: TPASS: shmat() succeeded to attach unaligned address with SHM_RND
> tst_coredump.c:32: TINFO: Avoid dumping corefile for process(pid=1327)
> shmat01.c:124: TPASS: shmat() succeeded to attach aligned address with SHM_READONLY, and got SIGSEGV on write
> 
> Summary:
> passed   4
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=2
> <<<test_end>>>
> <<<test_start>>>
> tag=shmctl04 stime=1620367911
> cmdline="shmctl04"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> shmctl04.c:119: TINFO: Test SHM_STAT_ANY with nobody user
> shmctl04.c:137: TPASS: SHM_INFO returned valid index 3 maps to shmid 3
> shmctl04.c:146: TPASS: Counted used = 2
> shmctl04.c:85: TPASS: used_ids = 2
> shmctl04.c:92: TPASS: shm_rss = 1007
> shmctl04.c:99: TPASS: shm_swp = 0
> shmctl04.c:106: TPASS: shm_tot = 1008
> shmctl04.c:119: TINFO: Test SHM_STAT_ANY with root user
> shmctl04.c:137: TPASS: SHM_INFO returned valid index 3 maps to shmid 3
> shmctl04.c:146: TPASS: Counted used = 2
> shmctl04.c:85: TPASS: used_ids = 2
> shmctl04.c:92: TPASS: shm_rss = 1007
> shmctl04.c:99: TPASS: shm_swp = 0
> shmctl04.c:106: TPASS: shm_tot = 1008
> 
> Summary:
> passed   12
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=shmget01 stime=1620367911
> cmdline="shmget01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> shmget01    1  TPASS  :  size, pid & mode are correct
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=sigaltstack01 stime=1620367911
> cmdline="sigaltstack01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> sigaltstack01    1  TPASS  :  Functionality of sigaltstack() successful
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=sighold02 stime=1620367911
> cmdline="sighold02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> sighold02    1  TPASS  :  All signals were hold
> sighold02    0  TINFO  :  Child process returned TPASS
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=signal01 stime=1620367911
> cmdline="signal01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> signal01    1  TPASS  :  signal(SIGKILL, 0x1(SIG_IGN)) failed with EINVAL
> signal01    0  TINFO  :  Child process returned TPASS
> signal01    1  TPASS  :  signal(SIGKILL, (nil)(SIG_DFL)) failed with EINVAL
> signal01    0  TINFO  :  Child process returned TPASS
> signal01    1  TPASS  :  signal(SIGKILL, 0x55ee69fa1f60(catchsig())) failed with EINVAL
> signal01    0  TINFO  :  Child process returned TPASS
> signal01    1  TPASS  :  Child killed with SIGKILL
> signal01    2  TPASS  :  Child killed with SIGKILL
> signal01    3  TPASS  :  Child killed with SIGKILL
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=socketcall03 stime=1620367911
> cmdline="socketcall03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> socketcall03.c:32: TCONF: syscall(-1) __NR_socketcall not supported
> 
> Summary:
> passed   0
> failed   0
> broken   0
> skipped  1
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=32 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=stat02 stime=1620367911
> cmdline="stat02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> stat02.c:67: TPASS: File size reported as expected
> stat02.c:67: TPASS: File size reported as expected
> 
> Summary:
> passed   2
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=stat02_64 stime=1620367911
> cmdline="stat02_64"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> stat02.c:67: TPASS: File size reported as expected
> stat02.c:67: TPASS: File size reported as expected
> 
> Summary:
> passed   2
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=stat03 stime=1620367911
> cmdline="stat03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> stat03.c:55: TPASS: stat() failed as expected: EACCES (13)
> stat03.c:55: TPASS: stat() failed as expected: EFAULT (14)
> stat03.c:55: TPASS: stat() failed as expected: ENAMETOOLONG (36)
> stat03.c:55: TPASS: stat() failed as expected: ENOENT (2)
> stat03.c:55: TPASS: stat() failed as expected: ENOTDIR (20)
> stat03.c:55: TPASS: stat() failed as expected: ELOOP (40)
> 
> Summary:
> passed   6
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=statfs01 stime=1620367911
> cmdline="statfs01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> statfs01    1  TPASS  :  statfs(tfile_1349, ..) returned 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=1
> <<<test_end>>>
> <<<test_start>>>
> tag=statvfs02 stime=1620367911
> cmdline="statvfs02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> statvfs02    1  TPASS  :  statvfs() failed as expected: TEST_ERRNO=EFAULT(14): Bad address
> statvfs02    2  TPASS  :  statvfs() failed as expected: TEST_ERRNO=ELOOP(40): Too many levels of symbolic links
> statvfs02    3  TPASS  :  statvfs() failed as expected: TEST_ERRNO=ENAMETOOLONG(36): File name too long
> statvfs02    4  TPASS  :  statvfs() failed as expected: TEST_ERRNO=ENOENT(2): No such file or directory
> statvfs02    5  TPASS  :  statvfs() failed as expected: TEST_ERRNO=ENOTDIR(20): Not a directory
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=swapon03 stime=1620367911
> cmdline="swapon03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> tst_ioctl.c:30: TINFO: FIBMAP ioctl is supported
> libswap.c:59: TFAIL: swapon on f2fs failed: EINVAL (22)
> 
> Summary:
> passed   0
> failed   1
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=1 corefile=no
> cutime=0 cstime=1
> <<<test_end>>>
> <<<test_start>>>
> tag=sync_file_range01 stime=1620367911
> cmdline="sync_file_range01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> sync_file_range01    1  TPASS  :  got expected error: TEST_ERRNO=EBADF(9): Bad file descriptor
> sync_file_range01    2  TPASS  :  got expected error: TEST_ERRNO=ESPIPE(29): Illegal seek
> sync_file_range01    3  TPASS  :  got expected error: TEST_ERRNO=EINVAL(22): Invalid argument
> sync_file_range01    4  TPASS  :  got expected error: TEST_ERRNO=EINVAL(22): Invalid argument
> sync_file_range01    5  TPASS  :  got expected error: TEST_ERRNO=EINVAL(22): Invalid argument
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=sysfs02 stime=1620367911
> cmdline="sysfs02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> sysfs02     1  TPASS  :  sysfs(2) Passed for option 2
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=sysfs04 stime=1620367911
> cmdline="sysfs04"
> contacts=""
> analysis=exit
> <<<test_output>>>
> sysfs04     1  TPASS  :  sysfs(2) expected failure; Got errno - EINVAL : Invalid option
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=syslog01 stime=1620367911
> cmdline="syslog01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> syslog01    0  TINFO  :  Send messages to syslogd at some level
> syslog01    0  TINFO  :  and facility and grep for those messages.
> syslog01    0  TINFO  :  testing whether messages are logged into log file
> syslog01    0  TINFO  :  restarting syslog daemon
> syslog01    0  TINFO  :  restarting syslog daemon
> <<<execution_status>>>
> initiation_status="ok"
> duration=7 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=2
> <<<test_end>>>
> <<<test_start>>>
> tag=syslog09 stime=1620367918
> cmdline="syslog09"
> contacts=""
> analysis=exit
> <<<test_output>>>
> syslog09    0  TINFO  :   Test setlogmask() with LOG_UPTO macro.
> syslog09    0  TINFO  :   o Use setlogmask() with LOG_UPTO macro to set some priority
> syslog09    0  TINFO  :     level.
> syslog09    0  TINFO  :   o Send message which is lower priority than the one
> syslog09    0  TINFO  :     set above, which should not be logged
> syslog09    0  TINFO  :  syslog: Testing setlogmask() with LOG_UPTO macro
> syslog09    0  TINFO  :  restarting syslog daemon
> syslog09    0  TINFO  :  restarting syslog daemon
> <<<execution_status>>>
> initiation_status="ok"
> duration=6 termination_type=exited termination_id=0 corefile=no
> cutime=2 cstime=1
> <<<test_end>>>
> <<<test_start>>>
> tag=times03 stime=1620367924
> cmdline="times03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> times03.c:89: TPASS: buf1.tms_utime <= 5
> times03.c:94: TPASS: buf1.tms_stime <= 5
> times03.c:105: TPASS: buf2.tms_utime = 249
> times03.c:112: TPASS: buf1.tms_utime (0) < buf2.tms_utime (249)
> times03.c:118: TPASS: buf2.tms_stime = 141
> times03.c:125: TPASS: buf1.tms_stime (0) < buf2.tms_stime (141)
> times03.c:131: TPASS: buf2.tms_cutime = 0
> times03.c:136: TPASS: buf2.tms_cstime = 0
> times03.c:156: TPASS: buf2.tms_utime (249) <= buf3.tms_utime (249)
> times03.c:164: TPASS: buf2.tms_stime (141) <= buf3.tms_stime (141)
> times03.c:170: TPASS: buf3.tms_cutime = 262
> times03.c:175: TPASS: buf3.tms_cstime = 137
> 
> Summary:
> passed   12
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=8 termination_type=exited termination_id=0 corefile=no
> cutime=512 cstime=279
> <<<test_end>>>
> <<<test_start>>>
> tag=timer_getoverrun01 stime=1620367932
> cmdline="timer_getoverrun01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> timer_getoverrun01    1  TPASS  :  timer_getoverrun(CLOCK_REALTIME) Passed
> timer_getoverrun01    2  TPASS  :  timer_gettime(-1) Failed: EINVAL
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=tkill02 stime=1620367932
> cmdline="tkill02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> tkill02.c:48: TPASS: tst_syscall(__NR_tkill) expecting EINVAL: EINVAL (22)
> tkill02.c:48: TPASS: tst_syscall(__NR_tkill) expecting ESRCH: ESRCH (3)
> 
> Summary:
> passed   2
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=truncate03 stime=1620367932
> cmdline="truncate03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> truncate03.c:132: TPASS: truncate() failed as expected: EACCES (13)
> truncate03.c:132: TPASS: truncate() failed as expected: ENOTDIR (20)
> truncate03.c:132: TPASS: truncate() failed as expected: EFAULT (14)
> truncate03.c:132: TPASS: truncate() failed as expected: ENAMETOOLONG (36)
> truncate03.c:132: TPASS: truncate() failed as expected: ENOENT (2)
> truncate03.c:132: TPASS: truncate() failed as expected: EISDIR (21)
> truncate03.c:132: TPASS: truncate() failed as expected: EFBIG (27)
> truncate03.c:132: TPASS: truncate() failed as expected: ELOOP (40)
> 
> Summary:
> passed   8
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=umask01 stime=1620367932
> cmdline="umask01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> umask01.c:57: TPASS: All files created with correct mode
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=1 cstime=1
> <<<test_end>>>
> <<<test_start>>>
> tag=unlink05 stime=1620367932
> cmdline="unlink05"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> unlink05.c:61: TPASS: unlink(file) succeeded
> unlink05.c:61: TPASS: unlink(fifo) succeeded
> 
> Summary:
> passed   2
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=umount2_02 stime=1620367932
> cmdline="umount2_02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> mke2fs 1.44.5 (15-Dec-2018)
> umount2_02    0  TINFO  :  Found free device 0 '/dev/loop0'
> umount2_02    0  TINFO  :  Formatting /dev/loop0 with ext2 opts='' extra opts=''
> umount2_02    1  TPASS  :  umount2(2) failed as expected: TEST_ERRNO=EINVAL(22): Invalid argument
> umount2_02    2  TPASS  :  umount2(2) failed as expected: TEST_ERRNO=EINVAL(22): Invalid argument
> umount2_02    3  TPASS  :  umount2(2) failed as expected: TEST_ERRNO=EAGAIN/EWOULDBLOCK(11): Resource temporarily unavailable
> umount2_02    4  TPASS  :  umount2(2) failed as expected: TEST_ERRNO=EAGAIN/EWOULDBLOCK(11): Resource temporarily unavailable
> umount2_02    5  TPASS  :  umount2(2) succeeded as expected
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=3
> <<<test_end>>>
> <<<test_start>>>
> tag=ustat01 stime=1620367932
> cmdline="ustat01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> ustat01.c:31: TPASS: ustat(2) passed
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=utime01A stime=1620367932
> cmdline="symlink01 -T utime01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> utime01     1  TPASS  :  utime(2) change of object file access and modify times through symbolic link file is ok
> utime01     2  TPASS  :  utime(2) error when accessing non-existent object through symbolic link is caught
> utime01     3  TPASS  :  Nested symbolic link access condition caught.  ELOOP is returned
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=vmsplice01 stime=1620367932
> cmdline="vmsplice01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> tst_test.c:1063: TINFO: f2fs is supported by the test
> vmsplice01.c:45: TPASS: Written data has been read back correctly
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=waitpid03 stime=1620367932
> cmdline="waitpid03"
> contacts=""
> analysis=exit
> <<<test_output>>>
> waitpid03    1  TPASS  :  Got correct child PID
> waitpid03    2  TPASS  :  Condition 2 test passed
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=waitpid04 stime=1620367932
> cmdline="waitpid04"
> contacts=""
> analysis=exit
> <<<test_output>>>
> waitpid04    1  TPASS  :  condition 1 test passed
> waitpid04    2  TPASS  :  condition 2 test passed
> waitpid04    3  TPASS  :  condition 3 test passed
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=waitid02 stime=1620367932
> cmdline="waitid02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> waitid02    0  TINFO  :  WNOHANG
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 1)
> waitid02    1  TPASS  :  exp_errno=22
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  WNOHANG | WEXITED no child
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 5)
> waitid02    2  TPASS  :  exp_errno=10
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  WNOHANG
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 1)
> waitid02    1  TPASS  :  exp_errno=22
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  WNOHANG | WEXITED no child
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 5)
> waitid02    2  TPASS  :  exp_errno=10
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  WNOHANG | WEXITED with child
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 5)
> waitid02    3  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  WNOHANG
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 1)
> waitid02    1  TPASS  :  exp_errno=22
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  WNOHANG | WEXITED no child
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 5)
> waitid02    2  TPASS  :  exp_errno=10
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  WNOHANG | WEXITED with child
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 5)
> waitid02    3  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  P_PGID, WEXITED wait for child
> waitid02    0  TINFO  :  (1548) waitid(2, 1548, 0x7fffe02d2d60, 4)
> waitid02    4  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 1550 ; si_code = 1 ; si_status = 0
> waitid02    0  TINFO  :  WNOHANG
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 1)
> waitid02    1  TPASS  :  exp_errno=22
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  WNOHANG | WEXITED no child
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 5)
> waitid02    2  TPASS  :  exp_errno=10
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  WNOHANG | WEXITED with child
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 5)
> waitid02    3  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  P_PGID, WEXITED wait for child
> waitid02    0  TINFO  :  (1548) waitid(2, 1548, 0x7fffe02d2d60, 4)
> waitid02    4  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 1550 ; si_code = 1 ; si_status = 0
> waitid02    0  TINFO  :  P_PID, WEXITED wait for child
> waitid02    0  TINFO  :  (1548) waitid(1, 1551, 0x7fffe02d2d60, 4)
> waitid02    5  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 1551 ; si_code = 1 ; si_status = 0
> waitid02    0  TINFO  :  WNOHANG
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 1)
> waitid02    1  TPASS  :  exp_errno=22
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  WNOHANG | WEXITED no child
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 5)
> waitid02    2  TPASS  :  exp_errno=10
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  WNOHANG | WEXITED with child
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 5)
> waitid02    3  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  P_PGID, WEXITED wait for child
> waitid02    0  TINFO  :  (1548) waitid(2, 1548, 0x7fffe02d2d60, 4)
> waitid02    4  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 1550 ; si_code = 1 ; si_status = 0
> waitid02    0  TINFO  :  P_PID, WEXITED wait for child
> waitid02    0  TINFO  :  (1548) waitid(1, 1551, 0x7fffe02d2d60, 4)
> waitid02    5  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 1551 ; si_code = 1 ; si_status = 0
> waitid02    0  TINFO  :  P_PID, WSTOPPED | WNOWAIT
> waitid02    0  TINFO  :  (1548) waitid(1, 1552, 0x7fffe02d2d60, 16777218)
> waitid02    6  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 1552 ; si_code = 5 ; si_status = 19
> waitid02    0  TINFO  :  WNOHANG
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 1)
> waitid02    1  TPASS  :  exp_errno=22
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  WNOHANG | WEXITED no child
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 5)
> waitid02    2  TPASS  :  exp_errno=10
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  WNOHANG | WEXITED with child
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 5)
> waitid02    3  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  P_PGID, WEXITED wait for child
> waitid02    0  TINFO  :  (1548) waitid(2, 1548, 0x7fffe02d2d60, 4)
> waitid02    4  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 1550 ; si_code = 1 ; si_status = 0
> waitid02    0  TINFO  :  P_PID, WEXITED wait for child
> waitid02    0  TINFO  :  (1548) waitid(1, 1551, 0x7fffe02d2d60, 4)
> waitid02    5  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 1551 ; si_code = 1 ; si_status = 0
> waitid02    0  TINFO  :  P_PID, WSTOPPED | WNOWAIT
> waitid02    0  TINFO  :  (1548) waitid(1, 1552, 0x7fffe02d2d60, 16777218)
> waitid02    6  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 1552 ; si_code = 5 ; si_status = 19
> waitid02    0  TINFO  :  P_PID, WCONTINUED
> waitid02    0  TINFO  :  (1548) waitid(1, 1553, 0x7fffe02d2d60, 8)
> waitid02    7  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 1553 ; si_code = 6 ; si_status = 18
> waitid02    0  TINFO  :  WNOHANG
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 1)
> waitid02    1  TPASS  :  exp_errno=22
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  WNOHANG | WEXITED no child
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 5)
> waitid02    2  TPASS  :  exp_errno=10
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  WNOHANG | WEXITED with child
> waitid02    0  TINFO  :  (1548) waitid(0, 0, 0x7fffe02d2d60, 5)
> waitid02    3  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> waitid02    0  TINFO  :  P_PGID, WEXITED wait for child
> waitid02    0  TINFO  :  (1548) waitid(2, 1548, 0x7fffe02d2d60, 4)
> waitid02    4  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 1550 ; si_code = 1 ; si_status = 0
> waitid02    0  TINFO  :  P_PID, WEXITED wait for child
> waitid02    0  TINFO  :  (1548) waitid(1, 1551, 0x7fffe02d2d60, 4)
> waitid02    5  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 1551 ; si_code = 1 ; si_status = 0
> waitid02    0  TINFO  :  P_PID, WSTOPPED | WNOWAIT
> waitid02    0  TINFO  :  (1548) waitid(1, 1552, 0x7fffe02d2d60, 16777218)
> waitid02    6  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 1552 ; si_code = 5 ; si_status = 19
> waitid02    0  TINFO  :  P_PID, WCONTINUED
> waitid02    0  TINFO  :  (1548) waitid(1, 1553, 0x7fffe02d2d60, 8)
> waitid02    7  TPASS  :  ret: 0
> waitid02    0  TINFO  :  si_pid = 1553 ; si_code = 6 ; si_status = 18
> waitid02    0  TINFO  :  P_PID, WEXITED not a child of the calling process
> waitid02    0  TINFO  :  (1548) waitid(1, 1, 0x7fffe02d2d60, 4)
> waitid02    8  TPASS  :  exp_errno=10
> waitid02    0  TINFO  :  si_pid = 0 ; si_code = 0 ; si_status = 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=write02 stime=1620367932
> cmdline="write02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> write02.c:25: TPASS: write(fd, NULL, 0) == 0
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=1
> <<<test_end>>>
> <<<test_start>>>
> tag=write04 stime=1620367932
> cmdline="write04"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> write04.c:46: TPASS: write() failed expectedly: EAGAIN/EWOULDBLOCK (11)
> 
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=writev01 stime=1620367932
> cmdline="writev01"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> writev01.c:127: TPASS: invalid iov_len, expected: -1 (EINVAL), got: -1 (EINVAL)
> writev01.c:127: TPASS: invalid fd, expected: -1 (EBADF), got: -1 (EBADF)
> writev01.c:127: TPASS: invalid iovcnt, expected: -1 (EINVAL), got: -1 (EINVAL)
> writev01.c:131: TPASS: zero iovcnt, expected: 0, got: 0
> writev01.c:131: TPASS: NULL and zero length iovec, expected: 64, got: 64
> writev01.c:127: TPASS: write to closed pipe, expected: -1 (EPIPE), got: -1 (EPIPE)
> 
> Summary:
> passed   6
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=futex_cmp_requeue02 stime=1620367932
> cmdline="futex_cmp_requeue02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> futex_cmp_requeue02.c:71: TINFO: Testing variant: syscall with old kernel spec
> futex_cmp_requeue02.c:64: TPASS: futex_cmp_requeue() failed as expected: EINVAL (22)
> futex_cmp_requeue02.c:64: TPASS: futex_cmp_requeue() failed as expected: EINVAL (22)
> futex_cmp_requeue02.c:64: TPASS: futex_cmp_requeue() failed as expected: EAGAIN/EWOULDBLOCK (11)
> 
> Summary:
> passed   3
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=memfd_create04 stime=1620367932
> cmdline="memfd_create04"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> memfd_create04.c:67: TINFO: Attempt to create file using 64kB huge page size
> memfd_create04.c:72: TPASS: Test failed as expected
> memfd_create04.c:67: TINFO: Attempt to create file using 512kB huge page size
> memfd_create04.c:72: TPASS: Test failed as expected
> memfd_create04.c:67: TINFO: Attempt to create file using 2048kB huge page size
> memfd_create04.c:81: TPASS: memfd_create succeeded for 2048kB page size
> memfd_create04.c:67: TINFO: Attempt to create file using 8192kB huge page size
> memfd_create04.c:72: TPASS: Test failed as expected
> memfd_create04.c:67: TINFO: Attempt to create file using 16384kB huge page size
> memfd_create04.c:72: TPASS: Test failed as expected
> memfd_create04.c:67: TINFO: Attempt to create file using 262144kB huge page size
> memfd_create04.c:72: TPASS: Test failed as expected
> memfd_create04.c:67: TINFO: Attempt to create file using 1048576kB huge page size
> memfd_create04.c:81: TPASS: memfd_create succeeded for 1048576kB page size
> memfd_create04.c:67: TINFO: Attempt to create file using 2097152kB huge page size
> memfd_create04.c:72: TPASS: Test failed as expected
> memfd_create04.c:67: TINFO: Attempt to create file using 16777216kB huge page size
> memfd_create04.c:72: TPASS: Test failed as expected
> 
> Summary:
> passed   9
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
> <<<test_start>>>
> tag=statx06 stime=1620367932
> cmdline="statx06"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
> tst_test.c:889: TINFO: Formatting /dev/loop0 with ext4 opts='-I 256' extra opts=''
> mke2fs 1.44.5 (15-Dec-2018)
> tst_test.c:1313: TINFO: Timeout per run is 0h 25m 00s
> statx06.c:156: TPASS: Birth time Passed
> statx06.c:156: TPASS: Modified time Passed
> statx06.c:156: TPASS: Access time Passed
> statx06.c:156: TPASS: Change time Passed
> 
> Summary:
> passed   4
> failed   0
> broken   0
> skipped  0
> warnings 0
> incrementing stop
> <<<execution_status>>>
> initiation_status="ok"
> duration=1 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=2
> <<<test_end>>>
> INFO: ltp-pan reported some tests FAIL
> LTP Version: 20210121-303-gfad5cecb2
> 
>         ###############################################################
> 
>              Done executing testcases.
>              LTP Version:  20210121-303-gfad5cecb2
>         ###############################################################
> 
> 
> 
> 
> To reproduce:
> 
>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install                job.yaml  # job file is attached in this email
>          bin/lkp split-job --compatible job.yaml  # generate the yaml file for lkp run
>          bin/lkp run                    generated-yaml-file
> 
> 
> 
> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Center
> https://lists.01.org/hyperkitty/list/lkp@lists.01.org       Intel Corporation
> 
> Thanks,
> Oliver Sang
> 

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
