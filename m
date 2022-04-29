Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF62515261
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Apr 2022 19:36:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkUXW-00088W-GA; Fri, 29 Apr 2022 17:36:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nkUXS-00088Q-Tv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 17:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i6JK99o0Y/VSdtWfVNH0sLL+IDWKTtE8d64ONuXZXz4=; b=bxCh35P7irpEYtoyIRy0VJIWsb
 37wZEvfZioRwLkL735zoACQrUNiAk1qNcl6/IDziNBKJfD2NFDbsc7ZIynikpM9tgsB7dsJM/Uoiv
 T2NfOdv6Yo+wJ0BmAA1Q6qY2CexG7ZDknOgjdx3KkQmdusSKCPXUTlEsuInAFAQpSxaU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i6JK99o0Y/VSdtWfVNH0sLL+IDWKTtE8d64ONuXZXz4=; b=DSZ0C9HHojFI4ov0szYu1VS4ZE
 IFYfDHoQPCfw1DwvDLUjsCwMni4EpDjaq2DOQ6VpI68pP8FIhM4iko7qE+RPfrmqJ65hC15Qpzvzy
 xY3P71EemT/5ivyxFi2VPNe0BPHq5lcenHpKrStSGxNA5dIJYWvrUhm19Yr4/CtleQ+A=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkUXP-0007U9-Aw
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 17:36:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 623D81F468B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651253767;
 bh=WFkUTD/dDPR/qJnlQ9orusQLtC1nPcHZDLtxaEunj9I=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=Ie837G/c8saHQIrQcP9DyGcD1gYFUVruL411V2jnz05CDCF5Ruhf/FC1nQfIU3sW0
 keD8Wb9L9FOLgtJnhqOq0Zdtu9Z6oyWZ9ZORpHu6J30Pd3En16JcLDNn3cuo8JaigY
 pEXIuxp+/COLiXwKR3HnO9e0C5JbEXwKj/e7LAxxnOQ9j4N2hHRXLVCdggr7yeiEd8
 zASF4a/f/d0bpLERLDGc5nE6AVgD1BepHKbAcsxdx6OTxMXeGfg28LXgaJJl4nqb6G
 3Q/zIrar6IKeEygYuFYSkDFYzzeXaRl5JidSl/DlpSNH1DZfaqBpluIvJ9Xx7EhT3Y
 HPbZMPzCu//Bg==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: kernel test robot <lkp@intel.com>
Organization: Collabora
References: <20220428221027.269084-8-krisman@collabora.com>
 <202204291733.QRyzoWB6-lkp@intel.com>
Date: Fri, 29 Apr 2022 13:36:04 -0400
In-Reply-To: <202204291733.QRyzoWB6-lkp@intel.com> (kernel test robot's
 message of "Fri, 29 Apr 2022 17:12:49 +0800")
Message-ID: <87ee1fx057.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  kernel test robot <lkp@intel.com> writes: > Hi Gabriel, >
 > I love your patch! Yet something to improve: > > [auto build test ERROR
 on tytso-ext4/dev] > [also build test ERROR on jaegeuk-f2fs/dev-test
 linus/master v5.18-rc4 next-20220428] > [ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
X-Headers-End: 1nkUXP-0007U9-Aw
Subject: Re: [f2fs-dev] [PATCH v2 7/7] f2fs: Reuse generic_ci_match for ci
 comparisons
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
Cc: kernel@collabora.com, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 kbuild-all@lists.01.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

kernel test robot <lkp@intel.com> writes:

> Hi Gabriel,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on tytso-ext4/dev]
> [also build test ERROR on jaegeuk-f2fs/dev-test linus/master v5.18-rc4 next-20220428]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Gabriel-Krisman-Bertazi/Clean-up-the-case-insenstive-lookup-path/20220429-061233
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
> config: microblaze-buildonly-randconfig-r004-20220428 (https://download.01.org/0day-ci/archive/20220429/202204291733.QRyzoWB6-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 11.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/8955999168ad8e2d440ec534ebe26830da9bc6f6
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Gabriel-Krisman-Bertazi/Clean-up-the-case-insenstive-lookup-path/20220429-061233
>         git checkout 8955999168ad8e2d440ec534ebe26830da9bc6f6
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
>>> ERROR: modpost: "generic_ci_match" [fs/f2fs/f2fs.ko] undefined!
> ERROR: modpost: "generic_ci_match" [fs/ext4/ext4.ko] undefined!

Missing an EXPORT_SYMBOL, I guess. sorry for the noise. will fix and
resend.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
