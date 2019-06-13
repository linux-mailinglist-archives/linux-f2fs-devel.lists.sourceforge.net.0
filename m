Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD75A435BE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Jun 2019 14:08:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xbs/t2slyCVuzU8xOl56YiAaFR8hj0WUt1lDoYW71A8=; b=h7/rH9L7MIEH12YYBQs9G3ixH
	b6BluQ4mV8yd6uvKJNINtoLmH2I3cfhQPpqip3tf2ecanTMLEVT4FtYi9vpmUua9tvjmqODaI1uoC
	HKIuEOCK6ur7zHpRKDv87Y+oagqcMhkJDQwgm9QWzzFHfrEC/65I/Abh5foaBDMg9Fc7M=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hbOWM-0008Cp-40; Thu, 13 Jun 2019 12:07:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wshilong@ddn.com>) id 1hbOWK-0008Ca-V6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 12:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=61kvRBY7Sb/+631jV1snlv0jDD40Yfex/sO0GjRVvQc=; b=Mf/pdUqd7uVMyFR61ny1zO3AIz
 9euAlLdMrn/E9MLNuQng3ta4T2jh/975V3nDCc74bk8VWaM+1a0/EX9rRAnKN6Xd+Q7xawocthYf8
 0dmmEefyOoVxKwWCsQPSgus9e4HgCVcbXxvS5W3oixUuaHNPtI/u5EM1/MppuzXlerV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=61kvRBY7Sb/+631jV1snlv0jDD40Yfex/sO0GjRVvQc=; b=ln8FAC7KztDe+/3T9guKj49hVA
 LqUzHNJk5FcXG5vkI0Oz+INZzlbKtrwHSjGliHUmaoto7Ej4xr3jQckN1wgLNb57RCbuqE+YNn5if
 fXxNSscZoQjQu6+PiydV+QI0WTyz4bhb8u+uhVONZmijOZUCHR3iozCUyUwWHB7d8cyI=;
Received: from mail-eopbgr820048.outbound.protection.outlook.com
 ([40.107.82.48] helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hbOWF-0051Sh-4b
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 12:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ddn.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61kvRBY7Sb/+631jV1snlv0jDD40Yfex/sO0GjRVvQc=;
 b=Xz4hcMwqUT3RdZ78k0vQg/b8Q8WQVQB3P6R/3akrwduWhm8THrzAZqjo2Y0IRioG9nxriQvjJDESN461MXAr6T/S7Gpsx7tFjBkyHN3OgKf4bgNdS2OBNYywqY12KffpVyxx4dOeOYC5QpufozxmXMISyQObT9yA6iiYvILxz50=
Received: from MN2PR19MB3167.namprd19.prod.outlook.com (10.255.181.16) by
 MN2PR19MB2717.namprd19.prod.outlook.com (20.178.253.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Thu, 13 Jun 2019 07:34:09 +0000
Received: from MN2PR19MB3167.namprd19.prod.outlook.com
 ([fe80::dc80:b43c:bae8:93ac]) by MN2PR19MB3167.namprd19.prod.outlook.com
 ([fe80::dc80:b43c:bae8:93ac%6]) with mapi id 15.20.1987.010; Thu, 13 Jun 2019
 07:34:09 +0000
To: Chao Yu <yuchao0@huawei.com>, Wang Shilong <wangshilong1991@gmail.com>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: =?gb2312?B?u9i4tDogW1BBVENIIDIvMl0gZjJmczogb25seSBzZXQgcHJvamVjdCBpbmhl?=
 =?gb2312?Q?rit_bit_for_directory?=
Thread-Index: AQHVHCDhgH+VuQHB00eQdWW5nGRidqaZLF6AgACVXgI=
Date: Thu, 13 Jun 2019 07:34:09 +0000
Message-ID: <MN2PR19MB3167496236BA4D366EAF5D36D4EF0@MN2PR19MB3167.namprd19.prod.outlook.com>
References: <1559795545-17290-1-git-send-email-wshilong1991@gmail.com>
 <1559795545-17290-2-git-send-email-wshilong1991@gmail.com>,
 <73fb9e88-d3f5-9420-d6d8-82ff4354e4d6@huawei.com>
In-Reply-To: <73fb9e88-d3f5-9420-d6d8-82ff4354e4d6@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=wshilong@ddn.com; 
x-originating-ip: [36.62.199.127]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31fd6d66-302b-4882-fb19-08d6efd18621
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR19MB2717; 
x-ms-traffictypediagnostic: MN2PR19MB2717:
x-microsoft-antispam-prvs: <MN2PR19MB271724AB294366F66A2208A9D4EF0@MN2PR19MB2717.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39850400004)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(316002)(14444005)(7696005)(305945005)(3846002)(99286004)(256004)(33656002)(6116002)(224303003)(53546011)(6506007)(476003)(76176011)(81156014)(74316002)(9686003)(6436002)(8936002)(110136005)(53936002)(55016002)(11346002)(446003)(486006)(81166006)(71190400001)(71200400001)(26005)(7736002)(66066001)(25786009)(4326008)(5660300002)(186003)(102836004)(64756008)(66556008)(14454004)(86362001)(2501003)(52536014)(2906002)(66446008)(76116006)(66946007)(73956011)(2201001)(68736007)(66476007)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR19MB2717;
 H:MN2PR19MB3167.namprd19.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: ddn.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GaybPuLU7fxcESrnlUxJPe/UqqFEQ4GicKxdpkttb2ZAHu1Rhx8cQhUx+T6o2DFs3C/H5Mo8T/y1yD7FpVoaTCwCXPY1pxHvtwMgDxnRVVLfQ9Thn9UIkViD4z7FyhKN2iCcchzjguUOh+sJJ1vO4rj+J169AFaiCd80BZEh2TAyveGLU1G8u/XzhQRh261gCGjjOs0yNRay9u/n/I8bsyz3kTIjOwH7Nukw+1bdA9meVBGuC46/61fWxi8YZIIFL0HiOMLcSo1ilzNU2JCP0z97cp6knVTTEiw3aZDVr3/XE5FlQbPDG6yTzFMwjE6Rz2xzxEj+lcjAiIrbQyC++LbfXJo/gzdAuJ1yg904Msg9mm7BurOsJuZnFscGKSxbrWIrPSrGQI6fN191rcVwxjXwMcXbld0cMKduuj2mDdg=
MIME-Version: 1.0
X-OriginatorOrg: ddn.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31fd6d66-302b-4882-fb19-08d6efd18621
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 07:34:09.5202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 753b6e26-6fd3-43e6-8248-3f1735d59bb4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wshilong@ddn.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB2717
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [40.107.82.48 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hbOWF-0051Sh-4b
Subject: [f2fs-dev] =?gb2312?b?u9i4tDogW1BBVENIIDIvMl0gZjJmczogb25seSBz?=
 =?gb2312?b?ZXQgcHJvamVjdCBpbmhlcml0IGJpdCBmb3IgZGlyZWN0b3J5?=
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
Cc: Andreas Dilger <adilger@dilger.ca>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbywNCg0KIEkganVzdCBzZW50IGEgVjIsIGJ1dCBJIHRoaW5rIHdlJ2QgYmV0dGVyIGRv
IHRoYXQgd2hlbiByZWFkaW5nIGlub2RlLCBmb3IgdHdvIHJlYXNvbnM6DQoNCjEpIG5vdCBvbmx5
IEYyRlNfSU9DX0dFVEZMQUdTIG5lZWQgZmlsdGVyIGZsYWdzIGJ1dCBhbHNvIEYyRlNfSU9DX0ZT
R0VUWEFUVFIgbmVlZCB0aGF0LCBzbyB0aGUgYW1lbmRlZCBwYXJ0cyBpcyBub3QgZW5vdWdoIElN
Ty4NCg0KMikgZG9pbmcgdGhhdCBieSByZWFkaW5nIGlub2RlIGdpdmUgYSBiZW5lZml0IHRoYXQg
d2UgY291bGQgY29ycmVjdCBvbiBkaXNrIGZsYWdzIGZvciByZWd1bGFyIGZpbGUgbmV4dCBkaXJ0
eWluZyBpbm9kZSBoYXBwZW4uDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCreivP7IyzogQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPg0Kt6LLzcqxvOQ6IDIw
MTnE6jbUwjEzyNUgMTQ6MzYNCsrVvP7IyzogV2FuZyBTaGlsb25nOyBsaW51eC1leHQ0QHZnZXIu
a2VybmVsLm9yZzsgbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQNCrOty806
IFdhbmcgU2hpbG9uZzsgQW5kcmVhcyBEaWxnZXINCtb3zOI6IFJlOiBbUEFUQ0ggMi8yXSBmMmZz
OiBvbmx5IHNldCBwcm9qZWN0IGluaGVyaXQgYml0IGZvciBkaXJlY3RvcnkNCg0KT24gMjAxOS82
LzYgMTI6MzIsIFdhbmcgU2hpbG9uZyB3cm90ZToNCj4gRnJvbTogV2FuZyBTaGlsb25nIDx3c2hp
bG9uZ0BkZG4uY29tPg0KPg0KPiBJdCBkb2Vzbid0IG1ha2UgYW55IHNlbnNlIHRvIGhhdmUgcHJv
amVjdCBpbmhlcml0IGJpdHMNCj4gZm9yIHJlZ3VsYXIgZmlsZXMsIGV2ZW4gdGhvdWdoIHRoaXMg
d29uJ3QgY2F1c2UgYW55DQo+IHByb2JsZW0sIGJ1dCBpdCBpcyBiZXR0ZXIgZml4IHRoaXMuDQo+
DQo+IENjOiBBbmRyZWFzIERpbGdlciA8YWRpbGdlckBkaWxnZXIuY2E+DQo+IFNpZ25lZC1vZmYt
Ynk6IFdhbmcgU2hpbG9uZyA8d3NoaWxvbmdAZGRuLmNvbT4NCj4gLS0tDQo+ICBmcy9mMmZzL2Yy
ZnMuaCB8IDMgKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5o
DQo+IGluZGV4IDA2Yjg5YTk4NjJhYi4uZjAyZWJlY2I2OGVhIDEwMDY0NA0KPiAtLS0gYS9mcy9m
MmZzL2YyZnMuaA0KPiArKysgYi9mcy9mMmZzL2YyZnMuaA0KPiBAQCAtMjM3MCw3ICsyMzcwLDgg
QEAgc3RhdGljIGlubGluZSB2b2lkIGYyZnNfY2hhbmdlX2JpdCh1bnNpZ25lZCBpbnQgbnIsIGNo
YXIgKmFkZHIpDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBGMkZTX1BST0pJTkhFUklUX0ZM
KQ0KPg0KPiAgLyogRmxhZ3MgdGhhdCBhcmUgYXBwcm9wcmlhdGUgZm9yIHJlZ3VsYXIgZmlsZXMg
KGFsbCBidXQgZGlyLXNwZWNpZmljIG9uZXMpLiAqLw0KPiAtI2RlZmluZSBGMkZTX1JFR19GTE1B
U0sgICAgICAgICAgICAgICh+KEYyRlNfRElSU1lOQ19GTCB8IEYyRlNfVE9QRElSX0ZMKSkNCj4g
KyNkZWZpbmUgRjJGU19SRUdfRkxNQVNLICAgICAgKH4oRjJGU19ESVJTWU5DX0ZMIHwgRjJGU19U
T1BESVJfRkwgfFwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRjJGU19QUk9K
SU5IRVJJVF9GTCkpDQoNCkhpIFNoaWxvbmcsDQoNCkNvdWxkIHlvdSBwbGVhc2UgYWRkIGJlbG93
IGRpZmYgYXMgZXh0NCBkaWQ/DQoNCmRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2Yy
ZnMvZmlsZS5jDQppbmRleCBlZmRhZmE4ODY1MTAuLjI5NWNhNWVkNDJkOSAxMDA2NDQNCi0tLSBh
L2ZzL2YyZnMvZmlsZS5jDQorKysgYi9mcy9mMmZzL2ZpbGUuYw0KQEAgLTE3NTksNiArMTc1OSw5
IEBAIHN0YXRpYyBpbnQgZjJmc19pb2NfZ2V0ZmxhZ3Moc3RydWN0IGZpbGUgKmZpbHAsIHVuc2ln
bmVkDQpsb25nIGFyZykNCg0KICAgICAgICBmc2ZsYWdzICY9IEYyRlNfR0VUVEFCTEVfRlNfRkw7
DQoNCisgICAgICAgaWYgKFNfSVNSRUcoaW5vZGUtPmlfbW9kZSkpDQorICAgICAgICAgICAgICAg
ZnNmbGFncyAmPSB+RlNfUFJPSklOSEVSSVRfRkw7DQorDQogICAgICAgIHJldHVybiBwdXRfdXNl
cihmc2ZsYWdzLCAoaW50IF9fdXNlciAqKWFyZyk7DQogfQ0KDQpUaGFua3MsDQoNCj4NCj4gIC8q
IEZsYWdzIHRoYXQgYXJlIGFwcHJvcHJpYXRlIGZvciBub24tZGlyZWN0b3JpZXMvcmVndWxhciBm
aWxlcy4gKi8NCj4gICNkZWZpbmUgRjJGU19PVEhFUl9GTE1BU0sgICAgKEYyRlNfTk9EVU1QX0ZM
IHwgRjJGU19OT0FUSU1FX0ZMKQ0KPg0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
