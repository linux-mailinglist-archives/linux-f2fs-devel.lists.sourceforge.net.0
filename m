Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB0EF129F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Nov 2019 10:45:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSHse-0001oq-Qh; Wed, 06 Nov 2019 09:45:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=206437fe6=shinichiro.kawasaki@wdc.com>)
 id 1iSHsc-0001oN-R4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Nov 2019 09:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9PhMyMdxkYUtTesogctaajbXyFm7qpERZt1JJMuNY2U=; b=LS1YLHqNz7eE9domo1EKZSHqC1
 7cUL5cge6aE1i+VUCi4Akwhi1juYppMDMujD16xh9DtK7nM4Tq2iDV3fpLbYMnAIDCn5u0UiZE/S0
 YVO1CMfUlGtYHtW8L2ZQl+YrtlCssRHzOpXfUhBPUu3y7U+LLhTx88Whwjxe/uvDFnIg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9PhMyMdxkYUtTesogctaajbXyFm7qpERZt1JJMuNY2U=; b=DQkq3jc6hZV+GZBtOliBiSFEIt
 dSTwsKRrtEdfDNQMaoab5UxTLbQtpzVD5IsYlTx5jqs6V+2H7Z+x4J9ZBvGu7TYkm0tn5aa7FIVwn
 oTGZJLdC127qyH1yhV3yCxtd8NFACwuVdnVWh0/sWhhH4pH8Z2rN+QEpBRpqUXoAuo8g=;
Received: from [216.71.154.42] (helo=esa4.hgst.iphmx.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSHsX-002hL3-1n
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Nov 2019 09:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573033528; x=1604569528;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XKsI5eEuYjjDi4sRaIEL++nuEbeSWoQrCfrseZIz0K8=;
 b=XpzpWYQYFYEA+sAM9q/5k2HoHBnNif1oaMTHWpmJGCIntYbmvfbg2odO
 5ZNye019JXyUBpP8eZOS6IjBSu15MtonkELfcdwN7zvZ7F7Z6TylalE7b
 qdg0xaQ/iMNYTCWnnt5wgBWuYtPHoDcWO8QTrB6PtCpJGstCAfSMCz2Eq
 DaCG/mdEWUqXRlv2Sw6uwHBjrkq54zngPjL2jzMy7OZbx7PDpzPfmDZS4
 /V+KoHS7MWq0QfGx9eBH5ZF5eJYVOkrHlwbgInrqiKcbTHJ3FjKYSPGGk
 hR7b+kfTJQ51IatyS+eI2/WCq/9rgEK3I5hJVAuotIEYjnaec7CAHV+Xb w==;
IronPort-SDR: Eko+F8EMa3kxS6CbiO2dBG4m/+dIz4R4Rc8s6ZJV55X+qdAGzDhHOlDe21R5aljpBHoq+k/qp+
 84s4KZTGpIwgPhujgCWh6BLqpzvC8OL5Dy7BuxL8JVNoxX48nKrWTu99mEMSKRmVZ2fto+sg87
 jEg3j39vakLrlfkryIXbJREFHw16DpKe/4T3x3fLywSpyVUZAMC0aPzc+Nel8WNv1Tc9ii2D67
 T2W7jge6LqM+aS9iMlkzTNQkEMgp/A4qx+qsO7lm1YbGcMXbfjv+sdvmwuMHcfC5D+bNcCJhUF
 db8=
X-IronPort-AV: E=Sophos;i="5.68,274,1569254400"; d="scan'208";a="122275188"
Received: from mail-cys01nam02lp2058.outbound.protection.outlook.com (HELO
 NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.58])
 by ob1.hgst.iphmx.com with ESMTP; 06 Nov 2019 17:45:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bhx+wVtgvrSx7QYzy8qHPh0gu906xctuh36LMNFZByFVdW9R30c9OglLi9WxUWYRiFxsfcaf3t1t9n9tFngLM74pDIjmKDy593sJX3ENaFjJrveywkG47K4y09XonK/y6KPdwI7u272fsDbHmAxi9JBu0/J4XHKiz77anVudFtm4tLLoG9BzoR76YaEllXgmDbDEJSQywSrCFL8RLSZl4jSRQyOrMOZQ2wXHhS3MqQH23MBhNLp9f8PmMG+L23WY683+WjyEMuUeXHHdWIouJVypcGxlwBoI3SdAxKlcGiOpVxVMXc020A/uEtas1CIyobm3ycc5mIi3Wl+soI9oxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PhMyMdxkYUtTesogctaajbXyFm7qpERZt1JJMuNY2U=;
 b=WH8bJqhoybSi9l78BJYNndrJ6GYJIQ+uKlXUsStuRCdF5v+QQdzsIgHqT3mcP71MqPz2Ezza0aqKWFyd3rQdbubJ6inKAb5+jiw9zY64yxBvjKmuWDOxazymiXyfNdDCymd5/+MbXsIwmmq6DOlxJuiDlpwv5NceygUK8SqBnB/q8kP+iFqnij2n1n8GELst1O8Ez8p/R4yZWlzOF2cC79W3SBOFDSLgtukGytwlWuF+yCyojOSHsq1uTUFL+wbw+2FCRSc79lau6FD49VJLRlDHg0ziOJk528RGbxfVR94w47TjzuXOS1li5MsE14NIr9p+aE3/NLy+lD6Yf1L3yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PhMyMdxkYUtTesogctaajbXyFm7qpERZt1JJMuNY2U=;
 b=m5S8jqH4kZyNm8Zj4DKZalEh1F+Uy9Ka7dAeuzQBPYlIBwwmCShuDpIYLVBsyDrn53uti1ehIxz6+Ts7tyiyYt2aJuoIxfXgZ2NRfDwdf3/cRJutRfulU5WYPVQG6XBwzjGOjoAIsbz3Zbf/nK2HbBussG4j9LnXWMcLcQlTAk8=
Received: from BN3PR04MB2257.namprd04.prod.outlook.com (10.166.73.148) by
 BN3PR04MB2371.namprd04.prod.outlook.com (10.166.73.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Wed, 6 Nov 2019 09:45:11 +0000
Received: from BN3PR04MB2257.namprd04.prod.outlook.com
 ([fe80::ac2f:6507:f217:9ab1]) by BN3PR04MB2257.namprd04.prod.outlook.com
 ([fe80::ac2f:6507:f217:9ab1%11]) with mapi id 15.20.2408.024; Wed, 6 Nov 2019
 09:45:11 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v6 7/8] fsck: Check write pointer consistency of open
 zones
Thread-Index: AQHVjVyyD74G+0FqZU6S+Mt9MOHqnad8d04AgAF7ugA=
Date: Wed, 6 Nov 2019 09:45:10 +0000
Message-ID: <20191106094510.6n3mntg5o3rz5frr@shindev.dhcp.fujisawa.hgst.com>
References: <20191028065512.27876-1-shinichiro.kawasaki@wdc.com>
 <20191028065512.27876-8-shinichiro.kawasaki@wdc.com>
 <a7c0f0e1-390f-636d-ac96-7644ecf29779@huawei.com>
In-Reply-To: <a7c0f0e1-390f-636d-ac96-7644ecf29779@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c677bac9-b1cf-4126-cc68-08d7629e044b
x-ms-traffictypediagnostic: BN3PR04MB2371:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN3PR04MB237165274C91EDEE60D7FD13ED790@BN3PR04MB2371.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:11;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(199004)(189003)(6916009)(86362001)(316002)(14454004)(30864003)(5660300002)(66476007)(91956017)(76116006)(66446008)(99286004)(64756008)(4326008)(2906002)(66556008)(76176011)(25786009)(8676002)(478600001)(81166006)(8936002)(6506007)(53546011)(81156014)(26005)(71200400001)(1076003)(14444005)(71190400001)(102836004)(6512007)(6116002)(446003)(66946007)(6486002)(11346002)(3846002)(54906003)(6246003)(229853002)(486006)(476003)(44832011)(7736002)(66066001)(186003)(305945005)(6436002)(9686003)(256004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR04MB2371;
 H:BN3PR04MB2257.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CuYaxgn+hOqkmV1jAC6KhRJgP2R928qP2vnJFtRDUffgz1JLUrGoowpu35cABCbAPid6c7PGC6l2H7gt6GvFrbEBNuAiJOG0B7+43qFItHSpyOQ4TWbPQ4HF0a3f7/55L9/bG/MIZAPtOBZHLy0Rqosccg9VaC4W0IK2mt1PjoQKFtBQgNHYANoAmwafkhJdQlpSIhEKgAW6s2APpeqXSqSzPgVweVG435utggIZBWN6TEVd9EdLeIfsy6v0dcbLqbsgnQyAeLTn+C7t/eQ/a0nsANR10gbvLKD6KaBfesUjoDu6HJyOXpjg2/+SFozPdFV66VB4YVomgJeBJgBXBboRrDdqgO7I41HnnC83pZZ9jTjlf8B+1TRmBR/fgd/1i6THboUQdPxF4jriwlaVAnn3ZuiUEZGiVtRnujkgBVoof4TVTXE2O6AE1Let9MMb
Content-ID: <DAB43D81D212C847BD6D39A1E071415D@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c677bac9-b1cf-4126-cc68-08d7629e044b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 09:45:11.0026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bs5qu+flV4xFsTElf9AMXFtDLSzbg3EOYW3SsTVxi2omTc0RHGaB6zaBytUqB6rER6+R6OGtc/88GXAnes3TPhaC4DjbJCNAO99WbD0OPRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR04MB2371
X-Spam-Score: 0.9 (/)
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
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1iSHsX-002hL3-1n
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

On Nov 05, 2019 / 19:06, Chao Yu wrote:
> On 2019/10/28 14:55, Shin'ichiro Kawasaki wrote:
> > On sudden f2fs shutdown, write pointers of zoned block devices can go
> > further but f2fs meta data keeps current segments at positions before the
> > write operations. After remounting the f2fs, this inconsistency causes
> > write operations not at write pointers and "Unaligned write command"
> > error is reported.
> > 
> > To avoid the error, have f2fs.fsck check consistency of write pointers
> > of open zones that current segments point to. Compare each current
> > segment's position and the write pointer position of the open zone. If
> > inconsistency is found and 'fix_on' flag is set, assign a new zone to the
> > current segment and check the newly assigned zone has write pointer at
> > the zone start. Leave the original zone as is to keep data recorded in
> > it.
> > 
> > To care about fsync data, refer each seg_entry's ckpt_valid_map to get
> > the last valid block in the zone. If the last valid block is beyond the
> > current segments position, fsync data exits in the zone. In case fsync
> > data exists, do not assign a new zone to the current segment not to lose
> > the fsync data. It is expected that the kernel replay the fsync data and
> > fix the write pointer inconsistency at mount time.
> > 
> > Also check consistency between write pointer of the zone the current
> > segment points to with valid block maps of the zone. If the last valid
> > block is beyond the write pointer position, report to indicate f2fs bug.
> > If 'fix_on' flag is set, assign a new zone to the current segment.
> > 
> > When inconsistencies are found, turn on 'bug_on' flag in fsck_verify() to
> > ask users to fix them or not. When inconsistencies get fixed, turn on
> > 'force' flag in fsck_verify() to enforce fixes in following checks.
> > 
> > This check and fix is done twice. The first is done at the beginning of
> > do_fsck() function so that other fixes can reflect the current segment
> > modification. The second is done in fsck_verify() to reflect updated meta
> > data by other fixes.
> > 
> > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > ---
> >  fsck/f2fs.h  |   5 ++
> >  fsck/fsck.c  | 154 +++++++++++++++++++++++++++++++++++++++++++++++++++
> >  fsck/fsck.h  |   3 +
> >  fsck/main.c  |   2 +
> >  fsck/mount.c |  49 +++++++++++++++-
> >  5 files changed, 212 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fsck/f2fs.h b/fsck/f2fs.h
> > index 399c74d..07513cb 100644
> > --- a/fsck/f2fs.h
> > +++ b/fsck/f2fs.h
> > @@ -429,6 +429,11 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
> >  #define GET_BLKOFF_FROM_SEG0(sbi, blk_addr)				\
> >  	(GET_SEGOFF_FROM_SEG0(sbi, blk_addr) & (sbi->blocks_per_seg - 1))
> >  
> > +#define GET_SEC_FROM_SEG(sbi, segno)					\
> > +	((segno) / (sbi)->segs_per_sec)
> > +#define GET_SEG_FROM_SEC(sbi, secno)					\
> > +	((secno) * (sbi)->segs_per_sec)
> > +
> >  #define FREE_I_START_SEGNO(sbi)						\
> >  	GET_SEGNO_FROM_SEG0(sbi, SM_I(sbi)->main_blkaddr)
> >  #define GET_R2L_SEGNO(sbi, segno)	(segno + FREE_I_START_SEGNO(sbi))
> > diff --git a/fsck/fsck.c b/fsck/fsck.c
> > index 2ae3bd5..e0eda4e 100644
> > --- a/fsck/fsck.c
> > +++ b/fsck/fsck.c
> > @@ -2181,6 +2181,125 @@ static void fix_checkpoints(struct f2fs_sb_info *sbi)
> >  	fix_checkpoint(sbi);
> >  }
> >  
> > +#ifdef HAVE_LINUX_BLKZONED_H
> > +
> > +/*
> > + * Refer valid block map and return offset of the last valid block in the zone.
> > + * Obtain valid block map from SIT and fsync data.
> > + * If there is no valid block in the zone, return -1.
> > + */
> > +static int last_vblk_off_in_zone(struct f2fs_sb_info *sbi,
> > +				 unsigned int zone_segno)
> > +{
> > +	unsigned int s;
> > +	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
> > +	struct seg_entry *se;
> > +	block_t b;
> > +	int ret = -1;
> > +
> > +	for (s = 0; s < segs_per_zone; s++) {
> > +		se = get_seg_entry(sbi, zone_segno + s);
> > +
> > +		/*
> > +		 * Refer not cur_valid_map but ckpt_valid_map which reflects
> > +		 * fsync data.
> > +		 */
> > +		ASSERT(se->ckpt_valid_map);
> > +		for (b = 0; b < sbi->blocks_per_seg; b++)
> > +			if (f2fs_test_bit(b, (const char*)se->ckpt_valid_map))
> > +				ret = b + (s << sbi->log_blocks_per_seg);
> 
> Minor thing, I guess we only need to find last valid block in target zone?
> 
> int s, b;
> 
> for (s = segs_per_zone - 1; s >= 0; s--) {
> 	for (b = sbi->blocks_per_seg - 1; b >= 0; b--)
> 		if (f2fs_test_bit(b, (const char*)se->ckpt_valid_map)) {
> 			ret = b + (s << sbi->log_blocks_per_seg);
> 			break;
> 		}
> }

Yes, reveresed search is the better. Will modify the code as suggested.

> 
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int check_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
> > +{
> > +	struct curseg_info *curseg = CURSEG_I(sbi, type);
> > +	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
> > +	struct blk_zone blkz;
> > +	block_t cs_block, wp_block, zone_last_vblock;
> > +	u_int64_t cs_sector, wp_sector;
> > +	int i, ret;
> > +	unsigned int zone_segno;
> > +	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> > +
> > +	/* get the device the curseg points to */
> > +	cs_block = START_BLOCK(sbi, curseg->segno) + curseg->next_blkoff;
> > +	for (i = 0; i < MAX_DEVICES; i++) {
> > +		if (!c.devices[i].path)
> > +			break;
> > +		if (c.devices[i].start_blkaddr <= cs_block &&
> > +		    cs_block <= c.devices[i].end_blkaddr)
> > +			break;
> > +	}
> > +
> > +	if (i >= MAX_DEVICES)
> > +		return -EINVAL;
> > +
> > +	/* get write pointer position of the zone the curseg points to */
> > +	cs_sector = (cs_block - c.devices[i].start_blkaddr)
> > +		<< log_sectors_per_block;
> > +	ret = f2fs_report_zone(i, cs_sector, &blkz);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (blk_zone_type(&blkz) != BLK_ZONE_TYPE_SEQWRITE_REQ)
> > +		return 0;
> > +
> > +	/* check consistency between the curseg and the write pointer */
> > +	wp_block = c.devices[i].start_blkaddr +
> > +		(blk_zone_wp_sector(&blkz) >> log_sectors_per_block);
> > +	wp_sector = blk_zone_wp_sector(&blkz);
> > +
> > +	if (cs_sector == wp_sector)
> > +		return 0;
> > +
> > +	if (cs_sector > wp_sector) {
> > +		MSG(0, "Inconsistent write pointer with curseg %d: "
> > +		    "curseg %d[0x%x,0x%x] > wp[0x%x,0x%x]\n",
> > +		    type, type, curseg->segno, curseg->next_blkoff,
> > +		    GET_SEGNO(sbi, wp_block), OFFSET_IN_SEG(sbi, wp_block));
> > +		fsck->chk.wp_inconsistent_zones++;
> > +		return -EINVAL;
> > +	}
> > +
> > +	MSG(0, "Write pointer goes advance from curseg %d: "
> > +	    "curseg %d[0x%x,0x%x] wp[0x%x,0x%x]\n",
> > +	    type, type, curseg->segno, curseg->next_blkoff,
> > +	    GET_SEGNO(sbi, wp_block), OFFSET_IN_SEG(sbi, wp_block));
> > +
> > +	zone_segno = GET_SEG_FROM_SEC(sbi,
> > +				      GET_SEC_FROM_SEG(sbi, curseg->segno));
> > +	zone_last_vblock = START_BLOCK(sbi, zone_segno) +
> > +		last_vblk_off_in_zone(sbi, zone_segno);
> > +
> > +	/*
> > +	 * If fsync data exists between the curseg and the last valid block,
> > +	 * it is not an error to fix. Leave it for kernel to recover later.
> > +	 */
> > +	if (cs_block <= zone_last_vblock) {
> 
> According to above comments, should condition be?
> 
> if (cs_block < zone_last_vblock && zone_last_vblock <= wp_block)
>

To be precise, cs_block points to curseg->next_blkoff, which is the block
curseg will write in the next write request. Then, if cs_block equals to
zone_last_vblock, it means that the block curseg->next_blkoff points to
already have valid block and fsync data. Then, comparator between cs_block
and zone_last_vblock should be "<=".

I agree that it is the better to check zone_last_vblock with wp_block.
wp_block corresponds to the write pointer position that next write will be
made. It wp_block equals to zone_last_vblock, it means that unexpected data
is written beyond the write pointer. Then, comparator should be "<" between
zone_last_vblock and wp_block.

In short, I suggest the condition check below as the good one.

if (cs_block <= zone_last_vblock && zone_last_vblock < wp_block)

> > +		MSG(0, "Curseg has fsync data: curseg %d[0x%x,0x%x] "
> > +		    "last valid block in zone[0x%x,0x%x]\n",
> > +		    type, curseg->segno, curseg->next_blkoff,
> > +		    GET_SEGNO(sbi, zone_last_vblock),
> > +		    OFFSET_IN_SEG(sbi, zone_last_vblock));
> > +		return 0;
> > +	}
> > +
> > +	fsck->chk.wp_inconsistent_zones++;
> > +	return -EINVAL;
> > +}
> > +
> > +#else
> > +
> > +static int check_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
> > +{
> > +	return 0;
> > +}
> > +
> > +#endif
> > +
> >  int check_curseg_offset(struct f2fs_sb_info *sbi, int type)
> >  {
> >  	struct curseg_info *curseg = CURSEG_I(sbi, type);
> > @@ -2209,6 +2328,10 @@ int check_curseg_offset(struct f2fs_sb_info *sbi, int type)
> >  			return -EINVAL;
> >  		}
> >  	}
> > +
> > +	if (c.zoned_model == F2FS_ZONED_HM)
> > +		return check_curseg_write_pointer(sbi, type);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -2628,6 +2751,23 @@ out:
> >  	return cnt;
> >  }
> >  
> > +/*
> > + * Check and fix consistency with write pointers at the beginning of
> > + * fsck so that following writes by fsck do not fail.
> > + */
> > +void fsck_chk_and_fix_write_pointers(struct f2fs_sb_info *sbi)
> > +{
> > +	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
> > +
> > +	if (c.zoned_model != F2FS_ZONED_HM)
> > +		return;
> > +
> > +	if (check_curseg_offsets(sbi) && c.fix_on) {
> > +		fix_curseg_info(sbi);
> > +		fsck->chk.wp_fixed = 1;
> > +	}
> > +}
> > +
> >  int fsck_chk_curseg_info(struct f2fs_sb_info *sbi)
> >  {
> >  	struct curseg_info *curseg;
> > @@ -2678,6 +2818,20 @@ int fsck_verify(struct f2fs_sb_info *sbi)
> >  
> >  	printf("\n");
> >  
> > +	if (c.zoned_model == F2FS_ZONED_HM) {
> > +		printf("[FSCK] Write pointers consistency                    ");
> > +		if (fsck->chk.wp_inconsistent_zones == 0x0) {
> > +			printf(" [Ok..]\n");
> > +		} else {
> > +			printf(" [Fail] [0x%x]\n",
> > +			       fsck->chk.wp_inconsistent_zones);
> > +			c.bug_on = 1;
> > +		}
> > +
> > +		if (fsck->chk.wp_fixed && c.fix_on)
> > +			force = 1;
> > +	}
> > +
> >  	if (c.feature & cpu_to_le32(F2FS_FEATURE_LOST_FOUND)) {
> >  		for (i = 0; i < fsck->nr_nat_entries; i++)
> >  			if (f2fs_test_bit(i, fsck->nat_area_bitmap) != 0)
> > diff --git a/fsck/fsck.h b/fsck/fsck.h
> > index 75052d8..c4432e8 100644
> > --- a/fsck/fsck.h
> > +++ b/fsck/fsck.h
> > @@ -80,6 +80,8 @@ struct f2fs_fsck {
> >  		u32 multi_hard_link_files;
> >  		u64 sit_valid_blocks;
> >  		u32 sit_free_segs;
> > +		u32 wp_fixed;
> > +		u32 wp_inconsistent_zones;
> >  	} chk;
> >  
> >  	struct hard_link_node *hard_link_list_head;
> > @@ -162,6 +164,7 @@ int fsck_chk_inline_dentries(struct f2fs_sb_info *, struct f2fs_node *,
> >  		struct child_info *);
> >  void fsck_chk_checkpoint(struct f2fs_sb_info *sbi);
> >  int fsck_chk_meta(struct f2fs_sb_info *sbi);
> > +void fsck_chk_and_fix_write_pointers(struct f2fs_sb_info *);
> >  int fsck_chk_curseg_info(struct f2fs_sb_info *);
> >  void pretty_print_filename(const u8 *raw_name, u32 len,
> >  			   char out[F2FS_PRINT_NAMELEN], int enc_name);
> > diff --git a/fsck/main.c b/fsck/main.c
> > index 8c62a14..9a7d499 100644
> > --- a/fsck/main.c
> > +++ b/fsck/main.c
> > @@ -602,6 +602,8 @@ static void do_fsck(struct f2fs_sb_info *sbi)
> >  
> >  	print_cp_state(flag);
> >  
> > +	fsck_chk_and_fix_write_pointers(sbi);
> > +
> >  	fsck_chk_curseg_info(sbi);
> >  
> >  	if (!c.fix_on && !c.bug_on) {
> > diff --git a/fsck/mount.c b/fsck/mount.c
> > index 2979865..5085e6c 100644
> > --- a/fsck/mount.c
> > +++ b/fsck/mount.c
> > @@ -2465,6 +2465,52 @@ void set_section_type(struct f2fs_sb_info *sbi, unsigned int segno, int type)
> >  	}
> >  }
> >  
> > +#ifdef HAVE_LINUX_BLKZONED_H
> > +
> > +static bool write_pointer_at_zone_start(struct f2fs_sb_info *sbi,
> > +					unsigned int zone_segno)
> > +{
> > +	u_int64_t sector;
> > +	struct blk_zone blkz;
> > +	block_t block = START_BLOCK(sbi, zone_segno);
> > +	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> > +	int ret, j;
> > +
> > +	if (c.zoned_model != F2FS_ZONED_HM)
> > +		return true;
> > +
> > +	for (j = 0; j < MAX_DEVICES; j++) {
> > +		if (!c.devices[j].path)
> > +			break;
> > +		if (c.devices[j].start_blkaddr <= block &&
> > +		    block <= c.devices[j].end_blkaddr)
> > +			break;
> > +	}
> > +
> > +	if (j >= MAX_DEVICES)
> > +		return false;
> > +
> > +	sector = (block - c.devices[j].start_blkaddr) << log_sectors_per_block;
> > +	ret = f2fs_report_zone(j, sector, &blkz);
> > +	if (ret)
> > +		return false;
> > +
> > +	if (blk_zone_type(&blkz) != BLK_ZONE_TYPE_SEQWRITE_REQ)
> > +		return true;
> > +
> > +	return blk_zone_sector(&blkz) == blk_zone_wp_sector(&blkz);
> > +}
> > +
> > +#else
> > +
> > +static bool write_pointer_at_zone_start(struct f2fs_sb_info *sbi,
> > +					unsigned int zone_segno)
> > +{
> > +	return true;
> > +}
> > +
> > +#endif
> > +
> >  int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left, int want_type, bool new_sec)
> >  {
> >  	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
> > @@ -2517,7 +2563,8 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left, int want_t
> >  					break;
> >  			}
> >  
> > -			if (i == sbi->segs_per_sec) {
> > +			if (i == sbi->segs_per_sec &&
> > +			    write_pointer_at_zone_start(sbi, segno)) {
> >  				set_section_type(sbi, segno, want_type);
> >  				return 0;
> >  			}
> > 

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
