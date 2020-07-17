Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E3F22373B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jul 2020 10:37:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jwLrW-0004qA-AE; Fri, 17 Jul 2020 08:36:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=46091b2bc=Aravind.Ramesh@wdc.com>)
 id 1jwLrT-0004pJ-TN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 08:36:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kkg/7s8SUX6iEATTaGyYkpCS+O2bWK8U/kRXv4PdiYE=; b=TtLasQ6HTjQMi1Ix+par53bZIC
 mb28OzOUPmao6MNMVIIm3XwmzbiyRa/lZk+HdYBa0un4LyZvVv/fqZLP91Z6uWhRRNQxVdMfp3O3K
 w8TlmR2fqoTSiytSWKyK3JNU+Zkm/1dtgDSGUYbZ/VHhf+BUx83SAdUUwgo3Kw+2DrGI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Kkg/7s8SUX6iEATTaGyYkpCS+O2bWK8U/kRXv4PdiYE=; b=mdU+qQZPTUzxqGAVfrdy6+VTjF
 T4Tq1UKC5K0sdVHGA+Klt6zGZQQmx9tE3GGTM4OGQaqu6pWeEZekWzHU52Bk2jrvJENzC2z4WyIIv
 AsJPv3b9Vtd53tMqaa4wZWUR9CrYmr1hZLmzpcNz80xBK7dQ5/WwKZh/Tj5KfS4xVjsk=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jwLrQ-00Bn5O-SU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 08:36:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594975012; x=1626511012;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Kkg/7s8SUX6iEATTaGyYkpCS+O2bWK8U/kRXv4PdiYE=;
 b=rBPVNO8rZh4O3ASzTFF72NolRH9ZO0B8oQEj8w6gQXyFmI/u+bmuMzi7
 rtb36FowpVjEB/z/ssq/5GyR6k8o2FQcr43P8EwMSj70CQIXKDNOUT/tI
 zKg+9VMDnwjioNflSecsO1Ns5kLdJLyG6ii6wbQGHWIxB0sT81GZsPyX+
 xft07VzvEL9/CVBusFtGWljOTLxmPlOSZd78j2jqVnbBL/KK2AwSt/Rpz
 WCEFrj5y3lWrTcpNT0ZUmGr6mnId34RySF1V89OmxL36hO458k+51jiU2
 9YwEfSZYc2K/Rpwssxhye//QVwZNQoKu4H+ME5b/w6Xgsarea4LDRcoDm w==;
IronPort-SDR: gOiCwbL+EAyfIn7oJT8rg5cMY5mzt7GavikxvXfy0p+3ckCfmrwIxTLRNG0yPrAo9/vTYEEhkF
 ALmBBCJFDF/yOk13DtALSNDkIMZ/nDi7R5me5QLYOjdZES2kCh5pXvGsm05JYwfTWjyvA8yA8r
 +9bHpNEJcqjjc6YbXE0kurFPhpx/rG4xiZLA0J8D2T/W4zx7lM+QxuQL2/B2Mcz+54hjq771PV
 8YU+p+mpgyQkhNVhhNp3ZgDZn4XnLX1+eUUBUnRkWnielaUnrXgGnaN69NzKsBTY9v9shsyUaB
 Fy4=
X-IronPort-AV: E=Sophos;i="5.75,362,1589212800"; d="scan'208";a="142697523"
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hgst.iphmx.com with ESMTP; 17 Jul 2020 16:36:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgWTTsxaKX1CkYBKZclkd8sEyrR6WOE+tJRPJt0l55FPs8SrfnSKUwQZYK6ecVNvRJTtwmwB443fCFj3mxX4LVFsm53Zur3Fa8kCCyIjHMwEMNpCkKkpS8rLcJHB+23sMU+LF0nPkJ46Y1cVirNXgPSLaPoBDAWAWYR8ceu/3MYhg0rzqqpppzE7vXyjAXfdtTFTLNEeoahtw1ezKwodzw/C02OQ6xjgRabC5fKqHbaocx+qbE8QztftkxwbjFnBSigbh1pSRYe3DdwkSQSgwkebrDo7itJ1x9x4JY7m/J9SdSICQe9kyluGJafLgHlyGliPiMFpPWIlRko8GWBwXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kkg/7s8SUX6iEATTaGyYkpCS+O2bWK8U/kRXv4PdiYE=;
 b=WO54b5Iu8HYZm4SESHf4GtNufqdnENU1iM09yKHZebkJi9MYZAjf3XZNjYefljFONIc10JRML7Snj6cxeA0WxAKNnmAh68RB0ZHE284m812jUvx1OCJFegzW3s7Fcwrhf41QeeXcy6JhUwRw42jGIgyUBLoO0zyxxP1czlIIiXhw02MbdD/Y1iDkUKQn8yyge7ZWrGgw7GT38jfPP9DEdaTECoKlMJ/8oGUSoA1fVcYpyu90vtOC/lVWvYTY903WsTHFtqLDNvNsFu/TQmYYjVC+HhtI6p/nybtqMlnubocbBAhI2djKXl6nNlEZmBUNaQKiqwwSoU3xk317xZ9s9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kkg/7s8SUX6iEATTaGyYkpCS+O2bWK8U/kRXv4PdiYE=;
 b=fyqLUB7qkse9LfFNBtwjb9Ua3cE5QMiUKaHkiFSSgJJOp/exHpPHCIOeEvKexRGj8C+Aju6itxRdwestvhAXNxExLv6WpIsM4x/64WnK57A4P0sUB/YM4w0PWxtvg6VKCTymr6hgHO1WVEw6gjrjWRTPMv5C08vwnKbLKwHbWc4=
Received: from BY5PR04MB6995.namprd04.prod.outlook.com (2603:10b6:a03:22c::12)
 by BYAPR04MB6166.namprd04.prod.outlook.com (2603:10b6:a03:ee::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Fri, 17 Jul
 2020 08:36:44 +0000
Received: from BY5PR04MB6995.namprd04.prod.outlook.com
 ([fe80::f813:2bba:2c5c:a63b]) by BY5PR04MB6995.namprd04.prod.outlook.com
 ([fe80::f813:2bba:2c5c:a63b%7]) with mapi id 15.20.3174.026; Fri, 17 Jul 2020
 08:36:44 +0000
From: Aravind Ramesh <Aravind.Ramesh@wdc.com>
To: Chao Yu <yuchao0@huawei.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [PATCH 2/2] fsck.f2fs: validate free seg count on zns device
Thread-Index: AQHWUIkY24OsF95FT0KbWMdSYlHLgqkLeQoAgAAQgLA=
Date: Fri, 17 Jul 2020 08:36:44 +0000
Message-ID: <BY5PR04MB699596C34533F585B17A8F1B8C7C0@BY5PR04MB6995.namprd04.prod.outlook.com>
References: <20200702155427.13372-1-aravind.ramesh@wdc.com>
 <20200702155427.13372-3-aravind.ramesh@wdc.com>
 <5bae3194-9818-8013-9dcd-a95c1497e054@huawei.com>
In-Reply-To: <5bae3194-9818-8013-9dcd-a95c1497e054@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [49.207.56.182]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3eb68583-4cd9-4f9a-5101-08d82a2c8981
x-ms-traffictypediagnostic: BYAPR04MB6166:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB616627CE19FCF70656C5C1288C7C0@BYAPR04MB6166.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mgke90UGUyoYWaRjQDZkQr5eVVr21PFUXHR/G8GWgBgyM6spWq04t4Lwqry1Hrrb/cQgQhJ8bub0kTO0ruOoVAJlqnyG10C9JH0mlWRT2+C++nOA7Eq4Ofep7wCbWLgabXhVxLx00LSkUnXmrjBScJ8NI3H1VAV2OeaU05OMZVRTYqZF/d9ixPEOID+joRjQ85T4dcfz34WXCaw4pLm4p3cbBrhfnzRLxaSined82yHbQfr7SXUMoyAwLCJIEfPEJK/jc6qXCLDMtgWzZopA55i1csGLibA77XhB5B6RxnqZBelpN8hh6RNH/FvAYDPW+5iXnoZ7e0b75BcL8epM5w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6995.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(64756008)(8676002)(66446008)(2906002)(316002)(76116006)(53546011)(15650500001)(55016002)(110136005)(186003)(66556008)(66946007)(6506007)(478600001)(83380400001)(7696005)(54906003)(52536014)(66476007)(86362001)(9686003)(5660300002)(33656002)(26005)(55236004)(4326008)(8936002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: uIOnAYTOqpr/ZYDbiJ+jRdf8K93AB+eS3jmECM2zm/CiFF/m/ZsXZhNmGxW41Nnbt+NuIGthogyrl5x++8f62hQkP3jlaeC3KjMjmsZc4t7yqudeFDncfiFE2sW7vpjOoRBVZ9xc+ojMvxWgnRBBggyWwcQMFp7svhagcXQRDUzMH6FYlCjtEnHv3J1o+npRn3EiOTACEBmMZlz4bE1V8vaaxqcom218o5+g7KnI2au65FepF9kfFq9ZE6dYLQWm3/hF0ldm+qkGA7rsnW0fhh15De8EAIKl2q9Pdu2zytVh/+zlQzFXWvTvXe2HlW3NNAwWX3f1jlzDj4ZaR7uv7nUpMl0VtU9l6pgLQ24OyvSdF6axsBivC1hzw/e3yfxXp2pIe5Rx8s2yFBeGq1UhZT0VTUysHYff2Y4GT6t+fjL2lZetJcU/MuxF6WospagkKZ6hw7golLpWnQpBoZ2ogSNMl7caPjckUVoj8cYk7so=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6995.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb68583-4cd9-4f9a-5101-08d82a2c8981
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 08:36:44.5382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BEzMAO2EhhFnUv93CJbrLMx+3QW5q+lKgo4DOMzQ8Z5sgTavmImB3X25EYq18SHCY4R6fko/sGPtEfkpR3egqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6166
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwLrQ-00Bn5O-SU
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
Cc: Matias Bjorling <Matias.Bjorling@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



> -----Original Message-----
> From: Chao Yu <yuchao0@huawei.com>
> Sent: Friday, July 17, 2020 1:07 PM
> To: Aravind Ramesh <Aravind.Ramesh@wdc.com>; jaegeuk@kernel.org; linux-f2fs-
> devel@lists.sourceforge.net
> Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>; Matias Bjorling
> <Matias.Bjorling@wdc.com>
> Subject: Re: [PATCH 2/2] fsck.f2fs: validate free seg count on zns device
> 
> On 2020/7/2 23:54, Aravind Ramesh wrote:
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
> 
> It's better to merge these two related patch into one, otherwise, it looks good to me.

Ok, will merge it to one patch and send a V2.
Thanks for the review and feedback.

Aravind
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
