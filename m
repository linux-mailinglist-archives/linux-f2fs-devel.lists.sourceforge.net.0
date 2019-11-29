Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A3610D0DB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Nov 2019 06:22:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iaYjP-00088O-Lu; Fri, 29 Nov 2019 05:22:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=229f646d3=shinichiro.kawasaki@wdc.com>)
 id 1iaYjN-000889-Ao
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Nov 2019 05:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n6rhSFH1GRk9txMO9GSew5+zp/rGTWoBczABwGLOhHs=; b=WIjp/LFtt2YZEDCVwaM8a6YsYn
 WEEmitw/uq72eHenY++bE6yUJ7L9FPZUEwWrxEC5ovnbq36b/02sH8JjGrgphL1eWTgbwf8oYp7f8
 j1PRNPcs9FgbfcTmVPc5BhKmF0d0wkJPz7F0Z1ylRQVjKv1JpAmtN/GfeKomphDyCAzY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n6rhSFH1GRk9txMO9GSew5+zp/rGTWoBczABwGLOhHs=; b=B1memnLhlDYUZXsxNsXCIRcBj2
 KGhmIBXpra0wsqgEnsXE7stHOmuRlj/Sdv2kZPrDulUoN1zYh/dxdVO8xSETCepx/2fQ8g6bF6TqR
 evueJ5v/IV6AYclNUiaMfdEEeTf0fIR5KXhOk1rC2rIBtR1pj42nW9u7QucwFYACURxQ=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iaYjJ-00AkIW-K1
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Nov 2019 05:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1575004943; x=1606540943;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=beheqMUf6XSl2DTu4iLBrabnYRJL1cSYZygab9l/iQo=;
 b=hRLUIqOqup/C7ApRtZf1zT2DmgbN7tnRxyPa2AjvRDgnEjleoGjojqoM
 C6m9dIuC8CEKbPW27tPZHmRTduZe0Se6KAz2l0DWSY1ybp9H4dRdbAUJQ
 XfOki1KRJHHpKUkEeIZYtp/BCmcJNzgQB9Q/C7mVrFWiAhhRepDM6vG8S
 HRH1veyZ3QSWdAEcqzCinZ9kNVMWb86wzD2vepl1V5o8C9YqxkUEOdeoS
 /Ty7IKbKmWNn2k2z18fGLRl0qJXvtO1qkNrUc8zvbXDi4B4tffZemGM8V
 fk9sNWJKKyjZXwsAc0RFnQuWlK+uZqdhZry+m868qon+LqtW7sb8tDlCU Q==;
IronPort-SDR: JRzLDBdZAvaSJe4jgsVX8XbM/2Gfg+OSV6Oy6hQ5Nx3pEES5gZi1nkUWv6gqRz4LOzgXE+XoXL
 v5d+IOTM8eNiXz6zij67RqzRiO+gwpENHBx8UnzFc6e97wBw+61uyNszBQQeK62PqP5v1h/dYO
 J7K6ntwi6wC/ckFRRPNpIG7rrCcToNctfXkRLwVnuykfZQnNdNxBMZ+ivDL1VYy4kL1lkWTFVj
 FiG1LFiIOiiXd0fXFD0mAnPx23u9WIZSA5TsA71SsInp3yWZ6I+B2V1aadL4fcwPPHg2I0Rhch
 vTs=
X-IronPort-AV: E=Sophos;i="5.69,256,1571673600"; d="scan'208";a="225660761"
Received: from mail-sn1nam01lp2051.outbound.protection.outlook.com (HELO
 NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.51])
 by ob1.hgst.iphmx.com with ESMTP; 29 Nov 2019 13:22:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdzkc0Vw2T+VvhkZ4tUKBKJqcJccL2GmRfya2iqDee0YXpYOe+nk4O30k+65H3lqExNewAQGPyRuZAZoMOucBWPruXPrISEd6soXU70WrY8LdiCqZiNrdLQn060sN6Mc33amsimIu+C8t0pgT8P6LuENWj97UwHn2LeBCVfRndpmcY1SpyYKmska8lVqxr4Ne4xWBYr2NQAWNyDS3GcQlboh3BGwrmzGI62+upBO2kpopoiBYP7LFG9NJNnX/UD6w8B4DTke7XN2boLs+3EeIOuX9gGq076i6vFqG3b4okUMc9YEWceNSg68jVuTT7TT4ifQdsIpAImmwpNoZkerGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6rhSFH1GRk9txMO9GSew5+zp/rGTWoBczABwGLOhHs=;
 b=dfgcGI8qYfiGsPnEttloHCLSOlHXcYB6tlW86mVy9pbLFSmRVN01semq1Thm4Jv65FFRntF7WU22H6i0L859IetETBJibdjI1tCfr7e75Lk6H0FUWRPZ+EKSno0ulEr2hj7IjKQTafBqg59WXFHqUv2ZslQNLaZ6JqHmWFGWF6zVOVE0meo3OwLvxXjuRGT6pgr3nxpR+k8O3FTwyr/vUOSruALKvAaYQaOHdOGpXWNOqeRfIJXhI6/WZSnwH4eaPDT+A+cesO69FOXM/XsQjHxJCVYaNYhI/uj1mLoCEaHn2dWT63sEDTTdRq7bZfGuKxGdDKz+vgS6i5yKnDBG7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6rhSFH1GRk9txMO9GSew5+zp/rGTWoBczABwGLOhHs=;
 b=n50UCPoImsR3oZTEfM1eGT/pDKqqUWetmCbQlGUePMbNEFOxaYuA/Y8O/XrlWJ5DEdZek5xjKqktJkdwK30rf8j1EEj0CDv7K0bR66EX7h5YYTzzLuCdTxqK8Qae9hWEYkm2OhhzNytQV53D6fZltNl3tI9khjDOEws5QPgJ460=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2332.namprd04.prod.outlook.com (10.167.10.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Fri, 29 Nov 2019 05:21:56 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74%11]) with mapi id 15.20.2495.014; Fri, 29 Nov
 2019 05:21:56 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v3 2/2] f2fs: Check write pointer consistency of non-open
 zones
Thread-Index: AQHVmsQ1/tXr1sFkrUSDqUXUZZ3t/aebkOuAgASTlQCAAHfIgIABF/sA
Date: Fri, 29 Nov 2019 05:21:56 +0000
Message-ID: <20191129052148.kgx6ahy2zu4rrsvq@shindev.dhcp.fujisawa.hgst.com>
References: <20191114081903.312260-1-shinichiro.kawasaki@wdc.com>
 <20191114081903.312260-3-shinichiro.kawasaki@wdc.com>
 <52e3648c-999e-d09b-4af8-26cb213171d8@huawei.com>
 <20191128053100.han73koggbr7uk7a@shindev.dhcp.fujisawa.hgst.com>
 <fabfdebd-1403-9c37-cf68-71faa525c539@huawei.com>
In-Reply-To: <fabfdebd-1403-9c37-cf68-71faa525c539@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d080a738-68fc-4537-3e3c-08d7748c0d48
x-ms-traffictypediagnostic: CY1PR04MB2332:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2332959E253D2D339C7178D1ED460@CY1PR04MB2332.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0236114672
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(189003)(199004)(54906003)(86362001)(30864003)(1076003)(7736002)(2906002)(71200400001)(26005)(14454004)(3846002)(6116002)(25786009)(71190400001)(478600001)(316002)(305945005)(6916009)(99286004)(11346002)(53546011)(66946007)(446003)(76116006)(91956017)(64756008)(66446008)(66476007)(102836004)(186003)(66556008)(76176011)(6246003)(6506007)(66066001)(256004)(14444005)(4326008)(229853002)(9686003)(6512007)(44832011)(8936002)(81156014)(8676002)(5660300002)(6436002)(6486002)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2332;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F2uuTB6pfNYTLSwmGV6d9XGVEyrVoqO8bbuANPW4MAyNBNsFzqL/DAYmVLggspsdF4g5NOUlPIHfbjpsk4XYfJ+Mnpdmy311MtdOVEebGfeUdr/Z9BBNrUWI4CE0qnNy6hksaREw+YnA7gMxWAS9Ia7maRZU4ANSi6vG8tyZQXE1/WH/DWNXIG3HRdEqwhK1MPafxWgppI3WnsJiXAhQKZsRh+Pf10XuH/9BUYZoJ5VZHpfUMzuEc2XFrhRPp/Hi2m5lX5Ve+i6+7EzgEf+Z1KglugArqiRqivc1Q28v68wOTpw9UGpxoWJafMsIeqfihFeiGA1Us78d3ZlSmmT0Wh9ia5y3j2IN3xBpHIb96qOsVAqGWXpoQKYb8zp6aMM5d7XlIs5idIfklGeTZIhDuYEfBq1/aP16YNsxntHjiYI7QEVNKB3CIOM/3F2qG97R
Content-ID: <DF446DFDADEB064581A484C4CD680FD2@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d080a738-68fc-4537-3e3c-08d7748c0d48
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2019 05:21:56.2346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ZJeIa99lsHNTEjiPeJDUSO41mRXa6ohAsMHnBkV4ngd/eqaoXlzOcBpadAUz2isgr+IS65weehQePCoKtfcmaUBzLUgv6JEmNKWSmZek9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2332
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iaYjJ-00AkIW-K1
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: Check write pointer consistency
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

On Nov 28, 2019 / 20:39, Chao Yu wrote:
> On 2019/11/28 13:31, Shinichiro Kawasaki wrote:
> > On Nov 25, 2019 / 15:37, Chao Yu wrote:
> >> On 2019/11/14 16:19, Shin'ichiro Kawasaki wrote:
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
> >>> error. If write pointer is not at the zone start, make mount fail and ask
> >>> users to run fsck.
> >>>
> >>> The second item is check between the write pointer position and the last
> >>> valid block in the zone. It is unexpected that the last valid block
> >>> position is beyond the write pointer. In such a case, report as a bug.
> >>> Fix is not required for such zone, because the zone is not selected for
> >>> next write operation until the zone get discarded.
> >>>
> >>> Also move a constant F2FS_REPORT_ZONE from super.c to f2fs.h to use it
> >>> in segment.c also.
> >>>
> >>> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> >>> ---
> >>>  fs/f2fs/f2fs.h    |   3 +
> >>>  fs/f2fs/segment.c | 149 ++++++++++++++++++++++++++++++++++++++++++++++
> >>>  fs/f2fs/super.c   |  16 ++++-
> >>>  3 files changed, 165 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> >>> index a2e24718c13b..1bb64950d793 100644
> >>> --- a/fs/f2fs/f2fs.h
> >>> +++ b/fs/f2fs/f2fs.h
> >>> @@ -3137,6 +3137,7 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
> >>>  			unsigned int val, int alloc);
> >>>  void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
> >>>  int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi);
> >>> +int f2fs_check_write_pointer(struct f2fs_sb_info *sbi);
> >>>  int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
> >>>  void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
> >>>  int __init f2fs_create_segment_manager_caches(void);
> >>> @@ -3610,6 +3611,8 @@ static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
> >>>  
> >>>  	return test_bit(zno, FDEV(devi).blkz_seq);
> >>>  }
> >>> +
> >>> +#define F2FS_REPORT_NR_ZONES   4096
> >>>  #endif
> >>>  
> >>>  static inline bool f2fs_hw_should_discard(struct f2fs_sb_info *sbi)
> >>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> >>> index 6ece146dab34..29e3b6f62f8c 100644
> >>> --- a/fs/f2fs/segment.c
> >>> +++ b/fs/f2fs/segment.c
> >>> @@ -4333,6 +4333,133 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
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
> >>> +	int i, s, b;
> >>> +	struct seg_entry *se;
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
> >>> +	 * not at zone start, report the error to run fsck.
> >>
> >> So we only need to report this as inconsistent status in the condition of
> >> discard has been triggered, right? otherwise, f2fs will trigger discard later
> >> to reset zone->wp before opening this zone?
> > 
> > Hmm, my intent was to catch the inconsistency at mount time, assuming the
> > inconsistency is not expected at mount time. In other words, I assume that
> > discard is triggered for zones without valid blocks before that last clean
> 
> IIUC, if there is too many pending discards, put_super() may drop discard entries
> to avoid delaying umount, so we can not assume all discards are always being
> triggered.

I see. In this case, current code in the patch will miss-detect the zone with
the dropped discard entries. This is not good. Thank you for catching this :)

> 
> So what I mean is for the condition of a) there is valid (including fsycned) block,
> b) zone->wp is not at correct position, f2fs can handle it by issuing discard. Let
> me know if I misread this comment.

For the condition a), do you mean "there is _no_ valid (include fsynced) block"?
If so, yes, I agree that f2fs can issue discard and both a) and b) are true. I
can add a simple function call of "reset zone" to discard the zone.

> 
> > umount. If the last sudden f2fs shutdown without clean umount caused the
> > inconsistency, it should be reported and fixed, I think.
> > 
> > SIT valid blocks are referred to check if there is no valid blocks in the zone.
> > SIT may be broken due to software bug or hardware flaw, then I think it is the
> > better to run fsck rather than discard by f2fs.
> > 
> > If I miss anything, please let me know.
> > 
> > --
> > Best Regards,
> > Shin'ichiro Kawasaki
> > 
> >>
> >> Thanks,
> >>
> >>> +	 */
> >>> +	if (last_valid_block + 1 == zone_block && zone->wp != zone->start) {
> >>> +		f2fs_notice(sbi,
> >>> +			    "Zone without valid block has non-zero write "
> >>> +			    "pointer, run fsck to fix: wp[0x%x,0x%x]",
> >>> +			    wp_segno, wp_blkoff);
> >>> +		f2fs_stop_checkpoint(sbi, true);
> >>> +		set_sbi_flag(sbi, SBI_NEED_FSCK);
> >>> +		return -EINVAL;
> >>> +	}
> >>> +
> >>> +	return 0;
> >>> +}
> >>> +
> >>> +static int check_dev_write_pointer(struct f2fs_sb_info *sbi,
> >>> +				   struct f2fs_dev_info *fdev) {
> >>> +	sector_t nr_sectors = fdev->bdev->bd_part->nr_sects;
> >>> +	sector_t sector = 0;
> >>> +	struct blk_zone *zones;
> >>> +	unsigned int i, nr_zones;
> >>> +	unsigned int n = 0;
> >>> +	int err = -EIO;
> >>> +
> >>> +	if (!bdev_is_zoned(fdev->bdev))
> >>> +		return 0;
> >>> +
> >>> +	zones = f2fs_kzalloc(sbi,
> >>> +			     array_size(F2FS_REPORT_NR_ZONES,
> >>> +					sizeof(struct blk_zone)),
> >>> +			     GFP_KERNEL);
> >>> +	if (!zones)
> >>> +		return -ENOMEM;
> >>> +
> >>> +	/* Get block zones type */
> >>> +	while (zones && sector < nr_sectors) {
> >>> +
> >>> +		nr_zones = F2FS_REPORT_NR_ZONES;
> >>> +		err = blkdev_report_zones(fdev->bdev, sector, zones, &nr_zones);
> >>> +		if (err)
> >>> +			break;
> >>> +		if (!nr_zones) {
> >>> +			err = -EIO;
> >>> +			break;
> >>> +		}
> >>> +
> >>> +		for (i = 0; i < nr_zones; i++) {
> >>> +			if (zones[i].type == BLK_ZONE_TYPE_SEQWRITE_REQ) {
> >>> +				err = check_zone_write_pointer(sbi, fdev,
> >>> +							       &zones[i]);
> >>> +				if (err)
> >>> +					break;
> >>> +			}
> >>> +			sector += zones[i].len;
> >>> +			n++;
> >>> +		}
> >>> +		if (err)
> >>> +			break;
> >>> +	}
> >>> +
> >>> +	kvfree(zones);
> >>> +
> >>> +	return err;
> >>> +}
> >>> +
> >>>  static struct f2fs_dev_info *get_target_zoned_dev(struct f2fs_sb_info *sbi,
> >>>  						  block_t zone_blkaddr)
> >>>  {
> >>> @@ -4399,6 +4526,10 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
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
> >>> @@ -4444,11 +4575,29 @@ int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
> >>>  
> >>>  	return 0;
> >>>  }
> >>> +
> >>> +int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
> >>> +{
> >>> +	int i, ret;
> >>> +
> >>> +	for (i = 0; i < sbi->s_ndevs; i++) {
> >>> +		ret = check_dev_write_pointer(sbi, &FDEV(i));
> >>> +		if (ret)
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
> >>> index 1443cee15863..8ca772670c67 100644
> >>> --- a/fs/f2fs/super.c
> >>> +++ b/fs/f2fs/super.c
> >>> @@ -2890,8 +2890,6 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
> >>>  	if (!FDEV(devi).blkz_seq)
> >>>  		return -ENOMEM;
> >>>  
> >>> -#define F2FS_REPORT_NR_ZONES   4096
> >>> -
> >>>  	zones = f2fs_kzalloc(sbi,
> >>>  			     array_size(F2FS_REPORT_NR_ZONES,
> >>>  					sizeof(struct blk_zone)),
> >>> @@ -3509,7 +3507,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
> >>>  
> >>>  		err = f2fs_recover_fsync_data(sbi, false);
> >>>  		if (err < 0) {
> >>> -			if (err != -ENOMEM)
> >>> +			if (err != -ENOMEM &&
> >>> +			    !is_sbi_flag_set(sbi, SBI_NEED_FSCK))
> >>>  				skip_recovery = true;
> >>>  			need_fsck = true;
> >>>  			f2fs_err(sbi, "Cannot recover all fsync data errno=%d",
> >>> @@ -3525,6 +3524,17 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
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
> >>> .
> > 

--
Best Regards,
Shin'ichiro Kawasaki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
