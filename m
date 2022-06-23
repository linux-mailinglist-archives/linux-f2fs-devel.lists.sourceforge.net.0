Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C37557A94
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jun 2022 14:44:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o4MCa-00013I-Q1; Thu, 23 Jun 2022 12:44:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <lkp@intel.com>) id 1o4MCZ-000131-5Z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 12:44:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x2GkQwyUEy16/OcjsQSh0r8gpPPLl9OlOg+Uewwv8Lc=; b=HGWceDQ5pRQHKVOKCSz+8mEtrY
 UvpzCaX6YnGNGDxLoLyO7LDz69eJDkL0MCPh4zEuTg/GpoF/Zz7cJ1br/OQ9RNRugV7G5rj6wcEyw
 L3K7XY0EcFlh0Y5cdhsSO4PnP9UbHmvKozyrQsp8NV+ANzwaiggJ0vZ/lBFYj1VfB6Uw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x2GkQwyUEy16/OcjsQSh0r8gpPPLl9OlOg+Uewwv8Lc=; b=WVa64/tdQFCXPSB9fJIe8wOL3Q
 K/jDiSTR+AjdFIz1UNM+ICNJKspbP3XCXwerkKO2C29TwuukMO1jjclwZxNQqp1/8OA4guKEs7zMc
 KwSwrsiZex1sPNURDRQ6yghceu2xq5e0+lXKPhVERMUAo2wGebWNBy1yhqeKPRlBfvno=;
Received: from mga02.intel.com ([134.134.136.20])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o4MCV-0002vq-R1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 12:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655988287; x=1687524287;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h3Ef2jQOmoumcBkWtU8Mn8h6evOutjsIpL0wWbQpFd0=;
 b=l0bVtBtw2OdrEJ3XXmqJ2maJhUDa8wxBKDg4GBsVfVOEFnGMBnWJl0Sf
 1R0aA5h/jcJupm8zEA7vqg6CrR4X03W68/elZraBHWL2HdNnsCaRg6mEp
 S4GLp1l/C/rhQnNaBJ7pS1k1wWR+IfgZiSifaiCt7zIjDeU98Dmglpcmm
 BcPxJ9YEM9Olo6gZjImsHTLXSwsdvbca7YOrg2MbP5UruEnXQNHI1KknK
 6/DK46x9N06O3ueQJwdtAynpcTGaJGuEy8tz7inqSyV5w1P8VVwtd1hCW
 5aF8SZtZbiM5Q8JyqG7+viz1GEQrIQMN5rcWWaUFwCCcYL+sEiUeF9xse A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="269432553"
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="269432553"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 05:44:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="621303381"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 23 Jun 2022 05:44:38 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o4MCM-0001Gd-Ab;
 Thu, 23 Jun 2022 12:44:38 +0000
Date: Thu, 23 Jun 2022 20:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>,
 viro@zeniv.linux.org.uk, tytso@mit.edu, jaegeuk@kernel.org
Message-ID: <202206231838.E75vWtY3-lkp@intel.com>
References: <20220622194603.102655-8-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220622194603.102655-8-krisman@collabora.com>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Gabriel,
 I love your patch! Yet something to improve: [auto
 build test ERROR on tytso-ext4/dev] [also build test ERROR on
 jaegeuk-f2fs/dev-test
 linus/master v5.19-rc3 next-20220623] [If your patch is applied to the wrong
 git tree, kindly drop us a note. [...] 
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [134.134.136.20 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [134.134.136.20 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o4MCV-0002vq-R1
Subject: Re: [f2fs-dev] [PATCH 7/7] f2fs: Enable negative dentries on
 case-insensitive lookup
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
Cc: kernel@collabora.com, kbuild-all@lists.01.org,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Gabriel,

I love your patch! Yet something to improve:

[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on jaegeuk-f2fs/dev-test linus/master v5.19-rc3 next-20220623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriel-Krisman-Bertazi/Support-negative-dentries-on-case-insensitive-directories/20220623-034942
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
config: x86_64-randconfig-a006 (https://download.01.org/0day-ci/archive/20220623/202206231838.E75vWtY3-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/ab740b793e65b54ce8f48c693b86761f5bcaa911
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gabriel-Krisman-Bertazi/Support-negative-dentries-on-case-insensitive-directories/20220623-034942
        git checkout ab740b793e65b54ce8f48c693b86761f5bcaa911
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "d_set_casefold_lookup" [fs/ext4/ext4.ko] undefined!
>> ERROR: modpost: "d_set_casefold_lookup" [fs/f2fs/f2fs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
