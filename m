Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B39EE221511
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jul 2020 21:25:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jvn24-0001Cq-FC; Wed, 15 Jul 2020 19:25:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=458bff750=Aravind.Ramesh@wdc.com>)
 id 1jvn23-0001Ci-6m
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 19:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nz2tLzLH61+Xz6ddRA7ypgRltssH7I+7u2WHe4v0P5E=; b=AuybJ2X2CwsBcTv+2ck4/ijZgy
 4w2gSowRFrgc0vdF1zl2hvifJcjyV8y51Xzfr0KgUTd0zVriKnPx9R39yONW3e7O9wcl1oVaMyG4H
 4AKWnmXZcljWzgcqk60Uf12jADnZk6H4EV4+j1FrI5ODP/SCVoktm2EdBmgbyZ9C2XZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nz2tLzLH61+Xz6ddRA7ypgRltssH7I+7u2WHe4v0P5E=; b=axXunKdqbH7zjWghnZA0nEvKjB
 0KnIUGK2qFKTqdRKsb0sXa46qV3a32cjpbwOgAxDdaQPEmaXQL/f2DeBaaAlpm/zDL9f9qBlbgqY6
 6jE6dDkP+owwJjby1g9KH+NH2ckayV1RKBlyjsl9HfNL7pirxfsxeyCBhy4Wzf2RqkTI=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jvn21-009ANr-6J
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 19:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594841129; x=1626377129;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F1aV/13SFahbJI/D0J91PjdyKaSfXwBPmhqDyaRZf8w=;
 b=VRerr1ZN5hh0jMlYzxUw4+a0+OUgLRmIAiU2at3EN4cF0RQuE7FOvbMX
 b4PEgTt3XKnn7/Yl/Mj7rIoUk+7VrXpkJnhD3QppdH+6Hh6aosSHsPBFr
 7h9vO9RfHFvRQRvSZ4cvQB/88JZTvj0IQ9uDHcRmT39yPbPge+rE4zzZP
 hzzKe5p1k4o9Her1lweRVnb40en4/G0gdzjry6L2YXNDiyj6eB3nZCIRH
 vd5VelKoDCYZ6sNxw1NXMWKYtg6FCsXKvfwLvRYAZrwMLyEY9TMJ8/ew0
 23GZgYXmmtUhmJ1ih/14CNbHW3ZJwpRdqyvAPgxWKdv90j8idbE9Pn5BT g==;
IronPort-SDR: PWOEQvTljdxgfy1d/CRfnuPsT2j8zAKWSuMcNucGweFvDyC5zIoTGSN4nZVrFU/vEmQh8sWTcT
 0E7gtSkgT8SvZQpNjYLWZE4Lj1o53F0rjYOJ95OYZQL9j3wQctGMshOxFitZ4giMm5JsqM0aix
 aG8q19E81VebugLgHihY994XlCnWVndzVpjEJfOreFr+Y5W6PTkD7MeLoRDEcxLVuaSJVNf7bI
 pGp27cF4wtVvCQU9uMgwXpqKUSBF+NEoqW/pYNp6IidJG7GnmWGoxQe4ZQY9oi6ylw7hkFLeWV
 bg8=
X-IronPort-AV: E=Sophos;i="5.75,356,1589212800"; d="scan'208";a="146856136"
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hgst.iphmx.com with ESMTP; 16 Jul 2020 03:25:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0VDlA1RLju0c6u1EQXugLnSqpxgfpA/la8u/utQrRjzXd8OghL9fgAfGij2+rpO8pNlAMpUrlrrnkq0U5sboEq6m+OznCfOtmq/S7Fla59yexK1XBnhjTmGwaOKCHDEKB5wCLWJPfN6GYbvrcvBiBoh1EBcHjlxInbINyussidrBVJ3hOhC7RtsX/pZ11qNWmbz/6Rx98OdfMku8XyKEOtI3Z4rtV+6r9HKQZ0UGzq7J8G6w3YDAVqzollA9gItKuxeXjCSXYbk2rAcbXPoVC53Lgo0VJ1W+yPKdFiTZ3xxcJi9CMB4WjdIYvw7oJjxYPCtOdqLMm+kwgKbHOuVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nz2tLzLH61+Xz6ddRA7ypgRltssH7I+7u2WHe4v0P5E=;
 b=Z0Ohh4oOWHXsTjOZD72D6GX5vCXNnTcseAOhmLnDbotPoNEVlbKe9vOg4JJ+EihztuEhf2B4M2BQ0gEEPFzIn0C3U/wYfeyycLIyyGvZWEHeikHXBApJzjnlhkvd0FcTBLpLkvhqijUyLkZ36m7Yd+IwtLOQDOHpzUlC7P/W8K1pp/58U6xfG/UEFy9sOQMmBqOlaD+N4Db6imuT6nFZYwa9xAeN9f6H2daIurm9GgjCSKfbXerqZ2RRzvjs7aWMwGRmUX82ulXwpk6kp8BWv3oajV4RRk7DpMHRXMCpJvyI6MCBszDfvVLRtAL1xwqAZV8EHJkcXPeUS+JeOqy5GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nz2tLzLH61+Xz6ddRA7ypgRltssH7I+7u2WHe4v0P5E=;
 b=f56kga8i3l76H1ZfVkwjWhvXSdy/GdhYwo5+e+4rQ+nxDfmouJoqDz32aK0fDGIOrLmuxZy2GIJeIhJ+duaFRvSSXOBSKegell9J8FbqSkQbWVllUenq1iG+/7pNDgOoBMjso5BM/V0TEn0A0FfPd6MO1aWTMRnQBXziBcyPvRI=
Received: from BY5PR04MB6995.namprd04.prod.outlook.com (2603:10b6:a03:22c::12)
 by BYAPR04MB6085.namprd04.prod.outlook.com (2603:10b6:a03:ea::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Wed, 15 Jul
 2020 19:25:11 +0000
Received: from BY5PR04MB6995.namprd04.prod.outlook.com
 ([fe80::f813:2bba:2c5c:a63b]) by BY5PR04MB6995.namprd04.prod.outlook.com
 ([fe80::f813:2bba:2c5c:a63b%7]) with mapi id 15.20.3174.026; Wed, 15 Jul 2020
 19:25:11 +0000
From: Aravind Ramesh <Aravind.Ramesh@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [PATCH 2/2] fsck.f2fs: validate free seg count on zns device
Thread-Index: AQHWUIkY24OsF95FT0KbWMdSYlHLgqkF8KoAgAMpJtA=
Date: Wed, 15 Jul 2020 19:25:11 +0000
Message-ID: <BY5PR04MB6995F2BE6AF28D7FB7A4E6B58C7E0@BY5PR04MB6995.namprd04.prod.outlook.com>
References: <20200702155427.13372-1-aravind.ramesh@wdc.com>
 <20200702155427.13372-3-aravind.ramesh@wdc.com>
 <20200713190736.GA3131494@google.com>
In-Reply-To: <20200713190736.GA3131494@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [106.51.109.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 939dab0d-8faf-43b5-bc7d-08d828f4cb23
x-ms-traffictypediagnostic: BYAPR04MB6085:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB6085F62DA461833DE4D1FE578C7E0@BYAPR04MB6085.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S7m60mp4kdIqf+Z7unweCr71nbQxsoXK7MGXdmVrq/4nCvzD9EAw0g9HqxW/RapHz9SMAc1ERxYwc8pLFQVeNk/VeGFSUmoL1Ku+hVaXi7yQiLYzletlanNmcy+khf5pSg+3UKtwSJQkjOPYgxVTX5Abw6ROGSCwwdL4CeCSjyqyMa/IfkKlC5ATrtBKsB8l6TvlSSZJ9tqC43yqoYvY72u8TsEjdjVWr7u/o8TS8YInha37HLTzIFww7pMIzkO9p74Bn/l+gx2EUDnB18YVPuQLb2i8+UUnV8+wI+Qek0S8/yXCwHpRwaEpgpDS4jCn0kmq46FGKgysdqVE6ktkeA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6995.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(6916009)(4326008)(66446008)(64756008)(8676002)(76116006)(71200400001)(54906003)(8936002)(478600001)(83380400001)(52536014)(2906002)(55016002)(6506007)(53546011)(316002)(7696005)(186003)(33656002)(66556008)(5660300002)(26005)(9686003)(66946007)(86362001)(66476007)(55236004)(15650500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: i8g/B2Czz6AY4rKU5EtbgOAYdyYCYoWSj0+Mil9NsNkwi5kL4o03aqojlD/ihNyajaoApzNQkk7TT+zS/ryNWOwUM0Hm4kecop4idS6dxO+SdvTggFpuh9A+2zWKGcvvdG1vzV93UkJwKbENNmPjtIZdDufP1f1dJNCeud9rE0YDQYTpYua4pNdJBgwvFgMwUxajCxGrvaQZnd1t1jJpRdu17MXresSss2cUkjuGpN95yA2YJg4OCor0ss9Ogilz5Ny5WUGn0h7Lvc4YHvg3xeM+K06koGBnPLG9imB98WJduEDxedmdD3kJ9vJ8Jd6MZsnY5RqWr3FTatYbQ1C+XFfUqb4qKP0tgg8B0tBQqh9H7Jr9PhuzSLL+4vq6crxq5aOT24hr/lrHFi0P0YS8W4V4kDDX1BhH9jK88Pb5VeNgIZ7pUzZvRpU8OM/dCdHGyHdbpmcDPblJydh8d65xLQFE5ez/i7gQQr3kcnc4suhZ99mQO8vjAK35dTr1kNh7
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6995.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939dab0d-8faf-43b5-bc7d-08d828f4cb23
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2020 19:25:11.6699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aLuFZCSpV2JpNAB3jskT5GqB25gBuCY/rpBPK01ogjTPtByV3+JBM6cEHzYMI2vHkjfHMrGHbLMw/qHjiQ5qUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6085
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jvn21-009ANr-6J
Subject: Re: [f2fs-dev] [PATCH 2/2] fsck.f2fs: validate free seg count on
 zns device
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
Cc: Matias Bjorling <Matias.Bjorling@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



> -----Original Message-----
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> Sent: Tuesday, July 14, 2020 12:38 AM
> To: Aravind Ramesh <Aravind.Ramesh@wdc.com>
> Cc: yuchao0@huawei.com; linux-f2fs-devel@lists.sourceforge.net; Shinichiro
> Kawasaki <shinichiro.kawasaki@wdc.com>; Matias Bjorling
> <Matias.Bjorling@wdc.com>
> Subject: Re: [PATCH 2/2] fsck.f2fs: validate free seg count on zns device
> 
> Hi Aravind,
> 
> On 07/02, Aravind Ramesh wrote:
> > NVMe Zoned Namespace devices can have zone-capacity less than zone-size.
> > Zone-capacity indicates the number of usable blocks in a zone, if
> > zone-capacity is less than zone-size, then the segments which start
> > at/after zone-capacity are considered unusable. Only those segments
> > which start before the zone-capacity are considered as usable and
> > added to the free_segment_count and free_segment_bitmap of the kernel.
> >
> > Allow fsck to find the free_segment_count based on the zone-capacity
> > and compare with checkpoint values.
> >
> > Signed-off-by: Aravind Ramesh <aravind.ramesh@wdc.com>
> > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > ---
> >  fsck/fsck.c  |  5 ++--
> >  fsck/fsck.h  |  2 ++
> >  fsck/mount.c | 75
> > ++++++++++++++++++++++++++++++++++++++++++++++++++--
> >  3 files changed, 78 insertions(+), 4 deletions(-)
> >
> > diff --git a/fsck/fsck.c b/fsck/fsck.c index e110f3d..ba2340d 100644
> > --- a/fsck/fsck.c
> > +++ b/fsck/fsck.c
> > @@ -1905,11 +1905,12 @@ int fsck_chk_meta(struct f2fs_sb_info *sbi)
> >  		if (IS_NODESEG(se->type))
> >  			sit_node_blks += se->valid_blocks;
> >  	}
> > -	if (fsck->chk.sit_free_segs + sit_valid_segs != TOTAL_SEGS(sbi)) {
> > +	if (fsck->chk.sit_free_segs + sit_valid_segs !=
> > +				get_usable_seg_count(sbi)) {
> >  		ASSERT_MSG("SIT usage does not match: sit_free_segs %u, "
> >  				"sit_valid_segs %u, total_segs %u",
> >  			fsck->chk.sit_free_segs, sit_valid_segs,
> > -			TOTAL_SEGS(sbi));
> > +			get_usable_seg_count(sbi));
> >  		return -EINVAL;
> >  	}
> >
> > diff --git a/fsck/fsck.h b/fsck/fsck.h index bc6a435..e86730c 100644
> > --- a/fsck/fsck.h
> > +++ b/fsck/fsck.h
> > @@ -224,6 +224,8 @@ extern u32 update_nat_bits_flags(struct
> f2fs_super_block *,
> >  				struct f2fs_checkpoint *, u32);
> >  extern void write_nat_bits(struct f2fs_sb_info *, struct f2fs_super_block *,
> >  			struct f2fs_checkpoint *, int);
> > +extern unsigned int get_usable_seg_count(struct f2fs_sb_info *);
> > +extern bool is_usable_seg(struct f2fs_sb_info *, unsigned int);
> >
> >  /* dump.c */
> >  struct dump_option {
> > diff --git a/fsck/mount.c b/fsck/mount.c index d0f2eab..72ca0cb 100644
> > --- a/fsck/mount.c
> > +++ b/fsck/mount.c
> > @@ -30,6 +30,76 @@
> >  #define ACL_OTHER		(0x20)
> >  #endif
> >
> > +static int get_device_idx(struct f2fs_sb_info *sbi, u_int32_t segno)
> > +{
> > +	block_t seg_start_blkaddr;
> > +	int i;
> > +
> > +	seg_start_blkaddr = SM_I(sbi)->main_blkaddr +
> > +				segno * DEFAULT_BLOCKS_PER_SEGMENT;
> > +	for (i = 0; i < c.ndevs; i++)
> > +		if (c.devices[i].start_blkaddr <= seg_start_blkaddr &&
> > +			c.devices[i].end_blkaddr > seg_start_blkaddr)
> > +			return i;
> > +	return 0;
> > +}
> > +
> > +#ifdef HAVE_LINUX_BLKZONED_H
> > +
> > +static int get_zone_idx_from_dev(struct f2fs_sb_info *sbi,
> > +					u_int32_t segno, u_int32_t dev_idx) {
> > +	block_t seg_start_blkaddr = START_BLOCK(sbi, segno);
> > +
> > +	return (seg_start_blkaddr - c.devices[dev_idx].start_blkaddr) >>
> > +			log_base_2(sbi->segs_per_sec * sbi->blocks_per_seg); }
> > +
> > +bool is_usable_seg(struct f2fs_sb_info *sbi, unsigned int segno) {
> > +	unsigned int secno = segno / sbi->segs_per_sec;
> > +	block_t seg_start = START_BLOCK(sbi, segno);
> > +	block_t blocks_per_sec = sbi->blocks_per_seg * sbi->segs_per_sec;
> > +	unsigned int dev_idx = get_device_idx(sbi, segno);
> > +	unsigned int zone_idx = get_zone_idx_from_dev(sbi, segno, dev_idx);
> > +	unsigned int sec_off = SM_I(sbi)->main_blkaddr >>
> > +						log_base_2(blocks_per_sec);
> > +
> > +	if (zone_idx < c.devices[dev_idx].nr_rnd_zones)
> > +		return true;
> > +
> > +	if (c.devices[dev_idx].zoned_model != F2FS_ZONED_HM)
> > +		return true;
> > +
> > +	return seg_start < ((sec_off + secno) * blocks_per_sec) +
> > +				c.devices[dev_idx].zone_cap_blocks[zone_idx];
> > +}
> > +
> > +unsigned int get_usable_seg_count(struct f2fs_sb_info *sbi) {
> > +	unsigned int i, usable_seg_count = 0;
> > +
> > +	for (i = 0; i < TOTAL_SEGS(sbi); i++)
> > +		if (is_usable_seg(sbi, i))
> > +			usable_seg_count++;
> > +
> > +	return usable_seg_count;
> > +}
> > +
> > +#else
> > +
> > +bool is_usable_seg(struct f2fs_sb_info *sbi, unsigned int segno)
> 
> I've applied the below small change to avoid Android build error.
> 
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -88,7 +88,7 @@ unsigned int get_usable_seg_count(struct f2fs_sb_info *sbi)
> 
>  #else
> 
> -bool is_usable_seg(struct f2fs_sb_info *sbi, unsigned int segno)
> +bool is_usable_seg(struct f2fs_sb_info *UNUSED(sbi), unsigned int
> +UNUSED(segno))
>  {
>         return true;
>  }
> 
> Thanks,

Ok. 

Thank you,
Aravind

> 
> > +{
> > +	return true;
> > +}
> > +
> > +unsigned int get_usable_seg_count(struct f2fs_sb_info *sbi) {
> > +	return TOTAL_SEGS(sbi);
> > +}
> > +
> > +#endif
> > +
> >  u32 get_free_segments(struct f2fs_sb_info *sbi)  {
> >  	u32 i, free_segs = 0;
> > @@ -37,7 +107,8 @@ u32 get_free_segments(struct f2fs_sb_info *sbi)
> >  	for (i = 0; i < TOTAL_SEGS(sbi); i++) {
> >  		struct seg_entry *se = get_seg_entry(sbi, i);
> >
> > -		if (se->valid_blocks == 0x0 && !IS_CUR_SEGNO(sbi, i))
> > +		if (se->valid_blocks == 0x0 && !IS_CUR_SEGNO(sbi, i) &&
> > +							is_usable_seg(sbi, i))
> >  			free_segs++;
> >  	}
> >  	return free_segs;
> > @@ -2337,7 +2408,7 @@ void build_sit_area_bitmap(struct f2fs_sb_info *sbi)
> >  		memcpy(ptr, se->cur_valid_map, SIT_VBLOCK_MAP_SIZE);
> >  		ptr += SIT_VBLOCK_MAP_SIZE;
> >
> > -		if (se->valid_blocks == 0x0) {
> > +		if (se->valid_blocks == 0x0 && is_usable_seg(sbi, segno)) {
> >  			if (le32_to_cpu(sbi->ckpt->cur_node_segno[0]) == segno
> ||
> >  				le32_to_cpu(sbi->ckpt->cur_data_segno[0]) ==
> segno ||
> >  				le32_to_cpu(sbi->ckpt->cur_node_segno[1]) ==
> segno ||
> > --
> > 2.19.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
