Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C67C36CFE6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Apr 2021 02:09:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pxwj4Bgum+Mzrg0HsVXkamS2vIiwl9AVqwCQjLQ+xtg=; b=g2xAw66YuUnJQR1IG5hrhq4cj
	eoMFLHJLdZZcQeDLB2TZJyetZPj8vZ5pHotow+L6xj9WvizpEl/PNSVYzNdZjJaHL9rPHYUuzOAsJ
	jBiHL9IwIYgP2I6s0V9QNrvlEIvzy7TGictteByVAKdBoqSl1BVf9n3azT+HkmOksL6Ko=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lbXm1-0000p8-41; Wed, 28 Apr 2021 00:09:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=37513a1599=terrelln@fb.com>)
 id 1lbXm0-0000ou-3N; Wed, 28 Apr 2021 00:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s1Jtr/COwaxOy+Nh6dR7DILO1xkZ21C1PeTeCxX8XhI=; b=DVxtX9xp6u0+ljf9jCob/gGOdT
 5wa8YP3PdpPQZi+gwkf1RQoEBhYFeSdVqgNUoQVS0Io2DCmYO/k99KYeG7P1qJzixL0JdV1Zecmw0
 r6AqaRljyrhIuyPqYDQreE2VHz436lTeo+tHF/b0ckyhwVBrEJCgHDwt67I8ypjUzgLc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s1Jtr/COwaxOy+Nh6dR7DILO1xkZ21C1PeTeCxX8XhI=; b=iXbTDYf/5LAQ4ucqDEwFQ0cBKZ
 VrB0uifPvlgyT9alA2xYfLNo+wS/B/PZQ3ve6jQsK3YTmOj4bqoqTjZDs5yOSsBJnlLl5z8gqwUoQ
 7rKWuOlC1Tqaggw1QhlXisAjzbk99zYlV5K1F4/OFqI+QyluaB4Ic5UTp2oCroeIht1Y=;
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lbXlu-001cxH-86; Wed, 28 Apr 2021 00:09:48 +0000
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13RNbgOa029553; Tue, 27 Apr 2021 16:39:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=s1Jtr/COwaxOy+Nh6dR7DILO1xkZ21C1PeTeCxX8XhI=;
 b=LEej3VWuDHXGg8QRyng5V1SoJFbuiztBdz9bfDyVtx0sQuQQBY0P0XzVnpSBG1r/+Z/k
 cEtzupcEaee/xz3YsaCNLTSOqwFZnHgV/YZHXA7JSNDbwbKOlXTKLrpMlawgP83QjySd
 9aVeV1/o8k5lHXj7nG1jLckgOKe+361tHzU= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3866w86qkq-16
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 27 Apr 2021 16:39:59 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 27 Apr 2021 16:39:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rhq/zzAt7eLvWOBuercv5CGKRqxuARAiWqMg6d1F8LNkVHw4prUxaqg+4XaaGhP5gcsa3a6J0a+ouF9xTS/iOI7Q4mXV90jwtZ1Y7c30XY17oFsO82t+etZ1JxhG9lyQm2ehH8kJVW6yFJH0S9BaOqYP+Y/IZ6Esiho17c279MdWBe9Q9KRQTTuvkHBQfGpT84HKydmH99/v+A97lsSW1kU0MepDTgG4qcPeRGZW2mI2873ZsPfmwpcolpOsscP49cakZr+oH60Z4fgEpVzjmY2wepegqm/DKrN32ySal4HbkEKwSr8i5lDYPYXxjcpOPwkktHYmJouAeG67266r1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1Jtr/COwaxOy+Nh6dR7DILO1xkZ21C1PeTeCxX8XhI=;
 b=GL2TFll8koRGd9QDr2HszPDx0fMgJwiImroUC0nKPWmP0ToaB/jrv8Q2+G9OIgbnTh2weLNKz8cD9gHbqEM3OizlFZDPmR1YrFtPTz+aaRgok4bFAXaFYvVa/0yXwWl1tD1DvWP8COB2X7vlv7w3BWqrmU40kgfI1yzY1TWXbeMJS0RxkJdfI4MFWiMhHeQspnZRwERkQgRUa7tmP0FUwUxU5LZmNeNc0aRmHoBDnWBO8Xwy43MCQh7neHPBECglUrKP/Qe8qqSfgrguKjg8yrN0dn6migEFxIFWVe7Dygs5NRVVuah/e2jlyA7uPpTMLfPrsuNW5gVyf5OGxMPgYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2951.namprd15.prod.outlook.com (2603:10b6:a03:f7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Tue, 27 Apr
 2021 23:39:51 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::8a:2386:5e51:e2e7]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::8a:2386:5e51:e2e7%6]) with mapi id 15.20.4065.026; Tue, 27 Apr 2021
 23:39:51 +0000
To: Randy Dunlap <rdunlap@infradead.org>
Thread-Topic: [GIT PULL][PATCH v10 0/4] Update to zstd-1.4.10
Thread-Index: AQHXOvWzlqG8R+TLekOIWK8hzOvL56rI7jSAgAAZGwA=
Date: Tue, 27 Apr 2021 23:39:50 +0000
Message-ID: <E3BBA2E7-F6ED-44E3-8FBA-7EF4D67FEBDB@fb.com>
References: <20210426234621.870684-1-nickrterrell@gmail.com>
 <10397ef2-119d-b065-2e82-cac1d800dfd0@infradead.org>
In-Reply-To: <10397ef2-119d-b065-2e82-cac1d800dfd0@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:3399]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69e46543-e723-4904-3208-08d909d5c06c
x-ms-traffictypediagnostic: BYAPR15MB2951:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB2951A6EA4554F23922736059AB419@BYAPR15MB2951.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BKKiUXQz36N2CsN2KOvciffiIz3BqOvhGGZxy65xruJRLVOs1Em2fMYHFxAVxOdSRErQMnTQTTi6uIWS9325qYoWI7KxAlx1EwfA1slanrHFFyV6WaSyGtIJP5BnhTyRHgzdiJN+p0qXVcryKZzkdaK93f5G+dV8Tq0WagbuHZDZhdIJvyQ8UncVWKtFKRIaLNzJZubSwttmV7kcBJOES2kGEPMZeY1U2sMXGtlvQrRMkjEm0yZaPe2OKbPwN0BUeQ/o9GKyfMANwQ6SAbS5ZVw/GTPftQXmIp17qiabnynYGo7P2TUP8TaDo9tPL88v3r+gfUV77d2xs1NzJPVlMLhNoQVjK1Us+hWJb4+SRWR2JYXJ4zQds8eI71+V2wPHA16Vb4Ql3SnEsKAe87iuIzfCW0duRQp38CQ4M82wu+H/i52vFNjM9seYEhjlumqIyh6Uq3Ghc7IspEKydLn5ZJTq4sZ0H1U2SrwQoLnD5xMNtCFTTVPfMiOGBRNzPo6incrvK2J8YdOgy1ynKUlPHj9e8LW7E+kzznh9Phvu1jUabs6WBvJnpAK6YDtVD5vO/NjjGvxHXKRRq1uxb3mCoaKTlhIvI9iMa4SwKHzgvAB9y0jYsZor+kgMN7byqIZ/q6FgKkI4on7AKmV2Fs+SkMPYgYcdPsK9pcgIakUM7vM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(2616005)(5660300002)(7416002)(66446008)(36756003)(66476007)(64756008)(6916009)(6506007)(8936002)(66946007)(2906002)(4326008)(186003)(6512007)(54906003)(6486002)(478600001)(38100700002)(8676002)(316002)(71200400001)(66556008)(86362001)(76116006)(83380400001)(33656002)(53546011)(122000001)(91956017)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?amJHaEpMaU12elpUZEZ2WVZ1TlFVTXBuMmtJd293SVhSbXhwVmp6NjRCaDRY?=
 =?utf-8?B?Wmc4azBmZmUrNktUWUVONEtRWGQrMmY2aEN0Y0JidUluYTNRL2RrcGFheXdx?=
 =?utf-8?B?Lzl6L05RUEd6ZEtuZStLcnVDV0s4TzVFSmFiMXdCZWlYVThBU0ZGVS9VaG5k?=
 =?utf-8?B?N0l5NHZKcC9oamI4QXhiSkpETmhrMHVSTXV3TXFWR3hVV3NEdXVqM0R6b1NC?=
 =?utf-8?B?RHRQOU9xSU5hTUlFQmZzN3EyNXorbjBrRThXRzI0cm5hTHZiTER4cDFZM3lj?=
 =?utf-8?B?TUlUZ083bHBidGlCTDNqY0hxOEN1dVJqV3VmNnpkWkpzVW1TaHl4MkpmNDF0?=
 =?utf-8?B?bnlwSFFMdFkwRnEwK2NLYm9SSEQ0cG54Tkx4alVsZ21uRnBNcGlXQXFRcitx?=
 =?utf-8?B?KzdKeFFvUFgvdFUweDR6VmFtN0t0WlBiOXZDSWg0blJXems2YmJNY1hXT3kr?=
 =?utf-8?B?a0RiVUZZbm9rUzhXY0w0RXFNZW5nMFl2RzRBMXpLMkZpb3lmdWdOa2Z5L2Zr?=
 =?utf-8?B?L2crV1pubVgwaEdqNjhOa0dPTHJjbEpPSW1UNitBaFN1aDk5VDljUUdlRktH?=
 =?utf-8?B?a2gzZ0xkdEQvODNlVGhDaENXWFIvMStHMyt2MVZLUHJqT2krcjJ1Wmk3akJl?=
 =?utf-8?B?RW11TVJ6S1ZWK25WVEhjZURIQXRqaHpxNVNWTHZKNWJqSTQ2STByYUNRejA0?=
 =?utf-8?B?OEhQQlV3WjBLaW1iYjBMQTZzbVhSUUR5a1pwNDhodzJRc3hsa1NreDdqVHB6?=
 =?utf-8?B?MXZyc0dsbytyNzVNY3lqV01oVVdSRGtlRDVySTBvN2Q2WWVrTjV5QXVvOG1M?=
 =?utf-8?B?RjZjQU9lcCtjWnVWQVQrMlNtRlFwRmxIeHdNRFFRRUNsUXFLSlhsQTA3VWdJ?=
 =?utf-8?B?SUR1eGhtdmduZTVpYXRzM0FRL1RmcDY3U2ZFZElqY1E2RUhSTThCNGpUV0Zq?=
 =?utf-8?B?Wk9iVUFmU1d5cHM0TStWQjMyc2E1bVh4aGhzbDh2STFHMzJRZDFqSlZIWkZ5?=
 =?utf-8?B?VlRLd3dKdFBvTitGaDJwK2hoRTg2TWpEek1sTGRidGVHZ2tvNmtuM0huRWhE?=
 =?utf-8?B?TUJ5RVVjYWNSTmswa2FGa25ma0EvU3F0L2ovR1FoZWVoVDUzQVFjK2hITGd1?=
 =?utf-8?B?RzJUUXIzV2JlZ3VwMGthUWxKQUs3Q3Zabm0rMkp2TFJoUSs5VmlNYU5lYmV1?=
 =?utf-8?B?WjRtcFBaWUtYTlhyc3pkODFNUGEvMmRtWjB6c1ZUM0I3QUdjU1laZTVUMDdL?=
 =?utf-8?B?clFpM0pPMUw1RFZrRnVpY21FTVdhVjZQQlVydDZEelhzZEIwUWM2di9OMGVC?=
 =?utf-8?B?eEIrRXI1YzJCbFYxeFhqS2t0WGVuZ3RjRG5weUhicnpwdVVURnl5MUtLVXRy?=
 =?utf-8?B?UEJUQWJNcHlxUU9Lc1QxaldtWUl1T0crWEcvdWdKT2FFYmg0WVpaRHZKc0Ru?=
 =?utf-8?B?RHZlY09vYTNwcDVjclRwYmZSUzZhZEprVitJanJFK0ttZkxvTzA1TG8vUjM3?=
 =?utf-8?B?aFM3b3F3VkpuVzBlTndhSUY0ODFQaUU4WVF0bEpKeWwzQU9ia3VNV094cFNj?=
 =?utf-8?B?NkZwWk8yMEoxWGtlM2gzYkNraDhscTYzVWVoVkxMUUdlN2NMS2d0akFaVTJW?=
 =?utf-8?B?aGlTSHM5OStySmRMTXg0UW40RUo0M2Z3QlBaL0xiM0lyWWpUYmNkTHhveTEw?=
 =?utf-8?B?VmJYL05pVDRvbTNOZkN5Q20ra1lPVC9yR0FUQy96OXEwZ01xaTNlYlBBZ2dm?=
 =?utf-8?B?alBJaGtvcnBqM2VMN1QzWE1RQm5uWm04UHVkTnFGOXlpUVo4REJ6L2xLaTFz?=
 =?utf-8?Q?ZIt0wvHhp+K0Aed4v+kebg17N40Go0Cgkdrl0=3D?=
Content-ID: <0B567403BD9C884B85A8BB0AA73E545D@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e46543-e723-4904-3208-08d909d5c06c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2021 23:39:50.9036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RAaia5ZECzP7u55Z9gr57YSQlstwVRKwoz1pW1YlN+F7/RcvKAxPVW7iuaXvRdUw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2951
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: 6uei0bPCrByOYyFPbVmUJWz6Uw72cyqo
X-Proofpoint-GUID: 6uei0bPCrByOYyFPbVmUJWz6Uw72cyqo
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-27_13:2021-04-27,
 2021-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104270161
X-FB-Internal: deliver
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fb.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.145.42 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lbXlu-001cxH-86
Subject: Re: [f2fs-dev] [GIT PULL][PATCH v10 0/4] Update to zstd-1.4.10
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
Cc: "squashfs-devel@lists.sourceforge.net"
 <squashfs-devel@lists.sourceforge.net>, Eric
 Biggers <ebiggers@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Christoph Hellwig <hch@infradead.org>, Nick Terrell <nickrterrell@gmail.com>,
 Yann Collet <cyan@fb.com>, David Sterba <dsterba@suse.cz>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Felix Handte <felixh@fb.com>, Oleksandr
 Natalenko <oleksandr@natalenko.name>, Kernel Team <Kernel-team@fb.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Niket Agarwal <niketa@fb.com>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>,
 Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gT24gQXByIDI3LCAyMDIxLCBhdCAzOjA5IFBNLCBSYW5keSBEdW5sYXAgPHJkdW5sYXBA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiA0LzI2LzIxIDQ6NDYgUE0sIE5pY2sgVGVy
cmVsbCB3cm90ZToNCj4+IEZyb206IE5pY2sgVGVycmVsbCA8dGVycmVsbG5AZmIuY29tPg0KPj4g
DQo+PiBQbGVhc2UgcHVsbCBmcm9tDQo+PiANCj4+ICBnaXRAZ2l0aHViLmNvbTp0ZXJyZWxsbi9s
aW51eC5naXQgdGFncy92MTAtenN0ZC0xLjQuMTANCj4+IA0KPj4gdG8gZ2V0IHRoZXNlIGNoYW5n
ZXMuIEFsdGVybmF0aXZlbHkgdGhlIHBhdGNoc2V0IGlzIGluY2x1ZGVkLg0KPj4gDQo+PiBUaGlz
IHBhdGNoc2V0IGxpc3RzIG1lIGFzIHRoZSBtYWludGFpbmVyIGZvciB6c3RkIGFuZCB1cGdyYWRl
cyB0aGUgenN0ZCBsaWJyYXJ5DQo+PiB0byB0aGUgbGF0ZXN0IHVwc3RyZWFtIHJlbGVhc2UuIFRo
ZSBjdXJyZW50IHpzdGQgdmVyc2lvbiBpbiB0aGUga2VybmVsIGlzIGENCj4+IG1vZGlmaWVkIHZl
cnNpb24gb2YgdXBzdHJlYW0genN0ZC0xLjMuMS4gQXQgdGhlIHRpbWUgaXQgd2FzIGludGVncmF0
ZWQsIHpzdGQNCj4+IHdhc24ndCByZWFkeSB0byBiZSB1c2VkIGluIHRoZSBrZXJuZWwgYXMtaXMu
IEJ1dCwgaXQgaXMgbm93IHBvc3NpYmxlIHRvIHVzZQ0KPj4gdXBzdHJlYW0genN0ZCBkaXJlY3Rs
eSBpbiB0aGUga2VybmVsLg0KPiANCj4gSGkgTmljaywNCj4gDQo+IFNldmVyYWwgb2YgdGhlIHNv
dXJjZSAoLmMsIC5oKSBmaWxlcyB1c2UgY29tbWVudHMgYmxvY2tzIHRoYXQNCj4gYmVnaW4gd2l0
aCAiLyoqIiwgd2hpY2ggbWVhbnMgInRoaXMgaXMgdGhlIGJlZ2lubmluZyBvZiBhIGtlcm5lbC1k
b2MNCj4gY29tbWVudCIgd2hlbiBpbiB0aGUga2VybmVsIHNvdXJjZSB0cmVlLiBIb3dldmVyLCB0
aGV5IGFyZSBub3QgaW4NCj4ga2VybmVsLWRvYyBmb3JtYXQuDQo+IA0KPiBEdXJpbmcgdGhlIGF1
dG9tYXRpYyBnZW5lcmF0aW9uIGZyb20gdXBzdHJlYW0genN0ZCwgcGxlYXNlIGZpbmQgYSB3YXkN
Cj4gdG8gY2hhbmdlIC8qKiB0byAvKi4NCj4gDQo+IFRoaXMgZG9lcyBuZWVkIHRvIHNsb3cgZG93
biB0aGUgYWNjZXB0YW5jZSBvZiB0aGlzIHBhdGNoIHNlcmllcyBJTU8uDQoNClN1cmUsIEkgY2Fu
IGRvIHRoYXQgZWFzaWx5IGVub3VnaC4gVGhlIHB1YmxpYyBoZWFkZXIgYGluY2x1ZGUvbGludXgv
enN0ZC5oYA0KYWxyZWFkeSBkb2VzIGhhdmUgY29ycmVjdCBrZXJuZWwtZG9jIGNvbW1lbnRzLiBJ
dCBpcyBqdXN0IHRoZSBub24tcHVibGljIGZpbGVzDQp0aGF0IGRvbuKAmXQgZm9sbG93IHRoZSBr
ZXJuZWwtZG9jIHN0eWxlLCBzaW5jZSB6c3RkIGhhcyBpdHMgb3duIGRvY3VtZW50YXRpb24NCmZv
cm1hdCB3aGljaCBpcyBzaW1pbGFyIHRvIGRveHlnZW4gc3R5bGUuDQoNCkJlc3QsDQpOaWNrDQoN
Cj4gdGhhbmtzLg0KPiAtLSANCj4gflJhbmR5DQo+IA0KDQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
