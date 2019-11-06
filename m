Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D43BAF12BA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Nov 2019 10:49:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSHwf-0002ne-GC; Wed, 06 Nov 2019 09:49:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=206437fe6=shinichiro.kawasaki@wdc.com>)
 id 1iSHwd-0002n9-QY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Nov 2019 09:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M2wsxsC1puFI3wTkS2Y/vRzFjQbt9SojGw1JV5PWtwA=; b=Z15x+dHqSIg1eYV04UrQCXkrbR
 v3n/+dmv+bmQlMkBCYb5K3Qqz6SeArgzvRKwKyb9WVQgz9XORT23PwNx0xynETqP/A4AmrTPio9PE
 6Ov3NTYSSXm6ojh4gBId6tQyq5acCgExNJ70EZRPtMSERX46etio+pwkJDvQhLbhXLYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M2wsxsC1puFI3wTkS2Y/vRzFjQbt9SojGw1JV5PWtwA=; b=Bwxrciiee3CpSVkcPJ/IcrBw8I
 1EktdpU102teAfWsozgcbFv1V9do9rcAuADHK6ud3P5Qjzzo8ram1ZXFA0hs5l95vFYB7VSaFd9r+
 9lVx/z7lgNAH+ft2ImItKPcoyiUT0YPg4V4GbUWw9qVlvOUjnDDwH7DUHISqdFmIHCUQ=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSHwY-001zOH-RK
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Nov 2019 09:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573033778; x=1604569778;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CtRgjNGRN096TKQb61SQPqTdutUDiUhALFhRUCVVseE=;
 b=a3pQLcPNtpYd0o+hqqJbmN8bH3eD/u8YjoflcAjfqE7+B/TuoyC3Yw5A
 vi0GodYEX1P0tTaaP17I8Gq6NiILeeflTZk7nocthuP5itMRpuX8Qhgbe
 XHIPLgpanWVaNjSmapaBgbFOJ1qL2HRGdV1ETtn1vU2+rLRdbYcyiSwQL
 ++uMMSr/N/6XH/yL/Am/4PyjPpUqEYpHfOTXvc3UuEGuL1a8DVccXIE28
 okQ0ASjsRZBy9weGFTJji02Xv/zePQ6aopDF774sU4guW1fCnCrpZy/B4
 uYzk6nbEnu/lAyi2GFVw4QHm3I96TqqOUejYfCDgpdKBruKP7m+q3humM Q==;
IronPort-SDR: ATxACSTLe+3eAlpToi0Ua3asPUjTXMWr5jTeMOOxntUPjwNR5n7/PQJyx2SGTe/TNRC+0nvSfn
 0hn9ILNhgDFU6qiegjF8FbwjzbFNsiSm12Nj816TvbjnNgs5EDXpYatVNj/y/2i3FZrVcTgmX6
 y5j8ty7TcEKzuFwJjF98I2Vh1wh47WYXV14JI+sBqHPwSAXHlWghgnfwlJyNzn+pjVqbOdDtb5
 hoMo+CGKFVL0qleLZQ5JKdQoS12wgjEWpqV96Bk8mH7ADowowhGJ1ZrRD/M179e5TkrTaGHV0Z
 1pM=
X-IronPort-AV: E=Sophos;i="5.68,274,1569254400"; d="scan'208";a="123014261"
Received: from mail-bn3nam01lp2056.outbound.protection.outlook.com (HELO
 NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.56])
 by ob1.hgst.iphmx.com with ESMTP; 06 Nov 2019 17:49:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXyBiJNghQJV+SlfAus5rr2RF6iBkeUvbzdTXMv7puY/Q1E7datFiA+4nrQOiodhD7j1zxL2bovP0d6JFVXDFnQCnw1NpHnpG3U4bhs5kIRSEr0Z4QZpLmimW8d1+5yU8PDAc4rPolMFKx8MXrYgPp4vSH1geuwTsKdE4oGfRv3nwx9pazrOQCBUnUrnMO1Vn3HcRlME4/Mb+zYGWE8Q62vxuk64Fxc+JgZrExh+qo3fgvuwivJSj2tNjodUNZ2f3OKeP80magors2qWsM2ZRTBrCU/rrO54HidbZh0oJ/eZ7umP9ZniagrlobzLNsT5yPZ5//KFKCa262ZcvA6d7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2wsxsC1puFI3wTkS2Y/vRzFjQbt9SojGw1JV5PWtwA=;
 b=c6Z0a9C1ML4BMM2kjmGo23822oVcVQTv8akUC1ta7OuzM+h+aztFDywAMjNSWPttWfKyJEVCUCqIZn1zmeoJGNSd4v4edBZX1ue6jjSd1/i/P5sVBBrEr90jcXJywPe1qcwiaxV/FMMbow7N9Amjp0kHe2fEo6ezSBYY00lfLD/ybO4YwMmGpjq6i4iWPxii1PTtbsvpxZYHe42kSS7XPH1XHzBB2inyhVphWB5RsNDJCHI4vdwx+Sr/kVWnjL2Bhx5vlqPP+aO83RVzahhf6qOoyXBpXGGqcrrD4oM3ZuhpFvESMMI0BBPRxxPeveSNlxvpQg56eyYAo/8B4A6wBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2wsxsC1puFI3wTkS2Y/vRzFjQbt9SojGw1JV5PWtwA=;
 b=hoYeTZftqIle43ousFC86QIKaU+Sq0RCd/7dTXL9dW+BMVWg3ntHqs69uBMoJuTHDCyeQPbHtq1s2n+ctZhenhRsOez0a1z/8K4ifvVBRtQh2YnUb57e1IwADjWPzkkWiGEriMSAUNFthPdVcH2I/SuiCsKgKnjMv8X9PYbERJ4=
Received: from BN3PR04MB2257.namprd04.prod.outlook.com (10.166.73.148) by
 BN3PR04MB2371.namprd04.prod.outlook.com (10.166.73.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Wed, 6 Nov 2019 09:49:27 +0000
Received: from BN3PR04MB2257.namprd04.prod.outlook.com
 ([fe80::ac2f:6507:f217:9ab1]) by BN3PR04MB2257.namprd04.prod.outlook.com
 ([fe80::ac2f:6507:f217:9ab1%11]) with mapi id 15.20.2408.024; Wed, 6 Nov 2019
 09:49:27 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v6 8/8] fsck: Check write pointer consistency of non-open
 zones
Thread-Index: AQHVjVyyFWSvrC/Mc0qjMxt/UG2XFKd8fp+AgAF1mgA=
Date: Wed, 6 Nov 2019 09:49:27 +0000
Message-ID: <20191106094926.vmwzh7km4fefa34k@shindev.dhcp.fujisawa.hgst.com>
References: <20191028065512.27876-1-shinichiro.kawasaki@wdc.com>
 <20191028065512.27876-9-shinichiro.kawasaki@wdc.com>
 <9e4646fb-6c16-b0f6-7fa8-8099018f19ed@huawei.com>
In-Reply-To: <9e4646fb-6c16-b0f6-7fa8-8099018f19ed@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2a8050e5-d15f-451f-4c6b-08d7629e9d0c
x-ms-traffictypediagnostic: BN3PR04MB2371:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN3PR04MB237195429451051773393EC0ED790@BN3PR04MB2371.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(199004)(189003)(446003)(6512007)(6116002)(66946007)(54906003)(6246003)(11346002)(6486002)(3846002)(71190400001)(71200400001)(26005)(14444005)(1076003)(102836004)(256004)(6436002)(305945005)(186003)(7736002)(66066001)(9686003)(229853002)(486006)(476003)(44832011)(66446008)(76116006)(91956017)(316002)(86362001)(6916009)(66476007)(5660300002)(14454004)(8936002)(81166006)(6506007)(81156014)(53546011)(4326008)(2906002)(64756008)(99286004)(478600001)(76176011)(66556008)(25786009)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR04MB2371;
 H:BN3PR04MB2257.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +hmB7gbvY+zUOECahljmFrRIlRBuZtQ1p2xLHVnAyOLwjp0oYzib66KFWDK4b1+fVHJATuhr6fC861oh7iEb9IEN3mhk+py/tMs61yH7Tngfc9isVvP5H2YuaNfW1WNtxD9WOfIYzkiXRwzLimXgsNX3ZhyAmKd8tBqu34q/ZZxL7IJ3sH+emg7y/k5Dbx2uGoScoA6dzfn5Jkx9TvazvG7RS7vhkn5Vw9XvSfCudIMea5+s3y8D0b8lNa3/P5BJX3neYB9P+p3KnocMmV170vPE8blPsyBGtmaonwYjTB+t3HR4HgbaQhrL+eQgOlqHpGVaZRJgpVmShoxn518KUNO8y5hfojexGQ8pI8d2ISS/HDlQWVjVy78iRgYp/3XRbpPQDtl2pryTcXgacgfvJpu8xPYQFNXz+BuAw4/KNqor5PSTX0BjcsbxIkP+dd5n
Content-ID: <342A203195C4054B812B48CD9F750717@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8050e5-d15f-451f-4c6b-08d7629e9d0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 09:49:27.4008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RBkKgK0sgjv1GcYoqaS/fv1WVaSRrZaieI1Cvf4alzmpsrybw19aZkEnkFREghwz2HrLuljbQIqWOJ3+ekfQXhre0WGkyyB6DeV1Ilfgr3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR04MB2371
X-Spam-Score: 0.4 (/)
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
 0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iSHwY-001zOH-RK
Subject: Re: [f2fs-dev] [PATCH v6 8/8] fsck: Check write pointer consistency
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

On Nov 05, 2019 / 19:32, Chao Yu wrote:
> On 2019/10/28 14:55, Shin'ichiro Kawasaki wrote:
> > To catch f2fs bug in write pointer handling code for zoned block devices,
> > have fsck check consistency of write pointers of non-open zones, that
> > current segments do not point to. Check two items comparing write pointer
> > positions with valid block maps in SIT.
> > 
> > The first item is check for zones with no valid blocks. When there is no
> > valid blocks in a zone, the write pointer should be at the start of the
> > zone. If not, next write operation to the zone will cause unaligned write
> > error. If write pointer is not at the zone start, reset the zone to move
> > the write pointer to the zone start.
> > 
> > The second item is check between write pointer position and the last
> > valid block in the zone. It is unexpected that the last valid block
> > position is beyond the write pointer. In such a case, report as the bug.
> > Fix is not required for such zone, because the zone is not selected for
> > next write operation until the zone get discarded.
> > 
> > In the same manner as the consistency check for current segments, do the
> > check and fix twice: at the beginning of do_fsck() to avoid unaligned
> > write error during fsck, and at fsck_verify() to reflect meta data
> > updates by fsck.
> > 
> > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > ---
> >  fsck/fsck.c | 119 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 119 insertions(+)
> > 
> > diff --git a/fsck/fsck.c b/fsck/fsck.c
> > index e0eda4e..8400929 100644
> > --- a/fsck/fsck.c
> > +++ b/fsck/fsck.c
> > @@ -2751,6 +2751,122 @@ out:
> >  	return cnt;
> >  }
> >  
> > +#ifdef HAVE_LINUX_BLKZONED_H
> > +
> > +struct write_pointer_check_data {
> > +	struct f2fs_sb_info *sbi;
> > +	int dev_index;
> > +};
> > +
> > +static int chk_and_fix_wp_with_sit(int i, void *blkzone, void *opaque)
> > +{
> > +	struct blk_zone *blkz = (struct blk_zone *)blkzone;
> > +	struct write_pointer_check_data *wpd = opaque;
> > +	struct f2fs_sb_info *sbi = wpd->sbi;
> > +	struct device_info *dev = c.devices + wpd->dev_index;
> > +	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
> > +	block_t zone_block, wp_block, wp_blkoff;
> > +	unsigned int zone_segno, wp_segno;
> > +	struct curseg_info *cs;
> > +	int cs_index, ret, last_valid_blkoff;
> > +	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> > +	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
> > +
> > +	if (blk_zone_conv(blkz))
> > +		return 0;
> > +
> > +	zone_block = dev->start_blkaddr
> > +		+ (blk_zone_sector(blkz) >> log_sectors_per_block);
> > +	zone_segno = GET_SEGNO(sbi, zone_block);
> > +	if (zone_segno >= MAIN_SEGS(sbi))
> > +		return 0;
> > +
> > +	wp_block = dev->start_blkaddr
> > +		+ (blk_zone_wp_sector(blkz) >> log_sectors_per_block);
> > +	wp_segno = GET_SEGNO(sbi, wp_block);
> > +	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
> > +
> > +	/* if a curseg points to the zone, skip the check */
> > +	for (cs_index = 0; cs_index < NO_CHECK_TYPE; cs_index++) {
> > +		cs = &SM_I(sbi)->curseg_array[cs_index];
> > +		if (zone_segno <= cs->segno &&
> > +		    cs->segno < zone_segno + segs_per_zone)
> > +			return 0;
> > +	}
> > +
> > +	last_valid_blkoff = last_vblk_off_in_zone(sbi, zone_segno);
> > +
> > +	/*
> > +	 * When there is no valid block in the zone, check write pointer is
> > +	 * at zone start. If not, reset the write pointer.
> > +	 */
> > +	if (last_valid_blkoff < 0 &&
> > +	    blk_zone_wp_sector(blkz) != blk_zone_sector(blkz)) {
> > +		if (!c.fix_on) {
> > +			MSG(0, "Inconsistent write pointer: wp[0x%x,0x%x]\n",
> > +			    wp_segno, wp_blkoff);
> > +			fsck->chk.wp_inconsistent_zones++;
> > +			return 0;
> > +		}
> > +
> > +		FIX_MSG("Reset write pointer of zone at segment 0x%x",
> > +			zone_segno);
> > +		ret = f2fs_reset_zone(wpd->dev_index, blkz);
> > +		if (ret) {
> > +			printf("[FSCK] Write pointer reset failed: %s\n",
> > +			       dev->path);
> > +			return ret;
> > +		}
> > +		fsck->chk.wp_fixed = 1;
> > +		return 0;
> > +	}
> > +
> > +	/*
> > +	 * If valid blocks exist in the zone beyond the write pointer, it
> > +	 * is a f2fs bug. No need to fix because the zone is not selected
> 
> Minor thing, mostly probably it is a f2fs bug, however there should be
> software/hardware bug in other layer can cause such inconsistent.. so let's get
> rid of such first impression. :)
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks,

Ah, that is a stereotype. I think it's the better to remove the word "f2fs", as
follows. Will do that edit.

/*
 * If valid blocks exist in the zone beyond the write pointer, it
 * is a bug. No need to ...

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
