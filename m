Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7404A116B7D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2019 11:53:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieGez-0004uJ-7P; Mon, 09 Dec 2019 10:53:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2395697a2=shinichiro.kawasaki@wdc.com>)
 id 1ieGex-0004tu-O5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 10:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HIr9WRM8sPz6Fkn2Y44rSC3Oc/GDZrB6ARGIefmQKr4=; b=gzGUEqRcJYxEBkBSasKuXE28LK
 bCgRxrXjk0neYKLL6VyHw6AvFTW9PGF5b51nduVXxEoPpA3zqwqXa91W/ixTgPiTBjOZOyRfiqgVO
 VJLNo2r55fPQOs6tlLH/dSCh1sOqFE9whM9lEJjpC0GAfa5LvcMYLOdguMdw4rZQuNR4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HIr9WRM8sPz6Fkn2Y44rSC3Oc/GDZrB6ARGIefmQKr4=; b=LHdNwJJMujSnKYEJ8hvx/nSd1e
 uifjdrINuxe9wIC2wpPaoOWLgLtGC4oZm7XRvjRhmIFJ2ReSO95PLNvRrSEi8y6OnB9xQVc7GkJq5
 nE1Nt1+zlrqY22ly+WaUUReX5riR3+XxVBkVEeSdVlvy6ZR7ZXHzWWUfI1p+izgtmUCw=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieGev-00FN8C-3w
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 10:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1575888777; x=1607424777;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=VQksM/oqJMhLaObfFDXZC+b05XoswZB0Ff3pHp6Zh9I=;
 b=KIAZnPzdxuD4xoUPoYoc7RAjLjAfXrAWBo3XUD+dCDbLLRVqnMFficji
 IuSCgZgteIPReUNfURyY0fU23JK3Fp4sQOuZrLfo3V7l4A6xqkIBZ25AX
 UqfV5R+RNJJWDTz10hliQW4NsttGegTPiTPv0HsA5/DrQJzvv1513qWBC
 W6aSTrwsL78H+cNKvjEgGcCRgWtQuDLJsXtpAsiP8x4O61+Wz3sMkhHff
 iWlx35XKyeJ/OV/Sj2CIJ2iOEyIFpka1Xi4jyvdJzhhf0+t+tH+maCU4t
 f6JN7h/QaXh5Ii2GlCgE/VUVSv8YGWVhhYPoN730Fsyu02td8K8jv3Mf6 A==;
IronPort-SDR: 1+nNL2gR+CyM1ZIIR5gCF1Rux/qF4NnuaSTJfuZc9MHY/vnUBR7uRXnQzEVhuJbceWrF3apRvH
 CmKrIucRFXMtnUa5Uf2oZZtWiJJLuVNsTypVXBrdDMKVmCmkk4pdxhhs71xFio4vP1SZeP7mzG
 STy5sFkAFVKZTyftjVbEAPeDiIae4GZ2EQ//w3UH+LSdVFJKO2TmTEFM6N7fhIBIwJudpF6C26
 Nhuuu3aPvs9XWKRDOP0RJxccdYQ3VQJyrjQ8T9CiTVGR/rANpoYEZM6hYLh4bpIAiQWXhV10b1
 mAQ=
X-IronPort-AV: E=Sophos;i="5.69,294,1571673600"; d="scan'208";a="126519597"
Received: from mail-sn1nam02lp2058.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.58])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2019 18:52:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/TYNhNb0s76JyHTrgx9Tq8LSkbGx9BKiTktlbn4JCq0JRnaGnoJiY6SnR2Um9sWy7mcp7fiOizbdIkDQbNCGNzNzPHAPbFkH+MJ76ud9hRXY2o70ojmpVc2cDDu2yibFIwQ20rIztkgvFFJOobECSPdRARsGdj8Q3IezCwfeqRLTON6beYClAP8p5YE3p8JmQ7kThIkmFYDYzphYM7twwGSNLKqxueiF6oLAkJOCxJ277120QGb7COPUKyNxMR7iqWvXlk4FZcED7mN1zR6LA4cY2Ki8g0A1sD3go8pM9y20vU6UQih7Tp7mUTgeLlquznzbtljuGd0B/nxjh+04A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIr9WRM8sPz6Fkn2Y44rSC3Oc/GDZrB6ARGIefmQKr4=;
 b=RGsQsnS/fICmppVDlPJj7FcAZlOKvD2GXHirkK1/xPB0XHFb9FxcDTra9PN1L7wCUedpoNzDD1W5ExldTWc/r1TFvVZfQjFNSoSiWHWeItSQ1tdx5ITTRlB05I//4WIt5+DrMmO0jA39Z2a/Mf4CBvMCM3chdSEUJiSuSdT25VyC2oWxqq3jygFr4y1B+SesVohlTmWu1v1BeIagFLwuHFOD1HRpMH+dAH9MY11R6yEAPFZpnF2kqfFzuR3OcLmEyz38lsu6SUMFPcBOyNaM20BNOa3dwy7uF8NJA1dYpwBQeHiINsIVVEmN1MYt75VGxxZJvoKDI98sp0XDGwLsAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIr9WRM8sPz6Fkn2Y44rSC3Oc/GDZrB6ARGIefmQKr4=;
 b=raiQjwP5tx6w3UkM6050Z/6AatJmBtR0d0aEGoQpbjbVzJOCegOkRBADWkEtIzO9eYBswXREdxes4FsXNowiB8dg2VvtSeqs1r0C29H4GBFYQQMqqzu0MqybNC07gU6neDZ0SPAA8PvlVE0CPcZXuByxfFqc0MIrLAezdsP89rY=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2250.namprd04.prod.outlook.com (10.167.8.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Mon, 9 Dec 2019 10:52:50 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::30f9:4a94:796:3014]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::30f9:4a94:796:3014%12]) with mapi id 15.20.2516.018; Mon, 9 Dec 2019
 10:52:50 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v4 2/2] f2fs: Check write pointer consistency of non-open
 zones
Thread-Index: AQHVqPSZzuU/4TG7/0OSX3nEPHtsQaexGDQAgABaZoCAACO5gIAAFVoA
Date: Mon, 9 Dec 2019 10:52:49 +0000
Message-ID: <20191209105248.y4vsygktfrnuqnhv@shindev.dhcp.fujisawa.hgst.com>
References: <20191202094043.892258-1-shinichiro.kawasaki@wdc.com>
 <20191202094043.892258-3-shinichiro.kawasaki@wdc.com>
 <bb00d068-9ad5-4685-1745-ba485ee5c2ad@huawei.com>
 <20191209072831.2abtj3yiebzdbwzd@shindev.dhcp.fujisawa.hgst.com>
 <869ca2fe-f69f-3dcf-08a4-5f865b8662d9@huawei.com>
In-Reply-To: <869ca2fe-f69f-3dcf-08a4-5f865b8662d9@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cce82d0b-0e80-4f90-fd0b-08d77c95ef23
x-ms-traffictypediagnostic: CY1PR04MB2250:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2250C3479963A513FB2C897DED580@CY1PR04MB2250.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:386;
x-forefront-prvs: 02462830BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(189003)(199004)(44832011)(9686003)(6512007)(305945005)(6486002)(2906002)(4326008)(478600001)(229853002)(86362001)(6916009)(1076003)(26005)(81156014)(6506007)(53546011)(71190400001)(71200400001)(54906003)(64756008)(91956017)(76116006)(66446008)(66556008)(81166006)(5660300002)(66946007)(8676002)(186003)(8936002)(316002)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2250;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2gxJMpg2o0DwoHCg0ZP7Ym5ohck9n2PYEI70/UZ609Lm7GiqRVaLKMiOWXoZAaTD3U4dhpxK6DCyD6KBIpQ7KiVSppW+riV6VzGKm9WDAhOXUuyBA/RzriqWeL5xxvOjkM2waqN+NQqNTT9T56dFG/m/IDx1DGEb1whBYeiYUFEuvbeVe44N1fGcJbjg+EWV0KVCn1aBu9Q3SqEJeQmZlNAbhFXwnapPiNCc//+beBp+i9mXmafoKEcKDmtQYstGKeaYA4Vq3gktSvyHAjJNSMknHcqJbbZQKCadLg5MnCkDOfDLSMIoyeAVpoaSEOW/un5O8GODVB1HeNKQJXP3572AcfnZW79n4jW8RVC/XEth5/xif7IqHPJaYTrbKh5U5JVRdChaK6neJLKA6ggCZLT2x/Cl/MqVY6jw+wCiLG2UWxZQtlA4+gQlJcAcTFyK
Content-ID: <FF4ECCB706FE0F48BDEA05C2D07C3481@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce82d0b-0e80-4f90-fd0b-08d77c95ef23
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2019 10:52:49.9029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fFV510GQi8zCF/LCpn4QvpHyzd3SRDOXUJ1geKa5Au3Toj+d1quQCgY/Nto9VzgEBKpVQguNhHZ771JyA90LtYjCZMe8CQwDnnebHq0a3p0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2250
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ieGev-00FN8C-3w
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

On Dec 09, 2019 / 17:36, Chao Yu wrote:
> On 2019/12/9 15:28, Shinichiro Kawasaki wrote:
> > On Dec 09, 2019 / 10:04, Chao Yu wrote:
> >> On 2019/12/2 17:40, Shin'ichiro Kawasaki wrote:
> >>> To catch f2fs bugs in write pointer handling code for zoned block
> >>> devices, check write pointers of non-open zones that current segments do
> >>> not point to. Do this check at mount time, after the fsync data recovery
> >>> and current segments' write pointer consistency fix. Or when fsync data
> >>> recovery is disabled by mount option, do the check when there is no fsync
> >>> data.
> >>>
> >>> Check two items comparing write pointers with valid block maps in SIT.
> >>> The first item is check for zones with no valid blocks. When there is no
> >>> valid blocks in a zone, the write pointer should be at the start of the
> >>> zone. If not, next write operation to the zone will cause unaligned write
> >>> error. If write pointer is not at the zone start, reset the write pointer
> >>> to place at the zone start.
> >>>
> >>> The second item is check between the write pointer position and the last
> >>> valid block in the zone. It is unexpected that the last valid block
> >>> position is beyond the write pointer. In such a case, report as a bug.
> >>> Fix is not required for such zone, because the zone is not selected for
> >>> next write operation until the zone get discarded.
> >>>
> >>> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> >>> ---
> >>>  fs/f2fs/f2fs.h    |   1 +
> >>>  fs/f2fs/segment.c | 126 ++++++++++++++++++++++++++++++++++++++++++++++
> >>>  fs/f2fs/super.c   |  11 ++++
> >>>  3 files changed, 138 insertions(+)
> >>>
> >>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> >>> index 002c417b0a53..23a84d7f17b8 100644
> >>> --- a/fs/f2fs/f2fs.h
> >>> +++ b/fs/f2fs/f2fs.h
> >>> @@ -3156,6 +3156,7 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
> >>>  			unsigned int val, int alloc);
> >>>  void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
> >>>  int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi);
> >>> +int f2fs_check_write_pointer(struct f2fs_sb_info *sbi);
> >>>  int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
> >>>  void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
> >>>  int __init f2fs_create_segment_manager_caches(void);
> >>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> >>> index 9b6c7ab67b93..48903b7a9d25 100644
> >>> --- a/fs/f2fs/segment.c
> >>> +++ b/fs/f2fs/segment.c
> >>> @@ -4370,6 +4370,90 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
> >>>  
> >>>  #ifdef CONFIG_BLK_DEV_ZONED
> >>>  
> >>> +static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
> >>> +				    struct f2fs_dev_info *fdev,
> >>> +				    struct blk_zone *zone)
> >>> +{
> >>> +	unsigned int wp_segno, wp_blkoff, zone_secno, zone_segno, segno;
> >>> +	block_t zone_block, wp_block, last_valid_block;
> >>> +	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> >>> +	int i, s, b, ret;
> >>> +	struct seg_entry *se;
> >>> +
> >>> +	if (zone->type != BLK_ZONE_TYPE_SEQWRITE_REQ)
> >>> +		return 0;
> >>> +
> >>> +	wp_block = fdev->start_blk + (zone->wp >> log_sectors_per_block);
> >>> +	wp_segno = GET_SEGNO(sbi, wp_block);
> >>> +	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
> >>> +	zone_block = fdev->start_blk + (zone->start >> log_sectors_per_block);
> >>> +	zone_segno = GET_SEGNO(sbi, zone_block);
> >>> +	zone_secno = GET_SEC_FROM_SEG(sbi, zone_segno);
> >>> +
> >>> +	if (zone_segno >= MAIN_SEGS(sbi))
> >>> +		return 0;
> >>> +
> >>> +	/*
> >>> +	 * Skip check of zones cursegs point to, since
> >>> +	 * fix_curseg_write_pointer() checks them.
> >>> +	 */
> >>> +	for (i = 0; i < NO_CHECK_TYPE; i++)
> >>> +		if (zone_secno == GET_SEC_FROM_SEG(sbi,
> >>> +						   CURSEG_I(sbi, i)->segno))
> >>> +			return 0;
> >>> +
> >>> +	/*
> >>> +	 * Get last valid block of the zone.
> >>> +	 */
> >>> +	last_valid_block = zone_block - 1;
> >>> +	for (s = sbi->segs_per_sec - 1; s >= 0; s--) {
> >>> +		segno = zone_segno + s;
> >>> +		se = get_seg_entry(sbi, segno);
> >>> +		for (b = sbi->blocks_per_seg - 1; b >= 0; b--)
> >>> +			if (f2fs_test_bit(b, se->cur_valid_map)) {
> >>> +				last_valid_block = START_BLOCK(sbi, segno) + b;
> >>> +				break;
> >>> +			}
> >>> +		if (last_valid_block >= zone_block)
> >>> +			break;
> >>> +	}
> >>> +
> >>> +	/*
> >>> +	 * If last valid block is beyond the write pointer, report the
> >>> +	 * inconsistency. This inconsistency does not cause write error
> >>> +	 * because the zone will not be selected for write operation until
> >>> +	 * it get discarded. Just report it.
> >>> +	 */
> >>> +	if (last_valid_block >= wp_block) {
> >>> +		f2fs_notice(sbi, "Valid block beyond write pointer: "
> >>> +			    "valid block[0x%x,0x%x] wp[0x%x,0x%x]",
> >>> +			    GET_SEGNO(sbi, last_valid_block),
> >>> +			    GET_BLKOFF_FROM_SEG0(sbi, last_valid_block),
> >>> +			    wp_segno, wp_blkoff);
> >>> +		return 0;
> >>> +	}
> >>> +
> >>> +	/*
> >>> +	 * If there is no valid block in the zone and if write pointer is
> >>> +	 * not at zone start, reset the write pointer.
> >>> +	 */
> >>> +	if (last_valid_block + 1 == zone_block && zone->wp != zone->start) {
> >>> +		f2fs_notice(sbi,
> >>> +			    "Zone without valid block has non-zero write "
> >>> +			    "pointer. Reset the write pointer: wp[0x%x,0x%x]",
> >>> +			    wp_segno, wp_blkoff);
> >>> +		ret = blkdev_zone_mgmt(fdev->bdev, REQ_OP_ZONE_RESET,
> >>> +				       zone->start, zone->len, GFP_NOFS);
> >>
> >> Should use __f2fs_issue_discard_zone() to cover multi-device support?
> > 
> > Yes, __f2fs_issue_discard_zone() for each device adds more check and I think
> > it is safer for multi-device case. Will re-post the patch with you suggest.
> > 
> >>
> >>> +		if (ret) {
> >>> +			f2fs_notice(sbi, "Reset zone failed: %s (errno=%d)",
> >>> +				    fdev->path, ret);
> >>> +			return ret;
> >>> +		}
> >>
> >> Just out of curiosity, how long will RESET command take normally?
> > 
> > Though I don't have accurate numbers, it takes around 10 milliseconds to
> > complete one RESET command for one zone with my system. Assuming the number
> 
> Okay, as RESET command cover large-sized area, I guess we can afford such delay
> during mount(), what I'm concerning is we will trigger synchoronous RESET
> command during checkpoint(), as we will unlock cp_rwsem after handling RESET
> command, so it potentially hangs fs operations long time once there is many
> pending RESET commands, maybe we can improve RESET command handling like we did
> for discard, anyway it's another topic.

Thank you for sharing your thoughts. I keep this in mind.

I have sent out v5 for review. Of note is that I replaced blkdev_zone_mgmt()
with __f2fs_issue_discard_zone()in the 2nd patch as well as the 1st patch. Then
I didn't add your reviewed-by tag in the 1st patch.

> 
> Thanks,
> 
> > of zones to discard here is small, I think the additional overhead is small
> > enough to ignore.
> > 
> > Thanks!
> > 
> >>
> >> Thanks,
> >>
> >>> +	}
> >>> +
> >>> +	return 0;
> >>> +}
> >>> +
> >>>  static struct f2fs_dev_info *get_target_zoned_dev(struct f2fs_sb_info *sbi,
> >>>  						  block_t zone_blkaddr)
> >>>  {
> >>> @@ -4442,6 +4526,10 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
> >>>  		    "curseg[0x%x,0x%x]", type, cs->segno, cs->next_blkoff);
> >>>  	allocate_segment_by_default(sbi, type, true);
> >>>  
> >>> +	/* check consistency of the zone curseg pointed to */
> >>> +	if (check_zone_write_pointer(sbi, zbd, &zone))
> >>> +		return -EIO;
> >>> +
> >>>  	/* check newly assigned zone */
> >>>  	cs_section = GET_SEC_FROM_SEG(sbi, cs->segno);
> >>>  	cs_zone_block = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, cs_section));
> >>> @@ -4492,11 +4580,49 @@ int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
> >>>  
> >>>  	return 0;
> >>>  }
> >>> +
> >>> +struct check_zone_write_pointer_args {
> >>> +	struct f2fs_sb_info *sbi;
> >>> +	struct f2fs_dev_info *fdev;
> >>> +};
> >>> +
> >>> +static int check_zone_write_pointer_cb(struct blk_zone *zone, unsigned int idx,
> >>> +				      void *data) {
> >>> +	struct check_zone_write_pointer_args *args;
> >>> +	args = (struct check_zone_write_pointer_args *)data;
> >>> +
> >>> +	return check_zone_write_pointer(args->sbi, args->fdev, zone);
> >>> +}
> >>> +
> >>> +int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
> >>> +{
> >>> +	int i, ret;
> >>> +	struct check_zone_write_pointer_args args;
> >>> +
> >>> +	for (i = 0; i < sbi->s_ndevs; i++) {
> >>> +		if (!bdev_is_zoned(FDEV(i).bdev))
> >>> +			continue;
> >>> +
> >>> +		args.sbi = sbi;
> >>> +		args.fdev = &FDEV(i);
> >>> +		ret = blkdev_report_zones(FDEV(i).bdev, 0, BLK_ALL_ZONES,
> >>> +					  check_zone_write_pointer_cb, &args);
> >>> +		if (ret < 0)
> >>> +			return ret;
> >>> +	}
> >>> +
> >>> +	return 0;
> >>> +}
> >>>  #else
> >>>  int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
> >>>  {
> >>>  	return 0;
> >>>  }
> >>> +
> >>> +int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
> >>> +{
> >>> +	return 0;
> >>> +}
> >>>  #endif
> >>>  
> >>>  /*
> >>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> >>> index 5111e1ffe58a..755ad57c795b 100644
> >>> --- a/fs/f2fs/super.c
> >>> +++ b/fs/f2fs/super.c
> >>> @@ -3544,6 +3544,17 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
> >>>  			goto free_meta;
> >>>  		}
> >>>  	}
> >>> +
> >>> +	/*
> >>> +	 * If the f2fs is not readonly and fsync data recovery succeeds,
> >>> +	 * check zoned block devices' write pointer consistency.
> >>> +	 */
> >>> +	if (!err && !f2fs_readonly(sb) && f2fs_sb_has_blkzoned(sbi)) {
> >>> +		err = f2fs_check_write_pointer(sbi);
> >>> +		if (err)
> >>> +			goto free_meta;
> >>> +	}
> >>> +
> >>>  reset_checkpoint:
> >>>  	/* f2fs_recover_fsync_data() cleared this already */
> >>>  	clear_sbi_flag(sbi, SBI_POR_DOING);
> >>>
> > 
> > --
> > Best Regards,
> > Shin'ichiro Kawasaki.
> > 

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
