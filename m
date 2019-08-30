Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28937A30DD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2019 09:21:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3bEH-0007Cu-G7; Fri, 30 Aug 2019 07:21:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=138d41eff=shinichiro.kawasaki@wdc.com>)
 id 1i3bEF-0007Cm-Ew
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Aug 2019 07:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c787gyOJhv6RR0JTCbXVjIjk0pqKQU735/iXuXC58yk=; b=IfFy/pAqq9nsktubABDNf9ZmaO
 aXGEFwVoMeODno82LWAjf1O9aWZWCOQJTiVXaESk0OwNjSWLYNKrlRRm6cnm4AswcFNqXBV5akOv/
 CLghgx6FjTGDX3ptMP3tGheIaQFsk9on0yMS9py+u+r82uZdoOFrQ/5toKfTpI1Oq4mw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c787gyOJhv6RR0JTCbXVjIjk0pqKQU735/iXuXC58yk=; b=dNuMRicrtowc72me6+0FNsiPT7
 OAS/3rsKyP1Zsel2FVgMmGUfRJ1VegvVP+eHC/qc+JsajAsxtg00zv0Plp7vL074MPhWwVFOFGqov
 no3mrukYtNTM2QEgPb0G1Z3iUN/LWBPzRfXwab92k60ewpdsUeHmlLVareXT2UmR138w=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3bED-0036V0-Vc
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Aug 2019 07:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1567149710; x=1598685710;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eWsGWA0Klp6zBWMXXdKuC3mRirOUVh0YBE9VJHNemSA=;
 b=Ovz0zHdUKsbFnOj58odp4aBHCWgc8HyZOCzoK30iN8CitT6J4t+LxLcS
 oKfeDBtGOEKBdbe4Zs45d8q9+BVnCdNLjwP8HaWbEPkLKegkBP5sjSDtd
 wOQ/aaoYabFBPQ/U+d2nJ2KBmtKuN5K5a7djam0e5B6OclvQ0sB5H0d8C
 ivFP6SrmjCRKaIHe652ovVBnCB7i4B3Im3eHBUJ9VrhWzuwufmiY6/USa
 iXHqPmh1gRWA6KiXRPG43nj3jsK3EW5JXw+BVeX78gEzoKzbmkiImOD+n
 t96gbDOspeRyGTFYzPhU820p/+u01PI6zZ9GLwAZ7u+9oDeDvY/94y4iT g==;
IronPort-SDR: 1E8ac5uckXtTmjGlPvIe+Ah2kGgdIsa1W1U1IRoLRBQMrEwQCpmQ9zy3e/mnlgGZ3CdLXXbXLh
 Dkjpp/AozOk4RrAQWmiOLqTyOfmw1IV0NpzneDs6/7tYb7iKYERvrYx5TMMFZMDjwZIeQGcA5T
 3VTVLdmbsnZPDyJgh1OsvJa4CTPB9JyKTJe8baLBOMI+hK4gxs0V/Jx2WYJPvIm7K2X5gDSXg4
 uoo5BULDt3CgawX/bMtdZrJWonJYNQsEasd5InDKw3taSVzqsNj3xxYTBIS3qzP6bleq2ne1fe
 RsY=
X-IronPort-AV: E=Sophos;i="5.64,446,1559491200"; d="scan'208";a="117925914"
Received: from mail-co1nam04lp2052.outbound.protection.outlook.com (HELO
 NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.52])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2019 15:21:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dx4ANtbM8Hd0hv1oiz1UYTQZjr5G/zqg1eXZiXc1IoorJiKOmQWq51zw6CceQo9GrzaxF90YOeXBw1m6EmGyfnfJAZwDN7R/nexUF5k4R3Pzk4QQ+jpOSRie9bjU3eUIwR0/b0LsrJiuxSkgW9NdxuUh8Zbxu/DU1EAoO73pcwhRwnczzsitTWWEHKCY5kdhAuHvx0EI9y6ZOIBARSvVDnYDA9zKktnEfEYL47LRBiOoFRqLVtBKQziojnISnNUmryZahVGnq3B23w6rtjpevBXBAuOfTnjR9A4G6w7PAdffYynT0trJua4u9VGZ2y596XDm4pGIYG3zDLthvxZbwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c787gyOJhv6RR0JTCbXVjIjk0pqKQU735/iXuXC58yk=;
 b=DSN1SSvu0ldILUnq0LLdiSjx9xWO702zzAxm6nBpuhJLIGJMHv8BrbSa57OXLgOrXqhulA1vvp1cGoGZcUfqhxy+X39PoXg2z8pK9GMucax+tZ46xlZ6tae6rlG1ODd1yunWJlCsWDZcZ9G17WL3YUyeBv+syAFQrSjRFp5B9paruk2P7zX003fAQEbW078+AQkPl25eK0c0plbiLPop1LFVp81wt8ekE3APr0/LGWScQnx/YsZiD8Ai/98/Bb8BLS4xOG2PyjAtgZWB/75BFLR3iOCZ+4yFi11UEk7mx33/10ZClMLFJRKIT+P/Y86bQDIPFMjECcePAuEKiZhvlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c787gyOJhv6RR0JTCbXVjIjk0pqKQU735/iXuXC58yk=;
 b=cYyiLrYhtQvr0OZm0z2l9Mjl2w/JlZsDLZ0QQGbH4yv9kiUJF4l3NA2rDgclu+FCHdcdzPZhDM7oFV0Pqp7lICnJZyj24HhFb7J+ywle60kGOsAqfTOq8MZHUUx68AY7ehW9jpgrqFiZWAJfrXs/YDBhIIrQI03FtlUVE0chnH0=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2314.namprd04.prod.outlook.com (10.167.18.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 07:21:42 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::31aa:d179:ec71:4a66]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::31aa:d179:ec71:4a66%9]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 07:21:42 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <chao@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH v2 4/4] fsck.f2fs: Check write pointer
 consistency with valid blocks count
Thread-Index: AQHVV9umnBeVs6tYsUeSGGGb0EbaracOTZaAgAIxIYCAAcFpgIABF0oA
Date: Fri, 30 Aug 2019 07:21:42 +0000
Message-ID: <20190830072140.hr7vh43navmbuzwb@shindev.dhcp.fujisawa.hgst.com>
References: <20190821044802.29702-1-shinichiro.kawasaki@wdc.com>
 <20190821044802.29702-5-shinichiro.kawasaki@wdc.com>
 <fd7b8699-3335-1f7e-96de-0818dd014278@huawei.com>
 <20190828115333.ciivgtdmdprjxgaa@shindev.dhcp.fujisawa.hgst.com>
 <b7be8727-ff87-7dd8-eb1f-89c0f9247213@kernel.org>
In-Reply-To: <b7be8727-ff87-7dd8-eb1f-89c0f9247213@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e4f0741-f915-434f-b15b-08d72d1ab4f5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY1PR04MB2314; 
x-ms-traffictypediagnostic: CY1PR04MB2314:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB23140AD682D4A1DDCAEAC458EDBD0@CY1PR04MB2314.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(189003)(199004)(6436002)(81166006)(8676002)(6486002)(81156014)(4001150100001)(76176011)(2906002)(11346002)(64756008)(66066001)(99286004)(66446008)(66946007)(66556008)(66476007)(446003)(9686003)(76116006)(14444005)(8936002)(91956017)(53546011)(6506007)(6306002)(6512007)(6116002)(54906003)(1076003)(3846002)(53936002)(102836004)(6246003)(5660300002)(25786009)(305945005)(186003)(7736002)(256004)(58126008)(316002)(44832011)(86362001)(6916009)(229853002)(478600001)(26005)(966005)(71190400001)(4326008)(476003)(486006)(14454004)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2314;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: z1vNTog4OlpOm+xebAbEmBXQs3FGMeQEwpuARArcq6dGn0+qPR+UvBe9bk0TSuLwx7LQ/XqWLLT+2hAY8rhqsq8B/DO+7BuN8UpP7+eoxlwxYYn7mB0FVEOe+Q/yjp4a9peD8iFpfN8/E9LtFZopCYP8WD9A4IohNvDDCFIRR1NhJDY9k1g6PkV/F1WYDd5/CDy3SGC+ufn6Ot9ZcfroAgVJeDXE0JXDSvJOyq1BAQgYZVxqYH2WoGNvJFmoKZO9JsbLGOBvPUsd9zCY+Wr/wXLMljqnYDfvs2EgjQUgZJDlUFe5zG7G++7d9JoLjTRabb9kTp/2npfmu52ROrg0uanGvDtgUAWDyDtAe9sLcmymiFeYX6JRkbB2Wq0iRa8TMaUlaFF0yf+q6CwsCcHI85AMOB0V1jIcFWg4FzsyRlk=
Content-ID: <B011FF97F7F69F4C9EF29837E0953F9C@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4f0741-f915-434f-b15b-08d72d1ab4f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 07:21:42.3415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TF0hZFrSUTXkhI/NNZN7LFif2cd1VWIfUTmbWxs7AMqbMcE9xN4DC7lWhvdRWsqpmyyZtR0XJCyh8mGL2g7q5p4CNv2bFTkxZJVMJ7haDTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2314
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i3bED-0036V0-Vc
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

On Aug 29, 2019 / 22:42, Chao Yu wrote:
> On 2019-8-28 19:53, Shinichiro Kawasaki wrote:
> > On Aug 27, 2019 / 10:25, Chao Yu wrote:
> >> On 2019/8/21 12:48, Shin'ichiro Kawasaki wrote:
> >>> When sudden f2fs shutdown happens on zoned block devices, write
> >>> pointers can be inconsistent with valid blocks counts in meta data.
> >>> The failure scenario is as follows:
> >>>
> >>> - Just before a sudden shutdown, a new segment in a new zone is selected
> >>>   for a current segment. Write commands were executed to the segment.
> >>>   and the zone has a write pointer not at zone start.
> >>> - Before the write commands complete, shutdown happens. Meta data is
> >>>   not updated and still keeps zero valid blocks count for the zone.
> >>> - After next mount of the file system, the zone is selected for the next
> >>>   write target because it has zero valid blocks count. However, it has
> >>>   the write pointer not at zone start. Then "Unaligned write command"
> >>>   error happens.
> >>>
> >>> To avoid this potential error path, reset write pointers if the zone
> >>> does not have a current segment, the write pointer is not at the zone
> >>> start and the zone has no valid blocks.
> >>>
> >>> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> >>> ---
> >>>  fsck/fsck.c | 30 +++++++++++++++++++++++++++++-
> >>>  1 file changed, 29 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/fsck/fsck.c b/fsck/fsck.c
> >>> index 21a06ac..cc9bbc0 100644
> >>> --- a/fsck/fsck.c
> >>> +++ b/fsck/fsck.c
> >>> @@ -2595,6 +2595,7 @@ static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
> >>>  	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> >>>  	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
> >>>  	void *zero_blk;
> >>> +	block_t	zone_valid_blocks = 0;
> >>>  
> >>>  	if (blk_zone_conv(blkz))
> >>>  		return 0;
> >>> @@ -2615,8 +2616,35 @@ static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
> >>>  			break;
> >>>  	}
> >>>  
> >>> -	if (cs_index >= NR_CURSEG_TYPE)
> >>> +	if (cs_index >= NR_CURSEG_TYPE) {
> >>> +		for (b = zone_block; b < zone_block + c.zone_blocks &&
> >>> +			     IS_VALID_BLK_ADDR(sbi, b); b += c.blks_per_seg) {
> >>> +			se = get_seg_entry(sbi, GET_SEGNO(sbi, b));
> >>> +			zone_valid_blocks += se->valid_blocks;
> >>> +		}
> >>> +		if (wp_block == zone_block || zone_valid_blocks)
> >>> +			return 0;
> >>> +
> >>> +		/*
> >>> +		 * The write pointer is not at zone start but there is no valid
> >>> +		 * block in the zone. Segments in the zone can be selected for
> >>> +		 * next write. Need to reset the write pointer to avoid
> >>> +		 * unaligned write command error.
> >>
> >> In SPOR (sudden power-off recovery) of kernel side, we may revalidate blocks
> >> belong to fsynced file in such zone within range of [0, write pointer], if we
> >> just reset zone, will we lose those data for ever?
> > 
> > Yes. This patch resets zone and the data will be lost. I walked through
> > fs/f2fs/recovery.c and learned that nodes with fsync mark are recovered at
> > remount. Such fsync recovery cannot be done after zone reset. To avoid the
> > data loss, I would like to drop this fourth patch at this moment.
> > 
> > Later on, I will consider safer approach not to reset the zone, but to set next
> > write target block at the write pointer. I guess this approach will need kernel
> > side patch to change block selection logic.
> 
> I guess below commit can help to recognize fsynced data in unclean umounted
> image, maybe we can skip invalidating those data during zone write pointer recovery.
> 
> f2fs-tools: fix to skip block allocation for fsynced data
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?h=dev-test&id=a50cfc89e56ce8c022e295bf4de619af070fabe9

Thank you for the idea! The find_fsync_inode() function in the commit looks
useful. Will try to create a separated patch on top of the commit.

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
