Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEEFFA069
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Nov 2019 02:44:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUhiA-0005dY-JI; Wed, 13 Nov 2019 01:44:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=213aef9dd=shinichiro.kawasaki@wdc.com>)
 id 1iUhi9-0005dR-KE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 01:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OKoQiFXCLggXg4R7qI/AyJinO7e925Z90rWznVOtXlQ=; b=O0tioMsoWNK+qR3dFZ87HtK+ur
 C99lpCxgDGg8w+bXRXoowaBw9g+4oCbQ5XBfcPOaFfndPsrBJzUX0JRH7H3awyonvvSAa+O8Q+ihn
 GKSmKjlPfKTSPZ+WhUpF2aRNcxa9kIrZqDgXlQixnNAB/WRiy6eWn2iDroTci8kVgZSo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OKoQiFXCLggXg4R7qI/AyJinO7e925Z90rWznVOtXlQ=; b=RJhtQjJru/HebFwvkCDD8Kl7b8
 KbO+9AZB0/Ir/dfMAF2g9z2lr9ryBknBBMdtfMOaExbm9WJBMojZppez5YTazxusDornPbJwGr6LL
 XdUbV54S8VIm5iyXIEHOmIoU9eR14m+K8NUw4aRD9ocis5vByj7vIYcvGpvrdQly1lUs=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUhi4-000JNW-Jf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 01:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573609499; x=1605145499;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BaU6CsvgLu2xmDTQp56dvDVBfmSo4+sTpzBC0lzAK4A=;
 b=D8w/umAkzPae5STcLFQtPb2wvhaRsS7JaIJzJYBC2YBI0Mk4JhUW+j5r
 EBg1+0+2n0iwifiOrwaRGwuH9tODYk2B24QlbPFcuFhP3s7sbqWQSLdSl
 vrMILrfKTJ7qo6T08UsM4QbAzUq25ToohV5gEGOIEEj4URayhhlOQXE97
 Z10cF7tFX/KiX97FKXwhP2yU48QzOD9UA//Od6A9azCZCd2HSdbj1rvWu
 znMTBV6/BYE06BFMRxchPc70Tco3ifZ3RIwgvUzHICGer9T44evRe8T71
 80n4lurjj23L/YqWTKC1hHWkWUv3myCaN2An3X8RJU5EV5jG8ijTRID7g A==;
IronPort-SDR: OUmJ8a4KGUjvDotnkKDfoqcuAr9PH9EttJVViOqBtd20m/eXmfBQDFmPdHB2eUPaEKa5+ADCSo
 WiYOOTINqmWdIY4ehZg4hfiiSUj9/EvvMZXHJGaDH7VpZwH8L9p/2AgAcayOe2FZAP8DjOllEK
 VBcnuuQ/8Zn09UQzM12RqmctHZbwiflyaohGbUATWwjnPzbg0yQu6flt0TsCKaiy48hCkUl9s/
 cVazerxYlmkAeBwXK08u76r6rURIHSzw5pFg/7UB64CK+imcRlSQ4n5pH4YpFXtISK1Qes4/Er
 U4s=
X-IronPort-AV: E=Sophos;i="5.68,298,1569254400"; d="scan'208";a="224112266"
Received: from mail-co1nam05lp2059.outbound.protection.outlook.com (HELO
 NAM05-CO1-obe.outbound.protection.outlook.com) ([104.47.48.59])
 by ob1.hgst.iphmx.com with ESMTP; 13 Nov 2019 09:44:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kx5C01wuw+3cV220cnBL7x9bSssoxupFOmnXRtFaPQDlOwrAF86MpRLvkmo/9Q+9NWd/ZcHcAC61KfZwMh/cCz69qbjPNMIXYxSEYQ0q/1lQnhEWgI5os3okPWG0AQzQOGmz3PR4pE2BEKL6nlR6+angtmK7Iautyg6/UhDjIH9iPvc7MEFcCpKGSyKK0YEJ+Osn39MORiQdpQDRqZu/1Y46xsCWcdZO2Yr01g6jAcPmT/yAjuJcWxlV6JcH0qdgqXEiI6og6Nh55rEJzqxKIYwAyZonh5/gD33xHtdX2eynJnTd8bnsXT0NWFYJfre0D7mDDzlzGbz0ODBoi7QnAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKoQiFXCLggXg4R7qI/AyJinO7e925Z90rWznVOtXlQ=;
 b=Aclf7PyGjcr2V8NWoJO4M+mkNUgsD009XYuCEhtQUFwojHRF/At5h6Enu2oR7e25Ep+1CHKNTNRwBUQ7XYxpict4FH1SEwjSpXIxhyJNyQW7GvUmMdQVbS/Gu9IJbr5O64HzgGHED567Kipnrmg8pnjQ10Tnk9xMxCig7z1eTpW2GPAuZeauC6VLZu5qZs82pOu595SJItMo51xJN2/madqIR3GvCK6jIQmwcjl0SN5kfi/cJaVZCsDzRMaCMKeoFVYKUwfXS5D2wxP6F6DdBMKp/8tUFvUQ/enePaMst/DXa54WLAXygTPyjaAO3XtnbMLW6HdDxDAnB+rDSAy0NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKoQiFXCLggXg4R7qI/AyJinO7e925Z90rWznVOtXlQ=;
 b=g2z76+fMd0HLVNSFEBxP19dlRnNWgbX6+y2vZDMxUymTvPzQsVVqMgqgbkuXh6evRjkJBiRhtc8gZOfBHRxziHB9YETdzO8s4vQrkOjW3zYg4ZfC1mu9skgKCJn1NjDhkOo2u85IwxfturNYdq4zTSsZ2dQWjaP7fadGxjOp+SI=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2140.namprd04.prod.outlook.com (10.166.206.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Wed, 13 Nov 2019 01:44:33 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74%11]) with mapi id 15.20.2430.028; Wed, 13 Nov
 2019 01:44:33 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v6 7/8] fsck: Check write pointer consistency of open
 zones
Thread-Index: AQHVjVyyD74G+0FqZU6S+Mt9MOHqnad8d04AgAF7ugCAB25oAIADC6AA
Date: Wed, 13 Nov 2019 01:44:33 +0000
Message-ID: <20191113014432.bdmnvthhrb6cnfi7@shindev.dhcp.fujisawa.hgst.com>
References: <20191028065512.27876-1-shinichiro.kawasaki@wdc.com>
 <20191028065512.27876-8-shinichiro.kawasaki@wdc.com>
 <a7c0f0e1-390f-636d-ac96-7644ecf29779@huawei.com>
 <20191106094510.6n3mntg5o3rz5frr@shindev.dhcp.fujisawa.hgst.com>
 <74c119b6-a524-10ad-7093-87adcce3fb2d@huawei.com>
In-Reply-To: <74c119b6-a524-10ad-7093-87adcce3fb2d@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8a6fe5e5-868a-4b38-14a4-08d767db088a
x-ms-traffictypediagnostic: CY1PR04MB2140:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2140479B374E245DDCECC395ED760@CY1PR04MB2140.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-forefront-prvs: 0220D4B98D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(199004)(189003)(14444005)(71200400001)(71190400001)(256004)(9686003)(8676002)(6486002)(25786009)(1076003)(4326008)(8936002)(446003)(6512007)(81166006)(486006)(6436002)(44832011)(3846002)(2906002)(6116002)(81156014)(11346002)(316002)(54906003)(99286004)(14454004)(5660300002)(229853002)(66066001)(476003)(6506007)(76176011)(66946007)(53546011)(102836004)(7736002)(6916009)(86362001)(186003)(305945005)(478600001)(6246003)(76116006)(66446008)(64756008)(66476007)(66556008)(91956017)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2140;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oFPicL7V4vCO+P0t0Sg1danzlU19LXWpVoleXz7iCehLKm5l4729ptCUYIM1X6xlYdvaaAcGCEhRYz1G5LZMM3HmGZxuGz0qzHpntL6Ojwbvv6C2EWGjFi0yz0Ruze//Dt/upjlpbVq5rJGzgfmIRq+/3Rn8Id6sgsDicxh2vIJbNb6vKwrDtShsP7kwTLGfmo+SDh6Y56gJTv9fwfshUYyY4P/YjmkXQ+z1Iahii8paIM4XmXFzDTn+TzlCeft8VP2yM4G07A1kIRHZZeHf2GA8quQqBLkZiOdPAoi42NRmGEwssDnCokNwXULGgkppG+/e0PH30eQLl5ni+9HARwyUznE5nAIU+Amy/FvEujrq+t1kDqdlxf8l6tFXYehE+1a1EpSNVLf+ALAjj+YmaA613WxH67Px6kGJp4pfVT9a46AsBHjOm6M/3c4MnS5w
Content-ID: <0A2143AA26F1984E854B04FD32D7CB48@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6fe5e5-868a-4b38-14a4-08d767db088a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2019 01:44:33.2751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lBQvEHun4RqRPZFsRSphlIoxg5xkLavQwpec7OxHAnjHmTU0nxktcbv8Nm9HNlqOFkUADqKpSxbzXoN0jSlcEvqx17GgQJ+6coDVhQlA7kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2140
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
X-Headers-End: 1iUhi4-000JNW-Jf
Subject: Re: [f2fs-dev] [PATCH v6 7/8] fsck: Check write pointer consistency
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

On Nov 11, 2019 / 11:14, Chao Yu wrote:
> On 2019/11/6 17:45, Shinichiro Kawasaki wrote:
> > On Nov 05, 2019 / 19:06, Chao Yu wrote:
> >> On 2019/10/28 14:55, Shin'ichiro Kawasaki wrote:
> >>> On sudden f2fs shutdown, write pointers of zoned block devices can go
> >>> further but f2fs meta data keeps current segments at positions before the
> >>> write operations. After remounting the f2fs, this inconsistency causes
> >>> write operations not at write pointers and "Unaligned write command"
> >>> error is reported.
> >>>
> >>> To avoid the error, have f2fs.fsck check consistency of write pointers
> >>> of open zones that current segments point to. Compare each current
> >>> segment's position and the write pointer position of the open zone. If
> >>> inconsistency is found and 'fix_on' flag is set, assign a new zone to the
> >>> current segment and check the newly assigned zone has write pointer at
> >>> the zone start. Leave the original zone as is to keep data recorded in
> >>> it.
> >>>
> >>> To care about fsync data, refer each seg_entry's ckpt_valid_map to get
> >>> the last valid block in the zone. If the last valid block is beyond the
> >>> current segments position, fsync data exits in the zone. In case fsync
> >>> data exists, do not assign a new zone to the current segment not to lose
> >>> the fsync data. It is expected that the kernel replay the fsync data and
> >>> fix the write pointer inconsistency at mount time.
> >>>
> >>> Also check consistency between write pointer of the zone the current
> >>> segment points to with valid block maps of the zone. If the last valid
> >>> block is beyond the write pointer position, report to indicate f2fs bug.
> >>> If 'fix_on' flag is set, assign a new zone to the current segment.
> >>>
> >>> When inconsistencies are found, turn on 'bug_on' flag in fsck_verify() to
> >>> ask users to fix them or not. When inconsistencies get fixed, turn on
> >>> 'force' flag in fsck_verify() to enforce fixes in following checks.
> >>>
> >>> This check and fix is done twice. The first is done at the beginning of
> >>> do_fsck() function so that other fixes can reflect the current segment
> >>> modification. The second is done in fsck_verify() to reflect updated meta
> >>> data by other fixes.
> >>>
> >>> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> >>> ---
> >>>  fsck/f2fs.h  |   5 ++
> >>>  fsck/fsck.c  | 154 +++++++++++++++++++++++++++++++++++++++++++++++++++
> >>>  fsck/fsck.h  |   3 +
> >>>  fsck/main.c  |   2 +
> >>>  fsck/mount.c |  49 +++++++++++++++-
> >>>  5 files changed, 212 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/fsck/f2fs.h b/fsck/f2fs.h
> >>> index 399c74d..07513cb 100644
> >>> --- a/fsck/f2fs.h
> >>> +++ b/fsck/f2fs.h
> >>> @@ -429,6 +429,11 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
> >>>  #define GET_BLKOFF_FROM_SEG0(sbi, blk_addr)				\
> >>>  	(GET_SEGOFF_FROM_SEG0(sbi, blk_addr) & (sbi->blocks_per_seg - 1))
> >>>  
> >>> +#define GET_SEC_FROM_SEG(sbi, segno)					\
> >>> +	((segno) / (sbi)->segs_per_sec)
> >>> +#define GET_SEG_FROM_SEC(sbi, secno)					\
> >>> +	((secno) * (sbi)->segs_per_sec)
> >>> +
> >>>  #define FREE_I_START_SEGNO(sbi)						\
> >>>  	GET_SEGNO_FROM_SEG0(sbi, SM_I(sbi)->main_blkaddr)
> >>>  #define GET_R2L_SEGNO(sbi, segno)	(segno + FREE_I_START_SEGNO(sbi))
> >>> diff --git a/fsck/fsck.c b/fsck/fsck.c
> >>> index 2ae3bd5..e0eda4e 100644
> >>> --- a/fsck/fsck.c
> >>> +++ b/fsck/fsck.c
> >>> @@ -2181,6 +2181,125 @@ static void fix_checkpoints(struct f2fs_sb_info *sbi)
> >>>  	fix_checkpoint(sbi);
> >>>  }
> >>>  
> >>> +#ifdef HAVE_LINUX_BLKZONED_H
> >>> +
> >>> +/*
> >>> + * Refer valid block map and return offset of the last valid block in the zone.
> >>> + * Obtain valid block map from SIT and fsync data.
> >>> + * If there is no valid block in the zone, return -1.
> >>> + */
> >>> +static int last_vblk_off_in_zone(struct f2fs_sb_info *sbi,
> >>> +				 unsigned int zone_segno)
> >>> +{
> >>> +	unsigned int s;
> >>> +	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
> >>> +	struct seg_entry *se;
> >>> +	block_t b;
> >>> +	int ret = -1;
> >>> +
> >>> +	for (s = 0; s < segs_per_zone; s++) {
> >>> +		se = get_seg_entry(sbi, zone_segno + s);
> >>> +
> >>> +		/*
> >>> +		 * Refer not cur_valid_map but ckpt_valid_map which reflects
> >>> +		 * fsync data.
> >>> +		 */
> >>> +		ASSERT(se->ckpt_valid_map);
> >>> +		for (b = 0; b < sbi->blocks_per_seg; b++)
> >>> +			if (f2fs_test_bit(b, (const char*)se->ckpt_valid_map))
> >>> +				ret = b + (s << sbi->log_blocks_per_seg);
> >>
> >> Minor thing, I guess we only need to find last valid block in target zone?
> >>
> >> int s, b;
> >>
> >> for (s = segs_per_zone - 1; s >= 0; s--) {
> >> 	for (b = sbi->blocks_per_seg - 1; b >= 0; b--)
> >> 		if (f2fs_test_bit(b, (const char*)se->ckpt_valid_map)) {
> >> 			ret = b + (s << sbi->log_blocks_per_seg);
> >> 			break;
> >> 		}
> >> }
> > 
> > Yes, reveresed search is the better. Will modify the code as suggested.
> > 
> >>
> >>> +	}
> >>> +
> >>> +	return ret;
> >>> +}
> >>> +
> >>> +static int check_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
> >>> +{
> >>> +	struct curseg_info *curseg = CURSEG_I(sbi, type);
> >>> +	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
> >>> +	struct blk_zone blkz;
> >>> +	block_t cs_block, wp_block, zone_last_vblock;
> >>> +	u_int64_t cs_sector, wp_sector;
> >>> +	int i, ret;
> >>> +	unsigned int zone_segno;
> >>> +	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> >>> +
> >>> +	/* get the device the curseg points to */
> >>> +	cs_block = START_BLOCK(sbi, curseg->segno) + curseg->next_blkoff;
> >>> +	for (i = 0; i < MAX_DEVICES; i++) {
> >>> +		if (!c.devices[i].path)
> >>> +			break;
> >>> +		if (c.devices[i].start_blkaddr <= cs_block &&
> >>> +		    cs_block <= c.devices[i].end_blkaddr)
> >>> +			break;
> >>> +	}
> >>> +
> >>> +	if (i >= MAX_DEVICES)
> >>> +		return -EINVAL;
> >>> +
> >>> +	/* get write pointer position of the zone the curseg points to */
> >>> +	cs_sector = (cs_block - c.devices[i].start_blkaddr)
> >>> +		<< log_sectors_per_block;
> >>> +	ret = f2fs_report_zone(i, cs_sector, &blkz);
> >>> +	if (ret)
> >>> +		return ret;
> >>> +
> >>> +	if (blk_zone_type(&blkz) != BLK_ZONE_TYPE_SEQWRITE_REQ)
> >>> +		return 0;
> >>> +
> >>> +	/* check consistency between the curseg and the write pointer */
> >>> +	wp_block = c.devices[i].start_blkaddr +
> >>> +		(blk_zone_wp_sector(&blkz) >> log_sectors_per_block);
> >>> +	wp_sector = blk_zone_wp_sector(&blkz);
> >>> +
> >>> +	if (cs_sector == wp_sector)
> >>> +		return 0;
> >>> +
> >>> +	if (cs_sector > wp_sector) {
> >>> +		MSG(0, "Inconsistent write pointer with curseg %d: "
> >>> +		    "curseg %d[0x%x,0x%x] > wp[0x%x,0x%x]\n",
> >>> +		    type, type, curseg->segno, curseg->next_blkoff,
> >>> +		    GET_SEGNO(sbi, wp_block), OFFSET_IN_SEG(sbi, wp_block));
> >>> +		fsck->chk.wp_inconsistent_zones++;
> >>> +		return -EINVAL;
> >>> +	}
> >>> +
> >>> +	MSG(0, "Write pointer goes advance from curseg %d: "
> >>> +	    "curseg %d[0x%x,0x%x] wp[0x%x,0x%x]\n",
> >>> +	    type, type, curseg->segno, curseg->next_blkoff,
> >>> +	    GET_SEGNO(sbi, wp_block), OFFSET_IN_SEG(sbi, wp_block));
> >>> +
> >>> +	zone_segno = GET_SEG_FROM_SEC(sbi,
> >>> +				      GET_SEC_FROM_SEG(sbi, curseg->segno));
> >>> +	zone_last_vblock = START_BLOCK(sbi, zone_segno) +
> >>> +		last_vblk_off_in_zone(sbi, zone_segno);
> >>> +
> >>> +	/*
> >>> +	 * If fsync data exists between the curseg and the last valid block,
> >>> +	 * it is not an error to fix. Leave it for kernel to recover later.
> >>> +	 */
> >>> +	if (cs_block <= zone_last_vblock) {
> >>
> >> According to above comments, should condition be?
> >>
> >> if (cs_block < zone_last_vblock && zone_last_vblock <= wp_block)
> >>
> > 
> > To be precise, cs_block points to curseg->next_blkoff, which is the block
> > curseg will write in the next write request. Then, if cs_block equals to
> > zone_last_vblock, it means that the block curseg->next_blkoff points to
> > already have valid block and fsync data. Then, comparator between cs_block
> > and zone_last_vblock should be "<=".
> 
> You're right.
> 
> > 
> > I agree that it is the better to check zone_last_vblock with wp_block.
> > wp_block corresponds to the write pointer position that next write will be
> > made. It wp_block equals to zone_last_vblock, it means that unexpected data
> > is written beyond the write pointer. Then, comparator should be "<" between
> > zone_last_vblock and wp_block.
> 
> Oh, so wp has almost the same meaning to .next_blkoff in f2fs, it points to next
> free block/sector. I will keep that in mind.

Right, wp and .next_blkoff are really similar, or same :)

> 
> > 
> > In short, I suggest the condition check below as the good one.
> > 
> > if (cs_block <= zone_last_vblock && zone_last_vblock < wp_block)
> 
> It's fine to me. :)

Ok, will reflect in the next patch post.

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
