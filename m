Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8CD22231A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jul 2020 14:57:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jw3Rs-0008Ir-HA; Thu, 16 Jul 2020 12:57:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=45955ca59=Aravind.Ramesh@wdc.com>)
 id 1jw3Rq-0008Id-6R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jul 2020 12:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mLO046rDAArkcyGam2W7sNSJFgDvlTgAkUcr/viw+Zo=; b=VM2XUqloOU7Leo5I2Xw6AKTu31
 obZ7Gwpyobb9byR/vo5aqSBcgL3MIkGfhUruWjr5+yfK4B0WTMccO0OCDSWrHh5aEZdWJSmSczYp1
 vc8iV7kuxn+jMj/KUGgkagg+NBfSyM5s6FvoUwdIDiT/QTjRPnwZCMvbmNUTy7NGcmw8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mLO046rDAArkcyGam2W7sNSJFgDvlTgAkUcr/viw+Zo=; b=IUjjkZ2JDXRd+arqDChXZxslj1
 wTYfdnWpcaHfMoQVG1RsIliqs7flURGDEllObT1PZefykK1m6fninAoKK04LXK/iJ064UJD5m4RtT
 cqQzuR2/f6rTbbk6bYLUvtEgUp9wFci7cxgK2UwnWFSvEHYBPfyMPDu76EaBdVxYsb3Y=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jw3Ri-00ALQA-VI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jul 2020 12:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594904226; x=1626440226;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nnrSUmlaPvumNbuo5gEa0jXKnDFdtNKg3w64txYtHu8=;
 b=jqcEOm1J+iLD+dNBkeA5huXouPmsUTaCoU35L/ppp43kBqw1s8hklTvK
 HdZR0dssYH0QK/2zC6hMEgpesRXX4WArWtKJ6Ix7Gu3txFlKtvF1xXwAX
 rvjXKlwyuQEs6ZmofcUBQyPj7lGNl6Gh9byN4xluLz+AKlwD83OrpXW+z
 BKKaH8SVvWSK2jjxW4F84OhItX8tC/Qw9L7P7MwY9gas3U9Kj+PqrvQaF
 hndkUsmehuXjUdniFxAUBFYrADe61gx/YVO3Tn3QTjCqsSPP4pgT2brFn
 ZgunAbQG84sZUToBPT4452Mwg03ujyIq/lt93/B/VwtmntLseIWmP6Z8P w==;
IronPort-SDR: 6BAFf6BjQH6FGfDYQZQPIop9gprPxc37F5m+c7hHX2xJVRpIuQsiDvG+j8zPUVIG0Oe5DIFjF8
 QPBjOKh3O/R/ac1L303fzFn3rqMS23UOUYs+3JOURlW1nDLpyKi6+Z9rWHgj+cKFdV3mxk5pcz
 +p7vWsxs5l92UU9L9AnAyo4l9DIKugqzw7bcYOdCCvcT63yfWi3IdNdyTzjk5/Crle1hCjtmJ+
 g3I2AWNOUAXYmVMWuguIyhU8I86sCiankVZWfnLXXgsxON7XWq0qXvyPbzuJEMhF8p/AGOvFSv
 fCs=
X-IronPort-AV: E=Sophos;i="5.75,359,1589212800"; d="scan'208";a="251874249"
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
 by ob1.hgst.iphmx.com with ESMTP; 16 Jul 2020 20:56:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAXWvZEHGMf6DplKxqe3vdoaAkdjElq9nONf3k+qQOROGCTKh5sosucMgaXEOS89ZiDSazTy5XRjKKBWOziUNOAJSweQOFAqMsnXExFoIk7EKZjPRHl7jI+qD6okxXNYqNcKJaTYNdyRTMHFsP8E1HpqHingB2CqGC5gBUN2NoCXsbrn0EJY54su8+mwakOIYlXJ3NpIk53UL9Jg3VIuUIL6GDKibx+0U6a4GtlCIuxy/uy6By9Szt+fjDghnVHFwhTvVyFJA/G2GDulbgOHfLopbUKe/IbQm6Wekt/XOppGE9W57JFdwkb/UY1+uEL577W393/I6xCeQYOpzo6WxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLO046rDAArkcyGam2W7sNSJFgDvlTgAkUcr/viw+Zo=;
 b=l1mD677xBRQWnvbvfiQX8WfpR62TE/JoFNVHK4QwOlNvSRBNwbrl2goL1AAlHxG7Bhk6i6YXJg1nUpfDPi6XMOEODpYmWQxL2TV/3i0zWa2jHFn2D13sHO5fidG1isiBmKPtAPZgJPN/jJ3hawa3Dmq3TxozyWRKNum9ARvKByVfDtfMotuSxaeMz3b+H6BBCXPMqXpsTF30cSO5NKw+2qI2EsF32Wj/zLlyZffoUCnjNwwlX9f9a0ClQ8QiLSw/EUpQJD73ziuY3zlGO7DxmbXCwN8UbtpXuq6VljifrGp4cBgKRWv1m0/q6pXiVaoyEyfZcWaF3n9HSC8UnqlOsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLO046rDAArkcyGam2W7sNSJFgDvlTgAkUcr/viw+Zo=;
 b=qAogMcxkehezCPshk3qujZoRoYGlAtEgAzlBHT27naAu6a+tytswYRfH61gCdyw1ikoRvs+3KMpan3nhiDW98g3w2GYyIwGIWzjqA5aETny037FEyDi6nLldNA/2jEyp96CVytWiChrabgtKWequU4QH/qEdcRNaTM15TDujtvc=
Received: from BY5PR04MB6995.namprd04.prod.outlook.com (2603:10b6:a03:22c::12)
 by BYAPR04MB5719.namprd04.prod.outlook.com (2603:10b6:a03:111::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Thu, 16 Jul
 2020 12:56:54 +0000
Received: from BY5PR04MB6995.namprd04.prod.outlook.com
 ([fe80::f813:2bba:2c5c:a63b]) by BY5PR04MB6995.namprd04.prod.outlook.com
 ([fe80::f813:2bba:2c5c:a63b%7]) with mapi id 15.20.3174.026; Thu, 16 Jul 2020
 12:56:54 +0000
From: Aravind Ramesh <Aravind.Ramesh@wdc.com>
To: Chao Yu <yuchao0@huawei.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "hch@lst.de" <hch@lst.de>
Thread-Topic: [PATCH v2 1/1] f2fs: support zone capacity less than zone size
Thread-Index: AQHWVuG8df1cHLlYCEqjMFhbHkjwLakG/kWAgABix9CAAIkQgIACQjYw
Date: Thu, 16 Jul 2020 12:56:53 +0000
Message-ID: <BY5PR04MB6995C8D8BCB5BEE887F8A1A88C7F0@BY5PR04MB6995.namprd04.prod.outlook.com>
References: <20200710174353.21988-1-aravind.ramesh@wdc.com>
 <20200710174353.21988-2-aravind.ramesh@wdc.com>
 <c9d121e3-294d-189f-9314-01dc0b0b7ab5@huawei.com>
 <BY5PR04MB69955AA241F77C37D6020CCE8C610@BY5PR04MB6995.namprd04.prod.outlook.com>
 <af3f4ce5-5653-38f8-9fce-06efbaae09d5@huawei.com>
In-Reply-To: <af3f4ce5-5653-38f8-9fce-06efbaae09d5@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [49.207.56.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bd6ab940-68d8-4d02-f80e-08d82987b6fa
x-ms-traffictypediagnostic: BYAPR04MB5719:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB57196AE8573FC95B17F9D9B58C7F0@BYAPR04MB5719.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vZaZ7OJud9jwJnXW81dC4qKZqgg5YabFAyBK1siQ+kkyMTixYwdUcplg19ObZ+LZtQArzozo5g52AfbzGwxMYZ+J8a+5GmnCzmif+ZJXE2nK5uFmU7QNSXdxIc6QM6hsOyTJtJLsal2BC6MU3u+IBfwpEJ4kI0g2jwoR0GeviaxbpMKmtpnU/oJ9tQj91xaGTRjeUGFSUyQbmS7JHceZxzwpLzjXVJ5jqWEz1CiC7G2MHMpNlBWs8qRqTLUQBAhqxXSJ1zgujEGOtJxYj7kc/z0nYVIjwyEWCRZtaPCV6lfU6Ao67zXh5/1qvWsJw73OAj6rMDKGfrXuX79vibF3XQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6995.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(52536014)(4326008)(71200400001)(55016002)(66946007)(66446008)(30864003)(66476007)(54906003)(66556008)(76116006)(110136005)(64756008)(7696005)(83380400001)(8676002)(5660300002)(478600001)(9686003)(33656002)(186003)(2906002)(55236004)(53546011)(316002)(8936002)(6506007)(26005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 40AqKBFcCYP3297uZ+SDeOn3jzr0nqhprG5O6rogKjbmI01tKzh3+2+IWunP75V47slinPTrH28CofX6MxCUVHauaEuYFqGbjprTABpBNy+Ft4yjgM+n/zYZgoZaTlxUrWypKaiJA7Je/mIj+PtkHcuSJSRYzYuwzo9eVKkh91+f6Cao/wfMzeWltHp2w/9PesytSUzy6X5ieTqoaV/LgyKmo7xUTnM66t58GrVVN9E5aLN89slcmNYsM3Pi/E0NkOtJV1UcMXpgnXt1W+kNDVwDQuI/+QmAEx5KMfJhYeyropyLGCRqPhTRsicU/EJSpUWMYGjKpuboBeftOxLIsxoLEJvLrqkMjocdGPlAuwEmkZE8jEbTmW5F/u23ktJocvbJHWNh/joVNpD3kpm3emiF8AiSz10MzFvXY6nKSW/U+b/hGIXhmqEU2XLZ+z2GnVUwgXkJSfjUZUQoxFCQutL95nBaJ+havBEr2L7jUso=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6995.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6ab940-68d8-4d02-f80e-08d82987b6fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2020 12:56:53.7720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: twyo3mKXeYD1EaHTNfWBb2iDvAvZoUy2xdQ5h6BwRdlL4Al45WV0P5N7ty5LYfqfxonjARoItzQMRdEy+pyDKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5719
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [68.232.141.245 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jw3Ri-00ALQA-VI
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs: support zone capacity less than
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


> -----Original Message-----
> From: Chao Yu <yuchao0@huawei.com>
> Sent: Wednesday, July 15, 2020 7:32 AM
> To: Aravind Ramesh <Aravind.Ramesh@wdc.com>; jaegeuk@kernel.org; linux-
> fsdevel@vger.kernel.org; linux-f2fs-devel@lists.sourceforge.net; hch@lst.de
> Cc: Damien Le Moal <Damien.LeMoal@wdc.com>; Niklas Cassel
> <Niklas.Cassel@wdc.com>; Matias Bjorling <Matias.Bjorling@wdc.com>
> Subject: Re: [PATCH v2 1/1] f2fs: support zone capacity less than zone size
> 
> On 2020/7/15 2:40, Aravind Ramesh wrote:
> > Thanks for the valuable feedback.
> > My comments are inline.
> > Will send the V3 with the feedback incorporated.
> >
> > Regards,
> > Aravind
> >
> >> -----Original Message-----
> >> From: Chao Yu <yuchao0@huawei.com>
> >> Sent: Tuesday, July 14, 2020 5:28 PM
> >> To: Aravind Ramesh <Aravind.Ramesh@wdc.com>; jaegeuk@kernel.org;
> >> linux- fsdevel@vger.kernel.org;
> >> linux-f2fs-devel@lists.sourceforge.net; hch@lst.de
> >> Cc: Damien Le Moal <Damien.LeMoal@wdc.com>; Niklas Cassel
> >> <Niklas.Cassel@wdc.com>; Matias Bjorling <Matias.Bjorling@wdc.com>
> >> Subject: Re: [PATCH v2 1/1] f2fs: support zone capacity less than
> >> zone size
> >>
[snip..]
       /*
> >>> +	* zone-capacity can be less than zone-size in zoned devices,
> >>> +	* resulting in less than expected usable segments in the zone,
> >>> +	* calculate the end segno in the zone which can be garbage collected
> >>> +	*/
> >>> +	if (f2fs_sb_has_blkzoned(sbi))
> >>> +		end_segno -= sbi->segs_per_sec -
> >>> +					f2fs_usable_segs_in_sec(sbi, segno);
> >>> +
> >>> +	else if (__is_large_section(sbi))
> >>>  		end_segno = rounddown(end_segno, sbi->segs_per_sec);
> >>
> >> end_segno could be beyond end of section, so below calculation could
> >> adjust it to the end of section first, then adjust to zone-capacity boundary.
> >>
> >> 	if (__is_large_section(sbi))
> >> 		end_segno = rounddown(end_segno, sbi->segs_per_sec);
> >>
> >> 	if (f2fs_sb_has_blkzoned(sbi))
> >> 		end_segno -= sbi->segs_per_sec -
> >> 				f2fs_usable_segs_in_sec(sbi, segno);
> > Ok, will change it.
> >>
> >>>
> >>>  	/* readahead multi ssa blocks those have contiguous address */ @@
> >>> -1356,7 +1368,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
> >>>  		goto stop;
> >>>
> >>>  	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type);
> >>> -	if (gc_type == FG_GC && seg_freed == sbi->segs_per_sec)
> >>> +	if (gc_type == FG_GC &&
> >>> +		seg_freed == f2fs_usable_segs_in_sec(sbi, segno))
> >>>  		sec_freed++;
> >>>  	total_freed += seg_freed;
> >>>
> >>> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h index
> >>> db3c61046aa4..463b4e38b864 100644
> >>> --- a/fs/f2fs/gc.h
> >>> +++ b/fs/f2fs/gc.h
> >>> @@ -44,13 +44,47 @@ struct gc_inode_list {
> >>>  /*
> >>>   * inline functions
> >>>   */
> >>> +
> >>> +/*
> >>> + * On a Zoned device zone-capacity can be less than zone-size and
> >>> +if
> >>> + * zone-capacity is not aligned to f2fs segment size(2MB), then the
> >>> +segment
> >>> + * starting just before zone-capacity has some blocks spanning
> >>> +across the
> >>> + * zone-capacity, these blocks are not usable.
> >>> + * Such spanning segments can be in free list so calculate the sum
> >>> +of usable
> >>> + * blocks in currently free segments including normal and spanning segments.
> >>> + */
> >>> +static inline block_t free_segs_blk_count_zoned(struct f2fs_sb_info
> >>> +*sbi) {
> >>> +	block_t free_seg_blks = 0;
> >>> +	struct free_segmap_info *free_i = FREE_I(sbi);
> >>> +	int j;
> >>> +
> >>
> >> spin_lock(&free_i->segmap_lock);
> > Ok
> >>
> >>> +	for (j = 0; j < MAIN_SEGS(sbi); j++)
> >>> +		if (!test_bit(j, free_i->free_segmap))
> >>> +			free_seg_blks += f2fs_usable_blks_in_seg(sbi, j);
> >>
> >> spin_unlock(&free_i->segmap_lock);
> > Ok
> >>
> >>> +
> >>> +	return free_seg_blks;
> >>> +}
> >>> +
> >>> +static inline block_t free_segs_blk_count(struct f2fs_sb_info *sbi) {
> >>> +	if (f2fs_sb_has_blkzoned(sbi))
> >>> +		return free_segs_blk_count_zoned(sbi);
> >>> +
> >>> +	return free_segments(sbi) << sbi->log_blocks_per_seg; }
> >>> +
> >>>  static inline block_t free_user_blocks(struct f2fs_sb_info *sbi)  {
> >>> -	if (free_segments(sbi) < overprovision_segments(sbi))
> >>> +	block_t free_blks, ovp_blks;
> >>> +
> >>> +	free_blks = free_segs_blk_count(sbi);
> >>> +	ovp_blks = overprovision_segments(sbi) << sbi->log_blocks_per_seg;
> >>> +
> >>> +	if (free_blks < ovp_blks)
> >>>  		return 0;
> >>> -	else
> >>> -		return (free_segments(sbi) - overprovision_segments(sbi))
> >>> -			<< sbi->log_blocks_per_seg;
> >>> +
> >>> +	return free_blks - ovp_blks;
> >>>  }
> >>>
> >>>  static inline block_t limit_invalid_user_blocks(struct f2fs_sb_info
> >>> *sbi) diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c index
> >>> c35614d255e1..d75c1849dc83 100644
> >>> --- a/fs/f2fs/segment.c
> >>> +++ b/fs/f2fs/segment.c
> >>> @@ -869,10 +869,10 @@ static void locate_dirty_segment(struct
> >>> f2fs_sb_info
> >> *sbi, unsigned int segno)
> >>>  	ckpt_valid_blocks = get_ckpt_valid_blocks(sbi, segno);
> >>
> >> unsigned int usable_blocks = f2fs_usable_blks_in_seg(sbi, segno);
> >>
> >>>
> >>>  	if (valid_blocks == 0 && (!is_sbi_flag_set(sbi, SBI_CP_DISABLED) ||
> >>> -				ckpt_valid_blocks == sbi->blocks_per_seg)) {
> >>
> >> ckpt_valid_blocks == usable_blocks
> >>
> >>> +		ckpt_valid_blocks == f2fs_usable_blks_in_seg(sbi, segno))) {
> >>>  		__locate_dirty_segment(sbi, segno, PRE);
> >>>  		__remove_dirty_segment(sbi, segno, DIRTY);
> >>> -	} else if (valid_blocks < sbi->blocks_per_seg) {
> >>> +	} else if (valid_blocks < f2fs_usable_blks_in_seg(sbi, segno)) {
> >>
> >> } else if (valid_blocks < usable_blocks) {
> >>
> > Ok.
> >>
> >> BTW, would you consider to add a field as below to avoid calculation
> >> whenever we want to get usable_blocks in segment:
> >
> > The reason to do it like this is that f2fs supports using multiple devices to create a
> volume.
> > So, if 2 ZNS devices are used where both have same zone-size but
> > different zone capacity, then having this single field to indicate
> > usable blocks will not work, as usable blocks of zones
> 
> The field @usable_blocks in 'struct seg_entry' is per-segment, that's not single, it can
> be initialized to 0 or blocks_per_seg or 'sec_cap_blkaddr - seg_start' based on its
> locatation in which zone of device during build_sit_entries().

I see that it is per segment entry, sorry about that.

> 
> > from different devices are not same. In such a scenario, we would need
> > to maintain an array, which stores the usable blocks of each zone based on its
> zone-capacity.
> > This approach can eliminate the calculation.
> >
> > So we actually implemented this approach with a buffer and at mount
> > time this buffer would be allocated and populated with all the zone's
> > usable_blocks information and would be read from this buffer
> > subsequently. But we did not see any performance difference when
> > compared to current approach and concluded that the overhead of
> > calculation was negligible and also current approach does not need to modify core
> data structure, as this field will be used only when using a ZNS drive and if that drive
> has zone capacity less than zone size.
> > And for all other cases, the function f2fs_usable_blks_in_seg() just
> > returns sbi->blocks_per_seg without any calculation.
> >
> > If you think, like the calculation overhead is more, then we need to
> > add a pointer and allocate memory to it to accommodate all zone's
> > zone-capacity info. In my opinion, the gain is very less because of the reasons
> stated above. However, I am open to change it based on your feedback.
> 
> I just thought those fixed size could be recorded in advance to avoid redundant
> calculation, but the change I suggested is not critical, and I do agree that it will not
> help performance a bit.
> 
> Anyway, I'm not against with keeping it as it is, let's go ahead. :)

Ok, thanks :)

> 
> >
> >>
> >> struct seg_entry {
> >> 	unsigned long long type:6;		/* segment type like

[snip...]

> >>> @@ -546,8 +548,8 @@ static inline bool
> >>> has_curseg_enough_space(struct
> >> f2fs_sb_info *sbi)
> >>>  	/* check current node segment */
> >>>  	for (i = CURSEG_HOT_NODE; i <= CURSEG_COLD_NODE; i++) {
> >>>  		segno = CURSEG_I(sbi, i)->segno;
> >>> -		left_blocks = sbi->blocks_per_seg -
> >>> -			get_seg_entry(sbi, segno)->ckpt_valid_blocks;
> >>> +		left_blocks = f2fs_usable_blks_in_seg(sbi, segno) -
> >>> +				get_seg_entry(sbi, segno)->ckpt_valid_blocks;
> >>>
> >>>  		if (node_blocks > left_blocks)
> >>>  			return false;
> >>> @@ -555,7 +557,7 @@ static inline bool
> >>> has_curseg_enough_space(struct f2fs_sb_info *sbi)
> >>>
> >>>  	/* check current data segment */
> >>>  	segno = CURSEG_I(sbi, CURSEG_HOT_DATA)->segno;
> >>> -	left_blocks = sbi->blocks_per_seg -
> >>> +	left_blocks = f2fs_usable_blks_in_seg(sbi, segno) -
> >>>  			get_seg_entry(sbi, segno)->ckpt_valid_blocks;
> >>>  	if (dent_blocks > left_blocks)
> >>>  		return false;
> >>> @@ -677,21 +679,22 @@ static inline int check_block_count(struct
> >>> f2fs_sb_info
> >> *sbi,
> >>>  	bool is_valid  = test_bit_le(0, raw_sit->valid_map) ? true : false;
> >>>  	int valid_blocks = 0;
> >>>  	int cur_pos = 0, next_pos;
> >>> +	unsigned int usable_blks_per_seg = f2fs_usable_blks_in_seg(sbi,
> >>> +segno);
> >>>
> >>>  	/* check bitmap with valid block count */
> >>>  	do {
> >>>  		if (is_valid) {
> >>>  			next_pos = find_next_zero_bit_le(&raw_sit->valid_map,
> >>> -					sbi->blocks_per_seg,
> >>> +					usable_blks_per_seg,
> >>>  					cur_pos);
> >>>  			valid_blocks += next_pos - cur_pos;
> >>>  		} else
> >>>  			next_pos = find_next_bit_le(&raw_sit->valid_map,
> >>> -					sbi->blocks_per_seg,
> >>> +					usable_blks_per_seg,
> >>>  					cur_pos);
> >>>  		cur_pos = next_pos;
> >>>  		is_valid = !is_valid;
> >>> -	} while (cur_pos < sbi->blocks_per_seg);
> >>> +	} while (cur_pos < usable_blks_per_seg);
> >>
> >> I meant we need to check that there should be no valid slot locates
> >> beyond zone- capacity in bitmap:
> > Ahh, ok. Got it. Will change.

I have retained the other checks also and added the condition to
check for set bits after the zone capacity, as you suggested.
Let me know if you feel the other checks are not necessary.

 [snip...]

> >>> @@ -3078,12 +3093,26 @@ static int init_blkz_info(struct
> >>> f2fs_sb_info *sbi, int
> >> devi)
> >>>  	if (!FDEV(devi).blkz_seq)
> >>>  		return -ENOMEM;
> >>>
> >>> -	/* Get block zones type */
> >>> +	/* Get block zones type and zone-capacity */
> >>> +	FDEV(devi).zone_capacity_blocks = f2fs_kzalloc(sbi,
> >>> +					FDEV(devi).nr_blkz * sizeof(block_t),
> >>> +					GFP_KERNEL);
> >>> +	if (!FDEV(devi).zone_capacity_blocks)
> >>> +		return -ENOMEM;
> >>> +
> >>> +	rep_zone_arg.dev = &FDEV(devi);
> >>> +	rep_zone_arg.zone_cap_mismatch = false;
> >>> +
> >>>  	ret = blkdev_report_zones(bdev, 0, BLK_ALL_ZONES, f2fs_report_zone_cb,
> >>> -				  &FDEV(devi));
> >>> +				  &rep_zone_arg);
> >>>  	if (ret < 0)
> >>
> >> kfree(FDEV(devi).zone_capacity_blocks);
> > Actually, we do not need to free this here, because if error (ret < 0)
> > is returned, then the control goes back to
> > destroy_device_list() and deallocates the buffer.
> 
> Confirmed.
> 
> Thanks,
> 
Thanks again for the review feedback.
Have sent v3 with all the recommended changes.

Thanks,
Aravind

> >
> >>
> >> Thanks,
> >>
> >>>  		return ret;
> >>>
> >>> +	if (!rep_zone_arg.zone_cap_mismatch) {
> >>> +		kfree(FDEV(devi).zone_capacity_blocks);
> >>> +		FDEV(devi).zone_capacity_blocks = NULL;
> >>> +	}
> >>> +
> >>>  	return 0;
> >>>  }
> >>>  #endif
> >>>
> > .
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
