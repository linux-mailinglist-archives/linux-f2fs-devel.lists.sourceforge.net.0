Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F5D2ADFB1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Nov 2020 20:33:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ud8P9qRFIBGlKf2SaHoIs7Ja9J/xYhxM4wJ5cOGSkZs=; b=KcsKGj+v+RwWIU/sLtvHaYh1B
	wo+KYW8hRUh7ST3IkIS1cVjhqDOO3870kPtw09X34dFn0h5wvspRBdLARCu0vYeBcZ72b6Ovv5Nzd
	sn1zk9vVD+qGCz3UI/3YkLyJBD41BVCLogS6s15mFp+MBK+5wIQA4oiYbuupy+vHBjGmY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kcZOv-0008P0-Rg; Tue, 10 Nov 2020 19:33:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=858386c724=terrelln@fb.com>)
 id 1kcZOu-0008Om-As; Tue, 10 Nov 2020 19:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uaz/mtuB5YSDLnqFNh6dwah52s15dsUA8sqtw61ALsI=; b=K0NbcI2WJO5KvLw8SQkI71rknU
 mtvqtKHsQuNe39IkZgw74MannTWspuQi9zMqf7Pbs9dfnAzlLRZnEtOPDoPHGzEGT/iqy3ikGtOpP
 oml5fJ1B0uisPMhLeTUFvXEqsM96uB3rOIkeNl1Aes9BTeZjUXkMCzG2QaWdBjzuy/rc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uaz/mtuB5YSDLnqFNh6dwah52s15dsUA8sqtw61ALsI=; b=ItKhOEBnbjGE2Uio9wmSYKDJBb
 C8vwSt0b9lwyVS8JM/uAhndD46GJMXcA99g+NopjgzjoelIb6Q+th1efI/20yv2YXUbp4Q/6Fpevj
 /KeO7LRRekgt9WQ/F5j7wpBeolAktWiHL55Saa3IfclqZhTXK/JcEc2fx8B6Or8zSies=;
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kcZOp-00FtNx-Fr; Tue, 10 Nov 2020 19:33:56 +0000
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AAJXKKS000538; Tue, 10 Nov 2020 11:33:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=uaz/mtuB5YSDLnqFNh6dwah52s15dsUA8sqtw61ALsI=;
 b=mmdfZw8yiCBAmSQbZu0SXNO8L4bSxmDGWPakGJKcyRdylzf0tiilhXuazNblmm8pGVuU
 aMFlQTArfUUW79GPgEpHjMb//eiiEYz++GNDtWuvgK6MH8+4OqV68EEtTXW5rbR6Stc3
 Ykq6acKltiMhILTa5014tn1td7ybwF2cu7U= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 34pcqscpfy-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Nov 2020 11:33:38 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 10 Nov 2020 11:33:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEn3Oz20vQ0H56JmOVuVt+Q7bSRBc5c2It+azXX1Qo0noVMLXD8diQbvTI3ty1eACwBLPaRvNxVZOp7zdRkQXPllJa7r94fIdVRAetd6qhvDGO62swEvA/kmHi0dSbYKaFdCNzqPXXOFn+bmcc+LMj1aVu3mplvzTNBcpwfDly6hhBNr+iev+VLO0205u/FOFG1ui2woBpLoo40gGn9bYaT3nxKMouDjmm8tJrPYR+GW47lGF8OddSTpCEo8vJTyjsd98Cati3gdTQMmwyQNm2vyR5kzzMACwlLWJm7lkPF8IxHsxsqs1mq0a7sJemAEIYe85eNcMY+zyV67S9xArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaz/mtuB5YSDLnqFNh6dwah52s15dsUA8sqtw61ALsI=;
 b=Vg1DLvVcNAELhigrPQ3CrQ1K0SWG6xytmg8O7KpO0CH7BoIX2tif/XtqwpEmhANzzuSAR5MALnWMg+OBSv5gxMCv+yjahzmAr1Z+UDztAZTkqPJjs9h1M1uK7Bow3Pvh63v8gggi6vNVAPHWmCgmi+fIZdQtG/o0kwtlaMXNWBkWJVZL9dTaZxlN45xl8j9ZwIW5EbRtT7YH4AAaYplvcjRibRj5G9waLU1gAUd7qhXXrTwEOQiAFnwOErkV4xFcXPMASao5dZXfu2Abce00cTbOq+YCkQpz02X9v6GdHunkXGw7USpTrFNN7rUt6IoLtrBe8SG+TiByZBm2yIq2dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaz/mtuB5YSDLnqFNh6dwah52s15dsUA8sqtw61ALsI=;
 b=c1a0iZ0nkkRDGOVGlyNj117Y3+KJlnJH0ZK82WIdGC+NckGRetwMde9F/9to6d4ilsYXaggiM/FclbOVXNLSTNxCeEaYZ/ep7fskoIIeA8utUNyvAg1yppRJPy0N6FKxopOxiOhGlxmnxzOmoQjh4GeTsHeNBTvMX2fei5nrHdw=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Tue, 10 Nov
 2020 19:33:30 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::17e:aa61:eb50:290c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::17e:aa61:eb50:290c%7]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 19:33:30 +0000
To: "dsterba@suse.cz" <dsterba@suse.cz>
Thread-Topic: [PATCH v5 1/9] lib: zstd: Add zstd compatibility wrapper
Thread-Index: AQHWsabb1Jdg9cQzfUKQ7VkOPnEyX6m7dNAAgAS9ZoCAAVX7gIAARTyA
Date: Tue, 10 Nov 2020 19:33:30 +0000
Message-ID: <B1AF526E-A34C-4CA1-B4CA-2DC5C5934C15@fb.com>
References: <20201103060535.8460-1-nickrterrell@gmail.com>
 <20201103060535.8460-2-nickrterrell@gmail.com>
 <20201106183846.GA28005@infradead.org>
 <D9338FE4-1518-4C7B-8C23-DBDC542DAC35@fb.com>
 <20201110152541.GK6756@twin.jikos.cz>
In-Reply-To: <20201110152541.GK6756@twin.jikos.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fb.com;
x-originating-ip: [98.33.101.203]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d94bc3da-4844-48d3-e603-08d885af8125
x-ms-traffictypediagnostic: BYAPR15MB2374:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB2374DE9C7E48372D9E9D6B76ABE90@BYAPR15MB2374.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v4rMlba/pi7SFURWle8e4fnG7zAW30Om58QIZFUVlr5jyIyUj/kFve3AXyQqu6L1Yg7FBjNNMMTO9e5ZmfBLuFIdGUaISZ4HEcbhWH/2IR1Skv1TKhzz8lsXas96uBRytAERlg9Z0lSLDetf/rlGbBUZLXdMS304GIKRICPIKpm3dAFhlR+RUSR/1ldoif14n1yKX8g+ewewclMd56wwEMW1wDnWdKCDbRfZ8BhTS2b+3FgrW+Z3FD1IEni+65LIu7FfNOaGhq1SUOX+Sjn4rZa3kkp8UiaPSHdjxMEEzRtSboEC/zz0ZKQ5/zKt6X7DtKKH/oMm2xA8jTcSrLhN9FUCB++xILy5X37QAoKxnI9+ZRx47W2Xe+/Q/G/Oq9Yr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(396003)(39860400002)(346002)(53546011)(66556008)(6506007)(8676002)(36756003)(54906003)(4326008)(86362001)(6512007)(6486002)(7416002)(5660300002)(316002)(2616005)(8936002)(478600001)(26005)(83380400001)(76116006)(33656002)(66946007)(66476007)(66446008)(6916009)(64756008)(186003)(2906002)(71200400001)(60764002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: wlre+IIG0yzCjIG5VyRD9ihvXxLG2vBfqObWiDPScuphAgKepLzMDhg2fj6ZlUtzltxDZRMQ2Z9ZxHSSlJ/Tv5EkRd7Z6LCQJZFEGYpiTkE7GHlyLM8XTPIpVAcdJmtXPr7EadedAQi8NsBm4l8jw6alMOIJTmrVgrXv6l0QEOj1n7mS9kMKOuSTFOedFvAiUVrx7UWh3ZmjerEdN8AUI9hmtxbqblDe/lDPhUF/ihc6eaqskKlPY/t4VWbdZDXBg1EMIJtuCGDMdIeriFG/7SsovOYDFdGvEv0B3skdSgGt1GxIBa4jw8Nz4apxHKHdTAsgbj6ooKKA/N4PFgHsHs0XRi1EVhfF6XPr8XEwhvpMxjzlXYCbzqEgRBiLJeqOKVT8o1TKaFE3yQ82UIz2j1s4J2u/m6PUswMZ/Slx7ONt7f+ss5lNmBnjcFQlQIjplx9jZaKfeGTdah0O9gQqzctcaGISgOTs0xyuWxaKGwOSsQ0yeWkctXH/jgHuBcwV5kXbXJx6f2OgM7ZZSB/JLmzXZIl8C68wHUZROV5ebFHnqBf/eFvX0qBwqhrkzFqEFRJty+Lnr6ToOQKFBILAAnBc6OSU0GB+B/ZNGf+Uq38JwusUKodTOK5RbmMWIQ8gZXMg+H6SKpz9/b5H2z21SA==
Content-ID: <81E1BFD4B0B77341822F96D8C91515F6@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d94bc3da-4844-48d3-e603-08d885af8125
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2020 19:33:30.4021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vpV0yqLB7JWT2Dr/uAbMDVS6emHHnPO/6dG+6Eom8uLlTV+Th2atdCaULDdzwqKV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2374
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-10_07:2020-11-10,
 2020-11-10 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011100134
X-FB-Internal: deliver
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
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
X-Headers-End: 1kcZOp-00FtNx-Fr
Subject: Re: [f2fs-dev] [PATCH v5 1/9] lib: zstd: Add zstd compatibility
 wrapper
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
 Herbert Xu <herbert@gondor.apana.org.au>, Nick
 Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 Petr Malat <oss@malat.biz>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Christoph Hellwig <hch@infradead.org>, Chris Mason <clm@fb.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBPbiBOb3YgMTAsIDIwMjAsIGF0IDc6MjUgQU0sIERhdmlkIFN0ZXJiYSA8ZHN0ZXJiYUBzdXNl
LmN6PiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgTm92IDA5LCAyMDIwIGF0IDAyOjAxOjQxUE0gLTA1
MDAsIENocmlzIE1hc29uIHdyb3RlOg0KPj4gT24gNiBOb3YgMjAyMCwgYXQgMTM6MzgsIENocmlz
dG9waCBIZWxsd2lnIHdyb3RlOg0KPj4+IFlvdSBqdXN0IGtlZXAgcmVzZWRuaW5nIHRoaXMgY3Jh
cCwgZG9uJ3QgeW91PyAgSGF2ZW4ndCB5b3UgYmVlbiB0b2xkDQo+Pj4gbXVsdGlwbGUgdGltZXMg
dG8gcHJvdmlkZSBhIHByb3BlciBrZXJuZWwgQVBJIGJ5IG5vdz8NCj4+IA0KPj4gWW91IGRvIGNv
bnNpc3RlbnRseSBhc2sgZm9yIGEgc2hpbSBsYXllciwgYnV0IHlvdSBoYXZlbuKAmXQgZXhwbGFp
bmVkIA0KPj4gd2hhdCB3ZSBnYWluIGJ5IGRpdmVyZ2luZyBmcm9tIHRoZSBkb2N1bWVudGVkIGFu
ZCB0ZXN0ZWQgQVBJIG9mIHRoZSANCj4+IHVwc3RyZWFtIHpzdGQgcHJvamVjdC4gIEl04oCZcyBh
biBpbXBvcnRhbnQgZGlzY3Vzc2lvbiBnaXZlbiB0aGF0IHdlIA0KPj4gaG9wZSB0byByZWd1bGFy
bHkgdXBkYXRlIHRoZSBrZXJuZWwgc2lkZSBhcyB0aGV5IG1ha2UgaW1wcm92ZW1lbnRzIGluIA0K
Pj4genN0ZC4NCj4+IA0KPj4gVGhlIG9ubHkgYmVuZWZpdCBkZXNjcmliZWQgc28gZmFyIHNlZW1z
IHRvIGJlIGNhbWVsY2FzZSByZWxhdGVkLCBidXQgaWYgDQo+PiB0aGVyZSBhcmUgcHJvYmxlbXMg
aW4gdGhlIEFQSSBiZXlvbmQgdGhhdCwgSSBoYXZlbuKAmXQgc2VlbiB5b3UgZGVzY3JpYmUgDQo+
PiB0aGVtLiAgSSBkb27igJl0IHRoaW5rIHRoZSBjYW1lbGNhc2UgYWxvbmUganVzdGlmaWVzIHRo
ZSBhZGRlZCBjb3N0cyBvZiANCj4+IHRoZSBzaGltLg0KPiANCj4gVGhlIEFQSSBjaGFuZ2UgaW4g
dGhpcyBwYXRjaHNldCBpcyBhZGRpbmcgY2h1cm4gdGhhdCB3b3VsZG4ndCBiZQ0KPiBuZWNlc3Nh
cnkgaWYgdGhlcmUgd2VyZSBhbiB1cHN0cmVhbTwtPmtlcm5lbCBBUEkgZnJvbSB0aGUgYmVnaW5u
aW5nLg0KPiANCj4gVGhlIHBhdGNoIDUvOSBpcyBhbG1vc3QgZW50aXJlbHkgcmVuYW1pbmcganVz
dCBzb21lIGludGVybmFsIGlkZW50aWZpZXJzDQo+IA0KPiAtCQkJICAgICAgWlNURF9DU3RyZWFt
V29ya3NwYWNlQm91bmQocGFyYW1zLmNQYXJhbXMpLA0KPiAtCQkJICAgICAgWlNURF9EU3RyZWFt
V29ya3NwYWNlQm91bmQoWlNURF9CVFJGU19NQVhfSU5QVVQpKTsNCj4gKwkJCSAgICAgIFpTVERf
ZXN0aW1hdGVDU3RyZWFtU2l6ZV91c2luZ0NQYXJhbXMocGFyYW1zLmNQYXJhbXMpLA0KPiArCQkJ
ICAgICAgWlNURF9lc3RpbWF0ZURTdHJlYW1TaXplKFpTVERfQlRSRlNfTUFYX0lOUFVUKSk7DQo+
IA0KPiBwbHVzIHVwZGF0aW5nIHRoZSBuYW1lcyBpbiB0aGUgZXJyb3Igc3RyaW5ncy4gVGhlIGNv
bXByZXNzaW9uIEFQSSB0aGF0DQo+IGZpbGVzeXN0ZW1zIG5lZWQgaXMgc2ltcGxlOg0KPiANCj4g
LSBzZXQgdXAgd29ya3NwYWNlIGFuZCBwYXJhbWV0ZXJzDQo+IC0gY29tcHJlc3MgYnVmZmVyDQo+
IC0gZGVjb21wcmVzcyBidWZmZXINCj4gDQo+IFdlIHJlYWxseSBzaG91bGQgbm90IGNhcmUgaWYg
dXBzdHJlYW0gaGFzIDMgZnVuY3Rpb25zIGZvciBpbml0aWFsaXppbmcNCj4gc3RyZWFtIChaU1RE
X2luaXRDU3RyZWFtL1pTVERfaW5pdFN0YXRpY0NTdHJlYW0vWlNURF9pbml0Q1N0cmVhbV9hZHZh
bmNlZCksDQo+IG9yIGlmIHRoZSBuYW1lIGNoYW5nZXMgYWdhaW4gaW4gdGhlIGZ1dHVyZS4NCg0K
VXBzdHJlYW0gd2lsbCBub3QgY2hhbmdlIHRoZXNlIGZ1bmN0aW9uIG5hbWVzLiBXZSBndWFyYW50
ZWUgdGhlIHN0YWJsZQ0KcG9ydGlvbiBvZiBvdXIgQVBJIGhhcyBhIGZpeGVkIEFCSS4gVGhlIHVu
c3RhYmxlIHBvcnRpb24gZG9lc27igJl0IG1ha2UgdGhpcw0KZ3VhcmFudGVlLCBidXQgd2UgZ3Vh
cmFudGVlIG5ldmVyIHRvIGNoYW5nZSBmdW5jdGlvbiBzZW1hbnRpY3MgaW4gYW4NCmluY29tcGF0
aWJsZSB3YXksIGFuZCB0byBwcm92aWRlIGxvbmcgZGVwcmVjYXRpb24gcGVyaW9kcyAoeWVhcnMp
IHdoZW4gd2UNCmRlbGV0ZSBmdW5jdGlvbnMuDQoNCkZvciByZWZlcmVuY2UsIHRoZSBvbmx5IGZ1
bmN0aW9ucyB3ZeKAmXZlIGRlbGV0ZWQvbW9kaWZpZWQgc2luY2UgdjEuMC4wIHdoZW4gd2UNCnN0
YWJpbGl6ZWQgdGhlIHpzdGQgZm9ybWF0IDQgeWVhcnMgYWdvIGFyZSBhbiBvbGQgc3RyZWFtaW5n
IEFQSSB0aGF0IHdhcw0KZGVwcmVjYXRlZCBiZWZvcmUgdjEuMC4wLiBXZeKAmXZlIGFkZGVkIG5l
dyBmdW5jdGlvbnMsIGFuZCBwcm92aWRlZCBuZXcNCnJlY29tbWVuZGVkIHdheXMgdG8gdXNlIG91
ciBBUEkgdGhhdCB3ZSB0aGluayBhcmUgYmV0dGVyLiBCdXQsIHdlIGhpZ2hseQ0KdmFsdWUgbm90
IGJyZWFraW5nIG91ciB1c2VycyBjb2RlLCBzbyBhbGwgdGhlIG9sZGVyIEFQSXMgYXJlIHN0aWxs
IHN1cHBvcnRlZC4NCg0KVGhpcyBjaHVybiBpcyBjYXVzZWQgYmVjYXVzZSB0aGUgY3VycmVudCB2
ZXJzaW9uIG9mIHpzdGQgaW5zaWRlIHRoZSBrZXJuZWwgaXMNCm5vdCB1cHN0cmVhbSB6c3RkLiBB
dCB0aGUgdGltZSBvZiBpbnRlZ3JhdGlvbiB1cHN0cmVhbSB6c3RkIHdhc27igJl0IHJlYWR5IHRv
DQpiZSB1c2VkIGFzLWlzIGluIHRoZSBrZXJuZWwuIFdoZW4gSSBpbnRlZ3JhdGVkIHpzdGQgaW50
byB0aGUga2VybmVsLCBJIHNob3VsZOKAmXZlDQpkb25lIG1vcmUgd29yayB0byB1c2UgdXBzdHJl
YW0gYXMtaXMuIEl0IHdhcyBhIG1pc3Rha2UgdGhhdCBJIHdvdWxkIGxpa2UgdG8NCmNvcnJlY3Qs
IHNvIHRoZSBrZXJuZWwgY2FuIGJlbmVmaXQgZnJvbSB0aGUgc2lnbmlmaWNhbnQgcGVyZm9ybWFu
Y2UNCmltcHJvdmVtZW50cyB0aGF0IHVwc3RyZWFtIGhhcyBtYWRlIGluIHRoZSBsYXN0IGZldyB5
ZWFycy4NCg0KPiBUaGlzIHNob3VsZCBub3QgcmVxdWlyZSBleHBsaWNpdCBleHBsYW5hdGlvbiwg
dGhpcyBzaG91bGQgYmUgYSBuYXR1cmFsDQo+IHJlcXVpcmVtZW50IGVzcGVjaWFsbHkgZm9yIHNl
cGFyYXRlIHByb2plY3RzIHRoYXQgZG9uJ3Qgc2hhcmUgdGhlIHNhbWUNCj4gY29kaW5nIHN0eWxl
IGJ1dCBoYXZlIHRvIGJlIGludGVncmF0ZWQgaW4gc29tZSB3YXkuDQoNCknigJltIG5vdCBjb21w
bGV0ZWx5IGFnYWluc3QgcHJvdmlkaW5nIGEga2VybmVsIHNoaW0uIFBlcnNvbmFsbHksIEkgZG9u
4oCZdCBiZWxpZXZlDQppdCBwcm92aWRlcyBtdWNoIGJlbmVmaXQuIEJ1dCBpZiB0aGUgY29uc2Vu
c3VzIG9mIGtlcm5lbCBkZXZlbG9wZXJzIGlzIHRoYXQgYQ0Kc2hpbSBwcm92aWRlcyBhIGJldHRl
ciBBUEksIHRoZW4gSeKAmW0gaGFwcHkgdG8gcHJvdmlkZSBpdC4gU28gZmFyLCBJIGhhdmVu4oCZ
dCBzZWVuDQphIGNsZWFyIGNvbnNlbnN1cyBlaXRoZXIgd2F5LiBUaGF0IGxlYXZlcyBtZSBraW5k
IG9mIHN0dWNrLg0KDQpCZXN0LA0KTmljaw0KDQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
