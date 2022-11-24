Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C9C636F81
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Nov 2022 01:55:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oy0WP-0006YT-Ry;
	Thu, 24 Nov 2022 00:55:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=2327a730a4=terrelln@meta.com>)
 id 1oy0WN-0006YM-Ng for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Nov 2022 00:55:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=QXUFHQV/TySVFd7NvlaYB/j00ttCFyMplZleD0e4pZI=; b=HzJDJPJvM0I+gm9anaycLsudAe
 rAJbCc3bHZgqeyxUfiElBDfzF7kLc8syO3WxEtH875pISXo4EBYUCL7uDRhPjvYE27gFJZMiIQCEB
 smDzoPFONAcUyM/3lhyNk3SYQRk77IM6mrCIqOGbJFXq+u1rqUYaSn/2HslL1exFuJds=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Content-ID:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QXUFHQV/TySVFd7NvlaYB/j00ttCFyMplZleD0e4pZI=; b=Ze6DvMyhwNsgq8sEys9WMRJ6c1
 FUeRemWIWjjvpMEzBUSBswYXlW7xtTIsSqK75Xo1J9F/yT3M6FhpwTsWsGAvOfIFpLAAO2V1w9qly
 IGQ7fRTe2AklHzWR6IsYBQbBpYxIhkjf4CHS1cMNJvmhsqEAEx/+SAH4eHDAyD+5FJvI=;
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oy0WF-0002jl-M0 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Nov 2022 00:55:19 +0000
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANHsXYg014409; Wed, 23 Nov 2022 16:55:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-id :
 mime-version : content-type : content-transfer-encoding; s=s2048-2021-q4;
 bh=QXUFHQV/TySVFd7NvlaYB/j00ttCFyMplZleD0e4pZI=;
 b=X7KOtMdqZ+50b33XEW2moEG3w+qnR8gQUmjFHVeqmof6uu3QQRCMURDyLutnVjmqw2XL
 zB0eKCOU9IogNdPjH+96vXZfv2x5cn0DQ2EPNhlau7K6Ce8A8Qq+jc1xq6X9RpDwMCtt
 BmKpjbCTLkmsmP8/vCKfozZEZB2IMcX6wpinxbBBdAFtYlzTUM9uBQYQP4bj+p+Skp85
 nziaKLg3O8ZpiAdnWG1lKXBVAS5MR5TRYq2jhN2zN9+4nnMKhpUEjrbBQZyXcKQ0GZu6
 RVptNnI+nK+/2Er1AhTFiYPN5Y0iJ/+4cMawReeYIzgFnndsJDDiqT6XH1mAQZKH0d0i nA== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2044.outbound.protection.outlook.com [104.47.51.44])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3m13qhta5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 16:55:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwgkdKLrZWepjGrncjz7QWGcGx+XuzLU6sCUoRbheFE1rU+5oq52fugzSRR+tKhVsmTdVCnU/97dzRbnpDPR5M1VIi9v/YCC/HbNIbmB6SQiqHLR62jfVYy2o/w4ggRwHcIyVJrbc08ZlcKQBwmDQbZPUoSZj0+bOZv5nudRV961TNRngqyLB6bmsj5XXPd0oYAm5fCv5HfQBoE+888WcDcjcoX1ZqW2/rcCPP9x7F3oPtt0OUiwMtnsMAisPN9oE3Y5ORR+6LtBfiFnEg035i+hiXDrwC92HFINw2qtvpSp7ePDnZd1/PBPYHL1vi97m4pxSMTRkpy0033ldSLsIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UC/+mMhMyP/7Jn8/M1DaDMR85KK6cIvx0P8BJ1NKoDw=;
 b=KaKSpDRDOOPS0Pp8tnl2nvaQ0gjKK0sslKn9t8r1YV/jSe2edntftelECKC7fu08XzRaouaa9PcKoEEQ3OEEB6T40vJeA1wuG6VKrg3H5KLrOlzxGw6DRytUjEf/6niRfudQmw4b1hmtZ/rYf2/oxNcFFs5wxlZIFhVCCTq69evqSLXnq0dfkE684v8/TroB1k5muS3nEBxJeW412c1xH0nQmQ8JPVGbwbjCbCLv8CKTkHhlgaFj/vSpYOfvwigoNAWqAjtgz56aBpN446cK9ZhAURBS3tSuREUC45AYyDziY6XYbXCxEggDghvY8Y8bUPBa7n0nec/XCvt7aaAtxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by CY4PR15MB1109.namprd15.prod.outlook.com (2603:10b6:903:108::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Thu, 24 Nov
 2022 00:55:01 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::e563:bbde:256f:5d0f]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::e563:bbde:256f:5d0f%5]) with mapi id 15.20.5834.015; Thu, 24 Nov 2022
 00:55:01 +0000
To: Sheng Yong <shengyong@oppo.com>
Thread-Topic: [PATCH] f2fs: set zstd compress level correctly
Thread-Index: AQHY+pbedvpO7jwZYkCuOnlXi55qZq5NSZQA
Date: Thu, 24 Nov 2022 00:55:01 +0000
Message-ID: <8BB6F23D-6BC3-4B5A-BA94-9B8A4C58BC92@fb.com>
References: <20221117151054.2232946-1-shengyong@oppo.com>
In-Reply-To: <20221117151054.2232946-1-shengyong@oppo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR15MB3667:EE_|CY4PR15MB1109:EE_
x-ms-office365-filtering-correlation-id: e7fcb696-033c-4728-201d-08dacdb68451
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wIRc92TyItD/0IkO/ujl02iNrmd8pi5UTKs75qlrYibPL0x3Idn/CzhgnjRaKPPgdZT58TX+4NTXEGUqzb8T82P+a84ryEYT3bIvvrXzqH0FJhGLfDeADqOPqf+UCvv/h/DyYF1wgGEVNQez+OTOAcrVwofXMcMQ4TPTBKewPHbZPfU9HbHt3aYvhJ3QtCPHI9cgh1nxR1rA+ZgqSqx2UFOXrvRTVeBmBEleneam2Ig0bfPyk1P2h5SakONrC9L8blQRAyIittHSbAim9HwI2OpCvGQfXVHjC5/EMULWOf0DoMP6OVmrwwDe6FAQBYjlDIAQAxcg+ZZu2bGEMuG1r6Bh6EvqJ+cVwt44xkSibpPb0eIwc3kMHz8e2u0fy+mMTkiPb9WK8fY+7aHm9ceY9k5kevwUxiOPSjleXDF6Urj7Q+Hllkaoyl0iUXP4+bNFH1WVYX17Gr1VTA7JXYZj1C15NG9RWqv9OYUdI365We945bXFwwscpetkl/6GXN3cVA/XBNjTrKvYFUz0OKjUcd/JzsIJpXaFcBorh4PEklxI59lelgviuLHcQZl5LcUwBQZXiuBarn3CfASJBtjag/A3e7eP0KUX3K4C/IxKVp1BFGWQGIV9mqTO+lOKM5BtASVdYk5+5XaWFVlToyKG9B8QqXdQ2eTAI5YasOkCWtlyTKhQYdivfISUx6eE10wUIVPW1sDhsBNqgqMQ7j4P+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(451199015)(6512007)(9686003)(6506007)(53546011)(71200400001)(54906003)(6916009)(316002)(66946007)(4326008)(76116006)(478600001)(66476007)(66556008)(64756008)(66446008)(8676002)(6486002)(5660300002)(41300700001)(186003)(8936002)(83380400001)(36756003)(122000001)(38100700002)(38070700005)(2906002)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Alqs+bMc4IvPDWqYCXyc91FIYiEbMrenlX511dzj5MirPwPQR5goX/pSJq/3?=
 =?us-ascii?Q?N7iE7RwjwI3DSHDCqOJETf7DDNL6Umh4cAxvHwmB/um6MFnYgKFikVsUgEGw?=
 =?us-ascii?Q?w5vGEQfm9pgIUb/zvoiCgB84Mlita5YcY4Ek8pFI/zKCJNtU1xADboTL2YYh?=
 =?us-ascii?Q?zME/LvYJv/iMMtlCvkCxAm1vHxE88Of4wdk0TRa3MfWW0mAL4J8kI0kkrm0z?=
 =?us-ascii?Q?BUYO1JJMHzeqcKwZSw5ruNUFdtB8kt+HMJcvdFVSaRbYH/1UdAIE38XnAI/o?=
 =?us-ascii?Q?0xysvnTbckK4L8I08iB3FHksbjOohJP6fgBcwPf4kda+ssFHpBdr2w8NjTYM?=
 =?us-ascii?Q?QoxX3D2eo+6JzoLdfU0L3sewEzTJoTiOw36bA7Rf6uTIQ41n1ySZCUjyhEjJ?=
 =?us-ascii?Q?LByEK/VYx0P5dX+8xQaQzsoO+fVwYnc6O+rB0tddl7A4YfIGl9pHKMp7JzDt?=
 =?us-ascii?Q?mnrCGpjAdMnzcfwXVASlndGLjp+FHNz7QCrt4CUCvyxHKVE24PeTY1ivaOvw?=
 =?us-ascii?Q?P800qvdpcFkGO1FescQbukdPtj6bf38W7EHZh1UsJbnX5nt6ZRUA0gTWjat1?=
 =?us-ascii?Q?lnxlBgZs7CAvnR8soYNm0+qUEVijj3fo517uHccy4ymkLEL3/WyU2Frru0AQ?=
 =?us-ascii?Q?k/GPje5xYGtNl4NZbdOP063D7UcJyJ/rhaJraDGPJwcM2yiLpRuLgrdkiYrk?=
 =?us-ascii?Q?miTR+aNMbTqrHMJWIar/fsJNHsWZoESUWbF3E+/3zmPtNgrHsXTFhir4wpqv?=
 =?us-ascii?Q?xlwtXiTL58HddQ9xGeLjqSBkC0UOCknQciq8nnlfWFN8gFZO4gNfrV1aDJKc?=
 =?us-ascii?Q?cqD4yTgiEh4Ff0cnBZEjnoROj2LLW5Lw2Zt9xcFD3IZcnjJBjxUbE6iA63uE?=
 =?us-ascii?Q?WSAr4JDA+2/UqV1ETdRZke+EouUKV0wRzH8W0RCBhW5YsXJBoSndyK7xfeT4?=
 =?us-ascii?Q?3yMFCzEQPop0t2XYGLoBglWxRVFfaiIuopJQNkrsLS5lQqRl7jeuNZTkvY0+?=
 =?us-ascii?Q?qQSqaoEs9MhJQ+V/0pF4xSB6sgB5qABJ0M+yobujJ6gGssBrWSqR+Z9nZui1?=
 =?us-ascii?Q?OkHO0Zxgkmmqa4hH3maju4wmSFA/AjTEUI60CTUaas2nLvSZJEkRnqSPe0mz?=
 =?us-ascii?Q?3b9qFNb8+IHf4cY4LTa7379ovbECHKBTS9sQ8f/Lw44BqEWrn2UtKSv3h69G?=
 =?us-ascii?Q?n+xn+dvzjc3zES1rB6zZ8kjTATjSp6wITvrjZLjFZ0Vjl/+uAD/nLmY6w4EY?=
 =?us-ascii?Q?i1NCSW9ujoiu9qSdohqk2AB+Fee/Cp953SwJsNwXWMpMJb2uSouPXI3ZCAR8?=
 =?us-ascii?Q?eINRHfGcfIDUzVxwO5xxmJB7sX6MA01OARPtzQkc/kA7oijxeQtojZUNHyXw?=
 =?us-ascii?Q?d4Zfv1fbl6Uv0C+2ImNJbI21Qwp4s7vo9y9RkkAv6NqpIck7PVrzDYwqcuW/?=
 =?us-ascii?Q?i+nSyDnJ1KYYFXJp5w3759LLwqaMiMut8/IuPowV1tTLpKq/IPaSDIHAwO1j?=
 =?us-ascii?Q?wUJJINY8VdGqURXXORW1ittAhLH/SmaYwssVEgw6ZEY8QVc2qPgGHaEhn1ES?=
 =?us-ascii?Q?ykpiMxNX0qGGKvIsgusOwDENu6K2uEQaJEPUnISRd2lB3b0u2xLhD7is3AAm?=
 =?us-ascii?Q?6TeQVD3RPM3i6u9kDI16eRE=3D?=
Content-ID: <302FEDF0361C9D44AE1E9681B8C22631@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fcb696-033c-4728-201d-08dacdb68451
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 00:55:01.3060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joIbD7e30RtxdHHGiTbEA9Lf3TpBhqORNvimOz0esaofDs/mmRZ24ApME5fff2doQfVHiVyQ32lK20x1sZwaDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1109
X-Proofpoint-ORIG-GUID: TGLlU3bkg-2lKWymLsB4WQhug1V3zxxQ
X-Proofpoint-GUID: TGLlU3bkg-2lKWymLsB4WQhug1V3zxxQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_13,2022-11-23_01,2022-06-22_01
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On Nov 17, 2022, at 7:10 AM,
 Sheng Yong <shengyong@oppo.com>
 wrote: > > > > Fixes: cf30f6a5f0c6 ("lib: zstd: Add kernel-specific API")
 > Signed-off-by: Sheng Yong <shengyong@oppo.com> > --- > fs/f2f [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [67.231.145.42 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.145.42 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oy0WF-0002jl-M0
Subject: Re: [f2fs-dev] [PATCH] f2fs: set zstd compress level correctly
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
From: Nick Terrell via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Nick Terrell <terrelln@meta.com>
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



> On Nov 17, 2022, at 7:10 AM, Sheng Yong <shengyong@oppo.com> wrote:
> 
> > 
> Fixes: cf30f6a5f0c6 ("lib: zstd: Add kernel-specific API")
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
> fs/f2fs/compress.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index d315c2de136f2..74d3f2d2271f3 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -346,7 +346,7 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
> 	if (!level)
> 		level = F2FS_ZSTD_DEFAULT_CLEVEL;
> 
> -	params = zstd_get_params(F2FS_ZSTD_DEFAULT_CLEVEL, cc->rlen);
> +	params = zstd_get_params(level, cc->rlen);
> 	workspace_size = zstd_cstream_workspace_bound(&params.cParams);
> 
> 	workspace = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
> -- 
> 2.25.1
> 

Thanks for the patch, and sorry for introducing the bug!
Looks like I missed this while rebasing that patch series.

Reviewed-by: Nick Terrell <terrelln@fb.com>

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
