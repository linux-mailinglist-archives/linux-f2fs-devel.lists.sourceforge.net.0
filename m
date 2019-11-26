Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E88F109795
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Nov 2019 02:33:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZPjZ-0006Ap-2Q; Tue, 26 Nov 2019 01:33:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=226c1a36c=shinichiro.kawasaki@wdc.com>)
 id 1iZPjX-0006Ae-RA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 01:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dc/Pq+tPHR5yWKcBF2my+eJeEKciEoxZ9B+I9HlXrPk=; b=Q+42a/WwsqmNrc+LcjBQyS5KrL
 ViXmgALoyb3MavJuYv0ClGD47du/f0XhxoekEU8go7PxEAoLeYO5OAfcso70ffqPmjTtf9eygygp0
 aE2uXZel3vT4IrDrTplGzh+TBu2r06rJ0WnOCtrZP+S9RXTLzSUlkRVTQFhwMmmJDetg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dc/Pq+tPHR5yWKcBF2my+eJeEKciEoxZ9B+I9HlXrPk=; b=l9RbuREzWOkxKZAgxHlPkWZxCb
 K5EfFUyf1bsfGRRxYgdUpA50UbYN/p93vqvQypPmNm5EBro+DaK2xWnElOSP1UACwjwYd+4aXvaak
 WuGj086w2C+X6hWnsuqURZw8eC5MKoDuIxT584i/uF+RoefhSWO3RYvHH+Vle+xOeHa0=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iZPjU-00DbEU-5l
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 01:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1574732016; x=1606268016;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=paT65DJ+IYp8fDg/ZeqXIUJ9zhwe+uTmhUGYos16mT8=;
 b=ewY4CjnBwKQ5TKhlPlrCo2twuQUWk9N9EVFG31q1wB2xfRu1I2ByCJu8
 xFyl1Gvct6zqkJUK6GsehWdH6Rb3Wmfj/XHBhRupaEUfZmciGvDlqOBB6
 rD3ibfyqa3ScBcFSJ2QEuQdMc6gL32IJ+eCmkUmJKi9weP9JpP3W/PzeO
 6pSQ1TTVS5jiqbJM2Y/mpMft7Ro7uzIezPkXSGPBOOfwuNXF8nZrqVTKo
 Ckgob5myiKaTj9+gpsLqJWgWn/KmobSJdMJhjili2SwC7dLcJuC2ZHGCf
 RBecKohuI2kwzPSRV5G8F/E40ZQXVV73jtbhCePYNlPqWDqmD+qMws70Q Q==;
IronPort-SDR: j4IUoszCN/VZWzqlLcQHRFIhv5xODp4we89UzXqG0/VxcHHIJ9VuB0jVOsGqQVt0dVubL5oZ9D
 lF8afjAceviJXipyD6JAufTGMCgdLC5jcPWOr5Vz1A1ptW3djk4NnS3tglp4UfvIVcmrOw2uN/
 dAnsO8zYLdIDOTZBD652ceNJU//umdlOOYoazTGqe3NBkyUGkH69nW+867gRaP5u6qIY95s5ki
 4frQ0tgsOJykiy6VaTVZo6D/z7vnQ8EQpMs0PSme7wjB5wlrVvJydABSkfBsfwQjDp2gS5L1cp
 lLA=
X-IronPort-AV: E=Sophos;i="5.69,243,1571673600"; d="scan'208";a="231426966"
Received: from mail-sn1nam02lp2053.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.53])
 by ob1.hgst.iphmx.com with ESMTP; 26 Nov 2019 09:33:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bp5jVgsstgRALBDQfZ8E0OzFNjxsumq3JkHRuFwoZEui4GxXVVVZ8wiH4XKc7AJ9JLH13y60C0yL2HJLvISH/Eq6fo4H2zZWZphJ227OPRbHeC6FZpyiRVDz8QYLr24xHwqGcU/S2b5cSrIR36c8j27GTibnSkP4uybdSLw6ofE6p2ygljTZQJ72qkPr7w/GnUkytiGViBbJ9YGBGgVv4kwQo2Um29Sb1etKjacFGBJ/b4WuF54csH1GnY4IJF5LmJoDu2YUE3jVxJBHvci14fJ1NCDkNEQkQfoXoxbpW3p6WKbIo2vbJf0K+CdoS9rNOSafAzr9a47XnYpzssahXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dc/Pq+tPHR5yWKcBF2my+eJeEKciEoxZ9B+I9HlXrPk=;
 b=JWk1gyAfnX/LRgOrx7Nnquiy9xeaTECNfYvoAZOwqzHq7qNzw3mVFuLpiH1cvjVKCmh64OSDSw99tnJwLQyER5483L+2CqphlUwIDQ+Sfn1EfxdLdvhB4yfH8Ai3Mhyn/CdaX6nH6dH2sBceqYGXVSq53DeIPx27aMAwK9QvbH2zc3f1bTtoUEtvHgNQDZPqhjquAeQc/B7oJVA7PMyY1GGWtbw/vYvGnkibvfqNkXj0ZZKtBkeI0TU/pmmfZyRHvRF3nybU9JgNiPVCqt1pvS+rMfPfrnmDFtiKqCa5qtwyBgU2Rk+9G7RIbkyTcWzrczw3GDtAKTXWZoryQm7/Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dc/Pq+tPHR5yWKcBF2my+eJeEKciEoxZ9B+I9HlXrPk=;
 b=Kpbio9yFWJwlej+/4QOAAOpvW+2vY1oVKibk5thKWFhXfSy4AosfydykWbBMbP1D16qfuPTfrrA9hWO98S5MotSrlmG0WP09fuZtD4Mz+rUA3DGGsC5QakGy2QSQFOdbv/ABsZbSoEq6hHi7n2kiuUgE3IQ10JTfPgirzGscXuo=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2217.namprd04.prod.outlook.com (10.166.205.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Tue, 26 Nov 2019 01:33:23 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74%11]) with mapi id 15.20.2474.023; Tue, 26 Nov
 2019 01:33:22 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v7 7/8] fsck: Check write pointer consistency of open
 zones
Thread-Index: AQHVmqZPVNizElgjIE2DzlL3I8iyg6ebgCiAgAE9e4A=
Date: Tue, 26 Nov 2019 01:33:21 +0000
Message-ID: <20191126013313.cd6b3jhlra33arx3@shindev.dhcp.fujisawa.hgst.com>
References: <20191114044454.200461-1-shinichiro.kawasaki@wdc.com>
 <20191114044454.200461-8-shinichiro.kawasaki@wdc.com>
 <883cf728-b682-a370-cd88-074648b3364e@huawei.com>
In-Reply-To: <883cf728-b682-a370-cd88-074648b3364e@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1c465d3c-c6e4-4839-4896-08d77210a03d
x-ms-traffictypediagnostic: CY1PR04MB2217:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB221735718E489AE6920E4ED2ED450@CY1PR04MB2217.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(52314003)(189003)(199004)(30864003)(91956017)(26005)(76116006)(66946007)(66476007)(66556008)(6246003)(71190400001)(71200400001)(7736002)(316002)(1076003)(44832011)(66446008)(11346002)(446003)(5660300002)(64756008)(54906003)(8936002)(99286004)(186003)(14454004)(25786009)(305945005)(102836004)(6916009)(6116002)(6436002)(6486002)(4326008)(256004)(14444005)(3846002)(2906002)(66066001)(8676002)(229853002)(9686003)(6512007)(86362001)(478600001)(81166006)(76176011)(53546011)(6506007)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2217;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 68D5eVKlDqhnt4pGXhQNHpYC3eOCx0iZXO9VvmB0f5z1DSZZEF1gxoMSirumaLIKYL78AzMwAT8JvEbUfj02fGWdy5llgpq4bbJ8iuh0+jOSib7XTk/V4D271rGj6TqTxE03l7M5j1ObK2OT68mOe1FG89DYlMP52TTlxsDoNo3ZdbK8nfsSiqikb3gc0wO6Y5NfcKE7jJt1fj2w/q8orBgqxegCnko9XcJMhAt6155gOXCKioWCUwWznbw9cJR9QJu6viZ0Quaf1NV6GQXCovFlNeNb0Mjgj0Pchu0EOU4z92OTI3/r5fY517FreGHeEAQobKg/dsN4uiz+fqIogzRsbhfc/b2kfclHun+P2OjTDyANvf+plTcF3aIGF2I3CfruD49DetDM9etQWOfEotEO4ZnnVRMPBKqdjqA/1lmr57KxPOpE0L9hj8Vp3w2J
Content-ID: <E6B9B96EEF9A604C97F519515C63643E@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c465d3c-c6e4-4839-4896-08d77210a03d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 01:33:22.7019 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bHbDStHz8p5NAUYaYhxIxGayrBxf78ojIms/28fSCvOMLBOAcBfiC3XEzIARdaC2dZDhvK0CDnGVFOHfVPmF5tGJr63/MWv2XoG2UISuJvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2217
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
X-Headers-End: 1iZPjU-00DbEU-5l
Subject: Re: [f2fs-dev] [PATCH v7 7/8] fsck: Check write pointer consistency
 of open zones
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

On Nov 25, 2019 / 14:36, Chao Yu wrote:
> On 2019/11/14 12:44, Shin'ichiro Kawasaki wrote:
> > On sudden f2fs shutdown, write pointers of zoned block devices can go
> > further but f2fs meta data keeps current segments at positions before the
> > write operations. After remounting the f2fs, this inconsistency causes
> > write operations not at write pointers and "Unaligned write command"
> > error is reported.
> > 
> > To avoid the error, have f2fs.fsck check consistency of write pointers
> > of open zones that current segments point to. Compare each current
> > segment's position and the write pointer position of the open zone. If
> > inconsistency is found and 'fix_on' flag is set, assign a new zone to the
> > current segment and check the newly assigned zone has write pointer at
> > the zone start. Leave the original zone as is to keep data recorded in
> > it.
> > 
> > To care about fsync data, refer each seg_entry's ckpt_valid_map to get
> > the last valid block in the zone. If the last valid block is beyond the
> > current segments position, fsync data exits in the zone. In case fsync
> > data exists, do not assign a new zone to the current segment not to lose
> > the fsync data. It is expected that the kernel replay the fsync data and
> > fix the write pointer inconsistency at mount time.
> > 
> > Also check consistency between write pointer of the zone the current
> > segment points to with valid block maps of the zone. If the last valid
> > block is beyond the write pointer position, report to indicate a bug. If
> > 'fix_on' flag is set, assign a new zone to the current segment.
> > 
> > When inconsistencies are found, turn on 'bug_on' flag in fsck_verify() to
> > ask users to fix them or not. When inconsistencies get fixed, turn on
> > 'force' flag in fsck_verify() to enforce fixes in following checks.
> > 
> > This check and fix is done twice. The first is done at the beginning of
> > do_fsck() function so that other fixes can reflect the current segment
> > modification. The second is done in fsck_verify() to reflect updated meta
> > data by other fixes.
> > 
> > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > ---
> >  fsck/f2fs.h  |   5 ++
> >  fsck/fsck.c  | 152 +++++++++++++++++++++++++++++++++++++++++++++++++++
> >  fsck/fsck.h  |   3 +
> >  fsck/main.c  |   2 +
> >  fsck/mount.c |  50 ++++++++++++++++-
> >  5 files changed, 211 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fsck/f2fs.h b/fsck/f2fs.h
> > index 59d2cc8..55d6b07 100644
> > --- a/fsck/f2fs.h
> > +++ b/fsck/f2fs.h
> > @@ -430,6 +430,11 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
> >  #define GET_BLKOFF_FROM_SEG0(sbi, blk_addr)				\
> >  	(GET_SEGOFF_FROM_SEG0(sbi, blk_addr) & (sbi->blocks_per_seg - 1))
> >  
> > +#define GET_SEC_FROM_SEG(sbi, segno)					\
> > +	((segno) / (sbi)->segs_per_sec)
> > +#define GET_SEG_FROM_SEC(sbi, secno)					\
> > +	((secno) * (sbi)->segs_per_sec)
> > +
> >  #define FREE_I_START_SEGNO(sbi)						\
> >  	GET_SEGNO_FROM_SEG0(sbi, SM_I(sbi)->main_blkaddr)
> >  #define GET_R2L_SEGNO(sbi, segno)	(segno + FREE_I_START_SEGNO(sbi))
> > diff --git a/fsck/fsck.c b/fsck/fsck.c
> > index 2ae3bd5..37ac30a 100644
> > --- a/fsck/fsck.c
> > +++ b/fsck/fsck.c
> > @@ -2181,6 +2181,123 @@ static void fix_checkpoints(struct f2fs_sb_info *sbi)
> >  	fix_checkpoint(sbi);
> >  }
> >  
> > +#ifdef HAVE_LINUX_BLKZONED_H
> > +
> > +/*
> > + * Refer valid block map and return offset of the last valid block in the zone.
> > + * Obtain valid block map from SIT and fsync data.
> > + * If there is no valid block in the zone, return -1.
> > + */
> > +static int last_vblk_off_in_zone(struct f2fs_sb_info *sbi,
> > +				 unsigned int zone_segno)
> > +{
> > +	int s, b;
> > +	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
> > +	struct seg_entry *se;
> > +
> > +	for (s = segs_per_zone - 1; s >= 0; s--) {
> > +		se = get_seg_entry(sbi, zone_segno + s);
> > +
> > +		/*
> > +		 * Refer not cur_valid_map but ckpt_valid_map which reflects
> > +		 * fsync data.
> > +		 */
> > +		ASSERT(se->ckpt_valid_map);
> > +		for (b = sbi->blocks_per_seg - 1; b >= 0; b--)
> > +			if (f2fs_test_bit(b, (const char*)se->ckpt_valid_map))
> > +				return b + (s << sbi->log_blocks_per_seg);
> > +	}
> > +
> > +	return -1;
> > +}
> > +
> > +static int check_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
> > +{
> > +	struct curseg_info *curseg = CURSEG_I(sbi, type);
> > +	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
> > +	struct blk_zone blkz;
> > +	block_t cs_block, wp_block, zone_last_vblock;
> > +	u_int64_t cs_sector, wp_sector;
> > +	int i, ret;
> > +	unsigned int zone_segno;
> > +	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> > +
> > +	/* get the device the curseg points to */
> > +	cs_block = START_BLOCK(sbi, curseg->segno) + curseg->next_blkoff;
> > +	for (i = 0; i < MAX_DEVICES; i++) {
> > +		if (!c.devices[i].path)
> > +			break;
> > +		if (c.devices[i].start_blkaddr <= cs_block &&
> > +		    cs_block <= c.devices[i].end_blkaddr)
> > +			break;
> > +	}
> > +
> > +	if (i >= MAX_DEVICES)
> > +		return -EINVAL;
> > +
> > +	/* get write pointer position of the zone the curseg points to */
> > +	cs_sector = (cs_block - c.devices[i].start_blkaddr)
> > +		<< log_sectors_per_block;
> > +	ret = f2fs_report_zone(i, cs_sector, &blkz);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (blk_zone_type(&blkz) != BLK_ZONE_TYPE_SEQWRITE_REQ)
> > +		return 0;
> > +
> > +	/* check consistency between the curseg and the write pointer */
> > +	wp_block = c.devices[i].start_blkaddr +
> > +		(blk_zone_wp_sector(&blkz) >> log_sectors_per_block);
> > +	wp_sector = blk_zone_wp_sector(&blkz);
> > +
> > +	if (cs_sector == wp_sector)
> > +		return 0;
> > +
> > +	if (cs_sector > wp_sector) {
> > +		MSG(0, "Inconsistent write pointer with curseg %d: "
> > +		    "curseg %d[0x%x,0x%x] > wp[0x%x,0x%x]\n",
> > +		    type, type, curseg->segno, curseg->next_blkoff,
> > +		    GET_SEGNO(sbi, wp_block), OFFSET_IN_SEG(sbi, wp_block));
> > +		fsck->chk.wp_inconsistent_zones++;
> > +		return -EINVAL;
> > +	}
> > +
> > +	MSG(0, "Write pointer goes advance from curseg %d: "
> > +	    "curseg %d[0x%x,0x%x] wp[0x%x,0x%x]\n",
> > +	    type, type, curseg->segno, curseg->next_blkoff,
> > +	    GET_SEGNO(sbi, wp_block), OFFSET_IN_SEG(sbi, wp_block));
> > +
> > +	zone_segno = GET_SEG_FROM_SEC(sbi,
> > +				      GET_SEC_FROM_SEG(sbi, curseg->segno));
> > +	zone_last_vblock = START_BLOCK(sbi, zone_segno) +
> > +		last_vblk_off_in_zone(sbi, zone_segno);
> 
> I guess it's safe to pass below condition if last_vblk_off_in_zone() returns -1
> here, it'd better to add comments to describe this condition.
> 
> Anyway, feel free to add:
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks,

I see. Will rephrase the block comment below as follows:

    If valid blocks exist between the curseg position and the write
    pointer, they are fsync data. This is not an error to fix. Leave it
    for kernel to recover later.

    If valid blocks exist between the curseg's zone start and the curseg
    position, or if there is no valid block in the curseg's zone, fix the
    inconsistency between the curseg and the writ pointer.

    Of Note is that if there is no valid block in the curseg's zone,
    last_vblk_off_in_zone() returns -1 and zone_last_vblock is always
    smaller than cs_block.

Will repost the series, adding your reviewed-by tag. Thanks!

> 
> > +
> > +	/*
> > +	 * If fsync data exists between the curseg and the last valid block,
> > +	 * it is not an error to fix. Leave it for kernel to recover later.
> > +	 */
> > +	if (cs_block <= zone_last_vblock && zone_last_vblock < wp_block) {
> > +		MSG(0, "Curseg has fsync data: curseg %d[0x%x,0x%x] "
> > +		    "last valid block in zone[0x%x,0x%x]\n",
> > +		    type, curseg->segno, curseg->next_blkoff,
> > +		    GET_SEGNO(sbi, zone_last_vblock),
> > +		    OFFSET_IN_SEG(sbi, zone_last_vblock));
> > +		return 0;
> > +	}
> > +
> > +	fsck->chk.wp_inconsistent_zones++;
> > +	return -EINVAL;
> > +}
> > +
> > +#else
> > +
> > +static int check_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
> > +{
> > +	return 0;
> > +}
> > +
> > +#endif
> > +
> >  int check_curseg_offset(struct f2fs_sb_info *sbi, int type)
> >  {
> >  	struct curseg_info *curseg = CURSEG_I(sbi, type);
> > @@ -2209,6 +2326,10 @@ int check_curseg_offset(struct f2fs_sb_info *sbi, int type)
> >  			return -EINVAL;
> >  		}
> >  	}
> > +
> > +	if (c.zoned_model == F2FS_ZONED_HM)
> > +		return check_curseg_write_pointer(sbi, type);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -2628,6 +2749,23 @@ out:
> >  	return cnt;
> >  }
> >  
> > +/*
> > + * Check and fix consistency with write pointers at the beginning of
> > + * fsck so that following writes by fsck do not fail.
> > + */
> > +void fsck_chk_and_fix_write_pointers(struct f2fs_sb_info *sbi)
> > +{
> > +	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
> > +
> > +	if (c.zoned_model != F2FS_ZONED_HM)
> > +		return;
> > +
> > +	if (check_curseg_offsets(sbi) && c.fix_on) {
> > +		fix_curseg_info(sbi);
> > +		fsck->chk.wp_fixed = 1;
> > +	}
> > +}
> > +
> >  int fsck_chk_curseg_info(struct f2fs_sb_info *sbi)
> >  {
> >  	struct curseg_info *curseg;
> > @@ -2678,6 +2816,20 @@ int fsck_verify(struct f2fs_sb_info *sbi)
> >  
> >  	printf("\n");
> >  
> > +	if (c.zoned_model == F2FS_ZONED_HM) {
> > +		printf("[FSCK] Write pointers consistency                    ");
> > +		if (fsck->chk.wp_inconsistent_zones == 0x0) {
> > +			printf(" [Ok..]\n");
> > +		} else {
> > +			printf(" [Fail] [0x%x]\n",
> > +			       fsck->chk.wp_inconsistent_zones);
> > +			c.bug_on = 1;
> > +		}
> > +
> > +		if (fsck->chk.wp_fixed && c.fix_on)
> > +			force = 1;
> > +	}
> > +
> >  	if (c.feature & cpu_to_le32(F2FS_FEATURE_LOST_FOUND)) {
> >  		for (i = 0; i < fsck->nr_nat_entries; i++)
> >  			if (f2fs_test_bit(i, fsck->nat_area_bitmap) != 0)
> > diff --git a/fsck/fsck.h b/fsck/fsck.h
> > index 75052d8..c4432e8 100644
> > --- a/fsck/fsck.h
> > +++ b/fsck/fsck.h
> > @@ -80,6 +80,8 @@ struct f2fs_fsck {
> >  		u32 multi_hard_link_files;
> >  		u64 sit_valid_blocks;
> >  		u32 sit_free_segs;
> > +		u32 wp_fixed;
> > +		u32 wp_inconsistent_zones;
> >  	} chk;
> >  
> >  	struct hard_link_node *hard_link_list_head;
> > @@ -162,6 +164,7 @@ int fsck_chk_inline_dentries(struct f2fs_sb_info *, struct f2fs_node *,
> >  		struct child_info *);
> >  void fsck_chk_checkpoint(struct f2fs_sb_info *sbi);
> >  int fsck_chk_meta(struct f2fs_sb_info *sbi);
> > +void fsck_chk_and_fix_write_pointers(struct f2fs_sb_info *);
> >  int fsck_chk_curseg_info(struct f2fs_sb_info *);
> >  void pretty_print_filename(const u8 *raw_name, u32 len,
> >  			   char out[F2FS_PRINT_NAMELEN], int enc_name);
> > diff --git a/fsck/main.c b/fsck/main.c
> > index 8edb177..cd4ca20 100644
> > --- a/fsck/main.c
> > +++ b/fsck/main.c
> > @@ -625,6 +625,8 @@ static void do_fsck(struct f2fs_sb_info *sbi)
> >  
> >  	print_cp_state(flag);
> >  
> > +	fsck_chk_and_fix_write_pointers(sbi);
> > +
> >  	fsck_chk_curseg_info(sbi);
> >  
> >  	if (!c.fix_on && !c.bug_on) {
> > diff --git a/fsck/mount.c b/fsck/mount.c
> > index fdf1dd7..894ee06 100644
> > --- a/fsck/mount.c
> > +++ b/fsck/mount.c
> > @@ -12,6 +12,7 @@
> >  #include "node.h"
> >  #include "xattr.h"
> >  #include <locale.h>
> > +#include <stdbool.h>
> >  #ifdef HAVE_LINUX_POSIX_ACL_H
> >  #include <linux/posix_acl.h>
> >  #endif
> > @@ -2480,6 +2481,52 @@ void set_section_type(struct f2fs_sb_info *sbi, unsigned int segno, int type)
> >  	}
> >  }
> >  
> > +#ifdef HAVE_LINUX_BLKZONED_H
> > +
> > +static bool write_pointer_at_zone_start(struct f2fs_sb_info *sbi,
> > +					unsigned int zone_segno)
> > +{
> > +	u_int64_t sector;
> > +	struct blk_zone blkz;
> > +	block_t block = START_BLOCK(sbi, zone_segno);
> > +	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> > +	int ret, j;
> > +
> > +	if (c.zoned_model != F2FS_ZONED_HM)
> > +		return true;
> > +
> > +	for (j = 0; j < MAX_DEVICES; j++) {
> > +		if (!c.devices[j].path)
> > +			break;
> > +		if (c.devices[j].start_blkaddr <= block &&
> > +		    block <= c.devices[j].end_blkaddr)
> > +			break;
> > +	}
> > +
> > +	if (j >= MAX_DEVICES)
> > +		return false;
> > +
> > +	sector = (block - c.devices[j].start_blkaddr) << log_sectors_per_block;
> > +	ret = f2fs_report_zone(j, sector, &blkz);
> > +	if (ret)
> > +		return false;
> > +
> > +	if (blk_zone_type(&blkz) != BLK_ZONE_TYPE_SEQWRITE_REQ)
> > +		return true;
> > +
> > +	return blk_zone_sector(&blkz) == blk_zone_wp_sector(&blkz);
> > +}
> > +
> > +#else
> > +
> > +static bool write_pointer_at_zone_start(struct f2fs_sb_info *sbi,
> > +					unsigned int zone_segno)
> > +{
> > +	return true;
> > +}
> > +
> > +#endif
> > +
> >  int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
> >  						int want_type, bool new_sec)
> >  {
> > @@ -2533,7 +2580,8 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
> >  					break;
> >  			}
> >  
> > -			if (i == sbi->segs_per_sec) {
> > +			if (i == sbi->segs_per_sec &&
> > +			    write_pointer_at_zone_start(sbi, segno)) {
> >  				set_section_type(sbi, segno, want_type);
> >  				return 0;
> >  			}
> >

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
