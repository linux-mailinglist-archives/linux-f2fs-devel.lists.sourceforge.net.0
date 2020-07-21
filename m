Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEBA228133
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jul 2020 15:42:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxsXX-0007EZ-Qw; Tue, 21 Jul 2020 13:42:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=46497140d=Aravind.Ramesh@wdc.com>)
 id 1jxsXX-0007ES-0d
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 13:42:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IUANwaCSzpCVqQS1wauzLZuS58663xVAtMYHD+NIKOI=; b=jgVa0Reaor62iNp/gLuPY8gSf0
 dNSbm8PaPgfDGoiE7bfS4p2Dkx+aJ3cV6QyNB4eJSv/gn2VP/p8JlCVlVoZHP+EIsUlHF3mBJ9iQJ
 58KsbZ4dm2/aaVEClY1g1XMlP2W1dJkLReW0iQD3/SUu93vAg3kMRCdyh22wD696tnOA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IUANwaCSzpCVqQS1wauzLZuS58663xVAtMYHD+NIKOI=; b=PRSBmZf6eyhaH3uo7Q77ARJQQd
 m8rlpY0bXhp6JaxlwLaR5jStWbqVOHGdMf6d2FJELchwH5kleZI3NxRmTbvuvpFU3tOfA18Gs1bkg
 CzKYOLCyFsOVM2wArlTUTg8SLqGoxCJpul+69bUxFkT0M/CSjVLGhOZyb6B7aS6DG4f8=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxsXU-00C8Tf-Mc
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 13:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595338956; x=1626874956;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2KF+5SG7V3Sp3cfoX6ElpDkIZZXh5RfCcB2+ATJ8pdA=;
 b=aezqOSjMN4iGghgtcf6zH1jwV5DIDn9emMa70OEF1DX3OkJ1gYrg7uSp
 4ywPq3s8Zlkf90/6dwmqGOWuhc5uFuA6AH6SKOYDNLsq8O7GOG8L58HOr
 igsgYg5ABFYZWu3+Vl1YcoX3EoWfcKAT9ZCrxTxIzIbh5VNf4Sjo/dZsw
 UNTHGq2LCsyxEVkIPvfAsXMgqYshYtwhtq+KmkOzXjSLr0gIGUByPEJGj
 /XeJ0c90vXTpN+7UGMUUfJLMPaSGlFBwxkfvXtxP35KKdd0pQnDt3x/qy
 gQ4ZOyLOoQ3/Ajh/quubbFkFt6ShihlCCLWLibl8cln7XOGi3jqY4kBad A==;
IronPort-SDR: NRSTXkipsGp2Zs0ZeE7S8mw6HVmefKTO3szbA9K05VSbbjBAX3eZlqWwTdf6c1BTRGInSe3knY
 PVUoY03Z/XaB6meOqdLJJ0K3Iy5LYfx5zBwjH3AqBCMKI6rurH1MNs/fRLANvOxfwR0B+xiz+9
 tz8/NpsZ3O/5iuiwSF8Eh5o5+aNjVksbVAqs0nAzkYJNZiDGLkKq5Fw8YhDU3QPL/hHMfBrN7Q
 4NbiRpZuJ74u1ovDqWZDY+i7HMHKI/vjPPy6sBtDUK6ywHSjzDtsWHg2B+deFndS7A7wOlhzCH
 XQc=
X-IronPort-AV: E=Sophos;i="5.75,379,1589212800"; d="scan'208";a="252299367"
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jul 2020 21:42:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdKilygP297O2/kHMyBdz38RirM7GptuEq/j12PFBlsaOByM35e885YMkBLq+b2OU7lKdVItaNKz+vdTwPNaLOfduc1IKDJ2Ja4+czly9EifknBwzzFLZ4RxoWYsPmBfZG7fghKuAakRgbmcAsh5+EnVmBfGkHz5FvJOhVoNvGUFQnnRPyNZuBlSOyagpaOvS6f8Rc0VOtPg5lKkSHVFUl7eoxG1uU4o9TPOb4K7YUEBK49yrioR3om7aDPWDwhGrBx5GiTtkqWYX2BBky9K2BWBZdYcECa5vvxtzxmOpnyUZ5vXJAJKVStBxVRCCJXxtdgXyPDafaoldRde2GWJQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUANwaCSzpCVqQS1wauzLZuS58663xVAtMYHD+NIKOI=;
 b=PL2s1lfpMpWZ/8V0K6dV6wGQpzpVinb7L1ZtwUsjjQgmKBEC8kAa9rENQZZ1lPHmF4o6LTh+mlkvtXcB8H/7DluyFJw/gSD7FpT1+wBQYykc1VCm9cp30n3TFbHAFWNKXdbzOaMFTH+ZAUkKuD94+zSK9VoK2soZQrBnCw/OswDZrE4iGDfcHa3gleb4PNllwNR3onWuuWcr8wB9D3ZgpFpI+XeFMyLndZ3MD15BezxiOIw13XJ9drRRDe3Q2m5jKELfHIfsFRJ4ycCj+OFuEZnjHb+YUL/GmxsNH6//w0ODaONsp8jY/ZqXZrw6MXpStFQTWYKoAuwIbL+yX1RQoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUANwaCSzpCVqQS1wauzLZuS58663xVAtMYHD+NIKOI=;
 b=Eq3SXGUDPFIo46yoMd3c4UGshGkAc1BsY1huazljcgCmnaKN1NCCn/I22z7aQEDodWU7qotkQsqtltkAwu9DtIVdMGwhF5eHlrq6FqKeU8hqkKlPgZRZPOdeTwUUyaLGK8Kdt/0Rvs48m9pZjoFAexAIiMgbF2p6CJ99tJG7Xsw=
Received: from BY5PR04MB6995.namprd04.prod.outlook.com (2603:10b6:a03:22c::12)
 by BYAPR04MB4007.namprd04.prod.outlook.com (2603:10b6:a02:b2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Tue, 21 Jul
 2020 13:42:29 +0000
Received: from BY5PR04MB6995.namprd04.prod.outlook.com
 ([fe80::f813:2bba:2c5c:a63b]) by BY5PR04MB6995.namprd04.prod.outlook.com
 ([fe80::f813:2bba:2c5c:a63b%6]) with mapi id 15.20.3216.021; Tue, 21 Jul 2020
 13:42:29 +0000
From: Aravind Ramesh <Aravind.Ramesh@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [f2fs:dev-test 37/38] fs/f2fs/super.c:3058:48: error: 'struct
 blk_zone' has no member named 'capacity'
Thread-Index: AQHWXy6PxuRlP14m5USp26DPJMYNYakSCZng
Date: Tue, 21 Jul 2020 13:42:28 +0000
Message-ID: <BY5PR04MB699535E4F62BEC16568A3E058C780@BY5PR04MB6995.namprd04.prod.outlook.com>
References: <202007211524.zrSvup2X%lkp@intel.com>
In-Reply-To: <202007211524.zrSvup2X%lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.179.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 187fa916-6da1-4e54-3a61-08d82d7be940
x-ms-traffictypediagnostic: BYAPR04MB4007:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB400733E40CA7825E006B37D08C780@BYAPR04MB4007.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:644;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fNvm9xXSbg3I81LylEV/KueA3H0p8bSeUVZP3cJ3Fb7Q8GCKC/nATeY6TpKClaUoqALB/4hrrhdE/GvRDXl+MSIjNkJHph8MLv5pE0yb+NfK49upavlb2mLjeRgWnyfahnuQWKp+rk/2f8g+c8KP+55RbaC+1h6HjQe4nPsGBcS/TXfuW+mpMwu05rCQ2LaaACCy2YTVyTdHrVzEtzHM1f35k3IEVnHPuZ47lgQQywHdqidLhQNjfYSps1IHC+bMgkDR5OM7Hek35SUimdzxxP9oh96UaJY3SsU33ruuZqf5e6zZuKgx9FSrNy07lKIE/LWz+QVfa1gkgRF58EXdl3LIV6mShJuQebpSiKk/HrC4U862OdJmvCUol9DWaJBJd876t9VXEEpzbqfq0Xo8DA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6995.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(26005)(186003)(966005)(498600001)(53546011)(6506007)(86362001)(2906002)(9686003)(71200400001)(8936002)(8676002)(54906003)(6916009)(66476007)(76116006)(66946007)(66446008)(66556008)(83380400001)(64756008)(52536014)(7696005)(4326008)(33656002)(55016002)(83080400001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Mn/6Oy1PjYkrq6Vx9mViFL73p6tZldWc+R1bvvZV4YY9BsEummD1TKpSFIB/bGjEWOT3WcVuhdM3GQN3Yx4UaRUyf/RvEIvhQh5rIEPBcG34SWyMBmHiusjk5RHVFg3g/c4//rFxAVds4VKWv9FOMeNKguAKul2llk3qVJMwTYocAFiYCkadNuGPeK0ye45qW8VSOvk/kpw7U0NRu5MPMO63T9x1ljzYYavD9NnhtNsReLz9OjoIjvOmXbI4dk2GPWocmoHcC/j3zySHU6m06RbGCHXJAvwxtkw9FMa24/rxcSaxoPcBRZLXjWVvcUepjDb51xph9T2V12WKNg1t9jYat8kDVMEeb5FYtfEosCMLjSIbQhLpl35y5e5TDD9X0whXNdF3Nr7atvmaj+EN7oWFtHmu99R38piKFFF1JIZUfKA3Sj/nNns28/tgREqJCmbxnU3h3oaRvYbrvHsxmzWHuIr8f//DMMC6QpUdagl49IZC/F7CCOx0ttozw1Ki
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6995.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 187fa916-6da1-4e54-3a61-08d82d7be940
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 13:42:28.9576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xk96uBrkWktdSAypOq+lga2S4ngPoGfFxxEQrYTTLnuEPupP2BbhbUtSOUIH9+63AY0Hqn5SBDDlML/ozIpDCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4007
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jxsXU-00C8Tf-Mc
Subject: Re: [f2fs-dev] [f2fs:dev-test 37/38] fs/f2fs/super.c:3058:48:
 error: 'struct blk_zone' has no member named 'capacity'
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 kernel test robot <lkp@intel.com>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello Jaegeuk,
The patch that adds the capacity struct member has been merged to linux-block tree's for-next branch.
So either:
1. f2fs-dev branch has to carry the same patch, from here:
https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/log/include/uapi/linux/blkzoned.h?h=for-next
I had mentioned this is the cover letter of this patch.
2. linux-block pull request has to be merged before f2fs pull request to Linus
3. Or this f2fs patch has to wait until next merge window (the one after kernel 5.9 merge window)

Thanks
Aravind

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Tuesday, July 21, 2020 12:43 PM
> To: Aravind Ramesh <Aravind.Ramesh@wdc.com>
> Cc: kbuild-all@lists.01.org; linux-f2fs-devel@lists.sourceforge.net; Jaegeuk Kim
> <jaegeuk@kernel.org>; Damien Le Moal <Damien.LeMoal@wdc.com>; Niklas Cassel
> <Niklas.Cassel@wdc.com>; Chao Yu <yuchao0@huawei.com>; Chao Yu
> <chao@kernel.org>
> Subject: [f2fs:dev-test 37/38] fs/f2fs/super.c:3058:48: error: 'struct blk_zone' has
> no member named 'capacity'
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
> head:   439633ba3673a5d8983529426df144c64a23d181
> commit: d787c5eec8b58bb47d4bf750758e0e87d667bf56 [37/38] f2fs: support
> zone capacity less than zone size
> config: nds32-allyesconfig (attached as .config)
> compiler: nds32le-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-
> tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout d787c5eec8b58bb47d4bf750758e0e87d667bf56
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross
> ARCH=nds32
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    fs/f2fs/super.c: In function 'f2fs_report_zone_cb':
> >> fs/f2fs/super.c:3058:48: error: 'struct blk_zone' has no member named 'capacity'
>     3058 |  rz_args->dev->zone_capacity_blocks[idx] = zone->capacity >>
>          |                                                ^~
>    fs/f2fs/super.c:3060:23: error: 'struct blk_zone' has no member named 'capacity'
>     3060 |  if (zone->len != zone->capacity && !rz_args->zone_cap_mismatch)
>          |                       ^~
> 
> vim +3058 fs/f2fs/super.c
> 
>   3048
>   3049	static int f2fs_report_zone_cb(struct blk_zone *zone, unsigned int idx,
>   3050				      void *data)
>   3051	{
>   3052		struct f2fs_report_zones_args *rz_args = data;
>   3053
>   3054		if (zone->type == BLK_ZONE_TYPE_CONVENTIONAL)
>   3055			return 0;
>   3056
>   3057		set_bit(idx, rz_args->dev->blkz_seq);
> > 3058		rz_args->dev->zone_capacity_blocks[idx] = zone->capacity >>
>   3059
> 	F2FS_LOG_SECTORS_PER_BLOCK;
>   3060		if (zone->len != zone->capacity && !rz_args->zone_cap_mismatch)
>   3061			rz_args->zone_cap_mismatch = true;
>   3062
>   3063		return 0;
>   3064	}
>   3065
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
