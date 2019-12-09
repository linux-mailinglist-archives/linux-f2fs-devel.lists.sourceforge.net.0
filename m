Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB788116788
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2019 08:28:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieDTU-0007oA-Ln; Mon, 09 Dec 2019 07:28:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2395697a2=shinichiro.kawasaki@wdc.com>)
 id 1ieDTS-0007ny-8o
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 07:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u9BBc5OVEgbfQ+8JzL8rx+/2sVCu0Zcl4OFR6eIKbaY=; b=GoS63E+6CDNWih221RU/dO4AWW
 NIy8+cdbywneZz7JFfTajEvSTkvxcHbK/VNplYh8wk0Ag9+lie/X2GfvOU1MebRnn29QtC6/dHnjv
 boqcO/psuW0XbGxQhwhfB6DVo9ngbRB5XMKz9P06+0227dsV0x4s2z1GR/HCYn0wPNtM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u9BBc5OVEgbfQ+8JzL8rx+/2sVCu0Zcl4OFR6eIKbaY=; b=DSsqyZpSBux5482Ck+kb3s49UO
 f+vps82/rTzlC3OIGRQEow2tLK11QMUHKbSB6VnKhywMIS1NiVvjP2+66IjPF5Sl4SY8IcaPHEwtU
 4bbfmpAZmVJT4T+o/4+KvuUNJeBXlz93fQzdLz5oP84tMzM6prgtVU4p7lWKeJrymT/A=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieDTK-00F2ct-Az
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 07:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1575876526; x=1607412526;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RID/eEj/DJ2+5TIeGTfv6rT+1h4nI2PLMCmm3B55iy0=;
 b=cHrS0oO72KcdBf3S685rW6ASG5z3Pdb2RsnDJvGaYy0WUSY4JIE9h7GW
 pPAdhvzCk8wbThpgP66GCAlUrHAdp3PcFYAMu6RGnnSq2/lsJ0Hia9bRn
 pHqJB5M5/2nTLdyefz9UKzME6Bnq7bracWuG//8gQ54ZX0zAU+b2nm9yu
 DDs+ybiSedIoRM57Jo25CitgHH0NkBUjdgI/DtpsmaQd6nrvPfTHL3dV8
 PVIAw+amK+xLXIbVFX/nuRxWjflFcpn6YDHi0IPKVPDXLeIDKe9sDZlFs
 kXKp1fZQN18oJng5KtRwrg/r/MaYujproU62MphCnDVfC0mNHbPRC/V2G A==;
IronPort-SDR: lULT07rthfa2sKXu9D3lu9KcqM42tcHhNf5xnfrZgmxf++TV16hL5uOl8b6wNebLrsSxwjj/Va
 J9SbkCW7ofy8Ui3kz895WuGsDAG0AwBHIh8OWo3mWG300QQYA1g69yLABwwGAS9APQlwg5VJy1
 QWnmEVUAxdmfHMiwjEPCiud3d7HdtJbsQ5sTMplydl4yI02rXzjJ32DrnGVT8DQMDtfv/8ptyo
 8cJg8aHm3kqBxkC2nQX3Rj4O4of5v0UnaN8q7ndIddcsptxvaia7uJZOuUWsDhLmYdYc4tqGuu
 gd4=
X-IronPort-AV: E=Sophos;i="5.69,294,1571673600"; d="scan'208";a="126508789"
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2019 15:28:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6UgEZfrXJ35lPezjjFYkZ1NRR0wYKiunswV7vC3UrpQynKZ4nPMpSoqBMgrxl3HURAfENjt4M2yD9hWYismpo1AMIURcCetLW5H27aLWI8pbV2/pSR2xDznWTIrgkUBeAPWE6LuF/CuME+PUwZHgMsFyxlr4HG7NHKInN8f/aeovWpIzDzt9jmg+PiXCgALgqh30659eM8v4CwEALWFML6J1wc92J29BJiXoxi44Q7ni4vgTksIfGkN8jWpmWxKHwVsDSxzQusBTUQpvFiE/9BdTK0tkzCfUZOFigxomiXY1snigiSi6dd5YysoIpLkWZ9CDd9KGeGkgFjVbGjk5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9BBc5OVEgbfQ+8JzL8rx+/2sVCu0Zcl4OFR6eIKbaY=;
 b=m78lb02IkSYUnRu+NXRy3+dnL6dQ6Xc1lOODPTgw/QMIOy6DguwvIwRRNKxq2Ht/0D+04qYZ78klcrYagttBxHYTQ2AJdaSoFwb97tZ3T2X7aiGxfthnfc/g2mDmC8NV7p+Va8s/KIa9jXNjMQSiwFeEMjbN7XTc64EO47wHsFSsHgmY1Pf/EFKsEUwbMr98ivZ404o8riVC1mGOGOW4xus5QlzqDvSVcLzun2BEdXDFOdXiqKqoxHussn9hwBXJTf5BOuRoUfBpJ81kzhc+3XLIuvSx5I74PLVUsAf+BC0EbQk19A2vjMKOkL4LmhtkT3L89xd79o+dU5EWTwtz8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9BBc5OVEgbfQ+8JzL8rx+/2sVCu0Zcl4OFR6eIKbaY=;
 b=nnvdx+U2JdJdK5YQwNnlgcezFGpLoVlaNez0pqNpA+ToXmg9tOOFEy5G8WsaQZLVDppXkSB+pB3WV8RuOtWWRVIUpbA1nUinayDLk+3YkXi7fPoiuSvv8DF4CleuIibbBdX1ovfjfMslRsK5V/OO48h6wBi3ManxzxZx6J+ofdE=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2201.namprd04.prod.outlook.com (10.167.8.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.17; Mon, 9 Dec 2019 07:28:33 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::30f9:4a94:796:3014]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::30f9:4a94:796:3014%12]) with mapi id 15.20.2516.018; Mon, 9 Dec 2019
 07:28:33 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v4 2/2] f2fs: Check write pointer consistency of non-open
 zones
Thread-Index: AQHVqPSZzuU/4TG7/0OSX3nEPHtsQaexGDQAgABaZoA=
Date: Mon, 9 Dec 2019 07:28:33 +0000
Message-ID: <20191209072831.2abtj3yiebzdbwzd@shindev.dhcp.fujisawa.hgst.com>
References: <20191202094043.892258-1-shinichiro.kawasaki@wdc.com>
 <20191202094043.892258-3-shinichiro.kawasaki@wdc.com>
 <bb00d068-9ad5-4685-1745-ba485ee5c2ad@huawei.com>
In-Reply-To: <bb00d068-9ad5-4685-1745-ba485ee5c2ad@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2194d4bd-6bfb-46ad-e896-08d77c79659c
x-ms-traffictypediagnostic: CY1PR04MB2201:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2201BBC7FC8013C3679B8126ED580@CY1PR04MB2201.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:337;
x-forefront-prvs: 02462830BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(396003)(366004)(346002)(136003)(39860400002)(189003)(199004)(8676002)(81166006)(305945005)(81156014)(6486002)(44832011)(1076003)(86362001)(99286004)(229853002)(4326008)(5660300002)(8936002)(6916009)(54906003)(2906002)(71190400001)(71200400001)(102836004)(26005)(186003)(478600001)(53546011)(6506007)(6512007)(9686003)(76176011)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(91956017)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2201;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c4i2CrJhiIpBb3hXoCa7uiR/PSPbGNXTueuNZcqKsHoJM1Ri6Ki/2Iuwom8gJXkJOXKIv4LRDLNcfElOhMIztjCRey+5fBYwTI04qR5sRms/yOq42sfbTVaZafXiWTlFK5s+FvCvi5p0ZehiYRBskrYjRlMkPTbPBshRQMiQ+GIqu7K3+bqAjF25oJ+8YNDtHxYhuMSjhPbAu1hftcqB+2R2siJz4QDZYH0FJQjoZdO053ZH03qN+GUws2Y2bnjvHqqxS8ECwjXNjH26Su+a1JTr5hgMs7U+UCpXSXIyR3MQRwXte/aBrYVff2ki2RVJnDU3Bk8SOaWK0/3IcUVJ2wnrMXViqCUoMzdD2Po0DFre7Mepn/2bb4xi/SFO1vHa9o7wHXtZ/ysSqTZCUbX+ZvczqGxwsrk4xpeJHftJbAbDiloOdB75hDnFID6B4tDF
Content-ID: <68935AE56B8E4F49A9976691FB7DA255@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2194d4bd-6bfb-46ad-e896-08d77c79659c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2019 07:28:33.2474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EcTWb64BuGq1Z+R0FFokxkYsZCdqn5Ip2JauW+V5C40M0+vLdJz79srdvMCjHVSOSH6OJWroGg3i9j90kKzg8O2N0tOESqh4m+mQxEII5vI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2201
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ieDTK-00F2ct-Az
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: Check write pointer consistency
 of non-open zones
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

On Dec 09, 2019 / 10:04, Chao Yu wrote:
> On 2019/12/2 17:40, Shin'ichiro Kawasaki wrote:
> > To catch f2fs bugs in write pointer handling code for zoned block
> > devices, check write pointers of non-open zones that current segments do
> > not point to. Do this check at mount time, after the fsync data recovery
> > and current segments' write pointer consistency fix. Or when fsync data
> > recovery is disabled by mount option, do the check when there is no fsync
> > data.
> > 
> > Check two items comparing write pointers with valid block maps in SIT.
> > The first item is check for zones with no valid blocks. When there is no
> > valid blocks in a zone, the write pointer should be at the start of the
> > zone. If not, next write operation to the zone will cause unaligned write
> > error. If write pointer is not at the zone start, reset the write pointer
> > to place at the zone start.
> > 
> > The second item is check between the write pointer position and the last
> > valid block in the zone. It is unexpected that the last valid block
> > position is beyond the write pointer. In such a case, report as a bug.
> > Fix is not required for such zone, because the zone is not selected for
> > next write operation until the zone get discarded.
> > 
> > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > ---
> >  fs/f2fs/f2fs.h    |   1 +
> >  fs/f2fs/segment.c | 126 ++++++++++++++++++++++++++++++++++++++++++++++
> >  fs/f2fs/super.c   |  11 ++++
> >  3 files changed, 138 insertions(+)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 002c417b0a53..23a84d7f17b8 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -3156,6 +3156,7 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
> >  			unsigned int val, int alloc);
> >  void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
> >  int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi);
> > +int f2fs_check_write_pointer(struct f2fs_sb_info *sbi);
> >  int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
> >  void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
> >  int __init f2fs_create_segment_manager_caches(void);
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 9b6c7ab67b93..48903b7a9d25 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -4370,6 +4370,90 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
> >  
> >  #ifdef CONFIG_BLK_DEV_ZONED
> >  
> > +static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
> > +				    struct f2fs_dev_info *fdev,
> > +				    struct blk_zone *zone)
> > +{
> > +	unsigned int wp_segno, wp_blkoff, zone_secno, zone_segno, segno;
> > +	block_t zone_block, wp_block, last_valid_block;
> > +	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> > +	int i, s, b, ret;
> > +	struct seg_entry *se;
> > +
> > +	if (zone->type != BLK_ZONE_TYPE_SEQWRITE_REQ)
> > +		return 0;
> > +
> > +	wp_block = fdev->start_blk + (zone->wp >> log_sectors_per_block);
> > +	wp_segno = GET_SEGNO(sbi, wp_block);
> > +	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
> > +	zone_block = fdev->start_blk + (zone->start >> log_sectors_per_block);
> > +	zone_segno = GET_SEGNO(sbi, zone_block);
> > +	zone_secno = GET_SEC_FROM_SEG(sbi, zone_segno);
> > +
> > +	if (zone_segno >= MAIN_SEGS(sbi))
> > +		return 0;
> > +
> > +	/*
> > +	 * Skip check of zones cursegs point to, since
> > +	 * fix_curseg_write_pointer() checks them.
> > +	 */
> > +	for (i = 0; i < NO_CHECK_TYPE; i++)
> > +		if (zone_secno == GET_SEC_FROM_SEG(sbi,
> > +						   CURSEG_I(sbi, i)->segno))
> > +			return 0;
> > +
> > +	/*
> > +	 * Get last valid block of the zone.
> > +	 */
> > +	last_valid_block = zone_block - 1;
> > +	for (s = sbi->segs_per_sec - 1; s >= 0; s--) {
> > +		segno = zone_segno + s;
> > +		se = get_seg_entry(sbi, segno);
> > +		for (b = sbi->blocks_per_seg - 1; b >= 0; b--)
> > +			if (f2fs_test_bit(b, se->cur_valid_map)) {
> > +				last_valid_block = START_BLOCK(sbi, segno) + b;
> > +				break;
> > +			}
> > +		if (last_valid_block >= zone_block)
> > +			break;
> > +	}
> > +
> > +	/*
> > +	 * If last valid block is beyond the write pointer, report the
> > +	 * inconsistency. This inconsistency does not cause write error
> > +	 * because the zone will not be selected for write operation until
> > +	 * it get discarded. Just report it.
> > +	 */
> > +	if (last_valid_block >= wp_block) {
> > +		f2fs_notice(sbi, "Valid block beyond write pointer: "
> > +			    "valid block[0x%x,0x%x] wp[0x%x,0x%x]",
> > +			    GET_SEGNO(sbi, last_valid_block),
> > +			    GET_BLKOFF_FROM_SEG0(sbi, last_valid_block),
> > +			    wp_segno, wp_blkoff);
> > +		return 0;
> > +	}
> > +
> > +	/*
> > +	 * If there is no valid block in the zone and if write pointer is
> > +	 * not at zone start, reset the write pointer.
> > +	 */
> > +	if (last_valid_block + 1 == zone_block && zone->wp != zone->start) {
> > +		f2fs_notice(sbi,
> > +			    "Zone without valid block has non-zero write "
> > +			    "pointer. Reset the write pointer: wp[0x%x,0x%x]",
> > +			    wp_segno, wp_blkoff);
> > +		ret = blkdev_zone_mgmt(fdev->bdev, REQ_OP_ZONE_RESET,
> > +				       zone->start, zone->len, GFP_NOFS);
> 
> Should use __f2fs_issue_discard_zone() to cover multi-device support?

Yes, __f2fs_issue_discard_zone() for each device adds more check and I think
it is safer for multi-device case. Will re-post the patch with you suggest.

> 
> > +		if (ret) {
> > +			f2fs_notice(sbi, "Reset zone failed: %s (errno=%d)",
> > +				    fdev->path, ret);
> > +			return ret;
> > +		}
> 
> Just out of curiosity, how long will RESET command take normally?

Though I don't have accurate numbers, it takes around 10 milliseconds to
complete one RESET command for one zone with my system. Assuming the number
of zones to discard here is small, I think the additional overhead is small
enough to ignore.

Thanks!

> 
> Thanks,
> 
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static struct f2fs_dev_info *get_target_zoned_dev(struct f2fs_sb_info *sbi,
> >  						  block_t zone_blkaddr)
> >  {
> > @@ -4442,6 +4526,10 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
> >  		    "curseg[0x%x,0x%x]", type, cs->segno, cs->next_blkoff);
> >  	allocate_segment_by_default(sbi, type, true);
> >  
> > +	/* check consistency of the zone curseg pointed to */
> > +	if (check_zone_write_pointer(sbi, zbd, &zone))
> > +		return -EIO;
> > +
> >  	/* check newly assigned zone */
> >  	cs_section = GET_SEC_FROM_SEG(sbi, cs->segno);
> >  	cs_zone_block = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, cs_section));
> > @@ -4492,11 +4580,49 @@ int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
> >  
> >  	return 0;
> >  }
> > +
> > +struct check_zone_write_pointer_args {
> > +	struct f2fs_sb_info *sbi;
> > +	struct f2fs_dev_info *fdev;
> > +};
> > +
> > +static int check_zone_write_pointer_cb(struct blk_zone *zone, unsigned int idx,
> > +				      void *data) {
> > +	struct check_zone_write_pointer_args *args;
> > +	args = (struct check_zone_write_pointer_args *)data;
> > +
> > +	return check_zone_write_pointer(args->sbi, args->fdev, zone);
> > +}
> > +
> > +int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
> > +{
> > +	int i, ret;
> > +	struct check_zone_write_pointer_args args;
> > +
> > +	for (i = 0; i < sbi->s_ndevs; i++) {
> > +		if (!bdev_is_zoned(FDEV(i).bdev))
> > +			continue;
> > +
> > +		args.sbi = sbi;
> > +		args.fdev = &FDEV(i);
> > +		ret = blkdev_report_zones(FDEV(i).bdev, 0, BLK_ALL_ZONES,
> > +					  check_zone_write_pointer_cb, &args);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> >  #else
> >  int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
> >  {
> >  	return 0;
> >  }
> > +
> > +int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
> > +{
> > +	return 0;
> > +}
> >  #endif
> >  
> >  /*
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 5111e1ffe58a..755ad57c795b 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -3544,6 +3544,17 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
> >  			goto free_meta;
> >  		}
> >  	}
> > +
> > +	/*
> > +	 * If the f2fs is not readonly and fsync data recovery succeeds,
> > +	 * check zoned block devices' write pointer consistency.
> > +	 */
> > +	if (!err && !f2fs_readonly(sb) && f2fs_sb_has_blkzoned(sbi)) {
> > +		err = f2fs_check_write_pointer(sbi);
> > +		if (err)
> > +			goto free_meta;
> > +	}
> > +
> >  reset_checkpoint:
> >  	/* f2fs_recover_fsync_data() cleared this already */
> >  	clear_sbi_flag(sbi, SBI_POR_DOING);
> > 

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
