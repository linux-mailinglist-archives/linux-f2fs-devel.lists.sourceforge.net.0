Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28141FC189
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Nov 2019 09:27:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iVATi-00016t-NE; Thu, 14 Nov 2019 08:27:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2145628f9=shinichiro.kawasaki@wdc.com>)
 id 1iVATh-00016m-Fu
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 08:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bprd1nJDQNHTbkMlDvOQTgsPk1r90HzonXGh1aoDUt4=; b=CsjAp6kdWb4hLQCiLuJ8eNvkJ1
 EvAGwa2WDuES8PZAOFJQNKWJuYGrSh1nbEzN49hl4JKXoB/l4DEWUwVqYdpGjJMDml14z0yak3uLM
 vCWeE4Ymb9109iEqh2JTtlFj3hTJDtbNweUY2NxskUWlCYAaZAMnXHDApjDEAhMUqjAU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bprd1nJDQNHTbkMlDvOQTgsPk1r90HzonXGh1aoDUt4=; b=DbiT/ESRaeANo/pXEhZkKFYo1v
 SxGqBEIp1E2+K7nJ/z8n2F+HWDiQaNpTs6aa7IFETfyJbkmD8B0ElpeKjsDDGMXG75tGCW1K9IrAw
 LFnKLj2NxTlABXUvM2a0DW/PgCLj/l+XUlpf6Y0DeF8l2DhOinyGXAkUyhs5QrSdrjUI=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iVATf-00GIRp-JR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 08:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573720103; x=1605256103;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=38c+QjVGN5Y0S97NIcKfAXWsd3sEIqUtxG+jw7U2XYA=;
 b=pUaWUoVjt4YdoSDPGwX9Q927RK7SUbUBameme5WIx0E7jEfVs6upg9Jn
 Rx1XYlb6RcCOqm1gF6tL7BLrQln6S23rM9ApJWgOqq95G/IIWtHpyCWVw
 oiO4CKGRhn8UX2oO7DnZE2GKskWAntH9FSENvkVBEttizFHB2DV9S3D0N
 QuYzr2b69ehX3nny+dubZ3BlfVEU30lOO7IAczCC4EP9JvcKj5Xx328JN
 3hnpphxPF7eSoq6ZZmKOYQll6ctFcHbAPAncRoDly3EPuhSEoTd2SNnOx
 DqW+AXpikriU15B88FmnRenM8exOMa4josR5gOVZgn1tDwMf45pJEzk3r g==;
IronPort-SDR: pcd6nSUfyRjqwMJzeyuBCeONlxgNTjFoQ7gEfe8NFzsSIg/Pm37aIDXydHbOc92zERirJtgsPH
 1dOCiDyrdg316Mq/lFnDLFtxbsnOllWqePqJxDZSuquSNTBfer7m6BSIzNxL7XQr3G/E1r9yk9
 xUxETGU1gy/iRmelozaS2t/SYdHWnrp2QO1UOridfoekL1gvK2YAp+grVFC9jqsYMdE7vgyELl
 263jUKDXhCAndAKfgCbyPOMLB5gcQfr+8sDnoxmzVTyk37o0fVQcTaaffEOgJKwlx8nhTBIqCG
 2pc=
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="224282538"
Received: from mail-bn3nam04lp2059.outbound.protection.outlook.com (HELO
 NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.59])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2019 16:28:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPkR2GTDi4UTGf8C/zR88460yXcg46bdLzXdRVcEMGQbo4IlBwa63xZsRt8/Q/IDo9S1ygpa9oyn1WFqzaM2vShlEyH6gbw5K0piMhrkX8MPHwiv9vljxGhNIP3lbB7RbAJpFg97eSZ5wZro7unB2zW14sikBjjlyydXOmkRxPKAxdHPJJg+/ZdgK/4HZV7DfwZ21GF7RQQUqFxR07hiwzL0PS0x60H1c2fz19ER7T8620BUOf4nnqotJMgF3Ii7JMKs5dsxsQ9a3l30dmrRJWcWjCiHaopaFj6sHCHWxW9P70QcslVkE/QEqQXwJcVKAaWEkBFcBip8YeRd8QU1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bprd1nJDQNHTbkMlDvOQTgsPk1r90HzonXGh1aoDUt4=;
 b=mJTL+AaJRTFcpQZhDawNIeemCVnt9iMgHc7ms+EGxGGrdakNP79Gg5X6Gyx4rfaXLLkynkyguIa6s8nnneOSKrNznC1NkDuGDxTlsxMPQiSYrz8WQ+v6Vvvkex+o63RfS4OWbtXaX2/WRAUXOuaefl0/Ke6irTvdWgREvKqGvlCLEknyitVyWhHv3drsl6e9JiaW6Azz4fHs6vY2Il/KRCgOfajzGkWLVGvw4XZrUTLH5UKjaZWeDjK0zUd/bgze9AheYVKUb7Lj2X38ik5jeQgpl0uRpgG80QlFOi2YPjerqhavp2EbbSOq3A2sFnAlYddXy5Sejzdke5jUEkZeHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bprd1nJDQNHTbkMlDvOQTgsPk1r90HzonXGh1aoDUt4=;
 b=ulPdebJaX+aibIJk1ZzwqHP79Pa7vRspo97h5gZjZlx/FK4Fw3qxRBH6lxJPeHPr5erLz0djHOZ0i+WYip1DstgFXyHNb5LXTPuniXqYUDO43DFVNUcxegfQEnW1zYzRZnMmvXYGzD2JCMlxDdUMcjP+2weGLb8BYHNSVnQfXyg=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2380.namprd04.prod.outlook.com (10.167.9.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.22; Thu, 14 Nov 2019 08:27:36 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74%11]) with mapi id 15.20.2430.028; Thu, 14 Nov
 2019 08:27:36 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v2 2/2] f2fs: Check write pointer consistency of non-open
 zones
Thread-Index: AQHVjV0SlOcJXsIiokaKZmbmvNS61qd8jL+AgAQyFYCABKZTgIADBxGAgAIDyYA=
Date: Thu, 14 Nov 2019 08:27:36 +0000
Message-ID: <20191114082735.hrpizqk677pi24z4@shindev.dhcp.fujisawa.hgst.com>
References: <20191028065801.28220-1-shinichiro.kawasaki@wdc.com>
 <20191028065801.28220-3-shinichiro.kawasaki@wdc.com>
 <673218f1-ced2-132e-a91a-7554b6aad1d9@huawei.com>
 <20191108042707.3xzzaiojvuhhrbe6@shindev.dhcp.fujisawa.hgst.com>
 <df512791-0ef5-37e2-1c8b-bd893635b90d@huawei.com>
 <20191113014131.2schfpe7ncjg7q4s@shindev.dhcp.fujisawa.hgst.com>
In-Reply-To: <20191113014131.2schfpe7ncjg7q4s@shindev.dhcp.fujisawa.hgst.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9c7b37f8-0b98-4c63-63ad-08d768dc810b
x-ms-traffictypediagnostic: CY1PR04MB2380:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB23800D685C33AE7CD97D7D16ED710@CY1PR04MB2380.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-forefront-prvs: 02213C82F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(199004)(189003)(51874003)(7736002)(6486002)(305945005)(9686003)(6436002)(1076003)(6916009)(476003)(2906002)(6512007)(66946007)(11346002)(86362001)(66446008)(64756008)(66556008)(66476007)(446003)(4326008)(54906003)(91956017)(316002)(76116006)(229853002)(6246003)(76176011)(186003)(25786009)(102836004)(99286004)(14454004)(256004)(14444005)(66066001)(26005)(478600001)(6506007)(8936002)(44832011)(81166006)(5660300002)(81156014)(486006)(71200400001)(71190400001)(53546011)(3846002)(6116002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2380;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nADwG1iCaDdbCSkSCMdW73hj0j4549EtO0f4MzItUSoL25B3v3oKhF1kxenxgpIBNj4ciTkwrQc22EsCmIgAX/olIUFUjHprzxyc0HPLmZ96vMDWNQS64FquChsPemUFZsUNvbQW0Lh4TR4VzCFnFTBViGL+tPOjgTAmzpuVX0NuzLYJc4XNsA41GtlOO/t2UREnjOHn4DiJPJq2BLd+IAqXmyY3+uL4y4nSEUaOudLAzyBDxdvRNN3nlm7PaIwmTxOJ2MAjcfgNHiJtIjEiIqSS8hFLwPYzoIUd36mfP39b5TCCiaDC0dCMb8HJCfAg/uhb/+c79JI8sX5HUBNObWq3yrJhgYUdJvwqTdsD5aAIKIYr0bEsG8FTB0f+T+l1IpmIkiLE9en2+wADLoGQKOYLiytGljbB47I39wtILyz6F+TgWsam9cgDuxI4lurc
Content-ID: <83956927DF670F4E955DE478EE19467F@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7b37f8-0b98-4c63-63ad-08d768dc810b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2019 08:27:36.2246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lcU5HdK9qDiD8NYF93iSaiVqlyKfLfV1Ym2Z2zmz/ra2/p28La3w1fU9DVb5BUABfJwtVP7E7juOJa1nzGlmptvyoeZVIYbT4vv4maL2uIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2380
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
X-Headers-End: 1iVATf-00GIRp-JR
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: Check write pointer consistency
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

On Nov 13, 2019 / 10:41, Shin'ichiro Kawasaki wrote:
> On Nov 11, 2019 / 11:27, Chao Yu wrote:
> > On 2019/11/8 12:27, Shinichiro Kawasaki wrote:
> > > On Nov 05, 2019 / 20:22, Chao Yu wrote:
> > >> On 2019/10/28 14:58, Shin'ichiro Kawasaki wrote:
> > >>> To catch f2fs bugs in write pointer handling code for zoned block
> > >>> devices, check write pointers of non-open zones that current segments do
> > >>> not point to. Do this check at mount time, after the fsync data recovery
> > >>> and current segments' write pointer consistency fix. Check two items
> > >>> comparing write pointers with valid block maps in SIT.
> > >>>
> > >>> The first item is check for zones with no valid blocks. When there is no
> > >>> valid blocks in a zone, the write pointer should be at the start of the
> > >>> zone. If not, next write operation to the zone will cause unaligned write
> > >>> error. If write pointer is not at the zone start, make mount fail and ask
> > >>> users to run fsck.
> > >>>
> > >>> The second item is check between the write pointer position and the last
> > >>> valid block in the zone. It is unexpected that the last valid block
> > >>> position is beyond the write pointer. In such a case, report as the bug.
> > >>> Fix is not required for such zone, because the zone is not selected for
> > >>> next write operation until the zone get discarded.
> > >>>
> > >>> Also move a constant F2FS_REPORT_ZONE from super.c to f2fs.h to use it
> > >>> in segment.c also.
> > >>>
> > >>> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > >>> ---
> > >>>  fs/f2fs/f2fs.h    |   3 +
> > >>>  fs/f2fs/segment.c | 147 ++++++++++++++++++++++++++++++++++++++++++++++
> > >>>  fs/f2fs/super.c   |  11 ++--
> > >>>  3 files changed, 157 insertions(+), 4 deletions(-)
> > >>>
> > >>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > >>> index 0216282c5b80..e8524be17852 100644
> > >>> --- a/fs/f2fs/f2fs.h
> > >>> +++ b/fs/f2fs/f2fs.h
> > >>> @@ -3137,6 +3137,7 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
> > >>>  			unsigned int val, int alloc);
> > >>>  void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
> > >>>  int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi, bool check_only);
> > >>> +int f2fs_check_write_pointer(struct f2fs_sb_info *sbi);
> > >>>  int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
> > >>>  void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
> > >>>  int __init f2fs_create_segment_manager_caches(void);
> > >>> @@ -3610,6 +3611,8 @@ static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
> > >>>  
> > >>>  	return test_bit(zno, FDEV(devi).blkz_seq);
> > >>>  }
> > >>> +
> > >>> +#define F2FS_REPORT_NR_ZONES   4096
> > >>>  #endif
> > >>>  
> > >>>  static inline bool f2fs_hw_should_discard(struct f2fs_sb_info *sbi)
> > >>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > >>> index 2b6e637dd6d3..20ef5b3705e1 100644
> > >>> --- a/fs/f2fs/segment.c
> > >>> +++ b/fs/f2fs/segment.c
> > >>> @@ -4333,6 +4333,131 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
> > >>>  
> > >>>  #ifdef CONFIG_BLK_DEV_ZONED
> > >>>  
> > >>> +static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
> > >>> +				    struct f2fs_dev_info *fdev,
> > >>> +				    struct blk_zone *zone)
> > >>> +{
> > >>> +	unsigned int s, wp_segno, wp_blkoff, zone_secno, zone_segno, segno;
> > >>> +	block_t zone_block, wp_block, last_valid_block, b;
> > >>> +	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> > >>> +	int i;
> > >>> +	struct seg_entry *se;
> > >>> +
> > >>> +	wp_block = fdev->start_blk + (zone->wp >> log_sectors_per_block);
> > >>> +	wp_segno = GET_SEGNO(sbi, wp_block);
> > >>> +	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
> > >>> +	zone_block = fdev->start_blk + (zone->start >> log_sectors_per_block);
> > >>> +	zone_segno = GET_SEGNO(sbi, zone_block);
> > >>> +	zone_secno = GET_SEC_FROM_SEG(sbi, zone_segno);
> > >>> +
> > >>> +	if (zone_segno >= MAIN_SEGS(sbi))
> > >>> +		return 0;
> > >>> +
> > >>> +	/*
> > >>> +	 * If a curseg points to the zone, skip check because the zone
> > >>> +	 * may have fsync data that valid block map does not mark.
> > >>
> > >> None-curseg zone may also contain fsynced data as well? Maybe we can only verify
> > >> on clean image or recovered image?
> > > 
> > > Right. This function for none-curseg zones should be called after fsync data
> > 
> > If so, any place to check recovery is done? You know, user can choose to skip
> > recovery by using disable_roll_forward/norecovery mount option.
> 
> Ah, disable_roll_forward/norecovery mount option needs some care. The patch I
> posted did not care it well enough.
> 
> When disable_roll_forward/norecovery mount option is set, I think the function
> for none-curseg zones should be called only if there is no fsync data. If fsync
> data exists, mount fails regardless of write pointer status.
> 
> I will modify the function calling step and conditions in the next patch.

I have sent out the v3 patch series, which reflects the comments above.

> 
> > 
> > > recovery. I think my comment above is confusing. The point is that this
> > > function is for none-curseg zones, and other function covers check for curseg
> > > zones. Let me revise the comment as follows:
> > > 
> > >      Skip check of zones cursegs point to, since fix_curseg_write_pointer()
> > >      checks them.
> > > 
> > >>
> > >>> +	 */
> > >>> +	for (i = 0; i < NO_CHECK_TYPE; i++)
> > >>> +		if (zone_secno == GET_SEC_FROM_SEG(sbi,
> > >>> +						   CURSEG_I(sbi, i)->segno))
> > >>> +			return 0;
> > >>> +
> > >>> +	/*
> > >>> +	 * Get last valid block of the zone.
> > >>> +	 */
> > >>> +	last_valid_block = zone_block - 1;
> > >>> +	for (s = 0; s < sbi->segs_per_sec; s++) {
> > >>> +		segno = zone_segno + s;
> > >>> +		se = get_seg_entry(sbi, segno);
> > >>> +		for (b = 0; b < sbi->blocks_per_seg; b++)
> > >>> +			if (f2fs_test_bit(b, se->cur_valid_map))
> > >>> +				last_valid_block = START_BLOCK(sbi, segno) + b;
> > >>> +	}
> > >>
> > >> We search bitmap table reversedly.
> > > 
> > > Yes, will reverse the loops in the next post.
> > > 
> > >>
> > >>> +
> > >>> +	/*
> > >>> +	 * If last valid block is beyond the write pointer, report the
> > >>> +	 * inconsistency. This inconsistency does not cause write error
> > >>> +	 * because the zone will not be selected for write operation until
> > >>> +	 * it get discarded. Just report it.
> > >>> +	 */
> > >>> +	if (last_valid_block >= wp_block) {
> > >>> +		f2fs_notice(sbi, "Valid block beyond write pointer: "
> > >>> +			    "valid block[0x%x,0x%x] wp[0x%x,0x%x]",
> > >>> +			    GET_SEGNO(sbi, last_valid_block),
> > >>> +			    GET_BLKOFF_FROM_SEG0(sbi, last_valid_block),
> > >>> +			    wp_segno, wp_blkoff);
> > >>> +		return 0;
> > >>> +	}
> > >>> +
> > >>> +	/*
> > >>> +	 * If there is no valid block in the zone and if write pointer is
> > >>> +	 * not at zone start, report the error to run fsck and mark the
> > >>> +	 * zone as used.
> > >>> +	 */
> > >>> +	if (last_valid_block + 1 == zone_block && zone->wp != zone->start) {
> > >>> +		f2fs_notice(sbi,
> > >>> +			    "Zone without valid block has non-zero write "
> > >>> +			    "pointer, run fsck to fix: wp[0x%x,0x%x]",
> > >>> +			    wp_segno, wp_blkoff);
> > >>> +		__set_inuse(sbi, zone_segno);
> > >>
> > >> Why do we need to set it inused? if this is necessary, we need to call this
> > >> under free_i->segmap_lock.
> > > 
> > > I once thought that I need to set inconsistent zones in use, because I observed
> > > that write operation happened after zone consistency check failure (in
> > > fill_super() after free_meta label). It caused unaligned writer error. To avoid
> > > it, I added __set_inuse() to keep inconsistent zones not selected for the write
> > > target.
> > > 
> > > But that write operation happened because the write pointer fix curseg was done
> > > out of the SBI_POR_DOING protection. Now I learned SBI_POR_DOING can protect
> > > write operation, and I don't think set in use for the inconsistent zones is
> > > required. Will remove __set_inuse() calls from this patch and the first patch.
> > 
> > Also f2fs_stop_checkpoint() will stop any data/node/meta writeback, so it'd be
> > safe here.
> 
> Ok, I note it. Now I'm looking at the code again, and I think the write pointer
> fix for cursegs can be done within SBI_POR_DOING protection. At this moment, I
> think f2fs_stop_checkpoint() is not necessary.

My comment above could be confusing, which is about the 1st patch. I removed
f2fs_stop_checkpoint() from the v3 1st patch.

As for none-curseg zones cannot be done within SBI_POR_DOING, still
f2fs_stop_checkpoint() is required. I kept it in v3 2nd patch.

Thanks in advance for the reviews and comments on the v3 seires.

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
