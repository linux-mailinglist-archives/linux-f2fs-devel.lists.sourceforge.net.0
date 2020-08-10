Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 741202407B4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Aug 2020 16:40:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k58yP-0007nX-54; Mon, 10 Aug 2020 14:40:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=48440c974=Niklas.Cassel@wdc.com>)
 id 1k58yO-0007nP-PT
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Aug 2020 14:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jPkSpIHB/vY0MVljwPrPoyh3+8jimfrnTg6TAeyPtF4=; b=Asyux/e5hHwgk2m39gslAWWyHd
 vqnHiHgwSiuxh7QglRIEXBIVYcef3c2CGjT7xbGr3qa/ISfxq3om0CL46250rgZypQ4R4Y7o/+aSi
 cRsG0M8GObGiTvU1qNuHRJ7XL7o3+7BQ+ZiMYwFzzZ2Srq10tPLI/3CXmNuTzXUIseMA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jPkSpIHB/vY0MVljwPrPoyh3+8jimfrnTg6TAeyPtF4=; b=gjQBYpQatxRS96NtdJxDdJHDtI
 ioO6VF9+qZlsJdh/2fn986wwxVHmGzFiTOAqq5H7XG7aRVcTaQWrHCypZj5DZMfrwSbB+BHD+TzrS
 M9Sw0CTmaze28wGPgNWtWD8nEwGcjPSC0XFkn4+o/RsY4gwFPj68PAXnnOzhOynAKdRg=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k58yJ-002thR-VP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Aug 2020 14:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597070421; x=1628606421;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=h+1BwqvVc/Hxzvd4IFqDQgKUxRqlKktBhmZpiUUg7cE=;
 b=kb0MQ3FgmJXeFFMUTyUdck7yBGDyaimvjqIaCXxpR2I2jLT4aUNPedN7
 xiOhCh/+JazCaYCPpccLw1qT/WBSlTvc59T4XtU7xp3sYgwioQ0DXz/TZ
 y3+z0V2qO/Ug06dbupoF6jKizgdCSLD4awvqvGVq2Xm5LXmMsN2jjL6dW
 98bGoR6jV9cOLZWkybWMykHMGFF+xr9U2KIErhSnJ3+8Y3YzqJ0E7AlFP
 jIZHOtBFWhIFsoOnrvhfuvKMf1qfYxJp93OLR07GCrEbBqcY+exFUOwES
 P9XssMt1lwmki5KxgkY5NRprdEnhb04fbCzzBvs28nhlEcDkMc+qFRD6U A==;
IronPort-SDR: ojjxIglEabFuYdW27NvFnA+TLUKkIlcvThyI6vVECRXf9Y5qyozDRJYzhzu5e2tU//Dy+g7jjC
 XFQD8ayrl8T8h2xMcYiYCXQMsLQ5lJ/HZ1tbNF8wmcFO374xXq+KjSj61b1nhkb/QzvP8VEhdt
 d/PoYTo1SCeeWy8jySJaCFECm2KRDL62KFwIhsE1ah6XqEWMvjIG/e4Yl8gFABUS9wm9CqR1NF
 MNPI/89t/9azpPT8tvUK4oLqP1b1BDrFfXWJR8m1v1WhfWtHePVFgrF4rbErbgZWHAYrFxXogQ
 BFg=
X-IronPort-AV: E=Sophos;i="5.75,457,1589212800"; d="scan'208";a="247710290"
Received: from mail-bn8nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.173])
 by ob1.hgst.iphmx.com with ESMTP; 10 Aug 2020 22:18:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsKa511QPIxJU+6IKpugT72LSjB0SPop9NcqroDnLQdIlMmpGOF7E1ikGumc6kmOm4jGuARqQNF7540clNy0K5kJLOJGdfQiCR3OyH3sYqF9T2qlhP23CzcDzvuJyhQYixFlG6P+HjQg+R/T+irc+Sm+UqxbSNL8/lw/JPaN9VLIs2+/i8B1YCxcakIFcmXMhZa0zFtKj4hq/XJMvGS/EunoGVbkaCKUs7hzgMFXKwT2tsfrx/V5k9FleFXb28WBykMT8pT7Kw/Dktqe8pPmo8jhKeVFjW6YIG1fQc5k+quu5EBO1n1MTj3KvuzWCmP+E8DY1SA8GmDhQOQ9wOXFLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPkSpIHB/vY0MVljwPrPoyh3+8jimfrnTg6TAeyPtF4=;
 b=NLwsAiornapZ2snMnjQeSUkabVgAGkRh6s/mbYvSjbBmoVdsS4cKYIdxyOwAKoOWdBWIaINSjXEHuW94sv4QN7aBJNckutyxyREH4exwJ6/La5ju0DjAWsv0LjBML5dBpYZD2ZMSKT51OCbRJNJHtpoaU6G7uSo5t5jBL9sFc+8QibTwoqomfiBqX4DMaHjQ6nzKVHre994pAsdwVGXVRzrm7OM0j3p62c8sedMfTU9XLewOy2reZHNdpKTP41VUBowtYONLKuZ1pP7rn69vQHNSAZsg/wxNZqMwkG0bR2j51sARYe1slekOsVsDIdxY6vGrIGspUZRwkQUKm+8F4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPkSpIHB/vY0MVljwPrPoyh3+8jimfrnTg6TAeyPtF4=;
 b=xbUgjDbCPiuS/k6V/+xSfoqkbUIW6liSEU3EiAhsbRpqFtlb7DDpf+HfWv8E7e9SBWBD8JS74nUoMnSe08ZFFz+0HQJfYFNjyfUhyGHRYNDk/NU7FtWCc8NI98yo3gD4tQ/kbG2ewfPqbK81C/Y/UbdnwU0Fk/lpPR1mhZ1WL+4=
Received: from BN6PR04MB0724.namprd04.prod.outlook.com (2603:10b6:404:ce::23)
 by BN8PR04MB5666.namprd04.prod.outlook.com (2603:10b6:408:75::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.22; Mon, 10 Aug
 2020 14:18:54 +0000
Received: from BN6PR04MB0724.namprd04.prod.outlook.com
 ([fe80::d61:179f:1b42:34b0]) by BN6PR04MB0724.namprd04.prod.outlook.com
 ([fe80::d61:179f:1b42:34b0%7]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 14:18:54 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [f2fs:dev-test 37/38] fs/f2fs/super.c:3058:48: error: 'struct
 blk_zone' has no member named 'capacity'
Thread-Index: AQHWXy6PfZDR2WQjB02w/inQrIOTq6kSCy8AgABozwCAHw/9AA==
Date: Mon, 10 Aug 2020 14:18:54 +0000
Message-ID: <20200810141852.GA15533@localhost.localdomain>
References: <202007211524.zrSvup2X%lkp@intel.com>
 <BY5PR04MB699535E4F62BEC16568A3E058C780@BY5PR04MB6995.namprd04.prod.outlook.com>
 <20200721195736.GA43066@google.com>
In-Reply-To: <20200721195736.GA43066@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [85.224.200.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b6fa0417-38db-42a9-d7b0-08d83d38503d
x-ms-traffictypediagnostic: BN8PR04MB5666:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR04MB56661E4BBC57E97B5E2C7BD9F2440@BN8PR04MB5666.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H+dnaBGAWFrHSChRQxQFuMSQmdQToR9vywc3LVeOl5rl0iQh4eQuxfPrh7iRFuseNzHVtsgKG8wuIUeHsa51YRf5RlVGLyp9rn3aGoUUIUAJ8geaTGqcelt+2Pzbe6rES933WLyu43el0FMdOIZIg5kgzO6SaCvScLdNnJeeqG39Dq6G8Sb/AuQmhZs1HVU3wTaDsygiR0LsoDePDtpZ18Lc+Yh3QmEz5Bm0f3hg1OvbsqhmoohU9FKIOSdGng8FDihytUtGXYoIP3vI0txm4F8h0r4ox8BlZ5yxbR/QqsJYm57LYVZUNOaDX6gU5kS2kgvzRJlVpwkClaCALYWWaunbhB/MexY9BhgJdb4t3dSXFaciglK8ddUTYqF93v0zlHaAnbohR+7gCGz0A9G3Cw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR04MB0724.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(9686003)(6916009)(6512007)(64756008)(66446008)(86362001)(66556008)(66476007)(316002)(66946007)(91956017)(186003)(966005)(8936002)(4326008)(1076003)(76116006)(2906002)(54906003)(71200400001)(33656002)(8676002)(5660300002)(6506007)(83380400001)(83080400001)(53546011)(26005)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 8/k+J9YFyK7eXxzWyodaU+t+eqxcP9RIgNAAU/BJGaIfxSHJs8k+zx++0LiJ1df9M0tZh3JzyVmm5eV2DMqkQqpEJoqP1XfXwj1NpNJDgJNkBS0lbRIXOe3Ctl1BgkCJFgJi40UAxUjsUps1/qmqcKJfzz3T5/OOscBe99Fet3VxwbpeHnGoLnZ5MrR3RnqGCIwRkRyBQypG9Zf7Wd96tBuQNyoNwmDXU2vLXMlA9mDNVP5s3w/qm3fZpj9tO4Mgqz71GM7Ur0fcopm6rnoFi4fdBiDc5eZ0T6y1kw4HFkepXWAKENqfHfiQIwKScbnvPj0ZAsKUDiXERFXgagWwN0ohadnPouWZgVEInEQ15M0AM4b0gGZMMGp/gDpV5CDOPAN65wHm1NxEAAolKY5RdL7HTUsXGNCH9Btx/uMRXu4SYCHDiuMs7MRRGSShvRnfw26Hup9ofTfQhzIATNb8uDGzLaD9Ya/ENO/NPlk6BQVbvYwWKbUACs8wuqbejC/oYIskVC1bdDCmjOJKkjwR41guUTXxwZ2iKm1mW2ovtEgB4OPdCsRdG7Kv5ydi/jIn3ZFKO16bRQE+P6+vWUAX+Z83x7FZlNC3HSVLRUDhcw9mjxXxV+nnoi6+UpX/XLU/juwkPO2WzXuEYbB5UvMuaw==
Content-ID: <40DCAD9D94DF0C46B0B4C5FF83A7A7F8@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR04MB0724.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fa0417-38db-42a9-d7b0-08d83d38503d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2020 14:18:54.4809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dvBgxKbMYuZvJeihJwv3LAugJT/8z/g1IYyUbdUINd2x+bnRvFLuSnfKI211okC71MEk/wyXnfeaCxHb0r9Xeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB5666
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k58yJ-002thR-VP
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 kernel test robot <lkp@intel.com>, Aravind Ramesh <Aravind.Ramesh@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Hans Holmberg <Hans.Holmberg@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 21, 2020 at 12:57:36PM -0700, Jaegeuk Kim wrote:
> On 07/21, Aravind Ramesh wrote:
> > Hello Jaegeuk,
> > The patch that adds the capacity struct member has been merged to linux-block tree's for-next branch.
> > So either:
> > 1. f2fs-dev branch has to carry the same patch, from here:
> > https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/log/include/uapi/linux/blkzoned.h?h=for-next
> > I had mentioned this is the cover letter of this patch.
> > 2. linux-block pull request has to be merged before f2fs pull request to Linus
> > 3. Or this f2fs patch has to wait until next merge window (the one after kernel 5.9 merge window)
> 
> Yeah, indeed. Let me queue this patch and try upstream later till block has it.

Hello Jaegeuk,

Just curious, where is this queued?

I can't find it on any of your branches on this git:
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git

FWIW, commit 82394db7383d ("block: add capacity field to zone descriptors")
is now in Torvald's tree.

Which merge window did you intend for this patch? 5.9 or 5.10?


Kind regards,
Niklas

> 
> Thanks,
> 
> > 
> > Thanks
> > Aravind
> > 
> > > -----Original Message-----
> > > From: kernel test robot <lkp@intel.com>
> > > Sent: Tuesday, July 21, 2020 12:43 PM
> > > To: Aravind Ramesh <Aravind.Ramesh@wdc.com>
> > > Cc: kbuild-all@lists.01.org; linux-f2fs-devel@lists.sourceforge.net; Jaegeuk Kim
> > > <jaegeuk@kernel.org>; Damien Le Moal <Damien.LeMoal@wdc.com>; Niklas Cassel
> > > <Niklas.Cassel@wdc.com>; Chao Yu <yuchao0@huawei.com>; Chao Yu
> > > <chao@kernel.org>
> > > Subject: [f2fs:dev-test 37/38] fs/f2fs/super.c:3058:48: error: 'struct blk_zone' has
> > > no member named 'capacity'
> > > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
> > > head:   439633ba3673a5d8983529426df144c64a23d181
> > > commit: d787c5eec8b58bb47d4bf750758e0e87d667bf56 [37/38] f2fs: support
> > > zone capacity less than zone size
> > > config: nds32-allyesconfig (attached as .config)
> > > compiler: nds32le-linux-gcc (GCC) 9.3.0
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-
> > > tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         git checkout d787c5eec8b58bb47d4bf750758e0e87d667bf56
> > >         # save the attached .config to linux build tree
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross
> > > ARCH=nds32
> > > 
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > >    fs/f2fs/super.c: In function 'f2fs_report_zone_cb':
> > > >> fs/f2fs/super.c:3058:48: error: 'struct blk_zone' has no member named 'capacity'
> > >     3058 |  rz_args->dev->zone_capacity_blocks[idx] = zone->capacity >>
> > >          |                                                ^~
> > >    fs/f2fs/super.c:3060:23: error: 'struct blk_zone' has no member named 'capacity'
> > >     3060 |  if (zone->len != zone->capacity && !rz_args->zone_cap_mismatch)
> > >          |                       ^~
> > > 
> > > vim +3058 fs/f2fs/super.c
> > > 
> > >   3048
> > >   3049	static int f2fs_report_zone_cb(struct blk_zone *zone, unsigned int idx,
> > >   3050				      void *data)
> > >   3051	{
> > >   3052		struct f2fs_report_zones_args *rz_args = data;
> > >   3053
> > >   3054		if (zone->type == BLK_ZONE_TYPE_CONVENTIONAL)
> > >   3055			return 0;
> > >   3056
> > >   3057		set_bit(idx, rz_args->dev->blkz_seq);
> > > > 3058		rz_args->dev->zone_capacity_blocks[idx] = zone->capacity >>
> > >   3059
> > > 	F2FS_LOG_SECTORS_PER_BLOCK;
> > >   3060		if (zone->len != zone->capacity && !rz_args->zone_cap_mismatch)
> > >   3061			rz_args->zone_cap_mismatch = true;
> > >   3062
> > >   3063		return 0;
> > >   3064	}
> > >   3065
> > > 
> > > ---
> > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
