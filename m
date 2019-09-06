Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3D0AB40E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Sep 2019 10:31:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i69eV-0003aW-SZ; Fri, 06 Sep 2019 08:31:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=145de471f=shinichiro.kawasaki@wdc.com>)
 id 1i69eU-0003aP-9A
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Sep 2019 08:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C/UYyV2LtWwYGI2umrS6O0QOKwtRSYcE9J9eQcL2FEQ=; b=fJy6CzHP6Mm8uwc7JMoYAtx/iG
 +heCDXRJ+wVa8/6ak1j/UIcmxredMTlfPUIUKAqpQGbzMJjJ6lDH2/UoaZBNuNMrANlWEqUg9BE9S
 RFXgoqpCeURgud/PmONQKpSdu7bjqx6htjXLMTaNA7R0e05NO5dUtcCbYPMjRPVmQCnM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C/UYyV2LtWwYGI2umrS6O0QOKwtRSYcE9J9eQcL2FEQ=; b=g5YCmSZSVIzzuHCsv1+zY48ehF
 EQC4tqM1N/EniU64BSRC83DRuvmxg4YRknKXTFL5A27H0N4o4UnnxfOOINQV72vp7Y6byRfoKMwrM
 yO+tNYmHDxNGmZTj04Hl0H3xBm+RxSlMoxwIf/OuJWGfHd3Lx67U2rOiP+pt9p6/3biQ=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i69eQ-001dfL-OS
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Sep 2019 08:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1567758687; x=1599294687;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vG/MDOfMgJp4yCnlJhKtY/UxnXU9h6lnHT9KiRRRAtU=;
 b=IZFk/P6eszAPjnhwUItQI3OogwlrESpivAIk4iFvxBnlfsPyDfNOFEwp
 2qMMfzkIDleynpGe7SBZyELpogVefvURU8Gg/D4nQ/jRpCG9X0oikt0OQ
 qcUYNlBPysr7iYIcIM+D+6qThBHJi3YDGQ0B862J7SLh4lCbPPqH9fzSU
 7es1DyfM/+VeEbSPSkJ7eureTBDLiz8fWtjdIbQezUl0F9A/kSY0fZYsF
 ln9KksvSE81uk2wIumm5u/7Mj5MBNytuOD0xzRrM+4nBc0kXAiIeh3+Dr
 t9VL/hfT9xcJPiofC6PXdUbUV5JzUygE2ToCej1ZgMkwkfq1Q+tLJ/iTn w==;
IronPort-SDR: EjP23py8LCDjRR9qbrF+G/hpNCExrvvDxSmoksqbO3SOfyVLT0LXCm2bC+LQzNjHfkSnvEU51d
 oLRBYqqRmXApSYVkRtQeo0NM82QgdvkGBHrDze+XUWL1nacaLqQ/4ZLMLOJ+LXXqtVfIPzf5tY
 tIoyLbKCQy2EhPmYcTeoOtXf/5i8cNA+GREzSL1oTkoWPoNLtb0Cfke2bY3HTSVkghA+WuoGDn
 76Qix4Qd1xNJJAGzSfKEYcHuGSbPChCMZEUUuB6kKyNiBtqOuRdWud2/smORneYQefPYqXqIxz
 qe4=
X-IronPort-AV: E=Sophos;i="5.64,472,1559491200"; d="scan'208";a="119235173"
Received: from mail-sn1nam04lp2052.outbound.protection.outlook.com (HELO
 NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.52])
 by ob1.hgst.iphmx.com with ESMTP; 06 Sep 2019 16:31:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XovmzjKxbXpWW/EWuDsKJL/lb23EAQLTFMbGjorMzqHLBU/S/C5CIHewSxFlI3p0gCFooVrqX3zeIBojcu6gB2HedU+Ozcv6R2jcy2cnSZoMZFeV+nilVoW5XV89fEobstPTqpx1DGlqFlY7TADU/6CQGKdp8xMrg+YGOuNRtE4ybeQlDGZnRxF2RE36JwvqsKpR8ETpiJSWAVADUf55aESNpxnGUpuUoLqcA+aCLLCmrgdHvYNS94cdfs2wIDvIcCOKS11zzC6TszzsJiSdAfZsUNIk/vUTLniLtTiIt9zHvDuLEWDh4Oxf3W/+ucdP2QsnVEYZW7+p88Yn7MY4xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/UYyV2LtWwYGI2umrS6O0QOKwtRSYcE9J9eQcL2FEQ=;
 b=nb301xkh0GWaH2jMHFKP9wD1/HjMdgEG+LE0/jzMJnZRlL5WUOJ5l5AOYY8NW6hVEWwAeKol+w6UeSIAQWikdcudmBGAUDqb+Wk/YFB5IBKVWtlixDXM4lkI0wz3zj0ifv/c5k3hoLj8LIlTAHt0DyuZeoiK7Qgfc0Qx5EqQ8HXzeikJaaLjFil3eEbWuy70ZdHOrhhBxkTcpK6K4xzNAhcQlcls+OW4GSCzAiJcWyo+B42s2LjLbhaCS4uBRHU2yz5Lyg3KYldEziCxethZagMA4f+HOdrL2dtYcOe4yx06t38jSQl5h1HOMUxNnFkVsOmpPQfH6vmRn8xLTQs6tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/UYyV2LtWwYGI2umrS6O0QOKwtRSYcE9J9eQcL2FEQ=;
 b=mnke8SFFsyr0VWFgYtn+roQoZ7mKN6geH0+Hg+GxW3YCgGz1fCVwHD8m7X0IS6EI6y8Wuw0d8SoC26pWNl9EcGquWfW3lrJ3kJUyDHb7bk6L7yFanOEvZ9VdcORoKs5bh+BfcN8hLfDibggBM+SdwN0/HO2Q6JQMWzPTE1tnCNY=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2153.namprd04.prod.outlook.com (10.167.8.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Fri, 6 Sep 2019 08:31:17 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::88:72f2:2211:6b8b]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::88:72f2:2211:6b8b%8]) with mapi id 15.20.2241.018; Fri, 6 Sep 2019
 08:31:17 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v4 2/2] fsck.f2fs: Check write pointer consistency with
 current segments
Thread-Index: AQHVXxx1rSkyH6+CAkmLT6J96mLmOKcX+ocAgAGsxgCAAzt6gIABeeMA
Date: Fri, 6 Sep 2019 08:31:17 +0000
Message-ID: <20190906083114.jmjzczqzp4m3kxex@shindev>
References: <20190830101936.32265-1-shinichiro.kawasaki@wdc.com>
 <20190830101936.32265-3-shinichiro.kawasaki@wdc.com>
 <486550b2-bb47-d725-79a9-4fb3a4ba28e3@huawei.com>
 <20190903083704.kmc5bwfdpeinzfle@shindev>
 <7e13140d-f031-9eda-3544-747f80880df9@huawei.com>
In-Reply-To: <7e13140d-f031-9eda-3544-747f80880df9@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf0246a7-927e-4a24-4a3f-08d732a49679
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY1PR04MB2153; 
x-ms-traffictypediagnostic: CY1PR04MB2153:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB21538A5F918E8ADA87F98DD2EDBA0@CY1PR04MB2153.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0152EBA40F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(7916004)(346002)(136003)(366004)(376002)(39860400002)(396003)(51914003)(199004)(189003)(52314003)(86362001)(4326008)(76176011)(5660300002)(1076003)(66066001)(25786009)(446003)(11346002)(476003)(486006)(44832011)(14444005)(71200400001)(6246003)(71190400001)(14454004)(256004)(478600001)(99286004)(66556008)(6506007)(53546011)(102836004)(30864003)(66946007)(66476007)(53936002)(66446008)(64756008)(186003)(26005)(6486002)(81156014)(6916009)(8936002)(6512007)(81166006)(6436002)(8676002)(7736002)(305945005)(54906003)(9686003)(3846002)(6116002)(91956017)(316002)(2906002)(76116006)(58126008)(33716001)(229853002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2153;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S9SwUm3cKfig4FMi1FQfJpnwHiItoy9RITmzAVOePN1XeIOsGIkbW3EBNR2DMtefDct+rp9qcaQGWn7svK+UobsJXET4yauVSalXBNlvjLNnxdDgTAujbirYSQ502QH7BgjF5fw+fV9x7ynLOqXCr45L7W29X0WOw7R61LkLJ0tk5d6f00hgkryJrSYw6dewwzWpqiaVamyO9WwCZBhoaoMOTX3JGf7sEkKBC/r943bvUrIIxW7e0vzhzOLhCo+fQED6Pnan3ASv/RdjMvMLxNwdHEK0SJptgledyipPR9aItiFTOgiieMFYtVSOrXpIfA952+Aty/8Gk1yQw7pSOABpV5ZgoSO182F4vXgRLxfpbEH+JQgjzW3hIy2tj35e8dGUQE3GYrTt2i3cVJc6gPNYuJLSLj5cuFLWV9+8eWw=
Content-ID: <05D40E176756F549884B2619765FA21C@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0246a7-927e-4a24-4a3f-08d732a49679
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2019 08:31:17.3652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6+4i0X3lTaSlBBY7gBYDubZt1HA63xLehTlpzXpl25G00ZzwqcxfXpQoZE1jE3FIUpTYUtUrALUABL7VTZTMMyt759QS8uEhNOOgIZC2Qb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2153
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
X-Headers-End: 1i69eQ-001dfL-OS
Subject: Re: [f2fs-dev] [PATCH v4 2/2] fsck.f2fs: Check write pointer
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

On Sep 05, 2019 / 17:58, Chao Yu wrote:
> Hi Shinichiro,
> 
> Sorry for the delay.
> 
> On 2019/9/3 16:37, Shinichiro Kawasaki wrote:
> > On Sep 02, 2019 / 15:02, Chao Yu wrote:
> >> On 2019/8/30 18:19, Shin'ichiro Kawasaki wrote:
> >>> On sudden f2fs shutdown, zoned block device status and f2fs current
> >>> segment positions in meta data can be inconsistent. When f2fs shutdown
> >>> happens before write operations completes, write pointers of zoned block
> >>> devices can go further but f2fs meta data keeps current segments at
> >>> positions before the write operations. After remounting the f2fs, the
> >>> inconsistency causes write operations not at write pointers and
> >>> "Unaligned write command" error is reported. This error was observed when
> >>> xfstests test case generic/388 was run with f2fs on a zoned block device.
> >>>
> >>> To avoid the error, have f2fs.fsck check consistency between each current
> >>> segment's position and the write pointer of the zone the current segment
> >>> points to. If the write pointer goes advance from the current segment,
> >>> fix the current segment position setting at same as the write pointer
> >>> position. If the write pointer goes to the zone end, find a new zone and
> >>> set the current segment position at the new zone start. In case the write
> >>> pointer is behind the current segment, write zero data at the write
> >>> pointer position to make write pointer position at same as the current
> >>> segment.
> >>>
> >>> When inconsistencies are found, turn on c.bug_on flag in fsck_verify() to
> >>> ask users to fix them or not. When inconsistencies get fixed, turn on
> >>> 'force' flag in fsck_verify() to enforce fixes in following checks. This
> >>> position fix is done at the beginning of do_fsck() function so that other
> >>> checks reflect the current segment modification.
> >>>
> >>> Also add GET_SEC_FROM_SEG and GET_SEG_FROM_SEC macros in fsck/fsck.h to
> >>> simplify the code.
> >>>
> >>> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> >>> ---
> >>>  fsck/f2fs.h |   5 ++
> >>>  fsck/fsck.c | 198 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >>>  fsck/fsck.h |   3 +
> >>>  fsck/main.c |   2 +
> >>>  4 files changed, 208 insertions(+)
> >>>
> >>> diff --git a/fsck/f2fs.h b/fsck/f2fs.h
> >>> index 4dc6698..2c1c2b3 100644
> >>> --- a/fsck/f2fs.h
> >>> +++ b/fsck/f2fs.h
> >>> @@ -337,6 +337,11 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
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
> >>> index 8953ca1..a0f6849 100644
> >>> --- a/fsck/fsck.c
> >>> +++ b/fsck/fsck.c
> >>> @@ -2574,6 +2574,190 @@ out:
> >>>  	return cnt;
> >>>  }
> >>>  
> >>> +/*
> >>> + * Search a free section in main area. Start search from the section specified
> >>> + * with segno argument toward main area end. Return first segment of the found
> >>> + * section in segno argument.
> >>> + */
> >>> +static int find_next_free_section(struct f2fs_sb_info *sbi,
> >>> +				  unsigned int *segno)
> >>> +{
> >>> +	unsigned int i, sec, section_valid_blocks;
> >>> +	unsigned int end_segno = GET_SEGNO(sbi, SM_I(sbi)->main_blkaddr)
> >>> +		+ SM_I(sbi)->main_segments;
> >>> +	unsigned int end_sec = GET_SEC_FROM_SEG(sbi, end_segno);
> >>> +	struct seg_entry *se;
> >>> +	struct curseg_info *cs;
> >>> +
> >>> +	for (sec = GET_SEC_FROM_SEG(sbi, *segno); sec < end_sec; sec++) {
> >>> +		/* find a section without valid blocks */
> >>> +		section_valid_blocks = 0;
> >>> +		for (i = 0; i < sbi->segs_per_sec; i++) {
> >>> +			se = get_seg_entry(sbi, GET_SEG_FROM_SEC(sbi, sec) + i);
> >>> +			section_valid_blocks += se->valid_blocks;
> >>
> >> If we want to find a 'real' free section, we'd better to use
> >> se->ckpt_valid_blocks (wrapped with get_seg_vblocks()) in where we has recorded
> >> fsynced data count.
> > 
> > Thanks. When I create next patch series, I will use get_seg_vblocks().
> > I will rebase to dev-test branch in which get_seg_vblocks() is available.
> > 
> >>
> >>> +		}
> >>> +		if (section_valid_blocks)
> >>> +			continue;
> >>> +
> >>> +		/* check the cursegs do not use the section */
> >>> +		for (i = 0; i < NO_CHECK_TYPE; i++) {
> >>> +			cs = &SM_I(sbi)->curseg_array[i];
> >>> +			if (GET_SEC_FROM_SEG(sbi, cs->segno) == sec)
> >>> +				break;
> >>> +		}
> >>> +		if (i >= NR_CURSEG_TYPE) {
> >>> +			*segno = GET_SEG_FROM_SEC(sbi, sec);
> >>> +			return 0;
> >>> +		}
> >>> +	}
> >>> +
> >>> +	return -1;
> >>> +}
> >>> +
> >>> +struct write_pointer_check_data {
> >>> +	struct f2fs_sb_info *sbi;
> >>> +	struct device_info *dev;
> >>> +};
> >>> +
> >>> +static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
> >>> +{
> >>> +	struct write_pointer_check_data *wpd = opaque;
> >>> +	struct f2fs_sb_info *sbi = wpd->sbi;
> >>> +	struct device_info *dev = wpd->dev;
> >>> +	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
> >>> +	block_t zone_block, wp_block, wp_blkoff, cs_block, b;
> >>> +	unsigned int zone_segno, wp_segno, new_segno;
> >>> +	struct seg_entry *se;
> >>> +	struct curseg_info *cs;
> >>> +	int cs_index, ret;
> >>> +	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> >>> +	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
> >>> +	void *zero_blk;
> >>> +
> >>> +	if (blk_zone_conv(blkz))
> >>> +		return 0;
> >>> +
> >>> +	zone_block = dev->start_blkaddr
> >>> +		+ (blk_zone_sector(blkz) >> log_sectors_per_block);
> >>> +	zone_segno = GET_SEGNO(sbi, zone_block);
> >>> +	wp_block = dev->start_blkaddr
> >>> +		+ (blk_zone_wp_sector(blkz) >> log_sectors_per_block);
> >>> +	wp_segno = GET_SEGNO(sbi, wp_block);
> >>> +	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
> >>> +
> >>> +	/* find the curseg which points to the zone */
> >>> +	for (cs_index = 0; cs_index < NO_CHECK_TYPE; cs_index++) {
> >>> +		cs = &SM_I(sbi)->curseg_array[cs_index];
> >>> +		if (zone_segno <= cs->segno &&
> >>> +		    cs->segno < zone_segno + segs_per_zone)
> >>> +			break;
> >>> +	}
> >>> +
> >>> +	if (cs_index >= NR_CURSEG_TYPE)
> >>> +		return 0;
> >>> +
> >>> +	/* check write pointer consistency with the curseg in the zone */
> >>> +	cs_block = START_BLOCK(sbi, cs->segno) + cs->next_blkoff;
> >>> +	if (wp_block == cs_block)
> >>> +		return 0;
> >>> +
> >>> +	if (!c.fix_on) {
> >>> +		MSG(0, "Inconsistent write pointer: "
> >>> +		    "curseg %d[0x%x,0x%x] wp[0x%x,0x%x]\n",
> >>> +		    cs_index, cs->segno, cs->next_blkoff, wp_segno, wp_blkoff);
> >>> +		fsck->chk.wp_inconsistent_zones++;
> >>> +		return 0;
> >>> +	}
> >>> +
> >>> +	/*
> >>> +	 * If the curseg is in advance from the write pointer, write zero to
> >>> +	 * move the write pointer forward to the same position as the curseg.
> >>> +	 */
> >>> +	if (wp_block < cs_block) {
> >>> +		ret = 0;
> >>> +		zero_blk = calloc(BLOCK_SZ, 1);
> >>> +		if (!zero_blk)
> >>> +			return -EINVAL;
> >>> +
> >>> +		FIX_MSG("Advance write pointer to match with curseg %d: "
> >>> +			"[0x%x,0x%x]->[0x%x,0x%x]",
> >>> +			cs_index, wp_segno, wp_blkoff,
> >>> +			cs->segno, cs->next_blkoff);
> >>> +		for (b = wp_block; b < cs_block && !ret; b++)
> >>> +			ret = dev_write_block(zero_blk, b);
> >>> +
> >>> +		fsck->chk.wp_fixed_zones++;
> >>> +		free(zero_blk);
> >>> +		return ret;
> >>> +	}
> >>> +
> >>> +	if (wp_segno == zone_segno + segs_per_zone) {
> >>> +		/*
> >>> +		 * If the write pointer is in advance from the curseg and at
> >>> +		 * the zone end (section end), search a new free zone (section)
> >>> +		 * between the curseg and main area end.
> >>> +		 */
> >>> +		new_segno = wp_segno;
> >>> +		ret = find_next_free_section(sbi, &new_segno);
> >>> +		if (ret) {
> >>> +			/* search again from main area start */
> >>> +			new_segno = GET_SEGNO(sbi, SM_I(sbi)->main_blkaddr);
> >>> +			ret = find_next_free_section(sbi, &new_segno);
> >>> +		}
> >>
> >> If curseg's type is warm node, relocating curseg would ruin warm node chain,
> >> result in losing fsynced data for ever as well.
> >>
> >> So I guess we should migrate all dnode blocks chained with cs->next_blkoff in
> >> current section.
> >>
> >>> +		if (ret) {
> >>> +			MSG(0, "Free section not found\n");
> >>> +			return ret;
> >>> +		}
> >>> +		FIX_MSG("New section for curseg %d: [0x%x,0x%x]->[0x%x,0x%x]",
> >>> +			cs_index, cs->segno, cs->next_blkoff, new_segno, 0);
> >>> +		cs->segno = new_segno;
> >>> +		cs->next_blkoff = 0;
> >>> +	} else {
> >>> +		/*
> >>> +		 * If the write pointer is in advance from the curseg within
> >>> +		 * the zone, modify the curseg position to be same as the
> >>> +		 * write pointer.
> >>> +		 */
> >>> +		ASSERT(wp_segno < zone_segno + segs_per_zone);
> >>> +		FIX_MSG("Advance curseg %d: [0x%x,0x%x]->[0x%x,0x%x]",
> >>> +			cs_index, cs->segno, cs->next_blkoff,
> >>> +			wp_segno, wp_blkoff);
> >>> +		cs->segno = wp_segno;
> >>> +		cs->next_blkoff = wp_blkoff;
> >>
> >> The same data lose problem here, I guess we'd better handle it with the same way
> >> as above.
> >>
> >> Thoughts?
> > 
> > I created f2fs status with fsync data and warm node chain, and confirmed the v4
> > implementation ruins the dnode blocks chain. Hmm.
> > 
> > My understanding is that when f2fs kernel module recovers the fsync data, it
> > sets the warm node curseg position at the start of the fsync data, and the fsync
> > data will be overwritten as new nodes created. Is this understanding correct?
> 
> Sorry, I'm not sure I've understood you correctly.

Apology is mine, my question was not clear enough.
And thanks for the explanation below. It helps me to understand better.

> Current recovery flow is:
> 1)   find all valid fsynced dnode in warm node chain
> 2.a) recover fsynced dnode in memory, and set it dirty
> 2.b) recover directory entry in memory, and set it dirty
> 2.c) during regular's dnode recovery, physical blocks indexed by recovered dnode
> will be revalidated
> Note: we didn't move any cursegs before 3)
> 3)   relocate all cursegs to new segments
> 4)   trigger checkpoint to persist all recovered data(fs' meta, file's meta/data)

Question, does the step 3) correspond to f2fs_allocate_new_segments(sbi) call
at the end of recover_data()? The f2fs_allocate_new_segments() function
relocates new segments only for DATA cursegs, and it keeps NODE cursegs same as
before the fsync data recovery. Then I thought WARM NODE curseg would not change
by recovery (and still keeps pointing to the fsync recovery data).

> > 
> > If this is the case, I think write pointer inconsistency will happen even if
> > fsck does "migrate all dnode blocks" (I assume that the warm node curseg's next
> 
> Actually, I notice that scheme's problem is: we've changed zone's write pointer
> during dnode blocks migration, however if kernel drops recovery, we will still
> face inconsistent status in between .next_blkaddr and .write_pointer, once we
> start to write data from .next_blkaddr. So in fsck, after migration, we need to
> reset .write_pointer to .next_blkaddr.
> 
> I guess we need to consider four cases:
> 
> o: support .write_pointer recovery
> x: not support .write_pointer recovery
> 
> 1) kernel: o, fsck: x, trigger recovery in kernel
> 2) kernel: o, fsck: x, not trigger recovery in kernel
> 3) kernel: x, fsck: o, trigger recovery in kernel
> 4) kernel: x, fsck: o, not trigger recovery in kernel
> 
> For 1) and 2), we can simply adjust to reset all invalid zone and allocate new
> zone for curseg before data/meta writes.

Thanks for the clarification. This approach for case 1) and 2) is simple. Let me
try to create a patch for it.

> 
> For 3) and 4), I haven't figured out a way handling all cases perfectly.

For 3), I suppose fsck cannot fix write pointer inconsistency without fsync data
loss, since recovery is judged and done by kernel. The write pointer consistency
fix after recovery can be done only by kernel.

It is not a good one but one idea is to confirm fsck users to enforce fsync data
loss or not. This could be better than nothing.

For 4), my understanding is that fsync data is not left in the file system. I
think fsck can check fsync data existence and fix write pointer consistency, as
my patch series shows.

> 
> > blkoff points to the migrated dnode block chain start). After the fsync data fix
> > by kernel, warm node curseg will not point to the write pointer position.
> > Anyway, kernel code change will be required to fix the inconsistency after fsync
> > data fix.
> > 
> > How about to have fsck leave warm node curseg position untouched if the fsync
> > data exists? The kernel side change for write pointer inconsistency will be able
> > to cover this case.
> 
> If kernel can handle such case, fsck doesn't need to do any thing, IIUC.

You are right. I mixed cases 1)2) and cases 3)4).

Thanks again for your comments.

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
