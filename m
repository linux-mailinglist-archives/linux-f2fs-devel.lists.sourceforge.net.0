Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2082CCEE2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 07:00:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hqo+fTiSripXLhQXxr6xMtxnFgTgp74eGYBnAb0kLwo=; b=ViKMbEdcDEL/soFCex2DvZ5tZ
	9HI5GCPHxtA/zefODmUVkCw94+G/IPFCOWgG9+uBmkoVjwT4zRjj/Wb/wo4mD2haCsIqmG4hxH5VS
	EmGgIr2q8yXmog/tU1Y07/i7bU7+XlSJFUDIHWXclHokbd4mVRzTa6acB6Y5mPYJQ35I4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkhfR-0001ZJ-Qf; Thu, 03 Dec 2020 06:00:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=9606de115a=terrelln@fb.com>)
 id 1kkhf8-0001XI-PT; Thu, 03 Dec 2020 06:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=91kTPk4xnVT69hGUmkU0LWOdMYK8IdkaoVCVPgi19Wg=; b=dEHB0vx+ieN0qbFb8HljA/N+DB
 6cBT67QiTFR2nqBJ3lj/Cb+YIevmswwdwe1C7ETsIGBGru8XweMP80ORuNR+MNqaDVOScimJN1Qsh
 9C913eVnhKfcXZZkMotSu2RlJpjmk5ObP+MahsltagSqqlz7OlAj+SyGyZwU7zSMqWH4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=91kTPk4xnVT69hGUmkU0LWOdMYK8IdkaoVCVPgi19Wg=; b=VFhyRlRKn6H33NSg9wjWCEgzi3
 l0bR7PsQGqQKbzKRqYpLme6ta3cSvO4OOOuc/IH0Dr0PbTp9CD3fhQyMA/93/6g6D4Wdd8y+QMgkd
 9C0N/JBkiR2uy6TCTkR8wvMt9RjF181YvzSYURjwR0JkmAtVUbGyPFThs0x3IhqO1iRg=;
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]
 helo=mx0a-00082601.pphosted.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkhez-00HAM4-W5; Thu, 03 Dec 2020 06:00:18 +0000
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 0B35xntp003858;
 Wed, 2 Dec 2020 21:59:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=91kTPk4xnVT69hGUmkU0LWOdMYK8IdkaoVCVPgi19Wg=;
 b=fjdVOPjw2tNw0pde1UfuRaa6eB5PxJS6e3+lh+l2+YCAN5ToZVHqfkRRKefP+oIIQubB
 HMIZgE3oHb8ColVGippcKh/3mHXdhcZrU9NhB5H/Xo7EfJrx6m0vM8VPLJ3a4G353S4z
 ztkq7qHyQaSxAgCRctDRRXSzzZaLXPVVMvE= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net with ESMTP id 355pr6wm85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 02 Dec 2020 21:59:49 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 2 Dec 2020 21:59:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwtkuiJNT73jftYMeM4jJJA6Z4gbUeMF99QqE9FEbJHquczXZSTV50oXgddaNOrfCrpf8Rsyz0/4jnNDKuoA8uoo9RIGnnBidNHcD2Ly9QvNjM510G20gVOzamXvsjstrGxWEN6Re/36A4imQPQJPQvKOxprD0U9kogDDGWZTkvjU0+TRokHMLYtOGxA5IfDtU3PJ/HF8yq+h3U6s6zniXLvlDPp18IV9z3pIX4G/isKqu78oV3lOV8nAgj0Lf2FZ1mpHhXEj5WxJyZx+CSgLh3/aZArZDF9EOAf1cxJf1BwFKidBuMEZKuI9UzuRCLcvNaxoRI8crScUq+xLDDrMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91kTPk4xnVT69hGUmkU0LWOdMYK8IdkaoVCVPgi19Wg=;
 b=gusQ+tsy5WBtGagzghvwGXZApHksON4BvCsPLWADa71KmBMBwXepK5BbBIC+ysbbv2j5ERRva+hZrsL0pxoUAOnQ8XKwbMsxvtWbODs2YUuJdqULk+yxHwpXgzkFtC5yBQEvu/NOHuFRdhzN+HDc+FGA9WtmrcVr4uIS7FVWKGg5shYee6qnM4jGlmWXRIuil0xXejsj1DMZ7znVzCqRenmXkEJLehp86PLYvzTJpLILooRqXd0vIeLf583l5M710xNCXu5+PJ4I3JXLCnZu5ugjcaXtiFEi84LLB0tNlQE5sSQgnjCX2zILX67Edw7DyWdD7gWHgrRZ1c1ukYfevA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91kTPk4xnVT69hGUmkU0LWOdMYK8IdkaoVCVPgi19Wg=;
 b=gJc4pbwggrMh1IEOHjSnbqwoqczkDVVGAKuF6VE3kvHo00Qo1z+QwBItC4dsHN1g8LRyOKly0yIiBZNoj4cJq+2EBO6PENLIzX56QyNbz4S/lt2zTDCBn1IVRjPkbobLVn0159NBUt/PNW+uYTigEC3NGpVEtb1AXtvexjPtVMc=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Thu, 3 Dec
 2020 05:59:13 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::17e:aa61:eb50:290c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::17e:aa61:eb50:290c%7]) with mapi id 15.20.3611.025; Thu, 3 Dec 2020
 05:59:13 +0000
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Thread-Topic: [PATCH v6 1/3] lib: zstd: Add kernel-specific API
Thread-Index: AQHWyOnYHjSKEx1KvUy8OD/sVz0sN6nkkesAgAAHQICAABnUgIAADIgAgAAR84CAAA+KAA==
Date: Thu, 3 Dec 2020 05:59:13 +0000
Message-ID: <D38321D3-A30B-4150-A72F-AA9FABE0E7D9@fb.com>
References: <20201202203242.1187898-1-nickrterrell@gmail.com>
 <20201202203242.1187898-2-nickrterrell@gmail.com>
 <20201203011606.GA20621@qmqm.qmqm.pl>
 <297D9C8B-5F4D-4E3B-A5FD-DA292D8BA12A@fb.com>
 <20201203031429.GA13095@qmqm.qmqm.pl>
 <85E09AFA-F1ED-41CB-B712-7FA75374478F@fb.com>
 <20201203050335.GA1532@qmqm.qmqm.pl>
In-Reply-To: <20201203050335.GA1532@qmqm.qmqm.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rere.qmqm.pl; dkim=none (message not signed)
 header.d=none;rere.qmqm.pl; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:6cce]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09b45bc7-bd0b-46da-ea56-08d897508fa0
x-ms-traffictypediagnostic: BYAPR15MB2374:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB237485029CEBC576771501C4ABF20@BYAPR15MB2374.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HKttt174ITp0qBJEZAlcTZMgNVTVxNXGxmjnrneTl0iHt9XK2KFMEpv2mEXsGIPJoqMc7KA/JQ4xd3wjoM/u+uMTdNplMGf0g2OoeHY39mn++vDU8SIMPWM2swDpONJkeXc6bu0P1DkONQ3LxpwbJaO1BaWWFP4kfiuZNasxbFQdlHzTB5itA3klIlyQO73dhK/OjPLbr477g5xKvIcU9n+kopa8PePyg5M2lmJwuSTe0ce38MqfN+pmttbAl2WYeAxhNFQllT6k/lU7nEJOd6UTm1E5y7u4+fmvIk5CcbSbMDv5wnwtH10vXoGxIARo93col+LGLHgHyjwt6WsazakzNfmtM6Aea8PjK6qwJ5GhScH5Eir5+GSDsqIpIaAg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(39860400002)(376002)(366004)(346002)(66476007)(36756003)(4326008)(66556008)(478600001)(186003)(64756008)(66446008)(91956017)(76116006)(6486002)(33656002)(5660300002)(6916009)(86362001)(8936002)(71200400001)(83380400001)(2906002)(2616005)(66946007)(6512007)(8676002)(316002)(7416002)(54906003)(53546011)(66574015)(6506007)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?akt0dEdxNWh2dFpRTEhlTmxtLzQ1akVFKzRLYzV3Vi9hNE5pUmdGU1JSYU1O?=
 =?utf-8?B?aWRLeUdVeEVER2NLc2xkei9SUGF0ZUUrSUY1MlNVWGhIdWxvKzFIaEZnYjFn?=
 =?utf-8?B?SGUrM0JIY21yTUFmU0I1U0orZWZlTm1aQTJIOHJGeThpcmVTcXFDa0xnMUJV?=
 =?utf-8?B?SjEyZmFKd0ZaNFcxbmI4ZFJDYzRsekZLdDVYYURWNE1oc2NWaFUwaEhvd1hN?=
 =?utf-8?B?OEJZdjlXSmpxWjdkQVVHbmdibEJhb2JadzBwVXY1L2xsbG1DcXlydVFpTXR2?=
 =?utf-8?B?VzUweVlwM0pqT1JyQTJoL2FmcXBkOWlnN0tKMlR5QTdmVStUMlFzYUpqRlhW?=
 =?utf-8?B?ejJHakZpYjBYcEZwS0xrUjhRVXA5Nzdia0dOQzBacEtxcThwR2tPSG5xaEU2?=
 =?utf-8?B?SGppSTZmUU5sUnczQTltRC9iQndkMlFuVHRjTzhpSGNyM1A2d2R6UG1xK0hh?=
 =?utf-8?B?VjJIRnBPYllqYUU2R0JHbGdCWithNzJFSmdHdTF4c1JGQUJtSk9vaVdGeWdS?=
 =?utf-8?B?M0pHM2JMTHdzREd0WXlHZlB1VXFHaTY4dXpyQUN3cDBDTVNZRjN3M1ZhL0hv?=
 =?utf-8?B?OFBDalVqSURlY0VpT3FiZ0RSR2ZXQThCSHFNdFZTLzdqSVk0UUhqMkVQem12?=
 =?utf-8?B?bkdYVzNRNVNxcGVVbHFSKzRCbzFvUFYyOCtrSnhGbUtDOEgwUzdxR09SSHRt?=
 =?utf-8?B?QTIxSHEydk9SOTd1YXRXYy9XcUhBOTU0bGVKbW5GNDRVSUZXNk5MTlBlbzZm?=
 =?utf-8?B?TEVMQjVsaUNiVkZSTkdIYURoVHZLaHRFNW1tRVY2NUVPNFRTUzdlSDBMakUy?=
 =?utf-8?B?K0IyaXIvdmxvRFFTRXBEZ2VtRDJGalEyTmlCcVVjMERiZ0ZsYktPVmlqZzNq?=
 =?utf-8?B?Z3krdVFSMTF3U1U3ZEdYWFgvNkYrT1IvZVQ1L2pMSmNZdGZmM1VZSWFQdUt2?=
 =?utf-8?B?YVFtQmlSMmEzUk9NTTI3THhmU2w5dnNZUTlXcXJvL0hlYWZwZ1V6bThtNlJN?=
 =?utf-8?B?NGZQMzBpeHZEZ3l6eUpiSEQzRnZURkRteE1VRmR1ZjBOaitLbWJjSFV3cW1Z?=
 =?utf-8?B?MUhEQ0p2VXVmV0dQUTJuMzNqck5CbWVFMDhaWWhYa0lYczFSbnpXTzhqTWhJ?=
 =?utf-8?B?NENkTEZWUWxEK1NEU0Nud0V4Uldpc2tja2hSTE1LZlZwY1FOTnYxYjBaQVZB?=
 =?utf-8?B?MzZaTXg2Ny84RCt2N25TUkt5QXFTZ2ZibWpRcTd5NjJzaDNCQ2J6V04ydk41?=
 =?utf-8?B?b1B5Wmd3ZStFMHZQeUlZd05TdlRzTURuMlROVFcwczRFQlVhY2JJaWRrcjgv?=
 =?utf-8?B?UklHdUpFZ1h6TWQ2QUFwZllueEM1V1VzMXRERkhONFFhWGlhc0hLTGhmeDhD?=
 =?utf-8?Q?rxp+qJANtTZ7VwAL2Wjocy4X8PRafKK0=3D?=
Content-ID: <9BD1396B25F5734F912D13CEE0767E1B@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b45bc7-bd0b-46da-ea56-08d897508fa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 05:59:13.3711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uun9Ks4TZR9KESyrBF52uLiTGWphYlTh3ykYnUTpqjpEB3Ouysaxj+OwumSyqZV+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2374
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_01:2020-11-30,
 2020-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030038
X-FB-Internal: deliver
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.153.30 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kkhez-00HAM4-W5
Subject: Re: [f2fs-dev] [PATCH v6 1/3] lib: zstd: Add kernel-specific API
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
 <squashfs-devel@lists.sourceforge.net>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Christoph Hellwig <hch@infradead.org>, Nick Terrell <nickrterrell@gmail.com>,
 Yann Collet <cyan@fb.com>, LKML <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 Btrfs BTRFS <linux-btrfs@vger.kernel.org>, Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gT24gRGVjIDIsIDIwMjAsIGF0IDk6MDMgUE0sIE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJx
LWxpbnV4QHJlcmUucW1xbS5wbD4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIERlYyAwMywgMjAyMCBh
dCAwMzo1OToyMUFNICswMDAwLCBOaWNrIFRlcnJlbGwgd3JvdGU6DQo+PiBPbiBEZWMgMiwgMjAy
MCwgYXQgNzoxNCBQTSwgTWljaGHFgiBNaXJvc8WCYXcgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBs
PiB3cm90ZToNCj4+PiBPbiBUaHUsIERlYyAwMywgMjAyMCBhdCAwMTo0MjowM0FNICswMDAwLCBO
aWNrIFRlcnJlbGwgd3JvdGU6DQo+Pj4+IE9uIERlYyAyLCAyMDIwLCBhdCA1OjE2IFBNLCBNaWNo
YcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEByZXJlLnFtcW0ucGw+IHdyb3RlOg0KPj4+Pj4gT24g
V2VkLCBEZWMgMDIsIDIwMjAgYXQgMTI6MzI6NDBQTSAtMDgwMCwgTmljayBUZXJyZWxsIHdyb3Rl
Og0KPj4+Pj4+IEZyb206IE5pY2sgVGVycmVsbCA8dGVycmVsbG5AZmIuY29tPg0KPj4+Pj4+IA0K
Pj4+Pj4+IFRoaXMgcGF0Y2g6DQo+Pj4+Pj4gLSBNb3ZlcyBgaW5jbHVkZS9saW51eC96c3RkLmhg
IC0+IGBsaWIvenN0ZC96c3RkLmhgDQo+Pj4+Pj4gLSBBZGRzIGEgbmV3IEFQSSBpbiBgaW5jbHVk
ZS9saW51eC96c3RkLmhgIHRoYXQgaXMgZnVuY3Rpb25hbGx5DQo+Pj4+Pj4gZXF1aXZhbGVudCB0
byB0aGUgaW4tdXNlIHN1YnNldCBvZiB0aGUgY3VycmVudCBBUEkuIEZ1bmN0aW9ucyBhcmUNCj4+
Pj4+PiByZW5hbWVkIHRvIGF2b2lkIHN5bWJvbCBjb2xsaXNpb25zIHdpdGggenN0ZCwgdG8gbWFr
ZSBpdCBjbGVhciBpdCBpcw0KPj4+Pj4+IG5vdCB0aGUgdXBzdHJlYW0genN0ZCBBUEksIGFuZCB0
byBmb2xsb3cgdGhlIGtlcm5lbCBzdHlsZSBndWlkZS4NCj4+Pj4+PiAtIFVwZGF0ZXMgYWxsIGNh
bGxlcnMgdG8gdXNlIHRoZSBuZXcgQVBJLg0KPj4+Pj4+IA0KPj4+Pj4+IFRoZXJlIGFyZSBubyBm
dW5jdGlvbmFsIGNoYW5nZXMgaW4gdGhpcyBwYXRjaC4gU2luY2UgdGhlcmUgYXJlIG5vDQo+Pj4+
Pj4gZnVuY3Rpb25hbCBjaGFuZ2UsIEkgZmVsdCBpdCB3YXMgb2theSB0byB1cGRhdGUgYWxsIHRo
ZSBjYWxsZXJzIGluIGENCj4+Pj4+PiBzaW5nbGUgcGF0Y2gsIHNpbmNlIG9uY2UgdGhlIEFQSSBp
cyBhcHByb3ZlZCwgdGhlIGNhbGxlcnMgYXJlDQo+Pj4+Pj4gbWVjaGFuaWNhbGx5IGNoYW5nZWQu
DQo+Pj4+PiBbLi4uXQ0KPj4+Pj4+IC0tLSBhL2xpYi9kZWNvbXByZXNzX3VuenN0ZC5jDQo+Pj4+
Pj4gKysrIGIvbGliL2RlY29tcHJlc3NfdW56c3RkLmMNCj4+Pj4+IFsuLi5dDQo+Pj4+Pj4gc3Rh
dGljIGludCBJTklUIGhhbmRsZV96c3RkX2Vycm9yKHNpemVfdCByZXQsIHZvaWQgKCplcnJvciko
Y2hhciAqeCkpDQo+Pj4+Pj4gew0KPj4+Pj4+IC0JY29uc3QgaW50IGVyciA9IFpTVERfZ2V0RXJy
b3JDb2RlKHJldCk7DQo+Pj4+Pj4gLQ0KPj4+Pj4+IC0JaWYgKCFaU1REX2lzRXJyb3IocmV0KSkN
Cj4+Pj4+PiArCWlmICghenN0ZF9pc19lcnJvcihyZXQpKQ0KPj4+Pj4+IAkJcmV0dXJuIDA7DQo+
Pj4+Pj4gDQo+Pj4+Pj4gLQlzd2l0Y2ggKGVycikgew0KPj4+Pj4+IC0JY2FzZSBaU1REX2Vycm9y
X21lbW9yeV9hbGxvY2F0aW9uOg0KPj4+Pj4+IC0JCWVycm9yKCJaU1REIGRlY29tcHJlc3NvciBy
YW4gb3V0IG9mIG1lbW9yeSIpOw0KPj4+Pj4+IC0JCWJyZWFrOw0KPj4+Pj4+IC0JY2FzZSBaU1RE
X2Vycm9yX3ByZWZpeF91bmtub3duOg0KPj4+Pj4+IC0JCWVycm9yKCJJbnB1dCBpcyBub3QgaW4g
dGhlIFpTVEQgZm9ybWF0ICh3cm9uZyBtYWdpYyBieXRlcykiKTsNCj4+Pj4+PiAtCQlicmVhazsN
Cj4+Pj4+PiAtCWNhc2UgWlNURF9lcnJvcl9kc3RTaXplX3Rvb1NtYWxsOg0KPj4+Pj4+IC0JY2Fz
ZSBaU1REX2Vycm9yX2NvcnJ1cHRpb25fZGV0ZWN0ZWQ6DQo+Pj4+Pj4gLQljYXNlIFpTVERfZXJy
b3JfY2hlY2tzdW1fd3Jvbmc6DQo+Pj4+Pj4gLQkJZXJyb3IoIlpTVEQtY29tcHJlc3NlZCBkYXRh
IGlzIGNvcnJ1cHQiKTsNCj4+Pj4+PiAtCQlicmVhazsNCj4+Pj4+PiAtCWRlZmF1bHQ6DQo+Pj4+
Pj4gLQkJZXJyb3IoIlpTVEQtY29tcHJlc3NlZCBkYXRhIGlzIHByb2JhYmx5IGNvcnJ1cHQiKTsN
Cj4+Pj4+PiAtCQlicmVhazsNCj4+Pj4+PiAtCX0NCj4+Pj4+PiArCWVycm9yKCJaU1REIGRlY29t
cHJlc3Npb24gZmFpbGVkIik7DQo+Pj4+Pj4gCXJldHVybiAtMTsNCj4+Pj4+PiB9DQo+Pj4+PiAN
Cj4+Pj4+IFRoaXMgbG9vc2VzIGRpYWdub3N0aWNzIHNwZWNpZmljaXR5IC0gaXMgdGhpcyBpbnRl
bmRlZD8gQXQgbGVhc3QgdGhlDQo+Pj4+PiBvdXQtb2YtbWVtb3J5IGNvbmRpdGlvbiBzZWVtcyB1
c2VmdWwgdG8gZGlzdGluZ3Vpc2guDQo+Pj4+IA0KPj4+PiBHb29kIHBvaW50LiBUaGUgenN0ZCBB
UEkgbm8gbG9uZ2VyIGV4cG9zZXMgdGhlIGVycm9yIGNvZGUgZW51bSwNCj4+Pj4gYnV0IGl0IGRv
ZXMgZXhwb3NlIHpzdGRfZ2V0X2Vycm9yX25hbWUoKSB3aGljaCBjYW4gYmUgdXNlZCBoZXJlLg0K
Pj4+PiBJIHdhcyB0aGlua2luZyB0aGF0IHRoZSBzdHJpbmcgbmVlZGVkIHRvIGJlIHN0YXRpYyBm
b3Igc29tZSByZWFzb24sIGJ1dA0KPj4+PiB0aGF0IGlzIG5vdCB0aGUgY2FzZS4gSSB3aWxsIG1h
a2UgdGhhdCBjaGFuZ2UuDQo+Pj4+IA0KPj4+Pj4+ICtzaXplX3QgenN0ZF9jb21wcmVzc19zdHJl
YW0oenN0ZF9jc3RyZWFtICpjc3RyZWFtLA0KPj4+Pj4+ICsJc3RydWN0IHpzdGRfb3V0X2J1ZmZl
ciAqb3V0cHV0LCBzdHJ1Y3QgenN0ZF9pbl9idWZmZXIgKmlucHV0KQ0KPj4+Pj4+ICt7DQo+Pj4+
Pj4gKwlaU1REX291dEJ1ZmZlciBvOw0KPj4+Pj4+ICsJWlNURF9pbkJ1ZmZlciBpOw0KPj4+Pj4+
ICsJc2l6ZV90IHJldDsNCj4+Pj4+PiArDQo+Pj4+Pj4gKwltZW1jcHkoJm8sIG91dHB1dCwgc2l6
ZW9mKG8pKTsNCj4+Pj4+PiArCW1lbWNweSgmaSwgaW5wdXQsIHNpemVvZihpKSk7DQo+Pj4+Pj4g
KwlyZXQgPSBaU1REX2NvbXByZXNzU3RyZWFtKGNzdHJlYW0sICZvLCAmaSk7DQo+Pj4+Pj4gKwlt
ZW1jcHkob3V0cHV0LCAmbywgc2l6ZW9mKG8pKTsNCj4+Pj4+PiArCW1lbWNweShpbnB1dCwgJmks
IHNpemVvZihpKSk7DQo+Pj4+Pj4gKwlyZXR1cm4gcmV0Ow0KPj4+Pj4+ICt9DQo+Pj4+PiANCj4+
Pj4+IElzIGFsbCB0aGlzIGNvcHlpbmcgbmVjZXNzYXJ5PyBIb3cgaXMgaXQgZGlmZmVyZW50IGZy
b20gdHlwZS1wdW5uaW5nIGJ5DQo+Pj4+PiBkaXJlY3QgcG9pbnRlciBjYXN0Pw0KPj4+PiANCj4+
Pj4gSWYgYnJlYWtpbmcgc3RyaWN0IGFsaWFzaW5nIGFuZCB0eXBlLXB1bm5pbmcgYnkgcG9pbnRl
ciBjYXNpbmcgaXMgb2theSwgdGhlbg0KPj4+PiB3ZSBjYW4gZG8gdGhhdCBoZXJlLiBUaGVzZSBt
ZW1jcHlzIHdpbGwgYmUgbmVnbGlnaWJsZSBmb3IgcGVyZm9ybWFuY2UsIGJ1dA0KPj4+PiB0eXBl
LXB1bm5pbmcgd291bGQgYmUgbW9yZSBzdWNjaW5jdCBpZiBhbGxvd2VkLg0KPj4+IA0KPj4+IEFo
LCB0aGlzIG1pZ2h0IGJyZWFrIExUTyBidWlsZHMgZHVlIHRvIHN0cmljdCBhbGlhc2luZyB2aW9s
YXRpb24uDQo+Pj4gU28gSSB3b3VsZCBzdWdnZXN0IHRvIGp1c3QgI2RlZmluZSB0aGUgWlNURCBu
YW1lcyB0byBrZXJuZWwgb25lcw0KPj4+IGZvciB0aGUgbGlicmFyeSBjb2RlLiAgVW5sZXNzIHRo
ZXJlIGlzIGEgY2xlYW5lciBzb2x1dGlvbi4uLg0KPj4gDQo+PiBJIGRvbuKAmXQgd2FudCB0byBk
byB0aGF0IGJlY2F1c2UgSSB3YW50IGluIHRoZSAzcmQgc2VyaWVzIG9mIHRoZSBwYXRjaHNldCBJ
IHVwZGF0ZQ0KPj4gdG8genN0ZC0xLjQuNi4gQW5kIEnigJltIHVzaW5nIHpzdGQtMS40LjYgYXMt
aXMgaW4gdXBzdHJlYW0uIFRoaXMgYWxsb3dzIHVzIHRvIGtlZXANCj4+IHRoZSBrZXJuZWwgdmVy
c2lvbiB1cCB0byBkYXRlLCBzaW5jZSB0aGUgcGF0Y2ggdG8gdXBkYXRlIHRvIGEgbmV3IHZlcnNp
b24gY2FuIGJlDQo+PiBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSAoYW5kIG1hbnVhbGx5IHRlc3Rl
ZCksIHNvIGl0IGRvZXNu4oCZdCBmYWxsIHllYXJzIGJlaGluZA0KPj4gdXBzdHJlYW0gYWdhaW4u
DQo+PiANCj4+IFRoZSBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBtYWtlIHVwc3RyZWFtIHpzdGTi
gJlzIGhlYWRlciBwdWJsaWMgYW5kDQo+PiAjZGVmaW5lIHpzdGRfaW5fYnVmZmVyIFpTVERfaW5C
dWZmZXIuIEJ1dCB0aGF0IHdvdWxkIG1ha2UgenN0ZOKAmXMgaGVhZGVyDQo+PiBwdWJsaWMsIHdo
aWNoIHdvdWxkIHNvbWV3aGF0IGRlZmVhdCB0aGUgcHVycG9zZSBvZiBoYXZpbmcgYSBrZXJuZWwg
d3JhcHBlci4NCj4gDQo+IEkgdGhvdWdodCB0aGUgcHJvYmxlbSB3YXMgQVBJIHN0eWxlIHNwaWxs
LW92ZXIgZnJvbSB0aGUgbGlicmFyeSB0byBvdGhlciBwYXJ0cw0KPiBvZiB0aGUga2VybmVsLiAg
QSBoZWFkZXItb25seSB3cmFwcGVyIGNhbiBzdG9wIHRoaXMuICBJJ20gbm90IHN1cmUgc3ltYm9s
DQo+IHZpc2liaWxpdHkgKG5hbWVzcGFjZSBwb2xsdXRpb24pIHdhcyBhIGNvbmNlcm4uDQoNClRo
YXRzIHRydWUuIEl0IHNlZW1zIHNsaWdodGx5IHVuY2xlYW4sIGJ1dCBzbyBJcyBkdXBsaWNhdGlu
ZyB0aGVzZSBzdHJ1Y3RzIGFuZCBtZW1jcHlpbmcNCnRoZW0uIFNvIEnigJlsbCBnbyBhaGVhZCBh
bmQgZXhwb3NlIHRoZSB1cHN0cmVhbSB6c3Rk4oCZcyBoZWFkZXIgKOKAnGxpYi96c3RkL3pzdGQu
aOKAnSBoZXJlKS4NCknigJlsbCBqdXN0IG5lZWQgdG8gcGljayBhIG5hbWUgZm9yIHRoZSB1cHN0
cmVhbSDigJx6c3RkLmjigJ0gaGVhZGVyLg0KDQo+IEJlc3QgUmVnYXJkcw0KPiBNaWNoYcWCIE1p
cm9zxYJhdw0KDQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
