Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF22526E30B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Sep 2020 19:58:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e4pHwN/Hjvwer6OKZ5lygz72PcLyafTGLX5EEemW2aI=; b=KgtD9J+NBu+ErhIRTdNr4fTu3
	Jh5fuTHbNFT5i63gR/+rcSXjE989nsQh+/XqqmhVgkWPg8np/U8ZzyWfUzKP1LN5QbSJR25nHtVlN
	vvd/LInDG8hJaUdG+ggE5z3nI2gbuerxHWPsR5sPoOE+UtnS4Cv73dEJkTAIeePUpoqw4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIyAa-0001fN-VA; Thu, 17 Sep 2020 17:58:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=6529f45c4b=terrelln@fb.com>)
 id 1kIyAZ-0001fE-VR; Thu, 17 Sep 2020 17:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XCOEkT2hGjYICdGFrJpPyKKEKALHdwgIt0U5/RrDeY8=; b=dqcrWYIqUUy0wdJNuEayZCyAkD
 3MvXdpUJgg74LG8cVWCxPfjISxtmAqSoj6iX+xBWvuPp9DhJrqv9YwxBPC9kXl2zlHLyvEOaIWMnP
 pRYTFS0pBtHOaL1lk0ywyDwfN8rVCNdK9Iinj4mWXEzddubSRmz7KA3yqtUh5KEwCXzw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XCOEkT2hGjYICdGFrJpPyKKEKALHdwgIt0U5/RrDeY8=; b=KH8+1HpQLcTAk72Dvp9iI9n8I9
 jhNKpcUO1GGg/nlPZHYxctjHTWP7gCnqINNbDOy0Y0vttCQ7wFu0P/zAIljfvuWeaez48sgQnvHQg
 j1T4jfTmJ4Xw+BKTEIuQI9TVCmizCyiV1uASlbrZ3VgQfmjGOzNnbDLerIO5ptvuqahY=;
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIyAT-00DFi4-S0; Thu, 17 Sep 2020 17:58:07 +0000
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08HHpAZW031090; Thu, 17 Sep 2020 10:57:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=XCOEkT2hGjYICdGFrJpPyKKEKALHdwgIt0U5/RrDeY8=;
 b=YKPiO9UWNlzagG650BCR8IoFm7KBJ1eaSnsPkCXoLkqjKo03+XN5HD1U0za0hGPwXsEe
 mtmC6yUBoUsZB1i6HWNeZzoCi9GyVbFIP+pG3sSWr6yoOlOt/df6Swa9p4a91pi3fVyJ
 G8aTVwE/YbfwZCR00B448s98kQbozoD9oMg= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33mc4rr67m-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Sep 2020 10:57:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 17 Sep 2020 10:57:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asqT+k4EH5YSN2ONT8M45bBV3BsVxLlmKdCPUZEkB3cxhN2brBMqZsTiP0SMBCPnFBSSO++kby2jTWefZzyQU+F+kh2Ou+6I/7f9s6KNO+5rJxYKfTDNMn/EJXO03OIEY/485j5XWKjv/W27F+ui6zVAo0XyzO2xU1CbrnfMl2pNw7/MDnqn6yX/C/AkJ/MxQDhEbELHz/d0NZSre1JQxOwyvUMO/oIqOswGqZXrOBR+ivZ81zaXdWMsJ7wh0RlKnlwD33nktouPEJQR2Mnpoqf6R5KGP2KQcrOMb4iNz+2QhAJE3fmpQDEmgy5zKoM6y1yV5LMyvqvp1uKfRrluPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCOEkT2hGjYICdGFrJpPyKKEKALHdwgIt0U5/RrDeY8=;
 b=RYFe8SqPa+liC15k18YWpbvyTdKe1mUM1xhBuWRRgNa5CeJ0WnoHvjIZ8zTTahWhQPbz1p5tZhiMkJ98Dk3kP5aIMoLvclj/R4puIzpurCJqQT08aF+fBCqg5+7kjBDOe5TRbyUFu9J8eDAOtqe3jq2lIHCNvoSG9J5LoeXZz6tDXhAUe2eXQ53BWD6cV53uY7ycoOnAjBVV3GnLh1cpB++Yu6DTTiQIJpVe/q4lFquVgAAxWI2B7SDRBfuYFjSgu+HA/KNyrVkuwLEF0/OREtIVgVkK/gb6umbLiCTwH0UrAI26ehRrJ+muimxKVPaMRzhyHP49+MnbLacALOqW/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCOEkT2hGjYICdGFrJpPyKKEKALHdwgIt0U5/RrDeY8=;
 b=Qp/YW6GLn3DC22LyBNYvB8Q1OKPP59ibYE339x+bH2fvQCGvhcu8WkojV4UmzqAU6xmKpqEEaLZKrLaBRWhyg1Gv0qRwvfC1kQatBOsZNnlEwYmRp5m6CZfvN32bhw676m6ysaxBwu1z6sU6RqYAanwj29LF8cLjcztFCuYpvF0=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2408.namprd15.prod.outlook.com (2603:10b6:a02:85::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Thu, 17 Sep
 2020 17:57:39 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c%7]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 17:57:39 +0000
To: Chris Mason <clm@fb.com>
Thread-Topic: [PATCH 5/9] btrfs: zstd: Switch to the zstd-1.4.6 API
Thread-Index: AQHWi9t+F+963YLOT0SgwBoo2TG/malq9P8AgABcdACAAALEAIAAA28AgAAA6ACAAEv8AIAAaX+AgACOPwCAAEmPgIAAOoKA
Date: Thu, 17 Sep 2020 17:57:39 +0000
Message-ID: <570EC702-5364-437A-B74B-06FEFEFCC161@fb.com>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
 <20200916034307.2092020-7-nickrterrell@gmail.com>
 <20200916084958.GC31608@infradead.org>
 <CCDAB4AB-DE8D-4ADE-9221-02AE732CBAE2@fb.com>
 <20200916143046.GA13543@infradead.org>
 <1CAB33F1-95DB-4BC5-9023-35DD2E4E0C20@fb.com>
 <20200916144618.GB16392@infradead.org>
 <4D04D534-75BD-4B13-81B9-31B9687A6B64@fb.com>
 <b1eec667d42849f757bbd55f014739509498a59d.camel@surriel.com>
 <20200917100458.GA28031@infradead.org>
 <2073A599-E7CA-476A-9B4B-7BC76B454B9A@fb.com>
In-Reply-To: <2073A599-E7CA-476A-9B4B-7BC76B454B9A@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [98.33.101.203]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44dbdcfa-a913-477d-c5d7-08d85b332b3b
x-ms-traffictypediagnostic: BYAPR15MB2408:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB2408618C97A5153D96C91A93AB3E0@BYAPR15MB2408.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q3AsIkuPyYHiwJLLjm/bK4opOpOUKRClQ2UJUB2O0MWnbafhxb8DXLDpcLnlx8CdDU/FSePKRE0pscXMMxAadboauWK+11NOssLz/FbZArC6OktlPEL/wfyS3Htw+PErf+/xPEJIh+dCggn+ZjgQ1Pstnyys6vMQSDz9nQ7Bcb8E0hgny7wsQuw6t1Jfy50aRhodhlZz66VVOCvoDl9lxH6J2qbvaUD/nQICkmUP2pM5oxL/b7ZFrMIw5ZHSbC+y0SJvZ3YeEjCnqpXtVL+SEAq2Ru10BFtdAbklcRYkPhK9J545aV7ClEGBZElWxGMYAipAuR1iWE+kgoAclDnIMQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(366004)(136003)(346002)(6486002)(4326008)(7416002)(36756003)(54906003)(6636002)(6862004)(33656002)(6512007)(2906002)(53546011)(6506007)(76116006)(5660300002)(66446008)(66556008)(66946007)(66476007)(64756008)(2616005)(71200400001)(8936002)(37006003)(86362001)(26005)(316002)(186003)(8676002)(83380400001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Y1+KDAwGDZoc5e7VqKEPyr6Qi9GvpQVKvuAHNRNNyA2SZtIenAqfVDkx9BmmoeuY8i+ym5XuURNXUCa/Qq3YfVFZi+afoOAoobZl7ol4Lgg7/46wTluPNRnNAK/1Vc4Rx1Ny8cOf8mu0M1Uv6dbHNQY9vCMG62e/zCeDu7DHP9q+C++40ugqtAennAQ/9tDe5Nf67VyCPbWDFETQ0EV6UMnGh+9lmw1qsQWR4BavDIJY0OafPtzek/IEeoSDIQsQ2YlLDshIZSsijWStb2L0MR5MyVdbgdngERsDXKfLXYX1oNeUp9SV48Cgr9/j8YrrxALgkVH2izRrZqt8xgEt6gfc0AbkqAMqowPEd9XG5mPBRxRiDCHczeqPopjhPtA58Toz6xaWUba588uvn2Z130Nx3X2rxpSCjf4+nnkfjM7HabJxMWfVV81cdZfJYK1yEGOkTqDbzEkmhMPILlA4fqxS/iasA9CU0ZzfZJOdk3P8zjzCMcbhOkqhjUGSGuR8KJy6dlF/ys8k5PmPZKYx2E8xt6SKbrgZZ/sN7IE131JUgG+rbOdygAsna8pzzPn+iYNdgVaTyH0vLz+pWi1989cjCMkKiCs7vjToe6uXjb7wvmXMSz+BQ+qLOGea2eS0csfcCbFCmQGcMjgcATIidw==
Content-ID: <C65AFC3C2E5B0C4EAAFAD0C6F9A8CB75@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44dbdcfa-a913-477d-c5d7-08d85b332b3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 17:57:39.8493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ikXWZd9HOUavrWR+dtos4fxB2dEbyYsvHmONAlBugmuM2AHweCFU7TzwEDAG/lnX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2408
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-17_14:2020-09-16,
 2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0 mlxscore=0
 clxscore=1011 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009170133
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
X-Headers-End: 1kIyAT-00DFi4-S0
Subject: Re: [f2fs-dev] [PATCH 5/9] btrfs: zstd: Switch to the zstd-1.4.6 API
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
 Herbert Xu <herbert@gondor.apana.org.au>, Rik van Riel <riel@surriel.com>,
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 Petr Malat <oss@malat.biz>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 Btrfs BTRFS <linux-btrfs@vger.kernel.org>, Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gT24gU2VwIDE3LCAyMDIwLCBhdCA3OjI4IEFNLCBDaHJpcyBNYXNvbiA8Y2xtQGZiLmNv
bT4gd3JvdGU6DQo+IA0KPiBPbiAxNyBTZXAgMjAyMCwgYXQgNjowNCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6DQo+IA0KPj4gT24gV2VkLCBTZXAgMTYsIDIwMjAgYXQgMDk6MzU6NTFQTSAtMDQw
MCwgUmlrIHZhbiBSaWVsIHdyb3RlOg0KPj4+PiBPbmUgcG9zc2liaWxpdHkgaXMgdG8gaGF2ZSBh
IGtlcm5lbCB3cmFwcGVyIG9uIHRvcCBvZiB0aGUgenN0ZCBBUEkgdG8NCj4+Pj4gbWFrZSBpdA0K
Pj4+PiBtb3JlIGVyZ29ub21pYy4gSSBwZXJzb25hbGx5IGRvbj8/P3QgcmVhbGx5IHNlZSB0aGUg
dmFsdWUgaW4gaXQsIHNpbmNlDQo+Pj4+IGl0IGFkZHMNCj4+Pj4gYW5vdGhlciBsYXllciBvZiBp
bmRpcmVjdGlvbiBiZXR3ZWVuIHpzdGQgYW5kIHRoZSBjYWxsZXIsIGJ1dCBpdA0KPj4+PiBjb3Vs
ZCBiZSBkb25lLg0KPj4+IA0KPj4+IFpzdGQgd291bGQgbm90IGJlIHRoZSBmaXJzdCBwYXJ0IG9m
IHRoZSBrZXJuZWwgdG8NCj4+PiBjb21lIGZyb20gc29tZXdoZXJlIGVsc2UsIGFuZCBoYXZlIHdy
YXBwZXJzIHdoZW4NCj4+PiBpdCBnZXRzIGludGVncmF0ZWQgaW50byB0aGUga2VybmVsLiBUaGVy
ZSBjZXJ0YWlubHkNCj4+PiBpcyBwcmVjZWRlbmNlIHRoZXJlLg0KPj4+IA0KPj4+IEl0IHdvdWxk
IGJlIGludGVyZXN0aW5nIHRvIGtub3cgd2hhdCBDaHJpc3RvcGgncw0KPj4+IHByZWZlcmVuY2Ug
aXMuDQo+PiANCj4+IFllcywgSSB0aGluayBrZXJuZWwgd3JhcHBlcnMgd291bGQgYmUgYSBwcmV0
dHkgc2Vuc2libGUgc3RlcCBmb3J3YXJkLg0KPj4gVGhhdCBhbHNvIGF2b2lkIHRoZSBuZWVkIHRv
IGRvIHN0cmFuZ2UgdXBncmFkZXMgdG8gYSBuZXcgdmVyc2lvbiwNCj4+IGFuZCBpbnN0ZWFkIHdl
IGNhbiBqdXN0IGNoYW5nZSBBUElzIG9uIGEgYXMtbmVlZGVkIGJhc2lzLg0KPiANCj4gV2hlbiB3
ZSBhZGQgd3JhcHBlcnMsIHdlIGVuZCB1cCBjcmVhdGluZyBhIGtlcm5lbCBzcGVjaWZpYyBBUEkg
dGhhdCBkb2VzbuKAmXQgbWF0Y2ggdGhlIHVwc3RyZWFtIHpzdGQgZG9jcywgYW5kIGl0IGRvZXNu
4oCZdCBsZXZlcmFnZSBhcyBtdWNoIG9mIHRoZSB6c3RkIGZ1enppbmcgYW5kIHRlc3RpbmcuDQo+
IA0KPiBTbyB3ZeKAmXJlIGFjdHVhbGx5IG1ha2luZyBrZXJuZWwgenN0ZCBzbGlnaHRseSBsZXNz
IHVzYWJsZSBpbiBob3BlcyB0aGF0IG91ciBrZXJuZWwgc3BlY2lmaWMgcGFydCBvZiB0aGUgQVBJ
IGlzIGZhbWlsaWFyIGVub3VnaCB0byB1cyB0aGF0IGl0IG1ha2VzIHpzdGQgbW9yZSB1c2FibGUu
ICBUaGVyZeKAmXMgbm8gd2F5IHRvIGNvbXBhcmUgdGhlIHR3byB1bnRpbCB0aGUgd3JhcHBlcnMg
YXJlIGRvbmUsIGJ1dCBnaXZlbiB0aGUgY29kZSB0b2RheSBJ4oCZZCBwcmVmZXIgdGhhdCB3ZSBm
b2N1cyBvbiBtYWtpbmcgaXQgcmVhbGx5IGVhc3kgdG8gdHJhY2sgdXBzdHJlYW0uICBJIHJlYWxs
eSB1bmRlcnN0YW5kIENocmlzdG9waOKAmXMgc2lkZSBoZXJlLCBidXQgSeKAmWQgcmF0aGVyIHJp
ZGUgYSBjYW1lbCB3aXRoIHRoZSBncm91cCB0aGFuIGdvIGl0IGFsb25lLg0KPiANCj4gSeKAmWQg
YWxzbyBtdWNoIHJhdGhlciBzcGVuZCB0aW1lIG9uIGFueSBwcm9ibGVtcyB3aGVyZSB0aGUgc3Ry
dWN0dXJlIG9mIHRoZSB6c3RkIEFQSXMgZG9u4oCZdCBmaXQgdGhlIGtlcm5lbOKAmXMgbmVlZHMu
ICBUaGUgYnRyZnMgc3RyZWFtaW5nIGNvbXByZXNzaW9uL2RlY29tcHJlc3Npb24gbG9va3MgcHJl
dHR5IGNsZWFuIHRvIG1lLCBidXQgSSB0aGluayBKb2hhbm5lcyBtZW50aW9uZWQgc29tZSBwb3Nz
aWJpbGl0aWVzIHRvIGltcHJvdmUgdGhpbmdzIGZvciB6c3dhcCAob3B0aW1pemF0aW9ucyBmb3Ig
cGFnZS1hdC1hdGltZSkuICBJZiB0aGVyZSBhcmUgcGxhY2VzIHdoZXJlIHRoZSB6c3RkIG1lbW9y
eSBtYW5hZ2VtZW50IG9yIGVycm9yIGhhbmRsaW5nIGRvbuKAmXQgZml0IG5hdHVyYWxseSBpbnRv
IHRoZSBrZXJuZWwsIHRoYXQgd291bGQgYWxzbyBiZSBoaWdoZXIgb24gbXkgbGlzdC4NCg0KVGhp
cyB1cGRhdGUgaW5jbHVkZXMgdGhlIHJlY2VudCBvcHRpbWl6YXRpb25zIGZvciBaU3dhcCB0aGF0
IEkndmUgbWFkZSwgd2hpY2gNCmdpdmVzIGEgMzAlIHNwZWVkIGJvb3N0IGZvciBwYWdlLWF0LWEt
dGltZSBkZWNvbXByZXNzaW9uLg0KDQpXZSdyZSB2ZXJ5IG9wZW4gdG8gaW1wcm92aW5nIGFuZCBj
aGFuZ2luZyB6c3RkIHRvIGJldHRlciBmaXQgdGhlIG5lZWRzIG9mIHRoZQ0Ka2VybmVsLiBJZiB0
aGVyZSBhcmUgdXNlIGNhc2VzIHRoYXQgY2FuJ3QgdXNlIHRoZSBleGlzdGluZyBBUEksIG9yIHRo
ZSBleGlzdGluZw0KQVBJIGlzbid0IG9wdGltYWwsIG9yIGFueSBvdGhlciBwcm9ibGVtcywgd2Xi
gJlyZSBoYXBweSB0byBoZWxwIGZpZ3VyZSBvdXQgdGhlDQpiZXN0IHNvbHV0aW9uLiBPcGVuaW5n
IGFuIGlzc3VlIG9uIG91ciB1cHN0cmVhbSBHaXRIdWIgcmVwbyBpcyB0aGUgYmVzdCB3YXkgdG8N
CmdldCBvdXIgYXR0ZW50aW9uDQoNCi1OaWNrDQoNCj4gRml4aW5nIHRob3NlIGFyZSBwcm9iYWJs
eSBnb2luZyB0byBiZSBtdWNoIGVhc2llciBpZiB3ZeKAmXJlIGNsb3NlIHRvIHRoZSB6c3RkIHVw
c3RyZWFtLCBhZ2FpbiBzbyB0aGF0IHdlIGNhbiBsZXZlcmFnZSB0ZXN0aW5nIGFuZCBsb25nIHRl
cm0gY29kZSBtYWludGVuYW5jZSBkb25lIHRoZXJlLg0KPiANCj4gLWNocmlzDQoNCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
