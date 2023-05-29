Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DC47143E3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 May 2023 08:10:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q3W5j-0006Mc-MO;
	Mon, 29 May 2023 06:10:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1q3W5i-0006MW-Lg
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 06:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YsDEysRgpSCC/KOyfwuEe6sOPlu1CEcebSXpEvWf5xk=; b=lEhSbVIHMQhEz6KgIBEGI7lJQh
 Doq0juyEjqTzBAP4qFG2xrG+e6hQvsH2kE5TiUw2gFI7MtEpaB3B0JCTXlp67TPcbWAdSfHq5UxI5
 9x1D0spzJ+rDTielY24imxl94N/FZFvuGRHVShVcvJene9UzZXCxHaYtXOzgcSZwRzU0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YsDEysRgpSCC/KOyfwuEe6sOPlu1CEcebSXpEvWf5xk=; b=Ou2Zeey0JdWFSRZR7l/HxOa4Ux
 cYDx6rn7LaOrz8pXDMz1zE/mxQnqNApae28oGeYJcjgFxvzB87HzAHYDcJAHws5xURl67D6jtbkJg
 u3V9FShVLm3/ynN8jspenNRhlRz8odsjIOsA8b4nXxa6hJS891EDSxz7hj4cInAULEKw=;
Received: from mga14.intel.com ([192.55.52.115])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q3W5e-00069a-9k for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 06:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685340646; x=1716876646;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ui5e+hpJjEMBH055sDXv2DCRvdcgFaCddqy3h5liFdU=;
 b=ITfOsvZY8TEwko0ce5BLdPT5gM80rNEjW31diuxS6fD0woBSXl6zAdS7
 z0JWvd9F8FvD48G11yxKUX1Womw65DgpCKb5fmmgNDTLAAH1enc1X15VA
 yJNobWfOyhwGnM1ZEBFRENSqE0fJYPduwqYw5zngeQHpHty3jPVOYOZF2
 QMLib1srQ4OhJ1aLJGl9HQ8MtBl4HIsyKZZKp3JSAIwRhZnky5EZ8QcIR
 +kjWxFkGiFcTNwCNHmBW5qKHNCXWdBJv+YIqz9bDvSeBrn1ilSeID9sBw
 dAJFAJoLhlSBwF3KgZKfqkxDcGqN93glqwnOKLqZA98DCLCbLN51mt92M A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354643335"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="354643335"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2023 23:10:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="705937923"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="705937923"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 28 May 2023 23:10:38 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q3W5V-000KuQ-2j;
 Mon, 29 May 2023 06:10:37 +0000
Date: Mon, 29 May 2023 14:10:02 +0800
From: kernel test robot <lkp@intel.com>
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org, chao@kernel.org
Message-ID: <202305291323.u3OTwJgK-lkp@intel.com>
References: <20230529013502.2230810-1-shengyong@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230529013502.2230810-1-shengyong@oppo.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Sheng,
 kernel test robot noticed the following build errors:
 [auto build test ERROR on jaegeuk-f2fs/dev-test] [also build test ERROR on
 jaegeuk-f2fs/dev next-20230525] [cannot apply to linus/master v6.4-rc4] [If
 your patch is applied to the wrong git tree, kind [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.115 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q3W5e-00069a-9k
Subject: Re: [f2fs-dev] [PATCH] f2fs: add f2fs_ioc_[get|set]_extra_attr
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Sheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev next-20230525]
[cannot apply to linus/master v6.4-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sheng-Yong/f2fs-add-f2fs_ioc_-get-set-_extra_attr/20230529-093611
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230529013502.2230810-1-shengyong%40oppo.com
patch subject: [PATCH] f2fs: add f2fs_ioc_[get|set]_extra_attr
config: i386-randconfig-i086-20230529 (https://download.01.org/0day-ci/archive/20230529/202305291323.u3OTwJgK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/519a8b3bbd4d743ae67c32dfef61e8bfa0951cc5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sheng-Yong/f2fs-add-f2fs_ioc_-get-set-_extra_attr/20230529-093611
        git checkout 519a8b3bbd4d743ae67c32dfef61e8bfa0951cc5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305291323.u3OTwJgK-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/f2fs/file.o: in function `f2fs_set_compress_option_v2':
>> fs/f2fs/file.c:3996: undefined reference to `zstd_max_clevel'


vim +3996 fs/f2fs/file.c

  3957	
  3958	static int f2fs_set_compress_option_v2(struct file *filp,
  3959					       unsigned long attr, __u16 *attr_size)
  3960	{
  3961		struct inode *inode = file_inode(filp);
  3962		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
  3963		struct f2fs_comp_option_v2 option;
  3964		int ret = 0;
  3965	
  3966		if (sizeof(option) < *attr_size)
  3967			*attr_size = sizeof(option);
  3968	
  3969		if (!f2fs_sb_has_compression(sbi))
  3970			return -EOPNOTSUPP;
  3971	
  3972		if (!(filp->f_mode & FMODE_WRITE))
  3973			return -EBADF;
  3974	
  3975		if (copy_from_user(&option, (void __user *)attr, *attr_size))
  3976			return -EFAULT;
  3977	
  3978		if (!f2fs_compressed_file(inode) ||
  3979				option.log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
  3980				option.log_cluster_size > MAX_COMPRESS_LOG_SIZE ||
  3981				option.algorithm >= COMPRESS_MAX)
  3982			return -EINVAL;
  3983	
  3984		if (*attr_size == sizeof(struct f2fs_comp_option_v2)) {
  3985			if (option.level != 0) {
  3986				switch (option.algorithm) {
  3987				case COMPRESS_LZO:
  3988				case COMPRESS_LZORLE:
  3989					return -EINVAL;
  3990				case COMPRESS_LZ4:
  3991					if (option.level < LZ4HC_MIN_CLEVEL ||
  3992					    option.level > LZ4HC_MAX_CLEVEL)
  3993						return -EINVAL;
  3994					break;
  3995				case COMPRESS_ZSTD:
> 3996					if (option.level > zstd_max_clevel())
  3997						return -EINVAL;
  3998					break;
  3999				}
  4000			}
  4001	
  4002			if (option.flag > BIT(COMPRESS_MAX_FLAG) - 1)
  4003				return -EINVAL;
  4004		}
  4005	
  4006		file_start_write(filp);
  4007		inode_lock(inode);
  4008	
  4009		if (f2fs_is_mmap_file(inode) || get_dirty_pages(inode)) {
  4010			ret = -EBUSY;
  4011			goto out;
  4012		}
  4013	
  4014		if (F2FS_HAS_BLOCKS(inode)) {
  4015			ret = -EFBIG;
  4016			goto out;
  4017		}
  4018	
  4019		F2FS_I(inode)->i_compress_algorithm = option.algorithm;
  4020		F2FS_I(inode)->i_log_cluster_size = option.log_cluster_size;
  4021		F2FS_I(inode)->i_cluster_size = BIT(option.log_cluster_size);
  4022		if (*attr_size == sizeof(struct f2fs_comp_option_v2)) {
  4023			F2FS_I(inode)->i_compress_level = option.level;
  4024			F2FS_I(inode)->i_compress_flag = option.flag;
  4025		}
  4026		f2fs_mark_inode_dirty_sync(inode, true);
  4027	
  4028		if (!f2fs_is_compress_backend_ready(inode))
  4029			f2fs_warn(sbi, "compression algorithm is successfully set, "
  4030				"but current kernel doesn't support this algorithm.");
  4031	out:
  4032		inode_unlock(inode);
  4033		file_end_write(filp);
  4034	
  4035		return ret;
  4036	}
  4037	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
