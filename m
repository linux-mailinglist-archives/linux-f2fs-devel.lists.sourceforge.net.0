Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67971E6BBF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2019 05:48:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iOwxS-00063V-9o; Mon, 28 Oct 2019 04:48:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1975423da=shinichiro.kawasaki@wdc.com>)
 id 1iOwxQ-000630-Gi
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 04:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=APfV7pPWEpUnCbGz2Xu9M+fLdYQt5PWLo6rxekq3V58=; b=AQZGL3d8MHCtVucMLilqRCQ8sA
 Bw1TD+VS2OFHwluHqSveo8x2/xzv61139Y92CKLJTTckMX+Blb0mfFnZoLE79Uv1CnJcFAZ9uOyxS
 c8a9zlpJMp/LA0CJf1RuTXhXQo9V9AbqtEPCN7/WIkQCdjUsR17+UJudAjEEiEPfW114=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=APfV7pPWEpUnCbGz2Xu9M+fLdYQt5PWLo6rxekq3V58=; b=BN5gHy8srvaXlQlm3VDFVTbFaG
 k8uUkzi4aFhDOkKw9xQ6bRZfd6J9SNlZPwwfjBx5VjiO+v1QfJP20AJR20PvOHBRU3uLp0VIw2NFK
 ec5GW1TtRILuMPzL7RxXp/aT/Kvr1aoSiyEtugD3K+Ffr1cTPQmXrm1IiI6xNU5oHJeo=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iOwxM-005vpW-S1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 04:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1572238121; x=1603774121;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+c4i+gbeCC5v5fqWz6sa3x/ZPsMzz1Wq4Jeq+hPdncE=;
 b=OdIt/T/bJKhgJfZvuyAgEn+2xNLGa1ZxMOT3/b+CakfiK88fnPrb7X3i
 hH8x3ynzWIgpeqn4KYB5OAzsg5Ae46pUlEz/3SJ+Gr/0K/2Vvw13LswW5
 Hz0OpLzISYSdbtoo99Bl4kZw7QgVbFUp2SLfKtS5gIrBuQWf9U+x+XDFZ
 +TGso1zQ24Qn3LjmxlCBpS0+orVYLM6RUPdpeDJ6iQiYT0BKOjzuQa91W
 5zoFZ8RSkF4fF/CBOqyVWCtjdiCKMUGyIRrDOVp8Lv7BZ6JSqw4Z9Z4YA
 wUU+jKQR95KdmRdEUs8Y9LsBUUP3Tr/T+o3qXkJ7vkrAUEWSIjMurhi6H Q==;
IronPort-SDR: 7vj2nmCpsCwesylsIYGwK/OsEzkSBvWqclkvGtSZ29YjAF3mrekrGNJKkhLwHjbEqHkrPTLVwI
 8Ya2QBuCq6dA21ldg3AnybuZvf5nY8tSYLayKlgfkhh30L7OYKlhDRop9C0Q2Ttmkf0GJM4xi4
 /JgRFSpJ8IeFN/lKIDnCGrZH+VkNJB0Z60dK1Is1GqEc7dS7fx7ovQ2SNI+GTbZlDMGccEllJT
 58+18XpUyAtS/MFQ/Ep7+VXnn7QbJeu8mWww6FfVyLTphXstGBeganBKeVXR72kw2KyRO9RAO7
 vWQ=
X-IronPort-AV: E=Sophos;i="5.68,238,1569254400"; d="scan'208";a="125874127"
Received: from mail-bn3nam01lp2052.outbound.protection.outlook.com (HELO
 NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.52])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2019 12:48:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCyyoabAuPOHXqLXZt28CLd05/FMs/xT+am7RA7fTBEBwGy8Gu+rfmrnt+tpvrE/O57irEEM7ZtN6ZvSWQtW08kYxkFrZOe5NlW9jut/y8dhEasZJ7kLZuCdQzAQRhAl6HrfOskAMEJfBgZY8XOma6Rjx7ZrI3ljsgVmvf2FaqM01VGtERn2/mJG/5g6qCfjasBNPljmh5O7YXGQ0ywcsWw2qgJfwZClbhZu9z2BO3gGE0V+HXmd8o7la7pMNf4WA8wOBKpElGFH8NUIMGfCgRQeJE4tL1KN1hQWrheUCjLmcWPvt/9oR1ZYAnkOSQGBZ3U17nZkJMksGfvlKvLCLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APfV7pPWEpUnCbGz2Xu9M+fLdYQt5PWLo6rxekq3V58=;
 b=f83reo5Bg6YXwI0ZdBINGUsr3XlRoCADu6gr9urSVZq7OdJtiLmtkvwG0cfKC4vEnAuw8FWx2y+XRJsJbVIIpVyjs+B+K5lzd2Fq73Ayiy95GsMouwT2K5jkFlfTAMusxpH6rlES2gNtB5VuRMA+MCjMq1UdiY+7PXnKAlAMqqWvVbDY7/bPzoQh7cs1llDTOEnPvntMTZL5ytk69Ph2g1z9DLnu8mBJFfskiYFqnGTaNfRuenTM1O5fH03RwC19jAbM79mizf7HebaCTG4Ka25X08JZNFII6ngra6a80R7Yymly0NAtey+guIhQybhcGopxj2ZD3CK32TX5bMu6Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APfV7pPWEpUnCbGz2Xu9M+fLdYQt5PWLo6rxekq3V58=;
 b=zZydcdUAURtxB2pCbnpu1mAhguFdpldjF7R+LQqYwVM7tnYbv03ULwgVNCRcrrjijJWJrQGv6/u12xq/JTe3LtcNZ2OKYcb7vjUe4lpZ8Jn8CdoV4bDKF9p7yPjH6kbI56tk2aQgqIv4j9HIp0l9tdhc8VxhEIyppgHjSMC6b3g=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2138.namprd04.prod.outlook.com (10.167.8.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Mon, 28 Oct 2019 04:48:33 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::353a:c2f5:de72:cc7]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::353a:c2f5:de72:cc7%9]) with mapi id 15.20.2387.021; Mon, 28 Oct 2019
 04:48:32 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [PATCH 2/2] f2fs: Check write pointer consistency of non-open
 zones
Thread-Index: AQHVhX7B6jtcjJ/v5U+HEuAY/mgOdadviueA
Date: Mon, 28 Oct 2019 04:48:32 +0000
Message-ID: <20191028044831.2mpz34sw6td7ugnw@shindev>
References: <20191018063859.3082-1-shinichiro.kawasaki@wdc.com>
 <20191018063859.3082-3-shinichiro.kawasaki@wdc.com>
In-Reply-To: <20191018063859.3082-3-shinichiro.kawasaki@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c16bde34-59bf-4852-ba7c-08d75b6215f5
x-ms-traffictypediagnostic: CY1PR04MB2138:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2138C949F74803B4D430ABAEED660@CY1PR04MB2138.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0204F0BDE2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(7916004)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(2501003)(99286004)(110136005)(2906002)(14454004)(86362001)(9686003)(229853002)(6512007)(3846002)(76116006)(6486002)(91956017)(6436002)(66476007)(66946007)(6116002)(66446008)(64756008)(66556008)(305945005)(7736002)(25786009)(58126008)(5660300002)(476003)(1076003)(6246003)(8936002)(4326008)(316002)(71200400001)(71190400001)(76176011)(102836004)(256004)(26005)(186003)(44832011)(6506007)(486006)(446003)(33716001)(11346002)(81156014)(478600001)(8676002)(66066001)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2138;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n4Lf4wtmhopPPt2s5azPs+1hcEZV3XM2FoRJdGvRaxCyUm40yhBrnxye7NFl3tjslUPhORz6zzHuwWjb8jxQ8zUQdGES4akyo+NCh6mwSsiRtyjzR8rbHmh+PWwzyvKsxfpgLI7n6jg4zhGbBVav3aveBh6Ji/12bMvnOe7lfmuim6rLIfKdDnOuo98a8ejnvJDnTUVN00Z0sJG/5KAxorybx/trSBmAarLZYxc18b+/mMJC5BLkPk/32aNyFvOkssvF73Etu2IuuKaVQK3AmcC7Q4lUQECAPwdrjhdbGCi6dSRG/EcNey6SdXfHIiuPzLCQ37HHwHcLJVlCkC/gY/yMsCm0d8r/4Bv+0ju+YiPSavcP42D8ZP5w5p2BMvXvxvBpwAMIQ+FiCith21a9MGoIlwVMeKEl9l867hBGe+EbHFSBieqaWSxb/k2wLfOw
Content-ID: <2E3E49C94F6802488F32DD3AC0C208F3@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c16bde34-59bf-4852-ba7c-08d75b6215f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 04:48:32.8773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zod8Bedoh2Ag6tJAvlyTF22LJDpaDsOeoDNR1bt3u0wJtWDY3aBxaMe+t5+1sZVEe+jr2N7gO62cpEGrLvn+/kloFDlukRmjPtWVqBhfmxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2138
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iOwxM-005vpW-S1
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: Check write pointer consistency of
 non-open zones
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Oct 18, 2019 / 15:38, Shin'ichiro Kawasaki wrote:
> To catch f2fs bugs in write pointer handling code for zoned block
> devices, check write pointers of non-open zones that current segments do
> not point to. Do this check at mount time, after the fsync data recovery
> and current segments' write pointer consistency fix. Check two items
> comparing write pointers with valid block maps in SIT.
> 
> The first item is check for zones with no valid blocks. When there is no
> valid blocks in a zone, the write pointer should be at the start of the
> zone. If not, next write operation to the zone will cause unaligned write
> error. If write pointer is not at the zone start, make mount fail and ask
> users to run fsck.
> 
> The second item is check between the write pointer position and the last
> valid block in the zone. It is unexpected that the last valid block
> position is beyond the write pointer. In such a case, report as the bug.
> Fix is not required for such zone, because the zone is not selected for
> next write operation until the zone get discarded.
> 
> Also move a constant F2FS_REPORT_ZONE from super.c to f2fs.h to use it
> in segment.c also.
> 
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> ---
>  fs/f2fs/f2fs.h    |   3 +
>  fs/f2fs/segment.c | 144 ++++++++++++++++++++++++++++++++++++++++++++++
>  fs/f2fs/super.c   |  11 ++--
>  3 files changed, 154 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 0216282c5b80..e8524be17852 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3137,6 +3137,7 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
>  			unsigned int val, int alloc);
>  void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
>  int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi, bool check_only);
> +int f2fs_check_write_pointer(struct f2fs_sb_info *sbi);
>  int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
>  void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
>  int __init f2fs_create_segment_manager_caches(void);
> @@ -3610,6 +3611,8 @@ static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
>  
>  	return test_bit(zno, FDEV(devi).blkz_seq);
>  }
> +
> +#define F2FS_REPORT_NR_ZONES   4096
>  #endif
>  
>  static inline bool f2fs_hw_should_discard(struct f2fs_sb_info *sbi)
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 2b6e637dd6d3..d00d3f16b750 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4333,6 +4333,128 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
>  
>  #ifdef CONFIG_BLK_DEV_ZONED
>  
> +static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
> +				    struct f2fs_dev_info *fdev,
> +				    struct blk_zone *zone)
> +{
> +	unsigned int s, wp_segno, wp_blkoff, zone_secno, zone_segno, segno;
> +	block_t zone_block, wp_block, last_valid_block, b;
> +	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> +	int i;
> +	struct seg_entry *se;
> +
> +	wp_block = fdev->start_blk + (zone->wp >> log_sectors_per_block);
> +	wp_segno = GET_SEGNO(sbi, wp_block);
> +	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
> +	zone_block = fdev->start_blk + (zone->start >> log_sectors_per_block);
> +	zone_segno = GET_SEGNO(sbi, zone_block);
> +	zone_secno = GET_SEC_FROM_SEG(sbi, zone_segno);

In same manner as I commnted for fsck patch, the zones of this function can be
out of main segment range when size parameter is provided. Will add check to
ensure the zone is within the main segment range.

Will post next version soon, reflectin my comment above.

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
