Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7682CE019
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 21:52:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bj6+inyJnwwC7kq0Wl6RHi/mE9knIoAOTxEAp8BMYns=; b=e5kZ9rXNdFkqZsa9P11hNbrfM
	OJ1JPmfZ01P31auXXobt60gEdXGKK4vgV76pZLRspIP0xgFp5gOqeOTc4Wp0yaAtBxiZOKET65vnV
	0Jsk4TeDl/A/pmOXX8foZLQyP+4So+FqsMZ30U+0sYcpqo+Flal35qPNejMshs4BDhXDs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkvad-0007ap-C5; Thu, 03 Dec 2020 20:52:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=9606de115a=terrelln@fb.com>)
 id 1kkvZl-0007UD-CE; Thu, 03 Dec 2020 20:51:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GDWoGAsDbuUwvyORb0ckkxOic+HsDq+6sUpYV2+k4rY=; b=PqrVfcE0I6IUEFrNU2QWnmMzOC
 fGZ96RLeSzVamxWjVyJKLZ/iZj5IS+023UMIqQVSKvApF0Que84jeJliobNWeqgcM3Xut7fssg7+O
 LJqvW2V73zBiEsimCOf6SK7w3Gj4l4bwSaxXePTGI5vB++fVd4pwvBjw/9pgtMxzXNwc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GDWoGAsDbuUwvyORb0ckkxOic+HsDq+6sUpYV2+k4rY=; b=Ki5o72oyce+L6PYFU8DAlVD3ow
 bBJcTkRxP67JXW8mmwaaE7f5DARzys8gd8+o+lRc6pukvz4qDdskD7zOXOdXVTzVeoUgODQgflyXs
 DbfST4ixpEMZC5xqGDsEm6ob2PsC+yvYZAwgv/IgFYISwPiiI5ehYkXNDOkqBgnG4RKE=;
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkvZc-000ihl-JG; Thu, 03 Dec 2020 20:51:41 +0000
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B3KmvPG031869; Thu, 3 Dec 2020 12:51:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=GDWoGAsDbuUwvyORb0ckkxOic+HsDq+6sUpYV2+k4rY=;
 b=qfHz4MvlHX8d2LyXSCUgB160DDblQ6MmTmCqzee1wCoN23fTF3hxNrv4PRWg4J2rRsgA
 pqhaby1NubZhE95yE1OO6yqPOCcn8aANjFXgfxd4SrGFIgwmsCZTGIjvcI6ixoUPX3W9
 d0p0q/5kNHh3O6HsTncxjQw4d2mnnnR/fCk= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 35615fpskb-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 03 Dec 2020 12:51:14 -0800
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 3 Dec 2020 12:51:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YO66lEG3UasDSjGMo7GP2+S1zMuxtG/xgRt2POI99NPbwsDP7ufMj5N0PXyNTLQVhN/+1BJJ9VinhdYMcFOnvX/KJat8ETwX6qTXEk4jOc09llmRCpQZfeAPfERiFkzlOsTsO2ZY9oYKgnsri6rvvOh3O3YWT86fmRq7w7GNHOl8cf9LeQbOMwn0cjDAJaatPRuckrIdgSl5/e9nDpN9hCfYVihGxVFvYyTyfbZrij8PFtzF4Y3vkAPGJzC01jdEqW0HmUmZ5pOzfB5urGb0nXXTyGNDg1udF7A2+30L46Nod8vm38ES5+iIoYZfUmr/Gw/uBJ0pdwODe3duOSnyaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDWoGAsDbuUwvyORb0ckkxOic+HsDq+6sUpYV2+k4rY=;
 b=l8uvJ8rWfo7eH5LpeQfwx6p6fBVidzk203oBOHmv8MAX1l4aMQuovO2gvoSlzTYXMosivnBWxtpcZpWDGOKEPuXFgLASZow2gnF2TjyiPGCzzrhJ+MxssJi/cwXeBrEwiR2e3t5sCOpjJRrBkZCeYX8xKUrfbJFoVCxhUEUiok3yzHEjAug1fbdv/U96553a1wKp/nNIG3u1MacS+WJ3pR6UQDKY9LLOTvAnBYPyBGXgvMwAzJCoFS4SC6Qy2P8NZsc05YtaE2Bx1mngNOPO/gTwkx4+54XpfzF6ttUHapNR8B5qpKxjyLPvCfwAFj2i2tfznNzdOWzAg6LvOO1PHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDWoGAsDbuUwvyORb0ckkxOic+HsDq+6sUpYV2+k4rY=;
 b=BI93XNc9J4KoZ2sLz56VVEi8lMf5UBv+PudjP6utiquqHNqB0DmYF81eDyHu/LzAXJgLd3m2L5EaxGqZ+vuMDtnncihr4JoyIL3Va0xe7VxxAHI6g7PmwrEEXGrGwuwlGe0FbzSxU8N96NEDSojnbeQJ9YTHzW2nCWnuzqUC4iM=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2567.namprd15.prod.outlook.com (2603:10b6:a03:151::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Thu, 3 Dec
 2020 20:51:04 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::17e:aa61:eb50:290c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::17e:aa61:eb50:290c%7]) with mapi id 15.20.3611.025; Thu, 3 Dec 2020
 20:50:58 +0000
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Thread-Topic: [PATCH v6 1/3] lib: zstd: Add kernel-specific API
Thread-Index: AQHWyOnYHjSKEx1KvUy8OD/sVz0sN6nkkesAgAAHQICAABnUgIAADIgAgAAR84CAAQixgA==
Date: Thu, 3 Dec 2020 20:50:58 +0000
Message-ID: <E1299B55-CEE5-4D16-BD01-BB1D082ADDFA@fb.com>
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
x-originating-ip: [98.33.101.203]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ecf0e969-3334-4e6f-8261-08d897cd230d
x-ms-traffictypediagnostic: BYAPR15MB2567:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB2567D30515CBF10B24424820ABF20@BYAPR15MB2567.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O4CALEw9/vB0PgyzrSWUKwUx9Vcp/BDS1b5AEg1naBrxVimgRglCda+TEuyqzZrwREmM+8pWoYolQWsWNCbIsjOK+DSgoeEVOZg4gdJv/icz0VF9rs9hGFBzBTf6h40TQNNTh88KjVPl2H/jOIS3GZ9OABj2eV2A2W2a4wdh7snaMw9p+b0i8jUBqximjAE/pWbqxt04q57wVaDNiKdT6EqN3T36rr8MNGcQAk/0j3iw4j9VUPyreTgUrZYQYx4myIWtHfgHzF0Hp0LEm99hpezP2xrxOE2SujiQ9jrqGA6/XbFKoq9t0h9umF34O86ksrKEB3eqEye70u/08BRywjmyEC+rueuRXCFo3n2lySd0Dbxn9TiNqAgMu0YQZarA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(136003)(346002)(376002)(396003)(2906002)(186003)(4326008)(6916009)(71200400001)(7416002)(316002)(6512007)(26005)(66574015)(8936002)(83380400001)(2616005)(36756003)(478600001)(53546011)(33656002)(8676002)(6506007)(64756008)(66556008)(66946007)(66476007)(54906003)(76116006)(66446008)(5660300002)(86362001)(6486002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Vk1mVzcxN1Q2SXRPOFFQZERaY3N6MlJQWFNOWnB2UzVieUZOUWJXMmxZQUdm?=
 =?utf-8?B?SUxlNzlZTVYzOWFBTUxwTkNzaVVLZFBaK1BpcTFoS05MWGI2R0VtWnFqWDhY?=
 =?utf-8?B?Y3psY0xCK3dwZENrNWhob0xWOU5TTzNYZlkwbHhQNFBkSU5LRm0vb2ExZURV?=
 =?utf-8?B?alYySlhaR1pubUFnVUZsZjhJZmtha0drVWFxZ2JMM1czUzNQd05iYm5xeXR6?=
 =?utf-8?B?QTlBdnVwVk54RkN6eUxzMHhBVDUrQjJtdHo0bmxlMU90QlEzMm5MWklaWjJD?=
 =?utf-8?B?VXJmNVlveXhYNjMrampYU21FcGpkYmdRWWd2VDN2MlBEakNxQjE3NG9PUkVr?=
 =?utf-8?B?QzdES0RYQkZGNE1uSk51RmovbDc1ZS9Xb0ZSdlI2QkpGM0pFMmRSaGNSQ2RK?=
 =?utf-8?B?QVR0bkJEN1o2UlVYRFN1RHJURXloRWhrK3VHaU4yWjliOHRFemZGZE9vakh5?=
 =?utf-8?B?T3Z2RlFxSDQ2RWN2YzN6QW44bzVMT3dLOXBidGhlTURTekFQdXkxbWlzUUdD?=
 =?utf-8?B?YmhPVWZKR1l0eEtiOHd1Yy9Sd0NMbjRmNzlxZTFaeGVpVnI2cDNvRjRPQU9P?=
 =?utf-8?B?bHo0TExKSmJISlBaM3BkSDludmJLYjRVemNaU05XTXhZRU1kOXpVWVpVRitJ?=
 =?utf-8?B?OWN4Ni9uOXBjMUJmcjN6bCtZTHZzTlVtV0RRR1dLcGNIN0RXb0N4WlcvMUxN?=
 =?utf-8?B?dFNiektoUkQwOFAybisxYVNEMU56NWhmdmdhTFc4OU9qY2Q5alhKQWJRUVhW?=
 =?utf-8?B?N2h0bjA4eFJ2TkVNR1dSdHdrRFhzbUFJNWcyeTFPQXJGT3NVSlVLVGZDZUpD?=
 =?utf-8?B?eVRTVWx4S2lBUUxIZ3BYbWFpQmZBM0pLbHRxQTNybHZXd1BQc3ptU0t4WWty?=
 =?utf-8?B?ZHZyQzZHeFY2V1liai9YZHNrbVg2NzltRGl1YXhvbEM5b09UVTFvR0Q2ZGJP?=
 =?utf-8?B?dVZmWm04RVNlQXAzcUQrUGZJYVlvTVpuaXZYdlBobGhmZ2FaMFI5VU9JaDJO?=
 =?utf-8?B?ZGx5N1FEMzhnWmdodkVFcHdPYkJScDJqVkZzaTZEUEJnaC9DdzQySGs5WldN?=
 =?utf-8?B?RHBWZHk5SjZtcFJheW52R1RXc24xdXVReUR5aDdOOG0zTU1pQ2ZhampiWVJo?=
 =?utf-8?B?YWpPZkxYZzR6UEZyYkpVcjYxTDZHSzZZeFAvMnVFWmdpM0N0dlV4Z3RIUThh?=
 =?utf-8?B?WkNSQXlxSUZIVXlIRnIwTUxCT0FCb0xGNGlwT1pCYXV1WXJta2N5RDJUNnZt?=
 =?utf-8?B?OUZxNDArVmNwVE56dnNoMEMxVVcvc0pwRnpuMmZJS09MTXdLWlVxd3Q4WVRV?=
 =?utf-8?Q?ISwLlHkiS+rP10W9lV2bT8Co8yT+v7kPqV?=
Content-ID: <64CC0E1EDE9EB0438DE4E4FC860FAD45@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf0e969-3334-4e6f-8261-08d897cd230d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 20:50:58.3383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MBVvKejOODaPJgnmZwZgmqgGcGJ+bFDWTvbwyuFMNM4PxooWjLUVSyZ6k0MddWJJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2567
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_12:2020-12-03,
 2020-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012030122
X-FB-Internal: deliver
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
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
X-Headers-End: 1kkvZc-000ihl-JG
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
YW5rcyBmb3IgdGhlIHJldmlldyBNaWNoYcWCISBJIGhhdmUganVzdCBzdWJtaXR0ZWQgYSBuZXcg
dmVyc2lvbiBvZiB0aGUgcGF0Y2hlcw0Kd2l0aCB0aGUgc3VnZ2VzdGVkIGNoYW5nZXMhDQoNCkJl
c3QsDQpOaWNrIFRlcnJlbGwNCg0KPiBCZXN0IFJlZ2FyZHMNCj4gTWljaGHFgiBNaXJvc8WCYXcN
Cg0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
