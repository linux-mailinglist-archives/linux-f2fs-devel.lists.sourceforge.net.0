Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AED50260C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Apr 2022 09:13:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nfG8m-0004SV-Cy; Fri, 15 Apr 2022 07:13:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaitanyak@nvidia.com>)
 id 1nfG8l-0004SK-Ok; Fri, 15 Apr 2022 07:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=omIGCLGdXguYoUP6MBg7rPuCF4y33QrfLBFAULbl9Lk=; b=YUMJS/RXnGemHSjETvpbEyVnv9
 /CIr4lpIdsxde6NGvUWXJ3eQVa2wCQm8jmmbjVN1b63g3nlw0U2Qku24yUnG6/9tFGPQSt923iR2r
 8AihiK6pH3vWmTs3FjpbT4rP7K5Wg5vwdiS2bqBEASOSEhOp4UjxyOfJ8WgfypXTawE0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=omIGCLGdXguYoUP6MBg7rPuCF4y33QrfLBFAULbl9Lk=; b=d05EmfGSXKmQpRJMn6/URJneAD
 pk4U/vClnd6VsmxnY6R8jrBsZHBGr6iBwIUqDdVNE+CEbAt/oriDFrppfcWd8osmKmrxFMS0kRc0i
 ojbYbQE/1BH3XYDMw3prX8HbiNoUQd1q2HYXG5vOXYRDvDlTrbaB9946RKBy1HepxwHI=;
Received: from mail-bn8nam11on2063.outbound.protection.outlook.com
 ([40.107.236.63] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nfG8d-000CKQ-Aw; Fri, 15 Apr 2022 07:13:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P82s2ORVbDIQbJaWJiObFL0CLo5ewQNxQl1cKjf93adA9YrQCXeils/zai2grgqHWT6T4GP1C0C1w6uzbKAwLGkxkBa48zLUIKXwS64bXWeF+Bv5aNX9ZwWPk+nWa15qTZMiREtkCXAiggauz7226Mvj/iMf+0k4Rz/ULKgpoQAhBBK7m7Lxo3g1sG17olHSQAVs+3ITQ32tq2yQupl7SMuvt8CDRCLfc0NMIQNQXgZieAro6uc2prjCToQjh57Fc6LRQJIEd01ssrODPmJe4Pj4aPH+uUzhFQ/1Id5DqV+2LOcnIkyV/JlLlrsJIoOtlRaNRiUk0uQNF6ZVYah2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omIGCLGdXguYoUP6MBg7rPuCF4y33QrfLBFAULbl9Lk=;
 b=oUb6eg9qq66thkFW2dsafu0xpu758ry7qtaFkyqFeh/a3kpd4XM5WYvxrkA7nynDkjQzFxwQMVDhc4zui4JpRTt0zltnLKP9Er6Nrbd0Y0zh2kyBctQeNWKzIkOl7pYuNS86OBxcMiPuAUuIEM4Q3gZ+Mhy7xJtDFKCAI5qKs/fJybBJYqBr3kO2H0reHrwxVx0lck7ITFiO23a3c9LdM+dE6315lGqYRZ4E/PGA2Wkr5MpoPDfmcciTEjQPKgIUpiBxpPP/QXDkXYyKP48k8EJGMsuFUBKSx48J2PXBKNkGdDiNanYaHBZuTTam+c5GVtakTGG3uh32n1YjkH6I3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omIGCLGdXguYoUP6MBg7rPuCF4y33QrfLBFAULbl9Lk=;
 b=WKHIMc22M8cT1F4TOOdGS5jyRprS6YflieD57kJ9VHosgbK2qXi00dqf1n91wOkO7ioZIoaivqfw2E8t2/tyTEF80oWdFDeVot1F/XsxETSyu/JHk8xM6A0Y0XwpTrsf4O49SF9PbJj8oBkC81zk8KAT7ExVsBJV0OJ8x/aLpj/ihQJjIbVXwFkEQ6+f5qx9tlug0RP1HacUA9FoicsZ1wpcWsWsyDNLApdRT/u2WzVzb3oootNWEegrnufnMNAdwghM737ozJ+YrgKft4Jq+BeeiXX6JKM08kFx3qx24exPuw2WdHEFDi9aqAQqG2xTjKa2hWVsPiJe2YQ3F4WmSw==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by CY4PR12MB1815.namprd12.prod.outlook.com (2603:10b6:903:122::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 05:39:32 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b%3]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 05:39:32 +0000
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 03/27] target: fix discard alignment on partitions
Thread-Index: AQHYUITFeHwvXEjzw06+32xoV+0XX6zwdVMA
Date: Fri, 15 Apr 2022 05:39:32 +0000
Message-ID: <883810d2-c170-388d-a031-63a9792fef5e@nvidia.com>
References: <20220415045258.199825-1-hch@lst.de>
 <20220415045258.199825-4-hch@lst.de>
In-Reply-To: <20220415045258.199825-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f75ff33f-773e-4acc-6d5a-08da1ea25175
x-ms-traffictypediagnostic: CY4PR12MB1815:EE_
x-microsoft-antispam-prvs: <CY4PR12MB1815B6BBB70B3A16BD279E14A3EE9@CY4PR12MB1815.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ct2OLeRIuik4P+2DUeO5AU8gZqPN6uyQIUnOB8Te+jtyDQNy6aUS+2wsUCMu8u05rWrtf0DIc95cYzd/uLaKTLCrJxxQtZnGGKhUTdcGX6GSWCuCwxkxGsNEG+qJSr9MwUJ7XV9Zvf4FJqe7DdIfzabcBJWl0widLMYk4wFdipWIDEgBVwlNKStVB4Pxswixw3xwANpWRJg7bFt0bQFSjiUuJkSR7z0bjIDhBvb4MU32HFtiyMZF6OWyg8DId41GzQeNxLyflykrZEg7zoRuIKYYiICmpgkAzJFBYYgV5mxIh0ODt8HLe8voQYI34dMRJ2q1zzDO9N6AvHzhbTWTMdsKs4T3CR07noro0Q+qb1WlHpYDdG9DvL2DCoCaarkL1zCHAUJkxEAyMDkzxdV7YkDlSMmau8i/g2y9w9JUbyO4YMAn8IbGR+TdxlqOSApiqh5rCevCWXCyj8q6unx+vib0nG0MK7JxHb7cag3lx4NrOlh++otAdbNAgAhRpzSgd6zLuYF5yoCgnE5OXtwW2xmmSbbIl4IfBfZxZ62Uz72R7UeZkrvDAbKwM+q8p0QzWNVE7+Tj5+OAiwUQj9ZN21aoKS/qM0isH1HffCwIA7CF4XxbqGl9FtgJ3gBe0gt6S6dX/NceavBgo1VeL9RfL1LcflQn3Q3aQvl4LqXD+sV+VQ99i4CuOr/ZuVcFtZnN8LvB0jGsL2I6mgWwy/cIGsBz+W3FIUOiMubueCem4c0OQc3RUQ5rHinqZ5V6IZeWEMz+VO6hBed+QWX+vJJ+Xw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(8936002)(2906002)(91956017)(7406005)(5660300002)(4326008)(66556008)(83380400001)(86362001)(31686004)(508600001)(4744005)(38070700005)(6512007)(2616005)(186003)(53546011)(6506007)(36756003)(66946007)(66476007)(54906003)(110136005)(71200400001)(76116006)(6486002)(38100700002)(64756008)(66446008)(122000001)(8676002)(31696002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0tlN1NsN3ExRHNGOTQ4NWpMd08vcEpCWVpOcnFEZTR0TFJXY29qR1V0a2JY?=
 =?utf-8?B?WG5DZWtKRC84VCtLd2xrUnIycjlveWFGbTNuRGY0Tjhqd0Nxc0JrVFZNRGpB?=
 =?utf-8?B?ZnplU09JdGt0elc4dUlocWNGQnZqZGJnVEljUlN2SjZDL0tvMjRDdGJ5V05i?=
 =?utf-8?B?MmVNdHRCZWRNVEduYmxqREl2Y29zdTg0d2NlYW5NQU9ZemYwRDJWMVBwY0xQ?=
 =?utf-8?B?Tk5lUXdJd2dCVlBZczlVNWY2S2o0cVB3ZEdBbDhzeFA2a3lrR1czWHEyUGZD?=
 =?utf-8?B?blBCN0N0QjFpQVlyOGNuNVhFMmh1OXROOUhNTHNGRmE0bDFUeUdxZUJNRWJB?=
 =?utf-8?B?ajdyUHN0aGNuVHlCdTE1cEZhVmVjam1KbGlLbnZwaW5HWGlySUVnY283cHhw?=
 =?utf-8?B?VUNTclhzYTVBNVRpeFNRNWI4RnFUYW1HM21IZCt1anJTTVRoR2xpZHo3TXBW?=
 =?utf-8?B?cWN0YjgwcjZTMGlnSFJlbEowZUNITEhGN3NNV2YyRUh1OHFQbUZ4N2hhcnYy?=
 =?utf-8?B?SDZBaUx2MWdwZ0kzME12bi9hczJKUkpobDhJNC9WbnJKelhRbytKYWNpQW0v?=
 =?utf-8?B?Q2hJQ1dSdnVnT1lEOGFHd0FGSE5RQ2UyRFErcEk3WHJTanlRZWRtUDhVcE95?=
 =?utf-8?B?QzRwV1VLYkl4ZEpYSExkTmRla0gzb3UwK1RsbEtpNVFLdDJPNlVxNXF0K1VS?=
 =?utf-8?B?d2o5d1FxOTh2M05JY3ZyQ0ExQU52LzVLVlROcG4xUUtJWkVQL2cyaWtvekcx?=
 =?utf-8?B?aCtpNy8zZnBvcnpyR1NMSUZyUEJzNVBoeGtydWpnNCtzWUgvTnZQSjdQK1lL?=
 =?utf-8?B?bGtzWHBoYm5SM0pmQ3RJY1JDbmkrTElnZXFOWVNRVmlEOTR2N2FmTFBydVJO?=
 =?utf-8?B?eGY0T1l5Vk9sRU9wcWI0ZDEralBTOUs2RkpXTlhmOUluWXJmVnVJaGxuV3pm?=
 =?utf-8?B?dkh0bElzTTBvc290WGp6WXFxdDZic0Y1N3c3ckQ2Rm10bUlwY1dNMUxnQmNh?=
 =?utf-8?B?bXozSVlGTXkrb1AybTN5aGwxU0hWNUNGd3B4V05LcjcrMmlHNFN1NTRkRU9h?=
 =?utf-8?B?eDR4aFppVVVqVXk0cGdDNVJvUjh3Qjc3OXJIeUpHL2lNWWtURVpUWEpkN1Ni?=
 =?utf-8?B?bTVmWVBkWm0xamF5L0I1U3l4NkJqZUN4eE1zUWk2YlN5QmZwNklHR1diSHE0?=
 =?utf-8?B?TE5yZTVibENkcFdNeE8vZlgyS0NrWlY0WnVsNDBTMEZrWHdpY1NaUFpBby9E?=
 =?utf-8?B?UEJicGxvQm5uMWROTlZ6dWlLaDkzTUp1L0p6ZWUyOTZnT1REUkVxZyswK0xw?=
 =?utf-8?B?cU5UREIvSkxhQUtyZW1FT2pTaU5iWEhoamRscUE0Slg4NzNJQzlGUVAyYWVn?=
 =?utf-8?B?V1NOZHNUOVJFVTRRQTlNcDdGYVljY01mcStrV3lJMCtPWkVqNC92dzIya0tQ?=
 =?utf-8?B?eG8vamViOWdrRkF3eU5kVFViR3FZT1F5azdnZnBJUk1tUWp4QlF4NDBPN3Z2?=
 =?utf-8?B?ZDNXdlEzN1djbDErUlF3YnlCZWdoVjJaMVRRWi9LRFY1bzN5dE5mZjBjaHZo?=
 =?utf-8?B?M3lZakZkdk1DUk5lUmhOYUp0aEJ1WUZReVViY2kxaStQOVhFaWpIZFRGQjd1?=
 =?utf-8?B?Qm9SVklaYXM3QVNNUlVIZHVIVVBpUnpXaUxwdVdHL20xYUdOdkxYSzd1K3FW?=
 =?utf-8?B?Qi9SL0lTd3NXUldmOXkvNllsejgwbFJWMkNpVUQ0WDdCYm02ZDhOMjlTWG9R?=
 =?utf-8?B?ODJPa2d2S1d3L1RIMkQzaTlkd1R0VnA0NzhtUWNWYW5NTll2ZThYbDZ0U2Jz?=
 =?utf-8?B?b3o0MllMNDkxaVN2NTVYNnloRUl1V1NqV3YyNGdpdzRWdGhNMzdFZWNkbGlH?=
 =?utf-8?B?eEJBcU9USU9jV1cyd29DZnYzLy9sZ2Vham5aRWRnWVF0S096Nmg0UmlHVW1y?=
 =?utf-8?B?ckozbFFpWm8zSUVzR3RBRGl5S0hMbEsvcFRVNEdnVEhiSzB6RnpDYUFrVVBO?=
 =?utf-8?B?dlY0bkNrRWZYVElwS3JHZ0ZqK3ZjUThiUmtpQXBHamwzajBCb2FRZDBCWWxo?=
 =?utf-8?B?R1BrR29Ua3FDZmQvb3c0cmwyOWIwVFBVVW9VSTl4RzdDUUNWOGpiSWYvMHR6?=
 =?utf-8?B?SGxGdStidzNBK2l2WE5meldvK0ZtTFJxN00xeU1OeUgzM1gxY00wdmpxb2Zm?=
 =?utf-8?B?cWJFbGlkZ3dOZlp3QXpadGFKSkRkc2I4NTlwMXBYRDF4RWtoS0NNZVFUZi9W?=
 =?utf-8?B?dkI2N2ZVOFBNT1o1UFdjV3ZEOTNRVkU1ZUdwUWxDbDFuNThzM1ZJY0FwZ2M3?=
 =?utf-8?B?OHJGcVZHOXRtdkJiZmNOMjRXQW5ZNjFuQTJKM0I1eS9hNVRKMjZSTUlmbnli?=
 =?utf-8?Q?mwLvyuXNtT2dnZQ8=3D?=
Content-ID: <308F8700311C87409575E1C200FD2EC0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f75ff33f-773e-4acc-6d5a-08da1ea25175
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 05:39:32.4969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ODsOQS1Mue5lFCyrdhicFWU5WLi2FcJdfWJh4a+Hin5SswAuBJNfxrqbBcEL8rN3XrCR3LTTvxXQb4HjN73Pmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1815
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/14/22 21:52, Christoph Hellwig wrote: > Use the proper
 bdev_discard_alignment helper that accounts for partition > offsets. > >
 Fixes: c66ac9db8d4a ("[SCSI] target: Add LIO target core v4.0.0-rc6 [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.236.63 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.236.63 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nfG8d-000CKQ-Aw
Subject: Re: [f2fs-dev] [PATCH 03/27] target: fix discard alignment on
 partitions
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
From: Chaitanya Kulkarni via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Cc: "jfs-discussion@lists.sourceforge.net"
 <jfs-discussion@lists.sourceforge.net>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/14/22 21:52, Christoph Hellwig wrote:
> Use the proper bdev_discard_alignment helper that accounts for partition
> offsets.
> 
> Fixes: c66ac9db8d4a ("[SCSI] target: Add LIO target core v4.0.0-rc6")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> ---

Helper does handle the case for of partition.

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

-ck


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
