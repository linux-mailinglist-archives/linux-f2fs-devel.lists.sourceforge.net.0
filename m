Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C54E321648B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jul 2020 05:28:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jseHI-0001u5-E9; Tue, 07 Jul 2020 03:28:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=450070042=Aravind.Ramesh@wdc.com>)
 id 1jseHG-0001tw-DB
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 03:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BZrCr/6QJrtbFiSQD0FQ/L+cY+qRY+nZqPcWoIX1iKA=; b=ZI4LGIgGU+OP9t9xivv9Fw3uEc
 ECWgZ+SyGLiJ8+AkRnKRksgGCEhLyU6smUai2NRrBcNDDzhlHms7WZmi9nKWOsKEZFGfnuEvNEY8D
 QbSMfohMOkb36oV3EPTERp9VBaGAVT/L9tWWUfowvwnEFYmKtlGGWaV9ncvJeBY8Codo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BZrCr/6QJrtbFiSQD0FQ/L+cY+qRY+nZqPcWoIX1iKA=; b=gEfD5euXAsHjwN2TjYKA6GynVz
 ib2KoX+xf+gE98F8PnGl5q4ykiR3SmdINAKZTKTfVqH1QE8CGRnctKchCVKPhRRRm3Q5ehZNt0bHm
 291lARdd+8Kxo1tdAVIDs50Wv7NYqQXHwnTTTHGF/v4NKwYAQmfX5SkJ2/5K47W8kHQI=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jseHB-009pia-As
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 03:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594092489; x=1625628489;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LM5IgdSDJ/Km1MEn/v4m+FJ0HOEoUyCTLWybUMi651c=;
 b=HW75NtOTTepLP9XkJz4HzCt8/XOSe0Yjf6MqcqD6rz8eAiCseSd1LenE
 rLr/eLmsfPaHf1Jm6975rJfj/6gt3Kap9fgaWDFH+7CYcWaaT8NJzYRVd
 fwp+NRHSGaGgsajSDrV51oiorV1vH+5sDyAKV4HQoMk3BakX7NdgmaS3h
 EqbgJpQx0YH9/6bR8lIgrcs8cgkurJxAejP8ypt7ytfsu4gncFh5Q3U5c
 or7ULI9MrLp72wYuPeVvG/x0SFDbnVjWFfEYd8197rM9Ir5RvaRu+drYR
 QBHOyIWxBVgHrj/wWqUl8Cz9oCRz9/P6eu0ppknjUiImxdjPa2nTQhL+E w==;
IronPort-SDR: oC0JXzIk1IvX7wmkB6OKk1HQ/vTKu2Anr2I05SrW0ikeecjT8l3GeNM4szJtGjjhFG72z23MYq
 vzOsME8oP/Zik0ZjeT47iIv78i8SmxwepK/YNgz3S/hneyS1Yln3q/bjV35iUotFSERbAW6Bsw
 e+FBj71C0UmZOE0kVPccDH0bb9Xpz6eNdv8U5X2x4Co8oBgpAmeZS05R0e2ErLUqSSxHcsX579
 Qrqqwr/l5HVqTkrMlRF+tqTsCkcovg9gdOiJ6mHQOV5bP7cZz14eZRQCHFnPJHoh0fICxsGdo4
 srk=
X-IronPort-AV: E=Sophos;i="5.75,321,1589212800"; d="scan'208";a="143113980"
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jul 2020 11:27:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0zHzygofoEIpK/Sp3ObKnttjWGCOe1osBqP/ec2sd8IdfVgrgWKkfxYVjOFjhDyGkoDittVxsztVAGTDkcGyKBNTdPzueceWC66eXFXRt6sXuFZMxCajlRQajpNKUfwiB1+Ur9580kmL8NBXQjWDvT8MQ0QpwLLu5jkKo2jOwu4DErD7UsgEJz/xFQmF5cYsDc9hGCP71scTMweb9J6cYNjmVojwzo35x9vAI0iJIo+mgsFgzRuHq1J70tKrrfLYQoScCMnxXTyYxCLB5Cyjjv+Wftm9pJi/rloCXGig34zGlGF4Pwc1sgGFZHk2qRd1JaIuw+LPhEK3OJhpqn9Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZrCr/6QJrtbFiSQD0FQ/L+cY+qRY+nZqPcWoIX1iKA=;
 b=Ca7ZF3n7jWdHM78Cgku32w43rug7KG1RwxG0qcVnuzVbSz6AeaxeKiMqJqRdP9m1VWQQ2iFh5VLd9SIh8Iu8Bd5AKTxvIHryuDgK73WbLrafh1vXNUMikaRIumzGw/WwN5GyPBwiQtc1iNxd4c8cl8sNj7NGW9pgCXCkdSehPzRraFLw2smzLNDnMDuUgT7FQckEYsT1ZrIKAaJ3l4uvzdAxHU0+af5r7cOyq2zvjW/c8eqSHEE4NpeFb0yXS7FRt/4QzfC4579sYXLHA1e4q4Ltw0c3Ldz+AatxtKB5MzgqPl/I91A41UGvtdyizEUDsGOkWCVAFlkYP+ZOXA1OoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZrCr/6QJrtbFiSQD0FQ/L+cY+qRY+nZqPcWoIX1iKA=;
 b=nD8GSwD1cEosCcIt3KlSENQbH79krY3aukGfWomRRhQwzl/D60V6FLRPnIOOesbBjbsh1f1oWfYDggv3IpSUCbsp9Na9Mz15cLD8AEoQJzWUpgvsmqFhqxMM9cC4aoFLQCl1AXNZxEyGcRtWR3u5sTzdBRHKwbOQmwv32DBVOiE=
Received: from BY5PR04MB6995.namprd04.prod.outlook.com (2603:10b6:a03:22c::12)
 by BYAPR04MB6166.namprd04.prod.outlook.com (2603:10b6:a03:ee::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Tue, 7 Jul
 2020 03:27:56 +0000
Received: from BY5PR04MB6995.namprd04.prod.outlook.com
 ([fe80::f813:2bba:2c5c:a63b]) by BY5PR04MB6995.namprd04.prod.outlook.com
 ([fe80::f813:2bba:2c5c:a63b%7]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 03:27:56 +0000
From: Aravind Ramesh <Aravind.Ramesh@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [PATCH 1/2] f2fs: support zone capacity less than zone size
Thread-Index: AQHWUIkRI5HubGFr/0O9cA9AIcqh/aj7RBoAgAA12+A=
Date: Tue, 7 Jul 2020 03:27:56 +0000
Message-ID: <BY5PR04MB6995E03B6FE331FF0CDEE7AD8C660@BY5PR04MB6995.namprd04.prod.outlook.com>
References: <20200702155401.13322-1-aravind.ramesh@wdc.com>
 <20200702155401.13322-2-aravind.ramesh@wdc.com>
 <20200707000722.GB2897553@google.com>
In-Reply-To: <20200707000722.GB2897553@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [106.51.109.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9ad5247f-9c59-4bca-f70f-08d82225bdda
x-ms-traffictypediagnostic: BYAPR04MB6166:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB616622F69822F31F75A94BC88C660@BYAPR04MB6166.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bYYTDltvTQ+aVOAYFQgsmoFGcI1/a6O8izoEuJM1I12Vw1Q54CoJFDJ0xd7awlkOlHUY9of/yr7pXAdY8MrJE0gJODye/m/YvNOGiSL6p9pkg3KinI6axmdXouFYP3zNdJmF3wy4jraFEKiIxl+WiWGPbufEF2W0nYr25vjiw9vUmfjovj2msdosy+2RxUAADaT+rirrMAiLZ7y/43VIdu+/H/S5fkyF+R+NQNHkkCJwFaIa0OHDLxhaGxNzfiIJaoqC5Y9kwhdnQKA8RJVx7FIRwFWZAgCSyFFCjzPsDdB88UoQVYiio2FQiRtARH/I1x/uChukEovHBxF6lbzYC745TJS6UxMU9WG7S/c2RL0QFjfGooQmpi5c3ETGAvKQnMAa3inPkwOcERQ6wZtT6g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6995.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(7696005)(4326008)(9686003)(966005)(5660300002)(478600001)(71200400001)(83380400001)(53546011)(6506007)(186003)(55016002)(26005)(52536014)(2906002)(8936002)(30864003)(8676002)(54906003)(55236004)(86362001)(66476007)(64756008)(316002)(76116006)(66446008)(33656002)(66946007)(6916009)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ZDJPfZu/AhcRQD/QGyfoPvUv14U9NSYHzzQiEoKqIOv8Maj0DeBrtlAYLBEv7pFdrNbnrqGUeSx8NO6BJbKkob2ylw4M2upB4YjM0/xp610XQ4vltWmKPMCA/Be5iZirwt/cAwNEf922/9bfVn68JAuV4VcrOEWuPSTX4yQu51ndrEd1sbfZrrSjsHgQZ8VI6afBK7OQBTJNbNsQ0dDUwzcDwSIRRVkGc9MB8OSu54Poyvghy8xtKwvI5f2+pY1bbdL46acLmuqkbHafkTPgGdasbvtOBh58rFqL9zZnDtdnLy/1B15h7PmdnscWyAtTEMf7nwvoRfPDX3jG04KKko1tQlM3cvg7r0kmwebwEExqtMvvlIIrTg9if2qgaSp4X8IOKBZEBLdZ19gCFOzr3Ree/dvn2NeeacReP77FTRMNGmALV2KTkh3pDu9WdQjVR9iXG7/2ihh8BwOaMk6hx2VHZ8P4mqBIb6sQyLU5IWPYFcpHWJe6yTCvk00MD5vs
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6995.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad5247f-9c59-4bca-f70f-08d82225bdda
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 03:27:56.5590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +3p6FXuJvRKGSqGwX4SeJ8R8zAx7wCP+fd3Mx5crrumn49OzLtc/WQrB/wJv4L6t4oLi8U1WWYE4ojphmzMQLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6166
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1jseHB-009pia-As
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: support zone capacity less than
 zone size
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
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "hch@lst.de" <hch@lst.de>, Matias Bjorling <Matias.Bjorling@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello Jaegeuk,

I had mentioned the dependency in the cover letter for this patch, as below.

This series is based on the git tree
git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git branch dev

and requires the below patch in order to build.

https://lore.kernel.org/linux-nvme/20200701063720.GA28954@lst.de/T/#m19e0197ae1837b7fe959b13fbc2a859b1f2abc1e

The above patch has been merged to the nvme-5.9 branch in the git tree:
git://git.infradead.org/nvme.git

Could you consider picking up that patch in your tree ?

I have run checkpatch before sending this, it was ok. Ran it again.

f2fs$ scripts/checkpatch.pl ./0001-f2fs-support-zone-capacity-less-than-zone-size.patch
total: 0 errors, 0 warnings, 289 lines checked

./0001-f2fs-support-zone-capacity-less-than-zone-size.patch has no obvious style problems and is ready for submission.

Thanks,
Aravind

> -----Original Message-----
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> Sent: Tuesday, July 7, 2020 5:37 AM
> To: Aravind Ramesh <Aravind.Ramesh@wdc.com>
> Cc: yuchao0@huawei.com; linux-fsdevel@vger.kernel.org; linux-f2fs-
> devel@lists.sourceforge.net; hch@lst.de; Damien Le Moal
> <Damien.LeMoal@wdc.com>; Niklas Cassel <Niklas.Cassel@wdc.com>; Matias
> Bjorling <Matias.Bjorling@wdc.com>
> Subject: Re: [PATCH 1/2] f2fs: support zone capacity less than zone size
> 
> Hi,
> 
> Is there any dependency to the patch? And, could you please run checkpatch script?
> 
> Thanks,
> 
> On 07/02, Aravind Ramesh wrote:
> > NVMe Zoned Namespace devices can have zone-capacity less than zone-size.
> > Zone-capacity indicates the maximum number of sectors that are usable
> > in a zone beginning from the first sector of the zone. This makes the
> > sectors sectors after the zone-capacity till zone-size to be unusable.
> > This patch set tracks zone-size and zone-capacity in zoned devices and
> > calculate the usable blocks per segment and usable segments per section.
> >
> > If zone-capacity is less than zone-size mark only those segments which
> > start before zone-capacity as free segments. All segments at and
> > beyond zone-capacity are treated as permanently used segments. In
> > cases where zone-capacity does not align with segment size the last
> > segment will start before zone-capacity and end beyond the
> > zone-capacity of the zone. For such spanning segments only sectors within the
> zone-capacity are used.
> >
> > Signed-off-by: Aravind Ramesh <aravind.ramesh@wdc.com>
> > Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> > ---
> >  fs/f2fs/f2fs.h    |   5 ++
> >  fs/f2fs/segment.c | 136
> ++++++++++++++++++++++++++++++++++++++++++++--
> >  fs/f2fs/segment.h |   6 +-
> >  fs/f2fs/super.c   |  41 ++++++++++++--
> >  4 files changed, 176 insertions(+), 12 deletions(-)
> >
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h index
> > e6e47618a357..73219e4e1ba4 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1232,6 +1232,7 @@ struct f2fs_dev_info {  #ifdef
> > CONFIG_BLK_DEV_ZONED
> >  	unsigned int nr_blkz;		/* Total number of zones */
> >  	unsigned long *blkz_seq;	/* Bitmap indicating sequential zones */
> > +	block_t *zone_capacity_blocks;  /* Array of zone capacity in blks */
> >  #endif
> >  };
> >
> > @@ -3395,6 +3396,10 @@ void f2fs_destroy_segment_manager_caches(void);
> >  int f2fs_rw_hint_to_seg_type(enum rw_hint hint);  enum rw_hint
> > f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
> >  			enum page_type type, enum temp_type temp);
> > +unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
> > +			unsigned int segno);
> > +unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
> > +			unsigned int segno);
> >
> >  /*
> >   * checkpoint.c
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c index
> > c35614d255e1..d2156f3f56a5 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -4294,9 +4294,12 @@ static void init_free_segmap(struct
> > f2fs_sb_info *sbi)  {
> >  	unsigned int start;
> >  	int type;
> > +	struct seg_entry *sentry;
> >
> >  	for (start = 0; start < MAIN_SEGS(sbi); start++) {
> > -		struct seg_entry *sentry = get_seg_entry(sbi, start);
> > +		if (f2fs_usable_blks_in_seg(sbi, start) == 0)
> > +			continue;
> > +		sentry = get_seg_entry(sbi, start);
> >  		if (!sentry->valid_blocks)
> >  			__set_free(sbi, start);
> >  		else
> > @@ -4316,7 +4319,7 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
> >  	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
> >  	struct free_segmap_info *free_i = FREE_I(sbi);
> >  	unsigned int segno = 0, offset = 0, secno;
> > -	unsigned short valid_blocks;
> > +	unsigned short valid_blocks, usable_blks_in_seg;
> >  	unsigned short blks_per_sec = BLKS_PER_SEC(sbi);
> >
> >  	while (1) {
> > @@ -4326,9 +4329,10 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
> >  			break;
> >  		offset = segno + 1;
> >  		valid_blocks = get_valid_blocks(sbi, segno, false);
> > -		if (valid_blocks == sbi->blocks_per_seg || !valid_blocks)
> > +		usable_blks_in_seg = f2fs_usable_blks_in_seg(sbi, segno);
> > +		if (valid_blocks == usable_blks_in_seg || !valid_blocks)
> >  			continue;
> > -		if (valid_blocks > sbi->blocks_per_seg) {
> > +		if (valid_blocks > usable_blks_in_seg) {
> >  			f2fs_bug_on(sbi, 1);
> >  			continue;
> >  		}
> > @@ -4678,6 +4682,101 @@ int f2fs_check_write_pointer(struct
> > f2fs_sb_info *sbi)
> >
> >  	return 0;
> >  }
> > +
> > +static bool is_conv_zone(struct f2fs_sb_info *sbi, unsigned int zone_idx,
> > +						unsigned int dev_idx)
> > +{
> > +	if (!bdev_is_zoned(FDEV(dev_idx).bdev))
> > +		return true;
> > +	return !test_bit(zone_idx, FDEV(dev_idx).blkz_seq); }
> > +
> > +/* Return the zone index in the given device */ static unsigned int
> > +get_zone_idx(struct f2fs_sb_info *sbi, unsigned int secno,
> > +					int dev_idx)
> > +{
> > +	block_t sec_start_blkaddr = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi,
> > +secno));
> > +
> > +	return (sec_start_blkaddr - FDEV(dev_idx).start_blk) >>
> > +						sbi->log_blocks_per_blkz;
> > +}
> > +
> > +/*
> > + * Return the usable segments in a section based on the zone's
> > + * corresponding zone capacity. Zone is equal to a section.
> > + */
> > +static inline unsigned int f2fs_usable_zone_segs_in_sec(
> > +		struct f2fs_sb_info *sbi, unsigned int segno) {
> > +	unsigned int dev_idx, zone_idx, unusable_segs_in_sec;
> > +
> > +	dev_idx = f2fs_target_device_index(sbi, START_BLOCK(sbi, segno));
> > +	zone_idx = get_zone_idx(sbi, GET_SEC_FROM_SEG(sbi, segno), dev_idx);
> > +
> > +	/* Conventional zone's capacity is always equal to zone size */
> > +	if (is_conv_zone(sbi, zone_idx, dev_idx))
> > +		return sbi->segs_per_sec;
> > +
> > +	/*
> > +	 * If the zone_capacity_blocks array is NULL, then zone capacity
> > +	 * is equal to the zone size for all zones
> > +	 */
> > +	if (!FDEV(dev_idx).zone_capacity_blocks)
> > +		return sbi->segs_per_sec;
> > +
> > +	/* Get the segment count beyond zone capacity block */
> > +	unusable_segs_in_sec = (sbi->blocks_per_blkz -
> > +				FDEV(dev_idx).zone_capacity_blocks[zone_idx])
> >>
> > +				sbi->log_blocks_per_seg;
> > +	return sbi->segs_per_sec - unusable_segs_in_sec; }
> > +
> > +/*
> > + * Return the number of usable blocks in a segment. The number of
> > +blocks
> > + * returned is always equal to the number of blocks in a segment for
> > + * segments fully contained within a sequential zone capacity or a
> > + * conventional zone. For segments partially contained in a
> > +sequential
> > + * zone capacity, the number of usable blocks up to the zone capacity
> > + * is returned. 0 is returned in all other cases.
> > + */
> > +static inline unsigned int f2fs_usable_zone_blks_in_seg(
> > +			struct f2fs_sb_info *sbi, unsigned int segno) {
> > +	block_t seg_start, sec_start_blkaddr, sec_cap_blkaddr;
> > +	unsigned int zone_idx, dev_idx, secno;
> > +
> > +	secno = GET_SEC_FROM_SEG(sbi, segno);
> > +	seg_start = START_BLOCK(sbi, segno);
> > +	dev_idx = f2fs_target_device_index(sbi, seg_start);
> > +	zone_idx = get_zone_idx(sbi, secno, dev_idx);
> > +
> > +	/*
> > +	 * Conventional zone's capacity is always equal to zone size,
> > +	 * so, blocks per segment is unchanged.
> > +	 */
> > +	if (is_conv_zone(sbi, zone_idx, dev_idx))
> > +		return sbi->blocks_per_seg;
> > +
> > +	if (!FDEV(dev_idx).zone_capacity_blocks)
> > +		return sbi->blocks_per_seg;
> > +
> > +	sec_start_blkaddr = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, secno));
> > +	sec_cap_blkaddr = sec_start_blkaddr +
> > +				FDEV(dev_idx).zone_capacity_blocks[zone_idx];
> > +
> > +	/*
> > +	 * If segment starts before zone capacity and spans beyond
> > +	 * zone capacity, then usable blocks are from seg start to
> > +	 * zone capacity. If the segment starts after the zone capacity,
> > +	 * then there are no usable blocks.
> > +	 */
> > +	if (seg_start >= sec_cap_blkaddr)
> > +		return 0;
> > +	if (seg_start + sbi->blocks_per_seg > sec_cap_blkaddr)
> > +		return sec_cap_blkaddr - seg_start;
> > +
> > +	return sbi->blocks_per_seg;
> > +}
> >  #else
> >  int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)  { @@
> > -4688,7 +4787,36 @@ int f2fs_check_write_pointer(struct f2fs_sb_info
> > *sbi)  {
> >  	return 0;
> >  }
> > +
> > +static inline unsigned int f2fs_usable_zone_blks_in_seg(struct f2fs_sb_info *sbi,
> > +							unsigned int segno)
> > +{
> > +	return 0;
> > +}
> > +
> > +static inline unsigned int f2fs_usable_zone_segs_in_sec(struct f2fs_sb_info *sbi,
> > +							unsigned int segno)
> > +{
> > +	return 0;
> > +}
> >  #endif
> > +unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
> > +					unsigned int segno)
> > +{
> > +	if (f2fs_sb_has_blkzoned(sbi))
> > +		return f2fs_usable_zone_blks_in_seg(sbi, segno);
> > +
> > +	return sbi->blocks_per_seg;
> > +}
> > +
> > +unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
> > +					unsigned int segno)
> > +{
> > +	if (f2fs_sb_has_blkzoned(sbi))
> > +		return f2fs_usable_zone_segs_in_sec(sbi, segno);
> > +
> > +	return sbi->segs_per_sec;
> > +}
> >
> >  /*
> >   * Update min, max modified time for cost-benefit GC algorithm diff
> > --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h index
> > f261e3e6a69b..79b0dc33feaf 100644
> > --- a/fs/f2fs/segment.h
> > +++ b/fs/f2fs/segment.h
> > @@ -411,6 +411,7 @@ static inline void __set_free(struct f2fs_sb_info *sbi,
> unsigned int segno)
> >  	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> >  	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
> >  	unsigned int next;
> > +	unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi, segno);
> >
> >  	spin_lock(&free_i->segmap_lock);
> >  	clear_bit(segno, free_i->free_segmap); @@ -418,7 +419,7 @@ static
> > inline void __set_free(struct f2fs_sb_info *sbi, unsigned int segno)
> >
> >  	next = find_next_bit(free_i->free_segmap,
> >  			start_segno + sbi->segs_per_sec, start_segno);
> > -	if (next >= start_segno + sbi->segs_per_sec) {
> > +	if (next >= start_segno + usable_segs) {
> >  		clear_bit(secno, free_i->free_secmap);
> >  		free_i->free_sections++;
> >  	}
> > @@ -444,6 +445,7 @@ static inline void __set_test_and_free(struct f2fs_sb_info
> *sbi,
> >  	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> >  	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
> >  	unsigned int next;
> > +	unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi, segno);
> >
> >  	spin_lock(&free_i->segmap_lock);
> >  	if (test_and_clear_bit(segno, free_i->free_segmap)) { @@ -453,7
> > +455,7 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
> >  			goto skip_free;
> >  		next = find_next_bit(free_i->free_segmap,
> >  				start_segno + sbi->segs_per_sec, start_segno);
> > -		if (next >= start_segno + sbi->segs_per_sec) {
> > +		if (next >= start_segno + usable_segs) {
> >  			if (test_and_clear_bit(secno, free_i->free_secmap))
> >  				free_i->free_sections++;
> >  		}
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c index
> > 80cb7cd358f8..2686b07ae7eb 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -1164,6 +1164,7 @@ static void destroy_device_list(struct f2fs_sb_info *sbi)
> >  		blkdev_put(FDEV(i).bdev, FMODE_EXCL);  #ifdef
> CONFIG_BLK_DEV_ZONED
> >  		kvfree(FDEV(i).blkz_seq);
> > +		kvfree(FDEV(i).zone_capacity_blocks);
> >  #endif
> >  	}
> >  	kvfree(sbi->devs);
> > @@ -3039,13 +3040,26 @@ static int init_percpu_info(struct
> > f2fs_sb_info *sbi)  }
> >
> >  #ifdef CONFIG_BLK_DEV_ZONED
> > +
> > +struct f2fs_report_zones_args {
> > +	struct f2fs_dev_info *dev;
> > +	bool zone_cap_mismatch;
> > +};
> > +
> >  static int f2fs_report_zone_cb(struct blk_zone *zone, unsigned int idx,
> > -			       void *data)
> > +			      void *data)
> >  {
> > -	struct f2fs_dev_info *dev = data;
> > +	struct f2fs_report_zones_args *rz_args = data;
> > +
> > +	if (zone->type == BLK_ZONE_TYPE_CONVENTIONAL)
> > +		return 0;
> > +
> > +	set_bit(idx, rz_args->dev->blkz_seq);
> > +	rz_args->dev->zone_capacity_blocks[idx] = zone->capacity >>
> > +						F2FS_LOG_SECTORS_PER_BLOCK;
> > +	if (zone->len != zone->capacity && !rz_args->zone_cap_mismatch)
> > +		rz_args->zone_cap_mismatch = true;
> >
> > -	if (zone->type != BLK_ZONE_TYPE_CONVENTIONAL)
> > -		set_bit(idx, dev->blkz_seq);
> >  	return 0;
> >  }
> >
> > @@ -3053,6 +3067,7 @@ static int init_blkz_info(struct f2fs_sb_info
> > *sbi, int devi)  {
> >  	struct block_device *bdev = FDEV(devi).bdev;
> >  	sector_t nr_sectors = bdev->bd_part->nr_sects;
> > +	struct f2fs_report_zones_args rep_zone_arg;
> >  	int ret;
> >
> >  	if (!f2fs_sb_has_blkzoned(sbi))
> > @@ -3078,12 +3093,26 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int
> devi)
> >  	if (!FDEV(devi).blkz_seq)
> >  		return -ENOMEM;
> >
> > -	/* Get block zones type */
> > +	/* Get block zones type and zone-capacity */
> > +	FDEV(devi).zone_capacity_blocks = f2fs_kzalloc(sbi,
> > +					FDEV(devi).nr_blkz * sizeof(block_t),
> > +					GFP_KERNEL);
> > +	if (!FDEV(devi).zone_capacity_blocks)
> > +		return -ENOMEM;
> > +
> > +	rep_zone_arg.dev = &FDEV(devi);
> > +	rep_zone_arg.zone_cap_mismatch = false;
> > +
> >  	ret = blkdev_report_zones(bdev, 0, BLK_ALL_ZONES, f2fs_report_zone_cb,
> > -				  &FDEV(devi));
> > +				  &rep_zone_arg);
> >  	if (ret < 0)
> >  		return ret;
> >
> > +	if (!rep_zone_arg.zone_cap_mismatch) {
> > +		kvfree(FDEV(devi).zone_capacity_blocks);
> > +		FDEV(devi).zone_capacity_blocks = NULL;
> > +	}
> > +
> >  	return 0;
> >  }
> >  #endif
> > --
> > 2.19.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
