Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A02C26E31C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Sep 2020 20:01:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AuAYja0cDOE9jMJ08KYQyS+iR10vcfrcIFlaSaCDQxg=; b=HVAtpsZ+v4QEHpD6lo8Uz5xyw
	dznOdm6hgrSZ/IJOMx63iWcMYTywQsL5YlgBgBe84DeIKRm0rX9/foxFXOH9IUb7txY70RfhjEQau
	QI9ZJ2sxWdKX2BLccex0MbumnQobHKvHY3yL3NJuhdavQBb7E1FhkuB4ed6XaHoitWc04=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIyE8-0006Ic-9o; Thu, 17 Sep 2020 18:01:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=6529f45c4b=terrelln@fb.com>) id 1kIyE7-0006IW-Qr
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 18:01:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LWL2m3e3JizEMj5CoTFEgxuELQffTiYgFPCXxWLsBno=; b=BOQgegNNyNPZqzXNfq3RhGaide
 G1+dSJ57GSOzz76eA2JHf7r9Etmm8qinPcDIbG7DC+eD/wKzNVYHtrljEKvCe2qUGHjTty83bbOTE
 iCh3ES/UAxJiFPRFU3QHUbEuIzbRPGYCakhWH3Scr1Cs5KMlfkeFtjgjPYImy9Gz7BY0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LWL2m3e3JizEMj5CoTFEgxuELQffTiYgFPCXxWLsBno=; b=HiwsaPs21jwOLUnPuKM/sfqhVD
 15vX6hkTgbzXNe+LVskmnlRabfRgpKfQ/bnSiXrtqup4omPWhe5kw+sGy70utlqHTOBthvTfcMfYR
 Ur4yGFBMdlm2+Ce8FFiSbxMlsP6eewtcZ0L5zoNidHm+oOSiXzsil5GfdE2dHur4hj9U=;
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIyE1-00ESpl-W2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 18:01:47 +0000
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08HHpxe2003854; Thu, 17 Sep 2020 11:00:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=LWL2m3e3JizEMj5CoTFEgxuELQffTiYgFPCXxWLsBno=;
 b=GBCgaVT/uwOJVX5BCZfJ7ZJhnL6LkD8CXvs8pnz/oxw4HuQYt/ahmtR2vn1FAaG3AXh7
 AtwMRsnVfin/jIHW/Z0+I1MVbJ4GlLY6LvQf/m0zvv2vklBHkQOE6nsEVlmL64KC9wih
 n23c6htxoU2RA5hoGQXwa9Mjyg+E9R+CgU8= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33mc4ur6d5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Sep 2020 11:00:41 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 17 Sep 2020 11:00:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moTWaKkRmOX2qrBYL6MoNQZhkru3HIvJFDfpmHsH9ZZgN26LARNwVeqfLOnIHbo0Khhkhna4g8Mv/+8EjqGXQGpAT3NR1ZpjttBspw9lYlcab/7ie8fHtmBWwWjLjupW0kbR6uWfyiMwz1B7TMwAQFeijFzZgo3BYEe+2DGkE8L8u4HK2XW8wBWcuby2LMU7RkinmEMtXhYRec49yoHA50znW1NDc83RkmYgujUN76ZF+9Ysryv9z7tt3aNJWLHj8xqoQvunZ2rYbi6nfF016kuJtj658jQ1GEx5Zg4fE3E6lDMfQWj0KOq3AfAIPZe/amuoKSwKEpVVV4YQXVc2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWL2m3e3JizEMj5CoTFEgxuELQffTiYgFPCXxWLsBno=;
 b=KXKWMYNxgR2h+u8Y0vNIXVv0sJbmWRyIW+q1QF2TqbjDt2iabYjBmF/xi16D6Ah1fxJBxhBWZ3QDw8vcXEJT1oSQ1x8rDo7tKERAKtNCbF7zhdiyxbKdGtYjJsykwWvATOlDI4hUDxUB5JBp8ae9NYlSuYT2MAtHdU0hLTjOaLnyguiCUWqXQSGpGxo3zvQQjhy9iqCT4m+IEciUl0rfRhAPyC/uoZTgtW2kL1k/MyXzAzxWryt6HimWwDgb3vxw1vrK11oFcPLnQOAcS9FMrKHVVaPERmWFPM9rdWc0nT9/TqcH23lGNRzBMmmwiukFiF8ZK1RlqsweU5XayuhG+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWL2m3e3JizEMj5CoTFEgxuELQffTiYgFPCXxWLsBno=;
 b=DHeRNAZ0wH5jsrcb1i7Lmim615MT41BXRLP2C/OKuX/DRz4BLnSFopQibj7Qzb+XVoiBtLfx55bGaRu+vbB9tC46yLtcGpDWoMfKQIiakXv1qGXrIflJ6ybE34dKEpAWMmHPtUKdQ921kRGBLWYawSN4BEw3VgsAnxSUIcz87BA=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB3365.namprd15.prod.outlook.com (2603:10b6:a03:111::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 18:00:36 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c%7]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 18:00:36 +0000
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH 6/9] f2fs: zstd: Switch to the zstd-1.4.6 API
Thread-Index: AQHWi9ufSzGQbs/fgE+hHGtC5Bpw36lqzjGAgADLbACAAMcngIAAwGaA
Date: Thu, 17 Sep 2020 18:00:36 +0000
Message-ID: <C327820B-5BD8-4739-AE4E-04EF27BE8150@fb.com>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
 <20200916034307.2092020-9-nickrterrell@gmail.com>
 <28bf92f1-1246-a840-6195-0e230e517e6d@huawei.com>
 <C8517011-9B6F-499F-BEC6-25BF1F0794AC@fb.com>
 <f7b19bc6-e57f-b4d8-b1f7-89c428b79cdf@huawei.com>
In-Reply-To: <f7b19bc6-e57f-b4d8-b1f7-89c428b79cdf@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [98.33.101.203]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 760c73ee-ae7a-4c68-5bc8-08d85b339473
x-ms-traffictypediagnostic: BYAPR15MB3365:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB3365F81803FB06FF8A0E9B7FAB3E0@BYAPR15MB3365.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CDY7XiWJp9Jg2ZS0wM30whXbZIINdHVo53ow/dUEuur9JrWTeV1oFTO5jVFzo/mgW+jXluYpO9vQW8nHdw9SZcrhoZnart/jOBmEsWcCRWuxGbxUDzZssLCo5pl6ubrSUk27ZP42KeajtNSny6CUFerJLj91BghfeqFbzqTBmSKrIndCQfjNPK+vrmmgDvYPn+XcGBmvEioYGjx1rH09NhteaDKOT2ZCJ/SKrldByCOUUaed+9Sakau8ibn/sUtM9RwYWHuFNkQa5niUzj+uD6pAB7C3CIzNVpExOw1n1mBjenj2B1xsOKZ2nu66GmaFtvgMCbHbZg5e+ktwwwniw7a3SBOPwi51fWIQ7bwz6ms1RODpaWsAri8+iPEu+4WtDPg8cFvge/MJymwkgMTi2oF/QGyXc4JowqE0Bpt7x/2vdJGVJ9lNS1OFalueeqAplFde69uhrITIq0/vRJ8a9WYSQunrXZMRJjkEsl9b9zs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(136003)(39860400002)(396003)(26005)(6486002)(6512007)(316002)(186003)(2616005)(4326008)(86362001)(478600001)(6916009)(33656002)(16799955002)(8936002)(966005)(15188155005)(71200400001)(2906002)(54906003)(36756003)(6506007)(5660300002)(66476007)(64756008)(66446008)(83380400001)(76116006)(8676002)(66946007)(66556008)(53546011)(473944003)(414714003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: eIIeet8T+GVEHaDb64SrNBJ9CTsLIeI2seyLYpNUafCmb+8dL9Xy3r7+onmnUWVr6Fi8022W7sfXgp7l0dzTfc3m4Eb+FhA0CkCx538QRaK4X5uZmZ3Yt1IYsIStFqKGu3GVRhyS0/upp0wLh98n8tidfjdELX1QFRm1y1V7vKjYS7cHb6Ize/g6Nkb8EnKUyh8zGjMzjk+PodFDH1Q6X+ugE9fXL313ZfergUMx8nkKVW6P/JBdaZn+iIJAGVXaT9Wn/s7t+osAde0g4OQ1n/i+JmVdQn/kooajwSauuJj/abaF+9ODMllD5h2DaIOnqXcJckMKwYZ7xToIwwylKPV5HrKBOBRJmFG2c414ID1QKptWU/NK20RNpOOch9pwzHiEbnmiqmsXPzmnmAWsVsO8q0dYvoPSiq4chnEGHN9UZCYZZjUoFU+ngJMOWFKUkXSSsHSjVp5coE3YkoJWho2yLNElwHJIM84K/0f8NIOSDzyx1Es3wo2UcvEk2zQ3r3M6flxrBULBqMk4FO5LVpjNt2VqX1Y3cMfBaS23ZQAhbjrQVCtsb5WRpKPAGQhtgta5goNQtaqGRirUtvjxvyQob04US+LhReurFILax2Z3TpQ7tDIJuHNM/FUpTLNXJoveDviO29Mj9SdC4qhb+g==
Content-ID: <D59B3E339D82964AA7EE31A7F7791450@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 760c73ee-ae7a-4c68-5bc8-08d85b339473
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 18:00:36.3114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AGb67ycMsC4LcmlfEFod/rs4mvRAS/LvWqyNTbWUCoCU3U6H0saj20/i8xKm8ihv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3365
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-17_13:2020-09-16,
 2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009170133
X-FB-Internal: deliver
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.1 BODY_ENHANCEMENT2      BODY: Information on getting larger body parts
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
X-Headers-End: 1kIyE1-00ESpl-W2
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

DQoNCj4gT24gU2VwIDE2LCAyMDIwLCBhdCAxMTozMSBQTSwgQ2hhbyBZdSA8eXVjaGFvMEBodWF3
ZWkuY29tPiB3cm90ZToNCj4gDQo+IEhpIE5pY2ssDQo+IA0KPiBPbiAyMDIwLzkvMTcgMjozOSwg
TmljayBUZXJyZWxsIHdyb3RlOg0KPj4+IE9uIFNlcCAxNSwgMjAyMCwgYXQgMTE6MzEgUE0sIENo
YW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gSGkgTmljaywNCj4+
PiANCj4+PiByZW1vdmUgbm90IHJlbGF0ZWQgbWFpbGluZyBsaXN0Lg0KPj4+IA0KPj4+IE9uIDIw
MjAvOS8xNiAxMTo0MywgTmljayBUZXJyZWxsIHdyb3RlOg0KPj4+PiBGcm9tOiBOaWNrIFRlcnJl
bGwgPHRlcnJlbGxuQGZiLmNvbT4NCj4+Pj4gTW92ZSBhd2F5IGZyb20gdGhlIGNvbXBhdGliaWxp
dHkgd3JhcHBlciB0byB0aGUgenN0ZC0xLjQuNiBBUEkuIFRoaXMNCj4+Pj4gY29kZSBpcyBtb3Jl
IGVmZmljaWVudCBiZWNhdXNlIGl0IHVzZXMgdGhlIHNpbmdsZS1wYXNzIEFQSSBpbnN0ZWFkIG9m
DQo+Pj4+IHRoZSBzdHJlYW1pbmcgQVBJLiBUaGUgc3RyZWFtaW5nIEFQSSBpcyBub3QgbmVjZXNz
YXJ5IGJlY2F1c2UgdGhlIHdob2xlDQo+Pj4+IGlucHV0IGFuZCBvdXRwdXQgYnVmZmVycyBhcmUg
YXZhaWxhYmxlLiBUaGlzIHNhdmVzIG1lbW9yeSBiZWNhdXNlIHdlDQo+Pj4+IGRvbid0IG5lZWQg
dG8gYWxsb2NhdGUgYSBidWZmZXIgZm9yIHRoZSB3aW5kb3cuIEl0IGlzIGFsc28gbW9yZQ0KPj4+
PiBlZmZpY2llbnQgYmVjYXVzZSBpdCBzYXZlcyB1bm5lY2Vzc2FyeSBtZW1jcHkgY2FsbHMuDQo+
Pj4+IEkndmUgaGFkIHByb2JsZW1zIHRlc3RpbmcgdGhpcyBjb2RlIGJlY2F1c2UgSSBzZWUgZGF0
YSB0cnVuY2F0aW9uIGJlZm9yZQ0KPj4+PiBhbmQgYWZ0ZXIgdGhpcyBwYXRjaHNldC4gSGVscCB0
ZXN0aW5nIHRoaXMgcGF0Y2ggd291bGQgYmUgbXVjaA0KPj4+PiBhcHByZWNpYXRlZC4NCj4+PiAN
Cj4+PiBDYW4geW91IHBsZWFzZSBleHBsYWluIG1vcmUgYWJvdXQgZGF0YSB0cnVuY2F0aW9uPyBJ
J20gYSBsaXR0bGUgY29uZnVzZWQuLi4NCj4+PiANCj4+PiBEbyB5b3UgbWVhbiB0aGF0IGYyZnMg
ZG9lc24ndCBhbGxvY2F0ZSBlbm91Z2ggbWVtb3J5IGZvciB6c3RkIGNvbXByZXNzaW9uLA0KPj4+
IHNvIHRoYXQgY29tcHJlc3Npb24gaXMgbm90IGZpbmlzaGVkIGFjdHVhbGx5LCB0aGUgY29tcHJl
c3NlZCBkYXRhIGlzIHRydW5jYXRlZA0KPj4+IGF0IGRzdCBidWZmZXI/DQo+PiBIaSBDaGFvLA0K
Pj4gSeKAmXZlIHRlc3RlZCBGMkZTIHVzaW5nIGEgYmVuY2htYXJrIEkgYWRhcHRlZCBmcm9tIHRl
c3RpbmcgQnRyRlMgWzBdLiBJdCBpcyBwb3NzaWJsZQ0KPj4gdGhhdCB0aGUgc2NyaXB0IEnigJlt
IHVzaW5nIGlzIGJ1Z2d5IG9yIGlzIGV4cG9zaW5nIGFuIGVkZ2UgY2FzZSBpbiBGMkZTLiBUaGUg
ZmlsZXMNCj4+IHRoYXQgSSBjb3B5IHRvIEYyRlMgYW5kIGNvbXByZXNzIGVuZCB1cCB0cnVuY2F0
ZWQgd2l0aCBhIGhvbGUgYXQgdGhlIGVuZC4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBleHBsYW5h
dGlvbi4gOikNCj4gDQo+PiBJdCBpcyBiYXNlZCBvZmYgb2YgdXBzdHJlYW0gY29tbWl0IGFiMjlh
ODA3YTcuDQo+PiBFLmcuIHRoZSBlbmQgb2YgdGhlIGNvcGllZCBmaWxlIGxvb2tzIGxpa2UgdGhp
cywgYnV0IHRoZSBvcmlnaW5hbCBmaWxlIGhhcyBub24temVybyBkYXRhDQo+PiBJbiB0aGUgZW5k
LiBVbnRpbCB0aGUgaG9sZSBhdCB0aGUgZW5kIHRoZSBmaWxlIGlzIGNvcnJlY3QuDQo+PiBvZCBk
aWNrZW5zIHwgdGFpbCAtbiA1DQo+Pj4gNDY2Njc3NjAgMDY3NTAyIDA2NjE2NyAwMjAwNTYgMDQw
NDQwIDAyMDE2MyAwMjM1MTEgMDA2NTU1IDA2MDQxMg0KPj4+IDQ2NjcwMDAwIDAwMDAwMCAwMDAw
MDAgMDAwMDAwIDAwMDAwMCAwMDAwMDAgMDAwMDAwIDAwMDAwMCAwMDAwMDANCj4+PiAqDQo+Pj4g
NDY3MDMwNjAgMDAwMDAwIDAwMDAwMCAwMDAwMDAgMDAwMDAwIDAwMDAwMCAwMDAwMDAgMDAwMDAw
DQo+Pj4gNDY3MDMwNzYNCj4+IFswXSBodHRwczovL2dpc3QuZ2l0aHViLmNvbS90ZXJyZWxsbi83
ZGQyOTE5OTM3ZGZiZGI4ZTgzOWU0YWQxMWM4MWRiNA0KPiANCj4gU2hvdWxkbid0IHdlIGp1c3Qg
Z2V0IHNoYTEgdmFsdWUgYnkgZmxpdGVyaW5nIHNoYTFzdW0gb3V0cHV0Pw0KPiANCj4gICAgICAg
ICAgICAgICAgYXNoYT1gc2hhMXN1bSAkQkVOQ0hNQVJLX0RJUi8kZmlsZSB8YXdrIHsncHJpbnQg
JDEnfWANCj4gICAgICAgICAgICAgICAgYnNoYT1gc2hhMXN1bSAkTVAvJGkvJGZpbGUgfGF3ayB7
J3ByaW50ICQxJ31gDQoNClByb2JhYmx5LCBidXQgaXQgd2FzIGp1c3QgYSBxdWljayBvbmUtb2Zm
IHNjcmlwdC4NCg0KPiBJIGNhbid0IHJlcHJvZHVjZSB0aGlzIGlzc3VlIGJ5IHVzaW5nIHNpbXBs
ZSBkYXRhIHNhbXBsZSwgY291bGQgeW91IHNoYXJlDQo+IHRoYXQgJ2RpY2tlbnMnIGZpbGUgb3Ig
b3RoZXIgc21hbGxlci1zaXplZCBzYW1wbGUgaWYgeW91IGhhdmU/DQoNClRoZSAvdG1wL3NpbGVz
aWEgZGlyZWN0b3J5IGluIHRoZSBleGFtcGxlIGlzIHBvcHVsYXRlZCB3aXRoIGFsbCB0aGUgZmls
ZXMgZnJvbQ0KdGhpcyB3ZWJzaXRlLiBJdCBpcyBhIHBvcHVsYXIgZGF0YSBjb21wcmVzc2lvbiBi
ZW5jaG1hcmsgY29ycHVzLiBZb3UgY2FuDQpjbGljayBvbiB0aGUg4oCcdG90YWzigJ0gbGluayB0
byBkb3dubG9hZCBhIHppcCBhcmNoaXZlIG9mIGFsbCB0aGUgZmlsZXMuDQoNCmh0dHA6Ly9zdW4u
YWVpLnBvbHNsLnBsL35zZGVvci9pbmRleC5waHA/cGFnZT1zaWxlc2lhDQoNCi1OaWNrDQoNCj4g
VGhhbmtzLA0KPiANCj4+IEJlc3QsDQo+PiBOaWNrDQo+Pj4gVGhhbmtzLA0KPj4+IA0KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBOaWNrIFRlcnJlbGwgPHRlcnJlbGxuQGZiLmNvbT4NCj4+Pj4gLS0tDQo+
Pj4+ICBmcy9mMmZzL2NvbXByZXNzLmMgfCAxMDIgKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygr
KSwgNjQgZGVsZXRpb25zKC0pDQo+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NvbXByZXNzLmMg
Yi9mcy9mMmZzL2NvbXByZXNzLmMNCj4+Pj4gaW5kZXggZTA1NmYzYTJiNDA0Li5iNzllZmNlODE2
NTEgMTAwNjQ0DQo+Pj4+IC0tLSBhL2ZzL2YyZnMvY29tcHJlc3MuYw0KPj4+PiArKysgYi9mcy9m
MmZzL2NvbXByZXNzLmMNCj4+Pj4gQEAgLTExLDcgKzExLDggQEANCj4+Pj4gICNpbmNsdWRlIDxs
aW51eC9iYWNraW5nLWRldi5oPg0KPj4+PiAgI2luY2x1ZGUgPGxpbnV4L2x6by5oPg0KPj4+PiAg
I2luY2x1ZGUgPGxpbnV4L2x6NC5oPg0KPj4+PiAtI2luY2x1ZGUgPGxpbnV4L3pzdGRfY29tcGF0
Lmg+DQo+Pj4+ICsjaW5jbHVkZSA8bGludXgvenN0ZC5oPg0KPj4+PiArI2luY2x1ZGUgPGxpbnV4
L3pzdGRfZXJyb3JzLmg+DQo+Pj4+ICAgICNpbmNsdWRlICJmMmZzLmgiDQo+Pj4+ICAjaW5jbHVk
ZSAibm9kZS5oIg0KPj4+PiBAQCAtMjk4LDIxICsyOTksMjEgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBmMmZzX2NvbXByZXNzX29wcyBmMmZzX2x6NF9vcHMgPSB7DQo+Pj4+ICBzdGF0aWMgaW50IHpz
dGRfaW5pdF9jb21wcmVzc19jdHgoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MpDQo+Pj4+ICB7DQo+
Pj4+ICAJWlNURF9wYXJhbWV0ZXJzIHBhcmFtczsNCj4+Pj4gLQlaU1REX0NTdHJlYW0gKnN0cmVh
bTsNCj4+Pj4gKwlaU1REX0NDdHggKmN0eDsNCj4+Pj4gIAl2b2lkICp3b3Jrc3BhY2U7DQo+Pj4+
ICAJdW5zaWduZWQgaW50IHdvcmtzcGFjZV9zaXplOw0KPj4+PiAgICAJcGFyYW1zID0gWlNURF9n
ZXRQYXJhbXMoRjJGU19aU1REX0RFRkFVTFRfQ0xFVkVMLCBjYy0+cmxlbiwgMCk7DQo+Pj4+IC0J
d29ya3NwYWNlX3NpemUgPSBaU1REX0NTdHJlYW1Xb3Jrc3BhY2VCb3VuZChwYXJhbXMuY1BhcmFt
cyk7DQo+Pj4+ICsJd29ya3NwYWNlX3NpemUgPSBaU1REX2VzdGltYXRlQ0N0eFNpemVfdXNpbmdD
UGFyYW1zKHBhcmFtcy5jUGFyYW1zKTsNCj4+Pj4gICAgCXdvcmtzcGFjZSA9IGYyZnNfa3ZtYWxs
b2MoRjJGU19JX1NCKGNjLT5pbm9kZSksDQo+Pj4+ICAJCQkJCXdvcmtzcGFjZV9zaXplLCBHRlBf
Tk9GUyk7DQo+Pj4+ICAJaWYgKCF3b3Jrc3BhY2UpDQo+Pj4+ICAJCXJldHVybiAtRU5PTUVNOw0K
Pj4+PiAgLQlzdHJlYW0gPSBaU1REX2luaXRDU3RyZWFtKHBhcmFtcywgMCwgd29ya3NwYWNlLCB3
b3Jrc3BhY2Vfc2l6ZSk7DQo+Pj4+IC0JaWYgKCFzdHJlYW0pIHsNCj4+Pj4gLQkJcHJpbnRrX3Jh
dGVsaW1pdGVkKCIlc0YyRlMtZnMgKCVzKTogJXMgWlNURF9pbml0Q1N0cmVhbSBmYWlsZWRcbiIs
DQo+Pj4+ICsJY3R4ID0gWlNURF9pbml0U3RhdGljQ0N0eCh3b3Jrc3BhY2UsIHdvcmtzcGFjZV9z
aXplKTsNCj4+Pj4gKwlpZiAoIWN0eCkgew0KPj4+PiArCQlwcmludGtfcmF0ZWxpbWl0ZWQoIiVz
RjJGUy1mcyAoJXMpOiAlcyBaU1REX2luaXR0YXRpY0NTdHJlYW0gZmFpbGVkXG4iLA0KPj4+PiAg
CQkJCUtFUk5fRVJSLCBGMkZTX0lfU0IoY2MtPmlub2RlKS0+c2ItPnNfaWQsDQo+Pj4+ICAJCQkJ
X19mdW5jX18pOw0KPj4+PiAgCQlrdmZyZWUod29ya3NwYWNlKTsNCj4+Pj4gQEAgLTMyMCw3ICsz
MjEsNyBAQCBzdGF0aWMgaW50IHpzdGRfaW5pdF9jb21wcmVzc19jdHgoc3RydWN0IGNvbXByZXNz
X2N0eCAqY2MpDQo+Pj4+ICAJfQ0KPj4+PiAgICAJY2MtPnByaXZhdGUgPSB3b3Jrc3BhY2U7DQo+
Pj4+IC0JY2MtPnByaXZhdGUyID0gc3RyZWFtOw0KPj4+PiArCWNjLT5wcml2YXRlMiA9IGN0eDsN
Cj4+Pj4gICAgCWNjLT5jbGVuID0gY2MtPnJsZW4gLSBQQUdFX1NJWkUgLSBDT01QUkVTU19IRUFE
RVJfU0laRTsNCj4+Pj4gIAlyZXR1cm4gMDsNCj4+Pj4gQEAgLTMzNSw2NSArMzM2LDQ4IEBAIHN0
YXRpYyB2b2lkIHpzdGRfZGVzdHJveV9jb21wcmVzc19jdHgoc3RydWN0IGNvbXByZXNzX2N0eCAq
Y2MpDQo+Pj4+ICAgIHN0YXRpYyBpbnQgenN0ZF9jb21wcmVzc19wYWdlcyhzdHJ1Y3QgY29tcHJl
c3NfY3R4ICpjYykNCj4+Pj4gIHsNCj4+Pj4gLQlaU1REX0NTdHJlYW0gKnN0cmVhbSA9IGNjLT5w
cml2YXRlMjsNCj4+Pj4gLQlaU1REX2luQnVmZmVyIGluYnVmOw0KPj4+PiAtCVpTVERfb3V0QnVm
ZmVyIG91dGJ1ZjsNCj4+Pj4gLQlpbnQgc3JjX3NpemUgPSBjYy0+cmxlbjsNCj4+Pj4gLQlpbnQg
ZHN0X3NpemUgPSBzcmNfc2l6ZSAtIFBBR0VfU0laRSAtIENPTVBSRVNTX0hFQURFUl9TSVpFOw0K
Pj4+PiAtCWludCByZXQ7DQo+Pj4+IC0NCj4+Pj4gLQlpbmJ1Zi5wb3MgPSAwOw0KPj4+PiAtCWlu
YnVmLnNyYyA9IGNjLT5yYnVmOw0KPj4+PiAtCWluYnVmLnNpemUgPSBzcmNfc2l6ZTsNCj4+Pj4g
LQ0KPj4+PiAtCW91dGJ1Zi5wb3MgPSAwOw0KPj4+PiAtCW91dGJ1Zi5kc3QgPSBjYy0+Y2J1Zi0+
Y2RhdGE7DQo+Pj4+IC0Jb3V0YnVmLnNpemUgPSBkc3Rfc2l6ZTsNCj4+Pj4gLQ0KPj4+PiAtCXJl
dCA9IFpTVERfY29tcHJlc3NTdHJlYW0oc3RyZWFtLCAmb3V0YnVmLCAmaW5idWYpOw0KPj4+PiAt
CWlmIChaU1REX2lzRXJyb3IocmV0KSkgew0KPj4+PiAtCQlwcmludGtfcmF0ZWxpbWl0ZWQoIiVz
RjJGUy1mcyAoJXMpOiAlcyBaU1REX2NvbXByZXNzU3RyZWFtIGZhaWxlZCwgcmV0OiAlZFxuIiwN
Cj4+Pj4gLQkJCQlLRVJOX0VSUiwgRjJGU19JX1NCKGNjLT5pbm9kZSktPnNiLT5zX2lkLA0KPj4+
PiAtCQkJCV9fZnVuY19fLCBaU1REX2dldEVycm9yQ29kZShyZXQpKTsNCj4+Pj4gLQkJcmV0dXJu
IC1FSU87DQo+Pj4+IC0JfQ0KPj4+PiAtDQo+Pj4+IC0JcmV0ID0gWlNURF9lbmRTdHJlYW0oc3Ry
ZWFtLCAmb3V0YnVmKTsNCj4+Pj4gKwlaU1REX0NDdHggKmN0eCA9IGNjLT5wcml2YXRlMjsNCj4+
Pj4gKwljb25zdCBzaXplX3Qgc3JjX3NpemUgPSBjYy0+cmxlbjsNCj4+Pj4gKwljb25zdCBzaXpl
X3QgZHN0X3NpemUgPSBzcmNfc2l6ZSAtIFBBR0VfU0laRSAtIENPTVBSRVNTX0hFQURFUl9TSVpF
Ow0KPj4+PiArCVpTVERfcGFyYW1ldGVycyBwYXJhbXMgPSBaU1REX2dldFBhcmFtcyhGMkZTX1pT
VERfREVGQVVMVF9DTEVWRUwsIHNyY19zaXplLCAwKTsNCj4+Pj4gKwlzaXplX3QgcmV0Ow0KPj4+
PiArDQo+Pj4+ICsJcmV0ID0gWlNURF9jb21wcmVzc19hZHZhbmNlZCgNCj4+Pj4gKwkJCWN0eCwg
Y2MtPmNidWYtPmNkYXRhLCBkc3Rfc2l6ZSwgY2MtPnJidWYsIHNyY19zaXplLCBOVUxMLCAwLCBw
YXJhbXMpOw0KPj4+PiAgCWlmIChaU1REX2lzRXJyb3IocmV0KSkgew0KPj4+PiAtCQlwcmludGtf
cmF0ZWxpbWl0ZWQoIiVzRjJGUy1mcyAoJXMpOiAlcyBaU1REX2VuZFN0cmVhbSByZXR1cm5lZCAl
ZFxuIiwNCj4+Pj4gKwkJLyoNCj4+Pj4gKwkJICogdGhlcmUgaXMgY29tcHJlc3NlZCBkYXRhIHJl
bWFpbmVkIGluIGludGVybWVkaWF0ZSBidWZmZXIgZHVlIHRvDQo+Pj4+ICsJCSAqIG5vIG1vcmUg
c3BhY2UgaW4gY2J1Zi5jZGF0YQ0KPj4+PiArCQkgKi8NCj4+Pj4gKwkJaWYgKFpTVERfZ2V0RXJy
b3JDb2RlKHJldCkgPT0gWlNURF9lcnJvcl9kc3RTaXplX3Rvb1NtYWxsKQ0KPj4+PiArCQkJcmV0
dXJuIC1FQUdBSU47DQo+Pj4+ICsJCS8qIG90aGVyIGNvbXByZXNzaW9uIGVycm9ycyByZXR1cm4g
LUVJTyAqLw0KPj4+PiArCQlwcmludGtfcmF0ZWxpbWl0ZWQoIiVzRjJGUy1mcyAoJXMpOiAlcyBa
U1REX2NvbXByZXNzX2FkdmFuY2VkIGZhaWxlZCwgZXJyOiAlc1xuIiwNCj4+Pj4gIAkJCQlLRVJO
X0VSUiwgRjJGU19JX1NCKGNjLT5pbm9kZSktPnNiLT5zX2lkLA0KPj4+PiAtCQkJCV9fZnVuY19f
LCBaU1REX2dldEVycm9yQ29kZShyZXQpKTsNCj4+Pj4gKwkJCQlfX2Z1bmNfXywgWlNURF9nZXRF
cnJvck5hbWUocmV0KSk7DQo+Pj4+ICAJCXJldHVybiAtRUlPOw0KPj4+PiAgCX0NCj4+Pj4gIC0J
LyoNCj4+Pj4gLQkgKiB0aGVyZSBpcyBjb21wcmVzc2VkIGRhdGEgcmVtYWluZWQgaW4gaW50ZXJt
ZWRpYXRlIGJ1ZmZlciBkdWUgdG8NCj4+Pj4gLQkgKiBubyBtb3JlIHNwYWNlIGluIGNidWYuY2Rh
dGENCj4+Pj4gLQkgKi8NCj4+Pj4gLQlpZiAocmV0KQ0KPj4+PiAtCQlyZXR1cm4gLUVBR0FJTjsN
Cj4+Pj4gLQ0KPj4+PiAtCWNjLT5jbGVuID0gb3V0YnVmLnBvczsNCj4+Pj4gKwljYy0+Y2xlbiA9
IHJldDsNCj4+Pj4gIAlyZXR1cm4gMDsNCj4+Pj4gIH0NCj4+Pj4gICAgc3RhdGljIGludCB6c3Rk
X2luaXRfZGVjb21wcmVzc19jdHgoc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMpDQo+Pj4+
ICB7DQo+Pj4+IC0JWlNURF9EU3RyZWFtICpzdHJlYW07DQo+Pj4+ICsJWlNURF9EQ3R4ICpjdHg7
DQo+Pj4+ICAJdm9pZCAqd29ya3NwYWNlOw0KPj4+PiAgCXVuc2lnbmVkIGludCB3b3Jrc3BhY2Vf
c2l6ZTsNCj4+Pj4gIC0Jd29ya3NwYWNlX3NpemUgPSBaU1REX0RTdHJlYW1Xb3Jrc3BhY2VCb3Vu
ZChNQVhfQ09NUFJFU1NfV0lORE9XX1NJWkUpOw0KPj4+PiArCXdvcmtzcGFjZV9zaXplID0gWlNU
RF9lc3RpbWF0ZURDdHhTaXplKCk7DQo+Pj4+ICAgIAl3b3Jrc3BhY2UgPSBmMmZzX2t2bWFsbG9j
KEYyRlNfSV9TQihkaWMtPmlub2RlKSwNCj4+Pj4gIAkJCQkJd29ya3NwYWNlX3NpemUsIEdGUF9O
T0ZTKTsNCj4+Pj4gIAlpZiAoIXdvcmtzcGFjZSkNCj4+Pj4gIAkJcmV0dXJuIC1FTk9NRU07DQo+
Pj4+ICAtCXN0cmVhbSA9IFpTVERfaW5pdERTdHJlYW0oTUFYX0NPTVBSRVNTX1dJTkRPV19TSVpF
LA0KPj4+PiAtCQkJCQl3b3Jrc3BhY2UsIHdvcmtzcGFjZV9zaXplKTsNCj4+Pj4gLQlpZiAoIXN0
cmVhbSkgew0KPj4+PiAtCQlwcmludGtfcmF0ZWxpbWl0ZWQoIiVzRjJGUy1mcyAoJXMpOiAlcyBa
U1REX2luaXREU3RyZWFtIGZhaWxlZFxuIiwNCj4+Pj4gKwljdHggPSBaU1REX2luaXRTdGF0aWNE
Q3R4KHdvcmtzcGFjZSwgd29ya3NwYWNlX3NpemUpOw0KPj4+PiArCWlmICghY3R4KSB7DQo+Pj4+
ICsJCXByaW50a19yYXRlbGltaXRlZCgiJXNGMkZTLWZzICglcyk6ICVzIFpTVERfaW5pdFN0YXRp
Y0RDdHggZmFpbGVkXG4iLA0KPj4+PiAgCQkJCUtFUk5fRVJSLCBGMkZTX0lfU0IoZGljLT5pbm9k
ZSktPnNiLT5zX2lkLA0KPj4+PiAgCQkJCV9fZnVuY19fKTsNCj4+Pj4gIAkJa3ZmcmVlKHdvcmtz
cGFjZSk7DQo+Pj4+IEBAIC00MDEsNyArMzg1LDcgQEAgc3RhdGljIGludCB6c3RkX2luaXRfZGVj
b21wcmVzc19jdHgoc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMpDQo+Pj4+ICAJfQ0KPj4+
PiAgICAJZGljLT5wcml2YXRlID0gd29ya3NwYWNlOw0KPj4+PiAtCWRpYy0+cHJpdmF0ZTIgPSBz
dHJlYW07DQo+Pj4+ICsJZGljLT5wcml2YXRlMiA9IGN0eDsNCj4+Pj4gICAgCXJldHVybiAwOw0K
Pj4+PiAgfQ0KPj4+PiBAQCAtNDE1LDI4ICszOTksMTggQEAgc3RhdGljIHZvaWQgenN0ZF9kZXN0
cm95X2RlY29tcHJlc3NfY3R4KHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCAqZGljKQ0KPj4+PiAg
ICBzdGF0aWMgaW50IHpzdGRfZGVjb21wcmVzc19wYWdlcyhzdHJ1Y3QgZGVjb21wcmVzc19pb19j
dHggKmRpYykNCj4+Pj4gIHsNCj4+Pj4gLQlaU1REX0RTdHJlYW0gKnN0cmVhbSA9IGRpYy0+cHJp
dmF0ZTI7DQo+Pj4+IC0JWlNURF9pbkJ1ZmZlciBpbmJ1ZjsNCj4+Pj4gLQlaU1REX291dEJ1ZmZl
ciBvdXRidWY7DQo+Pj4+IC0JaW50IHJldDsNCj4+Pj4gLQ0KPj4+PiAtCWluYnVmLnBvcyA9IDA7
DQo+Pj4+IC0JaW5idWYuc3JjID0gZGljLT5jYnVmLT5jZGF0YTsNCj4+Pj4gLQlpbmJ1Zi5zaXpl
ID0gZGljLT5jbGVuOw0KPj4+PiAtDQo+Pj4+IC0Jb3V0YnVmLnBvcyA9IDA7DQo+Pj4+IC0Jb3V0
YnVmLmRzdCA9IGRpYy0+cmJ1ZjsNCj4+Pj4gLQlvdXRidWYuc2l6ZSA9IGRpYy0+cmxlbjsNCj4+
Pj4gKwlaU1REX0RDdHggKmN0eCA9IGRpYy0+cHJpdmF0ZTI7DQo+Pj4+ICsJc2l6ZV90IHJldDsN
Cj4+Pj4gIC0JcmV0ID0gWlNURF9kZWNvbXByZXNzU3RyZWFtKHN0cmVhbSwgJm91dGJ1ZiwgJmlu
YnVmKTsNCj4+Pj4gKwlyZXQgPSBaU1REX2RlY29tcHJlc3NEQ3R4KGN0eCwgZGljLT5yYnVmLCBk
aWMtPnJsZW4sIGRpYy0+Y2J1Zi0+Y2RhdGEsIGRpYy0+Y2xlbik7DQo+Pj4+ICAJaWYgKFpTVERf
aXNFcnJvcihyZXQpKSB7DQo+Pj4+IC0JCXByaW50a19yYXRlbGltaXRlZCgiJXNGMkZTLWZzICgl
cyk6ICVzIFpTVERfY29tcHJlc3NTdHJlYW0gZmFpbGVkLCByZXQ6ICVkXG4iLA0KPj4+PiArCQlw
cmludGtfcmF0ZWxpbWl0ZWQoIiVzRjJGUy1mcyAoJXMpOiAlcyBaU1REX2RlY29tcHJlc3NEQ3R4
IGZhaWxlZCwgZXJyOiAlc1xuIiwNCj4+Pj4gIAkJCQlLRVJOX0VSUiwgRjJGU19JX1NCKGRpYy0+
aW5vZGUpLT5zYi0+c19pZCwNCj4+Pj4gLQkJCQlfX2Z1bmNfXywgWlNURF9nZXRFcnJvckNvZGUo
cmV0KSk7DQo+Pj4+ICsJCQkJX19mdW5jX18sIFpTVERfZ2V0RXJyb3JOYW1lKHJldCkpOw0KPj4+
PiAgCQlyZXR1cm4gLUVJTzsNCj4+Pj4gIAl9DQo+Pj4+ICAtCWlmIChkaWMtPnJsZW4gIT0gb3V0
YnVmLnBvcykgew0KPj4+PiArCWlmIChkaWMtPnJsZW4gIT0gcmV0KSB7DQo+Pj4+ICAJCXByaW50
a19yYXRlbGltaXRlZCgiJXNGMkZTLWZzICglcyk6ICVzIFpTVEQgaW52YWxpZCBybGVuOiV6dSwg
Ig0KPj4+PiAgCQkJCSJleHBlY3RlZDolbHVcbiIsIEtFUk5fRVJSLA0KPj4+PiAgCQkJCUYyRlNf
SV9TQihkaWMtPmlub2RlKS0+c2ItPnNfaWQsDQoNCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
