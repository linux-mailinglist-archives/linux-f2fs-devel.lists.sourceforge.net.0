Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FABF3EE4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 05:27:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSvrr-00041Z-Rs; Fri, 08 Nov 2019 04:27:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=208c614f7=shinichiro.kawasaki@wdc.com>)
 id 1iSvrq-00041M-ET
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 04:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G2jPpUR3BAuhJxTonj++PcTlau3kNKbwyzFnJJLVcTE=; b=h2vrO7KGCBfbcAaaEGsfBeNZ7G
 qEKuRLahKVdnRDJI+6+iTMku8ZfVs6FZSmnnPd7eEp5LwUP0rFNuXO5DQd73HkDlwqvSbijzyf4dl
 yO2Xm3DzlyXgiyJDyO+do923/Bnw5oTQ4L3PhsnRDBwAEM0tfzibdRI8klN25JSJb750=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G2jPpUR3BAuhJxTonj++PcTlau3kNKbwyzFnJJLVcTE=; b=DisRjUiW97eAA1t4cxougaFEgu
 EPIBB2P8z05B8WMiXwhYHu7SIABzDG51EAuzr2pqDPNLC/wRmsQbxszbL37uaUDi8HKj6pDhrE2ad
 ya4GSBbQ+P9QCL3nfTYO3tve9a08A7bjtdcOtjbwXMtWGCU2upTX5TWkXSxEg4AaFy2I=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSvrj-004U2E-OG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 04:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573187240; x=1604723240;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3JcmIFgph2LBoaB8vYpKCn4c9YekwxjapVw3cUogjls=;
 b=M1+5PDV3LlfXFV5wpsVozKgkj00yAuTY2ZSiJeRXanPjfRu4zhCfLrTj
 jKVOYfZuQ2VUahvYmI64w6LRmljF96VIAkKcNEEnkd09J3mT4a83avcYB
 l3W5fLM6MKLvgawJPL2N0qP6oBW/I44rMlaYiVLy1XoPdbpOsCUQm+1K1
 87iRtrlF8JlExEPxszwv+gdIx/I0nRvsRKp+MRieNN1Mp90ULqhi3zf0w
 kB4em2JxXiN1oiTco9LuiWhaCTd4OWrFuaNcxnVfH6srnYzqqQrVsmy6s
 Oa21C7w928bUbEWbKPgH04nLSjt+nF8ZpZJ7n3G92g1nzFmsu1ABCYoli Q==;
IronPort-SDR: leGnwV0NUwFAj9/T2rNtrt62NJQL4awqHn2SuJdyqXoxMJaD/bzMkBGhdV8dPzzfjBx3+b+1w1
 D0+4i4VcVfQ6W8vGoCjBC0Rw1s6wN8fdNImjsZkq+mgFvb8i0ZyabQlNlNh0P3YPz0cnlaXcqr
 KOHwBe3sC+qvcjbL3xfihzMY8xTkIb+shLcmnrsXhsVbace0POV2e+ZyM3xaJ3gnF5uqW+GkSm
 eR9G5bPtvtlQHgnma4BZcWmiV5qoywI47QaIF48tx+ad7H9lorN2tP+QaQcDj0rNuumSEr/WjF
 UYU=
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="126874436"
Received: from mail-sn1nam01lp2055.outbound.protection.outlook.com (HELO
 NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.55])
 by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 12:27:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrmIiTEQHTguViMMxBocHGiRi6S+io7L4yT2RdFxd8jPqpYHjR9VGi0LdCo2pcmM+KR/6aC63ZStooU1whCf84U98Ww/eGdz7Uhy2IT7tF5kKdtGEyqvguaBpEJJD8N9sgMgPhATJ9yhNqQ1UEBkvI/F+wYszBk1oARTml86jziV9PtvH5Z3BBSoIfYkX8oH7OzxrcrCTCulg+v66SMiaMeT716sMOXHeh5mQwdJAX0cDAfBO9+Au1fleemncMbTSE4M6dI/h5eXypgRuNZ7RASa+suDUxsdt2xHW06d0PWrveR1kHeZGJ6eBMdVgpiE+aMrWULI6GhVq5bMec0TXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2jPpUR3BAuhJxTonj++PcTlau3kNKbwyzFnJJLVcTE=;
 b=ZmakGjNYlT+85b/8Q+dDNPEHiMqqYC2zLNv6LE+huiLfrllhLc1S4fHyeAZEE2NhVB2hqguTNaOaTyNhKakksQPhlovKU9Ec8Ik6I8snBpIAG7WeALCw2WXVd/QDf5emoahzMZogFGrW5wz8HU/j62IizkY64IaIr3MVQGB1EYkyJ6ZLf3sfTn9CHdRG1Z543xjTfk3y+WXuyJleFKoMlbbc9VmwCvLy5At+ZL0C3ZEORK3KmxZjvlw8WJmEwYTxnJRU6YwDvXYwolKfKQquDeeLYzDNpOQjhYM3JCPlIUTRCjbGg/3m9zhyZCmgqU3/7IQRG678zYZTe2SQgAcqFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2jPpUR3BAuhJxTonj++PcTlau3kNKbwyzFnJJLVcTE=;
 b=rImHHiDoRZlxUsP6Pez9M4n5H5gZvZll5FxVd1mZJHJsxTSTNjQ2SLoy/Hj2Jyoc0R6CiIMJG7PiyohCLE5owPzNv5U1cDRDfzenrPx+m3qGhjS99t6H/4qUEoZ+yr/LqP/KsBuO1DTyFDepm3cc6g0FH4fNzljsqGE4fzoInbs=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2202.namprd04.prod.outlook.com (10.166.206.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Fri, 8 Nov 2019 04:27:08 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74%11]) with mapi id 15.20.2430.020; Fri, 8 Nov 2019
 04:27:08 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v2 2/2] f2fs: Check write pointer consistency of non-open
 zones
Thread-Index: AQHVjV0SlOcJXsIiokaKZmbmvNS61qd8jL+AgAQyFYA=
Date: Fri, 8 Nov 2019 04:27:08 +0000
Message-ID: <20191108042707.3xzzaiojvuhhrbe6@shindev.dhcp.fujisawa.hgst.com>
References: <20191028065801.28220-1-shinichiro.kawasaki@wdc.com>
 <20191028065801.28220-3-shinichiro.kawasaki@wdc.com>
 <673218f1-ced2-132e-a91a-7554b6aad1d9@huawei.com>
In-Reply-To: <673218f1-ced2-132e-a91a-7554b6aad1d9@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d0a8e65a-b84d-4f27-70d0-08d76403eb1b
x-ms-traffictypediagnostic: CY1PR04MB2202:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB22026BCD7511D1465AAA07AAED7B0@CY1PR04MB2202.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:669;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(189003)(199004)(305945005)(229853002)(478600001)(86362001)(476003)(6486002)(81156014)(446003)(256004)(11346002)(66066001)(6436002)(6512007)(8676002)(14444005)(66446008)(6916009)(81166006)(8936002)(14454004)(2906002)(54906003)(486006)(44832011)(3846002)(4326008)(316002)(76116006)(6506007)(99286004)(53546011)(66476007)(76176011)(9686003)(64756008)(186003)(66946007)(66556008)(5660300002)(1076003)(102836004)(91956017)(7736002)(25786009)(71200400001)(6246003)(71190400001)(6116002)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2202;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qfe1XeqSNTHs4mCler7qLpBhNBlKmyIxGapyn0DMvyxV32SS44u8AYVY6ld0WE0z29+uvfXmKMswAE88NB5nX/ZYqAloV5/CCRl8WmQ2JMJ7rSyy2sAzUgqfhuUWIy1fVuSuHdBCzK1VlSNpSSQ/MxjIeq4HZcJY9vyMIfByLc9xE/puzngKE+Z3qSRYgmqMYEaWgKQnmtByfHRj4iiqRMiP+rUJMWmYpfXoXPJBUy5Ff1xMZrCCyRpuzMVXC7z767C/n1YcqOaSazhJvux+eHmwCbXLE3IeIdIONR+Ii9Opim3jzKiY3Dc+6NwWFgRND+7chp8INNJZW4YA4e3xZEcV8I1OC6wV0o/JJB9/4nvRGR0G4c9twj7kZ/fBQABTlygqyZVcFqz8dF/7OU1LcGO24suSM9r+U5u1+EYXGPIUmUCQx5X9YxiRh+3EYw9Y
Content-ID: <A8DFA6D1D8594F47A2C03A4057F35FBA@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a8e65a-b84d-4f27-70d0-08d76403eb1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 04:27:08.6588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lbusfqBB6wsiQjLPKiIiKplMUGFrhXYSZJOVafwUgPm4wZZ3mRm+9PvEgiZjDn+QMg+Ae1uj5IKGUHlGDzqyVZ8FXqnm3k29C0/ftxQI9/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2202
X-Spam-Score: 0.1 (/)
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
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iSvrj-004U2E-OG
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

On Nov 05, 2019 / 20:22, Chao Yu wrote:
> On 2019/10/28 14:58, Shin'ichiro Kawasaki wrote:
> > To catch f2fs bugs in write pointer handling code for zoned block
> > devices, check write pointers of non-open zones that current segments do
> > not point to. Do this check at mount time, after the fsync data recovery
> > and current segments' write pointer consistency fix. Check two items
> > comparing write pointers with valid block maps in SIT.
> > 
> > The first item is check for zones with no valid blocks. When there is no
> > valid blocks in a zone, the write pointer should be at the start of the
> > zone. If not, next write operation to the zone will cause unaligned write
> > error. If write pointer is not at the zone start, make mount fail and ask
> > users to run fsck.
> > 
> > The second item is check between the write pointer position and the last
> > valid block in the zone. It is unexpected that the last valid block
> > position is beyond the write pointer. In such a case, report as the bug.
> > Fix is not required for such zone, because the zone is not selected for
> > next write operation until the zone get discarded.
> > 
> > Also move a constant F2FS_REPORT_ZONE from super.c to f2fs.h to use it
> > in segment.c also.
> > 
> > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > ---
> >  fs/f2fs/f2fs.h    |   3 +
> >  fs/f2fs/segment.c | 147 ++++++++++++++++++++++++++++++++++++++++++++++
> >  fs/f2fs/super.c   |  11 ++--
> >  3 files changed, 157 insertions(+), 4 deletions(-)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 0216282c5b80..e8524be17852 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -3137,6 +3137,7 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
> >  			unsigned int val, int alloc);
> >  void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
> >  int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi, bool check_only);
> > +int f2fs_check_write_pointer(struct f2fs_sb_info *sbi);
> >  int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
> >  void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
> >  int __init f2fs_create_segment_manager_caches(void);
> > @@ -3610,6 +3611,8 @@ static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
> >  
> >  	return test_bit(zno, FDEV(devi).blkz_seq);
> >  }
> > +
> > +#define F2FS_REPORT_NR_ZONES   4096
> >  #endif
> >  
> >  static inline bool f2fs_hw_should_discard(struct f2fs_sb_info *sbi)
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 2b6e637dd6d3..20ef5b3705e1 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -4333,6 +4333,131 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
> >  
> >  #ifdef CONFIG_BLK_DEV_ZONED
> >  
> > +static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
> > +				    struct f2fs_dev_info *fdev,
> > +				    struct blk_zone *zone)
> > +{
> > +	unsigned int s, wp_segno, wp_blkoff, zone_secno, zone_segno, segno;
> > +	block_t zone_block, wp_block, last_valid_block, b;
> > +	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> > +	int i;
> > +	struct seg_entry *se;
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
> > +	 * If a curseg points to the zone, skip check because the zone
> > +	 * may have fsync data that valid block map does not mark.
> 
> None-curseg zone may also contain fsynced data as well? Maybe we can only verify
> on clean image or recovered image?

Right. This function for none-curseg zones should be called after fsync data
recovery. I think my comment above is confusing. The point is that this
function is for none-curseg zones, and other function covers check for curseg
zones. Let me revise the comment as follows:

     Skip check of zones cursegs point to, since fix_curseg_write_pointer()
     checks them.

> 
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
> > +	for (s = 0; s < sbi->segs_per_sec; s++) {
> > +		segno = zone_segno + s;
> > +		se = get_seg_entry(sbi, segno);
> > +		for (b = 0; b < sbi->blocks_per_seg; b++)
> > +			if (f2fs_test_bit(b, se->cur_valid_map))
> > +				last_valid_block = START_BLOCK(sbi, segno) + b;
> > +	}
> 
> We search bitmap table reversedly.

Yes, will reverse the loops in the next post.

> 
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
> > +	 * not at zone start, report the error to run fsck and mark the
> > +	 * zone as used.
> > +	 */
> > +	if (last_valid_block + 1 == zone_block && zone->wp != zone->start) {
> > +		f2fs_notice(sbi,
> > +			    "Zone without valid block has non-zero write "
> > +			    "pointer, run fsck to fix: wp[0x%x,0x%x]",
> > +			    wp_segno, wp_blkoff);
> > +		__set_inuse(sbi, zone_segno);
> 
> Why do we need to set it inused? if this is necessary, we need to call this
> under free_i->segmap_lock.

I once thought that I need to set inconsistent zones in use, because I observed
that write operation happened after zone consistency check failure (in
fill_super() after free_meta label). It caused unaligned writer error. To avoid
it, I added __set_inuse() to keep inconsistent zones not selected for the write
target.

But that write operation happened because the write pointer fix curseg was done
out of the SBI_POR_DOING protection. Now I learned SBI_POR_DOING can protect
write operation, and I don't think set in use for the inconsistent zones is
required. Will remove __set_inuse() calls from this patch and the first patch.

Thanks!

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
