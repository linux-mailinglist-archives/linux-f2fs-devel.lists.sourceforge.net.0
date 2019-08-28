Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 154959FD28
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Aug 2019 10:33:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2tNw-00083a-Re; Wed, 28 Aug 2019 08:32:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1363b3d4c=shinichiro.kawasaki@wdc.com>)
 id 1i2tNv-00082w-H0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Aug 2019 08:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WiYuUyNoYjX5H89ZgKy5mk/yThNahgKnH/mV4IHpMdY=; b=XnHzKgqWn2eziina6dS4y+mtWz
 5awjZAk5MPPwUh1KqmhDezxlLXZtVDB+6qG34KP9sIhxf700vsNecQbpWOkOzDum0Ql+rZkqTIuqi
 Azr8o/qW5kvpMq8sBC18B33d4OARZBawlPU0T8ULz7eUL402I5JxmleftoLbJpKhMvaY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WiYuUyNoYjX5H89ZgKy5mk/yThNahgKnH/mV4IHpMdY=; b=MYyuJ05Nsy4f/gs7usz9Qlkcbk
 whSRf0uQ0c7907xfs/pyPkxif56jYKafHQHJrHvpSJW01AWDFw0vnrH94oeTTGSQzZYTPP1unV6ad
 AWYuGghSj8vd2mFu2tw9BORUS9yQqKbu5uOJyQwo7GBBsCYc6+Xa4nAhRfeyFg3WIAps=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2tNr-000ecs-BI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Aug 2019 08:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566981172; x=1598517172;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SaReTTC717hEuam7OXxJIPg7UTAg7YmIdIJ2Zw/5gLo=;
 b=aJRUjQlWkHZwwps4bKsQZ1LfIMp30YqCONvQ2I1a5fcHeRoSz1YGLdny
 boUv6Uku2jhyZp8eNKAW5xviiwMExjjKAkPrSAefsrNZQeLKcrLB9v/1W
 l6mLL+lyaaAByqJM0dHkBc6+i2e93gPVPzGENZTsVvaOWq50Ihr3Rg5qk
 NqNhZGzpL8A44bD02k9uxfKcw1lk+4lpWIJkDc//+FStMRG/x8W/2yV3X
 Jrwp1f/pVZjZeRWxqCZzDnLSSB2J0I+9S+ENtcr8cYYbWUOKWHQH6Qj54
 c7x6xBjdQOPye9+2KIe9uz1jcfQOVXZ7njT/OcNzN9Q9jIPLwZHaQ4p3j A==;
IronPort-SDR: Oowzqx6KM2xHJbbD5OM64/r5WjJrS9J4HhqT1T7+6q1FubqK46jm0MiKY62O3I4wWlbupSKzo1
 iikxt6GKKFey4HfHZACcYmO3KT8yQCwU8GoXL+r5/PmCYpWmM5iZuxaRF2ZrXouqvnn36DvRZe
 9uxZ/MVJHXy+aSvNRTMKx7izbqw3aLunHzz6/YbyRNQ3Sgexmkv6JrdfXMtbLDls0RAzJBWYNb
 /tsEdWA/htMFvJ+qmbLTiFn5IkOOZULO01TvcWBweTdXwGMmy7U6nSXk2aIs87AA9NnJUBvRGZ
 n5g=
X-IronPort-AV: E=Sophos;i="5.64,440,1559491200"; d="scan'208";a="117758098"
Received: from mail-co1nam03lp2059.outbound.protection.outlook.com (HELO
 NAM03-CO1-obe.outbound.protection.outlook.com) ([104.47.40.59])
 by ob1.hgst.iphmx.com with ESMTP; 28 Aug 2019 16:32:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKu0T/dr2XzOszAVQLyIr5DNI4RY9D9HOwdFdry+RlhBsn1B4b+DFpjw9M60xPu64mf/CwdLzfIWzn9D+5yYSvj1X7wyQ4yjDD8/wheLrYsmo/pey24up/hguDQQVrnUBOS35i6Pdie+wck1HLF67qrJ1KipkO2tgiXWTYsQHV0JVlPLPCy0ArWjOcM5PEb9NLVrV/LHhqOye0XUM8WH+qYCQwYLK2S4ZSKO3Za6fnivUpSQHbxWSDhbNK0NfwGSZVtemom24JZWbageNvNgWIOk7Dqpv2r7a60JXaR+67PfEDD5A4T6jb70WbMvvaGDy0OSkxpL2Cmchxho+PLwUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiYuUyNoYjX5H89ZgKy5mk/yThNahgKnH/mV4IHpMdY=;
 b=EPreb7JtnxGhfeYWWTAAmHJ7mAIbxp0utIWgcQQiyat9LnQREr7XUFXeKsVUunMVSb9Yv5xFDwEHCu8AE/4hARkNbSvtvgPNJwrrwHg7eYYsP+ALVwRgujko0AOsuPTZo3Mbc32KjCYyuw+4Sm5AcGmD8JMOXOYf3ll/MhJA1ovWi0LSOqcfvBqQq8V3HsLavMf/u/mvS2OEZv3Tjt4j9XY4vJ75kH9kTcjiecfsKEYDGqz4zOy5ggvCRvG34rZ9mDseHviLzgtJRboq+sHz9NvepergAuMUeqPSXyg3OPiLkrVHKwor83TyxE5C7vR+5yyrYSrWECw6dnQnajDxEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiYuUyNoYjX5H89ZgKy5mk/yThNahgKnH/mV4IHpMdY=;
 b=UqFPaMBZH2y6m6+VJfJG7OJtcvkEFk2kAopHkji8XzvDevo2pKF8u8wHKD9dU+4TAY4+IPXU2h4Iy3vJ+Dwba5hBu75c74/Ypz51CcugfsQb4EoS49LlsQRB+q8KaxW4au4lN7B4A1t6YPYAtTBQp4Irc2sYZmZcBMH1RrIps30=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2345.namprd04.prod.outlook.com (10.166.204.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Wed, 28 Aug 2019 08:32:44 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::31aa:d179:ec71:4a66]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::31aa:d179:ec71:4a66%9]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 08:32:44 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v2 1/4] libf2fs_zoned: Introduce f2fs_report_zones()
 helper function
Thread-Index: AQHVV9unnNuR1inEP0+ptFs3Z4WSHacOP4OAgAIHFYA=
Date: Wed, 28 Aug 2019 08:32:44 +0000
Message-ID: <20190828083241.cxmtl7f4i4snkaur@shindev.dhcp.fujisawa.hgst.com>
References: <20190821044802.29702-1-shinichiro.kawasaki@wdc.com>
 <20190821044802.29702-2-shinichiro.kawasaki@wdc.com>
 <a04bfef2-04a6-9e31-79db-b4eb1827022a@huawei.com>
In-Reply-To: <a04bfef2-04a6-9e31-79db-b4eb1827022a@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8d081f1-ce2c-4f0b-db2d-08d72b924cb5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY1PR04MB2345; 
x-ms-traffictypediagnostic: CY1PR04MB2345:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB234553FE880FA496EEA40C37EDA30@CY1PR04MB2345.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(189003)(199004)(446003)(25786009)(76116006)(86362001)(6916009)(11346002)(53936002)(3846002)(66556008)(66446008)(66946007)(66476007)(64756008)(91956017)(6486002)(4326008)(9686003)(229853002)(54906003)(6436002)(478600001)(99286004)(6512007)(6246003)(14454004)(6116002)(186003)(305945005)(2906002)(5660300002)(81166006)(316002)(81156014)(76176011)(58126008)(486006)(1076003)(44832011)(7736002)(476003)(8936002)(66066001)(53546011)(102836004)(71190400001)(71200400001)(26005)(6506007)(8676002)(256004)(357404004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2345;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +iShFYWoEq50vPV7g1VslGd5ZJscR8/sEVT23HYnnZVfdDepRFL66rvTSdKf8YkMc0EowEhFKXWJvysAStdIgM51hcD/WQzU2po2SVkIrGzlx3xNlA2gFzNdoDXOjVxfXweaCWlqIvB7J7IrJII/T/hcfdFh3m5juqSGUO56WSZE+4/bkkFbmoETou/H+5geW5sa0E7DiAlcSOcDwsOfLE4lITp0iaB9ORUBwYR3jXPFzOLCHTIL/ltm2BM/q71w5qg84ipqAXcZj+9hvcoCWedKnU0mcayOtUnx15Fr1Asy8bnEyhce+VK/w3IZQjSBVo5P5mc8T/Rs6uVrvgiuvi9p0WfrkZ+OVxLLKoeFU0qENEjOADSwbJbB63fI4FPw1ve370rcp/CRSKjlCXF6l0SNm6wQqX9iZDflx+xDq0w=
Content-ID: <B58FD174306D164A97586AE81DF872C2@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d081f1-ce2c-4f0b-db2d-08d72b924cb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 08:32:44.6281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kC/OJ/djSPXaNaDbJHKx07yEgSeXwMkcp6/XNmARMEYP6MjkRbaW4ql9MmrgQVASGrow2WTo5CRUYPHoqg0VexJMnvXt/9Y2Gtow9qgAHKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2345
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1i2tNr-000ecs-BI
Subject: Re: [f2fs-dev] [PATCH v2 1/4] libf2fs_zoned: Introduce
 f2fs_report_zones() helper function
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Aug 27, 2019 / 09:34, Chao Yu wrote:
> On 2019/8/21 12:47, Shin'ichiro Kawasaki wrote:
> > To prepare for write pointer consistency check by fsck, add
> > f2fs_report_zones() helper function which calls REPORT ZONE command to
> > get write pointer status. The function is added to lib/libf2fs_zoned
> > which gathers zoned block device related functions.
> > 
> > To check write pointer consistency with f2fs meta data, fsck needs to
> > refer both of reported zone information and f2fs super block structure
> > "f2fs_sb_info". However, libf2fs_zoned does not import f2fs_sb_info. To
> > keep f2fs_sb_info structure out of libf2fs_zoned, provide a callback
> > function in fsck to f2fs_report_zones() and call it for each zone.
> > 
> > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > ---
> >  include/f2fs_fs.h   |  2 ++
> >  lib/libf2fs_zoned.c | 57 +++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 59 insertions(+)
> > 
> > diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> > index 0d9a036..abadd1b 100644
> > --- a/include/f2fs_fs.h
> > +++ b/include/f2fs_fs.h
> > @@ -1279,6 +1279,8 @@ blk_zone_cond_str(struct blk_zone *blkz)
> >  
> >  extern int f2fs_get_zoned_model(int);
> >  extern int f2fs_get_zone_blocks(int);
> > +typedef int (report_zones_cb_t)(int i, struct blk_zone *blkz, void *opaque);
> > +extern int f2fs_report_zones(int, report_zones_cb_t *, void *);
> >  extern int f2fs_check_zones(int);
> >  extern int f2fs_reset_zones(int);
> >  
> > diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
> > index af00b44..fc4974f 100644
> > --- a/lib/libf2fs_zoned.c
> > +++ b/lib/libf2fs_zoned.c
> > @@ -193,6 +193,57 @@ int f2fs_get_zone_blocks(int i)
> >  
> >  #define F2FS_REPORT_ZONES_BUFSZ	524288
> >  
> > +int f2fs_report_zones(int j, report_zones_cb_t *report_zones_cb, void *opaque)
> > +{
> > +	struct device_info *dev = c.devices + j;
> > +	struct blk_zone_report *rep;
> > +	struct blk_zone *blkz;
> > +	unsigned int i, n = 0;
> > +	u_int64_t total_sectors = (dev->total_sectors * c.sector_size) >> 9;
> 
> Hi Shin'ichiro,

Hi Chao, thank you for your review.

> Could we use SECTOR_SHIFT instead?

Yes. In the third patch, I added SECTOR_SHIFT definition in fsck/fsck.c. To use
it both in lib/libf2fs_zoned.c and fsck/fsck.c, I will define SECTOR_SHIFT in
include/f2fs_fs.h.

> 
> > +	u_int64_t sector = 0;
> > +	int ret = -1;
> > +
> > +	rep = malloc(F2FS_REPORT_ZONES_BUFSZ);
> > +	if (!rep) {
> > +		ERR_MSG("No memory for report zones\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	while (sector < total_sectors) {
> > +
> > +		/* Get zone info */
> > +		rep->sector = sector;
> > +		rep->nr_zones = (F2FS_REPORT_ZONES_BUFSZ - sizeof(struct blk_zone_report))
> > +			/ sizeof(struct blk_zone);
> > +
> > +		ret = ioctl(dev->fd, BLKREPORTZONE, rep);
> > +		if (ret != 0) {
> > +			ret = -errno;
> > +			ERR_MSG("ioctl BLKREPORTZONE failed\n");
> It's minor, it will be better to print errno here, since I didn't see we print
> error no from caller.

Thanks. Will do that.

> 
> > +			goto out;
> > +		}
> > +
> > +		if (!rep->nr_zones) {
> > +			ret = -EIO;
> > +			ERR_MSG("Unexpected ioctl BLKREPORTZONE result\n");
> > +			goto out;
> > +		}
> > +
> > +		blkz = (struct blk_zone *)(rep + 1);
> > +		for (i = 0; i < rep->nr_zones && sector < total_sectors; i++) {
> 
> The condition looks like that block zones in rep may across end-of-device? Will
> this really happen?
> 
> So I mean will "i < rep->nr_zones" be enough?

You are correct. I will remove the sector comparison in v2 series.

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
