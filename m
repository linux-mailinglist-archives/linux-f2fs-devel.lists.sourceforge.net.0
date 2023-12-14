Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4F98133D2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Dec 2023 16:03:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDnEj-0004S7-5E;
	Thu, 14 Dec 2023 15:02:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1rDnEi-0004S0-78
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 15:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bYNf/fW3Hewt7qAFuRnV3vQsAKL3ALxMCLeT25JzSnY=; b=O4mx6jlzMtIPc9jMdtydUbgZMX
 NSq+Ki1OOemCcfbS+yP2Ced9+btc2lIUD2vvnFzc3+Xu0lTiPi/uG/vuDi1G9SuL9LheklaB2cCFW
 HSW4kRCIaQlRPv10/COe2n0RGweBJqI1zcH+FzvdJY+OWUakmvKwKePR1XQZDBmuJl0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bYNf/fW3Hewt7qAFuRnV3vQsAKL3ALxMCLeT25JzSnY=; b=KDeV+KvC2hAZ3xOFSxsTYLjyOv
 0+Y2zXE8NIU7mc/FuCL3umh60xCwMaXu8zGTu3rs+goOeLlsRD9sv3YRBm9WGYqMOQr7uD645sVHd
 Zgluo/WKgxJQn+YNW1To/8p6Wpg4BjTTy0Mo7aUNLwwoVckv8uG9pAvf9ZmknnBNh624=;
Received: from mgamail.intel.com ([198.175.65.11])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rDnEe-0004ZJ-Et for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 15:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702566169; x=1734102169;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=K4QMrDs/R+gW0X+JDrh3FE6D9PABcWguhFeiollC7bI=;
 b=TIGx3a3//ugAbkSk0FLbt0aSULBDg1QBi9CK4W+aqKikCSgJbWPMThFS
 fGDzj3gXMc5+o7CiAtYWAwImdaY/h2O95mUMxTflLz9Fq/FIs3mJ8J+xD
 /92HiaCHvNTgc1nygzP2fsVl+7xdx8ac6YSRgLI44CYd+Nu5w1Qy7JEfQ
 p/OPg3z26jLLNAYZZ98DR3mEBp6pk1INF02RVznrfV5KZv7ArMawKBybX
 hqIHMWylEDoEHwYChZEnVVV+PcRCX+YUdaLzdcviGq8U1oXv1AbMzbvWO
 OTz3KHyGOA2N9dAmw2iGqU1IWFvgrg6JavgBOnqkdNz6i7wtwI572TjJi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1965567"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1965567"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 07:02:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="808610641"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="808610641"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 14 Dec 2023 07:02:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rDnEO-000MC4-2A;
 Thu, 14 Dec 2023 15:02:32 +0000
Date: Thu, 14 Dec 2023 23:01:56 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@suse.de>, viro@zeniv.linux.org.uk,
 ebiggers@kernel.org, jaegeuk@kernel.org, tytso@mit.edu
Message-ID: <202312142238.71N8cNUB-lkp@intel.com>
References: <20231213234031.1081-7-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231213234031.1081-7-krisman@suse.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Gabriel, kernel test robot noticed the following build
 errors: [auto build test ERROR on jaegeuk-f2fs/dev-test] [also build test
 ERROR on jaegeuk-f2fs/dev tytso-ext4/dev linus/master v6.7-rc5 next-20231214]
 [If your patch is applied to the wrong git tree, kindly [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rDnEe-0004ZJ-Et
Subject: Re: [f2fs-dev] [PATCH 6/8] f2fs: Set the case-insensitive dentry
 operations through ->s_d_op
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Gabriel Krisman Bertazi <krisman@suse.de>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Gabriel,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev tytso-ext4/dev linus/master v6.7-rc5 next-20231214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriel-Krisman-Bertazi/dcache-Add-helper-to-disable-d_revalidate-for-a-specific-dentry/20231214-074322
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20231213234031.1081-7-krisman%40suse.de
patch subject: [PATCH 6/8] f2fs: Set the case-insensitive dentry operations through ->s_d_op
config: x86_64-buildonly-randconfig-002-20231214 (https://download.01.org/0day-ci/archive/20231214/202312142238.71N8cNUB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312142238.71N8cNUB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312142238.71N8cNUB-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/super.c: In function 'f2fs_fill_super':
>> fs/f2fs/super.c:4669:15: error: 'struct super_block' has no member named 's_encoding'
    4669 |         if (sb->s_encoding)
         |               ^~


vim +4669 fs/f2fs/super.c

  4491	
  4492		sb->s_op = &f2fs_sops;
  4493	#ifdef CONFIG_FS_ENCRYPTION
  4494		sb->s_cop = &f2fs_cryptops;
  4495	#endif
  4496	#ifdef CONFIG_FS_VERITY
  4497		sb->s_vop = &f2fs_verityops;
  4498	#endif
  4499		sb->s_xattr = f2fs_xattr_handlers;
  4500		sb->s_export_op = &f2fs_export_ops;
  4501		sb->s_magic = F2FS_SUPER_MAGIC;
  4502		sb->s_time_gran = 1;
  4503		sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
  4504			(test_opt(sbi, POSIX_ACL) ? SB_POSIXACL : 0);
  4505		memcpy(&sb->s_uuid, raw_super->uuid, sizeof(raw_super->uuid));
  4506		sb->s_iflags |= SB_I_CGROUPWB;
  4507	
  4508		/* init f2fs-specific super block info */
  4509		sbi->valid_super_block = valid_super_block;
  4510	
  4511		/* disallow all the data/node/meta page writes */
  4512		set_sbi_flag(sbi, SBI_POR_DOING);
  4513	
  4514		err = f2fs_init_write_merge_io(sbi);
  4515		if (err)
  4516			goto free_bio_info;
  4517	
  4518		init_sb_info(sbi);
  4519	
  4520		err = f2fs_init_iostat(sbi);
  4521		if (err)
  4522			goto free_bio_info;
  4523	
  4524		err = init_percpu_info(sbi);
  4525		if (err)
  4526			goto free_iostat;
  4527	
  4528		if (F2FS_IO_ALIGNED(sbi)) {
  4529			sbi->write_io_dummy =
  4530				mempool_create_page_pool(2 * (F2FS_IO_SIZE(sbi) - 1), 0);
  4531			if (!sbi->write_io_dummy) {
  4532				err = -ENOMEM;
  4533				goto free_percpu;
  4534			}
  4535		}
  4536	
  4537		/* init per sbi slab cache */
  4538		err = f2fs_init_xattr_caches(sbi);
  4539		if (err)
  4540			goto free_io_dummy;
  4541		err = f2fs_init_page_array_cache(sbi);
  4542		if (err)
  4543			goto free_xattr_cache;
  4544	
  4545		/* get an inode for meta space */
  4546		sbi->meta_inode = f2fs_iget(sb, F2FS_META_INO(sbi));
  4547		if (IS_ERR(sbi->meta_inode)) {
  4548			f2fs_err(sbi, "Failed to read F2FS meta data inode");
  4549			err = PTR_ERR(sbi->meta_inode);
  4550			goto free_page_array_cache;
  4551		}
  4552	
  4553		err = f2fs_get_valid_checkpoint(sbi);
  4554		if (err) {
  4555			f2fs_err(sbi, "Failed to get valid F2FS checkpoint");
  4556			goto free_meta_inode;
  4557		}
  4558	
  4559		if (__is_set_ckpt_flags(F2FS_CKPT(sbi), CP_QUOTA_NEED_FSCK_FLAG))
  4560			set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
  4561		if (__is_set_ckpt_flags(F2FS_CKPT(sbi), CP_DISABLED_QUICK_FLAG)) {
  4562			set_sbi_flag(sbi, SBI_CP_DISABLED_QUICK);
  4563			sbi->interval_time[DISABLE_TIME] = DEF_DISABLE_QUICK_INTERVAL;
  4564		}
  4565	
  4566		if (__is_set_ckpt_flags(F2FS_CKPT(sbi), CP_FSCK_FLAG))
  4567			set_sbi_flag(sbi, SBI_NEED_FSCK);
  4568	
  4569		/* Initialize device list */
  4570		err = f2fs_scan_devices(sbi);
  4571		if (err) {
  4572			f2fs_err(sbi, "Failed to find devices");
  4573			goto free_devices;
  4574		}
  4575	
  4576		err = f2fs_init_post_read_wq(sbi);
  4577		if (err) {
  4578			f2fs_err(sbi, "Failed to initialize post read workqueue");
  4579			goto free_devices;
  4580		}
  4581	
  4582		sbi->total_valid_node_count =
  4583					le32_to_cpu(sbi->ckpt->valid_node_count);
  4584		percpu_counter_set(&sbi->total_valid_inode_count,
  4585					le32_to_cpu(sbi->ckpt->valid_inode_count));
  4586		sbi->user_block_count = le64_to_cpu(sbi->ckpt->user_block_count);
  4587		sbi->total_valid_block_count =
  4588					le64_to_cpu(sbi->ckpt->valid_block_count);
  4589		sbi->last_valid_block_count = sbi->total_valid_block_count;
  4590		sbi->reserved_blocks = 0;
  4591		sbi->current_reserved_blocks = 0;
  4592		limit_reserve_root(sbi);
  4593		adjust_unusable_cap_perc(sbi);
  4594	
  4595		f2fs_init_extent_cache_info(sbi);
  4596	
  4597		f2fs_init_ino_entry_info(sbi);
  4598	
  4599		f2fs_init_fsync_node_info(sbi);
  4600	
  4601		/* setup checkpoint request control and start checkpoint issue thread */
  4602		f2fs_init_ckpt_req_control(sbi);
  4603		if (!f2fs_readonly(sb) && !test_opt(sbi, DISABLE_CHECKPOINT) &&
  4604				test_opt(sbi, MERGE_CHECKPOINT)) {
  4605			err = f2fs_start_ckpt_thread(sbi);
  4606			if (err) {
  4607				f2fs_err(sbi,
  4608				    "Failed to start F2FS issue_checkpoint_thread (%d)",
  4609				    err);
  4610				goto stop_ckpt_thread;
  4611			}
  4612		}
  4613	
  4614		/* setup f2fs internal modules */
  4615		err = f2fs_build_segment_manager(sbi);
  4616		if (err) {
  4617			f2fs_err(sbi, "Failed to initialize F2FS segment manager (%d)",
  4618				 err);
  4619			goto free_sm;
  4620		}
  4621		err = f2fs_build_node_manager(sbi);
  4622		if (err) {
  4623			f2fs_err(sbi, "Failed to initialize F2FS node manager (%d)",
  4624				 err);
  4625			goto free_nm;
  4626		}
  4627	
  4628		err = adjust_reserved_segment(sbi);
  4629		if (err)
  4630			goto free_nm;
  4631	
  4632		/* For write statistics */
  4633		sbi->sectors_written_start = f2fs_get_sectors_written(sbi);
  4634	
  4635		/* Read accumulated write IO statistics if exists */
  4636		seg_i = CURSEG_I(sbi, CURSEG_HOT_NODE);
  4637		if (__exist_node_summaries(sbi))
  4638			sbi->kbytes_written =
  4639				le64_to_cpu(seg_i->journal->info.kbytes_written);
  4640	
  4641		f2fs_build_gc_manager(sbi);
  4642	
  4643		err = f2fs_build_stats(sbi);
  4644		if (err)
  4645			goto free_nm;
  4646	
  4647		/* get an inode for node space */
  4648		sbi->node_inode = f2fs_iget(sb, F2FS_NODE_INO(sbi));
  4649		if (IS_ERR(sbi->node_inode)) {
  4650			f2fs_err(sbi, "Failed to read node inode");
  4651			err = PTR_ERR(sbi->node_inode);
  4652			goto free_stats;
  4653		}
  4654	
  4655		/* read root inode and dentry */
  4656		root = f2fs_iget(sb, F2FS_ROOT_INO(sbi));
  4657		if (IS_ERR(root)) {
  4658			f2fs_err(sbi, "Failed to read root inode");
  4659			err = PTR_ERR(root);
  4660			goto free_node_inode;
  4661		}
  4662		if (!S_ISDIR(root->i_mode) || !root->i_blocks ||
  4663				!root->i_size || !root->i_nlink) {
  4664			iput(root);
  4665			err = -EINVAL;
  4666			goto free_node_inode;
  4667		}
  4668	
> 4669		if (sb->s_encoding)
  4670			sb->s_d_op = &generic_ci_dentry_ops;
  4671	
  4672		sb->s_root = d_make_root(root); /* allocate root dentry */
  4673		if (!sb->s_root) {
  4674			err = -ENOMEM;
  4675			goto free_node_inode;
  4676		}
  4677	
  4678		err = f2fs_init_compress_inode(sbi);
  4679		if (err)
  4680			goto free_root_inode;
  4681	
  4682		err = f2fs_register_sysfs(sbi);
  4683		if (err)
  4684			goto free_compress_inode;
  4685	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
