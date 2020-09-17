Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 357D626E557
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Sep 2020 21:35:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4HoJpEC9rg12Sr+vwWWQsqq48WLcvlAH3PI6CFKt7XI=; b=ISRBuFdg1jpYYgro3whvda3wO
	D9ZJxpPqlbfyRTtG8yFIcstNjHnWH/1fQbbh4gflPAHMHRH8lj7Tb05EOb7VZhZqXyAehJxnuMXlh
	+qa/Xd7Ed3AXIuCpF/cURzZS5W81JOd47SyvBSVA9XdI3HQt3R3dy3DhmfG7WfrT+E2jM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIzhB-0000ly-EE; Thu, 17 Sep 2020 19:35:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=6529f45c4b=terrelln@fb.com>) id 1kIzhA-0000ln-5t
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 19:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/fp5keRNXddhhD0LelvGjZDhxKwLXkjsGdNvYdchTyg=; b=S0nt1pZJUeqEHk9krlvqTXvFH7
 Axlus+3EmalUmiwZF+ytyXNvp4Hli2hvEKQdiqWQZlPq+fGysdLRrrxFdYEs81G16Qc+MX7JLkeep
 EOnZcq2WzW0ULKdX81AOpbaAwA8sMIfOIvckc+wUwcicfqtDOsn69MAaBou/8gQ6RW8Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/fp5keRNXddhhD0LelvGjZDhxKwLXkjsGdNvYdchTyg=; b=G0I3Kx0DiGjw/kKmHyFdeR+5oK
 ChJSVCsLNrqjUwb9yMXO6QjOS3bk86ZuHSyrfUKz9rYlxiqk1Q49tXO0HYzn0hmhU5vQJxD6O/S5f
 ZDeQhZ63O52QbAYnmUBq7NFdofMpba0sv6JRz6sm8NiA+qZdU2qQyXiW8pPNVRxbDmzU=;
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIzh5-00DLuz-1i
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 19:35:52 +0000
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08HJVsbT032623; Thu, 17 Sep 2020 12:34:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=/fp5keRNXddhhD0LelvGjZDhxKwLXkjsGdNvYdchTyg=;
 b=FmHboE0/2osd0r2TyH4ZMK4iItnfiB5ZnEH9gFqpXOVgVopWyo+iqU8PLLR/hwdE+wRk
 NbsYJuV3i7u6uBlu7EixgsjP3dfElFfdL/wyu2vupXgss7+r2ec1qRmG9HRZNXSjLRjc
 V3b97xNkb5JZEcSiw9A6GczIWTQ5MNFuEss= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 33mc4p8pyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Sep 2020 12:34:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 17 Sep 2020 12:34:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnl7tLC54DE4+TVUcBJkdTddFEGm+9HsMfDUHSoKp5RlFLGCYzJsJEXXc9wkzg4ldQoX3QtDZW98vB3WsrOH2t8RL0EASedIG6mMfwrFVQo8GyyBRyNzLKWJ2B6RlF1d97YBCoG3NXh2Yhv+RAKHzq5CSvy6GhBkiwUDiMjFm4IkzPjtlJX1uuYGpIsqKEnedOexgANfEJ0ddnP+ZnSNt1MmXlznRoR+E2v+ttvZTLKYK3E7hLphEMqgKGhgcrJVzLl1upf2LUbSbdBhsCiEi66i+wrXKOVL9D15Yy21+zUCKkroAHji5sGqNZLBCjDToGig1TVD0D2wbxRuuXio4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fp5keRNXddhhD0LelvGjZDhxKwLXkjsGdNvYdchTyg=;
 b=JRsLVTd+dWy7h+Gt5GUYyia7sadwwBCz1wa8NdevTThj+Jz/BqeGd+lXmaZwxufYFVYrDaDSgYmK76DDEeem4uCvvihCqK3MUgkDESKhtDloTQVCpvwAZoN+N8kznbwvzXRjK0QBDBPcAjdXpArZXJadEPo6kM0BwNiQ2ptNL1duh+ejpMl6itLeANsIOPsPBg8K6d01e3OVSSHRfsVn3Ebuvy6o8euDHJaOdsHgnnGcfWYhA/U/RE/CW/FaSpShJ1uvSUszTNs8pIKaLnreqEeASOnBwUJPpWRPT3znyD5sUP/zs/Ckdbc8+Myh80Fc7rwKjhZCEcrWM1MwJ1PqOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fp5keRNXddhhD0LelvGjZDhxKwLXkjsGdNvYdchTyg=;
 b=iCT+ZYPTF9H2eZkcPjMWvVEUAQctFKRgk0xlAbuqliNTovURDWjtxrkKKVmvaPG8yNhzQeur92jFV2f0dz31tMie9yzb9U1mx12DiV5Lyb3igAyeJQfDju8pncmLuF6eWk3OpFKZPnDwkG+F92k4KndWprt8iJqH2zO+XxQK0ko=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2584.namprd15.prod.outlook.com (2603:10b6:a03:150::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Thu, 17 Sep
 2020 19:34:51 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c%7]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 19:34:51 +0000
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH 6/9] f2fs: zstd: Switch to the zstd-1.4.6 API
Thread-Index: AQHWi9ufSzGQbs/fgE+hHGtC5Bpw36lqzjGAgADLbACAAMcngIAAwGaAgAAaVYA=
Date: Thu, 17 Sep 2020 19:34:50 +0000
Message-ID: <9589E483-A94B-4AF6-8C03-B0763715B40A@fb.com>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
 <20200916034307.2092020-9-nickrterrell@gmail.com>
 <28bf92f1-1246-a840-6195-0e230e517e6d@huawei.com>
 <C8517011-9B6F-499F-BEC6-25BF1F0794AC@fb.com>
 <f7b19bc6-e57f-b4d8-b1f7-89c428b79cdf@huawei.com>
 <C327820B-5BD8-4739-AE4E-04EF27BE8150@fb.com>
In-Reply-To: <C327820B-5BD8-4739-AE4E-04EF27BE8150@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:b19d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f15afe5-4fd0-4dc8-7609-08d85b40bed1
x-ms-traffictypediagnostic: BYAPR15MB2584:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB25848B19A61FEA7E596686D5AB3E0@BYAPR15MB2584.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: apy4rXOHbfrRd/v89VjD3N8B1Gpjmnqf3V7yfo9lk/SRFDq62vJlOx5THDp/xqB1aIHap93EXU2ku9GUb5eIpewvLyjM9lLF6/iKc0pu2funWTtZ8W3uT5blMWsCPnuGzRrCZrdKaFgaS10JRLMGr259spNXP5GgTuoxe1US35mjZAjPTY3t4QtvZ7VodwiSN5cMqDBI9TSmrR92Ajqv9Op805pI8ZREFL4tvZuUuGcjYJP4akG0tQouxK9rras/4//oI6XnTTzzE+xzXMv6wGzhU+a31jCmOYXWmto0z07MB23VcMRC2aTO98CjNIH0WhfosKe0gfzYTL5Ska6GhyzwoD+dUtSugbDaB5/n6zJ5Kcv4YH7t0eajQWJK58jlPwBGk1lXduTnRB/8SKSNI58o7/vrGsvcKqUOgYK/qlncQWHzIPBxemd+wSXdtWHug9GfQkbwYKgUHLNnWp8/kTpY5X3sFGONeixEikSh9oI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(39860400002)(136003)(366004)(2616005)(91956017)(53546011)(478600001)(6506007)(2906002)(66556008)(66476007)(66946007)(8936002)(64756008)(66446008)(33656002)(71200400001)(15188155005)(8676002)(5660300002)(6486002)(16799955002)(6916009)(966005)(4326008)(186003)(83380400001)(76116006)(316002)(36756003)(54906003)(6512007)(86362001)(414714003)(473944003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: UZB/fEPRoMEwR0VQxSaVUhjI4HHboYccNZfeCYH27SOpo0i4LQuKWfpyqV1o+ouyzes4wyH0phTwyn2rseTUjDXqhzFSq3g9k8M/rRvx2Ygln7bqkmjnch4k26eCenve6QD85zT82HwK6hkFrxz3ZNwv0UrsA+pA+fm4wphQ266jAmNPm8h70W68oIp5OhsaWsX4SroYWTlOag0pvzcXUpfTOR8sQC80aPwIRtxHS8E4YoI1dDgfOl2l7t7I74ZFZ8PStBO7UPDx/QXYC3jTkuP81yyNV3lvVreha8Nv9v1uXVnecejFmWsfUY55Zal6h7CvJkYQb51XIWV6t9ZEoRdBxHYPhpq+V4D21tckDa27iUmO5reGi9hXWjX8wpAA3mbvdc+An3ipgSFc+IDVTneg4bH/mhtcascnbjhUEBzDZ7DRDoH/fpP1coEkQhmQGp3o8vg49vQ/LbnP5xn+FvHamUzSPrnOlTUacyKDOsUzBZNqMaia0KpGUXqQ6Zt3qjWLbAZvdcLnENsLcrhfLUezi0inzKFuG8Mb7+zELqOJNPQNxLw6TAHLadEiwLIliV/U7AyxgGesXQ91aVlvYm+5VVoBz91UTsKpptR3qyjdFcoWDZF8bQism0IHE91zIJGWBuAkhXPZRWuHHc/6dDiULQtZW1koG3PwM9YSz9+M8nvRnWU4FLFNqYMbsNSh
Content-ID: <393D561CBC9F934BB637782065A94574@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f15afe5-4fd0-4dc8-7609-08d85b40bed1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 19:34:50.9838 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tw5GwHe6BiV4of/uPlnyw0ItLcdzAN8YXXPl0lob+xtlrZ4xIu1pnoxSL5a1yzLa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2584
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-17_17:2020-09-16,
 2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009170143
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
X-Headers-End: 1kIzh5-00DLuz-1i
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

DQoNCj4gT24gU2VwIDE3LCAyMDIwLCBhdCAxMTowMCBBTSwgTmljayBUZXJyZWxsIDx0ZXJyZWxs
bkBmYi5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gU2VwIDE2LCAyMDIwLCBhdCAxMToz
MSBQTSwgQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPiB3cm90ZToNCj4+IA0KPj4gSGkgTmlj
aywNCj4+IA0KPj4gT24gMjAyMC85LzE3IDI6MzksIE5pY2sgVGVycmVsbCB3cm90ZToNCj4+Pj4g
T24gU2VwIDE1LCAyMDIwLCBhdCAxMTozMSBQTSwgQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29t
PiB3cm90ZToNCj4+Pj4gDQo+Pj4+IEhpIE5pY2ssDQo+Pj4+IA0KPj4+PiByZW1vdmUgbm90IHJl
bGF0ZWQgbWFpbGluZyBsaXN0Lg0KPj4+PiANCj4+Pj4gT24gMjAyMC85LzE2IDExOjQzLCBOaWNr
IFRlcnJlbGwgd3JvdGU6DQo+Pj4+PiBGcm9tOiBOaWNrIFRlcnJlbGwgPHRlcnJlbGxuQGZiLmNv
bT4NCj4+Pj4+IE1vdmUgYXdheSBmcm9tIHRoZSBjb21wYXRpYmlsaXR5IHdyYXBwZXIgdG8gdGhl
IHpzdGQtMS40LjYgQVBJLiBUaGlzDQo+Pj4+PiBjb2RlIGlzIG1vcmUgZWZmaWNpZW50IGJlY2F1
c2UgaXQgdXNlcyB0aGUgc2luZ2xlLXBhc3MgQVBJIGluc3RlYWQgb2YNCj4+Pj4+IHRoZSBzdHJl
YW1pbmcgQVBJLiBUaGUgc3RyZWFtaW5nIEFQSSBpcyBub3QgbmVjZXNzYXJ5IGJlY2F1c2UgdGhl
IHdob2xlDQo+Pj4+PiBpbnB1dCBhbmQgb3V0cHV0IGJ1ZmZlcnMgYXJlIGF2YWlsYWJsZS4gVGhp
cyBzYXZlcyBtZW1vcnkgYmVjYXVzZSB3ZQ0KPj4+Pj4gZG9uJ3QgbmVlZCB0byBhbGxvY2F0ZSBh
IGJ1ZmZlciBmb3IgdGhlIHdpbmRvdy4gSXQgaXMgYWxzbyBtb3JlDQo+Pj4+PiBlZmZpY2llbnQg
YmVjYXVzZSBpdCBzYXZlcyB1bm5lY2Vzc2FyeSBtZW1jcHkgY2FsbHMuDQo+Pj4+PiBJJ3ZlIGhh
ZCBwcm9ibGVtcyB0ZXN0aW5nIHRoaXMgY29kZSBiZWNhdXNlIEkgc2VlIGRhdGEgdHJ1bmNhdGlv
biBiZWZvcmUNCj4+Pj4+IGFuZCBhZnRlciB0aGlzIHBhdGNoc2V0LiBIZWxwIHRlc3RpbmcgdGhp
cyBwYXRjaCB3b3VsZCBiZSBtdWNoDQo+Pj4+PiBhcHByZWNpYXRlZC4NCj4+Pj4gDQo+Pj4+IENh
biB5b3UgcGxlYXNlIGV4cGxhaW4gbW9yZSBhYm91dCBkYXRhIHRydW5jYXRpb24/IEknbSBhIGxp
dHRsZSBjb25mdXNlZC4uLg0KPj4+PiANCj4+Pj4gRG8geW91IG1lYW4gdGhhdCBmMmZzIGRvZXNu
J3QgYWxsb2NhdGUgZW5vdWdoIG1lbW9yeSBmb3IgenN0ZCBjb21wcmVzc2lvbiwNCj4+Pj4gc28g
dGhhdCBjb21wcmVzc2lvbiBpcyBub3QgZmluaXNoZWQgYWN0dWFsbHksIHRoZSBjb21wcmVzc2Vk
IGRhdGEgaXMgdHJ1bmNhdGVkDQo+Pj4+IGF0IGRzdCBidWZmZXI/DQo+Pj4gSGkgQ2hhbywNCj4+
PiBJ4oCZdmUgdGVzdGVkIEYyRlMgdXNpbmcgYSBiZW5jaG1hcmsgSSBhZGFwdGVkIGZyb20gdGVz
dGluZyBCdHJGUyBbMF0uIEl0IGlzIHBvc3NpYmxlDQo+Pj4gdGhhdCB0aGUgc2NyaXB0IEnigJlt
IHVzaW5nIGlzIGJ1Z2d5IG9yIGlzIGV4cG9zaW5nIGFuIGVkZ2UgY2FzZSBpbiBGMkZTLiBUaGUg
ZmlsZXMNCj4+PiB0aGF0IEkgY29weSB0byBGMkZTIGFuZCBjb21wcmVzcyBlbmQgdXAgdHJ1bmNh
dGVkIHdpdGggYSBob2xlIGF0IHRoZSBlbmQuDQo+PiANCj4+IFRoYW5rcyBmb3IgeW91ciBleHBs
YW5hdGlvbi4gOikNCj4+IA0KPj4+IEl0IGlzIGJhc2VkIG9mZiBvZiB1cHN0cmVhbSBjb21taXQg
YWIyOWE4MDdhNy4NCj4+PiBFLmcuIHRoZSBlbmQgb2YgdGhlIGNvcGllZCBmaWxlIGxvb2tzIGxp
a2UgdGhpcywgYnV0IHRoZSBvcmlnaW5hbCBmaWxlIGhhcyBub24temVybyBkYXRhDQo+Pj4gSW4g
dGhlIGVuZC4gVW50aWwgdGhlIGhvbGUgYXQgdGhlIGVuZCB0aGUgZmlsZSBpcyBjb3JyZWN0Lg0K
Pj4+IG9kIGRpY2tlbnMgfCB0YWlsIC1uIDUNCj4+Pj4gNDY2Njc3NjAgMDY3NTAyIDA2NjE2NyAw
MjAwNTYgMDQwNDQwIDAyMDE2MyAwMjM1MTEgMDA2NTU1IDA2MDQxMg0KPj4+PiA0NjY3MDAwMCAw
MDAwMDAgMDAwMDAwIDAwMDAwMCAwMDAwMDAgMDAwMDAwIDAwMDAwMCAwMDAwMDAgMDAwMDAwDQo+
Pj4+ICoNCj4+Pj4gNDY3MDMwNjAgMDAwMDAwIDAwMDAwMCAwMDAwMDAgMDAwMDAwIDAwMDAwMCAw
MDAwMDAgMDAwMDAwDQo+Pj4+IDQ2NzAzMDc2DQo+Pj4gWzBdIGh0dHBzOi8vZ2lzdC5naXRodWIu
Y29tL3RlcnJlbGxuLzdkZDI5MTk5MzdkZmJkYjhlODM5ZTRhZDExYzgxZGI0DQo+PiANCj4+IFNo
b3VsZG4ndCB3ZSBqdXN0IGdldCBzaGExIHZhbHVlIGJ5IGZsaXRlcmluZyBzaGExc3VtIG91dHB1
dD8NCj4+IA0KPj4gICAgICAgICAgICAgICBhc2hhPWBzaGExc3VtICRCRU5DSE1BUktfRElSLyRm
aWxlIHxhd2sgeydwcmludCAkMSd9YA0KPj4gICAgICAgICAgICAgICBic2hhPWBzaGExc3VtICRN
UC8kaS8kZmlsZSB8YXdrIHsncHJpbnQgJDEnfWANCj4gDQo+IFByb2JhYmx5LCBidXQgaXQgd2Fz
IGp1c3QgYSBxdWljayBvbmUtb2ZmIHNjcmlwdC4NCg0KQWgsIG5ldmVyIG1pbmQsIHlvdSBhcmUg
cmlnaHQuDQoNCj4+IEkgY2FuJ3QgcmVwcm9kdWNlIHRoaXMgaXNzdWUgYnkgdXNpbmcgc2ltcGxl
IGRhdGEgc2FtcGxlLCBjb3VsZCB5b3Ugc2hhcmUNCj4+IHRoYXQgJ2RpY2tlbnMnIGZpbGUgb3Ig
b3RoZXIgc21hbGxlci1zaXplZCBzYW1wbGUgaWYgeW91IGhhdmU/DQo+IA0KPiBUaGUgL3RtcC9z
aWxlc2lhIGRpcmVjdG9yeSBpbiB0aGUgZXhhbXBsZSBpcyBwb3B1bGF0ZWQgd2l0aCBhbGwgdGhl
IGZpbGVzIGZyb20NCj4gdGhpcyB3ZWJzaXRlLiBJdCBpcyBhIHBvcHVsYXIgZGF0YSBjb21wcmVz
c2lvbiBiZW5jaG1hcmsgY29ycHVzLiBZb3UgY2FuDQo+IGNsaWNrIG9uIHRoZSDigJx0b3RhbOKA
nSBsaW5rIHRvIGRvd25sb2FkIGEgemlwIGFyY2hpdmUgb2YgYWxsIHRoZSBmaWxlcy4NCj4gDQo+
IGh0dHA6Ly9zdW4uYWVpLnBvbHNsLnBsL35zZGVvci9pbmRleC5waHA/cGFnZT1zaWxlc2lhDQo+
IA0KPiAtTmljaw0KDQpJ4oCZdmUgc3BlbnQgc29tZSB0aW1lIG1pbmltaXppbmcgdGhlIHRlc3Qg
Y2FzZS4gVGhpcyBzY3JpcHQgWzBdIGlzIHRoZSBtaW5pbWl6ZWQNCnRlc3QgY2FzZSB0aGF0IGRv
ZXNu4oCZdCByZXF1aXJlIGFueSBpbnB1dCBmaWxlcywgaXQgYnVpbGRzIGl0cyBvd24uDQoNClNl
dmVyYWwgb2JzZXJ2YXRpb25zOg0KKiBUaGUgaW5wdXQgZmlsZSBuZWVkcyB0byBiZSA3NzAwNDgx
IGJ5dGVzIGxhcmdlLCBzbWFsbGVyIGZpbGVzIGRvbuKAmXQgdHJpZ2dlciB0aGUgYnVnLg0KKiBZ
b3UgaGF2ZSB0byBgY2hhdHRyICtjYCB0aGUgZmlsZSBhZnRlciBjb3B5aW5nIGl0IG90aGVyd2lz
ZSB0aGUgYnVnIGRvZXNu4oCZdCBvY2N1ci4NCiogQWZ0ZXIgYGNoYXR0ciArY2AgeW91IGhhdmUg
dG8gdW5tb3VudCBhbmQgcmVtb3VudCB0aGUgZmlsZXN5c3RlbSB0byB0cmlnZ2VyIHRoZSBidWcu
DQoNCknigJl2ZSByZXByb2R1Y2VkIG9uIHY1LjktcmM1ICg4NTZkZWI4NjZkMTZlKS4gSeKAmXZl
IGFsc28gcmVwcm9kdWNlZCBvbiBteSBob3N0IG1hY2hpbmUNCnJ1bm5pbmcgNS44LjUtYXJjaDEt
MS4NCg0KWzBdIGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL3RlcnJlbGxuLzRiYmEzMjVhYmRmYTNh
NmYwMTRlOTkxMWFjOTJhMTg1DQoNCkJlc3QsDQpOaWNrDQoNCj4+IFRoYW5rcywNCj4+IA0KPj4+
IEJlc3QsDQo+Pj4gTmljaw0KPj4+PiBUaGFua3MsDQo+Pj4+IA0KPj4+Pj4gU2lnbmVkLW9mZi1i
eTogTmljayBUZXJyZWxsIDx0ZXJyZWxsbkBmYi5jb20+DQo+Pj4+PiAtLS0NCj4+Pj4+IGZzL2Yy
ZnMvY29tcHJlc3MuYyB8IDEwMiArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4+Pj4+IDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCA2NCBkZWxl
dGlvbnMoLSkNCj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NvbXByZXNzLmMgYi9mcy9mMmZz
L2NvbXByZXNzLmMNCj4+Pj4+IGluZGV4IGUwNTZmM2EyYjQwNC4uYjc5ZWZjZTgxNjUxIDEwMDY0
NA0KPj4+Pj4gLS0tIGEvZnMvZjJmcy9jb21wcmVzcy5jDQo+Pj4+PiArKysgYi9mcy9mMmZzL2Nv
bXByZXNzLmMNCj4+Pj4+IEBAIC0xMSw3ICsxMSw4IEBADQo+Pj4+PiAjaW5jbHVkZSA8bGludXgv
YmFja2luZy1kZXYuaD4NCj4+Pj4+ICNpbmNsdWRlIDxsaW51eC9sem8uaD4NCj4+Pj4+ICNpbmNs
dWRlIDxsaW51eC9sejQuaD4NCj4+Pj4+IC0jaW5jbHVkZSA8bGludXgvenN0ZF9jb21wYXQuaD4N
Cj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvenN0ZC5oPg0KPj4+Pj4gKyNpbmNsdWRlIDxsaW51eC96
c3RkX2Vycm9ycy5oPg0KPj4+Pj4gICAjaW5jbHVkZSAiZjJmcy5oIg0KPj4+Pj4gI2luY2x1ZGUg
Im5vZGUuaCINCj4+Pj4+IEBAIC0yOTgsMjEgKzI5OSwyMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGYyZnNfY29tcHJlc3Nfb3BzIGYyZnNfbHo0X29wcyA9IHsNCj4+Pj4+IHN0YXRpYyBpbnQgenN0
ZF9pbml0X2NvbXByZXNzX2N0eChzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYykNCj4+Pj4+IHsNCj4+
Pj4+IAlaU1REX3BhcmFtZXRlcnMgcGFyYW1zOw0KPj4+Pj4gLQlaU1REX0NTdHJlYW0gKnN0cmVh
bTsNCj4+Pj4+ICsJWlNURF9DQ3R4ICpjdHg7DQo+Pj4+PiAJdm9pZCAqd29ya3NwYWNlOw0KPj4+
Pj4gCXVuc2lnbmVkIGludCB3b3Jrc3BhY2Vfc2l6ZTsNCj4+Pj4+ICAgCXBhcmFtcyA9IFpTVERf
Z2V0UGFyYW1zKEYyRlNfWlNURF9ERUZBVUxUX0NMRVZFTCwgY2MtPnJsZW4sIDApOw0KPj4+Pj4g
LQl3b3Jrc3BhY2Vfc2l6ZSA9IFpTVERfQ1N0cmVhbVdvcmtzcGFjZUJvdW5kKHBhcmFtcy5jUGFy
YW1zKTsNCj4+Pj4+ICsJd29ya3NwYWNlX3NpemUgPSBaU1REX2VzdGltYXRlQ0N0eFNpemVfdXNp
bmdDUGFyYW1zKHBhcmFtcy5jUGFyYW1zKTsNCj4+Pj4+ICAgCXdvcmtzcGFjZSA9IGYyZnNfa3Zt
YWxsb2MoRjJGU19JX1NCKGNjLT5pbm9kZSksDQo+Pj4+PiAJCQkJCXdvcmtzcGFjZV9zaXplLCBH
RlBfTk9GUyk7DQo+Pj4+PiAJaWYgKCF3b3Jrc3BhY2UpDQo+Pj4+PiAJCXJldHVybiAtRU5PTUVN
Ow0KPj4+Pj4gLQlzdHJlYW0gPSBaU1REX2luaXRDU3RyZWFtKHBhcmFtcywgMCwgd29ya3NwYWNl
LCB3b3Jrc3BhY2Vfc2l6ZSk7DQo+Pj4+PiAtCWlmICghc3RyZWFtKSB7DQo+Pj4+PiAtCQlwcmlu
dGtfcmF0ZWxpbWl0ZWQoIiVzRjJGUy1mcyAoJXMpOiAlcyBaU1REX2luaXRDU3RyZWFtIGZhaWxl
ZFxuIiwNCj4+Pj4+ICsJY3R4ID0gWlNURF9pbml0U3RhdGljQ0N0eCh3b3Jrc3BhY2UsIHdvcmtz
cGFjZV9zaXplKTsNCj4+Pj4+ICsJaWYgKCFjdHgpIHsNCj4+Pj4+ICsJCXByaW50a19yYXRlbGlt
aXRlZCgiJXNGMkZTLWZzICglcyk6ICVzIFpTVERfaW5pdHRhdGljQ1N0cmVhbSBmYWlsZWRcbiIs
DQo+Pj4+PiAJCQkJS0VSTl9FUlIsIEYyRlNfSV9TQihjYy0+aW5vZGUpLT5zYi0+c19pZCwNCj4+
Pj4+IAkJCQlfX2Z1bmNfXyk7DQo+Pj4+PiAJCWt2ZnJlZSh3b3Jrc3BhY2UpOw0KPj4+Pj4gQEAg
LTMyMCw3ICszMjEsNyBAQCBzdGF0aWMgaW50IHpzdGRfaW5pdF9jb21wcmVzc19jdHgoc3RydWN0
IGNvbXByZXNzX2N0eCAqY2MpDQo+Pj4+PiAJfQ0KPj4+Pj4gICAJY2MtPnByaXZhdGUgPSB3b3Jr
c3BhY2U7DQo+Pj4+PiAtCWNjLT5wcml2YXRlMiA9IHN0cmVhbTsNCj4+Pj4+ICsJY2MtPnByaXZh
dGUyID0gY3R4Ow0KPj4+Pj4gICAJY2MtPmNsZW4gPSBjYy0+cmxlbiAtIFBBR0VfU0laRSAtIENP
TVBSRVNTX0hFQURFUl9TSVpFOw0KPj4+Pj4gCXJldHVybiAwOw0KPj4+Pj4gQEAgLTMzNSw2NSAr
MzM2LDQ4IEBAIHN0YXRpYyB2b2lkIHpzdGRfZGVzdHJveV9jb21wcmVzc19jdHgoc3RydWN0IGNv
bXByZXNzX2N0eCAqY2MpDQo+Pj4+PiAgIHN0YXRpYyBpbnQgenN0ZF9jb21wcmVzc19wYWdlcyhz
dHJ1Y3QgY29tcHJlc3NfY3R4ICpjYykNCj4+Pj4+IHsNCj4+Pj4+IC0JWlNURF9DU3RyZWFtICpz
dHJlYW0gPSBjYy0+cHJpdmF0ZTI7DQo+Pj4+PiAtCVpTVERfaW5CdWZmZXIgaW5idWY7DQo+Pj4+
PiAtCVpTVERfb3V0QnVmZmVyIG91dGJ1ZjsNCj4+Pj4+IC0JaW50IHNyY19zaXplID0gY2MtPnJs
ZW47DQo+Pj4+PiAtCWludCBkc3Rfc2l6ZSA9IHNyY19zaXplIC0gUEFHRV9TSVpFIC0gQ09NUFJF
U1NfSEVBREVSX1NJWkU7DQo+Pj4+PiAtCWludCByZXQ7DQo+Pj4+PiAtDQo+Pj4+PiAtCWluYnVm
LnBvcyA9IDA7DQo+Pj4+PiAtCWluYnVmLnNyYyA9IGNjLT5yYnVmOw0KPj4+Pj4gLQlpbmJ1Zi5z
aXplID0gc3JjX3NpemU7DQo+Pj4+PiAtDQo+Pj4+PiAtCW91dGJ1Zi5wb3MgPSAwOw0KPj4+Pj4g
LQlvdXRidWYuZHN0ID0gY2MtPmNidWYtPmNkYXRhOw0KPj4+Pj4gLQlvdXRidWYuc2l6ZSA9IGRz
dF9zaXplOw0KPj4+Pj4gLQ0KPj4+Pj4gLQlyZXQgPSBaU1REX2NvbXByZXNzU3RyZWFtKHN0cmVh
bSwgJm91dGJ1ZiwgJmluYnVmKTsNCj4+Pj4+IC0JaWYgKFpTVERfaXNFcnJvcihyZXQpKSB7DQo+
Pj4+PiAtCQlwcmludGtfcmF0ZWxpbWl0ZWQoIiVzRjJGUy1mcyAoJXMpOiAlcyBaU1REX2NvbXBy
ZXNzU3RyZWFtIGZhaWxlZCwgcmV0OiAlZFxuIiwNCj4+Pj4+IC0JCQkJS0VSTl9FUlIsIEYyRlNf
SV9TQihjYy0+aW5vZGUpLT5zYi0+c19pZCwNCj4+Pj4+IC0JCQkJX19mdW5jX18sIFpTVERfZ2V0
RXJyb3JDb2RlKHJldCkpOw0KPj4+Pj4gLQkJcmV0dXJuIC1FSU87DQo+Pj4+PiAtCX0NCj4+Pj4+
IC0NCj4+Pj4+IC0JcmV0ID0gWlNURF9lbmRTdHJlYW0oc3RyZWFtLCAmb3V0YnVmKTsNCj4+Pj4+
ICsJWlNURF9DQ3R4ICpjdHggPSBjYy0+cHJpdmF0ZTI7DQo+Pj4+PiArCWNvbnN0IHNpemVfdCBz
cmNfc2l6ZSA9IGNjLT5ybGVuOw0KPj4+Pj4gKwljb25zdCBzaXplX3QgZHN0X3NpemUgPSBzcmNf
c2l6ZSAtIFBBR0VfU0laRSAtIENPTVBSRVNTX0hFQURFUl9TSVpFOw0KPj4+Pj4gKwlaU1REX3Bh
cmFtZXRlcnMgcGFyYW1zID0gWlNURF9nZXRQYXJhbXMoRjJGU19aU1REX0RFRkFVTFRfQ0xFVkVM
LCBzcmNfc2l6ZSwgMCk7DQo+Pj4+PiArCXNpemVfdCByZXQ7DQo+Pj4+PiArDQo+Pj4+PiArCXJl
dCA9IFpTVERfY29tcHJlc3NfYWR2YW5jZWQoDQo+Pj4+PiArCQkJY3R4LCBjYy0+Y2J1Zi0+Y2Rh
dGEsIGRzdF9zaXplLCBjYy0+cmJ1Ziwgc3JjX3NpemUsIE5VTEwsIDAsIHBhcmFtcyk7DQo+Pj4+
PiAJaWYgKFpTVERfaXNFcnJvcihyZXQpKSB7DQo+Pj4+PiAtCQlwcmludGtfcmF0ZWxpbWl0ZWQo
IiVzRjJGUy1mcyAoJXMpOiAlcyBaU1REX2VuZFN0cmVhbSByZXR1cm5lZCAlZFxuIiwNCj4+Pj4+
ICsJCS8qDQo+Pj4+PiArCQkgKiB0aGVyZSBpcyBjb21wcmVzc2VkIGRhdGEgcmVtYWluZWQgaW4g
aW50ZXJtZWRpYXRlIGJ1ZmZlciBkdWUgdG8NCj4+Pj4+ICsJCSAqIG5vIG1vcmUgc3BhY2UgaW4g
Y2J1Zi5jZGF0YQ0KPj4+Pj4gKwkJICovDQo+Pj4+PiArCQlpZiAoWlNURF9nZXRFcnJvckNvZGUo
cmV0KSA9PSBaU1REX2Vycm9yX2RzdFNpemVfdG9vU21hbGwpDQo+Pj4+PiArCQkJcmV0dXJuIC1F
QUdBSU47DQo+Pj4+PiArCQkvKiBvdGhlciBjb21wcmVzc2lvbiBlcnJvcnMgcmV0dXJuIC1FSU8g
Ki8NCj4+Pj4+ICsJCXByaW50a19yYXRlbGltaXRlZCgiJXNGMkZTLWZzICglcyk6ICVzIFpTVERf
Y29tcHJlc3NfYWR2YW5jZWQgZmFpbGVkLCBlcnI6ICVzXG4iLA0KPj4+Pj4gCQkJCUtFUk5fRVJS
LCBGMkZTX0lfU0IoY2MtPmlub2RlKS0+c2ItPnNfaWQsDQo+Pj4+PiAtCQkJCV9fZnVuY19fLCBa
U1REX2dldEVycm9yQ29kZShyZXQpKTsNCj4+Pj4+ICsJCQkJX19mdW5jX18sIFpTVERfZ2V0RXJy
b3JOYW1lKHJldCkpOw0KPj4+Pj4gCQlyZXR1cm4gLUVJTzsNCj4+Pj4+IAl9DQo+Pj4+PiAtCS8q
DQo+Pj4+PiAtCSAqIHRoZXJlIGlzIGNvbXByZXNzZWQgZGF0YSByZW1haW5lZCBpbiBpbnRlcm1l
ZGlhdGUgYnVmZmVyIGR1ZSB0bw0KPj4+Pj4gLQkgKiBubyBtb3JlIHNwYWNlIGluIGNidWYuY2Rh
dGENCj4+Pj4+IC0JICovDQo+Pj4+PiAtCWlmIChyZXQpDQo+Pj4+PiAtCQlyZXR1cm4gLUVBR0FJ
TjsNCj4+Pj4+IC0NCj4+Pj4+IC0JY2MtPmNsZW4gPSBvdXRidWYucG9zOw0KPj4+Pj4gKwljYy0+
Y2xlbiA9IHJldDsNCj4+Pj4+IAlyZXR1cm4gMDsNCj4+Pj4+IH0NCj4+Pj4+ICAgc3RhdGljIGlu
dCB6c3RkX2luaXRfZGVjb21wcmVzc19jdHgoc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMp
DQo+Pj4+PiB7DQo+Pj4+PiAtCVpTVERfRFN0cmVhbSAqc3RyZWFtOw0KPj4+Pj4gKwlaU1REX0RD
dHggKmN0eDsNCj4+Pj4+IAl2b2lkICp3b3Jrc3BhY2U7DQo+Pj4+PiAJdW5zaWduZWQgaW50IHdv
cmtzcGFjZV9zaXplOw0KPj4+Pj4gLQl3b3Jrc3BhY2Vfc2l6ZSA9IFpTVERfRFN0cmVhbVdvcmtz
cGFjZUJvdW5kKE1BWF9DT01QUkVTU19XSU5ET1dfU0laRSk7DQo+Pj4+PiArCXdvcmtzcGFjZV9z
aXplID0gWlNURF9lc3RpbWF0ZURDdHhTaXplKCk7DQo+Pj4+PiAgIAl3b3Jrc3BhY2UgPSBmMmZz
X2t2bWFsbG9jKEYyRlNfSV9TQihkaWMtPmlub2RlKSwNCj4+Pj4+IAkJCQkJd29ya3NwYWNlX3Np
emUsIEdGUF9OT0ZTKTsNCj4+Pj4+IAlpZiAoIXdvcmtzcGFjZSkNCj4+Pj4+IAkJcmV0dXJuIC1F
Tk9NRU07DQo+Pj4+PiAtCXN0cmVhbSA9IFpTVERfaW5pdERTdHJlYW0oTUFYX0NPTVBSRVNTX1dJ
TkRPV19TSVpFLA0KPj4+Pj4gLQkJCQkJd29ya3NwYWNlLCB3b3Jrc3BhY2Vfc2l6ZSk7DQo+Pj4+
PiAtCWlmICghc3RyZWFtKSB7DQo+Pj4+PiAtCQlwcmludGtfcmF0ZWxpbWl0ZWQoIiVzRjJGUy1m
cyAoJXMpOiAlcyBaU1REX2luaXREU3RyZWFtIGZhaWxlZFxuIiwNCj4+Pj4+ICsJY3R4ID0gWlNU
RF9pbml0U3RhdGljREN0eCh3b3Jrc3BhY2UsIHdvcmtzcGFjZV9zaXplKTsNCj4+Pj4+ICsJaWYg
KCFjdHgpIHsNCj4+Pj4+ICsJCXByaW50a19yYXRlbGltaXRlZCgiJXNGMkZTLWZzICglcyk6ICVz
IFpTVERfaW5pdFN0YXRpY0RDdHggZmFpbGVkXG4iLA0KPj4+Pj4gCQkJCUtFUk5fRVJSLCBGMkZT
X0lfU0IoZGljLT5pbm9kZSktPnNiLT5zX2lkLA0KPj4+Pj4gCQkJCV9fZnVuY19fKTsNCj4+Pj4+
IAkJa3ZmcmVlKHdvcmtzcGFjZSk7DQo+Pj4+PiBAQCAtNDAxLDcgKzM4NSw3IEBAIHN0YXRpYyBp
bnQgenN0ZF9pbml0X2RlY29tcHJlc3NfY3R4KHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCAqZGlj
KQ0KPj4+Pj4gCX0NCj4+Pj4+ICAgCWRpYy0+cHJpdmF0ZSA9IHdvcmtzcGFjZTsNCj4+Pj4+IC0J
ZGljLT5wcml2YXRlMiA9IHN0cmVhbTsNCj4+Pj4+ICsJZGljLT5wcml2YXRlMiA9IGN0eDsNCj4+
Pj4+ICAgCXJldHVybiAwOw0KPj4+Pj4gfQ0KPj4+Pj4gQEAgLTQxNSwyOCArMzk5LDE4IEBAIHN0
YXRpYyB2b2lkIHpzdGRfZGVzdHJveV9kZWNvbXByZXNzX2N0eChzdHJ1Y3QgZGVjb21wcmVzc19p
b19jdHggKmRpYykNCj4+Pj4+ICAgc3RhdGljIGludCB6c3RkX2RlY29tcHJlc3NfcGFnZXMoc3Ry
dWN0IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMpDQo+Pj4+PiB7DQo+Pj4+PiAtCVpTVERfRFN0cmVh
bSAqc3RyZWFtID0gZGljLT5wcml2YXRlMjsNCj4+Pj4+IC0JWlNURF9pbkJ1ZmZlciBpbmJ1ZjsN
Cj4+Pj4+IC0JWlNURF9vdXRCdWZmZXIgb3V0YnVmOw0KPj4+Pj4gLQlpbnQgcmV0Ow0KPj4+Pj4g
LQ0KPj4+Pj4gLQlpbmJ1Zi5wb3MgPSAwOw0KPj4+Pj4gLQlpbmJ1Zi5zcmMgPSBkaWMtPmNidWYt
PmNkYXRhOw0KPj4+Pj4gLQlpbmJ1Zi5zaXplID0gZGljLT5jbGVuOw0KPj4+Pj4gLQ0KPj4+Pj4g
LQlvdXRidWYucG9zID0gMDsNCj4+Pj4+IC0Jb3V0YnVmLmRzdCA9IGRpYy0+cmJ1ZjsNCj4+Pj4+
IC0Jb3V0YnVmLnNpemUgPSBkaWMtPnJsZW47DQo+Pj4+PiArCVpTVERfREN0eCAqY3R4ID0gZGlj
LT5wcml2YXRlMjsNCj4+Pj4+ICsJc2l6ZV90IHJldDsNCj4+Pj4+IC0JcmV0ID0gWlNURF9kZWNv
bXByZXNzU3RyZWFtKHN0cmVhbSwgJm91dGJ1ZiwgJmluYnVmKTsNCj4+Pj4+ICsJcmV0ID0gWlNU
RF9kZWNvbXByZXNzREN0eChjdHgsIGRpYy0+cmJ1ZiwgZGljLT5ybGVuLCBkaWMtPmNidWYtPmNk
YXRhLCBkaWMtPmNsZW4pOw0KPj4+Pj4gCWlmIChaU1REX2lzRXJyb3IocmV0KSkgew0KPj4+Pj4g
LQkJcHJpbnRrX3JhdGVsaW1pdGVkKCIlc0YyRlMtZnMgKCVzKTogJXMgWlNURF9jb21wcmVzc1N0
cmVhbSBmYWlsZWQsIHJldDogJWRcbiIsDQo+Pj4+PiArCQlwcmludGtfcmF0ZWxpbWl0ZWQoIiVz
RjJGUy1mcyAoJXMpOiAlcyBaU1REX2RlY29tcHJlc3NEQ3R4IGZhaWxlZCwgZXJyOiAlc1xuIiwN
Cj4+Pj4+IAkJCQlLRVJOX0VSUiwgRjJGU19JX1NCKGRpYy0+aW5vZGUpLT5zYi0+c19pZCwNCj4+
Pj4+IC0JCQkJX19mdW5jX18sIFpTVERfZ2V0RXJyb3JDb2RlKHJldCkpOw0KPj4+Pj4gKwkJCQlf
X2Z1bmNfXywgWlNURF9nZXRFcnJvck5hbWUocmV0KSk7DQo+Pj4+PiAJCXJldHVybiAtRUlPOw0K
Pj4+Pj4gCX0NCj4+Pj4+IC0JaWYgKGRpYy0+cmxlbiAhPSBvdXRidWYucG9zKSB7DQo+Pj4+PiAr
CWlmIChkaWMtPnJsZW4gIT0gcmV0KSB7DQo+Pj4+PiAJCXByaW50a19yYXRlbGltaXRlZCgiJXNG
MkZTLWZzICglcyk6ICVzIFpTVEQgaW52YWxpZCBybGVuOiV6dSwgIg0KPj4+Pj4gCQkJCSJleHBl
Y3RlZDolbHVcbiIsIEtFUk5fRVJSLA0KPj4+Pj4gCQkJCUYyRlNfSV9TQihkaWMtPmlub2RlKS0+
c2ItPnNfaWQsDQoNCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
