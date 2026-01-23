Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP12Lhotc2mTswAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 09:11:06 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD16372412
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 09:11:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Message-ID:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JLjBpUskXVsBPgbggqR5d3ANZ516ZdXYe9ZyEPQcGXY=; b=Y1/fUuJ/1bagqP24P9nxhIAz5i
	B26x+aokWpvoIskkjDylBfGrjkV87YhfQZTIdkazBS4bx4u3dBUXXEmveOJxcQz48CSe2Bd8GtcD7
	/Ho85NYYDsNjhebvs8jIgsPNgopXC2kWbCEawHUMJwgwBpkyBo58hUGAL0EQjx1R7GA4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vjCFs-0004Gc-TS;
	Fri, 23 Jan 2026 08:10:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1vjCFq-0004GU-Pj
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 08:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lUpLoUgcbuWRRLWEioUDDOCyWcYoKwBIT+ZQTR0lYt0=; b=YtzZz6vyCbgYyNL4xsoMXYDvVZ
 Q1TIdc6hnF4XUK9/iW0QEmK+/qH6SgTJ6ZjTGSbZ7zuf12MnAhJUun1W4OfeMfskwjWJrztvTH454
 XSge+uwRy4OA6TpMJNZo1o4yVpMe/FR0+VZ0c97tQZYiqZ9PRs66KzljJUThdzitVYpM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lUpLoUgcbuWRRLWEioUDDOCyWcYoKwBIT+ZQTR0lYt0=; b=jAE1mp73053oGEshucE0XcPIvx
 29CpMJr+NnB4Mmbbh4n7FbuTowtOHl9MFZ5V/GP1JSKuUvV5ZkazYxqa8vfbKMR6GlvyCTateaVue
 HnpDjt+afNsnEHYv/77zNj8d/HxML36RO0gMC+9QN12kwb5GvgF2YvJAEWVYp04H9kPM=;
Received: from mgamail.intel.com ([198.175.65.10])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vjCFp-0004zq-3m for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 08:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769155853; x=1800691853;
 h=date:from:to:cc:subject:message-id;
 bh=l9sCVSY0TKMup4nUdCf3W9MauEuh7aGmrJVzGwUwwq8=;
 b=iMUlurTaD7mEFk0foF1IHnJw3jeV4Q6gIg+zQVRRyr+aWd07uUjBW5TC
 cK+FNrkIv+36dH9TxQCjb5OzmRgaSXV09EqXvvb9g8n0KL1S4AjXMUG3o
 XAByFE0BHJsqefMNm0znTH/Gs42KyIvu9mEqyjwMlgzTAFz6+H2K0Vgaw
 ZDNX9rQv3ExblsIk527Aua6RcljcId0NnKQeR/sWD1Ytv6+z3/sDHDv3q
 Xe3y3atKZJ8bV49wNrUHXj+s+9XXFQoXlDpkn8nJTzCw7Zy8Xrqx6Jls7
 BJIPXlzQlIoQYRJnGyzoOCBQjWdgh5zkXcFjLxZmpDGwn1fQDUzDl+92b g==;
X-CSE-ConnectionGUID: FK90GdbbRxOZ5rEmS5e4fg==
X-CSE-MsgGUID: t6txctnfRkuCXImFscmErw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87825762"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="87825762"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 00:10:42 -0800
X-CSE-ConnectionGUID: 2I0irov8TYeVAeW+ET+2Bw==
X-CSE-MsgGUID: EGeZMTk6TtGnkxAliPD+BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="211833503"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 23 Jan 2026 00:10:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vjCFZ-00000000TgE-3qa4;
 Fri, 23 Jan 2026 08:10:37 +0000
Date: Fri, 23 Jan 2026 16:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <202601231548.QEwx4P4A-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: 6ca0ae2d1e3271ca995e87f942dcecc1bb4712eb commit:
 e2bd63c9a1e4ebc923bf64754e32f054615ba543
 [49/50] f2fs: check skip [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vjCFp-0004zq-3m
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 49/50] fs/f2fs/debug.c:458:49:
 warning: '%s' directive argument is null
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 oe-kbuild-all@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:oe-kbuild-all@lists.linux.dev,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,intel.com:s=Intel];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.950];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,intel.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:mid,intel.com:email,vivo.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: BD16372412
X-Rspamd-Action: no action

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   6ca0ae2d1e3271ca995e87f942dcecc1bb4712eb
commit: e2bd63c9a1e4ebc923bf64754e32f054615ba543 [49/50] f2fs: check skipped write in f2fs_enable_checkpoint()
config: sparc-randconfig-r112-20260123 (https://download.01.org/0day-ci/archive/20260123/202601231548.QEwx4P4A-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231548.QEwx4P4A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231548.QEwx4P4A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/debug.c: In function 'stat_show':
>> fs/f2fs/debug.c:458:49: warning: '%s' directive argument is null [-Wformat-overflow=]
     458 |                                 seq_printf(s, " %s", s_flag[j]);
         |                                                 ^~


vim +458 fs/f2fs/debug.c

f2e357893cb7d1 Yangtao Li         2023-02-13  438  
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  439  static int stat_show(struct seq_file *s, void *v)
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  440  {
145b04e5ed6603 majianpeng         2013-05-14  441  	struct f2fs_stat_info *si;
b6d9246d0315c7 Yangtao Li         2021-08-11  442  	int i = 0, j = 0;
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  443  
90d5c9ba3ed919 Chao Yu            2025-06-11  444  	spin_lock(&f2fs_stat_lock);
145b04e5ed6603 majianpeng         2013-05-14  445  	list_for_each_entry(si, &f2fs_stat_list, stat_list) {
dda7d77bcd424c Yangtao Li         2023-02-13  446  		struct f2fs_sb_info *sbi = si->sbi;
dda7d77bcd424c Yangtao Li         2023-02-13  447  
dda7d77bcd424c Yangtao Li         2023-02-13  448  		update_general_status(sbi);
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  449  
b6d9246d0315c7 Yangtao Li         2021-08-11  450  		seq_printf(s, "\n=====[ partition info(%pg). #%d, %s, CP: %s]=====\n",
dda7d77bcd424c Yangtao Li         2023-02-13  451  			sbi->sb->s_bdev, i++,
dda7d77bcd424c Yangtao Li         2023-02-13  452  			f2fs_readonly(sbi->sb) ? "RO" : "RW",
dda7d77bcd424c Yangtao Li         2023-02-13  453  			is_set_ckpt_flags(sbi, CP_DISABLED_FLAG) ?
dda7d77bcd424c Yangtao Li         2023-02-13  454  			"Disabled" : (f2fs_cp_error(sbi) ? "Error" : "Good"));
dda7d77bcd424c Yangtao Li         2023-02-13  455  		if (sbi->s_flag) {
b6d9246d0315c7 Yangtao Li         2021-08-11  456  			seq_puts(s, "[SBI:");
5bb9c111cd98ad Yangtao Li         2023-03-08  457  			for_each_set_bit(j, &sbi->s_flag, MAX_SBI_FLAG)
5bb9c111cd98ad Yangtao Li         2023-03-08 @458  				seq_printf(s, " %s", s_flag[j]);
b6d9246d0315c7 Yangtao Li         2021-08-11  459  			seq_puts(s, "]\n");
b6d9246d0315c7 Yangtao Li         2021-08-11  460  		}
7880ceedec55fb Huajun Li          2012-12-31  461  		seq_printf(s, "[SB: 1] [CP: 2] [SIT: %d] [NAT: %d] ",
7880ceedec55fb Huajun Li          2012-12-31  462  			   si->sit_area_segs, si->nat_area_segs);
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  463  		seq_printf(s, "[SSA: %d] [MAIN: %d",
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  464  			   si->ssa_area_segs, si->main_area_segs);
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  465  		seq_printf(s, "(OverProv:%d Resv:%d)]\n\n",
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  466  			   si->overp_segs, si->rsvd_segs);
a7e679b53393c7 Jaegeuk Kim        2020-02-25  467  		seq_printf(s, "Current Time Sec: %llu / Mounted Time Sec: %llu\n\n",
a7e679b53393c7 Jaegeuk Kim        2020-02-25  468  					ktime_get_boottime_seconds(),
dda7d77bcd424c Yangtao Li         2023-02-13  469  					SIT_I(sbi)->mounted_time);
f2e357893cb7d1 Yangtao Li         2023-02-13  470  
f2e357893cb7d1 Yangtao Li         2023-02-13  471  		seq_puts(s, "Policy:\n");
f2e357893cb7d1 Yangtao Li         2023-02-13  472  		seq_puts(s, "  - IPU: [");
dda7d77bcd424c Yangtao Li         2023-02-13  473  		if (IS_F2FS_IPU_DISABLE(sbi)) {
f2e357893cb7d1 Yangtao Li         2023-02-13  474  			seq_puts(s, " DISABLE");
f2e357893cb7d1 Yangtao Li         2023-02-13  475  		} else {
dda7d77bcd424c Yangtao Li         2023-02-13  476  			unsigned long policy = SM_I(sbi)->ipu_policy;
f2e357893cb7d1 Yangtao Li         2023-02-13  477  
f2e357893cb7d1 Yangtao Li         2023-02-13  478  			for_each_set_bit(j, &policy, F2FS_IPU_MAX)
f2e357893cb7d1 Yangtao Li         2023-02-13  479  				seq_printf(s, " %s", ipu_mode_names[j]);
f2e357893cb7d1 Yangtao Li         2023-02-13  480  		}
f2e357893cb7d1 Yangtao Li         2023-02-13  481  		seq_puts(s, " ]\n\n");
f2e357893cb7d1 Yangtao Li         2023-02-13  482  
dda7d77bcd424c Yangtao Li         2023-02-13  483  		if (test_opt(sbi, DISCARD))
f83a2584cae8f4 Yunlei He          2016-08-18  484  			seq_printf(s, "Utilization: %u%% (%u valid blocks, %u discard blocks)\n",
f83a2584cae8f4 Yunlei He          2016-08-18  485  				si->utilization, si->valid_count, si->discard_blks);
f83a2584cae8f4 Yunlei He          2016-08-18  486  		else
f83a2584cae8f4 Yunlei He          2016-08-18  487  			seq_printf(s, "Utilization: %u%% (%u valid blocks)\n",
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  488  				si->utilization, si->valid_count);
f83a2584cae8f4 Yunlei He          2016-08-18  489  
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  490  		seq_printf(s, "  - Node: %u (Inode: %u, ",
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  491  			   si->valid_node_count, si->valid_inode_count);
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  492  		seq_printf(s, "Other: %u)\n  - Data: %u\n",
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  493  			   si->valid_node_count - si->valid_inode_count,
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  494  			   si->valid_count - si->valid_node_count);
d5e8f6c9800c38 Chao Yu            2015-07-15  495  		seq_printf(s, "  - Inline_xattr Inode: %u\n",
d5e8f6c9800c38 Chao Yu            2015-07-15  496  			   si->inline_xattr);
0dbdc2ae9bba0a Jaegeuk Kim        2013-11-26  497  		seq_printf(s, "  - Inline_data Inode: %u\n",
0dbdc2ae9bba0a Jaegeuk Kim        2013-11-26  498  			   si->inline_inode);
3289c061c5aaf9 Jaegeuk Kim        2014-10-13  499  		seq_printf(s, "  - Inline_dentry Inode: %u\n",
3289c061c5aaf9 Jaegeuk Kim        2014-10-13  500  			   si->inline_dir);
ae999bb9a33995 Daeho Jeong        2020-08-31  501  		seq_printf(s, "  - Compressed Inode: %u, Blocks: %llu\n",
4c8ff7095bef64 Chao Yu            2019-11-01  502  			   si->compr_inode, si->compr_blocks);
8ec071c363da3f Chao Yu            2022-10-04  503  		seq_printf(s, "  - Swapfile Inode: %u\n",
8ec071c363da3f Chao Yu            2022-10-04  504  			   si->swapfile_inode);
ef0c333cad8d19 Jaegeuk Kim        2025-01-31  505  		seq_printf(s, "  - Donate Inode: %u\n",
ef0c333cad8d19 Jaegeuk Kim        2025-01-31  506  			   si->ndonate_files);
a00861dbca9135 Jaegeuk Kim        2017-02-01  507  		seq_printf(s, "  - Orphan/Append/Update Inode: %u, %u, %u\n",
a00861dbca9135 Jaegeuk Kim        2017-02-01  508  			   si->orphans, si->append, si->update);
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  509  		seq_printf(s, "\nMain area: %d segs, %d secs %d zones\n",
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  510  			   si->main_area_segs, si->main_area_sections,
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  511  			   si->main_area_zones);
8f11fe52fc1fa3 Chao Yu            2025-11-28  512  		seq_printf(s, "    TYPE         %8s %8s %8s %8s %10s %10s %10s\n",
8f11fe52fc1fa3 Chao Yu            2025-11-28  513  			   "blkoff", "segno", "secno", "zoneno", "dirty_seg", "full_seg", "valid_blk");
8f11fe52fc1fa3 Chao Yu            2025-11-28  514  		seq_printf(s, "  - COLD   data: %8d %8d %8d %8d %10u %10u %10u\n",
8f11fe52fc1fa3 Chao Yu            2025-11-28  515  			   si->blkoff[CURSEG_COLD_DATA],
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  516  			   si->curseg[CURSEG_COLD_DATA],
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  517  			   si->cursec[CURSEG_COLD_DATA],
0759e2c151f47b Chao Yu            2020-06-28  518  			   si->curzone[CURSEG_COLD_DATA],
0759e2c151f47b Chao Yu            2020-06-28  519  			   si->dirty_seg[CURSEG_COLD_DATA],
0759e2c151f47b Chao Yu            2020-06-28  520  			   si->full_seg[CURSEG_COLD_DATA],
0759e2c151f47b Chao Yu            2020-06-28  521  			   si->valid_blks[CURSEG_COLD_DATA]);
8f11fe52fc1fa3 Chao Yu            2025-11-28  522  		seq_printf(s, "  - WARM   data: %8d %8d %8d %8d %10u %10u %10u\n",
8f11fe52fc1fa3 Chao Yu            2025-11-28  523  			   si->blkoff[CURSEG_WARM_DATA],
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  524  			   si->curseg[CURSEG_WARM_DATA],
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  525  			   si->cursec[CURSEG_WARM_DATA],
0759e2c151f47b Chao Yu            2020-06-28  526  			   si->curzone[CURSEG_WARM_DATA],
0759e2c151f47b Chao Yu            2020-06-28  527  			   si->dirty_seg[CURSEG_WARM_DATA],
0759e2c151f47b Chao Yu            2020-06-28  528  			   si->full_seg[CURSEG_WARM_DATA],
0759e2c151f47b Chao Yu            2020-06-28  529  			   si->valid_blks[CURSEG_WARM_DATA]);
8f11fe52fc1fa3 Chao Yu            2025-11-28  530  		seq_printf(s, "  - HOT    data: %8d %8d %8d %8d %10u %10u %10u\n",
8f11fe52fc1fa3 Chao Yu            2025-11-28  531  			   si->blkoff[CURSEG_HOT_DATA],
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  532  			   si->curseg[CURSEG_HOT_DATA],
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  533  			   si->cursec[CURSEG_HOT_DATA],
0759e2c151f47b Chao Yu            2020-06-28  534  			   si->curzone[CURSEG_HOT_DATA],
0759e2c151f47b Chao Yu            2020-06-28  535  			   si->dirty_seg[CURSEG_HOT_DATA],
0759e2c151f47b Chao Yu            2020-06-28  536  			   si->full_seg[CURSEG_HOT_DATA],
0759e2c151f47b Chao Yu            2020-06-28  537  			   si->valid_blks[CURSEG_HOT_DATA]);
8f11fe52fc1fa3 Chao Yu            2025-11-28  538  		seq_printf(s, "  - Dir   dnode: %8d %8d %8d %8d %10u %10u %10u\n",
8f11fe52fc1fa3 Chao Yu            2025-11-28  539  			   si->blkoff[CURSEG_HOT_NODE],
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  540  			   si->curseg[CURSEG_HOT_NODE],
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  541  			   si->cursec[CURSEG_HOT_NODE],
0759e2c151f47b Chao Yu            2020-06-28  542  			   si->curzone[CURSEG_HOT_NODE],
0759e2c151f47b Chao Yu            2020-06-28  543  			   si->dirty_seg[CURSEG_HOT_NODE],
0759e2c151f47b Chao Yu            2020-06-28  544  			   si->full_seg[CURSEG_HOT_NODE],
0759e2c151f47b Chao Yu            2020-06-28  545  			   si->valid_blks[CURSEG_HOT_NODE]);
8f11fe52fc1fa3 Chao Yu            2025-11-28  546  		seq_printf(s, "  - File  dnode: %8d %8d %8d %8d %10u %10u %10u\n",
8f11fe52fc1fa3 Chao Yu            2025-11-28  547  			   si->blkoff[CURSEG_WARM_NODE],
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  548  			   si->curseg[CURSEG_WARM_NODE],
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  549  			   si->cursec[CURSEG_WARM_NODE],
0759e2c151f47b Chao Yu            2020-06-28  550  			   si->curzone[CURSEG_WARM_NODE],
0759e2c151f47b Chao Yu            2020-06-28  551  			   si->dirty_seg[CURSEG_WARM_NODE],
0759e2c151f47b Chao Yu            2020-06-28  552  			   si->full_seg[CURSEG_WARM_NODE],
0759e2c151f47b Chao Yu            2020-06-28  553  			   si->valid_blks[CURSEG_WARM_NODE]);
8f11fe52fc1fa3 Chao Yu            2025-11-28  554  		seq_printf(s, "  - Indir nodes: %8d %8d %8d %8d %10u %10u %10u\n",
8f11fe52fc1fa3 Chao Yu            2025-11-28  555  			   si->blkoff[CURSEG_COLD_NODE],
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  556  			   si->curseg[CURSEG_COLD_NODE],
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  557  			   si->cursec[CURSEG_COLD_NODE],
0759e2c151f47b Chao Yu            2020-06-28  558  			   si->curzone[CURSEG_COLD_NODE],
0759e2c151f47b Chao Yu            2020-06-28  559  			   si->dirty_seg[CURSEG_COLD_NODE],
0759e2c151f47b Chao Yu            2020-06-28  560  			   si->full_seg[CURSEG_COLD_NODE],
0759e2c151f47b Chao Yu            2020-06-28  561  			   si->valid_blks[CURSEG_COLD_NODE]);
8f11fe52fc1fa3 Chao Yu            2025-11-28  562  		seq_printf(s, "  - Pinned file: %8d %8d %8d %8d\n",
8f11fe52fc1fa3 Chao Yu            2025-11-28  563  			   si->blkoff[CURSEG_COLD_DATA_PINNED],
d0b9e42ab6155d Chao Yu            2020-08-04  564  			   si->curseg[CURSEG_COLD_DATA_PINNED],
d0b9e42ab6155d Chao Yu            2020-08-04  565  			   si->cursec[CURSEG_COLD_DATA_PINNED],
d0b9e42ab6155d Chao Yu            2020-08-04  566  			   si->curzone[CURSEG_COLD_DATA_PINNED]);
8f11fe52fc1fa3 Chao Yu            2025-11-28  567  		seq_printf(s, "  - ATGC   data: %8d %8d %8d %8d\n",
8f11fe52fc1fa3 Chao Yu            2025-11-28  568  			   si->blkoff[CURSEG_ALL_DATA_ATGC],
093749e296e29a Chao Yu            2020-08-04  569  			   si->curseg[CURSEG_ALL_DATA_ATGC],
093749e296e29a Chao Yu            2020-08-04  570  			   si->cursec[CURSEG_ALL_DATA_ATGC],
093749e296e29a Chao Yu            2020-08-04  571  			   si->curzone[CURSEG_ALL_DATA_ATGC]);
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  572  		seq_printf(s, "\n  - Valid: %d\n  - Dirty: %d\n",
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  573  			   si->main_area_segs - si->dirty_count -
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  574  			   si->prefree_count - si->free_segs,
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  575  			   si->dirty_count);
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  576  		seq_printf(s, "  - Prefree: %d\n  - Free: %d (%d)\n\n",
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  577  			   si->prefree_count, si->free_segs, si->free_secs);
2d56b4e39192fb Chao Yu            2024-10-16  578  		if (f2fs_is_multi_device(sbi)) {
2d56b4e39192fb Chao Yu            2024-10-16  579  			seq_puts(s, "Multidevice stats:\n");
2d56b4e39192fb Chao Yu            2024-10-16  580  			seq_printf(s, "  [seg:   %8s %8s %8s %8s %8s]",
2d56b4e39192fb Chao Yu            2024-10-16  581  					"inuse", "dirty", "full", "free", "prefree");
2d56b4e39192fb Chao Yu            2024-10-16  582  			if (__is_large_section(sbi))
2d56b4e39192fb Chao Yu            2024-10-16  583  				seq_printf(s, " [sec:   %8s %8s %8s %8s %8s]\n",
2d56b4e39192fb Chao Yu            2024-10-16  584  					"inuse", "dirty", "full", "free", "prefree");
2d56b4e39192fb Chao Yu            2024-10-16  585  			else
2d56b4e39192fb Chao Yu            2024-10-16  586  				seq_puts(s, "\n");
2d56b4e39192fb Chao Yu            2024-10-16  587  
2d56b4e39192fb Chao Yu            2024-10-16  588  			for (i = 0; i < sbi->s_ndevs; i++) {
2d56b4e39192fb Chao Yu            2024-10-16  589  				seq_printf(s, "  #%-2d     %8u %8u %8u %8u %8u", i,
2d56b4e39192fb Chao Yu            2024-10-16  590  					si->dev_stats[i].devstats[0][DEVSTAT_INUSE],
2d56b4e39192fb Chao Yu            2024-10-16  591  					si->dev_stats[i].devstats[0][DEVSTAT_DIRTY],
2d56b4e39192fb Chao Yu            2024-10-16  592  					si->dev_stats[i].devstats[0][DEVSTAT_FULL],
2d56b4e39192fb Chao Yu            2024-10-16  593  					si->dev_stats[i].devstats[0][DEVSTAT_FREE],
2d56b4e39192fb Chao Yu            2024-10-16  594  					si->dev_stats[i].devstats[0][DEVSTAT_PREFREE]);
2d56b4e39192fb Chao Yu            2024-10-16  595  				if (!__is_large_section(sbi)) {
2d56b4e39192fb Chao Yu            2024-10-16  596  					seq_puts(s, "\n");
2d56b4e39192fb Chao Yu            2024-10-16  597  					continue;
2d56b4e39192fb Chao Yu            2024-10-16  598  				}
2d56b4e39192fb Chao Yu            2024-10-16  599  				seq_printf(s, "          %8u %8u %8u %8u %8u\n",
2d56b4e39192fb Chao Yu            2024-10-16  600  					si->dev_stats[i].devstats[1][DEVSTAT_INUSE],
2d56b4e39192fb Chao Yu            2024-10-16  601  					si->dev_stats[i].devstats[1][DEVSTAT_DIRTY],
2d56b4e39192fb Chao Yu            2024-10-16  602  					si->dev_stats[i].devstats[1][DEVSTAT_FULL],
2d56b4e39192fb Chao Yu            2024-10-16  603  					si->dev_stats[i].devstats[1][DEVSTAT_FREE],
2d56b4e39192fb Chao Yu            2024-10-16  604  					si->dev_stats[i].devstats[1][DEVSTAT_PREFREE]);
2d56b4e39192fb Chao Yu            2024-10-16  605  			}
2d56b4e39192fb Chao Yu            2024-10-16  606  			seq_puts(s, "\n");
2d56b4e39192fb Chao Yu            2024-10-16  607  		}
42190d2a8663f3 Jaegeuk Kim        2016-01-09  608  		seq_printf(s, "CP calls: %d (BG: %d)\n",
eb61c2cca2eb21 Chao Yu            2023-08-08  609  			   si->cp_call_count[TOTAL_CALL],
eb61c2cca2eb21 Chao Yu            2023-08-08  610  			   si->cp_call_count[BACKGROUND]);
eb61c2cca2eb21 Chao Yu            2023-08-08  611  		seq_printf(s, "CP count: %d\n", si->cp_count);
b63e7be5908cb7 Chao Yu            2018-09-29  612  		seq_printf(s, "  - cp blocks : %u\n", si->meta_count[META_CP]);
b63e7be5908cb7 Chao Yu            2018-09-29  613  		seq_printf(s, "  - sit blocks : %u\n",
b63e7be5908cb7 Chao Yu            2018-09-29  614  				si->meta_count[META_SIT]);
b63e7be5908cb7 Chao Yu            2018-09-29  615  		seq_printf(s, "  - nat blocks : %u\n",
b63e7be5908cb7 Chao Yu            2018-09-29  616  				si->meta_count[META_NAT]);
b63e7be5908cb7 Chao Yu            2018-09-29  617  		seq_printf(s, "  - ssa blocks : %u\n",
b63e7be5908cb7 Chao Yu            2018-09-29  618  				si->meta_count[META_SSA]);
7411143f202153 Yangtao Li         2022-11-29  619  		seq_puts(s, "CP merge:\n");
7411143f202153 Yangtao Li         2022-11-29  620  		seq_printf(s, "  - Queued : %4d\n", si->nr_queued_ckpt);
7411143f202153 Yangtao Li         2022-11-29  621  		seq_printf(s, "  - Issued : %4d\n", si->nr_issued_ckpt);
7411143f202153 Yangtao Li         2022-11-29  622  		seq_printf(s, "  - Total : %4d\n", si->nr_total_ckpt);
7411143f202153 Yangtao Li         2022-11-29  623  		seq_printf(s, "  - Cur time : %4d(ms)\n", si->cur_ckpt_time);
7411143f202153 Yangtao Li         2022-11-29  624  		seq_printf(s, "  - Peak time : %4d(ms)\n", si->peak_ckpt_time);
9bf1dcbdfdc889 Chao Yu            2023-08-08  625  		seq_printf(s, "GC calls: %d (gc_thread: %d)\n",
9bf1dcbdfdc889 Chao Yu            2023-08-08  626  			   si->gc_call_count[BACKGROUND] +
9bf1dcbdfdc889 Chao Yu            2023-08-08  627  			   si->gc_call_count[FOREGROUND],
9bf1dcbdfdc889 Chao Yu            2023-08-08  628  			   si->gc_call_count[BACKGROUND]);
9bf1dcbdfdc889 Chao Yu            2023-08-08  629  		if (__is_large_section(sbi)) {
9bf1dcbdfdc889 Chao Yu            2023-08-08  630  			seq_printf(s, "  - data sections : %d (BG: %d)\n",
9bf1dcbdfdc889 Chao Yu            2023-08-08  631  					si->gc_secs[DATA][BG_GC] + si->gc_secs[DATA][FG_GC],
9bf1dcbdfdc889 Chao Yu            2023-08-08  632  					si->gc_secs[DATA][BG_GC]);
9bf1dcbdfdc889 Chao Yu            2023-08-08  633  			seq_printf(s, "  - node sections : %d (BG: %d)\n",
9bf1dcbdfdc889 Chao Yu            2023-08-08  634  					si->gc_secs[NODE][BG_GC] + si->gc_secs[NODE][FG_GC],
9bf1dcbdfdc889 Chao Yu            2023-08-08  635  					si->gc_secs[NODE][BG_GC]);
9bf1dcbdfdc889 Chao Yu            2023-08-08  636  		}
9bf1dcbdfdc889 Chao Yu            2023-08-08  637  		seq_printf(s, "  - data segments : %d (BG: %d)\n",
9bf1dcbdfdc889 Chao Yu            2023-08-08  638  				si->gc_segs[DATA][BG_GC] + si->gc_segs[DATA][FG_GC],
9bf1dcbdfdc889 Chao Yu            2023-08-08  639  				si->gc_segs[DATA][BG_GC]);
9bf1dcbdfdc889 Chao Yu            2023-08-08  640  		seq_printf(s, "  - node segments : %d (BG: %d)\n",
9bf1dcbdfdc889 Chao Yu            2023-08-08  641  				si->gc_segs[NODE][BG_GC] + si->gc_segs[NODE][FG_GC],
9bf1dcbdfdc889 Chao Yu            2023-08-08  642  				si->gc_segs[NODE][BG_GC]);
7411143f202153 Yangtao Li         2022-11-29  643  		seq_puts(s, "  - Reclaimed segs :\n");
dda7d77bcd424c Yangtao Li         2023-02-13  644  		seq_printf(s, "    - Normal : %d\n", sbi->gc_reclaimed_segs[GC_NORMAL]);
dda7d77bcd424c Yangtao Li         2023-02-13  645  		seq_printf(s, "    - Idle CB : %d\n", sbi->gc_reclaimed_segs[GC_IDLE_CB]);
7411143f202153 Yangtao Li         2022-11-29  646  		seq_printf(s, "    - Idle Greedy : %d\n",
dda7d77bcd424c Yangtao Li         2023-02-13  647  				sbi->gc_reclaimed_segs[GC_IDLE_GREEDY]);
dda7d77bcd424c Yangtao Li         2023-02-13  648  		seq_printf(s, "    - Idle AT : %d\n", sbi->gc_reclaimed_segs[GC_IDLE_AT]);
7411143f202153 Yangtao Li         2022-11-29  649  		seq_printf(s, "    - Urgent High : %d\n",
dda7d77bcd424c Yangtao Li         2023-02-13  650  				sbi->gc_reclaimed_segs[GC_URGENT_HIGH]);
dda7d77bcd424c Yangtao Li         2023-02-13  651  		seq_printf(s, "    - Urgent Mid : %d\n", sbi->gc_reclaimed_segs[GC_URGENT_MID]);
dda7d77bcd424c Yangtao Li         2023-02-13  652  		seq_printf(s, "    - Urgent Low : %d\n", sbi->gc_reclaimed_segs[GC_URGENT_LOW]);
e1235983e385af Changman Lee       2014-12-23  653  		seq_printf(s, "Try to move %d blocks (BG: %d)\n", si->tot_blks,
e1235983e385af Changman Lee       2014-12-23  654  				si->bg_data_blks + si->bg_node_blks);
e1235983e385af Changman Lee       2014-12-23  655  		seq_printf(s, "  - data blocks : %d (%d)\n", si->data_blks,
e1235983e385af Changman Lee       2014-12-23  656  				si->bg_data_blks);
e1235983e385af Changman Lee       2014-12-23  657  		seq_printf(s, "  - node blocks : %d (%d)\n", si->node_blks,
e1235983e385af Changman Lee       2014-12-23  658  				si->bg_node_blks);
274bd9ba394256 Chao Yu            2018-09-29  659  		seq_printf(s, "BG skip : IO: %u, Other: %u\n",
274bd9ba394256 Chao Yu            2018-09-29  660  				si->io_skip_bggc, si->other_skip_bggc);
e7547daccd6a37 Jaegeuk Kim        2022-11-30  661  		seq_puts(s, "\nExtent Cache (Read):\n");
5b7ee374144f8e Chao Yu            2015-09-30  662  		seq_printf(s, "  - Hit Count: L1-1:%llu L1-2:%llu L2:%llu\n",
e7547daccd6a37 Jaegeuk Kim        2022-11-30  663  				si->hit_largest, si->hit_cached[EX_READ],
e7547daccd6a37 Jaegeuk Kim        2022-11-30  664  				si->hit_rbtree[EX_READ]);
5b7ee374144f8e Chao Yu            2015-09-30  665  		seq_printf(s, "  - Hit Ratio: %llu%% (%llu / %llu)\n",
e7547daccd6a37 Jaegeuk Kim        2022-11-30  666  				!si->total_ext[EX_READ] ? 0 :
e7547daccd6a37 Jaegeuk Kim        2022-11-30  667  				div64_u64(si->hit_total[EX_READ] * 100,
e7547daccd6a37 Jaegeuk Kim        2022-11-30  668  				si->total_ext[EX_READ]),
e7547daccd6a37 Jaegeuk Kim        2022-11-30  669  				si->hit_total[EX_READ], si->total_ext[EX_READ]);
c00ba5548500a6 Jaegeuk Kim        2015-12-31  670  		seq_printf(s, "  - Inner Struct Count: tree: %d(%d), node: %d\n",
e7547daccd6a37 Jaegeuk Kim        2022-11-30  671  				si->ext_tree[EX_READ], si->zombie_tree[EX_READ],
e7547daccd6a37 Jaegeuk Kim        2022-11-30  672  				si->ext_node[EX_READ]);
71644dff481180 Jaegeuk Kim        2022-12-01  673  		seq_puts(s, "\nExtent Cache (Block Age):\n");
71644dff481180 Jaegeuk Kim        2022-12-01  674  		seq_printf(s, "  - Allocated Data Blocks: %llu\n",
71644dff481180 Jaegeuk Kim        2022-12-01  675  				si->allocated_data_blocks);
71644dff481180 Jaegeuk Kim        2022-12-01  676  		seq_printf(s, "  - Hit Count: L1:%llu L2:%llu\n",
71644dff481180 Jaegeuk Kim        2022-12-01  677  				si->hit_cached[EX_BLOCK_AGE],
71644dff481180 Jaegeuk Kim        2022-12-01  678  				si->hit_rbtree[EX_BLOCK_AGE]);
71644dff481180 Jaegeuk Kim        2022-12-01  679  		seq_printf(s, "  - Hit Ratio: %llu%% (%llu / %llu)\n",
71644dff481180 Jaegeuk Kim        2022-12-01  680  				!si->total_ext[EX_BLOCK_AGE] ? 0 :
71644dff481180 Jaegeuk Kim        2022-12-01  681  				div64_u64(si->hit_total[EX_BLOCK_AGE] * 100,
71644dff481180 Jaegeuk Kim        2022-12-01  682  				si->total_ext[EX_BLOCK_AGE]),
71644dff481180 Jaegeuk Kim        2022-12-01  683  				si->hit_total[EX_BLOCK_AGE],
71644dff481180 Jaegeuk Kim        2022-12-01  684  				si->total_ext[EX_BLOCK_AGE]);
71644dff481180 Jaegeuk Kim        2022-12-01  685  		seq_printf(s, "  - Inner Struct Count: tree: %d(%d), node: %d\n",
71644dff481180 Jaegeuk Kim        2022-12-01  686  				si->ext_tree[EX_BLOCK_AGE],
71644dff481180 Jaegeuk Kim        2022-12-01  687  				si->zombie_tree[EX_BLOCK_AGE],
71644dff481180 Jaegeuk Kim        2022-12-01  688  				si->ext_node[EX_BLOCK_AGE]);
6c311ec6c2d9e0 Chris Fries        2014-01-17  689  		seq_puts(s, "\nBalancing F2FS Async:\n");
02b16d0a34a188 Chao Yu            2018-11-12  690  		seq_printf(s, "  - DIO (R: %4d, W: %4d)\n",
02b16d0a34a188 Chao Yu            2018-11-12  691  			   si->nr_dio_read, si->nr_dio_write);
5f9abab42b60e6 Jaegeuk Kim        2018-10-16  692  		seq_printf(s, "  - IO_R (Data: %4d, Node: %4d, Meta: %4d\n",
5f9abab42b60e6 Jaegeuk Kim        2018-10-16  693  			   si->nr_rd_data, si->nr_rd_node, si->nr_rd_meta);
7411143f202153 Yangtao Li         2022-11-29  694  		seq_printf(s, "  - IO_W (CP: %4d, Data: %4d, Flush: (%4d %4d %4d), ",
dcc9165dbf9961 Jaegeuk Kim        2017-01-11  695  			   si->nr_wb_cp_data, si->nr_wb_data,
8b8dd65f72ccbf Chao Yu            2017-03-25  696  			   si->nr_flushing, si->nr_flushed,
7411143f202153 Yangtao Li         2022-11-29  697  			   si->flush_list_empty);
7411143f202153 Yangtao Li         2022-11-29  698  		seq_printf(s, "Discard: (%4d %4d)) cmd: %4d undiscard:%4u\n",
5f32366a29b48b Chao Yu            2017-03-25  699  			   si->nr_discarding, si->nr_discarded,
d84d1cbdec6b5d Chao Yu            2017-04-18  700  			   si->nr_discard_cmd, si->undiscard_blks);
7bc155fec5b371 Jaegeuk Kim        2022-05-05  701  		seq_printf(s, "  - atomic IO: %4d (Max. %4d)\n",
7bc155fec5b371 Jaegeuk Kim        2022-05-05  702  			   si->aw_cnt, si->max_aw_cnt);
6ce19aff0b8cd3 Chao Yu            2021-05-20  703  		seq_printf(s, "  - compress: %4d, hit:%8d\n", si->compress_pages, si->compress_page_hit);
35782b233f37e4 Jaegeuk Kim        2016-10-20  704  		seq_printf(s, "  - nodes: %4d in %4d\n",
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  705  			   si->ndirty_node, si->node_pages);
35782b233f37e4 Jaegeuk Kim        2016-10-20  706  		seq_printf(s, "  - dents: %4d in dirs:%4d (%4d)\n",
0f18b462b2e5af Jaegeuk Kim        2016-05-20  707  			   si->ndirty_dent, si->ndirty_dirs, si->ndirty_all);
e63ce120b41ac5 Andrew Kreimer     2024-10-27  708  		seq_printf(s, "  - data: %4d in files:%4d\n",
33fbd5100de6d0 Chao Yu            2015-12-17  709  			   si->ndirty_data, si->ndirty_files);
e63ce120b41ac5 Andrew Kreimer     2024-10-27  710  		seq_printf(s, "  - quota data: %4d in quota files:%4d\n",
2c8a4a28233482 Jaegeuk Kim        2017-11-13  711  			   si->ndirty_qdata, si->nquota_files);
35782b233f37e4 Jaegeuk Kim        2016-10-20  712  		seq_printf(s, "  - meta: %4d in %4d\n",
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  713  			   si->ndirty_meta, si->meta_pages);
35782b233f37e4 Jaegeuk Kim        2016-10-20  714  		seq_printf(s, "  - imeta: %4d\n",
5bc994a043470c Chao Yu            2016-09-18  715  			   si->ndirty_imeta);
47c8ebcce85ed7 Jaegeuk Kim        2022-01-27  716  		seq_printf(s, "  - fsync mark: %4lld\n",
47c8ebcce85ed7 Jaegeuk Kim        2022-01-27  717  			   percpu_counter_sum_positive(
dda7d77bcd424c Yangtao Li         2023-02-13  718  					&sbi->rf_node_block_count));
dd4e4b59b1a4a7 Jaegeuk Kim        2015-01-07  719  		seq_printf(s, "  - NATs: %9d/%9d\n  - SITs: %9d/%9d\n",
dd4e4b59b1a4a7 Jaegeuk Kim        2015-01-07  720  			   si->dirty_nats, si->nats, si->dirty_sits, si->sits);
5b0ef73c9d1951 Jaegeuk Kim        2017-05-01  721  		seq_printf(s, "  - free_nids: %9d/%9d\n  - alloc_nids: %9d\n",
5b0ef73c9d1951 Jaegeuk Kim        2017-05-01  722  			   si->free_nids, si->avail_nids, si->alloc_nids);
2d219c518882d2 Gu Zheng           2013-07-22  723  		seq_puts(s, "\nDistribution of User Blocks:");
2d219c518882d2 Gu Zheng           2013-07-22  724  		seq_puts(s, " [ valid | invalid | free ]\n");
2d219c518882d2 Gu Zheng           2013-07-22  725  		seq_puts(s, "  [");
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  726  
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  727  		for (j = 0; j < si->util_valid; j++)
2d219c518882d2 Gu Zheng           2013-07-22  728  			seq_putc(s, '-');
2d219c518882d2 Gu Zheng           2013-07-22  729  		seq_putc(s, '|');
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  730  
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  731  		for (j = 0; j < si->util_invalid; j++)
2d219c518882d2 Gu Zheng           2013-07-22  732  			seq_putc(s, '-');
2d219c518882d2 Gu Zheng           2013-07-22  733  		seq_putc(s, '|');
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  734  
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  735  		for (j = 0; j < si->util_free; j++)
2d219c518882d2 Gu Zheng           2013-07-22  736  			seq_putc(s, '-');
2d219c518882d2 Gu Zheng           2013-07-22  737  		seq_puts(s, "]\n\n");
b9a2c252071d44 Changman Lee       2014-12-24  738  		seq_printf(s, "IPU: %u blocks\n", si->inplace_count);
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  739  		seq_printf(s, "SSR: %u blocks in %u segments\n",
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  740  			   si->block_count[SSR], si->segment_count[SSR]);
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  741  		seq_printf(s, "LFS: %u blocks in %u segments\n",
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  742  			   si->block_count[LFS], si->segment_count[LFS]);
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  743  
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  744  		/* segment usage info */
dda7d77bcd424c Yangtao Li         2023-02-13  745  		f2fs_update_sit_info(sbi);
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  746  		seq_printf(s, "\nBDF: %u, avg. vblocks: %u\n",
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  747  			   si->bimodal, si->avg_vblocks);
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  748  
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  749  		/* memory footprint */
dda7d77bcd424c Yangtao Li         2023-02-13  750  		update_mem_info(sbi);
9edcdabf36422d Chao Yu            2015-09-11  751  		seq_printf(s, "\nMemory: %llu KB\n",
6f0aacbc3c1d71 Jaegeuk Kim        2015-01-10  752  			(si->base_mem + si->cache_mem + si->page_mem) >> 10);
9edcdabf36422d Chao Yu            2015-09-11  753  		seq_printf(s, "  - static: %llu KB\n",
6f0aacbc3c1d71 Jaegeuk Kim        2015-01-10  754  				si->base_mem >> 10);
e7547daccd6a37 Jaegeuk Kim        2022-11-30  755  		seq_printf(s, "  - cached all: %llu KB\n",
6f0aacbc3c1d71 Jaegeuk Kim        2015-01-10  756  				si->cache_mem >> 10);
e7547daccd6a37 Jaegeuk Kim        2022-11-30  757  		seq_printf(s, "  - read extent cache: %llu KB\n",
e7547daccd6a37 Jaegeuk Kim        2022-11-30  758  				si->ext_mem[EX_READ] >> 10);
71644dff481180 Jaegeuk Kim        2022-12-01  759  		seq_printf(s, "  - block age extent cache: %llu KB\n",
71644dff481180 Jaegeuk Kim        2022-12-01  760  				si->ext_mem[EX_BLOCK_AGE] >> 10);
9edcdabf36422d Chao Yu            2015-09-11  761  		seq_printf(s, "  - paged : %llu KB\n",
6f0aacbc3c1d71 Jaegeuk Kim        2015-01-10  762  				si->page_mem >> 10);
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  763  	}
90d5c9ba3ed919 Chao Yu            2025-06-11  764  	spin_unlock(&f2fs_stat_lock);
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  765  	return 0;
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  766  }
902829aa0b7225 Greg Kroah-Hartman 2012-11-03  767  

:::::: The code at line 458 was first introduced by commit
:::::: 5bb9c111cd98ad844d48ace9924e29f56312f036 f2fs: convert to MAX_SBI_FLAG instead of 32 in stat_show()

:::::: TO: Yangtao Li <frank.li@vivo.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
