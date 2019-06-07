Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F9F387E3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jun 2019 12:26:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fRbA99c3M6wVlUdMKA4t8gPnmmFWjD7BittVewv5hzY=; b=RmAMr5oLlXOWq7/yGOu77p/G+
	tLrEt1RcHjJhPxidMRJp1RTFg4k8vSPmCmML6VH/riaTmzxyfDVE1Ui2AJTbfO9RcAY6MiT7ePJxp
	I8DZC61dp9mi/undsZT9fcTcLNqrYUzrlk/+kAZEl7ib/sveZ4fePa7yXjSYgVh7EMZio=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hZC4L-0001iX-3S; Fri, 07 Jun 2019 10:25:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wshilong@ddn.com>) id 1hZC4K-0001iM-CF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 Jun 2019 10:25:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6cSWUm3ysr5+RNRb7RKW9RTe5YYg8e5nPGwdOzPJypw=; b=HB9T8e2QZxFD6YM9CxkvxVH9Nm
 Ft6Aun9wOQ0fcD/heK6Qjj6RIvxXNJnae3GLl42jnwPAQJlZrgBbIQNoebM0+vekMlXWo4T9qWZKd
 ZLG2Wwrr4rwKBk9XaLp8LnNC/lV8GPdw4jm7Gnx2dlzIBmU+KS593nTpL4zuXePulMoI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6cSWUm3ysr5+RNRb7RKW9RTe5YYg8e5nPGwdOzPJypw=; b=fpBg/GTV+HRmxxNfYR66Gaud7v
 3HoTd7K+xBqm7Pca81/Dm6UFlVdTesx2pjmh16EDrIKAAyoZZocH2Fro/dJvQmoP1upaMQGf6Um7M
 m3/UiG8zPCQZeew/zEwOLpjvXuYUDgS8L2WqqBC+OBfjwhwEqxjiOzwFqMVOicTx3Ni4=;
Received: from mail-eopbgr750075.outbound.protection.outlook.com
 ([40.107.75.75] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.90_1)
 id 1hZC4D-00Gscx-Lc
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 Jun 2019 10:25:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ddn.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cSWUm3ysr5+RNRb7RKW9RTe5YYg8e5nPGwdOzPJypw=;
 b=rR2sy65mGMjxcldvkuRv6S0yMQcnULTLx9aRxpo/23v+58E4myDwVMvDOpAfz9BSh0+rZM/bh8Kzojm6G/o1BUVOhqq/BwJWM+nfvORkqh3TzANHVk/74q9zDmaUWC3RkPiB+6RPKCDOVqchIWVehwttBRdm6jXey1F98fj8mp0=
Received: from MN2PR19MB3167.namprd19.prod.outlook.com (10.255.181.16) by
 MN2PR19MB2735.namprd19.prod.outlook.com (20.178.253.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.13; Fri, 7 Jun 2019 07:51:18 +0000
Received: from MN2PR19MB3167.namprd19.prod.outlook.com
 ([fe80::dc80:b43c:bae8:93ac]) by MN2PR19MB3167.namprd19.prod.outlook.com
 ([fe80::dc80:b43c:bae8:93ac%6]) with mapi id 15.20.1943.026; Fri, 7 Jun 2019
 07:51:18 +0000
To: Eric Biggers <ebiggers@kernel.org>, Wang Shilong
 <wangshilong1991@gmail.com>
Thread-Topic: =?utf-8?B?5Zue5aSNOiBbZjJmcy1kZXZdIFtQQVRDSCAxLzJdIGV4dDQ6IG9ubHkgc2V0?=
 =?utf-8?Q?_project_inherit_bit_for_directory?=
Thread-Index: AQHVHCDgP31HN+WHkUOSSixxIe14jqaPOs2AgAEcVks=
Date: Fri, 7 Jun 2019 07:51:18 +0000
Message-ID: <MN2PR19MB3167ED3E8C9C85AE510F7BF4D4100@MN2PR19MB3167.namprd19.prod.outlook.com>
References: <1559795545-17290-1-git-send-email-wshilong1991@gmail.com>,
 <20190606224525.GB84833@gmail.com>
In-Reply-To: <20190606224525.GB84833@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=wshilong@ddn.com; 
x-originating-ip: [36.62.197.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2640f44-2521-491f-52af-08d6eb1ced0a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR19MB2735; 
x-ms-traffictypediagnostic: MN2PR19MB2735:
x-microsoft-antispam-prvs: <MN2PR19MB27352A172E408ED1BC881488D4100@MN2PR19MB2735.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39850400004)(376002)(366004)(136003)(346002)(396003)(189003)(199004)(43544003)(4326008)(476003)(14454004)(26005)(53936002)(446003)(66066001)(6506007)(99286004)(76176011)(52536014)(102836004)(224303003)(68736007)(7696005)(86362001)(11346002)(2906002)(25786009)(71190400001)(71200400001)(186003)(486006)(54906003)(110136005)(478600001)(33656002)(316002)(6436002)(66446008)(66556008)(64756008)(66476007)(305945005)(7736002)(8936002)(81166006)(55016002)(74316002)(5660300002)(81156014)(6116002)(73956011)(3846002)(76116006)(9686003)(4744005)(66946007)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR19MB2735;
 H:MN2PR19MB3167.namprd19.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: ddn.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qVZM2XaB7Ael6yTX4efDK5+OJja/aGK9DiqI2PhFbXoHZQtVXALOW4JcOh6jK0AjMHagxIhpUgASjPuYV1yRVeMzSp3JrAAQnJqzQ9R0VpsdXZEnwhe4/AtssdITAtsiPiWT9gEGXUBaBp2odnFYLLGaxVhYoA/7/kDreiEO0uj4JI5eh8E2prhLKWQ8Q83CK9gdK6OV/M4r8kPa5NWIQrLnm63I9Ef/cG+iVfavUgR1v04t/3br5iklEGbqOpzeFHtgmENxWhSLLfpy5Np2qbbiTT+knkeJMzbRjyKlBRj3inmlPaJgwo8LZ3o8hSnw8uTDV57xtKVpBaC6hkqi3cQY5qPKczO8bu2Umo0il1k2yd4v/1EnxW5xTWsBLTJLh3dN4xw43ZdpU2DCdIXJ63p6AAthTrtvqY05zMk47DE=
MIME-Version: 1.0
X-OriginatorOrg: ddn.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2640f44-2521-491f-52af-08d6eb1ced0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 07:51:18.5603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 753b6e26-6fd3-43e6-8248-3f1735d59bb4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wshilong@ddn.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB2735
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [40.107.75.75 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hZC4D-00Gscx-Lc
Subject: [f2fs-dev] =?utf-8?b?5Zue5aSNOiAgW1BBVENIIDEvMl0gZXh0NDogb25seSBz?=
 =?utf-8?q?et_project_inherit_bit_for_directory?=
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
From: Wang Shilong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wang Shilong <wshilong@ddn.com>
Cc: Andreas Dilger <adilger@dilger.ca>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGksCgo+IC0tCj4gMi4yMS4wCgpXb24ndCB0aGlzIGJyZWFrICdjaGF0dHInIG9uIGZpbGVzIHRo
YXQgYWxyZWFkeSBoYXZlIHRoaXMgZmxhZyBzZXQ/CkZTX0lPQ19HRVRGTEFHUyB3aWxsIHJldHVy
biB0aGlzIGZsYWcsIHNvICdjaGF0dHInIHdpbGwgcGFzcyBpdCBiYWNrIHRvCkZTX0lPQ19TRVRG
TEFHUyB3aGljaCB3aWxsIHJldHVybiBFT1BOT1RTVVBQIGR1ZSB0byB0aGlzOgoKwqAgwqAgwqAg
wqAgaWYgKGV4dDRfbWFza19mbGFncyhpbm9kZS0+aV9tb2RlLCBmbGFncykgIT0gZmxhZ3MpCsKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiAtRU9QTk9UU1VQUDsKCj4+Pj4KCllvdSBhcmUg
cmlnaHQgZm9yIHRoaXMgYW5kIHdlIGFsc28gbmVlZCB0YWtlIGNhcmUgb2YgdGhpcyBpbiBFWFQ0
X0lPQ19GU1NFVFhBVFRSLwp0aGlzIGlzIGEgYml0IHN0cmFuZ2UgYmVoYXZpb3IgYXMgY2hhdHRy
IHJlYWQgZXhpc3RlZCBmbGFncwpidXQgY291bGQgbm90IHNldCB0aGVtIGFnYWluLCB0aGVyZSBh
cmUgc2V2ZXJhbCBwb3NzaWJsZSB3YXlzIHRoYXQgSSBjb3VsZCB0aGluawpvZiB0byBmaXggdGhl
IGlzc3VlPwoKMSkgY2hhbmdlIGNoYXR0ciB0byBmaWx0ZXIgUHJvamVjdCBpbmhlcml0IGJpdCBi
ZWZvcmUgY2FsbCBGU19JT0NfU0VURkxBR1MKCjIpIHdlIGF1dG9tYXRpY2FsbHkgZml4ZWQgdGhl
IGZsYWcgYmVmb3JlIG1hc2sgY2hlY2ssIHNvbWV0aGluZyBsaWtlOgppZiByZWc6CiAgICAgZmxh
Z3MgJj0gflBST0pFQ1RfSU5IRVJUOwogICAgICBpZiAoZXh0NF9tYXNrX2ZsYWdzKGlub2RlLT5p
X21vZGUsIGZsYWdzKSAhPSBmbGFncykKwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIC1F
T1BOT1RTVVBQOwpCdXQgdGhpcyBtaWdodCBiZSBub3QgZ29vZC4uCgpJIHdvdWxkIHByZWZlciBz
b2x1dGlvbiAxKQpXaGF0IGRvIHlvdSB0aGluaz8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
