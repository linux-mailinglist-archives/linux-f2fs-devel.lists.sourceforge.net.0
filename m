Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5480AA307F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2019 09:15:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3b89-0005Z6-Lf; Fri, 30 Aug 2019 07:15:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=138d41eff=shinichiro.kawasaki@wdc.com>)
 id 1i3b88-0005Yr-4h
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Aug 2019 07:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DOdMQrVIQcO8val8eRhG3hMagd7ZLl48xII6RSSDYNs=; b=f1ep7ASQ+KrEF4N7ctbGwoP/4W
 fxCcC2K+SnFjaB1ZgfPDbAHTaUWykIWhuwPoHn8tTqymhCYrQWuEXbWTNJhTfp873NgjkTYXQM/2A
 JnIy6nHWIuz/tcjw3G4LGoK+NCDriV06rmhuG2ayPt6ABB0/fv/0R3r5cAf72Nomz488=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DOdMQrVIQcO8val8eRhG3hMagd7ZLl48xII6RSSDYNs=; b=R/HwnpvlPTo8PnJBBesZJ/lPSU
 uw6n1PniMI977Po0rScHlxxalEbYE7FBvUg6coV6mmJPbKXEadXM+Q7VRqEzQ/v4W5IywV8hpCPX2
 jFvSG7Sg0SFoz79WD+Z5uDaFyAE4AOF3n32KuHBL18E7wTP+pHaLhqWANqU2AuLyu1VU=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3b85-0036Fx-KI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Aug 2019 07:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1567149329; x=1598685329;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=DWRXntb4o+AWqE+JA9A9IBAVeTmvnaAsploxxUDAtVo=;
 b=JJcPX+ldpffAvhqDVDrd3RwSYgCkigWYE9Pmt5+Fc/kJidOJSEjmX5OS
 1WYlm8I9eCG8Vl8DDoyeUBRgy8QS+ChAW2rP44RVlgRx8c4Fv3h4esJ8H
 zxIr//U/3TqSyFxIH5tj9ttu2r1n/yLGGegF+CaWOBqQn8UZipk6/iXvy
 wbaCAeVzKAgpve0zgs4B45j0u2Uk2Ru2CK1S6/2nxRzNB7BLpmMYWKhK/
 hT9ZDMJqOqA4ue+phiLeL2TVDWZjNmqgoYnaTDpJWZYOgjzejxD9oMpyL
 yOwcwXVXN3xvLw19LqgILOdMrfggo8qkh+Luqvw8mLB63P3uUyHj/y1Z+ Q==;
IronPort-SDR: OgYnqhB8gxSFA+5QSPfMYsh1Ofho/BanQlmCDXAuZ5TZcDJnPE3GbQqV3MxPcL+PDBjNBMtZMS
 7APfwdpjOL43Mcb2uc70mmt6N2NRVlklz0NMNi0ntRm4mfPalJZv3Ly1KlUJrJ4wAQmP1z2D0W
 kShHSZeVMgCYlgZXx5coU4wdY/RGYtqgSOlbE8q5n/ikuKxhmI3zk1qGWX2mADa4FYyTiAVhD8
 1JpfH5lWrO397iddoAT/iSSN1hso9kUIfn9LFjq6jK1pvwdRFx6CxNUJR6ws58TCnY3Bsa3GD+
 jGU=
X-IronPort-AV: E=Sophos;i="5.64,446,1559491200"; d="scan'208";a="223688227"
Received: from mail-co1nam05lp2057.outbound.protection.outlook.com (HELO
 NAM05-CO1-obe.outbound.protection.outlook.com) ([104.47.48.57])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2019 15:15:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcDh76DKf7x6j+y6BbuvSjNBn0E9q7hj95ExscF6iUBrACD7WBADZUknt+fMMjbYJDP5E61Nd21UCdiXqIjyaBDn2GHRmHFlR6pz+uZXPu+RanXiYub1e1qIqnZ1Euxe25HfG05BmxpluhikSO/dBCJr9YU6xR5peZX9NvW4vQ+FqQdF2L1YnEIg5jmRwWQB1It8AGttCIg/VEE5hwlRBIR/fgjT8j/QkM4Z9CeRZ5hPWomDFvi+u9g5PMNqluXRCpS17LjcXtV3Bm2Op/ga8xa2Js4vBB285gW3Vkrpe865npENhuh4+oKbR5srsnqyZ4N+S7cp3JqT1XABOpCcSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOdMQrVIQcO8val8eRhG3hMagd7ZLl48xII6RSSDYNs=;
 b=Ub/tU/sn8ltBdAg4XkbpQysYPXr5snaiuAao2p5i6j9b6p9+QvNu29CWX0VAxoC+XmDx1Si1YWQEuBIlXPvaC01f49rhmxbYUP5Z+YJ2v+SJSchhmcmv0LBIDIwhog1ILZIVzAIR/TXTE4lMWJolCkboV3SHfY656jTWgXb8IUdk8vDU1z4Diji8G9oxaAyFjrCeUV0k7oDe29qr7Yji6ERBS5qy1kDrRAHvA9aMyJF5fD3xjd/hoKPOV/uS0mfdfHUbY0ULMF1cSNYUgiz0AYYwHETWnOK6LXUsum1VuqbzRNQdiE/6kX/RhZFpfXweng+xDgToKf3Th5rr92Z/4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOdMQrVIQcO8val8eRhG3hMagd7ZLl48xII6RSSDYNs=;
 b=YfV8Bt+I0kmVeL85LJOl4n2+Y50fHnLQrOwMCN7jp+YYuP7GwWYodonl8cf7zMtBNzBtFR7Q1pFxc5uSFbW6VWbAOA8FD8bKRV4fYj7lSqWz8/zSS3Q+okWsHiR5Ix1ajH7Md0AEspqA4X3FIRAeTlkBrXscSFJeq6bYsBD+l1U=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2172.namprd04.prod.outlook.com (10.167.8.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Fri, 30 Aug 2019 07:15:21 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::31aa:d179:ec71:4a66]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::31aa:d179:ec71:4a66%9]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 07:15:21 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <chao@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH v3 2/2] fsck.f2fs: Check write pointer
 consistency with current segments
Thread-Index: AQHVXjQBkG5zGQnqakOuzUHmGwjk4qcSNWwAgAEThYA=
Date: Fri, 30 Aug 2019 07:15:21 +0000
Message-ID: <20190830071517.yvsg2fqdxkrfya6u@shindev.dhcp.fujisawa.hgst.com>
References: <20190829063531.658-1-shinichiro.kawasaki@wdc.com>
 <20190829063531.658-3-shinichiro.kawasaki@wdc.com>
 <efa52715-bd4f-f0ca-1bef-93eadd9df510@kernel.org>
In-Reply-To: <efa52715-bd4f-f0ca-1bef-93eadd9df510@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e55eb38-fd2e-49b8-4762-08d72d19d1ed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY1PR04MB2172; 
x-ms-traffictypediagnostic: CY1PR04MB2172:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2172EA849078886A7329F657EDBD0@CY1PR04MB2172.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(189003)(199004)(53546011)(5660300002)(316002)(53936002)(86362001)(26005)(66066001)(476003)(11346002)(256004)(14444005)(6916009)(6436002)(7736002)(102836004)(25786009)(76116006)(8676002)(81156014)(186003)(66476007)(66556008)(66446008)(64756008)(4001150100001)(81166006)(446003)(66946007)(4326008)(1076003)(91956017)(6246003)(229853002)(76176011)(14454004)(478600001)(6512007)(6506007)(71190400001)(486006)(71200400001)(99286004)(2906002)(305945005)(8936002)(54906003)(3846002)(58126008)(6486002)(9686003)(6116002)(44832011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2172;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nURnqXBWl38wHKDONtYohlsJV6cbBr/sjiz5tv152HhkEInLVfyLkiy402n4p2f2MefoCiJEMVdFSsagk2Uzpqo8KAflFXnabMDsLw4K69uejqHweUV+tOciIKJdSxWbZBjYj7W92jS5v22SoCwJZ4cZtW6gryJIUipC4k65AddFt/ImJBNREEFb9Mh5OQq3hwKluaI+hzlri0G6E5B9UMT57CNBNnMfaNdiI91XYgd4myDcbX4Kjj6waeMjtZ8Q0POF1RXz6m8R4fy11TxJ870x0+dvdwm7TwMCYa41TGp4j+TwwYiEhgwzpF3EZhbyN2HgBAwaZ2YE84eIwdKwnPjUaVfMo9PMSGivqW6VZr182yjau4DkNy9cSmEOJ+FUWWgv3slgb9PNjUUPIfv77K5jrmH26ZYYKPkWy2MHLZw=
Content-ID: <AA50FB422DE5EA4C88C955175F5DDA78@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e55eb38-fd2e-49b8-4762-08d72d19d1ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 07:15:21.2866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pItB/V40Da810VxIdmnYtRP87rwuNRqfRFnVOZq6RH7mHIfqDIyk6nHhE6Sv79yZVXBO6QR5JtCsolJgCm8y6YhpVLEUIjCjCRxUKwxHZf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2172
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
X-Headers-End: 1i3b85-0036Fx-KI
Subject: Re: [f2fs-dev] [PATCH v3 2/2] fsck.f2fs: Check write pointer
 consistency with current segments
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

On Aug 29, 2019 / 22:49, Chao Yu wrote:
> On 2019-8-29 14:35, Shin'ichiro Kawasaki wrote:
> > On sudden f2fs shutdown, zoned block device status and f2fs current
> > segment positions in meta data can be inconsistent. When f2fs shutdown
> > happens before write operations completes, write pointers of zoned block
> > devices can go further but f2fs meta data keeps current segments at
> > positions before the write operations. After remounting the f2fs, the
> > inconsistency causes write operations not at write pointers and
> > "Unaligned write command" error is reported. This error was observed when
> > xfstests test case generic/388 was run with f2fs on a zoned block device.
> > 
> > To avoid the error, have f2fs.fsck check consistency between each current
> > segment's position and the write pointer of the zone the current segment
> > points to. If the write pointer goes advance from the current segment,
> > fix the current segment position setting at same as the write pointer
> > position. In case the write pointer is behind the current segment, write
> > zero data at the write pointer position to make write pointer position at
> > same as the current segment.
> > 
> > When inconsistencies are found, turn on c.bug_on flag in fsck_verify() to
> > ask users to fix them or not. When inconsistencies get fixed, turn on
> > 'force' flag in fsck_verify() to enforce fixes in following checks. This
> > position fix is done at the beginning of do_fsck() function so that other
> > checks reflect the current segment modification.
> > 
> > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > Reviewed-by: Chao Yu <yuchao0@huawei.com>
> > ---
> >  fsck/fsck.c | 131 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  fsck/fsck.h |   3 ++
> >  fsck/main.c |   2 +
> >  3 files changed, 136 insertions(+)
> > 
> > diff --git a/fsck/fsck.c b/fsck/fsck.c
> > index 8953ca1..f45ca39 100644
> > --- a/fsck/fsck.c
> > +++ b/fsck/fsck.c
> > @@ -2574,6 +2574,123 @@ out:
> >  	return cnt;
> >  }
> >  
> > +struct write_pointer_check_data {
> > +	struct f2fs_sb_info *sbi;
> > +	struct device_info *dev;
> > +};
> > +
> > +static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
> > +{
> > +	struct write_pointer_check_data *wpd = opaque;
> > +	struct f2fs_sb_info *sbi = wpd->sbi;
> > +	struct device_info *dev = wpd->dev;
> > +	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
> > +	block_t zone_block, wp_block, wp_blkoff, cs_block, b;
> > +	unsigned int zone_segno, wp_segno;
> > +	struct seg_entry *se;
> > +	struct curseg_info *cs;
> > +	int cs_index, ret;
> > +	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> > +	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
> > +	void *zero_blk;
> > +
> > +	if (blk_zone_conv(blkz))
> > +		return 0;
> > +
> > +	zone_block = dev->start_blkaddr
> > +		+ (blk_zone_sector(blkz) >> log_sectors_per_block);
> > +	zone_segno = GET_SEGNO(sbi, zone_block);
> > +	wp_block = dev->start_blkaddr
> > +		+ (blk_zone_wp_sector(blkz) >> log_sectors_per_block);
> > +	wp_segno = GET_SEGNO(sbi, wp_block);
> > +	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
> > +
> > +	/* find the curseg which points to the zone */
> > +	for (cs_index = 0; cs_index < NO_CHECK_TYPE; cs_index++) {
> > +		cs = &SM_I(sbi)->curseg_array[cs_index];
> > +		if (zone_segno <= cs->segno &&
> > +		    cs->segno < zone_segno + segs_per_zone)
> > +			break;
> > +	}
> > +
> > +	if (cs_index >= NR_CURSEG_TYPE)
> > +		return 0;
> > +
> > +	/* check write pointer consistency with the curseg in the zone */
> > +	cs_block = START_BLOCK(sbi, cs->segno) + cs->next_blkoff;
> > +	if (wp_block == cs_block)
> > +		return 0;
> > +
> > +	if (!c.fix_on) {
> > +		MSG(0, "Inconsistent write pointer: "
> > +		    "curseg %d[0x%x,0x%x] wp[0x%x,0x%x]\n",
> > +		    cs_index, cs->segno, cs->next_blkoff, wp_segno, wp_blkoff);
> > +		fsck->chk.wp_inconsistent_zones++;
> > +		return 0;
> > +	}
> > +
> > +	/*
> > +	 * If the curseg is in advance from the write pointer, write zero to
> > +	 * move the write pointer forward to the same position as the curseg.
> > +	 */
> > +	if (wp_block < cs_block) {
> > +		ret = 0;
> > +		zero_blk = calloc(BLOCK_SZ, 1);
> > +		if (!zero_blk)
> > +			return -EINVAL;
> > +
> > +		FIX_MSG("Advance write pointer to match with curseg %d: "
> > +			"[0x%x,0x%x]->[0x%x,0x%x]",
> > +			cs_index, wp_segno, wp_blkoff,
> > +			cs->segno, cs->next_blkoff);
> > +		for (b = wp_block; b < cs_block && !ret; b++)
> > +			ret = dev_write_block(zero_blk, b);
> > +
> > +		fsck->chk.wp_fixed_zones++;
> > +		free(zero_blk);
> > +		return ret;
> > +	}
> > +
> > +	/*
> > +	 * If the write pointer is in advance from the curseg, modify the
> > +	 * curseg position to be same as the write pointer.
> > +	 */
> > +	FIX_MSG("Advance curseg %d: [0x%x,0x%x]->[0x%x,0x%x]",
> > +		cs_index, cs->segno, cs->next_blkoff, wp_segno, wp_blkoff);
> > +	se = get_seg_entry(sbi, wp_segno);
> > +	se->type = cs_index;
> > +	cs->segno = wp_segno;
> > +	cs->next_blkoff = wp_blkoff;
> 
> I have one more question, if current zone is closed, will wp_blkoff equal to
> segment size (wp_block equal to zone size)?
> 
> As you know, .next_blkoff should never equal to segment size.

Thank you for catching this. Indeed, this edge condition needs care. When the
write pointer go beyond the current segment and reach to the zone end, the
current segment cannot write in the zone any more. I think a new zone (=section)
should be assigned to the current segment with zero next_blkoff. Will add a new
zone find logic for this edge case and post v4.

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
