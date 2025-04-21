Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57854A9555B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Apr 2025 19:38:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u6v6E-0004VL-Ay;
	Mon, 21 Apr 2025 17:38:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1u6v65-0004V9-3W
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Apr 2025 17:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qah0APVMSGihWRkEoheRa7TGqitqLm7tW0/D3xcCG7s=; b=fqdQbv/Y8/phhHAtzHVniMUlie
 3ChJo2FdiW2XBo5Vp8u+AO+gLUnWGm3vxM9+SV5BEzuzqf67M//7JgW4lMn14htAJ7aaUAAIu3Suv
 4whBbRxzO0bU8waXu+OpnRENzzh+MQ3PUE67O5MxEYp2ObaAXS1NyYz4jGENFyVvxlso=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qah0APVMSGihWRkEoheRa7TGqitqLm7tW0/D3xcCG7s=; b=TQb0ujl5bLxs1jNqIyqdXklO5X
 s3Sy8vG5sunIvYRoBA6HSEjoKL2yX6DzZLWTJtUv4vAGe8G+gAD2iMQb6+4dulDdGwZpAbXuMSinO
 ly7f5ANuAMvuNx6qA+Ytv9cwCj6wsSfg17Z5G/MmOHNpE/zOBaOurYutTNfx3JGH/nmc=;
Received: from mgamail.intel.com ([192.198.163.19])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u6v5l-0005C5-UY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Apr 2025 17:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745257082; x=1776793082;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hooNiE6G7aVzSxlQfny0qh3eg6eQAhLJzoFCEHR1JR4=;
 b=G2yV605Ia9alSA3LndjrRlmL6cfbsiouMqIiI9fLzhgUbYYEd7RcrWFO
 8TJMbVBwWl9j2LyhfOXMIwTJoEK0nG3KLg/JnsqtXyK3Hv4E5NBPxwZXZ
 OTLbjICcgw0OgK4Bxt7Te5X1fYAUPw/XxU9HPELOK4Mcno69sBx8iP01i
 FGfTgpmw1StKeA9kSfal/A1lP8IBgSvuP3pu75WoUayu/HoZfuNzMIfo1
 VAi3tR79C0JD2PvZxMf28E8hme/P2nVBpqCnDiLq1g6uJlb7visNV5arv
 fKCHmjFFb+QJUPXVNFrB8B8b36h+u7Cpog8GB2n7FkQcK1JjZhoDEMcwM A==;
X-CSE-ConnectionGUID: N1d52bHiRpG8hLb3aZrizQ==
X-CSE-MsgGUID: zR3LyWiVT1GASTFrZj4cVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="45917068"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="45917068"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 10:37:51 -0700
X-CSE-ConnectionGUID: vNevb/ajSuu3HXlb4a8tyg==
X-CSE-MsgGUID: cp6oC69sSYe/C/r9kCaF1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="136876064"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 21 Apr 2025 10:37:48 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u6v5W-0000HV-0d;
 Mon, 21 Apr 2025 17:37:46 +0000
Date: Tue, 22 Apr 2025 01:37:44 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <202504220139.19wajgtO-lkp@intel.com>
References: <20250420154647.1233033-6-sandeen@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250420154647.1233033-6-sandeen@redhat.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Eric,
 kernel test robot noticed the following build errors:
 [auto build test ERROR on v6.15-rc3] [also build test ERROR on linus/master]
 [cannot apply to jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev next-20250417] [If
 your patch is applied to the wrong git tree, kin [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.198.163.19 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [192.198.163.19 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [192.198.163.19 listed in sa-trusted.bondedsender.org]
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u6v5l-0005C5-UY
Subject: Re: [f2fs-dev] [PATCH 5/7] f2fs: separate the options parsing and
 options checking
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
Cc: Eric Sandeen <sandeen@redhat.com>, lihongbo22@huawei.com,
 oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.15-rc3]
[also build test ERROR on linus/master]
[cannot apply to jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Sandeen/f2fs-Add-fs-parameter-specifications-for-mount-options/20250421-220156
base:   v6.15-rc3
patch link:    https://lore.kernel.org/r/20250420154647.1233033-6-sandeen%40redhat.com
patch subject: [PATCH 5/7] f2fs: separate the options parsing and options checking
config: i386-buildonly-randconfig-005-20250421 (https://download.01.org/0day-ci/archive/20250422/202504220139.19wajgtO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504220139.19wajgtO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220139.19wajgtO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:31,
                    from include/linux/cpumask.h:11,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/tsc.h:10,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from fs/f2fs/super.c:8:
   fs/f2fs/super.c: In function 'handle_mount_opt':
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   fs/f2fs/f2fs.h:1871:33: note: in expansion of macro 'KERN_ERR'
    1871 |         f2fs_printk(sbi, false, KERN_ERR fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~
   fs/f2fs/super.c:763:25: note: in expansion of macro 'f2fs_err'
     763 |                         f2fs_err(NULL, "inline xattr size is out of range: %lu ~ %lu",
         |                         ^~~~~~~~
   fs/f2fs/super.c: In function 'f2fs_check_quota_consistency':
>> fs/f2fs/super.c:1285:27: error: 'sbi' undeclared (first use in this function); did you mean 'sb'?
    1285 |         if (f2fs_readonly(sbi->sb))
         |                           ^~~
         |                           sb
   fs/f2fs/super.c:1285:27: note: each undeclared identifier is reported only once for each function it appears in


vim +1285 fs/f2fs/super.c

  1182	
  1183	/*
  1184	 * Check quota settings consistency.
  1185	 */
  1186	static int f2fs_check_quota_consistency(struct fs_context *fc,
  1187						struct super_block *sb)
  1188	{
  1189	 #ifdef CONFIG_QUOTA
  1190		struct f2fs_fs_context *ctx = fc->fs_private;
  1191		struct f2fs_sb_info *sbi = F2FS_SB(sb);
  1192		bool quota_feature = f2fs_sb_has_quota_ino(sbi);
  1193		bool quota_turnon = sb_any_quota_loaded(sb);
  1194		char *old_qname, *new_qname;
  1195		bool usr_qf_name, grp_qf_name, prj_qf_name, usrquota, grpquota, prjquota;
  1196		int i;
  1197	
  1198		/*
  1199		 * We do the test below only for project quotas. 'usrquota' and
  1200		 * 'grpquota' mount options are allowed even without quota feature
  1201		 * to support legacy quotas in quota files.
  1202		 */
  1203		if (ctx_test_opt(ctx, F2FS_MOUNT_PRJQUOTA) &&
  1204				!f2fs_sb_has_project_quota(sbi)) {
  1205			f2fs_err(sbi, "Project quota feature not enabled. Cannot enable project quota enforcement.");
  1206			return -EINVAL;
  1207		}
  1208	
  1209		if (ctx->qname_mask) {
  1210			for (i = 0; i < MAXQUOTAS; i++) {
  1211				if (!(ctx->qname_mask & (1 << i)))
  1212					continue;
  1213	
  1214				old_qname = F2FS_OPTION(sbi).s_qf_names[i];
  1215				new_qname = F2FS_CTX_INFO(ctx).s_qf_names[i];
  1216				if (quota_turnon &&
  1217					!!old_qname != !!new_qname)
  1218					goto err_jquota_change;
  1219	
  1220				if (old_qname) {
  1221					if (strcmp(old_qname, new_qname) == 0) {
  1222						ctx->qname_mask &= ~(1 << i);
  1223						continue;
  1224					}
  1225					goto err_jquota_specified;
  1226				}
  1227	
  1228				if (quota_feature) {
  1229					f2fs_info(sbi, "QUOTA feature is enabled, so ignore qf_name");
  1230					ctx->qname_mask &= ~(1 << i);
  1231					kfree(F2FS_CTX_INFO(ctx).s_qf_names[i]);
  1232					F2FS_CTX_INFO(ctx).s_qf_names[i] = NULL;
  1233				}
  1234			}
  1235		}
  1236	
  1237		/* Make sure we don't mix old and new quota format */
  1238		usr_qf_name = F2FS_OPTION(sbi).s_qf_names[USRQUOTA] ||
  1239				F2FS_CTX_INFO(ctx).s_qf_names[USRQUOTA];
  1240		grp_qf_name = F2FS_OPTION(sbi).s_qf_names[GRPQUOTA] ||
  1241				F2FS_CTX_INFO(ctx).s_qf_names[GRPQUOTA];
  1242		prj_qf_name = F2FS_OPTION(sbi).s_qf_names[PRJQUOTA] ||
  1243				F2FS_CTX_INFO(ctx).s_qf_names[PRJQUOTA];
  1244		usrquota = test_opt(sbi, USRQUOTA) ||
  1245				ctx_test_opt(ctx, F2FS_MOUNT_USRQUOTA);
  1246		grpquota = test_opt(sbi, GRPQUOTA) ||
  1247				ctx_test_opt(ctx, F2FS_MOUNT_GRPQUOTA);
  1248		prjquota = test_opt(sbi, PRJQUOTA) ||
  1249				ctx_test_opt(ctx, F2FS_MOUNT_PRJQUOTA);
  1250	
  1251		if (usr_qf_name) {
  1252			ctx_clear_opt(ctx, F2FS_MOUNT_USRQUOTA);
  1253			usrquota = false;
  1254		}
  1255		if (grp_qf_name) {
  1256			ctx_clear_opt(ctx, F2FS_MOUNT_GRPQUOTA);
  1257			grpquota = false;
  1258		}
  1259		if (prj_qf_name) {
  1260			ctx_clear_opt(ctx, F2FS_MOUNT_PRJQUOTA);
  1261			prjquota = false;
  1262		}
  1263		if (usr_qf_name || grp_qf_name || prj_qf_name) {
  1264			if (grpquota || usrquota || prjquota) {
  1265				f2fs_err(sbi, "old and new quota format mixing");
  1266				return -EINVAL;
  1267			}
  1268			if (!(ctx->spec_mask & F2FS_SPEC_jqfmt ||
  1269					F2FS_OPTION(sbi).s_jquota_fmt)) {
  1270				f2fs_err(sbi, "journaled quota format not specified");
  1271				return -EINVAL;
  1272			}
  1273		}
  1274		return 0;
  1275	
  1276	err_jquota_change:
  1277		f2fs_err(sbi, "Cannot change journaled quota options when quota turned on");
  1278		return -EINVAL;
  1279	err_jquota_specified:
  1280		f2fs_err(sbi, "%s quota file already specified",
  1281			 QTYPE2NAME(i));
  1282		return -EINVAL;
  1283	
  1284	#else
> 1285		if (f2fs_readonly(sbi->sb))
  1286			return 0;
  1287		if (f2fs_sb_has_quota_ino(sbi)) {
  1288			f2fs_info(sbi, "Filesystem with quota feature cannot be mounted RDWR without CONFIG_QUOTA");
  1289			return -EINVAL;
  1290		}
  1291		if (f2fs_sb_has_project_quota(sbi)) {
  1292			f2fs_err(sbi, "Filesystem with project quota feature cannot be mounted RDWR without CONFIG_QUOTA");
  1293			return -EINVAL;
  1294		}
  1295	
  1296		return 0;
  1297	#endif
  1298	}
  1299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
