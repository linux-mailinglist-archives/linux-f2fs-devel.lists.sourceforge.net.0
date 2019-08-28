Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84937A0110
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Aug 2019 13:53:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2wWJ-0007Dk-Ed; Wed, 28 Aug 2019 11:53:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1363b3d4c=shinichiro.kawasaki@wdc.com>)
 id 1i2wWI-0007DU-LG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Aug 2019 11:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3A0SSbaRXpZvWEdBfeKJ+qf/jEUwMfZIRtpBfSj328E=; b=PZYAqMq8wYnwCaJyIuyQV7CZq0
 JoSFuUrP45Nbm/NDi4Wt8UIrx9d0SNRX/ZlLCozWwSY1oU0PGMljDQFSJqEzvPP8vq+GY1DRteKrV
 yYO5l5XflQp/2ZRdmqPQ8b9pFdsg+iaYHMH5Wl3Rte5Pk57YfG/ls8UdaDp7Vo2IpH08=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3A0SSbaRXpZvWEdBfeKJ+qf/jEUwMfZIRtpBfSj328E=; b=Fzr85MtaSlN6DT3Ksr2vVnm3y1
 l4dEB8z+cVv3G03hmm1goA0n5T2rdArr93xYfnBy8q69K0n+Z7k+0IcSj4WMTCdStIRXyoE0f5fiH
 Fa58gn3EMTure7yHgnILVDJNN+CU3ki03GTQy/ASIzeWGjLStBOiJYuGgloi8XAGsgck=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2wWF-006HEZ-94
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Aug 2019 11:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566993224; x=1598529224;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+kzRe11pwEwWTtAiW0vlRtXyj/Ass6muU6TdtK1MaJc=;
 b=dROBoNUe/nbu7PN3Tjd63GRDr/Jtk3MBgQjQz84PxKsBfKMHk8MKejWX
 OGwTswyZGeYBkm/Mybj//k2JVgdvIFpXL70O51MHoZGoTJlIBH6z/+hHe
 NqXg8L3xvSZaaWbriuEBjTSm/YYZ1cd6o+SX4CZR6DIIJHD5g9/I2S6jF
 Gwn1uvE8siQXjceWJ4lavvyV9lbqMmDqBVubaJ8ZPLt55ix65a3gc3tJ7
 zD+Huj8OOlUqiXs24vk7+IwbXtvXMgmDsq1VGuh1W7Y4oAsRQHfJSD5rF
 pSQCUINW9xuAE2V2jEP6UV40xGy1hG5RID+Xh6SoRMFyyIgWHC4X3Xioj g==;
IronPort-SDR: TRMsHxJRVYVxpsuKf1+6c4POl8OSItuFNd5ndyw5qmiFOqnTMQsOmweQ92wlcxncMCxLfZKJnk
 xHEcjnNz2adlf+fWYQ2ae03KfOx7x01qijT0ukUOw8ozI3gNfeEpSIif29rh4JZeqEw6JwS3sa
 waBSSKHjME479Rjww0XpznGzCv2YQOntYoh/uapGo9fGs9/fD1Xc2vY46CEYhz2/mUY6+NAOSg
 9ly3C6wjjBBQcmktfO7K7G2nFO88ZOtO2FZnpvrKRMCUZ1lmJzRSJ6CAJpMV7fd+NONtzmGEIM
 wo4=
X-IronPort-AV: E=Sophos;i="5.64,441,1559491200"; d="scan'208";a="118447544"
Received: from mail-dm3nam03lp2050.outbound.protection.outlook.com (HELO
 NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.50])
 by ob1.hgst.iphmx.com with ESMTP; 28 Aug 2019 19:53:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bB934rJqznqiv9q3J0zDjLU2G1HjulVokcZgonbSPj2KFbr6sMpq0BS4MYpShMQybZQqv/vtwUL0TFmyIFpCzW83W8UX+KRI5RBfOQ8yO96VmWTUBJDwNHO8PsxRB+5F7RqJ7raOuMaNRUOtVZ1XH/luz5mqMVebNOx+8u4t3R4mVWnIH7nD/JVXrMY98/L13c+KtUo83QGcOnlkGUxmvReLGxRWXOCaJfeVd4KfrEJuXm1QPuDm854eZa3Hirdzq3gTL+MSi1VLInzYmEXAIMRpFIKT0GEKvi9dDB6PLTYkeefrd1CjAL9Z1Stg53PCXquMQ1sHssgvTRUrEZ4pDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3A0SSbaRXpZvWEdBfeKJ+qf/jEUwMfZIRtpBfSj328E=;
 b=kR5vlntch70c3wh9tdtiWqG5hDZlvTjo93+8LH2nNorgw9+NSPGx857qKFOfDreZ5gZqVNZPJ7UY1mppw5qQxaW5GyPqt8BVbo59i8gP94LET3yjXlJ4CVq/CGHCG3661gHXmpepsSv5VPS0O2qqvHliChdMpZf7cR30twlJX5e+AecEFO0NfWaj9C2OBca3S+oOWsn0vLU9ctZd910h8D8ylPEhf5Ipk1TM1zlPrZdl+PrUinvUEr2VMdOy8q50haX2CxE2K84R/h16m9HpkAWKfqJphnNroKz3MCvyVXjRMQuUPxqeji2MHWsTt9gp3LZuw9uJZj3DSIvQpg8GxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3A0SSbaRXpZvWEdBfeKJ+qf/jEUwMfZIRtpBfSj328E=;
 b=nyNcx1xD5bFYz7fTzk/8tJXTD/Wm1/CihFBUy8pqEMt7r/O5hQAK0DAv4i2UuTosECJFdDGRI0bdbYjFu+q2VB3o5798oNTpw1wP+z+1XDkfLIXlrnjOOh6+WU15six0m/q7hYzDJPDR231rwfx2PrQo734UtjnafJJzsn7UxeI=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2009.namprd04.prod.outlook.com (10.166.191.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 11:53:36 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::31aa:d179:ec71:4a66]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::31aa:d179:ec71:4a66%9]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 11:53:36 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v2 4/4] fsck.f2fs: Check write pointer consistency with
 valid blocks count
Thread-Index: AQHVV9umnBeVs6tYsUeSGGGb0EbaracOTZaAgAIxIYA=
Date: Wed, 28 Aug 2019 11:53:36 +0000
Message-ID: <20190828115333.ciivgtdmdprjxgaa@shindev.dhcp.fujisawa.hgst.com>
References: <20190821044802.29702-1-shinichiro.kawasaki@wdc.com>
 <20190821044802.29702-5-shinichiro.kawasaki@wdc.com>
 <fd7b8699-3335-1f7e-96de-0818dd014278@huawei.com>
In-Reply-To: <fd7b8699-3335-1f7e-96de-0818dd014278@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56d5d929-8ae7-4c73-242d-08d72bae5c08
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY1PR04MB2009; 
x-ms-traffictypediagnostic: CY1PR04MB2009:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2009D751E788FA5DDDD78363EDA30@CY1PR04MB2009.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(189003)(199004)(86362001)(4326008)(256004)(102836004)(6512007)(14444005)(25786009)(91956017)(76116006)(5660300002)(229853002)(66446008)(64756008)(66476007)(66946007)(66556008)(9686003)(478600001)(316002)(58126008)(71190400001)(66066001)(6246003)(71200400001)(53936002)(54906003)(476003)(8936002)(8676002)(3846002)(2906002)(6486002)(6116002)(1076003)(14454004)(81166006)(486006)(6916009)(44832011)(3716004)(99286004)(305945005)(6506007)(53546011)(7736002)(186003)(26005)(11346002)(81156014)(6436002)(446003)(76176011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2009;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: M3wqXAYRW+rRUoPE0WiLbQz7UKZcSWMfFIRpQ6w+eQv50X6QXjXoWeu+K5/tVvZ0vea/Twz2CU3PQ5rJ1ERLW4jlBWMiOcmIYB1ITTpQwM/kkPmENlJRstbqBFzarjY6qqRnThqqaAVX3FtZa2Tpx6f5kRamXjG+oxK/4p7zlBoUz+u02JMbmFiq/JZrpkpHgGOtaG7z6pvL+CS+0OPFjaZf9cGCxubagNioTRc/XhWjdwLCt2hd26NciuUK4yUDBr2PNiO/CL3/hH4Lwj4WCf5T7SIKTyJtALPao60AsJq3xaINxbBy+hMhDaGX1K316XaBIJD7wswX4vhWPXLeDpb1soM75CPZAHPNdLadpoE4mPegcyI2gxbsNcsB4AqDLfkyfH/3/PZmqRrfNoJg5c2WRfTzE4djaeESDGNsAtk=
Content-ID: <504637BFE21BE846BDF11E844CA2F982@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d5d929-8ae7-4c73-242d-08d72bae5c08
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 11:53:36.2426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3aPKAWo/aEFw/8wRqQm7IU68Bm4RHR/aeiaH/Wu/diXm8mmlsobF8f1+4HLUft2kdK4wv8kiYC2DktXioSCCy8/Zlxo/tCYvtXOZoJ+H3Qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2009
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
X-Headers-End: 1i2wWF-006HEZ-94
Subject: Re: [f2fs-dev] [PATCH v2 4/4] fsck.f2fs: Check write pointer
 consistency with valid blocks count
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

On Aug 27, 2019 / 10:25, Chao Yu wrote:
> On 2019/8/21 12:48, Shin'ichiro Kawasaki wrote:
> > When sudden f2fs shutdown happens on zoned block devices, write
> > pointers can be inconsistent with valid blocks counts in meta data.
> > The failure scenario is as follows:
> > 
> > - Just before a sudden shutdown, a new segment in a new zone is selected
> >   for a current segment. Write commands were executed to the segment.
> >   and the zone has a write pointer not at zone start.
> > - Before the write commands complete, shutdown happens. Meta data is
> >   not updated and still keeps zero valid blocks count for the zone.
> > - After next mount of the file system, the zone is selected for the next
> >   write target because it has zero valid blocks count. However, it has
> >   the write pointer not at zone start. Then "Unaligned write command"
> >   error happens.
> > 
> > To avoid this potential error path, reset write pointers if the zone
> > does not have a current segment, the write pointer is not at the zone
> > start and the zone has no valid blocks.
> > 
> > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > ---
> >  fsck/fsck.c | 30 +++++++++++++++++++++++++++++-
> >  1 file changed, 29 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fsck/fsck.c b/fsck/fsck.c
> > index 21a06ac..cc9bbc0 100644
> > --- a/fsck/fsck.c
> > +++ b/fsck/fsck.c
> > @@ -2595,6 +2595,7 @@ static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
> >  	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> >  	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
> >  	void *zero_blk;
> > +	block_t	zone_valid_blocks = 0;
> >  
> >  	if (blk_zone_conv(blkz))
> >  		return 0;
> > @@ -2615,8 +2616,35 @@ static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
> >  			break;
> >  	}
> >  
> > -	if (cs_index >= NR_CURSEG_TYPE)
> > +	if (cs_index >= NR_CURSEG_TYPE) {
> > +		for (b = zone_block; b < zone_block + c.zone_blocks &&
> > +			     IS_VALID_BLK_ADDR(sbi, b); b += c.blks_per_seg) {
> > +			se = get_seg_entry(sbi, GET_SEGNO(sbi, b));
> > +			zone_valid_blocks += se->valid_blocks;
> > +		}
> > +		if (wp_block == zone_block || zone_valid_blocks)
> > +			return 0;
> > +
> > +		/*
> > +		 * The write pointer is not at zone start but there is no valid
> > +		 * block in the zone. Segments in the zone can be selected for
> > +		 * next write. Need to reset the write pointer to avoid
> > +		 * unaligned write command error.
> 
> In SPOR (sudden power-off recovery) of kernel side, we may revalidate blocks
> belong to fsynced file in such zone within range of [0, write pointer], if we
> just reset zone, will we lose those data for ever?

Yes. This patch resets zone and the data will be lost. I walked through
fs/f2fs/recovery.c and learned that nodes with fsync mark are recovered at
remount. Such fsync recovery cannot be done after zone reset. To avoid the
data loss, I would like to drop this fourth patch at this moment.

Later on, I will consider safer approach not to reset the zone, but to set next
write target block at the write pointer. I guess this approach will need kernel
side patch to change block selection logic.

> 
> BTW, how you think enabling f2fs kernel module to recover incorrect write
> pointer of zone? Once f2fs-tools doesn't upgrade, however kernel does...

Current f2fs allows to mount zoned block devices even when they have
inconsistency with f2fs meta data. This is not good. Then I believe kernel side
needs the feature to check write pointer inconsistency at mount time and fix it.

As you indicate, fix by kernel is more handy than notice to run fsck, especially
when users do not have latest f2fs-tools. Still fix by fsck is needed when users
use the kernel without the fix feature. I think both approaches are required:
fix by kernel and fix by fsck.

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
