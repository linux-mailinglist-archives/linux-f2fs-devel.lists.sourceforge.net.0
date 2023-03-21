Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D45546C27F9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Mar 2023 03:18:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1peRZt-0007QB-N5;
	Tue, 21 Mar 2023 02:18:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1peRZr-0007Q5-Vc
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Mar 2023 02:18:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o/WNQtmr/zzJ/IgMOGeK1zQp2TstrTEceTlkESztZsk=; b=W6lXQQ6t8rf4qvAs0lkpKUhfFc
 AgdLdkgsTPd6TEq7uCq+SC6k2MpS8E0pjIWT6G4iFhURc9NRxJALHyFKvB76bq1fEF03HhsvM6Afy
 M2SFPgjHmeJIhnanY3b1msm/3E5Czwbpy2LQSgKXm5Lkez8cLQopCkJ8hZwnyWyCWX3s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o/WNQtmr/zzJ/IgMOGeK1zQp2TstrTEceTlkESztZsk=; b=dy0/dL36SgxtYiMa8lBVPwEuM7
 ES1uy/rROo6cSg4VaAT2kb4Ci19bIUcB29wz0ww6VACwYiOQrZ/XNGVYtTFKpfufZSXxpbYq3GQGm
 OyU6rarKUqoFhWGhuFm5oLBMz560Vd4dOKAaLdlvZMm/lXkWnr+dlSjUcAPMli9mBcqY=;
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1peRZo-00Eovg-Qb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Mar 2023 02:18:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679365096; x=1710901096;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QBIssQwI18us+dgn2chNBQX5l2ZatxK5ht9vMn5tRT0=;
 b=ItsqXGeCQ8dbO9LeMnjmSqvPb92xt/rLYNHsi/qCjRnyuKEDvJpAJQvX
 r+Ofr9+fF8d/IFqjMW7v76GSI0vex2o+0hRKPtWVAudugUEjIsDHzzYgR
 w4lYYm8gUIRDypKuiFsN3xUT4MVbaSFm6D6SlPgb3CCi1dtLcVxpT/UpI
 OpJvN/IBigW4YiirS2587uSh3cGIXjkCty+zuhqkPpbMdY3x19tHeFE7F
 9GLPfJv5LzkVwQKzKbg6sOTaBcLhJG5CXNwOrSXyJUn57BL6Y19IyCggy
 JNnGDg+5JJ73g6QqG+3sfinlOSwgk+0n3TApzvX1UUJo9tdCMH95C0QMA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="401402502"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; d="scan'208";a="401402502"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 19:18:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="711618653"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; d="scan'208";a="711618653"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 20 Mar 2023 19:18:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1peRZf-000BV2-03;
 Tue, 21 Mar 2023 02:18:07 +0000
Date: Tue, 21 Mar 2023 10:17:10 +0800
From: kernel test robot <lkp@intel.com>
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>
Message-ID: <202303211005.RGxljvli-lkp@intel.com>
References: <20230320175529.39129-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230320175529.39129-1-frank.li@vivo.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Yangtao, I love your patch! Perhaps something to improve:
 [auto build test WARNING on jaegeuk-f2fs/dev-test] [also build test WARNING
 on jaegeuk-f2fs/dev linus/master v6.3-rc3 next-20230320] [If your patch is
 applied to the wrong git tree, kindly drop us a n [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [134.134.136.31 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1peRZo-00Eovg-Qb
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add iostat latency statistics
 support for discard
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
Cc: linux-kernel@vger.kernel.org, Yangtao Li <frank.li@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-trace-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Yangtao,

I love your patch! Perhaps something to improve:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on jaegeuk-f2fs/dev linus/master v6.3-rc3 next-20230320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yangtao-Li/f2fs-add-iostat-latency-statistics-support-for-discard/20230321-020736
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230320175529.39129-1-frank.li%40vivo.com
patch subject: [PATCH v2] f2fs: add iostat latency statistics support for discard
config: x86_64-randconfig-s023 (https://download.01.org/0day-ci/archive/20230321/202303211005.RGxljvli-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/a094ea0014763420eb8e3577552baac00c63efad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yangtao-Li/f2fs-add-iostat-latency-statistics-support-for-discard/20230321-020736
        git checkout a094ea0014763420eb8e3577552baac00c63efad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211005.RGxljvli-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/f2fs/iostat.c:259:29: sparse: sparse: mixing different enum types:
>> fs/f2fs/iostat.c:259:29: sparse:    unsigned int enum iostat_lat_type
>> fs/f2fs/iostat.c:259:29: sparse:    unsigned int enum page_type
   fs/f2fs/iostat.c:262:29: sparse: sparse: mixing different enum types:
   fs/f2fs/iostat.c:262:29: sparse:    unsigned int enum iostat_lat_type
   fs/f2fs/iostat.c:262:29: sparse:    unsigned int enum page_type

vim +259 fs/f2fs/iostat.c

   246	
   247	void iostat_update_submit_ctx(struct bio *bio, enum page_type type)
   248	{
   249		struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
   250		enum iostat_lat_type lat_type;
   251	
   252		iostat_ctx->submit_ts = jiffies;
   253	
   254		if (type == DISCARD) {
   255			lat_type = DISCARD_LAT;
   256		} else if (op_is_write(bio_op(bio))) {
   257			lat_type = bio->bi_opf & REQ_SYNC ?
   258					WRITE_SYNC_DATA_LAT : WRITE_ASYNC_DATA_LAT;
 > 259			lat_type += type;
   260		} else {
   261			lat_type = READ_DATA_LAT;
   262			lat_type += type;
   263		}
   264	
   265		iostat_ctx->lat_type = lat_type;
   266	}
   267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
