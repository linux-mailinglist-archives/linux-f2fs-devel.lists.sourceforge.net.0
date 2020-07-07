Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDDC21769C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jul 2020 20:24:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jssG5-0001a7-BQ; Tue, 07 Jul 2020 18:23:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=450070042=Aravind.Ramesh@wdc.com>)
 id 1jssG4-0001Zy-Cy
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 18:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bY4XCyePRDwshO92QndtNwTbWGL4RW9FlKFnVOaALbc=; b=WnJhi+bUcjmWDEtcdm2v6Der9r
 7zwTXEvjRYG/I9M8WXa9rgO8neYKFrcKPOBvLyJBsNTdVGe0LgowrC4wOTJnFzL8+Sv6r8j4O25uU
 jE0j+tbToiyiveuKc2YpsfmHRN40Yxodwy/FwKmWvYEcs8OZylsClqCNzrhLwFPj2qtU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bY4XCyePRDwshO92QndtNwTbWGL4RW9FlKFnVOaALbc=; b=I9KeGAWAEpF0TbXbAKCH6Up6Wl
 WdwwSo9WPuRTrzvk8L5kL363y3Ni+ArHGVurNuvMvaHQgYcNqPrQsnIfZUqhjnzf9adWQbjvKdY2a
 5g7O6T6gmjtG1nPNXERTr1AaFQl+NlmRb0huqeYa6BkWo9pStqq3l5xjzSzEQpC9r+IQ=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jssFy-00GSQQ-R8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 18:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594146231; x=1625682231;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NFG6ZcY/Wq+Za+XZKRrl3IM4Q0sf4jb58wLUu/hP/Ek=;
 b=IQz40NoBFju8MKcdoto4+EfYjdY1WnMtubl2wz6D8nH1e3KPbu+C/YEK
 9K3x+cVhgROulqcciXtvUElOkg4m6rW4Miq4M+oNB99mOrXvrgygTelaR
 9Axz47+3jdPJp455QXvrD6NftTWvsBt18oDxnFY7S9v2bWWPCM9I6xQ6U
 eTFZxS+Uo0oqhYovz9Sf1Xb++dFlbkT2BcY4zyc66/dwX+zCPkm98el+Q
 48hCHLc//bCp46M6Cr68EIJ7Z/KhDk5IAh8H7TAOSEDdBQiaFcT1EhGoi
 da7+Bgnj6qsThiymLmR6rlGa/VlRQFs5ZburgrVSLGiHZP8M3fDy5PzEd w==;
IronPort-SDR: Z+gYtzkK9uTa7ZZW7Qfb4RqFzmMMAGvAnz6thrUUGJLnGFG4+xV3NOjf+c4IhCnVvC+ZnRmaFN
 xqsoCaMWezXJ5TFpNghtIzGqsPEivYBK0R97v/3DAAb9yFlhZFpMk4cw7+etBCSTZIGJUtlMjA
 aB/U4TQ3dn5MWYqhMTFx7ltY8hev2SU8YcepC583FeGx/0qAa3lcbJLAlRyX7dWTusOwHrELLt
 fhEbQ+1c6PYfzWpAumR4KJKbaurm3TBc+qnaq7DWgEphR6AVWS+6s/0GsY2x/IQYMujRy5FS0L
 QFA=
X-IronPort-AV: E=Sophos;i="5.75,324,1589212800"; d="scan'208";a="143180252"
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jul 2020 02:23:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PObZ6w8XMIccrE+zd7WDYmbkxISL2UPw3x8BXiUTJZ/CQSFym9y3cC6P4+en0OdCvSJebuvXy9N1XEKGunWp25b93w/0K3/jc8NwB/BMeytRIgKXXlE5IJofP4CoUxV8Qnq0yO/5HGTFXIMn+78okTIIJjGrSAZhPoYhPKO6AH+sC0mWS6dxX/qpB4k1ms5i29gK2LaZ9Ec51Lg0kt9FyGqdXTqOQlg1gHyGwfwiEMBH4WSMC97Pdg4v3uwPrZs7hYu9upX6qEywjvKh1n0Ve2rHSTQLJE6IzEgd8R3vToU7UttlZ8K1DpniEb23qLEhcJ1PFBTeH1YQ70/GBw/1JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bY4XCyePRDwshO92QndtNwTbWGL4RW9FlKFnVOaALbc=;
 b=SRh0kTnyC/yWFHiFmatD26EHd5u2MJK8R+jI9F8I63U47BpbLcvhOhDQpMGbX985kOHVugH0ACxZHi7lrmOUpH9imMrjbfFviQYcqrzfCSXVWDo0thfYYs39xi2R0VvMPwQk2k0qUC8pi9Kcl+PmSKWC4uRCWbicTXESG2HHFwIjMv+5+KvYYVHbUMbE5I7lWy6SbiORuwN3qPngCf62wH+UiQqzxUQ6xX7m5lqAIZt3rNEtRQMIrzwc5Rlsway0iT4+3tevhwldm0bbrj5YssZnECdiFLEz+wZjjc4F7lMBy6IptQyO6K/Tg2nCkiBYhcxaPRnIkjy1CWUEsrAtpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bY4XCyePRDwshO92QndtNwTbWGL4RW9FlKFnVOaALbc=;
 b=pOf2Jn3dGOH5geSe/UvRKe8XaoRDjFviA7Z8iMu2suhQDhxHC6IFEu/CTdJ4ToecWjHqK4Q+KLzBQyJamav/98h67dNnSB6TPlrNXAHXrIC6N4/3i6kx45fjBcvFb+ABI47XHttrcfjipizRM39a765AZi8HrtmpbP4kH43bWwY=
Received: from BY5PR04MB6995.namprd04.prod.outlook.com (2603:10b6:a03:22c::12)
 by BYAPR04MB4536.namprd04.prod.outlook.com (2603:10b6:a03:15::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Tue, 7 Jul
 2020 18:23:31 +0000
Received: from BY5PR04MB6995.namprd04.prod.outlook.com
 ([fe80::f813:2bba:2c5c:a63b]) by BY5PR04MB6995.namprd04.prod.outlook.com
 ([fe80::f813:2bba:2c5c:a63b%7]) with mapi id 15.20.3174.021; Tue, 7 Jul 2020
 18:23:31 +0000
From: Aravind Ramesh <Aravind.Ramesh@wdc.com>
To: Chao Yu <yuchao0@huawei.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "hch@lst.de" <hch@lst.de>
Thread-Topic: [PATCH 1/2] f2fs: support zone capacity less than zone size
Thread-Index: AQHWUIkRI5HubGFr/0O9cA9AIcqh/aj8EGmAgABHC2A=
Date: Tue, 7 Jul 2020 18:23:30 +0000
Message-ID: <BY5PR04MB6995AD34A289A013932E1A698C660@BY5PR04MB6995.namprd04.prod.outlook.com>
References: <20200702155401.13322-1-aravind.ramesh@wdc.com>
 <20200702155401.13322-2-aravind.ramesh@wdc.com>
 <d262eba9-31d5-6205-3244-b5176a17637c@huawei.com>
In-Reply-To: <d262eba9-31d5-6205-3244-b5176a17637c@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [106.51.109.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e271b691-25c0-4fde-8807-08d822a2da11
x-ms-traffictypediagnostic: BYAPR04MB4536:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB4536F1EC4585DA82C62F94748C660@BYAPR04MB4536.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZmcUIvOgrf+/EOe73sV8OJ5Ru/Or2jZbayhVs7TfuRmQjnROLEJe21CQHjq+wlaGQ+ZnR7cbloeHOBPzsRQUa1ihbzrWBqwelIkq0r/omtcn8e0GAb6qIZ8KvXNsswI5udXLQfKaQ287pkUbaySSO59FF3AyaZ8c0Gk4oceDCY2sL16Oo+UCsGFEuMtdvMl41cUOx4csV0B78eBP3qH7dr7b4SKiUHnXIFH17riXrn6hsQMIa3CHLfDH80A9yx2y5syWCVeu79PvfzOUpOxPT1ap0OfFMkE5xZnK52x82Ak5ABJRXKp0Vj25jgEOz/0l
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6995.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39850400004)(366004)(346002)(396003)(376002)(136003)(83380400001)(30864003)(26005)(64756008)(8676002)(55236004)(66476007)(53546011)(66446008)(33656002)(66556008)(7696005)(4326008)(76116006)(66946007)(6506007)(8936002)(316002)(110136005)(86362001)(478600001)(2906002)(186003)(5660300002)(55016002)(9686003)(54906003)(71200400001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: pp8NJnliHvIDb8Yp/O6SCRmssT3rrVV8ncxVWw0xn/nZilE4leF9yXncth0EKvprETZ9x10K4g2Y7cWhgS3VGJqToCaUIEIju+lGOEbbLkXiFmmxbR+jJupwsGMy2QGP32xrk3KiHk6apRGOKwDLy7cabiaEHz4FD5bZkO8L28cB3txD2eK5IswVKsXPUsPRAbNyNebVgQ56E1N79QkSGlbHQWwT0kOHW/XfgmxvpJdr4vCYpCk+aZuPw/WCywSIMEl5dJBByDfS1wNtNROc6bejH2GAVF90MdISfJldi+0cYMCKVLf/++S6BUl6P3Equ9FtgW7cM7SSDSsXuvs4jnn/BGApimcH5g95E8EJm3fx6gQxED9JASnHuinYL0EGsIwUGnge0WiUcoJUAmbzlEJFI1/zdCp0EZ79jZJbGpDP10logfoyg0nHD41gT8NO2IbLKNegI0kXS0I0T/6LO806HuQeoDbPU8fx7BSuTjZU9LqprwyHDsW7cLc7NmXQ
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6995.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e271b691-25c0-4fde-8807-08d822a2da11
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 18:23:30.9761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QF8fJm/lXVhWFik09eqWEBmlsQYI9iv8V6wpdCryjDY8xNrU4qNsnXXldkm+8GPi4QTp82UOoLf1vr914W+dQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4536
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jssFy-00GSQQ-R8
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: support zone capacity less than
 zone size
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 Matias Bjorling <Matias.Bjorling@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Thanks for review Chao Yu.
Please find my response inline.
I will re-send a V2 after incorporating your comments.

Regards,
Aravind

> -----Original Message-----
> From: Chao Yu <yuchao0@huawei.com>
> Sent: Tuesday, July 7, 2020 5:49 PM
> To: Aravind Ramesh <Aravind.Ramesh@wdc.com>; jaegeuk@kernel.org; linux-
> fsdevel@vger.kernel.org; linux-f2fs-devel@lists.sourceforge.net; hch@lst.de
> Cc: Damien Le Moal <Damien.LeMoal@wdc.com>; Niklas Cassel
> <Niklas.Cassel@wdc.com>; Matias Bjorling <Matias.Bjorling@wdc.com>
> Subject: Re: [PATCH 1/2] f2fs: support zone capacity less than zone size
> 
> On 2020/7/2 23:54, Aravind Ramesh wrote:
> > NVMe Zoned Namespace devices can have zone-capacity less than zone-size.
> > Zone-capacity indicates the maximum number of sectors that are usable
> > in a zone beginning from the first sector of the zone. This makes the
> > sectors sectors after the zone-capacity till zone-size to be unusable.
> > This patch set tracks zone-size and zone-capacity in zoned devices and
> > calculate the usable blocks per segment and usable segments per section.
> >
> > If zone-capacity is less than zone-size mark only those segments which
> > start before zone-capacity as free segments. All segments at and
> > beyond zone-capacity are treated as permanently used segments. In
> > cases where zone-capacity does not align with segment size the last
> > segment will start before zone-capacity and end beyond the
> > zone-capacity of the zone. For such spanning segments only sectors within the
> zone-capacity are used.
> >
> > Signed-off-by: Aravind Ramesh <aravind.ramesh@wdc.com>
> > Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> > ---
> >  fs/f2fs/f2fs.h    |   5 ++
> >  fs/f2fs/segment.c | 136
> ++++++++++++++++++++++++++++++++++++++++++++--
> >  fs/f2fs/segment.h |   6 +-
> >  fs/f2fs/super.c   |  41 ++++++++++++--
> >  4 files changed, 176 insertions(+), 12 deletions(-)
> >
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h index
> > e6e47618a357..73219e4e1ba4 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1232,6 +1232,7 @@ struct f2fs_dev_info {  #ifdef
> > CONFIG_BLK_DEV_ZONED
> >  	unsigned int nr_blkz;		/* Total number of zones */
> >  	unsigned long *blkz_seq;	/* Bitmap indicating sequential zones */
> > +	block_t *zone_capacity_blocks;  /* Array of zone capacity in blks */
> >  #endif
> >  };
> >
> > @@ -3395,6 +3396,10 @@ void f2fs_destroy_segment_manager_caches(void);
> >  int f2fs_rw_hint_to_seg_type(enum rw_hint hint);  enum rw_hint
> > f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
> >  			enum page_type type, enum temp_type temp);
> > +unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
> > +			unsigned int segno);
> > +unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
> > +			unsigned int segno);
> >
> >  /*
> >   * checkpoint.c
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c index
> > c35614d255e1..d2156f3f56a5 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -4294,9 +4294,12 @@ static void init_free_segmap(struct
> > f2fs_sb_info *sbi)  {
> >  	unsigned int start;
> >  	int type;
> > +	struct seg_entry *sentry;
> >
> >  	for (start = 0; start < MAIN_SEGS(sbi); start++) {
> > -		struct seg_entry *sentry = get_seg_entry(sbi, start);
> > +		if (f2fs_usable_blks_in_seg(sbi, start) == 0)
> 
> If usable blocks count is zero, shouldn't we update SIT_I(sbi)->written_valid_blocks
> as we did when there is partial usable block in current segment?
If usable_block_count is zero, then it is like a dead segment, all blocks in the segment lie after the
zone-capacity in the zone. So there can never be a valid written content on these segments, hence it is not updated. 
In the other case, when a segment start before the zone-capacity and it ends beyond zone-capacity, then there are
some blocks before zone-capacity which can be used, so they are accounted for.
> 
> > +			continue;
> > +		sentry = get_seg_entry(sbi, start);
> >  		if (!sentry->valid_blocks)
> >  			__set_free(sbi, start);
> >  		else
> > @@ -4316,7 +4319,7 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
> >  	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
> >  	struct free_segmap_info *free_i = FREE_I(sbi);
> >  	unsigned int segno = 0, offset = 0, secno;
> > -	unsigned short valid_blocks;
> > +	unsigned short valid_blocks, usable_blks_in_seg;
> >  	unsigned short blks_per_sec = BLKS_PER_SEC(sbi);
> >
> >  	while (1) {
> > @@ -4326,9 +4329,10 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
> >  			break;
> >  		offset = segno + 1;
> >  		valid_blocks = get_valid_blocks(sbi, segno, false);
> > -		if (valid_blocks == sbi->blocks_per_seg || !valid_blocks)
> > +		usable_blks_in_seg = f2fs_usable_blks_in_seg(sbi, segno);
> > +		if (valid_blocks == usable_blks_in_seg || !valid_blocks)
> 
> It needs to traverse .cur_valid_map bitmap to check whether blocks in range of [0,
> usable_blks_in_seg] are all valid or not, if there is at least one usable block in the
> range, segment should be dirty.
For the segments which start and end before zone-capacity are just like any normal segments.
Segments which start after the zone-capacity are fully unusable and are marked as used in the free_seg_bitmap, so these segments are never used.
Segments which span across the zone-capacity have some unusable blocks. Even when blocks from these segments are allocated/deallocated the valid_blocks counter is incremented/decremented, reflecting the current valid_blocks count.
Comparing valid_blocks count with usable_blocks count in the segment can indicate if the segment is dirty or fully used.
Sorry, but could you please share why cur_valid_map needs to be traversed ?

> 
> One question, if we select dirty segment which across zone-capacity as opened
> segment (in curseg), how can we avoid allocating usable block beyong zone-capacity
> in such segment via .cur_valid_map?
For zoned devices, we have to allocate blocks sequentially, so it's always in LFS manner it is allocated.
The __has_curseg_space() checks for the usable blocks and stops allocating blocks after zone-capacity.
> 
> >  			continue;
> > -		if (valid_blocks > sbi->blocks_per_seg) {
> > +		if (valid_blocks > usable_blks_in_seg) {
> >  			f2fs_bug_on(sbi, 1);
> >  			continue;
> >  		}
> > @@ -4678,6 +4682,101 @@ int f2fs_check_write_pointer(struct
> > f2fs_sb_info *sbi)
> >
> >  	return 0;
> >  }
> > +
> > +static bool is_conv_zone(struct f2fs_sb_info *sbi, unsigned int zone_idx,
> > +						unsigned int dev_idx)
> > +{
> > +	if (!bdev_is_zoned(FDEV(dev_idx).bdev))
> > +		return true;
> > +	return !test_bit(zone_idx, FDEV(dev_idx).blkz_seq); }
> > +
> > +/* Return the zone index in the given device */ static unsigned int
> > +get_zone_idx(struct f2fs_sb_info *sbi, unsigned int secno,
> > +					int dev_idx)
> > +{
> > +	block_t sec_start_blkaddr = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi,
> > +secno));
> > +
> > +	return (sec_start_blkaddr - FDEV(dev_idx).start_blk) >>
> > +						sbi->log_blocks_per_blkz;
> > +}
> > +
> > +/*
> > + * Return the usable segments in a section based on the zone's
> > + * corresponding zone capacity. Zone is equal to a section.
> > + */
> > +static inline unsigned int f2fs_usable_zone_segs_in_sec(
> > +		struct f2fs_sb_info *sbi, unsigned int segno) {
> > +	unsigned int dev_idx, zone_idx, unusable_segs_in_sec;
> > +
> > +	dev_idx = f2fs_target_device_index(sbi, START_BLOCK(sbi, segno));
> > +	zone_idx = get_zone_idx(sbi, GET_SEC_FROM_SEG(sbi, segno), dev_idx);
> > +
> > +	/* Conventional zone's capacity is always equal to zone size */
> > +	if (is_conv_zone(sbi, zone_idx, dev_idx))
> > +		return sbi->segs_per_sec;
> > +
> > +	/*
> > +	 * If the zone_capacity_blocks array is NULL, then zone capacity
> > +	 * is equal to the zone size for all zones
> > +	 */
> > +	if (!FDEV(dev_idx).zone_capacity_blocks)
> > +		return sbi->segs_per_sec;
> > +
> > +	/* Get the segment count beyond zone capacity block */
> > +	unusable_segs_in_sec = (sbi->blocks_per_blkz -
> > +				FDEV(dev_idx).zone_capacity_blocks[zone_idx])
> >>
> > +				sbi->log_blocks_per_seg;
> > +	return sbi->segs_per_sec - unusable_segs_in_sec; }
> > +
> > +/*
> > + * Return the number of usable blocks in a segment. The number of
> > +blocks
> > + * returned is always equal to the number of blocks in a segment for
> > + * segments fully contained within a sequential zone capacity or a
> > + * conventional zone. For segments partially contained in a
> > +sequential
> > + * zone capacity, the number of usable blocks up to the zone capacity
> > + * is returned. 0 is returned in all other cases.
> > + */
> > +static inline unsigned int f2fs_usable_zone_blks_in_seg(
> > +			struct f2fs_sb_info *sbi, unsigned int segno) {
> > +	block_t seg_start, sec_start_blkaddr, sec_cap_blkaddr;
> > +	unsigned int zone_idx, dev_idx, secno;
> > +
> > +	secno = GET_SEC_FROM_SEG(sbi, segno);
> > +	seg_start = START_BLOCK(sbi, segno);
> > +	dev_idx = f2fs_target_device_index(sbi, seg_start);
> > +	zone_idx = get_zone_idx(sbi, secno, dev_idx);
> > +
> > +	/*
> > +	 * Conventional zone's capacity is always equal to zone size,
> > +	 * so, blocks per segment is unchanged.
> > +	 */
> > +	if (is_conv_zone(sbi, zone_idx, dev_idx))
> > +		return sbi->blocks_per_seg;
> > +
> > +	if (!FDEV(dev_idx).zone_capacity_blocks)
> > +		return sbi->blocks_per_seg;
> > +
> > +	sec_start_blkaddr = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, secno));
> > +	sec_cap_blkaddr = sec_start_blkaddr +
> > +				FDEV(dev_idx).zone_capacity_blocks[zone_idx];
> > +
> > +	/*
> > +	 * If segment starts before zone capacity and spans beyond
> > +	 * zone capacity, then usable blocks are from seg start to
> > +	 * zone capacity. If the segment starts after the zone capacity,
> > +	 * then there are no usable blocks.
> > +	 */
> > +	if (seg_start >= sec_cap_blkaddr)
> > +		return 0;
> > +	if (seg_start + sbi->blocks_per_seg > sec_cap_blkaddr)
> > +		return sec_cap_blkaddr - seg_start;
> > +
> > +	return sbi->blocks_per_seg;
> > +}
> >  #else
> >  int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)  { @@
> > -4688,7 +4787,36 @@ int f2fs_check_write_pointer(struct f2fs_sb_info
> > *sbi)  {
> >  	return 0;
> >  }
> > +
> > +static inline unsigned int f2fs_usable_zone_blks_in_seg(struct f2fs_sb_info *sbi,
> > +							unsigned int segno)
> > +{
> > +	return 0;
> > +}
> > +
> > +static inline unsigned int f2fs_usable_zone_segs_in_sec(struct f2fs_sb_info *sbi,
> > +							unsigned int segno)
> > +{
> > +	return 0;
> > +}
> >  #endif
> > +unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
> > +					unsigned int segno)
> > +{
> > +	if (f2fs_sb_has_blkzoned(sbi))
> > +		return f2fs_usable_zone_blks_in_seg(sbi, segno);
> > +
> > +	return sbi->blocks_per_seg;
> > +}
> > +
> > +unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
> > +					unsigned int segno)
> > +{
> > +	if (f2fs_sb_has_blkzoned(sbi))
> > +		return f2fs_usable_zone_segs_in_sec(sbi, segno);
> > +
> > +	return sbi->segs_per_sec;
> > +}
> >
> >  /*
> >   * Update min, max modified time for cost-benefit GC algorithm diff
> > --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h index
> > f261e3e6a69b..79b0dc33feaf 100644
> > --- a/fs/f2fs/segment.h
> > +++ b/fs/f2fs/segment.h
> > @@ -411,6 +411,7 @@ static inline void __set_free(struct f2fs_sb_info *sbi,
> unsigned int segno)
> >  	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> >  	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
> >  	unsigned int next;
> > +	unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi, segno);
> >
> >  	spin_lock(&free_i->segmap_lock);
> >  	clear_bit(segno, free_i->free_segmap); @@ -418,7 +419,7 @@ static
> > inline void __set_free(struct f2fs_sb_info *sbi, unsigned int segno)
> >
> >  	next = find_next_bit(free_i->free_segmap,
> >  			start_segno + sbi->segs_per_sec, start_segno);
> > -	if (next >= start_segno + sbi->segs_per_sec) {
> > +	if (next >= start_segno + usable_segs) {
> >  		clear_bit(secno, free_i->free_secmap);
> >  		free_i->free_sections++;
> >  	}
> > @@ -444,6 +445,7 @@ static inline void __set_test_and_free(struct f2fs_sb_info
> *sbi,
> >  	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> >  	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
> >  	unsigned int next;
> > +	unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi, segno);
> >
> >  	spin_lock(&free_i->segmap_lock);
> >  	if (test_and_clear_bit(segno, free_i->free_segmap)) { @@ -453,7
> > +455,7 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
> >  			goto skip_free;
> >  		next = find_next_bit(free_i->free_segmap,
> >  				start_segno + sbi->segs_per_sec, start_segno);
> > -		if (next >= start_segno + sbi->segs_per_sec) {
> > +		if (next >= start_segno + usable_segs) {
> >  			if (test_and_clear_bit(secno, free_i->free_secmap))
> >  				free_i->free_sections++;
> >  		}
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c index
> > 80cb7cd358f8..2686b07ae7eb 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -1164,6 +1164,7 @@ static void destroy_device_list(struct f2fs_sb_info *sbi)
> >  		blkdev_put(FDEV(i).bdev, FMODE_EXCL);  #ifdef
> CONFIG_BLK_DEV_ZONED
> >  		kvfree(FDEV(i).blkz_seq);
> > +		kvfree(FDEV(i).zone_capacity_blocks);
> 
> Now, f2fs_kzalloc won't allocate vmalloc's memory, so it's safe to use kfree().
Ok
> 
> >  #endif
> >  	}
> >  	kvfree(sbi->devs);
> > @@ -3039,13 +3040,26 @@ static int init_percpu_info(struct
> > f2fs_sb_info *sbi)  }
> >
> >  #ifdef CONFIG_BLK_DEV_ZONED
> > +
> > +struct f2fs_report_zones_args {
> > +	struct f2fs_dev_info *dev;
> > +	bool zone_cap_mismatch;
> > +};
> > +
> >  static int f2fs_report_zone_cb(struct blk_zone *zone, unsigned int idx,
> > -			       void *data)
> > +			      void *data)
> >  {
> > -	struct f2fs_dev_info *dev = data;
> > +	struct f2fs_report_zones_args *rz_args = data;
> > +
> > +	if (zone->type == BLK_ZONE_TYPE_CONVENTIONAL)
> > +		return 0;
> > +
> > +	set_bit(idx, rz_args->dev->blkz_seq);
> > +	rz_args->dev->zone_capacity_blocks[idx] = zone->capacity >>
> > +						F2FS_LOG_SECTORS_PER_BLOCK;
> > +	if (zone->len != zone->capacity && !rz_args->zone_cap_mismatch)
> > +		rz_args->zone_cap_mismatch = true;
> >
> > -	if (zone->type != BLK_ZONE_TYPE_CONVENTIONAL)
> > -		set_bit(idx, dev->blkz_seq);
> >  	return 0;
> >  }
> >
> > @@ -3053,6 +3067,7 @@ static int init_blkz_info(struct f2fs_sb_info
> > *sbi, int devi)  {
> >  	struct block_device *bdev = FDEV(devi).bdev;
> >  	sector_t nr_sectors = bdev->bd_part->nr_sects;
> > +	struct f2fs_report_zones_args rep_zone_arg;
> >  	int ret;
> >
> >  	if (!f2fs_sb_has_blkzoned(sbi))
> > @@ -3078,12 +3093,26 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int
> devi)
> >  	if (!FDEV(devi).blkz_seq)
> >  		return -ENOMEM;
> >
> > -	/* Get block zones type */
> > +	/* Get block zones type and zone-capacity */
> > +	FDEV(devi).zone_capacity_blocks = f2fs_kzalloc(sbi,
> > +					FDEV(devi).nr_blkz * sizeof(block_t),
> > +					GFP_KERNEL);
> > +	if (!FDEV(devi).zone_capacity_blocks)
> > +		return -ENOMEM;
> > +
> > +	rep_zone_arg.dev = &FDEV(devi);
> > +	rep_zone_arg.zone_cap_mismatch = false;
> > +
> >  	ret = blkdev_report_zones(bdev, 0, BLK_ALL_ZONES, f2fs_report_zone_cb,
> > -				  &FDEV(devi));
> > +				  &rep_zone_arg);
> >  	if (ret < 0)
> >  		return ret;
> 
> Missed to call kfree(FDEV(devi).zone_capacity_blocks)?
Thanks for catching it. Will free it here also.
> 
> >
> > +	if (!rep_zone_arg.zone_cap_mismatch) {
> > +		kvfree(FDEV(devi).zone_capacity_blocks);
> 
> Ditto, kfree().
Ok.
> 
> Thanks,
> 
> > +		FDEV(devi).zone_capacity_blocks = NULL;
> > +	}
> > +
> >  	return 0;
> >  }
> >  #endif
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
