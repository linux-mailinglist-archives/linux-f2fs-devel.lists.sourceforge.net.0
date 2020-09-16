Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4C326E1DF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Sep 2020 19:10:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4jkhfKUe/KWMBXHfXpMWAgiZIm+SwD/u07ucJj7wzsw=; b=TALSUUNly5D/C0EWLyt3q1CmH
	8lEMmvHSiKiWm4t5e+LvXefbloOo1NkGBdeuwiW6bU9p+vQPLiqtAfJlO5lYONnLYf4kBU1CRlU1F
	XucO7YSmQUwWiaX0IowjDHYZXGvipV55sEdI/SG+zETAMKrs+HgMSoLXY2quUjpdYgtBY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIxQs-0007uY-Uf; Thu, 17 Sep 2020 17:10:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <terrelln@fb.com>)
 id 1kIxQq-0007uE-Sh; Thu, 17 Sep 2020 17:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=jhkYHempZjXAw3MgROvK6a5Mie+OU1zr/pCMm70s3k0=; b=RV7CJZctEB9gvBWKQdY0x0inOE
 gPoPhePFcsD/w3mkNBwa0ZRY5HEXpNGHMYh0FYLq97QaNTWSE6WgraQR7pWsLaFSCRtdrpll741jZ
 T6Vic1CKuxRm37E/xS93Vds9Edv2szvg/cX83mkPya/a6Ls/Q1QJlTv0iOuSurgpfCzw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Content-ID:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jhkYHempZjXAw3MgROvK6a5Mie+OU1zr/pCMm70s3k0=; b=C8HvPrmOGDGSjBYQA5bbMj0VyF
 yoHoE3zs29f7E0A7kOryCutD3kyOvfkC4t3b82IbikJLzQrwo6ERuxpGyq8EaOJxIHyzagf212mHU
 g1Oo9lNdfj7yY0HOLOxnydabuk/uz338VxTyjHGP0JhxUoULgc2YIYaIM05FVNPqWlwo=;
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIxQl-00EPS3-B6; Thu, 17 Sep 2020 17:10:52 +0000
Received: from pps.filterd (m0042983.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08HH8qHd010518; Thu, 17 Sep 2020 10:10:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-id : mime-version
 : content-type : content-transfer-encoding; s=facebook;
 bh=jhkYHempZjXAw3MgROvK6a5Mie+OU1zr/pCMm70s3k0=;
 b=E8eSrsAelmvCEeCrzIBnfaU2t2uCnemQZi6DtM8T/b4rqLuwcTTR943n6g26WxzD0gTI
 U+5bTJdUpH9Q/LQZKNNxktMCOcAk/Jka8XLkEevweAkwZPJHV8k5pN0CG7PLZuUx5tzT
 g2jLYyRQY4j/SFt9FnEL/pSw6SI9n+IWoSY= 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-00082601.pphosted.com with ESMTP id 33m9wg9bsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 10:10:27 -0700
Received: from pps.reinject (m0042983.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08HHAAor016672;
 Thu, 17 Sep 2020 10:10:26 -0700
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33k5pkwtjt-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Sep 2020 13:21:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 16 Sep 2020 13:21:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKaOk3vuByV2S5uzqhJNkh4sRggetPymYFJEK77G8/vefsVnAt9rXCzboG3Pr2Ix71MzdxzrlDiCTawGeqCOOpDcP3PfnW5I2a/I5LL2e8m6SRGmns8Vq0K40qLbWE8kAkftPNkXX3wA4IzRvOfwxhVb/4YdYxrA61QPR2K1yyUeaW8kS+Ncu4uN0Qu/IMSWpcSUDIOjgjm6yAOsME+n1Tt87Yefv7wYed0vDs8e/EykCBRLNKnr/TL94pbsZwpYZgDFWMlbUJG4tTdpSFdrwgWaKncwMQ6V1kkdPBOEx+3YQhuiuvNZpVfE+brB42w5/9SoSNY8/5sIDHdb3YsZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhkYHempZjXAw3MgROvK6a5Mie+OU1zr/pCMm70s3k0=;
 b=KoZdKZgvVA4HAjNbBv6E+Kaw8UZfWm3uxBF2Kl0vpEtCkQaUWci0KXRKAOq1dQjfqk64EGvjdMlo/W7bL3b6WmJqWveMW/OLWVfUUw6zDFiNLLjRKuZ8THFVdbPAJQeCntp6UL/YTIa9VyatqpNT400PaBS3Psl4RZ3ksZN2G+mZfYtX3XeMH5ihiF+dgv3RAwUaw3rzIVyEWKu6TeUHEdiC+k2tJ/1kfq5op1lL3RR7+m625hjHwkWQu0PdDx2wVXLhPdSdE9p3A7j0HCN/hegtOpmox1jx/gRKBpJN2fuYpw74Mng/NBcTyHRCZgirVJGbd0ApG/tTBrdeCGMoRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhkYHempZjXAw3MgROvK6a5Mie+OU1zr/pCMm70s3k0=;
 b=Sx5tousof3cf3eK8tcHlgAQhkSHIDDHD1MpQ8+KdExhzQ4ujRopkhymmZ1zO4qFFZTtjbveHKJQr56vRamEoN1fxbcE7+W6SSa3RIbZFfGUyMX+Yk6y9xvkvCbuHZXIRpZgvr8zJnU2Pe2yQVxyvv/HCbYCA3lEGyKf71JiHyCk=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB4086.namprd15.prod.outlook.com (2603:10b6:a02:ca::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 16 Sep
 2020 20:21:36 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 20:21:36 +0000
To: Christoph Hellwig <hch@infradead.org>
Thread-Topic: [PATCH 1/9] lib: zstd: Add zstd compatibility wrapper
Thread-Index: AQHWi9sZhTVseS1LHECS28ti8NfFc6lq9JWAgADBpgA=
Date: Wed, 16 Sep 2020 20:21:35 +0000
Message-ID: <A52F606A-609E-4A69-93C8-CBDC77E2B264@fb.com>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
 <20200916034307.2092020-2-nickrterrell@gmail.com>
 <20200916084829.GA31608@infradead.org>
In-Reply-To: <20200916084829.GA31608@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:d83f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcec33f6-e09a-4b08-e24e-08d85a7e1c5c
x-ms-traffictypediagnostic: BYAPR15MB4086:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB40862F780E7230F04C5CA8BAAB210@BYAPR15MB4086.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lL8CeCERpUe0Vzk0Oy6Rym/gTotneLIS9xnFwOviSEXke9ZxUHkjKBeCAdDL37DHaOEO4B1WSRndyhd8ZzQiKa8W7cITxUXV6gE8+9T30JY+VS6OW7b6VpQGP5SfqOryl3knqD9SBg/dvzrUyfNhm1ttApIskjuEG8NVVIYv7Acs0Ug8Nwe5Zw4ejuC7MpV1pHwF8WMyGbIC7ZNAOaLvCdxQOxkF7x5DouTkjx2s2SWvmONi4Zh8MqBfOIUKHFfeeJ8hqxKbKPDYhY6ZQHiHJ5TZbEMD8XwkFCTNPiyXCJwkHJC8KzPpQvBIVkE++fz7K8xxonx7vuqpg8hy3aHWmw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(346002)(39860400002)(366004)(54906003)(36756003)(2906002)(76116006)(71200400001)(64756008)(66476007)(53546011)(8676002)(91956017)(5660300002)(83380400001)(66446008)(66946007)(66556008)(186003)(4326008)(86362001)(6506007)(6512007)(6486002)(316002)(478600001)(33656002)(8936002)(2616005)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 4eUx/e7Aixkba5Rjh055MM0RRnnbgVx7It+FlfdGcd07eJZ4KrAc5gJKXJSQFYHnuCoCpWoic5c7ay2HEhlPrpABUKOA+Mn6k7fqFmd3gehM0bb8B0XHKx3ZbYaiVGB2jzZFhJ2edBQecoBVgRcGGc9tG5EQSgfCjZzmVVpPBCwlkeWQA66Ehs6//UWC4ii+KKBAi6TETHhRMkVFIE//n1r9+GbQwBbX3XtIouNjXp+XEVeNRHBTKYZ7EnoeqdKNHNF6qmY5VvZfrbFiJQ64EzQ7+/uYc8QBoAlh+YgFfUkQfKUWgPeamspHs1HKXZprZJ4w2vbqzPqMGDM1GZArdbJMbAm/CCcqBBiACjIqLcMuR88UXrj5h4Qkxm68XMIEn8b+zNRqc2ULMXyzc7bnO2BrvuTgwGHBfpF+nkEeFFjVuWC13rG99U2eoGnjB/5hIrIEc8WWFvSxV0rS2t28oc9UhNGpPtLJiGY9aWQOL8OobYXLavbUxlHgd3phHeryuRkLt+kWtezHN/6tYiWMcgTMHsWDOtcC/fJswrWeRSknS1iyDBHXf31bGvR3MUN8FA9iom9kKh2L30kHk6dmaChqTJ6sWRsuG6XQ1hkoYzcbqLyZrdxjIA3bYCtwXuTbjkrJMqdxxlOaiZHlyeF+/IRBO/vreFOWeq02aFqc/WKMMBW6fiNe8OJ6Xulj3bX6
Content-ID: <AF3548C0174E7F4EBF7F76F961CCFF1F@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcec33f6-e09a-4b08-e24e-08d85a7e1c5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 20:21:35.8515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MCmqNv96km+Bx3BZ2354nIc7gC6s5MkzLlePHFckPen3mcQOrB/RJ5sm75xDfBGp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB4086
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_12:2020-09-16,
 2020-09-16 signatures=0
X-FB-Internal: deliver
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-17_12:2020-09-16,
 2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 spamscore=0
 mlxlogscore=810 mlxscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=2
 engine=8.12.0-2006250000 definitions=main-2009170128
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
X-Headers-End: 1kIxQl-00EPS3-B6
Subject: Re: [f2fs-dev] [PATCH 1/9] lib: zstd: Add zstd compatibility wrapper
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
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 Btrfs BTRFS <linux-btrfs@vger.kernel.org>, Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gT24gU2VwIDE2LCAyMDIwLCBhdCAxOjQ4IEFNLCBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGluZnJhZGVhZC5vcmc+IHdyb3RlOg0KPiANCj4gT24gVHVlLCBTZXAgMTUsIDIwMjAgYXQgMDg6
NDI6NTRQTSAtMDcwMCwgTmljayBUZXJyZWxsIHdyb3RlOg0KPj4gRnJvbTogTmljayBUZXJyZWxs
IDx0ZXJyZWxsbkBmYi5jb20+DQo+PiANCj4+IEFkZHMgenN0ZF9jb21wYXQuaCB3aGljaCBwcm92
aWRlcyB0aGUgbmVjZXNzYXJ5IGZ1bmN0aW9ucyBmcm9tIHRoZQ0KPj4gY3VycmVudCB6c3RkLmgg
QVBJLiBJdCBpcyBvbmx5IGFjdGl2ZSBmb3IgenN0ZCB2ZXJzaW9ucyAxLjQuNiBhbmQgbmV3ZXIu
DQo+PiBUaGF0IG1lYW5zIGl0IGlzIGRpc2FibGVkIGN1cnJlbnRseSwgYnV0IHdpbGwgYmVjb21l
IGFjdGl2ZSB3aGVuIGEgbGF0ZXINCj4+IHBhdGNoIGluIHRoaXMgc2VyaWVzIHVwZGF0ZXMgdGhl
IHpzdGQgbGlicmFyeSBpbiB0aGUga2VybmVsIHRvIDEuNC42Lg0KPj4gDQo+PiBUaGlzIGhlYWRl
ciBhbGxvd3MgdGhlIHpzdGQgdXBncmFkZSB0byAxLjQuNiB3aXRob3V0IGNoYW5naW5nIGFueQ0K
Pj4gY2FsbGVycywgc2luY2UgdGhleSBhbGwgaW5jbHVkZSB6c3RkIHRocm91Z2ggdGhlIGNvbXBh
dGliaWxpdHkgd3JhcHBlci4NCj4+IExhdGVyIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgdHJhbnNp
dGlvbiBlYWNoIGNhbGxlciBhd2F5IGZyb20gdGhlDQo+PiBjb21wYXRpYmlsaXR5IHdyYXBwZXIu
IEFmdGVyIGFsbCB0aGUgY2FsbGVycyBoYXZlIGJlZW4gdHJhbnNpdGlvbmVkIGF3YXkNCj4+IGZy
b20gdGhlIGNvbXBhdGliaWxpdHkgd3JhcHBlciwgdGhlIGZpbmFsIHBhdGNoIGluIHRoaXMgc2Vy
aWVzIGRlbGV0ZXMNCj4+IGl0Lg0KPiANCj4gUGxlYXNlIGp1c3QgYWRkIHdyYXBwZXMgdG8gdGhl
IG1haW4gaGVhZGVyIGluc3RlYWQgb2YgY2F1c2luZyBhbGwNCj4gdGhpcyBjaHVybi4NCg0KVGhl
IGdvYWwgb2YgaGF2aW5nIGl0IGluIGEgc2VwYXJhdGUgaGVhZGVyIGlzIHNvIHRoZSAzcmQgcGF0
Y2ggdGhhdCBhY3R1YWxseQ0KdXBkYXRlcyB6c3RkIGNhbiBiZSAxMDAlIGF1dG9tYXRpY2FsbHkg
Z2VuZXJhdGVkLiBJIGRpZG7igJl0IHdhbnQgdG8gbWl4DQphIHNtYWxsIGFtb3VudCBvZiBlZGl0
cyBpbnRvIGEgbGFyZ2UgZ2VuZXJhdGVkIHBhdGNoLCBiZWNhdXNlIHRoYXQgd291bGQNCmJlIGVh
c3kgdG8gbWlzcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
