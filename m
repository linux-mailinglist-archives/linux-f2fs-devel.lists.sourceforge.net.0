Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 454476883E1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Feb 2023 17:13:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNcDg-0007sr-8z;
	Thu, 02 Feb 2023 16:13:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1pNcDf-0007sh-6V
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 16:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l8afKfOrNPWF6pVHpINN7SRy1eZKaTy2OJQ0phik6zc=; b=ETt7lCTd7NWPQ313wjWSu2m3dK
 EqaB14h4lUOEJwX22E86BHZCf/FDxrWBSD3X6I5c8+UOTMh3ar84Av5WHKprohWYAi4KmAo2ycOWY
 JBVI9lqJ7oZEI6BDlxwkX/puZqLERW8agg6K+YMNGzZ2RW59SCxmNziUUebg2TRMpgBA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=l8afKfOrNPWF6pVHpINN7SRy1eZKaTy2OJQ0phik6zc=; b=k
 lHODv8v7UbyNYl6VTi+rZyVqJPyE+hh8kclL9hYDorn7XJmgGxfT9refi6Mt82+7qKNPdcFg0UVmF
 IXiKY7bnkqESAn3zxzqemeea72J02+6KBXQxnNSKNBCz0kGjYiCcFdf+bHBC6dTRygfcwM5YRGOmK
 Iul7x3RIuvhar1LQ=;
Received: from mga14.intel.com ([192.55.52.115])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNcDc-008qha-OV for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 16:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675354428; x=1706890428;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=ZllGm8JM0PggcRthSxs5kphHB8LoTxUj3ORsqNRX1xk=;
 b=kp+i12twu0R+3O+5rXt13VUOACVnjl6vl8XYF7m0D8QtTkueQYsbPgbH
 DRfNLOYRwonWB8F6rUi2D4je+g8L4rpVWjz4zPc6QZrnRCYf62tKHuZZs
 aBqvuWkvHXP7GjdWzEgq5SPY3PBWWvIKhjf2YBiLy3AnCkQNl/VqSQMhp
 vvw0AsQE4pUpZtREivQwLfueo/ENh+8Cz2G6mL1bNb4qMfBiYGkD4WtRV
 4dwHXE3qA6+sffb/9dGAa3kzwAduStpzPXgJGoqa/9y/YE0GcBXMUdbPI
 FlkHU6bpGHQFKGGF+PemtqBW2NaPwPkanhvgd5rGCHF790zLa28yDnRkt w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="328503617"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="328503617"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 08:13:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="994149560"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="994149560"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 02 Feb 2023 08:13:38 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pNcDR-0006eo-2G;
 Thu, 02 Feb 2023 16:13:37 +0000
Date: Fri, 3 Feb 2023 00:13:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202302030016.87SfjJbJ-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: de6b3a5e09b29c014bd04044b023896107cfa2ee commit:
 f45b6148e2f1f8f3e9824472a89ba568e418f8fa
 [54/63] f2fs: simplify d [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.115 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pNcDc-008qha-OV
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 54/63]
 fs/f2fs/checkpoint.c:1482:55-56: Unneeded semicolon
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
 Chao Yu <yuchao0@huawei.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   de6b3a5e09b29c014bd04044b023896107cfa2ee
commit: f45b6148e2f1f8f3e9824472a89ba568e418f8fa [54/63] f2fs: simplify do_checkpoint
config: openrisc-randconfig-c031-20230202 (https://download.01.org/0day-ci/archive/20230203/202302030016.87SfjJbJ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cocci warnings: (new ones prefixed by >>)
>> fs/f2fs/checkpoint.c:1482:55-56: Unneeded semicolon

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
