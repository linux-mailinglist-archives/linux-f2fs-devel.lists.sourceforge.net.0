Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F7F2DC8BA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Dec 2020 23:08:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IKp7O/ajnZgfOR9WnDdyk8+SBKFDeWqhyBDO2jWa+ps=; b=lE7Rz5wVys9y1vnQkKJbRBAvm
	GA11t9WByuKU00uB0ZlVUGzQ++g5/XnVrUoAA4rcoekFJSayp7mXKtf87VHMpmFSL7D6lNTX/z05M
	xTW6ehH5DNSHlhfbHMMXqaI6CYXD25FKRFwkd0pTm70vkBcYHbPXoxSKo7QkioZfXKsNU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpey7-0003Ki-2e; Wed, 16 Dec 2020 22:08:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=9619487956=terrelln@fb.com>)
 id 1kpey5-0003KY-RA; Wed, 16 Dec 2020 22:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ncpd7qSjE4VFBLQXuohqZJqw5qBUroepTWPS5VFcz8U=; b=aKx92u8bkzLoTFDjbAiGJtbgcT
 MdViFInNbuEMArMFoRdDGu76GYfGNPKvDtW1D3oS4Biakov7bQ+wiT5m6C9GJeF/74A5vv77DPi14
 dBw/8N38JTBZeblSQ9txhlRq8HNkHdRU98U1KjEKVex2nBU7pBRUA3yxvkFqA9ZDwjNI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ncpd7qSjE4VFBLQXuohqZJqw5qBUroepTWPS5VFcz8U=; b=GR760z+zAfW3IIOyWAnfw4tNAz
 sPk5vQC+1PrHpSsTTz4Nbr2BA6cBQrxhpcmZxfX4n1hggQXXManOJim+eC2MfNBb+7VdCNA9UdAnv
 hcc7MkYw11Xkte2h4UED+EZyDCEwsroBJt3eqichAfWYVYLIQS+3HmMmjdwUNCouJXu0=;
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kpexz-00GOcj-4q; Wed, 16 Dec 2020 22:08:21 +0000
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BGM3uTx008460; Wed, 16 Dec 2020 14:07:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=Ncpd7qSjE4VFBLQXuohqZJqw5qBUroepTWPS5VFcz8U=;
 b=WmqFS5oWZ058bwQPXWvrrd+eH4VuHcyXqAOt1Ds5csxMEmjl3fyaupf28ZVAF1dPCpPN
 gyvIiT5AkArjt9U7qCAPZ/eu8IK+fKe1YdyNdyzU1Ndv0dDGvaNsCeTT2JNjXDMwgBNA
 6VD5hHDCZueX3MT/tQaUqnBD4wTlyzJilOI= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 35fn0sa69q-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Dec 2020 14:07:55 -0800
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 16 Dec 2020 14:07:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lfpheh0mSoh0sbDz5qpTG8Oz6cqJepB1XHmNXaixNaMagJUARtHUrhC1mmS4wTxHi9P2RCmEThWY+7/yam+F2/Fsr2CpXclP3bLwhLUXkfAQ4Eo1akInIamVpDSy2bwN/maKzQYoMdJeKyeJMQqfyI3qVFa/G+SyZy+4O79rpylOjhFbnraBHWkioMmHBpvWUHTatGXYdnzIQy3OJiTfynoGqpdQeSqppAne01d8wZO5RJjI/6hoAXHhC0u/XYVMHVCq5RiyLWa6XD6jOduSsE6PuUy/cGGqdEWrhoY+tQ851uICihuHuLYTV5xBXN/MP+EUMpdfc1Kd53jf867iuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ncpd7qSjE4VFBLQXuohqZJqw5qBUroepTWPS5VFcz8U=;
 b=JU84UzHYcEM8J7oDuJKkFSTpUqW1YJ3tvELU3Rr4xOdO9mJwfWU+cAKa/YwvLCMt0BSatwXWku2/kzZeeek/wQ98JPM7l47tQ+GXQytOEdhMWOAR/xgxwfr2T2AcCbm96UR/g4qEgQA21tT/nimFfjFjpGXOFvz6uQbyGglJdskgBCxGkJyIyrQvtYOrplJILQ1EYALeitCB189W4DQLz+1GjAVQ8TJH1epANZXBcPWVid/GIk0lFaWz/BXs1ur+yk3le0yTWH3VgaiXi+yqaWH8DG8SV8jWsxtrTjbMshWkIc7C3ZBPNhnFC4I8g22Wgi6BqW8Iec6pH4FlFszGzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ncpd7qSjE4VFBLQXuohqZJqw5qBUroepTWPS5VFcz8U=;
 b=AE1+qduny71c4czGogWKByPGhzwLKMq2Zz8/BBMuJ3fZgVMsh7CFGgHjaI8DqyGViQ8ovrEMJQB9lrlIqEYxtIIyEgmVo7zdqVgrx9E+vxXUR63uAa5dHvuT6NyTHJDbvfJYjiARSdI2GezUsZUlDAqZBamHJzP647Zt3/aSvBQ=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB3416.namprd15.prod.outlook.com (2603:10b6:a03:110::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.20; Wed, 16 Dec
 2020 22:07:38 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::17e:aa61:eb50:290c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::17e:aa61:eb50:290c%7]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 22:07:38 +0000
To: David Sterba <dsterba@suse.cz>
Thread-Topic: [f2fs-dev] [PATCH v7 0/3] Update to zstd-1.4.6
Thread-Index: AQHWybXbXo5DSFQdaEqlAnoQrw8JMqn4tsKAgAAywQCAAA2CgIAAApeAgAEruQCAADb6AA==
Date: Wed, 16 Dec 2020 22:07:38 +0000
Message-ID: <6C449BCE-E7DB-4EE6-B4F5-FED3977BD8F0@fb.com>
References: <20201203205114.1395668-1-nickrterrell@gmail.com>
 <DF6B2E26-2D6E-44FF-89DB-93A37E2EA268@fb.com>
 <X9lOHkAE67EP/sXo@sol.localdomain>
 <B3F00261-E977-4B85-84CD-66B07DA79D9D@fb.com>
 <20201216005806.GA26841@gondor.apana.org.au>
 <20201216185052.GL6430@twin.jikos.cz>
In-Reply-To: <20201216185052.GL6430@twin.jikos.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:a419]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71085ece-d0e5-461f-5075-08d8a20f005b
x-ms-traffictypediagnostic: BYAPR15MB3416:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB3416BDB508E9DFA85765A2D6ABC50@BYAPR15MB3416.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lfUCoGxm1BYDBm8QfTwxCkUq+qMklvjGXzdG5ERjxQqyEoXzP7es9rus8A0J0mTA6I9wiLvm+7bCintGSx3zuUubUGmVNejvljn0KGpxYsx3YHlLwww+YJf+dFe/SSE71HnK+0b1ZVAc1cKdzsfapqwb7wwa/bhbcTrqIn7fK1n0qY4U2w03nBswyeHUxUn6gS08DBw6Aep7UJDen6DqBBFGfZ2o4PJwFdnHDg1PkB6jDyKaKSQr7dr/aq/IfOjIs58x3GNo8ppiShFPAAtYFAoBBCUMXB7bNERQpm495g6nZ9sL5Z5G/9UviBzn/SrVvarUtwMYyoxwnX9JLs+VDoNUX0J89NIOECUFkU7cbB/ho9nywoeen902ELySaJkGkw5wA87jJicAhftSZH5eg7yrqb/iAez9IAC8xTddvKoZSpTGVh3QM8PNaOmh1WaTy3kg0AQfM9p2pH2EZrg5Gw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(366004)(396003)(376002)(39860400002)(316002)(6506007)(6512007)(2906002)(66946007)(53546011)(4326008)(36756003)(6486002)(8936002)(7416002)(54906003)(71200400001)(6916009)(15650500001)(86362001)(33656002)(966005)(478600001)(186003)(66446008)(2616005)(8676002)(66476007)(66556008)(5660300002)(83380400001)(91956017)(64756008)(76116006)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dlJWS3BQQnV4WEdidXpOMkhjbkpXUFNvWFJKbUkwZW4vTm9YdWNENkpvTVYr?=
 =?utf-8?B?RVRLN0JCOTgxbCszLzZZWkhXTld3cHY3bTZaUXI5a3laS2F1QUF5SEVEdE1x?=
 =?utf-8?B?anZ5OGF6Rnl5Zmp6SjdCSmZnYzl2YWtYUnZZMDY0VHRhMlk4Vjh4c1NUeE02?=
 =?utf-8?B?aW04eTljNmFDNTBlenRHakU3S1h2Zk04NGFaN2Z0czZDZzVvY2oxTEo5VHlT?=
 =?utf-8?B?WVF3am5NbzBXVkxrbnQzQ0RpWGxta0oyTzJJNkZHNDhBbDl0L05NRzdMUERL?=
 =?utf-8?B?ZE1mYW03b3FGYXhSSGdDOFljMElhY1R0ODY0aTdqVnNQRG94MEhLbUNGNmlB?=
 =?utf-8?B?cU13c3BCQklRVk5MSEdjbEhvc1dyNWpncU1PMVR5Z25EWUNtY3dkSzJaY2ov?=
 =?utf-8?B?Umh4S1V5WEtGQkVvYWpCVEhEbGJESGtIYUdsc3Y2VWZhaVM1aXlTdTBwU3E3?=
 =?utf-8?B?c0NYUGpFc2ZtMmkxUnlPS0VmYmdEbG1RdzJMMktzNXJaTEhlcjJLdXlWY214?=
 =?utf-8?B?UWc2LzBBOG8wbys4NWYxNExyazRpNlh1RW85cXpPdExwS2xiOEp6TTdZRU5L?=
 =?utf-8?B?NDdxQWp6K2d2clZNWlpwT0ZiZjh4RjZ5VmEwV21IUVlING4yT2g2UVA1cVpB?=
 =?utf-8?B?RlZ4QUxqdFZLOGNRcnQvbFNweXNseVlSNFIvOGNnUEoyaFRXeUhQKzRueG5i?=
 =?utf-8?B?SHdxZnhMK2xiSytvRE9wYWNiY09RWWhhbHpBS25tbGpCbDk0NUdOb3NiUWNt?=
 =?utf-8?B?d2xURXRvRjFKSk5sUndvTWVsa0pNbXNGRUFUN3FubXdJL2VpMC9RNVYvMENa?=
 =?utf-8?B?Z2VCd0V4VnVlTDl4VkZrNEhkY091b2xuaHNPeHkxejB1SGtjNU42WUJNMU5y?=
 =?utf-8?B?Qnk4eU85QjhiajF0UmtFN3F1RHY1UzhyNHdVMmk1TFZIRDBWdXk5eUhodjlq?=
 =?utf-8?B?dS9XZVY5T1RUVEdVS1N3bXI3eVp3S2d0WWF5WVg5YnB6QjlWNGhxakJhSi9o?=
 =?utf-8?B?dUhIdnFVcW5jOGdmeTk2bnR4aVlXRW1WUm0xQmpraWdoSXFkMnNEN214Z0Nk?=
 =?utf-8?B?WURQTTZ1cFpud1JvUmNjRURSb2x4ZG1QNkNmdnlLMGlBUXp5STBoTC9rMGRU?=
 =?utf-8?B?c1NDcWRwWm1JM3J3VnU3c05kUmJ5a3FQN2tmMGErb2tKYnFQYVlwbVhTUml4?=
 =?utf-8?B?bnN0Vm05bGVNczQ0TTlGWThLSHBCWnlnWVE4ektiRGt5M3pKMUt6SG9JZHNq?=
 =?utf-8?B?ejdPZmNGSW1OV0YrZTVXUHRnbW42NU8yZkdldnliMHNyellmSnhMUVhvWG1W?=
 =?utf-8?B?S0tmUWFGWXFEM3VUcHpxWWlmOUdsYWRCNzRmY0h6VTFJRHJieU82dHFVYWJF?=
 =?utf-8?Q?5eoY5mutJkcSsxyL2l1t5t3mWapBa8y4=3D?=
Content-ID: <6D3CA0EF00B4244899495968FEBC804D@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71085ece-d0e5-461f-5075-08d8a20f005b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 22:07:38.5049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TXFJJn5y2MaptsODvCUd4CBd9zf/fK1cnuwq/S2EbTLf1B8R7iO38M5YJvi8Jdve
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3416
X-OriginatorOrg: fb.com
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-16_10:2020-12-15,
 2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160138
X-FB-Internal: deliver
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
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.145.42 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kpexz-00GOcj-4q
Subject: Re: [f2fs-dev] [PATCH v7 0/3] Update to zstd-1.4.6
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
Reply-To: Nick Terrell <terrelln@fb.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 Petr Malat <oss@malat.biz>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Eric Biggers <ebiggers@kernel.org>,
 Chris Mason <clm@fb.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Kernel Team <Kernel-team@fb.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Niket Agarwal <niketa@fb.com>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>,
 Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gT24gRGVjIDE2LCAyMDIwLCBhdCAxMDo1MCBBTSwgRGF2aWQgU3RlcmJhIDxkc3RlcmJh
QHN1c2UuY3o+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBEZWMgMTYsIDIwMjAgYXQgMTE6NTg6MDdB
TSArMTEwMCwgSGVyYmVydCBYdSB3cm90ZToNCj4+IE9uIFdlZCwgRGVjIDE2LCAyMDIwIGF0IDEy
OjQ4OjUxQU0gKzAwMDAsIE5pY2sgVGVycmVsbCB3cm90ZToNCj4+PiANCj4+PiBUaGFua3MgZm9y
IHRoZSBhZHZpY2UhIFRoZSBmaXJzdCB6c3RkIHBhdGNoZXMgd2VudCB0aHJvdWdoIEhlcmJlcnTi
gJlzIHRyZWUsIHdoaWNoIGlzDQo+Pj4gd2h5IEnigJl2ZSBzZW50IHRoZW0gdGhpcyB3YXkuDQo+
PiANCj4+IFNvcnJ5LCBidXQgSSdtIG5vdCB0b3VjaCB0aGVzZSBwYXRjaGVzIGFzIENocmlzdG9w
aCdzIG9iamVjdGlvbnMNCj4+IGRvbid0IHNlZW0gdG8gaGF2ZSBiZWVuIGFkZHJlc3NlZC4NCj4g
DQo+IEkgaGF2ZSBvYmplY3Rpb25zIHRvIHRoZSBjdXJyZW50IHBhdGNoc2V0IGFzIHdlbGwsIHRo
ZSBidWlsZCBib3QgaGFzDQo+IGZvdW5kIHRoYXQgc29tZSBvZiB0aGUgZnVuY3Rpb24gZnJhbWVz
IGFyZSBvdmVybHkgbGFyZ2UgKHVwIHRvIDM4MDANCj4gYnl0ZXMpIFsxXSwNCg0KU29ycnkgSSBt
aXNzZWQgeW91ciByZXBseSBEYXZpZCwgaXQgZGlkbuKAmXQgbWFrZSBpdCB0byBteSBpbmJveC4N
Cg0KQ29tcGlsZWQgd2l0aCB4ODYtNjQsIGFybSwgYW5kIGFhcmNoNjQgdGhhdCBmdW5jdGlvbiBk
b2VzIG5vdCB0cmlnZ2VyIGFueQ0KLVdmcmFtZS1sYXJnZXItdGhhbj0gd2FybmluZ3MgZHVyaW5n
IHRoZSBrZXJuZWwgYnVpbGQuIEl0IHNlZW1zIGxpa2UgdGhlDQpjb21waWxlciBiYWNrZW5kIGZv
ciB0aGUgcGFyaXNjIGFyY2hpdGVjdHVyZSAodGhlIGFyY2hpdGVjdHVyZSB0aGF0IHRoZSBidWls
ZA0KYm90IHVzZWQpIGlzIGRvaW5nIGEgcGFydGljdWxhcmx5IGJhZCBqb2IgYXQgb3B0aW1pemlu
ZyB0aGlzIGZ1bmN0aW9uLCBiZWNhdXNlDQp0aGVyZSBpcyBub3RoaW5nIGluIHRoZXJlIHRoYXQg
c2hvdWxkIGJlIHVzaW5nIHRoYXQgbXVjaCBzdGFjayBzcGFjZS4NCg0KSSBoYXZlIGEgdGVzdCBp
biB1cHN0cmVhbSB6c3RkIHRoYXQgbWVhc3VyZXMgdGhlIHN0YWNrIGhpZ2ggd2F0ZXIgbWFyayBm
b3INCmFsbCB1c2FnZSBvZiB6c3RkIGNvbXByZXNzaW9uIGN1cnJlbnRseSBpbi11c2UgdGhlIGtl
cm5lbC4gSXQgc2F5cyB0aGF0IHpzdGQNCnVzZXMgMktCIG9mIHN0YWNrIHNwYWNlIGluIHRvdGFs
IG9uIHg4Ni02NC4gSSB1c2VkIHRoaXMgdGVzdCB0byByZW1vdmUgMUtCIG9mDQpzdGFjayB1c2Fn
ZSBmcm9tIHVwc3RyZWFtIHpzdGQuIEJ1dCwgdGhpcyBpcyBzdGlsbCA0MDAgYnl0ZXMgbW9yZSB0
aGFuIHRoZQ0KY3VycmVudCB2ZXJzaW9uIG9mIHpzdGQgaW4gdGhlIGtlcm5lbC4gSSB3aWxsIGxv
b2sgaW50byBzcXVlZXppbmcgb3V0IHRob3NlIGxhc3QNCjQwMCBieXRlcyBvZiBzdGFjayB1c2Fn
ZS4NCg0KPiBiZXNpZGVzIHRoZSBvcmlnaW5hbCBjb21wbGFpbnQgdGhhdCB0aGUgcGF0Y2ggMy8z
IGlzIDEuNU1pQi4NCj4gDQo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjAx
MjA0MTQwMzE0LkdTNjQzMEB0d2luLmppa29zLmN6Lw0KDQpJdCBpcyB2ZXJ5IGxhcmdlLiBJZiBp
dCBoZWxwcywgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIEnigJl2ZSBwcm92aWRlZCB0aGlzIGxpbmsg
WzBdLA0Kd2hpY2ggcHJvdmlkZXMgdGhlIGRpZmYgYmV0d2VlbiB1cHN0cmVhbSB6c3RkIGFzLWlz
IGFuZCB0aGUgaW1wb3J0ZWQgenN0ZCwNCndoaWNoIGhhcyBiZWVuIG1vZGlmaWVkIGJ5IHRoZSBh
dXRvbWF0ZWQgdG9vbGluZyB0byB3b3JrIGluIHRoZSBrZXJuZWwuDQoNClswXSBodHRwczovL2dp
dGh1Yi5jb20vdGVycmVsbG4vbGludXgvY29tbWl0L2FjMmVlNjVkY2I3MzE4YWZlNDI2YWQwOGY2
YTg0NGZhZjNhZWJiNDENCg0KQmVzdCwNCk5pY2sKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
