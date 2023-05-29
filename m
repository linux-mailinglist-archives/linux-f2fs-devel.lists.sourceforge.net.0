Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B259C714433
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 May 2023 08:20:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q3WFO-0005vL-LU;
	Mon, 29 May 2023 06:20:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1q3WFM-0005v4-Vl
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 06:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P2VF7xH2EOMTB3G8Uz08l6Cqp1xXMpE4h65gfxdN8kI=; b=hUbpYIAI1FGpNY4nCM7ITx5RAx
 YumuPm0zT0wpXGCAnVTo8TY5cjdq1Zx0YaACVX3GCmyZYaH7VikzkM9kUSSv6EmcFlYl9adRbcW3F
 cK+X4E4rYkJP43d4lRvmdWj3NAtxSi+SksmXSFsJEHvSLTEJZixil8W2xoPwKlrISl84=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P2VF7xH2EOMTB3G8Uz08l6Cqp1xXMpE4h65gfxdN8kI=; b=GVRlQWRiEUHNa+Sz1zUwb/GSpm
 OFbudDUv5wVzq5zrgZJnLt6NhhJ3Yw71VsiSi/hSBFfwlNL6c9kLGmzCMD3X4sbZxP616h17NUGsl
 +iSTqD7AG+QSKu5hXWhxFRRU5dsmxAz8RypdWDsn5oEl5OFKPnuSIbtCYO71fj1b39Ec=;
Received: from mga02.intel.com ([134.134.136.20])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q3WFK-0006LX-AV for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 06:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685341246; x=1716877246;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mY2erTeWwo8KLcT3K3FPJaJOXqKJMG+PRsSCo6Oc9A8=;
 b=jyFY993QxGV57zvdMMj8co8PNsv/g0eFgZJ1u17P0nzqA5xqjD4WZ4lV
 ppHuB9kECr3fwizo7sSx8MJkGTNkMIFcqZPdxLhzrTLdW2xmOO1rzcyFk
 EZ1AhZtuXFmWo2inpgHNL+Sq6wx99qLpVQW0k5DNMloVvcnWCciCIQGwH
 2Gg2zHpy/nOxBcesTWkbowBL7zyViKFsqQj4KdF5C3hehGUl7LMEy9fb9
 bgqfpuPyfp34m+p9UWDCSoCLrFgI+1mc1dO1+M/rWL4hYJb7Am65XUVIK
 JDTj9rUUCIqAN+bSRv/wTtni12QwAL7dE41iLpHK7M7uE3NjxD5ZD0I6d A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="344130749"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="344130749"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2023 23:20:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="952613634"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="952613634"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 28 May 2023 23:20:38 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q3WFC-000Kug-0G;
 Mon, 29 May 2023 06:20:38 +0000
Date: Mon, 29 May 2023 14:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org, chao@kernel.org
Message-ID: <202305291408.kdy2Itan-lkp@intel.com>
References: <20230529013502.2230810-1-shengyong@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230529013502.2230810-1-shengyong@oppo.com>
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Sheng,
 kernel test robot noticed the following build warnings:
 [auto build test WARNING on jaegeuk-f2fs/dev-test] [also build test WARNING
 on jaegeuk-f2fs/dev next-20230525] [cannot apply to linus/master v6.4-rc4]
 [If your patch is applied to the wrong git tree, [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [134.134.136.20 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [134.134.136.20 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q3WFK-0006LX-AV
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on jaegeuk-f2fs/dev next-20230525]
[cannot apply to linus/master v6.4-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sheng-Yong/f2fs-add-f2fs_ioc_-get-set-_extra_attr/20230529-093611
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230529013502.2230810-1-shengyong%40oppo.com
patch subject: [PATCH] f2fs: add f2fs_ioc_[get|set]_extra_attr
config: arc-buildonly-randconfig-r004-20230529 (https://download.01.org/0day-ci/archive/20230529/202305291408.kdy2Itan-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/519a8b3bbd4d743ae67c32dfef61e8bfa0951cc5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sheng-Yong/f2fs-add-f2fs_ioc_-get-set-_extra_attr/20230529-093611
        git checkout 519a8b3bbd4d743ae67c32dfef61e8bfa0951cc5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305291408.kdy2Itan-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/file.c: In function 'f2fs_ioc_get_extra_attr':
>> fs/f2fs/file.c:4312:44: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    4312 |                                            (void __user *)attr.attr))
         |                                            ^
   fs/f2fs/file.c:4316:48: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    4316 |                                                (void __user *)attr.attr))
         |                                                ^


vim +4312 fs/f2fs/file.c

  4262	
  4263	static int f2fs_ioc_get_extra_attr(struct file *filp, unsigned long arg)
  4264	{
  4265		struct inode *inode = file_inode(filp);
  4266		struct f2fs_inode_info *fi = F2FS_I(inode);
  4267		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
  4268		struct f2fs_extra_attr attr;
  4269		u32 chksum;
  4270		int ret = 0;
  4271	
  4272		if (!f2fs_has_extra_attr(inode))
  4273			return -EOPNOTSUPP;
  4274	
  4275		if (copy_from_user(&attr, (void __user *)arg, sizeof(attr)))
  4276			return -EFAULT;
  4277	
  4278		if (attr.field >= F2FS_EXTRA_ATTR_MAX)
  4279			return -EINVAL;
  4280	
  4281		if (!extra_attr_fits_in_inode(inode, attr.field))
  4282			return -EOPNOTSUPP;
  4283	
  4284		switch (attr.field) {
  4285		case F2FS_EXTRA_ATTR_TOTAL_SIZE:
  4286			attr.attr = F2FS_TOTAL_EXTRA_ATTR_SIZE;
  4287			break;
  4288		case F2FS_EXTRA_ATTR_ISIZE:
  4289			attr.attr = fi->i_extra_isize;
  4290			break;
  4291		case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
  4292			if (!f2fs_has_inline_xattr(inode))
  4293				return -EOPNOTSUPP;
  4294			attr.attr = get_inline_xattr_addrs(inode);
  4295			break;
  4296		case F2FS_EXTRA_ATTR_PROJID:
  4297			if (!f2fs_sb_has_project_quota(F2FS_I_SB(inode)))
  4298				return -EOPNOTSUPP;
  4299			attr.attr = from_kprojid(&init_user_ns, fi->i_projid);
  4300			break;
  4301		case F2FS_EXTRA_ATTR_INODE_CHKSUM:
  4302			ret = f2fs_inode_chksum_get(sbi, inode, &chksum);
  4303			if (ret)
  4304				return ret;
  4305			attr.attr = chksum;
  4306			break;
  4307		case F2FS_EXTRA_ATTR_CRTIME:
  4308			if (!f2fs_sb_has_inode_crtime(sbi))
  4309				return -EOPNOTSUPP;
  4310			if (attr.attr_size == sizeof(struct timespec64)) {
  4311				if (put_timespec64(&fi->i_crtime,
> 4312						   (void __user *)attr.attr))
  4313					return -EFAULT;
  4314			} else if (attr.attr_size == sizeof(struct old_timespec32)) {
  4315				if (put_old_timespec32(&fi->i_crtime,
  4316						       (void __user *)attr.attr))
  4317					return -EFAULT;
  4318			} else {
  4319				return -EINVAL;
  4320			}
  4321			break;
  4322		case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
  4323			ret = f2fs_get_compress_blocks(filp, attr.attr_size);
  4324			attr.attr = ret;
  4325			break;
  4326		case F2FS_EXTRA_ATTR_COMPR_OPTION:
  4327			ret = f2fs_get_compress_option_v2(filp, attr.attr,
  4328							  &attr.attr_size);
  4329			break;
  4330		default:
  4331			return -EINVAL;
  4332		}
  4333	
  4334		if (ret < 0)
  4335			return ret;
  4336	
  4337		if (copy_to_user((void __user *)arg, &attr, sizeof(attr)))
  4338			return -EFAULT;
  4339	
  4340		return 0;
  4341	}
  4342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
