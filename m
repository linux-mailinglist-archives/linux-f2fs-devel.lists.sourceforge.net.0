Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8159D26DCCF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Sep 2020 15:29:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5X4IXiMX/qMPhAZbNFlJNz5nshsAPa4H+48aaf9F/cc=; b=N8uHZm4HmRx8reuofaKkohzBd
	u+dkNv+3RpEQVLrjkJ+OhDjtCA354bZhzm6bIapLvCgm/VyGmTVSOckrIsE2EEIlR3emG1wQr4R12
	rbNvqpD+witRh+0lOxi6yo81rmn11D3brECW55EziLe8onTg9IMegAUcDiFaudo5P766k=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kItyq-000629-BS; Thu, 17 Sep 2020 13:29:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <terrelln@fb.com>) id 1kItyo-000621-Kx
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 13:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=subject:MIME-Version:Content-Transfer-Encoding:
 Content-Type:Content-ID:In-Reply-To:References:Message-ID:Date:CC:To:From:
 Sender:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p5/0mlsurjb44QBtdhdBoTWZLbSW3OOSlYqZZEq7kMw=; b=PXTvwkmPGrFYlVMELF49HMNsxw
 Bz2jR2pDhDmFiOoO31scmF1fmAS8M3IqrJI2IzjrYuxTJ4kgRXPXalLJCPqh24AuKT0mLItPTx+Z0
 YXYjlJ+s3X2RHxXh/CZm4D1XzsJDgC0AojHOV19w2OL5Rob83bmyvgRPudBfDfKi23hI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=subject:MIME-Version:Content-Transfer-Encoding:Content-Type:Content-ID:
 In-Reply-To:References:Message-ID:Date:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p5/0mlsurjb44QBtdhdBoTWZLbSW3OOSlYqZZEq7kMw=; b=b2mbKOpYRDwpGv5ixYOYeV7whr
 cacQb1QV3PRALsj5wJa3onzoFaSE1SzEGEHHjiJBlkxVZ5oJDlRKhXH8cUQx1wpZ4qPadqYCJJll9
 OWM7mev72E79lUAOYo1vxqYK4WNtTI42B80nY3BI92UjoHj2n4Z5Od8MMqzS0j0/Exs8=;
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kItyj-00EB5r-6Q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 13:29:42 +0000
Received: from pps.filterd (m0042983.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08HDSqa1026510; Thu, 17 Sep 2020 06:28:52 -0700
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-00082601.pphosted.com with ESMTP id 33k5pekk16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 06:28:51 -0700
Received: from pps.reinject (m0042983.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08HDRV73021412;
 Thu, 17 Sep 2020 06:27:41 -0700
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33k5nqwcfe-17
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Sep 2020 11:39:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 16 Sep 2020 11:39:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SU6XqH7WFl+aRgK8qK91TXFiZdcFWsWM2BTANBaL+c0UwI2JC5qhe+rCjaWYQKXFv+Y37BceFawQg8XJ7OM2T1B31uKwHq0UIc5bP3UeORQQb2SaPxfl1LypKdrTFNUlxoIPkqFF/5cCuCteMkdOIfgW8kPVzGjBjmawpVa6FDBBDnWhMLR0Y293gHiVus4OwqPag1pTCA5JTtyuwXab0O5gCefQ7NL98TEAlRWi2zRtQ1JHa/zHAbK3Y9PuhIVzalqS0+7k4RddgwQGGzT1s+btRnSeepeDS9pV0eQhcaJci44lVnCYr4GKAgfNsFLDacHq2pPFQ7F7WOgBlz3hpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5/0mlsurjb44QBtdhdBoTWZLbSW3OOSlYqZZEq7kMw=;
 b=a15JJbQlBdJOJgWUuFBunHC473qtLJPpIkJbPYtRhonrBFY6I5yfla8pLIOdG+AFL1zjYUNEVxtO8KIhLHHEDndLHppc+jAKyrALLKKwyCRGhtca92EuBY8JtGgcmLzZgT3auIGXxfHzjtNblHiZ8m9onL+wvMhUDC5UKN/e6+cDo4TFNXPi8TRx6JpQ96/6eyv3IxcLlAuoBf4D/tzgAXA/cNrfXw1jraEipbvlKg24+/dwexn3lvoGg+OY075SsKhDJDWgkAMNbO57B4mWKlcUFhGFecTgcICY95I0qKWWCnHvPEd7KpIJut9rAVijxRCsKeA5mIHCKH9Zc/lL8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5/0mlsurjb44QBtdhdBoTWZLbSW3OOSlYqZZEq7kMw=;
 b=lHLjUiFHqa3z863ItQeR/fur/sg5t828EyIHBUORPVGICFmncTLFqXNafsrECb7YlqC4ijYgCG0PGzedpV/1+2UNvDlMTFEgZjK9GLg1QSsJNtPQFk2EgEXjc/mahI3xccmY/3gmVbnQyQsMmTF9tyu/nrfq1JjGOiUUxE4GAE0=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2373.namprd15.prod.outlook.com (2603:10b6:a02:92::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Wed, 16 Sep
 2020 18:39:11 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 18:39:11 +0000
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH 6/9] f2fs: zstd: Switch to the zstd-1.4.6 API
Thread-Index: AQHWi9ufSzGQbs/fgE+hHGtC5Bpw36lqzjGAgADLbAA=
Date: Wed, 16 Sep 2020 18:39:11 +0000
Message-ID: <C8517011-9B6F-499F-BEC6-25BF1F0794AC@fb.com>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
 <20200916034307.2092020-9-nickrterrell@gmail.com>
 <28bf92f1-1246-a840-6195-0e230e517e6d@huawei.com>
In-Reply-To: <28bf92f1-1246-a840-6195-0e230e517e6d@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:d83f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a39e3a6b-6154-4a16-4c3d-08d85a6fcde7
x-ms-traffictypediagnostic: BYAPR15MB2373:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB2373B21DE29E50DCC8F5855AAB210@BYAPR15MB2373.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kMh1bGTxACbEHYI6Q1qE7Q/NKSVg+H4fsK+tvz9X7CXXgjyW2syaivYk8dZJLk7lmdFDktuPxvGA1gI766vU0Ijn+1VMyeYCxtieF1CsmD8M5sbq+IeIafrQGDOydIMBX7jwFGu/FvwiRieARE4p9ZBw8HU1/EV2pJpZw4Hd4eL/LRH3oDETgfBB06bamekRuvTPr2zl41pYk9pDDXZdr1dp0kWbQ4Fuq0MOuzvyrMEPOv3sausqx+S0IzWH7gRW/PZJMnxE+b5iC5QnCV85rgq/mFYb7uAywQfTnDQ6cE71XaCwJaQTfxjsJ0HuOt0HiR5exxTU9YIjvAJdT/eeZuiU5mo9rQQzYgRbhw0Jm3CbUeZ8izj1E7EqwdpV3hgwcTKaNua/+A1meKwsl06KRkU97JsMLq1eSZ5lNVQPLv03IUBTmQ7svu/ajZAfOPhW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(346002)(396003)(136003)(39860400002)(2616005)(8936002)(71200400001)(83380400001)(8676002)(316002)(186003)(86362001)(478600001)(6916009)(33656002)(966005)(6512007)(4326008)(36756003)(6486002)(54906003)(2906002)(5660300002)(66556008)(66446008)(66946007)(66476007)(64756008)(76116006)(6506007)(53546011)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: SY5q8EFqg7rAvnNSVGWZFl5GsKeX9WcMk9RjNNZjaI4vRvw9QxEbEm0f4ktC34jw86ShPEyqTlcZSXcTbCufbe729zz/dR4bAPbjCMP9TIEaRvK43NSq/6jBgCT5ltyTxmhUvFhnOMLBb1DXFcDIcgO3jp1oBzrU204tzcTtxD5PUD7igWBR4yFBPTjCjb7+xfsd/1pUP1+HD0zA+arRuntMS2Jj0itbCRdhb0gX1wpOaUX45sZkouj9rpZJsGK+4GSKj3/NnktOuO/2LAtS1lQ/cPLdvaQFsBpBr59EsoXT6YwfRofRGr2jgvvSl67QiZX9ov/Z+Hk7e3QYqQk1eE7/h2Q0ehwuV0OWTKGLEYsgCFu6sS140MF89FZLsg2qHacqRFyQoKhX3mqF+IESm091xGEany5WMZIs1J7O6/XFVMT4v0q5JZsXl2EtEvI4SShHorm3gkbVRitELjRGDjvgPBPG5pLmIPGhYAEnd+elA1ouTgmdar/SjSd3Hk+eq13Yoa3fgeXRK9Hn/YroyTsP+fTnskLpe8V+6hoMikQo/vr1EmWxR3uIDCCofkZ/oTHQHnXXKxQbsRgMxPVfkigy4Co816RVGeSaWU6SqIHaV0w3hz1vjvv9FjbUNrwm0ib2GrqtMWJTCJmqb61tHrxTgvOvBqFE1vvEQC/Nz3caOC25nz6NFgaFRNGzQWjM
Content-ID: <F1B471FF92F8954981241E05C6BA77D9@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a39e3a6b-6154-4a16-4c3d-08d85a6fcde7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 18:39:11.3123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vCWdz9IDJFxy1s7Uf11rq1vip/5pEcrOarw6PRjbB+p566Em5IkOFyI+KvsSb/c5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2373
X-OriginatorOrg: fb.com
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_11:2020-09-16,
 2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1011 adultscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160130
X-FB-Internal: deliver
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-17_09:2020-09-16,
 2020-09-17 signatures=0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.145.42 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kItyj-00EB5r-6Q
Subject: Re: [f2fs-dev] [PATCH 6/9] f2fs: zstd: Switch to the zstd-1.4.6 API
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
Cc: Johannes Weiner <jweiner@fb.com>, Nick Terrell <nickrterrell@gmail.com>,
 Yann Collet <cyan@fb.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>, Kernel Team <Kernel-team@fb.com>,
 Niket Agarwal <niketa@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gT24gU2VwIDE1LCAyMDIwLCBhdCAxMTozMSBQTSwgQ2hhbyBZdSA8eXVjaGFvMEBodWF3
ZWkuY29tPiB3cm90ZToNCj4gDQo+IEhpIE5pY2ssDQo+IA0KPiByZW1vdmUgbm90IHJlbGF0ZWQg
bWFpbGluZyBsaXN0Lg0KPiANCj4gT24gMjAyMC85LzE2IDExOjQzLCBOaWNrIFRlcnJlbGwgd3Jv
dGU6DQo+PiBGcm9tOiBOaWNrIFRlcnJlbGwgPHRlcnJlbGxuQGZiLmNvbT4NCj4+IE1vdmUgYXdh
eSBmcm9tIHRoZSBjb21wYXRpYmlsaXR5IHdyYXBwZXIgdG8gdGhlIHpzdGQtMS40LjYgQVBJLiBU
aGlzDQo+PiBjb2RlIGlzIG1vcmUgZWZmaWNpZW50IGJlY2F1c2UgaXQgdXNlcyB0aGUgc2luZ2xl
LXBhc3MgQVBJIGluc3RlYWQgb2YNCj4+IHRoZSBzdHJlYW1pbmcgQVBJLiBUaGUgc3RyZWFtaW5n
IEFQSSBpcyBub3QgbmVjZXNzYXJ5IGJlY2F1c2UgdGhlIHdob2xlDQo+PiBpbnB1dCBhbmQgb3V0
cHV0IGJ1ZmZlcnMgYXJlIGF2YWlsYWJsZS4gVGhpcyBzYXZlcyBtZW1vcnkgYmVjYXVzZSB3ZQ0K
Pj4gZG9uJ3QgbmVlZCB0byBhbGxvY2F0ZSBhIGJ1ZmZlciBmb3IgdGhlIHdpbmRvdy4gSXQgaXMg
YWxzbyBtb3JlDQo+PiBlZmZpY2llbnQgYmVjYXVzZSBpdCBzYXZlcyB1bm5lY2Vzc2FyeSBtZW1j
cHkgY2FsbHMuDQo+PiBJJ3ZlIGhhZCBwcm9ibGVtcyB0ZXN0aW5nIHRoaXMgY29kZSBiZWNhdXNl
IEkgc2VlIGRhdGEgdHJ1bmNhdGlvbiBiZWZvcmUNCj4+IGFuZCBhZnRlciB0aGlzIHBhdGNoc2V0
LiBIZWxwIHRlc3RpbmcgdGhpcyBwYXRjaCB3b3VsZCBiZSBtdWNoDQo+PiBhcHByZWNpYXRlZC4N
Cj4gDQo+IENhbiB5b3UgcGxlYXNlIGV4cGxhaW4gbW9yZSBhYm91dCBkYXRhIHRydW5jYXRpb24/
IEknbSBhIGxpdHRsZSBjb25mdXNlZC4uLg0KPiANCj4gRG8geW91IG1lYW4gdGhhdCBmMmZzIGRv
ZXNuJ3QgYWxsb2NhdGUgZW5vdWdoIG1lbW9yeSBmb3IgenN0ZCBjb21wcmVzc2lvbiwNCj4gc28g
dGhhdCBjb21wcmVzc2lvbiBpcyBub3QgZmluaXNoZWQgYWN0dWFsbHksIHRoZSBjb21wcmVzc2Vk
IGRhdGEgaXMgdHJ1bmNhdGVkDQo+IGF0IGRzdCBidWZmZXI/DQoNCkhpIENoYW8sDQoNCknigJl2
ZSB0ZXN0ZWQgRjJGUyB1c2luZyBhIGJlbmNobWFyayBJIGFkYXB0ZWQgZnJvbSB0ZXN0aW5nIEJ0
ckZTIFswXS4gSXQgaXMgcG9zc2libGUNCnRoYXQgdGhlIHNjcmlwdCBJ4oCZbSB1c2luZyBpcyBi
dWdneSBvciBpcyBleHBvc2luZyBhbiBlZGdlIGNhc2UgaW4gRjJGUy4gVGhlIGZpbGVzDQp0aGF0
IEkgY29weSB0byBGMkZTIGFuZCBjb21wcmVzcyBlbmQgdXAgdHJ1bmNhdGVkIHdpdGggYSBob2xl
IGF0IHRoZSBlbmQuDQoNCkl0IGlzIGJhc2VkIG9mZiBvZiB1cHN0cmVhbSBjb21taXQgYWIyOWE4
MDdhNy4NCg0KRS5nLiB0aGUgZW5kIG9mIHRoZSBjb3BpZWQgZmlsZSBsb29rcyBsaWtlIHRoaXMs
IGJ1dCB0aGUgb3JpZ2luYWwgZmlsZSBoYXMgbm9uLXplcm8gZGF0YQ0KSW4gdGhlIGVuZC4gVW50
aWwgdGhlIGhvbGUgYXQgdGhlIGVuZCB0aGUgZmlsZSBpcyBjb3JyZWN0Lg0KDQpvZCBkaWNrZW5z
IHwgdGFpbCAtbiA1DQo+IDQ2NjY3NzYwIDA2NzUwMiAwNjYxNjcgMDIwMDU2IDA0MDQ0MCAwMjAx
NjMgMDIzNTExIDAwNjU1NSAwNjA0MTINCj4gNDY2NzAwMDAgMDAwMDAwIDAwMDAwMCAwMDAwMDAg
MDAwMDAwIDAwMDAwMCAwMDAwMDAgMDAwMDAwIDAwMDAwMA0KPiAqDQo+IDQ2NzAzMDYwIDAwMDAw
MCAwMDAwMDAgMDAwMDAwIDAwMDAwMCAwMDAwMDAgMDAwMDAwIDAwMDAwMA0KPiA0NjcwMzA3Ng0K
DQpbMF0gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vdGVycmVsbG4vN2RkMjkxOTkzN2RmYmRiOGU4
MzllNGFkMTFjODFkYjQNCg0KQmVzdCwNCk5pY2sNCg0KPiBUaGFua3MsDQo+IA0KPj4gU2lnbmVk
LW9mZi1ieTogTmljayBUZXJyZWxsIDx0ZXJyZWxsbkBmYi5jb20+DQo+PiAtLS0NCj4+ICBmcy9m
MmZzL2NvbXByZXNzLmMgfCAxMDIgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDY0IGRlbGV0
aW9ucygtKQ0KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29tcHJlc3MuYyBiL2ZzL2YyZnMvY29t
cHJlc3MuYw0KPj4gaW5kZXggZTA1NmYzYTJiNDA0Li5iNzllZmNlODE2NTEgMTAwNjQ0DQo+PiAt
LS0gYS9mcy9mMmZzL2NvbXByZXNzLmMNCj4+ICsrKyBiL2ZzL2YyZnMvY29tcHJlc3MuYw0KPj4g
QEAgLTExLDcgKzExLDggQEANCj4+ICAjaW5jbHVkZSA8bGludXgvYmFja2luZy1kZXYuaD4NCj4+
ICAjaW5jbHVkZSA8bGludXgvbHpvLmg+DQo+PiAgI2luY2x1ZGUgPGxpbnV4L2x6NC5oPg0KPj4g
LSNpbmNsdWRlIDxsaW51eC96c3RkX2NvbXBhdC5oPg0KPj4gKyNpbmNsdWRlIDxsaW51eC96c3Rk
Lmg+DQo+PiArI2luY2x1ZGUgPGxpbnV4L3pzdGRfZXJyb3JzLmg+DQo+PiAgICAjaW5jbHVkZSAi
ZjJmcy5oIg0KPj4gICNpbmNsdWRlICJub2RlLmgiDQo+PiBAQCAtMjk4LDIxICsyOTksMjEgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBmMmZzX2NvbXByZXNzX29wcyBmMmZzX2x6NF9vcHMgPSB7DQo+
PiAgc3RhdGljIGludCB6c3RkX2luaXRfY29tcHJlc3NfY3R4KHN0cnVjdCBjb21wcmVzc19jdHgg
KmNjKQ0KPj4gIHsNCj4+ICAJWlNURF9wYXJhbWV0ZXJzIHBhcmFtczsNCj4+IC0JWlNURF9DU3Ry
ZWFtICpzdHJlYW07DQo+PiArCVpTVERfQ0N0eCAqY3R4Ow0KPj4gIAl2b2lkICp3b3Jrc3BhY2U7
DQo+PiAgCXVuc2lnbmVkIGludCB3b3Jrc3BhY2Vfc2l6ZTsNCj4+ICAgIAlwYXJhbXMgPSBaU1RE
X2dldFBhcmFtcyhGMkZTX1pTVERfREVGQVVMVF9DTEVWRUwsIGNjLT5ybGVuLCAwKTsNCj4+IC0J
d29ya3NwYWNlX3NpemUgPSBaU1REX0NTdHJlYW1Xb3Jrc3BhY2VCb3VuZChwYXJhbXMuY1BhcmFt
cyk7DQo+PiArCXdvcmtzcGFjZV9zaXplID0gWlNURF9lc3RpbWF0ZUNDdHhTaXplX3VzaW5nQ1Bh
cmFtcyhwYXJhbXMuY1BhcmFtcyk7DQo+PiAgICAJd29ya3NwYWNlID0gZjJmc19rdm1hbGxvYyhG
MkZTX0lfU0IoY2MtPmlub2RlKSwNCj4+ICAJCQkJCXdvcmtzcGFjZV9zaXplLCBHRlBfTk9GUyk7
DQo+PiAgCWlmICghd29ya3NwYWNlKQ0KPj4gIAkJcmV0dXJuIC1FTk9NRU07DQo+PiAgLQlzdHJl
YW0gPSBaU1REX2luaXRDU3RyZWFtKHBhcmFtcywgMCwgd29ya3NwYWNlLCB3b3Jrc3BhY2Vfc2l6
ZSk7DQo+PiAtCWlmICghc3RyZWFtKSB7DQo+PiAtCQlwcmludGtfcmF0ZWxpbWl0ZWQoIiVzRjJG
Uy1mcyAoJXMpOiAlcyBaU1REX2luaXRDU3RyZWFtIGZhaWxlZFxuIiwNCj4+ICsJY3R4ID0gWlNU
RF9pbml0U3RhdGljQ0N0eCh3b3Jrc3BhY2UsIHdvcmtzcGFjZV9zaXplKTsNCj4+ICsJaWYgKCFj
dHgpIHsNCj4+ICsJCXByaW50a19yYXRlbGltaXRlZCgiJXNGMkZTLWZzICglcyk6ICVzIFpTVERf
aW5pdHRhdGljQ1N0cmVhbSBmYWlsZWRcbiIsDQo+PiAgCQkJCUtFUk5fRVJSLCBGMkZTX0lfU0Io
Y2MtPmlub2RlKS0+c2ItPnNfaWQsDQo+PiAgCQkJCV9fZnVuY19fKTsNCj4+ICAJCWt2ZnJlZSh3
b3Jrc3BhY2UpOw0KPj4gQEAgLTMyMCw3ICszMjEsNyBAQCBzdGF0aWMgaW50IHpzdGRfaW5pdF9j
b21wcmVzc19jdHgoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MpDQo+PiAgCX0NCj4+ICAgIAljYy0+
cHJpdmF0ZSA9IHdvcmtzcGFjZTsNCj4+IC0JY2MtPnByaXZhdGUyID0gc3RyZWFtOw0KPj4gKwlj
Yy0+cHJpdmF0ZTIgPSBjdHg7DQo+PiAgICAJY2MtPmNsZW4gPSBjYy0+cmxlbiAtIFBBR0VfU0la
RSAtIENPTVBSRVNTX0hFQURFUl9TSVpFOw0KPj4gIAlyZXR1cm4gMDsNCj4+IEBAIC0zMzUsNjUg
KzMzNiw0OCBAQCBzdGF0aWMgdm9pZCB6c3RkX2Rlc3Ryb3lfY29tcHJlc3NfY3R4KHN0cnVjdCBj
b21wcmVzc19jdHggKmNjKQ0KPj4gICAgc3RhdGljIGludCB6c3RkX2NvbXByZXNzX3BhZ2VzKHN0
cnVjdCBjb21wcmVzc19jdHggKmNjKQ0KPj4gIHsNCj4+IC0JWlNURF9DU3RyZWFtICpzdHJlYW0g
PSBjYy0+cHJpdmF0ZTI7DQo+PiAtCVpTVERfaW5CdWZmZXIgaW5idWY7DQo+PiAtCVpTVERfb3V0
QnVmZmVyIG91dGJ1ZjsNCj4+IC0JaW50IHNyY19zaXplID0gY2MtPnJsZW47DQo+PiAtCWludCBk
c3Rfc2l6ZSA9IHNyY19zaXplIC0gUEFHRV9TSVpFIC0gQ09NUFJFU1NfSEVBREVSX1NJWkU7DQo+
PiAtCWludCByZXQ7DQo+PiAtDQo+PiAtCWluYnVmLnBvcyA9IDA7DQo+PiAtCWluYnVmLnNyYyA9
IGNjLT5yYnVmOw0KPj4gLQlpbmJ1Zi5zaXplID0gc3JjX3NpemU7DQo+PiAtDQo+PiAtCW91dGJ1
Zi5wb3MgPSAwOw0KPj4gLQlvdXRidWYuZHN0ID0gY2MtPmNidWYtPmNkYXRhOw0KPj4gLQlvdXRi
dWYuc2l6ZSA9IGRzdF9zaXplOw0KPj4gLQ0KPj4gLQlyZXQgPSBaU1REX2NvbXByZXNzU3RyZWFt
KHN0cmVhbSwgJm91dGJ1ZiwgJmluYnVmKTsNCj4+IC0JaWYgKFpTVERfaXNFcnJvcihyZXQpKSB7
DQo+PiAtCQlwcmludGtfcmF0ZWxpbWl0ZWQoIiVzRjJGUy1mcyAoJXMpOiAlcyBaU1REX2NvbXBy
ZXNzU3RyZWFtIGZhaWxlZCwgcmV0OiAlZFxuIiwNCj4+IC0JCQkJS0VSTl9FUlIsIEYyRlNfSV9T
QihjYy0+aW5vZGUpLT5zYi0+c19pZCwNCj4+IC0JCQkJX19mdW5jX18sIFpTVERfZ2V0RXJyb3JD
b2RlKHJldCkpOw0KPj4gLQkJcmV0dXJuIC1FSU87DQo+PiAtCX0NCj4+IC0NCj4+IC0JcmV0ID0g
WlNURF9lbmRTdHJlYW0oc3RyZWFtLCAmb3V0YnVmKTsNCj4+ICsJWlNURF9DQ3R4ICpjdHggPSBj
Yy0+cHJpdmF0ZTI7DQo+PiArCWNvbnN0IHNpemVfdCBzcmNfc2l6ZSA9IGNjLT5ybGVuOw0KPj4g
Kwljb25zdCBzaXplX3QgZHN0X3NpemUgPSBzcmNfc2l6ZSAtIFBBR0VfU0laRSAtIENPTVBSRVNT
X0hFQURFUl9TSVpFOw0KPj4gKwlaU1REX3BhcmFtZXRlcnMgcGFyYW1zID0gWlNURF9nZXRQYXJh
bXMoRjJGU19aU1REX0RFRkFVTFRfQ0xFVkVMLCBzcmNfc2l6ZSwgMCk7DQo+PiArCXNpemVfdCBy
ZXQ7DQo+PiArDQo+PiArCXJldCA9IFpTVERfY29tcHJlc3NfYWR2YW5jZWQoDQo+PiArCQkJY3R4
LCBjYy0+Y2J1Zi0+Y2RhdGEsIGRzdF9zaXplLCBjYy0+cmJ1Ziwgc3JjX3NpemUsIE5VTEwsIDAs
IHBhcmFtcyk7DQo+PiAgCWlmIChaU1REX2lzRXJyb3IocmV0KSkgew0KPj4gLQkJcHJpbnRrX3Jh
dGVsaW1pdGVkKCIlc0YyRlMtZnMgKCVzKTogJXMgWlNURF9lbmRTdHJlYW0gcmV0dXJuZWQgJWRc
biIsDQo+PiArCQkvKg0KPj4gKwkJICogdGhlcmUgaXMgY29tcHJlc3NlZCBkYXRhIHJlbWFpbmVk
IGluIGludGVybWVkaWF0ZSBidWZmZXIgZHVlIHRvDQo+PiArCQkgKiBubyBtb3JlIHNwYWNlIGlu
IGNidWYuY2RhdGENCj4+ICsJCSAqLw0KPj4gKwkJaWYgKFpTVERfZ2V0RXJyb3JDb2RlKHJldCkg
PT0gWlNURF9lcnJvcl9kc3RTaXplX3Rvb1NtYWxsKQ0KPj4gKwkJCXJldHVybiAtRUFHQUlOOw0K
Pj4gKwkJLyogb3RoZXIgY29tcHJlc3Npb24gZXJyb3JzIHJldHVybiAtRUlPICovDQo+PiArCQlw
cmludGtfcmF0ZWxpbWl0ZWQoIiVzRjJGUy1mcyAoJXMpOiAlcyBaU1REX2NvbXByZXNzX2FkdmFu
Y2VkIGZhaWxlZCwgZXJyOiAlc1xuIiwNCj4+ICAJCQkJS0VSTl9FUlIsIEYyRlNfSV9TQihjYy0+
aW5vZGUpLT5zYi0+c19pZCwNCj4+IC0JCQkJX19mdW5jX18sIFpTVERfZ2V0RXJyb3JDb2RlKHJl
dCkpOw0KPj4gKwkJCQlfX2Z1bmNfXywgWlNURF9nZXRFcnJvck5hbWUocmV0KSk7DQo+PiAgCQly
ZXR1cm4gLUVJTzsNCj4+ICAJfQ0KPj4gIC0JLyoNCj4+IC0JICogdGhlcmUgaXMgY29tcHJlc3Nl
ZCBkYXRhIHJlbWFpbmVkIGluIGludGVybWVkaWF0ZSBidWZmZXIgZHVlIHRvDQo+PiAtCSAqIG5v
IG1vcmUgc3BhY2UgaW4gY2J1Zi5jZGF0YQ0KPj4gLQkgKi8NCj4+IC0JaWYgKHJldCkNCj4+IC0J
CXJldHVybiAtRUFHQUlOOw0KPj4gLQ0KPj4gLQljYy0+Y2xlbiA9IG91dGJ1Zi5wb3M7DQo+PiAr
CWNjLT5jbGVuID0gcmV0Ow0KPj4gIAlyZXR1cm4gMDsNCj4+ICB9DQo+PiAgICBzdGF0aWMgaW50
IHpzdGRfaW5pdF9kZWNvbXByZXNzX2N0eChzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYykN
Cj4+ICB7DQo+PiAtCVpTVERfRFN0cmVhbSAqc3RyZWFtOw0KPj4gKwlaU1REX0RDdHggKmN0eDsN
Cj4+ICAJdm9pZCAqd29ya3NwYWNlOw0KPj4gIAl1bnNpZ25lZCBpbnQgd29ya3NwYWNlX3NpemU7
DQo+PiAgLQl3b3Jrc3BhY2Vfc2l6ZSA9IFpTVERfRFN0cmVhbVdvcmtzcGFjZUJvdW5kKE1BWF9D
T01QUkVTU19XSU5ET1dfU0laRSk7DQo+PiArCXdvcmtzcGFjZV9zaXplID0gWlNURF9lc3RpbWF0
ZURDdHhTaXplKCk7DQo+PiAgICAJd29ya3NwYWNlID0gZjJmc19rdm1hbGxvYyhGMkZTX0lfU0Io
ZGljLT5pbm9kZSksDQo+PiAgCQkJCQl3b3Jrc3BhY2Vfc2l6ZSwgR0ZQX05PRlMpOw0KPj4gIAlp
ZiAoIXdvcmtzcGFjZSkNCj4+ICAJCXJldHVybiAtRU5PTUVNOw0KPj4gIC0Jc3RyZWFtID0gWlNU
RF9pbml0RFN0cmVhbShNQVhfQ09NUFJFU1NfV0lORE9XX1NJWkUsDQo+PiAtCQkJCQl3b3Jrc3Bh
Y2UsIHdvcmtzcGFjZV9zaXplKTsNCj4+IC0JaWYgKCFzdHJlYW0pIHsNCj4+IC0JCXByaW50a19y
YXRlbGltaXRlZCgiJXNGMkZTLWZzICglcyk6ICVzIFpTVERfaW5pdERTdHJlYW0gZmFpbGVkXG4i
LA0KPj4gKwljdHggPSBaU1REX2luaXRTdGF0aWNEQ3R4KHdvcmtzcGFjZSwgd29ya3NwYWNlX3Np
emUpOw0KPj4gKwlpZiAoIWN0eCkgew0KPj4gKwkJcHJpbnRrX3JhdGVsaW1pdGVkKCIlc0YyRlMt
ZnMgKCVzKTogJXMgWlNURF9pbml0U3RhdGljREN0eCBmYWlsZWRcbiIsDQo+PiAgCQkJCUtFUk5f
RVJSLCBGMkZTX0lfU0IoZGljLT5pbm9kZSktPnNiLT5zX2lkLA0KPj4gIAkJCQlfX2Z1bmNfXyk7
DQo+PiAgCQlrdmZyZWUod29ya3NwYWNlKTsNCj4+IEBAIC00MDEsNyArMzg1LDcgQEAgc3RhdGlj
IGludCB6c3RkX2luaXRfZGVjb21wcmVzc19jdHgoc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpk
aWMpDQo+PiAgCX0NCj4+ICAgIAlkaWMtPnByaXZhdGUgPSB3b3Jrc3BhY2U7DQo+PiAtCWRpYy0+
cHJpdmF0ZTIgPSBzdHJlYW07DQo+PiArCWRpYy0+cHJpdmF0ZTIgPSBjdHg7DQo+PiAgICAJcmV0
dXJuIDA7DQo+PiAgfQ0KPj4gQEAgLTQxNSwyOCArMzk5LDE4IEBAIHN0YXRpYyB2b2lkIHpzdGRf
ZGVzdHJveV9kZWNvbXByZXNzX2N0eChzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYykNCj4+
ICAgIHN0YXRpYyBpbnQgenN0ZF9kZWNvbXByZXNzX3BhZ2VzKHN0cnVjdCBkZWNvbXByZXNzX2lv
X2N0eCAqZGljKQ0KPj4gIHsNCj4+IC0JWlNURF9EU3RyZWFtICpzdHJlYW0gPSBkaWMtPnByaXZh
dGUyOw0KPj4gLQlaU1REX2luQnVmZmVyIGluYnVmOw0KPj4gLQlaU1REX291dEJ1ZmZlciBvdXRi
dWY7DQo+PiAtCWludCByZXQ7DQo+PiAtDQo+PiAtCWluYnVmLnBvcyA9IDA7DQo+PiAtCWluYnVm
LnNyYyA9IGRpYy0+Y2J1Zi0+Y2RhdGE7DQo+PiAtCWluYnVmLnNpemUgPSBkaWMtPmNsZW47DQo+
PiAtDQo+PiAtCW91dGJ1Zi5wb3MgPSAwOw0KPj4gLQlvdXRidWYuZHN0ID0gZGljLT5yYnVmOw0K
Pj4gLQlvdXRidWYuc2l6ZSA9IGRpYy0+cmxlbjsNCj4+ICsJWlNURF9EQ3R4ICpjdHggPSBkaWMt
PnByaXZhdGUyOw0KPj4gKwlzaXplX3QgcmV0Ow0KPj4gIC0JcmV0ID0gWlNURF9kZWNvbXByZXNz
U3RyZWFtKHN0cmVhbSwgJm91dGJ1ZiwgJmluYnVmKTsNCj4+ICsJcmV0ID0gWlNURF9kZWNvbXBy
ZXNzREN0eChjdHgsIGRpYy0+cmJ1ZiwgZGljLT5ybGVuLCBkaWMtPmNidWYtPmNkYXRhLCBkaWMt
PmNsZW4pOw0KPj4gIAlpZiAoWlNURF9pc0Vycm9yKHJldCkpIHsNCj4+IC0JCXByaW50a19yYXRl
bGltaXRlZCgiJXNGMkZTLWZzICglcyk6ICVzIFpTVERfY29tcHJlc3NTdHJlYW0gZmFpbGVkLCBy
ZXQ6ICVkXG4iLA0KPj4gKwkJcHJpbnRrX3JhdGVsaW1pdGVkKCIlc0YyRlMtZnMgKCVzKTogJXMg
WlNURF9kZWNvbXByZXNzREN0eCBmYWlsZWQsIGVycjogJXNcbiIsDQo+PiAgCQkJCUtFUk5fRVJS
LCBGMkZTX0lfU0IoZGljLT5pbm9kZSktPnNiLT5zX2lkLA0KPj4gLQkJCQlfX2Z1bmNfXywgWlNU
RF9nZXRFcnJvckNvZGUocmV0KSk7DQo+PiArCQkJCV9fZnVuY19fLCBaU1REX2dldEVycm9yTmFt
ZShyZXQpKTsNCj4+ICAJCXJldHVybiAtRUlPOw0KPj4gIAl9DQo+PiAgLQlpZiAoZGljLT5ybGVu
ICE9IG91dGJ1Zi5wb3MpIHsNCj4+ICsJaWYgKGRpYy0+cmxlbiAhPSByZXQpIHsNCj4+ICAJCXBy
aW50a19yYXRlbGltaXRlZCgiJXNGMkZTLWZzICglcyk6ICVzIFpTVEQgaW52YWxpZCBybGVuOiV6
dSwgIg0KPj4gIAkJCQkiZXhwZWN0ZWQ6JWx1XG4iLCBLRVJOX0VSUiwNCj4+ICAJCQkJRjJGU19J
X1NCKGRpYy0+aW5vZGUpLT5zYi0+c19pZCwNCg0KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
