Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C87A6417
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2019 10:37:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i54JS-00045P-Q1; Tue, 03 Sep 2019 08:37:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=142818f86=shinichiro.kawasaki@wdc.com>)
 id 1i54JQ-00044w-Tk
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Sep 2019 08:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BrktW7aILm/9+zvmSepistIZBROc49bLDbgc/FN+D4Y=; b=JY6hXwwxe5EHTj0Hch2s0i94Az
 I2xsX0QD6OJymWlNeGQ9JukMU2qtiKGZ4lnup6WacCfbwrdd28wEgiSvZqR0Xf4jarj1bT2+jKopT
 XxqJUpkHvHXLZHmej65WA/GkuXnFpv8c1SpkZtzlVs/aJUu2C9CMLK0/tLWQImW9W7Gc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BrktW7aILm/9+zvmSepistIZBROc49bLDbgc/FN+D4Y=; b=ZYtEMLJp/AbgBMeEQHzi2hFk1S
 f+YmnvieEx59X5krRkWfVl2I+V+KP6cMypmYMpnUhw9kxcZQ0iOacULlXXA6BI+Mmdw4BsEv6S+J3
 YicMNTUTZ9CV2IeYMP+oITFxBVToFjJowN3RUoQe7dmTzHRjW9xNMNhKcump7j9mO9dI=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i54JP-00EJwM-71
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Sep 2019 08:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1567499835; x=1599035835;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RBIQj9bAygXMcu5o2KByEdUHqklYBXENS2xbri/l4Ws=;
 b=SowDE0ZuYWa2UF6YIzvWK6FVQTG0KJD9Hk2DqT+gwnsuI1YglVYEFPfQ
 T87mUVM89TQTw/uvP5rNacWkV4OtPoMiABJ9NIgqWaWz0INYhCSCdux9c
 6DDpv0L6u1rVzZ8HuSusqg2Z1eCE+3Lom+7o8x5gMjU8Nieb6aF/XSYxT
 gkL+ijVhIS4HZadM6hELneHitKRXhbJ4cz+eAg9SZZiH7FCX6iUvP+5JJ
 5t8BNp7H2dtrmKmxb6FniK6XOWbp9JPpI7GzvEiIliIYKhIZg270VyN9E
 XbQ6MyuBCS8gOoLuyhhMLydfXtzjQUX1XvxRXaQnOTGLMaEWo65OyStsG A==;
IronPort-SDR: OrcaJm2PYd13CWSgom+Qw5pOrAwrWBrOBkkuz+C0IyDAoo14vqrCO8BDBO0wuPtJ+Jb2EiJjAY
 KZXIdYHstC+bOk8RpJJc/Q9wq4XO+hTwxGBfiIhR1P/Guo+TCQbuwUQ7F5E8a3r8se2tN79OMO
 JrkFNqypuiLjtNPQHbXcC0NxNWM0C8hIKq9RFqjVbsA4BNrK3/+qwXaVSvlDDafWsq+zq3nf4C
 qxmFqeGu8yGkvO7YbQFQ7Dm4+CAPwrEGhntyVPSQArJrTL3whZNav8KewCq9cOKz+3Xpne8tHy
 lUM=
X-IronPort-AV: E=Sophos;i="5.64,462,1559491200"; d="scan'208";a="118824983"
Received: from mail-by2nam03lp2050.outbound.protection.outlook.com (HELO
 NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.50])
 by ob1.hgst.iphmx.com with ESMTP; 03 Sep 2019 16:37:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikHzTB5icf43ZpW070WcfZ1If1bd+TN1NogimEirTtixOAa1nehxvqorN/IpEGE/9i3Zg2n8dvxst6XnVLkuoWcQ/1GXUMtsg1emsHDqaNlJazt8q7sVdpWgiYX/dVgkQwaBgF69zHKTQ7V46DtvMeZQHCSNgWD4Bd7PoqYaBgMfo3G7vdGc7dW/rR+jC4Ig/ze8UrtC0m480zC/URm1jopZwsbiqjQ6Qn8v5jHlGzkb3oiD36qrbnnRK84gHYZ2NHVJWPZdH2z83RxZ7n5Dp7kqvdB0i5aN1CWjVEUu3pnrM02UzEatdpVgDBMS1he42LhyJAWgZ6xx8OfBSux+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrktW7aILm/9+zvmSepistIZBROc49bLDbgc/FN+D4Y=;
 b=frQu9GwdVp4WAVaieZM6OIzbUKYJryGi+RihgZW4hDHUD+QmuaBj5C4DQNMVAxJF5mMiNJjaPVb2XcDJDUGvHAp3KtXrHVshpCrKPZd4gnK68bv8keD7CPbE/6erQNs3Myfga1yVKyFe1fUPKIHrX+XrLEUxJxYah9ybr5fMZC4D2ihxEKGPNSfYPPL6eruzVe6XEqjnfL8ZPGz00sTkpupRRA3VpnONuS3ijJB0ap5YgYLJORxxOQo5a7skudgKPLNOrnGZf1SYhRabdXzlCCs8JiyySW8qvt/1z7d9RICdoHCh6vnAKfKQJLqARL7TCB3yyiu/umjGjbWNsWjWww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrktW7aILm/9+zvmSepistIZBROc49bLDbgc/FN+D4Y=;
 b=B+gcydc8leBXD5OmB6DRQre/LeRkWXPulStZIQQf3r+0n178Kaqjckbf5EftiFZHrp9Sox0ynUIFfXePvIRgTT29sFCrWnEdz9zbVuZpm18toEAPk4jNl95PE9BMsXBXtZHVDqcv4GHjdnNj4UMRkNk8SSGBG+5BCh5K5xhOLgg=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2267.namprd04.prod.outlook.com (10.167.9.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Tue, 3 Sep 2019 08:37:08 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::88:72f2:2211:6b8b]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::88:72f2:2211:6b8b%8]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 08:37:08 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v4 2/2] fsck.f2fs: Check write pointer consistency with
 current segments
Thread-Index: AQHVXxx1rSkyH6+CAkmLT6J96mLmOKcX+ocAgAGsxgA=
Date: Tue, 3 Sep 2019 08:37:08 +0000
Message-ID: <20190903083704.kmc5bwfdpeinzfle@shindev>
References: <20190830101936.32265-1-shinichiro.kawasaki@wdc.com>
 <20190830101936.32265-3-shinichiro.kawasaki@wdc.com>
 <486550b2-bb47-d725-79a9-4fb3a4ba28e3@huawei.com>
In-Reply-To: <486550b2-bb47-d725-79a9-4fb3a4ba28e3@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: adff34a8-b4fa-4bef-4270-08d73049e866
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY1PR04MB2267; 
x-ms-traffictypediagnostic: CY1PR04MB2267:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2267D081E990A883F5CFB56AEDB90@CY1PR04MB2267.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(7916004)(376002)(346002)(136003)(396003)(366004)(39860400002)(52314003)(189003)(199004)(99286004)(6436002)(66446008)(66556008)(66476007)(64756008)(53936002)(66946007)(25786009)(6512007)(9686003)(91956017)(76116006)(4326008)(6246003)(86362001)(1076003)(2906002)(6486002)(3846002)(6116002)(26005)(186003)(305945005)(76176011)(8936002)(229853002)(58126008)(81166006)(81156014)(8676002)(53546011)(6506007)(102836004)(6916009)(33716001)(71200400001)(11346002)(446003)(71190400001)(486006)(476003)(14444005)(5660300002)(256004)(66066001)(14454004)(478600001)(7736002)(44832011)(54906003)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2267;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: weHqh0EVoX4sCINJoRE9q2xvcleDGcx/l/n0PIyXssqLaRo4cdDvaMl1rriRjE7McIUyF2iWlHv0LIqZS8Pl1zNKKzxxWN6yITYUAHh4CZH92m6bunHfrLzwmODAIV14iYTi/wi0+OKy5tw2YVPxeT578rsOnRWSzFJPHVYHuNOUZXZLRwvn3W4qlFTzof4kduCDHqz0+GZwCOQVZEkbLg6+F6R1tfWvX9lawUxd9ugUBCjjP2PaEQnq3aysta48rGk3VslKU1B413ikIETCpeJqXP3ofday79/W1NZQM/PBgZTam5S/HvdkD5MlzgNNvXYJOkD/BCeaug7xmSi4S9gqu2Rnj6Vo1ZNgiYVK+RKIzraOaoncYZt1wV/RO7cvUhBixxGUZ9KKZFZY5/qSipZAFvey77FsMt7TNFa7kPE=
Content-ID: <0F4386B57AEA1E4388E7C7F2082AF021@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adff34a8-b4fa-4bef-4270-08d73049e866
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 08:37:08.4216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jTv81xEEoSKfFDDKCIeIGKybEt28sADCxVVADVrGimzgN1zDU2SexiZ6T4DY/OOQjUKOCJvFOOHpsuGaqZDFFvfKrgYM83rPIkN652y/Bdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2267
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
X-Headers-End: 1i54JP-00EJwM-71
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

On Sep 02, 2019 / 15:02, Chao Yu wrote:
> On 2019/8/30 18:19, Shin'ichiro Kawasaki wrote:
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
> > position. If the write pointer goes to the zone end, find a new zone and
> > set the current segment position at the new zone start. In case the write
> > pointer is behind the current segment, write zero data at the write
> > pointer position to make write pointer position at same as the current
> > segment.
> > 
> > When inconsistencies are found, turn on c.bug_on flag in fsck_verify() to
> > ask users to fix them or not. When inconsistencies get fixed, turn on
> > 'force' flag in fsck_verify() to enforce fixes in following checks. This
> > position fix is done at the beginning of do_fsck() function so that other
> > checks reflect the current segment modification.
> > 
> > Also add GET_SEC_FROM_SEG and GET_SEG_FROM_SEC macros in fsck/fsck.h to
> > simplify the code.
> > 
> > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > ---
> >  fsck/f2fs.h |   5 ++
> >  fsck/fsck.c | 198 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  fsck/fsck.h |   3 +
> >  fsck/main.c |   2 +
> >  4 files changed, 208 insertions(+)
> > 
> > diff --git a/fsck/f2fs.h b/fsck/f2fs.h
> > index 4dc6698..2c1c2b3 100644
> > --- a/fsck/f2fs.h
> > +++ b/fsck/f2fs.h
> > @@ -337,6 +337,11 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
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
> > index 8953ca1..a0f6849 100644
> > --- a/fsck/fsck.c
> > +++ b/fsck/fsck.c
> > @@ -2574,6 +2574,190 @@ out:
> >  	return cnt;
> >  }
> >  
> > +/*
> > + * Search a free section in main area. Start search from the section specified
> > + * with segno argument toward main area end. Return first segment of the found
> > + * section in segno argument.
> > + */
> > +static int find_next_free_section(struct f2fs_sb_info *sbi,
> > +				  unsigned int *segno)
> > +{
> > +	unsigned int i, sec, section_valid_blocks;
> > +	unsigned int end_segno = GET_SEGNO(sbi, SM_I(sbi)->main_blkaddr)
> > +		+ SM_I(sbi)->main_segments;
> > +	unsigned int end_sec = GET_SEC_FROM_SEG(sbi, end_segno);
> > +	struct seg_entry *se;
> > +	struct curseg_info *cs;
> > +
> > +	for (sec = GET_SEC_FROM_SEG(sbi, *segno); sec < end_sec; sec++) {
> > +		/* find a section without valid blocks */
> > +		section_valid_blocks = 0;
> > +		for (i = 0; i < sbi->segs_per_sec; i++) {
> > +			se = get_seg_entry(sbi, GET_SEG_FROM_SEC(sbi, sec) + i);
> > +			section_valid_blocks += se->valid_blocks;
> 
> If we want to find a 'real' free section, we'd better to use
> se->ckpt_valid_blocks (wrapped with get_seg_vblocks()) in where we has recorded
> fsynced data count.

Thanks. When I create next patch series, I will use get_seg_vblocks().
I will rebase to dev-test branch in which get_seg_vblocks() is available.

> 
> > +		}
> > +		if (section_valid_blocks)
> > +			continue;
> > +
> > +		/* check the cursegs do not use the section */
> > +		for (i = 0; i < NO_CHECK_TYPE; i++) {
> > +			cs = &SM_I(sbi)->curseg_array[i];
> > +			if (GET_SEC_FROM_SEG(sbi, cs->segno) == sec)
> > +				break;
> > +		}
> > +		if (i >= NR_CURSEG_TYPE) {
> > +			*segno = GET_SEG_FROM_SEC(sbi, sec);
> > +			return 0;
> > +		}
> > +	}
> > +
> > +	return -1;
> > +}
> > +
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
> > +	unsigned int zone_segno, wp_segno, new_segno;
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
> > +	if (wp_segno == zone_segno + segs_per_zone) {
> > +		/*
> > +		 * If the write pointer is in advance from the curseg and at
> > +		 * the zone end (section end), search a new free zone (section)
> > +		 * between the curseg and main area end.
> > +		 */
> > +		new_segno = wp_segno;
> > +		ret = find_next_free_section(sbi, &new_segno);
> > +		if (ret) {
> > +			/* search again from main area start */
> > +			new_segno = GET_SEGNO(sbi, SM_I(sbi)->main_blkaddr);
> > +			ret = find_next_free_section(sbi, &new_segno);
> > +		}
> 
> If curseg's type is warm node, relocating curseg would ruin warm node chain,
> result in losing fsynced data for ever as well.
> 
> So I guess we should migrate all dnode blocks chained with cs->next_blkoff in
> current section.
> 
> > +		if (ret) {
> > +			MSG(0, "Free section not found\n");
> > +			return ret;
> > +		}
> > +		FIX_MSG("New section for curseg %d: [0x%x,0x%x]->[0x%x,0x%x]",
> > +			cs_index, cs->segno, cs->next_blkoff, new_segno, 0);
> > +		cs->segno = new_segno;
> > +		cs->next_blkoff = 0;
> > +	} else {
> > +		/*
> > +		 * If the write pointer is in advance from the curseg within
> > +		 * the zone, modify the curseg position to be same as the
> > +		 * write pointer.
> > +		 */
> > +		ASSERT(wp_segno < zone_segno + segs_per_zone);
> > +		FIX_MSG("Advance curseg %d: [0x%x,0x%x]->[0x%x,0x%x]",
> > +			cs_index, cs->segno, cs->next_blkoff,
> > +			wp_segno, wp_blkoff);
> > +		cs->segno = wp_segno;
> > +		cs->next_blkoff = wp_blkoff;
> 
> The same data lose problem here, I guess we'd better handle it with the same way
> as above.
> 
> Thoughts?

I created f2fs status with fsync data and warm node chain, and confirmed the v4
implementation ruins the dnode blocks chain. Hmm.

My understanding is that when f2fs kernel module recovers the fsync data, it
sets the warm node curseg position at the start of the fsync data, and the fsync
data will be overwritten as new nodes created. Is this understanding correct?

If this is the case, I think write pointer inconsistency will happen even if
fsck does "migrate all dnode blocks" (I assume that the warm node curseg's next
blkoff points to the migrated dnode block chain start). After the fsync data fix
by kernel, warm node curseg will not point to the write pointer position.
Anyway, kernel code change will be required to fix the inconsistency after fsync
data fix.

How about to have fsck leave warm node curseg position untouched if the fsync
data exists? The kernel side change for write pointer inconsistency will be able
to cover this case.

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
