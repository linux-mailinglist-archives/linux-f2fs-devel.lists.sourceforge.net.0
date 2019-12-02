Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB67710E7F7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Dec 2019 10:51:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ibiMz-0006pv-4Q; Mon, 02 Dec 2019 09:51:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2324aa620=shinichiro.kawasaki@wdc.com>)
 id 1ibiMc-0006oh-VG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Dec 2019 09:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qrZOAN5ypUKFYxerYaLiTlSmy5M+7GfU1zmohdZAtvs=; b=bvCHLkk+lsU1Bal+gvMukiz6e5
 Dz1j3NEwirZVNQSofgmkBn6dkjBv2ezCT3ie50FH6eTKgoROiIUIM6JxEe8KU+ESSZjGH4JLvG/k3
 bOg8qqmPwFAVVYab2RlOT0o6Nu8tJK8q4TfR/e+bt/zy0mAC/UXTyPowfy3jQuQ/RfIQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qrZOAN5ypUKFYxerYaLiTlSmy5M+7GfU1zmohdZAtvs=; b=Ag+VDWAATw9BJs/tcOTPJBQ69d
 MZ0j2jdjbPYxZQ3xKOtmRaorudZQ3eqroDRprTmQiyMtJkIuulxfDm4oHTPhw03p4ZfBbGpna3K6v
 Lq8j+HyXJxep4gvwNybhpedPwamicIU4zuhCvR+tKxWjgCch24XskY4ZFLGIeG7AiXyE=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ibiMb-002gPd-12
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Dec 2019 09:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1575280297; x=1606816297;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QZkzBkvObJ5ubemZVIZU8mOHsmtsELULDC3mtnLMYhg=;
 b=ZXhQzSG0gJDJclYiTPH6xKWnB/GUkJlHwm3y42lfymJdTv9FZEl9lg0a
 K/QXH2LsEkyUkZSQm4RY7pEwLPheU2iV2EtgyIrip0wbYb4bmGQYFfvCm
 d1hHARaewCTHY1SMsi5fyuoMU1dcRd0C6ge07B0GZhDF/aDPaZmAkjBDW
 9/d+uMDTFliBCWBBieV2nn16Ii4kF2jNlKqheIWdRZsIZqQH17iQUg2OV
 u87qM8qd5R31zstdMjxTD8UI1qK/x7iCncyuzWEf6T5ipjCIA2AiIPsjX
 rmLPFHICXTrkYxILoVKd0OSTu1nif/UkWxn6tBShg9b/S5agESGyQZVBD A==;
IronPort-SDR: Gv+yOpSgNnIiFEiY1zSx+CdxFvjV8jE4R+ScOoA1jNS3bxJhM/v4DSzkZu6s7vA14UTKAbFv35
 r8XRdcASZVhXW1ZZBff3/dM1SlCaYdDW5daFC54e+ajKaYb1c6ChB3l2l/HwWSdM+OydEyIphl
 zdno5C0Lj9/DdMngJBleC15cnEdv1Y7E3MawAfYF+ZeXfcZ2ayb1Mr3M7TTDgYDKzhIgwFY4Ow
 X0KVnf55t6friVgHHLw+O2HevJWrHO5gOt/x6nkls3UP7dc+3cL0zYtkMuzrxLOtBV6VGuFKh9
 1EA=
X-IronPort-AV: E=Sophos;i="5.69,268,1571673600"; d="scan'208";a="225835656"
Received: from mail-sn1nam01lp2055.outbound.protection.outlook.com (HELO
 NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.55])
 by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2019 17:51:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vj60LQGvIi0neiSG99Z48n6HfgeVAJXnND25VhCfJApYQUQuhUyDlgIdEXf4sLmA9l1mmL5N5478l24rs+Guul8aJ8twAfBRgLboCHU22WhTzHZxKoIrwG/eF+/vUUrjPraWE7C2SCssp/x/t/NcM5CXOV5pT0iZZKZiuHbZfsfIYVD/q1UYRo/60ngQXVvo4lknOdAXWWfSV9CG+xNyxoyQukU4tNg25Zwso+tqNCIDgVwZYLxXPvmfKCEBRnKAbbZYZtYCob8TUTBC7YrqUn9XAU6F31qSNHTUZEMVMTsW3XqYy2hQU8Z0PLkR/mDasDmshE3aFnX5+q6P8lu2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrZOAN5ypUKFYxerYaLiTlSmy5M+7GfU1zmohdZAtvs=;
 b=j5J7FakgVBFn9ycnj22u8aUFMZSJE29RxAAAOYa6SFtuO8Yk9ZY52jvr6svok5IKb+tcJ8LVp1cc5eP4E6bRwVuwKw2Dahnge6rmgs1F9fe6jMtagPF1KB3sFGTae6unbx8fvXWByEz0A+hOaPMGa24VyfAf4djg58IrmmcXsUlCY/KVOZi0K5dojEnqvWJHGFPwxoXbkm47jqaneOKmVqTCQDHp+S9UXefeGGF/XUZw/IK/XKjKC1vlpiyISnU6wZrN8amKFAuPWJiEUg6RPdJoqsinm140LqbxRf47pVSTYRvF1gyaPwNT5lpSTZLO5W5Ga2gmVSHBgieu2nHRcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrZOAN5ypUKFYxerYaLiTlSmy5M+7GfU1zmohdZAtvs=;
 b=klyzgG9yETXqbosfvqm3EZ9BkN7nKCqvsu/KAl3NxYLUHZg4CbkhRaQ9ZCzydMXM2QWkABUPcyajl7aeyI5D/v3GswdnlV9n77y9+lYtMmE0K/bt6ohSEKLbinNPTJThmzsx0VimKpBvZUuuwNgf9MDyMGC9ems4rfQcdALI4Fo=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2284.namprd04.prod.outlook.com (10.167.10.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Mon, 2 Dec 2019 09:51:22 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74%11]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 09:51:22 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v3 2/2] f2fs: Check write pointer consistency of non-open
 zones
Thread-Index: AQHVmsQ1/tXr1sFkrUSDqUXUZZ3t/aebkOuAgASTlQCAAHfIgIABF/sAgAG7dQCAAr0kgIAAiauA
Date: Mon, 2 Dec 2019 09:51:21 +0000
Message-ID: <20191202095113.3aaxfncpbb2qxdfp@shindev.dhcp.fujisawa.hgst.com>
References: <20191114081903.312260-1-shinichiro.kawasaki@wdc.com>
 <20191114081903.312260-3-shinichiro.kawasaki@wdc.com>
 <52e3648c-999e-d09b-4af8-26cb213171d8@huawei.com>
 <20191128053100.han73koggbr7uk7a@shindev.dhcp.fujisawa.hgst.com>
 <fabfdebd-1403-9c37-cf68-71faa525c539@huawei.com>
 <20191129052148.kgx6ahy2zu4rrsvq@shindev.dhcp.fujisawa.hgst.com>
 <6d29c4f8-842f-9a48-9ec8-e0707f37d97b@huawei.com>
 <20191202013829.zdc4w3wnofe2thmb@shindev.dhcp.fujisawa.hgst.com>
In-Reply-To: <20191202013829.zdc4w3wnofe2thmb@shindev.dhcp.fujisawa.hgst.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 58254580-fbd6-490c-54aa-08d7770d3018
x-ms-traffictypediagnostic: CY1PR04MB2284:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2284DEF33A9336FFA789935CED430@CY1PR04MB2284.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:139;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(199004)(189003)(3846002)(6116002)(76116006)(11346002)(6486002)(54906003)(305945005)(5660300002)(6916009)(14444005)(1076003)(26005)(6512007)(9686003)(4326008)(6246003)(81166006)(81156014)(8936002)(8676002)(6436002)(2906002)(7736002)(66066001)(186003)(229853002)(66476007)(64756008)(446003)(66556008)(256004)(66446008)(91956017)(76176011)(14454004)(71190400001)(71200400001)(66946007)(25786009)(102836004)(53546011)(86362001)(6506007)(316002)(99286004)(44832011)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2284;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0XwiE7x3Iomzo5zXbfHh8XhpE/x/XYGtTluhmY3XXeuyGayA7cj6X7LJdGsobkaCR2vzHBAixl+a2PCl1dEvVrfMSESI1UiuwORkPZcBv1k+6nEt+JVtIAcnjtGREUggRwU3f7tcwzsMrD0pN7BQloL2VpAl0zVAFeit1sPXVFWW4HgrgUgNFGFbX4wGRuTONYc7/PMQGcXYzGJSeoivg5/MU7apCCLDdm+dApFNdigJ9LWlx9BJy5S1tZ4A/XvxYPnRd+J6KDJqZeQGx7YicfSQSRSk/2edc/CZy1D8KIrRZHfe/hVPs66lOrGj87FLyqVmbjFL+g1mOA9LdixnMixQzvi4dW2i4oqBmrIk3q6zQaP/HBkSPQrvTG1TmfTH+8kn89IuycjkMrGm3x09wj2ihsry1pzZDbN8GoSRN8naMTLypnO7Wl1JIBzuSYkH
Content-ID: <51798230BDC7B74E9405CB9DB16C9ABF@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58254580-fbd6-490c-54aa-08d7770d3018
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 09:51:21.8866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JD/C0+g4oEQGvsT9+I0TEqpxFNzPylzbwh9EVxJF62HeGcGdy0KMqIBJJikFP3PatytnlEse+8wIm93TZaGLjhvsdwPCzNuzB6cof6IkK7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2284
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ibiMb-002gPd-12
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

On Dec 02, 2019 / 10:38, Shin'ichiro Kawasaki wrote:
> On Nov 30, 2019 / 15:49, Chao Yu wrote:
> > On 2019/11/29 13:21, Shinichiro Kawasaki wrote:
> > > On Nov 28, 2019 / 20:39, Chao Yu wrote:
> > >> On 2019/11/28 13:31, Shinichiro Kawasaki wrote:
> > >>> On Nov 25, 2019 / 15:37, Chao Yu wrote:
> > >>>> On 2019/11/14 16:19, Shin'ichiro Kawasaki wrote:
> > >>>>> To catch f2fs bugs in write pointer handling code for zoned block
> > >>>>> devices, check write pointers of non-open zones that current segments do
> > >>>>> not point to. Do this check at mount time, after the fsync data recovery
> > >>>>> and current segments' write pointer consistency fix. Or when fsync data
> > >>>>> recovery is disabled by mount option, do the check when there is no fsync
> > >>>>> data.
> > >>>>>
> > >>>>> Check two items comparing write pointers with valid block maps in SIT.
> > >>>>> The first item is check for zones with no valid blocks. When there is no
> > >>>>> valid blocks in a zone, the write pointer should be at the start of the
> > >>>>> zone. If not, next write operation to the zone will cause unaligned write
> > >>>>> error. If write pointer is not at the zone start, make mount fail and ask
> > >>>>> users to run fsck.
> > >>>>>
> > >>>>> The second item is check between the write pointer position and the last
> > >>>>> valid block in the zone. It is unexpected that the last valid block
> > >>>>> position is beyond the write pointer. In such a case, report as a bug.
> > >>>>> Fix is not required for such zone, because the zone is not selected for
> > >>>>> next write operation until the zone get discarded.
> > >>>>>
> > >>>>> Also move a constant F2FS_REPORT_ZONE from super.c to f2fs.h to use it
> > >>>>> in segment.c also.
> > >>>>>
> > >>>>> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > >>>>> ---
> > >>>>>  fs/f2fs/f2fs.h    |   3 +
> > >>>>>  fs/f2fs/segment.c | 149 ++++++++++++++++++++++++++++++++++++++++++++++
> > >>>>>  fs/f2fs/super.c   |  16 ++++-
> > >>>>>  3 files changed, 165 insertions(+), 3 deletions(-)
> > >>>>>
> > >>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > >>>>> index a2e24718c13b..1bb64950d793 100644
> > >>>>> --- a/fs/f2fs/f2fs.h
> > >>>>> +++ b/fs/f2fs/f2fs.h
> > >>>>> @@ -3137,6 +3137,7 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
> > >>>>>  			unsigned int val, int alloc);
> > >>>>>  void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
> > >>>>>  int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi);
> > >>>>> +int f2fs_check_write_pointer(struct f2fs_sb_info *sbi);
> > >>>>>  int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
> > >>>>>  void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
> > >>>>>  int __init f2fs_create_segment_manager_caches(void);
> > >>>>> @@ -3610,6 +3611,8 @@ static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
> > >>>>>  
> > >>>>>  	return test_bit(zno, FDEV(devi).blkz_seq);
> > >>>>>  }
> > >>>>> +
> > >>>>> +#define F2FS_REPORT_NR_ZONES   4096
> > >>>>>  #endif
> > >>>>>  
> > >>>>>  static inline bool f2fs_hw_should_discard(struct f2fs_sb_info *sbi)
> > >>>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > >>>>> index 6ece146dab34..29e3b6f62f8c 100644
> > >>>>> --- a/fs/f2fs/segment.c
> > >>>>> +++ b/fs/f2fs/segment.c
> > >>>>> @@ -4333,6 +4333,133 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
> > >>>>>  
> > >>>>>  #ifdef CONFIG_BLK_DEV_ZONED
> > >>>>>  
> > >>>>> +static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
> > >>>>> +				    struct f2fs_dev_info *fdev,
> > >>>>> +				    struct blk_zone *zone)
> > >>>>> +{
> > >>>>> +	unsigned int wp_segno, wp_blkoff, zone_secno, zone_segno, segno;
> > >>>>> +	block_t zone_block, wp_block, last_valid_block;
> > >>>>> +	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> > >>>>> +	int i, s, b;
> > >>>>> +	struct seg_entry *se;
> > >>>>> +
> > >>>>> +	wp_block = fdev->start_blk + (zone->wp >> log_sectors_per_block);
> > >>>>> +	wp_segno = GET_SEGNO(sbi, wp_block);
> > >>>>> +	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
> > >>>>> +	zone_block = fdev->start_blk + (zone->start >> log_sectors_per_block);
> > >>>>> +	zone_segno = GET_SEGNO(sbi, zone_block);
> > >>>>> +	zone_secno = GET_SEC_FROM_SEG(sbi, zone_segno);
> > >>>>> +
> > >>>>> +	if (zone_segno >= MAIN_SEGS(sbi))
> > >>>>> +		return 0;
> > >>>>> +
> > >>>>> +	/*
> > >>>>> +	 * Skip check of zones cursegs point to, since
> > >>>>> +	 * fix_curseg_write_pointer() checks them.
> > >>>>> +	 */
> > >>>>> +	for (i = 0; i < NO_CHECK_TYPE; i++)
> > >>>>> +		if (zone_secno == GET_SEC_FROM_SEG(sbi,
> > >>>>> +						   CURSEG_I(sbi, i)->segno))
> > >>>>> +			return 0;
> > >>>>> +
> > >>>>> +	/*
> > >>>>> +	 * Get last valid block of the zone.
> > >>>>> +	 */
> > >>>>> +	last_valid_block = zone_block - 1;
> > >>>>> +	for (s = sbi->segs_per_sec - 1; s >= 0; s--) {
> > >>>>> +		segno = zone_segno + s;
> > >>>>> +		se = get_seg_entry(sbi, segno);
> > >>>>> +		for (b = sbi->blocks_per_seg - 1; b >= 0; b--)
> > >>>>> +			if (f2fs_test_bit(b, se->cur_valid_map)) {
> > >>>>> +				last_valid_block = START_BLOCK(sbi, segno) + b;
> > >>>>> +				break;
> > >>>>> +			}
> > >>>>> +		if (last_valid_block >= zone_block)
> > >>>>> +			break;
> > >>>>> +	}
> > >>>>> +
> > >>>>> +	/*
> > >>>>> +	 * If last valid block is beyond the write pointer, report the
> > >>>>> +	 * inconsistency. This inconsistency does not cause write error
> > >>>>> +	 * because the zone will not be selected for write operation until
> > >>>>> +	 * it get discarded. Just report it.
> > >>>>> +	 */
> > >>>>> +	if (last_valid_block >= wp_block) {
> > >>>>> +		f2fs_notice(sbi, "Valid block beyond write pointer: "
> > >>>>> +			    "valid block[0x%x,0x%x] wp[0x%x,0x%x]",
> > >>>>> +			    GET_SEGNO(sbi, last_valid_block),
> > >>>>> +			    GET_BLKOFF_FROM_SEG0(sbi, last_valid_block),
> > >>>>> +			    wp_segno, wp_blkoff);
> > >>>>> +		return 0;
> > >>>>> +	}
> > >>>>> +
> > >>>>> +	/*
> > >>>>> +	 * If there is no valid block in the zone and if write pointer is
> > >>>>> +	 * not at zone start, report the error to run fsck.
> > >>>>
> > >>>> So we only need to report this as inconsistent status in the condition of
> > >>>> discard has been triggered, right? otherwise, f2fs will trigger discard later
> > >>>> to reset zone->wp before opening this zone?
> > >>>
> > >>> Hmm, my intent was to catch the inconsistency at mount time, assuming the
> > >>> inconsistency is not expected at mount time. In other words, I assume that
> > >>> discard is triggered for zones without valid blocks before that last clean
> > >>
> > >> IIUC, if there is too many pending discards, put_super() may drop discard entries
> > >> to avoid delaying umount, so we can not assume all discards are always being
> > >> triggered.
> > > 
> > > I see. In this case, current code in the patch will miss-detect the zone with
> > > the dropped discard entries. This is not good. Thank you for catching this :)
> > > 
> > >>
> > >> So what I mean is for the condition of a) there is valid (including fsycned) block,
> > >> b) zone->wp is not at correct position, f2fs can handle it by issuing discard. Let
> > >> me know if I misread this comment.
> > > 
> > > For the condition a), do you mean "there is _no_ valid (include fsynced) block"?
> > 
> > Oops, yes, I meant that. :)
> 
> OK, will add the discard by reset zone and will post next version. Thanks.
> 
> Also, I noticed that this patch series have conflicts with the latest linux
> kernel master branch because of the commit d41003513e61 "block: rework zone
> reporting", which changed interface of blkdev_report_zones() function.
> Will rebase to the master branch and resolve the conflicts.

I have sent out the v4 series. As always, review will be appreciated.

I noticed that the conditions a) and b) can be applied to a check logic in the
1st patch also. It checks that the newly assigned zones to cursegs have write
pointers at zone start. If not, the v3 patch reports an error for fsck run. I
replaced the error report with discard by reset zone in same manner as the 2nd
patch. With this change, no longer need to ask fsck run. A little bit simpler.

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
