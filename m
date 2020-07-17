Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B6F223736
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jul 2020 10:36:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jwLqz-0003xw-3D; Fri, 17 Jul 2020 08:36:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=46091b2bc=Aravind.Ramesh@wdc.com>)
 id 1jwLqx-0003xp-VU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 08:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PDXhKNrWTYnUg8Gu3JN/PlllFeCsb8bxWjjHXIXr2BM=; b=BBM0tQlnmzbWl/Gehk9moha6iM
 ZhJiIzZeL0/rU+8k7GNGMSc6tMJ9Q5Ia0lpAmHm1+X4fycS46MxTY5HRW2azX8fQQut+ovC+RK2zW
 Crkz1s/RVIU6QsuzlCQd+oosMzIK22/dwnApxtD7X9Rv1s6IdWgCcIlMYy4zUKBu53A8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PDXhKNrWTYnUg8Gu3JN/PlllFeCsb8bxWjjHXIXr2BM=; b=cAuqdNpWXeNugoMA/y9OGrMxkv
 mpooYrNMDwzptLyyXFE8enZiflBGztUVungRQbpnFstVdV7TXMScBzOaU516hbUglR3f9EKxcevMb
 N8e/YlvJH54f2M0NstZdU3CZGrRicyRis+AwEV+J1gld3B1NV1ciKVoVCpmZGAwfdty0=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jwLqu-00Bn0m-4S
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 08:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594974980; x=1626510980;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TdoD72vnNKE+rLa5QQTlICm3mk0qXlElWzg4uxCTqkg=;
 b=YdMDJSIVQGQkseb9LVgsiqBcrvl0nwtXoad45W4Q3c4sBWaZGgDoOpoc
 W/uzat3XtFSxfdT0q0fDvK7WtHW+c+hcDl3QaCbn62jwaWWNGz2bwcAAc
 6xsZgqXuwpRWegLgQjxeERfqsaxRAYmhBsm0nnrqwClM1PXTbT0tqBhmO
 b75L0t9cLd+3dKI45wtt38a5rqLZPXXXGikYWfdZ+cRykxieEM4bCq+Mq
 eA+l/vExUTeIRxtIb7dggCkFTiWdOwTMSD3jhJWNUNKjdLJ4fPTcMWF75
 HyRhMmPSnGf7U5Kc1fCR+LxZFjraJpiBYcniw6WV5gHatf6rYpSTzwbCQ g==;
IronPort-SDR: vE0WXZsV/9UDusA65zT3g3+VC8nj7DrCDhyvsEasdHIBSyF5BI1CxDlVnHb/B9/+RNQHYGxHRi
 r5TnZzyT3HmPfi2T4eg8HjIvsUTktmQBZ/uxreGd6F+H37uC2u4p9bGoEdP5vy+jZKcOd8dLkN
 5sZ5qrSavp/4XWrtFxxIjKaE3jui3XVe+qU9y2lrceWVYx+DZDPiqlPhAeAcEhtDEUGQbuWMyV
 AlXUh/xhUmjLk3AuD9HgxFZjaGSZ2oBhbl6rbUPPvZuBQG+v+CGlQ0qwOwiIVIp57gBxTDyAgj
 6PU=
X-IronPort-AV: E=Sophos;i="5.75,362,1589212800"; d="scan'208";a="147007292"
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hgst.iphmx.com with ESMTP; 17 Jul 2020 16:36:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CN2WtDRlouK+mbrBhkMy2x+47Q+xNdjmlPDYyBvgf7bCe/TwbhBx0Y1zPX0Mrg8W1Z3Ml35l0I7diyNNVWETUuUNgVKfEMgMDtVEL/bg1chjfYZDUDm8Pn84tLqGYSRS/Z+6dn/dcjgwakqKJSzN9b+1Gyj0D3vbhPSByULopER7+QsjNq8sq8ihbRa0+inNLLjD4toIcJqDZCqevN+6Qebq7j055UPBfikY7TDfz5lXJdOEBIyGIyiFqhMdrjtYLwf/kJvGeAeDBF9ZO2GZEUCGiXKvBC/dlMwjkshLwgiaBmXJioWpcLJoX4yIZeHNYjMYMexvpv+VaQijnBg/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDXhKNrWTYnUg8Gu3JN/PlllFeCsb8bxWjjHXIXr2BM=;
 b=UdbeOhfv+AyTbs6Do4T8/3WTtYtOIBunbgquGDPUafBANw4okufj7ijSC3lLyd6TQMA8U9pSzb30LXLxknajNUfZtGkZVBsmQ9uqFHlqtoFPOjWcNGDPJctPlmomQUf/W3SVKiR6Rhnq5THQdXKidege7eJLrRQx/33+ZYlFhSfBn9v1/hckwjXF07MwTGWHCanD0OF7UFqg4io9N52pJ9ovVVKY9Ag6axkfXKYE63DfNuLFy/DWYsLq8ULB3ZwKO8vdxfQlaqYh1AvYddeopXZTb7Wbf7xEsYxb01/Ot+DFX9IoiLH7Re366Gd4uv4wzbobvcMA3VGSSbtw/bjazQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDXhKNrWTYnUg8Gu3JN/PlllFeCsb8bxWjjHXIXr2BM=;
 b=pUbl8ZiJ5tIxBr03FN32yTLYXUblR1Wwmn6ljT4w3/31Yw0Iz2DXFnKVY1s8FtFzGeOImK1THaTsEaXciuEwN+5li36zQYbUtu+/sbUUjs2slZLZVWOkxvJrDpNBoWllN+vtxV7UzuZEcX81dHxtSBjREzuDFjSNc9scSW/QMIA=
Received: from BY5PR04MB6995.namprd04.prod.outlook.com (2603:10b6:a03:22c::12)
 by BYAPR04MB6166.namprd04.prod.outlook.com (2603:10b6:a03:ee::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Fri, 17 Jul
 2020 08:36:03 +0000
Received: from BY5PR04MB6995.namprd04.prod.outlook.com
 ([fe80::f813:2bba:2c5c:a63b]) by BY5PR04MB6995.namprd04.prod.outlook.com
 ([fe80::f813:2bba:2c5c:a63b%7]) with mapi id 15.20.3174.026; Fri, 17 Jul 2020
 08:36:03 +0000
From: Aravind Ramesh <Aravind.Ramesh@wdc.com>
To: Chao Yu <yuchao0@huawei.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [PATCH 1/2] mkfs.f2fs: zns zone-capacity support.
Thread-Index: AQHWUIkYYbwd9i8RuESpv0bt6LqsjqkLdpAAgAACutA=
Date: Fri, 17 Jul 2020 08:36:03 +0000
Message-ID: <BY5PR04MB6995E15DDEA1E62C4B7624A48C7C0@BY5PR04MB6995.namprd04.prod.outlook.com>
References: <20200702155427.13372-1-aravind.ramesh@wdc.com>
 <20200702155427.13372-2-aravind.ramesh@wdc.com>
 <c9bf27ba-ca48-cd54-4567-305e42f66dc2@huawei.com>
In-Reply-To: <c9bf27ba-ca48-cd54-4567-305e42f66dc2@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [49.207.56.182]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d0ba68af-bab6-419e-9f02-08d82a2c7103
x-ms-traffictypediagnostic: BYAPR04MB6166:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB6166725DA5DE95AB6A3697A38C7C0@BYAPR04MB6166.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:644;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c1mCsmekFz0AdNaxcslgahTSchAigsrK0j5mkd0Eiy8alTEwVL5g3rlMdgkm56uvYFNUvcvGZsB9EgmCSlAzcmm7EDl365Xe91K2qTXUMP17jwfrUqOugimJD49UcxsyniDq3E2Xq3vBvvQVKVNORhPZnYE7H3DCuSA/gSoltHqH5CRoxhewd1099pPp32zx6Qtxx5J7pbQWyEc371UIgrFwiy60R/E9irQZYquHNaP0uRqoQcLz+amftMMQMfyegA1zzcNGZi80Afukv39tL+9KpZ6kyZ3urG1IdP48+xR0K9kc2BrZTL4LwyCnRW/J
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6995.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(64756008)(8676002)(66446008)(2906002)(316002)(76116006)(53546011)(55016002)(110136005)(186003)(66556008)(66946007)(6506007)(478600001)(83380400001)(7696005)(54906003)(52536014)(66476007)(30864003)(86362001)(9686003)(5660300002)(33656002)(26005)(55236004)(4326008)(8936002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: rcCJYxOJ3W1WHDsTMphlKfXO1mhtLE8gPT0lQL/ZJ3LtJHGoqS+BrKAYJJIZZ/7RHYnrTP4Opm8u8hTof3r4NrFO2EZKezbu7/v5RueoAJ9i7lJUArWoQg1ch0OCckI+qCn87h6aOhdSP90KXmd4Dz0wZitrpSuRrGlBlqbK6/hdJzJePO24rhlGXbg8RB+3MNNOZoPEk3vZHqwqaeiZWnQHAOy51sMAo9nfhrGB4t23qkuC5RFDRYY6GgP9+JSE9w13iNSNtF3hpcG219aPcftiMp//T4VKFQq9ocxVJZhoEOCaEIx6hJoVXe08BehY8lutNUiC0cn8k1kgtz+J8SQDSsxAIJxqD/m4YtRJTWHcs6+vTdWl/f2e5QWBWmRh08AHcX9LwAlcYqRq7MvnOrzEVLemqjlzx6PSQ8gVz493SZBLafolJ+/zDJeGLdbHGOihOqNLLM/VPiYX0gax7VuTklCZsTAEeIW9KwcV1Zw=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6995.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ba68af-bab6-419e-9f02-08d82a2c7103
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 08:36:03.3974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +CrxuTTvcMLl6S7RlidUdzQ7h784nwHoL5R/cNY943TzB74Tf6fkZ5khbQ4YU48sPytyL6vQQ/KPgOBmO/G99Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6166
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwLqu-00Bn0m-4S
Subject: Re: [f2fs-dev] [PATCH 1/2] mkfs.f2fs: zns zone-capacity support.
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
Cc: Matias Bjorling <Matias.Bjorling@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


> -----Original Message-----
> From: Chao Yu <yuchao0@huawei.com>
> Sent: Friday, July 17, 2020 12:58 PM
> To: Aravind Ramesh <Aravind.Ramesh@wdc.com>; jaegeuk@kernel.org; linux-f2fs-
> devel@lists.sourceforge.net
> Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>; Matias Bjorling
> <Matias.Bjorling@wdc.com>
> Subject: Re: [PATCH 1/2] mkfs.f2fs: zns zone-capacity support.
> 
> On 2020/7/2 23:54, Aravind Ramesh wrote:
> > NVM Express Zoned Namespace (ZNS) devices can have zone-capacity(zc)
> > less than the zone-size. ZNS defines a per zone capacity which can be
> > equal or less than the zone-size. Zone-capacity is the number of
> > usable blocks in the zone. In such cases, the filesystem should not
> > write/read beyond the zone-capacity. Update the super block with the
> > usable number of blocks and free segment count in the ZNS device
> > zones, if zone-capacity is less than zone-size. Set reserved segment
> > count and overprovision ratio based on the usable segments in the zone.
> >
> > Signed-off-by: Aravind Ramesh <aravind.ramesh@wdc.com>
> > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > ---
> >  configure.ac        |  4 ++++
> >  include/f2fs_fs.h   | 40 +++++++++++++++++++++++++++++++----
> >  lib/libf2fs_io.c    |  1 +
> >  lib/libf2fs_zoned.c | 51
> > +++++++++++++++++++++++++++++++++++++++++++--
> >  mkfs/f2fs_format.c  | 26 ++++++++++++++++++-----
> >  5 files changed, 111 insertions(+), 11 deletions(-)
> >
> > diff --git a/configure.ac b/configure.ac index 9ac0c24..e9acd1a 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -213,6 +213,10 @@ AC_CONFIG_FILES([
> >  	tools/f2fs_io/Makefile
> >  ])
> >
> > +AC_CHECK_MEMBER([struct blk_zone.capacity],
> > +		[AC_DEFINE(HAVE_BLK_ZONE_REP_V2, [1], [report zones includes
> zone capacity])],
> > +		[], [[#include <linux/blkzoned.h>]])
> > +
> >  # export library version info for mkfs/libf2fs_format_la
> > AC_SUBST(FMT_CURRENT, 6)  AC_SUBST(FMT_REVISION, 0) diff --git
> > a/include/f2fs_fs.h b/include/f2fs_fs.h index 709bfd8..40165ed 100644
> > --- a/include/f2fs_fs.h
> > +++ b/include/f2fs_fs.h
> > @@ -332,6 +332,7 @@ struct device_info {
> >  	u_int32_t nr_zones;
> >  	u_int32_t nr_rnd_zones;
> >  	size_t zone_blocks;
> > +	size_t *zone_cap_blocks;
> >  };
> >
> >  typedef struct {
> > @@ -1324,13 +1325,42 @@ blk_zone_cond_str(struct blk_zone *blkz)
> >  	return "Unknown-cond";
> >  }
> >
> > -#define blk_zone_empty(z)	(blk_zone_cond(z) == BLK_ZONE_COND_EMPTY)
> > +/*
> > + * Handle kernel zone capacity support  */ #ifndef
> > +HAVE_BLK_ZONE_REP_V2
> > +#define BLK_ZONE_REP_CAPACITY   (1 << 0)
> > +struct blk_zone_v2 {
> > +	__u64   start;          /* Zone start sector */
> > +	__u64   len;            /* Zone length in number of sectors */
> > +	__u64   wp;             /* Zone write pointer position */
> > +	__u8    type;           /* Zone type */
> > +	__u8    cond;           /* Zone condition */
> > +	__u8    non_seq;        /* Non-sequential write resources active */
> > +	__u8    reset;          /* Reset write pointer recommended */
> > +	__u8    resv[4];
> > +	__u64   capacity;       /* Zone capacity in number of sectors */
> > +	__u8    reserved[24];
> > +};
> > +#define blk_zone blk_zone_v2
> >
> > +struct blk_zone_report_v2 {
> > +	__u64   sector;
> > +	__u32   nr_zones;
> > +	__u32   flags;
> > +struct blk_zone zones[0];
> > +};

[snip...]

> > @@ -1352,6 +1383,7 @@ static inline double
> > get_best_overprovision(struct f2fs_super_block *sb)  {
> >  	double reserved, ovp, candidate, end, diff, space;
> >  	double max_ovp = 0, max_space = 0;
> > +	u_int32_t usable_main_segs = f2fs_get_usable_segments(sb);
> >
> >  	if (get_sb(segment_count_main) < 256) {
> >  		candidate = 10;
> > @@ -1365,9 +1397,9 @@ static inline double
> > get_best_overprovision(struct f2fs_super_block *sb)
> >
> >  	for (; candidate <= end; candidate += diff) {
> >  		reserved = (2 * (100 / candidate + 1) + 6) *
> > -						get_sb(segs_per_sec);
> > -		ovp = (get_sb(segment_count_main) - reserved) * candidate / 100;
> > -		space = get_sb(segment_count_main) - reserved - ovp;
> > +				(usable_main_segs / get_sb(section_count));
> 
> It looks segs_per_sec becomes an average value in whole zns device, I'm not sure
> whether calculating with divide round down way is safe enough to reserve space, as
> it may cut several segments, which may be needed during foreground GC, so I
> suggest to use DIV_ROUND_UP() here to avoid boundary issue.

Yes, it tries to reflect the usable segs_per_sec rather than using a value based on zone-size,
which could, reserve more than the intended amount of segments.

I do see a round_down(x, y) in the f2fs-tools code. But no, round_up().

Does this look ok?
DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
(from kernel.h)

> 
> > +		ovp = (usable_main_segs - reserved) * candidate / 100;
> > +		space = usable_main_segs - reserved - ovp;
> >  		if (max_space < space) {
> >  			max_space = space;
> >  			max_ovp = candidate;
> > diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c index
> > 1f597a9..138285d 100644
> > --- a/lib/libf2fs_io.c
> > +++ b/lib/libf2fs_io.c
> > @@ -784,6 +784,7 @@ int f2fs_finalize_device(void)
> >  			break;
> >  		}
> >  		free(c.devices[i].path);
> > +		free(c.devices[i].zone_cap_blocks);
> >  	}
> >  	close(c.kd);
> >
> > diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c index
> > efc687c..f98fcdb 100644
> > --- a/lib/libf2fs_zoned.c
> > +++ b/lib/libf2fs_zoned.c
> > @@ -291,6 +291,13 @@ int f2fs_check_zones(int j)
> >  		return -ENOMEM;
> >  	}
> >
> > +	dev->zone_cap_blocks = malloc(dev->nr_zones * sizeof(size_t));
> > +	if (!dev->zone_cap_blocks) {
> > +		ERR_MSG("No memory for zone capacity list.\n");
> > +		return -ENOMEM;
> > +	}
> > +	memset(dev->zone_cap_blocks, 0, (dev->nr_zones * sizeof(size_t)));
> > +
> >  	dev->nr_rnd_zones = 0;
> >  	sector = 0;
> >  	total_sectors = (dev->total_sectors * c.sector_size) >> 9; @@
> > -335,10 +342,15 @@ int f2fs_check_zones(int j)
> >  				    blk_zone_cond_str(blkz),
> >  				    blk_zone_sector(blkz),
> >  				    blk_zone_length(blkz));
> > +				dev->zone_cap_blocks[n] =
> > +					blk_zone_length(blkz) >>
> > +					(F2FS_BLKSIZE_BITS - SECTOR_SHIFT);
> >  			} else {
> >  				DBG(2,
> > -				    "Zone %05u: type 0x%x (%s), cond 0x%x (%s),
> need_reset %d, "
> > -				    "non_seq %d, sector %llu, %llu sectors, wp sector
> %llu\n",
> > +				    "Zone %05u: type 0x%x (%s), cond 0x%x (%s),"
> > +				    " need_reset %d, non_seq %d, sector %llu,"
> > +				    " %llu sectors, capacity %llu,"
> > +				    " wp sector %llu\n",
> >  				    n,
> >  				    blk_zone_type(blkz),
> >  				    blk_zone_type_str(blkz),
> > @@ -348,7 +360,11 @@ int f2fs_check_zones(int j)
> >  				    blk_zone_non_seq(blkz),
> >  				    blk_zone_sector(blkz),
> >  				    blk_zone_length(blkz),
> > +				    blk_zone_capacity(blkz, rep->flags),
> >  				    blk_zone_wp_sector(blkz));
> > +				dev->zone_cap_blocks[n] =
> > +					blk_zone_capacity(blkz, rep->flags) >>
> > +					(F2FS_BLKSIZE_BITS - SECTOR_SHIFT);
> >  			}
> >
> >  			sector = blk_zone_sector(blkz) + blk_zone_length(blkz);
> @@ -473,6
> > +489,33 @@ out:
> >  	return ret;
> >  }
> >
> > +uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb) {
> > +#ifdef HAVE_BLK_ZONE_REP_V2
> > +	int i, j;
> > +	uint32_t usable_segs = 0, zone_segs;
> > +	for (i = 0; i < c.ndevs; i++) {
> > +		if (c.devices[i].zoned_model != F2FS_ZONED_HM) {
> > +			usable_segs += c.devices[i].total_segments;
> > +			continue;
> > +		}
> > +		for (j = 0; j < c.devices[i].nr_zones; j++) {
> > +			zone_segs = c.devices[i].zone_cap_blocks[j] >>
> > +					get_sb(log_blocks_per_seg);
> > +			if (c.devices[i].zone_cap_blocks[j] %
> > +
> 	DEFAULT_BLOCKS_PER_SEGMENT)
> > +				usable_segs += zone_segs + 1;
> > +			else
> > +				usable_segs += zone_segs;
> > +		}
> > +	}
> > +	usable_segs -= (get_sb(main_blkaddr) - get_sb(segment0_blkaddr)) >>
> > +						get_sb(log_blocks_per_seg);
> > +	return usable_segs;
> > +#endif
> > +	return get_sb(segment_count_main);
> > +}
> > +
> >  #else
> >
> >  int f2fs_report_zone(int i, u_int64_t UNUSED(sector), void
> > *UNUSED(blkzone)) @@ -527,5 +570,9 @@ int f2fs_reset_zones(int i)
> >  	return -1;
> >  }
> >
> > +uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb) {
> > +	return get_sb(segment_count_main);
> > +}
> >  #endif
> >
> > diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c index
> > 4999cac..74a81c8 100644
> > --- a/mkfs/f2fs_format.c
> > +++ b/mkfs/f2fs_format.c
> > @@ -425,13 +425,19 @@ static int f2fs_prepare_super_block(void)
> >
> >  	set_sb(segment_count_main, get_sb(section_count) * c.segs_per_sec);
> >
> > -	/* Let's determine the best reserved and overprovisioned space */
> > +	/*
> > +	 * Let's determine the best reserved and overprovisioned space.
> > +	 * For Zoned device, if zone capacity less than zone size, the segments
> > +	 * starting after the zone capacity are unusable in each zone. So get
> > +	 * overprovision ratio and reserved seg count based on avg usable
> > +	 * segs_per_sec.
> > +	 */
> >  	if (c.overprovision == 0)
> >  		c.overprovision = get_best_overprovision(sb);
> >
> >  	c.reserved_segments =
> > -			(2 * (100 / c.overprovision + 1) + NR_CURSEG_TYPE)
> > -			* c.segs_per_sec;
> > +			(2 * (100 / c.overprovision + 1) + NR_CURSEG_TYPE) *
> > +			(f2fs_get_usable_segments(sb) / get_sb(section_count));
> 
> Ditto, DIV_ROUND_UP()

Ok

> 
> >
> >  	if (c.overprovision == 0 || c.total_segments < F2FS_MIN_SEGMENTS ||
> >  		(c.devices[0].total_sectors *
> > @@ -672,19 +678,29 @@ static int f2fs_write_check_point_pack(void)
> >  	set_cp(valid_block_count, 2 + c.quota_inum + c.quota_dnum +
> >  			c.lpf_inum + c.lpf_dnum);
> >  	set_cp(rsvd_segment_count, c.reserved_segments);
> > -	set_cp(overprov_segment_count, (get_sb(segment_count_main) -
> > +
> > +	/*
> > +	 * For zoned devices, if zone capacity less than zone size, get
> > +	 * overprovision segment count based on usable segments in the device.
> > +	 */
> > +	set_cp(overprov_segment_count, (f2fs_get_usable_segments(sb) -
> >  			get_cp(rsvd_segment_count)) *
> >  			c.overprovision / 100);
> >  	set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
> >  			get_cp(rsvd_segment_count));
> >
> > +	if (f2fs_get_usable_segments(sb) < (get_cp(rsvd_segment_count) +
> 
> equal is not allowed as well?

You are right, will make it " <= "

Thanks for the feedback,
Aravind
> 
> > +					get_cp(overprov_segment_count))) {
> > +		MSG(0, "\tError: Not enough segments to create F2FS Volume\n");
> > +		goto free_nat_bits;
> > +	}
> >  	MSG(0, "Info: Overprovision ratio = %.3lf%%\n", c.overprovision);
> >  	MSG(0, "Info: Overprovision segments = %u (GC reserved = %u)\n",
> >  					get_cp(overprov_segment_count),
> >  					c.reserved_segments);
> >
> >  	/* main segments - reserved segments - (node + data segments) */
> > -	set_cp(free_segment_count, get_sb(segment_count_main) - 6);
> > +	set_cp(free_segment_count, f2fs_get_usable_segments(sb) - 6);
> >  	set_cp(user_block_count, ((get_cp(free_segment_count) + 6 -
> >  			get_cp(overprov_segment_count)) * c.blks_per_seg));
> >  	/* cp page (2), data summaries (1), node summaries (3) */
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
