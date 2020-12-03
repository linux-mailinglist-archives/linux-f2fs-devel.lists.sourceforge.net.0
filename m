Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D11592CCBC7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 02:43:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ek+UDMeE84vKghiDmUv16cSnh9e4NEit5eLx4Iji9Ns=; b=Np5evsuSTtJmJeqhcwPuNtZeN
	39zK4at2Tr+M6q5FDV5M9wvWCjyl6E/E0xe1jPAvJQAL40IqQv/dWXMn7mRCe9LUGoEd3+39mLzlv
	RJ+QZbiwDpmP33Ho3HuVx0l5Z8LWKGwBexNWCwjllzILBez3jJYofe9UVxYG0pUwxBiA0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkdeH-0006Aq-DP; Thu, 03 Dec 2020 01:43:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=9606de115a=terrelln@fb.com>)
 id 1kkdeF-0006Ac-Cr; Thu, 03 Dec 2020 01:43:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XQW4cpdvAvV0zvlH2Jyu8KCGsr3ZxhO51i+C/F5wOHo=; b=dxrKPYtG12cqLxIYCxPKznJwOP
 04eNPVb6VeAvggwCfmktg0YxbYIibFBlvaqWAzKYWuvplaKb94VObQS/hKcDXMjInRr6rgO+RFpwr
 5tWIWc4bHO9sepMZvdi/ouip+oQRdS9KjOREIEYk9YXZGKOBZzsKTjLdSBlvxuX5XF0E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XQW4cpdvAvV0zvlH2Jyu8KCGsr3ZxhO51i+C/F5wOHo=; b=nOvRHD8FTWJtKnI4m3IlAp6FJg
 x5osuBW2NLlUvnF6dMU03q26HFwUAdJc3nvli5vnxixLT37JeqsrXxZGHNXp2S/ZO1nVCoIpNv+98
 fQv1BFTfeUo79VvMbYLRPuOWffaMWyqGHMm/oKlOVFieygkqFSuWmw/GiVgGyqOcMgyY=;
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkde1-00GtDL-Oy; Thu, 03 Dec 2020 01:43:07 +0000
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B31UH3d028138; Wed, 2 Dec 2020 17:42:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=XQW4cpdvAvV0zvlH2Jyu8KCGsr3ZxhO51i+C/F5wOHo=;
 b=nzZupqFFFstqKa3EUVrIlJXwWhSl+ywT+0qVAZqXldBi9+U0B2lnlZ/vv6oXmcb08ZoM
 r592nQRiGj0S1xu+LDwDQ7VAZPZOCE/EgQB2ngWScg/dQ+kvKtaoI4i2v/KnEni4txKE
 YASFReH03D1fs9BvpJ0QQi6xnFB84UbIZyE= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 355wgw9cam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 02 Dec 2020 17:42:11 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 2 Dec 2020 17:42:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYa/JgGA6nifyzmsaVEiVhPy710q3WtZCTClp9wyEtw2fJ5FFmULzPMrk35NzZNkSAAgAuu4sh+4KNvKdsYlEEnYzu7fcV0mBBHd9waHzji4z30VYhHUYzljxVuYBB026bnhYK/Jz1FQG3HXZKm6M1dvMqnIiGGmmqMIbi4BElDM+T9DcSCiXeGzqmrDjahfYqxhRM2He7vL6Dsl6Y3lvcGIVI6rvEhaTfOCLJudBny8YWl5htLyC8L94hJxPTE+60irfl292i8NMGak/qJVXUXgdgPnyt6RYzi4+Cg/IYhgsW5vStxAgupOmFku1oiT1Yl/DlchnnSTovM3gbdJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQW4cpdvAvV0zvlH2Jyu8KCGsr3ZxhO51i+C/F5wOHo=;
 b=jrbXz7oG6XmbeDS8gwfob90cALEtaedMHbn4JezxWAV53BGrlLpohuB3d9wgh4UE1qnA2eNW84TnPCBwe+Qb8eXHSGtp2i0o7UbqN5tAGUzHuqCMoFspTwFiWCt7d4sSRxJv9xOAiFTxV7dNl5M5nKVLDmRQTvZVMxAJJhdELKcO7ngVJ3MI6ZzkJ98DczCUo9PNbDM3u0vFOfKpVQCb4Ac5xg6EKU1G/bJPlvtyogaZON2DwUhrJMT+0P+iEDFjYhmTlcuuLl7hbBJ/T89NU9QVdbJnAUt05W04BIM5uEOEJYKo95b9hqD5FcZGJXFryjg0QbhwNz4ANUiv/9K23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQW4cpdvAvV0zvlH2Jyu8KCGsr3ZxhO51i+C/F5wOHo=;
 b=lM6GIZeZ/ZYZiOMBY8Yg0cstddygUYKJHnSS9kKv7tl8Do3EMefrCdr1RRrfgbgCJHIf9hGJxKqEfwy4qJ+TV0WT7z9TjGrDFIM6b4xKm4d+jk+mmIq3YcI/vBdgUFt1zjmy3jZk4jaeo8BR6ksnTCn5hLSbsnKBiys0WYSdfFM=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BY5PR15MB3571.namprd15.prod.outlook.com (2603:10b6:a03:1f6::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 01:42:04 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::17e:aa61:eb50:290c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::17e:aa61:eb50:290c%7]) with mapi id 15.20.3611.025; Thu, 3 Dec 2020
 01:42:04 +0000
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Thread-Topic: [PATCH v6 1/3] lib: zstd: Add kernel-specific API
Thread-Index: AQHWyOnYHjSKEx1KvUy8OD/sVz0sN6nkkesAgAAHQIA=
Date: Thu, 3 Dec 2020 01:42:03 +0000
Message-ID: <297D9C8B-5F4D-4E3B-A5FD-DA292D8BA12A@fb.com>
References: <20201202203242.1187898-1-nickrterrell@gmail.com>
 <20201202203242.1187898-2-nickrterrell@gmail.com>
 <20201203011606.GA20621@qmqm.qmqm.pl>
In-Reply-To: <20201203011606.GA20621@qmqm.qmqm.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rere.qmqm.pl; dkim=none (message not signed)
 header.d=none;rere.qmqm.pl; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:c4c5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d686446-af06-4f06-98aa-08d8972ca300
x-ms-traffictypediagnostic: BY5PR15MB3571:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR15MB35714690965FE44FA5406F61ABF20@BY5PR15MB3571.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qo0WsAAvqjeFAek4DCmQTPZIBVF+xyahQBVF6haeoep/KeoJQ6paLgIR7ocTBZERGRWe/zqZbLTXO6LVG81BRgWLEqoKQfZIMpFWyh26aDjNy7RmaEa7AFfJ28ZHJ+i6NFGE5M1rwkQEbT0RP04HZFWh10fncltbwCB6tLhGpDtXPfJgHikfk3nm33Bb9hJCJQEaBPQCHif+L6j86OBSg3q6uNDPWisFFetDcRBZSDpThh1GdYYjKkhZiURwKWIetk3tOVYy1r9Cs7ZbVQFY5dawM+Pq0MqA6NxmExcPhVusHlQW3Lvye23ooLB0DJeRwuyoDPs5sCOntH5h4W4sBw1If8DosbBknGhQiesbD2OfFpY18vlUyZk5ovUcVqdd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(136003)(396003)(39860400002)(346002)(86362001)(66476007)(66446008)(66556008)(66946007)(64756008)(8936002)(4326008)(478600001)(54906003)(53546011)(6512007)(6506007)(71200400001)(36756003)(76116006)(7416002)(91956017)(6486002)(2906002)(316002)(33656002)(8676002)(186003)(6916009)(66574015)(5660300002)(2616005)(83380400001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WTFoM3hxVW4vNFJwTFR2c1lsbi92QVJ0OUR2M2V5VHdNMFRnZThaMk9ENzZZ?=
 =?utf-8?B?TEYrV3VlNGY2ZDMybm50WGw0N0d6STRrTEYrZkUxd0xGRzlPOTJTRGxIVSto?=
 =?utf-8?B?OFl5SjVuN0o3NmthWG5SczZkd1h6V1paRzJ5dm1oL0Z2dk9KUkNQcW9qWDBs?=
 =?utf-8?B?djNab0JYTjV4WkFPZVdKNXpUd3pmaExIc2ZXMDBLS3A0N0hFUXZxbmZZbWlk?=
 =?utf-8?B?R3Z1cE1Cb3MxekRzYUV5WVBRTDkrZWgxbTQxTDlSWFNvUFBZUDBFWTVINDhJ?=
 =?utf-8?B?V0xGOE1wWWpvNEM0U2xxYWpwNFVYUFg0TTFWMmxISjJMVWdMRHJCaXNYNHNm?=
 =?utf-8?B?bGxNLzhCbENFaDBCbHlTK0MzRVgzSjZDK0EyczJ4a0ZadWRTTG5qN1RGRTkw?=
 =?utf-8?B?dEZWTElsYnM1cklUQkN3YzNmeGJrdWQ5NmxWVDFlMlIyU3kzRmdQWTBFTlJP?=
 =?utf-8?B?Q0V4QlQ4MDBhdWFUcUpyWnh3S1VobDNrUVYrakFicGNndk5RZmxkaTlJVDVN?=
 =?utf-8?B?elcraEpjRkkycVkxbW1DQjFDaGg5WlNOR2djVG1XcGErVXYyZFN6dTBIZFI1?=
 =?utf-8?B?NVA0cVlpZlN2UGgrRUIrcjVTS0pYREl0Y0N2TnJqd2NKWGlGMzNPL0p4ZFQ3?=
 =?utf-8?B?NGp3ZnROSGUvZExUU3RpbTZkRFpjTDB0c0NaaTJwYjBsOEpFMElvWVJXU3Ez?=
 =?utf-8?B?ajdVUGZJK0VMcTVKZG83bXV5UVZTR29UVnF5azgrZ1NtK0wzZGtlWDgyU0NL?=
 =?utf-8?B?ZmJsaDRodEhPR3Z1R0w4QTROTFRrNjNqc3o3a1NNK29TdGpjZEFmUUkxc3dV?=
 =?utf-8?B?aXI3VjM3L3pQOGN5azlVYmErZ1ZYYXhPeHdCOXdiQU14elZ6aWpOeXY5S0xL?=
 =?utf-8?B?b2ZSTWU3anR1dGtKRUFrZDNLUm1VRjVQZlgrYXMrVjBCQzAyajNmbEo2djVZ?=
 =?utf-8?B?LzlmNXRWUEtKU3gwaW9HUTBNMnJ3bXB3d1QzeXFWS25NYi81NU96SlU4K3Jy?=
 =?utf-8?B?OVNZS0dBVEZtTncvaStJMWVvZCsrbWJxM3dEdDA1SE91Z2ZvbHFqc25hTG5y?=
 =?utf-8?B?bXd5Y3A5QWxVbWhxMG5MRmE4aDhkaTJDVVdyYWVEemRlSlEvdlhQYkd1akRh?=
 =?utf-8?B?ZC95RUoydWZoM0tzQzJNY3owaHU4ZVViWXI1UXF6am9WRGVCZS8yNUlDWGg5?=
 =?utf-8?B?ZXJ3NmV3aU9zRllHMlYrVTlXRWFoSkpqcWhNYy9wenp3S3BFUUc0V2ZkWlpu?=
 =?utf-8?B?MXozc1NlWDd2L0JXdW5UY29PN2FzUm8vWFhNNlFQSk1DZlI4K1JXeWs5WndW?=
 =?utf-8?B?Z09PSHFZeUlnY1N4Z0FsMHZkSnVvMmhxdDR0RHRaMjJDQ2gxcXBJOGI1MWFH?=
 =?utf-8?Q?Q+7GmpiP+5F0AmBsRQJYL3M789enAIs0=3D?=
Content-ID: <9559B14BF34002418B1442F4D8EDE418@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d686446-af06-4f06-98aa-08d8972ca300
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 01:42:03.9647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m9wsKfw8jOhH2/gQMhBPHzlymsXym/c9I9q4UVu54gIx5XbxBmMt0hcGwpU/l8ko
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3571
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_14:2020-11-30,
 2020-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 clxscore=1011 impostorscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030006
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
X-Headers-End: 1kkde1-00GtDL-Oy
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

DQoNCj4gT24gRGVjIDIsIDIwMjAsIGF0IDU6MTYgUE0sIE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJx
LWxpbnV4QHJlcmUucW1xbS5wbD4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIERlYyAwMiwgMjAyMCBh
dCAxMjozMjo0MFBNIC0wODAwLCBOaWNrIFRlcnJlbGwgd3JvdGU6DQo+PiBGcm9tOiBOaWNrIFRl
cnJlbGwgPHRlcnJlbGxuQGZiLmNvbT4NCj4+IA0KPj4gVGhpcyBwYXRjaDoNCj4+IC0gTW92ZXMg
YGluY2x1ZGUvbGludXgvenN0ZC5oYCAtPiBgbGliL3pzdGQvenN0ZC5oYA0KPj4gLSBBZGRzIGEg
bmV3IEFQSSBpbiBgaW5jbHVkZS9saW51eC96c3RkLmhgIHRoYXQgaXMgZnVuY3Rpb25hbGx5DQo+
PiAgZXF1aXZhbGVudCB0byB0aGUgaW4tdXNlIHN1YnNldCBvZiB0aGUgY3VycmVudCBBUEkuIEZ1
bmN0aW9ucyBhcmUNCj4+ICByZW5hbWVkIHRvIGF2b2lkIHN5bWJvbCBjb2xsaXNpb25zIHdpdGgg
enN0ZCwgdG8gbWFrZSBpdCBjbGVhciBpdCBpcw0KPj4gIG5vdCB0aGUgdXBzdHJlYW0genN0ZCBB
UEksIGFuZCB0byBmb2xsb3cgdGhlIGtlcm5lbCBzdHlsZSBndWlkZS4NCj4+IC0gVXBkYXRlcyBh
bGwgY2FsbGVycyB0byB1c2UgdGhlIG5ldyBBUEkuDQo+PiANCj4+IFRoZXJlIGFyZSBubyBmdW5j
dGlvbmFsIGNoYW5nZXMgaW4gdGhpcyBwYXRjaC4gU2luY2UgdGhlcmUgYXJlIG5vDQo+PiBmdW5j
dGlvbmFsIGNoYW5nZSwgSSBmZWx0IGl0IHdhcyBva2F5IHRvIHVwZGF0ZSBhbGwgdGhlIGNhbGxl
cnMgaW4gYQ0KPj4gc2luZ2xlIHBhdGNoLCBzaW5jZSBvbmNlIHRoZSBBUEkgaXMgYXBwcm92ZWQs
IHRoZSBjYWxsZXJzIGFyZQ0KPj4gbWVjaGFuaWNhbGx5IGNoYW5nZWQuDQo+IFsuLi5dDQo+PiAt
LS0gYS9saWIvZGVjb21wcmVzc191bnpzdGQuYw0KPj4gKysrIGIvbGliL2RlY29tcHJlc3NfdW56
c3RkLmMNCj4gWy4uLl0NCj4+IHN0YXRpYyBpbnQgSU5JVCBoYW5kbGVfenN0ZF9lcnJvcihzaXpl
X3QgcmV0LCB2b2lkICgqZXJyb3IpKGNoYXIgKngpKQ0KPj4gew0KPj4gLQljb25zdCBpbnQgZXJy
ID0gWlNURF9nZXRFcnJvckNvZGUocmV0KTsNCj4+IC0NCj4+IC0JaWYgKCFaU1REX2lzRXJyb3Io
cmV0KSkNCj4+ICsJaWYgKCF6c3RkX2lzX2Vycm9yKHJldCkpDQo+PiAJCXJldHVybiAwOw0KPj4g
DQo+PiAtCXN3aXRjaCAoZXJyKSB7DQo+PiAtCWNhc2UgWlNURF9lcnJvcl9tZW1vcnlfYWxsb2Nh
dGlvbjoNCj4+IC0JCWVycm9yKCJaU1REIGRlY29tcHJlc3NvciByYW4gb3V0IG9mIG1lbW9yeSIp
Ow0KPj4gLQkJYnJlYWs7DQo+PiAtCWNhc2UgWlNURF9lcnJvcl9wcmVmaXhfdW5rbm93bjoNCj4+
IC0JCWVycm9yKCJJbnB1dCBpcyBub3QgaW4gdGhlIFpTVEQgZm9ybWF0ICh3cm9uZyBtYWdpYyBi
eXRlcykiKTsNCj4+IC0JCWJyZWFrOw0KPj4gLQljYXNlIFpTVERfZXJyb3JfZHN0U2l6ZV90b29T
bWFsbDoNCj4+IC0JY2FzZSBaU1REX2Vycm9yX2NvcnJ1cHRpb25fZGV0ZWN0ZWQ6DQo+PiAtCWNh
c2UgWlNURF9lcnJvcl9jaGVja3N1bV93cm9uZzoNCj4+IC0JCWVycm9yKCJaU1RELWNvbXByZXNz
ZWQgZGF0YSBpcyBjb3JydXB0Iik7DQo+PiAtCQlicmVhazsNCj4+IC0JZGVmYXVsdDoNCj4+IC0J
CWVycm9yKCJaU1RELWNvbXByZXNzZWQgZGF0YSBpcyBwcm9iYWJseSBjb3JydXB0Iik7DQo+PiAt
CQlicmVhazsNCj4+IC0JfQ0KPj4gKwllcnJvcigiWlNURCBkZWNvbXByZXNzaW9uIGZhaWxlZCIp
Ow0KPj4gCXJldHVybiAtMTsNCj4+IH0NCj4gDQo+IFRoaXMgbG9vc2VzIGRpYWdub3N0aWNzIHNw
ZWNpZmljaXR5IC0gaXMgdGhpcyBpbnRlbmRlZD8gQXQgbGVhc3QgdGhlDQo+IG91dC1vZi1tZW1v
cnkgY29uZGl0aW9uIHNlZW1zIHVzZWZ1bCB0byBkaXN0aW5ndWlzaC4NCg0KR29vZCBwb2ludC4g
VGhlIHpzdGQgQVBJIG5vIGxvbmdlciBleHBvc2VzIHRoZSBlcnJvciBjb2RlIGVudW0sDQpidXQg
aXQgZG9lcyBleHBvc2UgenN0ZF9nZXRfZXJyb3JfbmFtZSgpIHdoaWNoIGNhbiBiZSB1c2VkIGhl
cmUuDQpJIHdhcyB0aGlua2luZyB0aGF0IHRoZSBzdHJpbmcgbmVlZGVkIHRvIGJlIHN0YXRpYyBm
b3Igc29tZSByZWFzb24sIGJ1dA0KdGhhdCBpcyBub3QgdGhlIGNhc2UuIEkgd2lsbCBtYWtlIHRo
YXQgY2hhbmdlLg0KDQo+PiArc2l6ZV90IHpzdGRfY29tcHJlc3Nfc3RyZWFtKHpzdGRfY3N0cmVh
bSAqY3N0cmVhbSwNCj4+ICsJc3RydWN0IHpzdGRfb3V0X2J1ZmZlciAqb3V0cHV0LCBzdHJ1Y3Qg
enN0ZF9pbl9idWZmZXIgKmlucHV0KQ0KPj4gK3sNCj4+ICsJWlNURF9vdXRCdWZmZXIgbzsNCj4+
ICsJWlNURF9pbkJ1ZmZlciBpOw0KPj4gKwlzaXplX3QgcmV0Ow0KPj4gKw0KPj4gKwltZW1jcHko
Jm8sIG91dHB1dCwgc2l6ZW9mKG8pKTsNCj4+ICsJbWVtY3B5KCZpLCBpbnB1dCwgc2l6ZW9mKGkp
KTsNCj4+ICsJcmV0ID0gWlNURF9jb21wcmVzc1N0cmVhbShjc3RyZWFtLCAmbywgJmkpOw0KPj4g
KwltZW1jcHkob3V0cHV0LCAmbywgc2l6ZW9mKG8pKTsNCj4+ICsJbWVtY3B5KGlucHV0LCAmaSwg
c2l6ZW9mKGkpKTsNCj4+ICsJcmV0dXJuIHJldDsNCj4+ICt9DQo+IA0KPiBJcyBhbGwgdGhpcyBj
b3B5aW5nIG5lY2Vzc2FyeT8gSG93IGlzIGl0IGRpZmZlcmVudCBmcm9tIHR5cGUtcHVubmluZyBi
eQ0KPiBkaXJlY3QgcG9pbnRlciBjYXN0Pw0KDQpJZiBicmVha2luZyBzdHJpY3QgYWxpYXNpbmcg
YW5kIHR5cGUtcHVubmluZyBieSBwb2ludGVyIGNhc2luZyBpcyBva2F5LCB0aGVuDQp3ZSBjYW4g
ZG8gdGhhdCBoZXJlLiBUaGVzZSBtZW1jcHlzIHdpbGwgYmUgbmVnbGlnaWJsZSBmb3IgcGVyZm9y
bWFuY2UsIGJ1dA0KdHlwZS1wdW5uaW5nIHdvdWxkIGJlIG1vcmUgc3VjY2luY3QgaWYgYWxsb3dl
ZC4NCg0KQmVzdCwNCk5pY2sNCg0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
