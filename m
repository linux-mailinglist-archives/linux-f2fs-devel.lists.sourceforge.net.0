Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7419347B91B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Dec 2021 05:00:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mzWJj-00044g-V8; Tue, 21 Dec 2021 03:59:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mzWJh-00044Y-Rn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Dec 2021 03:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uNrnLRDK3UBFihkTCLTJU3XphpKufOZnqDsxGNrWkVc=; b=BY0TYNXzEQYXVdtKE37RBXVc6O
 4qZKIYy1e0jIkSgW1AuQfNNQytPUvQQGS+OBNMX3KohEdP2Se0R4YvpVRnxP/06ujfIn1cdiAs+Bh
 f+bzAts//aoW2qS6zIl/0+zjZmLlp/VH6GZBCdH7Kwg6Dri5Ymv4oFMfeL9ELMO6E4qQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uNrnLRDK3UBFihkTCLTJU3XphpKufOZnqDsxGNrWkVc=; b=mx7Ns1A+CQQhhuLCn5ZLjt49/9
 wewTM2OjrporsYdPFmMSe5X/HHFpMl8HVjS4p+hthF6QVFPV+SXA0BvIIqe7vK9hsxbKQenw0sAU/
 S3UQ15pqaPP9ljBdutFmub87W0TWWKuBkcRsVRjZrIjlEx10nBKr9LGtHcniMwAgvcK4=;
Received: from mail-sgaapc01on2106.outbound.protection.outlook.com
 ([40.107.215.106] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mzWJg-0003OM-Qa
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Dec 2021 03:59:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCscpx8N3drqHLAp5KlSc8Mc5nOtY6fJF/rnjaXCCV3UIHBA0Qg7Q080s+mCehfEdXLgTjAQfvVC4IW7tiKqN8s526grkR/43HE61/bdd0i2IETFJKskJxJ/Fr2/XZ1Jr1AZl1l/KZpRcn/qH2lWXJAN/jwOb4qrr/pgHqWYkjtK5oJFeNXcATNe+l2c4M0heZLII5uVuKtWm549KkQRLeM+qjBMuFpYgepjeZt0G5h+QoKjr2hBkpYLGUYBPJg26uHiBqWGdGH4uCkeAwa2PrAdIK+cwptt3I0cOrLqB/ME2iZ+MwBKqLFiWxI2R+S9rN4882GEN1TPwRfkuNMYHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNrnLRDK3UBFihkTCLTJU3XphpKufOZnqDsxGNrWkVc=;
 b=IKK9IlPwB5bSDX5LqawwMH9Wn+MP9iQpBGRSvTD/YlD39PqjIqrCg5ECzrnZ04bNJFogCBjUGuluR6Fdx35vgTxd/rmCPmpG0oSmqtOV2A9dVcjE5qaSrm1eBzruXyDHUWvgjKLKIAW5T6nncIZV/bgatd2R78u0AAJeeP5DYFlxfAzf+5Cxy36XjkfWO0bF96haotnfAnvWltC2nGhEBrhPdHz5sdkhEJjKdgthxJRkJbFljDKyOHpf/j80Q3jyZYwhA0XObbUsGCcljhKB61FcVIbeyNUy8JPtCp+DzZc3iZU3ya8P/lvLHfEkYy48dNjQWzbfkgCKDAr/PjS8ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNrnLRDK3UBFihkTCLTJU3XphpKufOZnqDsxGNrWkVc=;
 b=agJHLfoROricxPWk4rNNtZsgtnI9OUQu4EbwmfK1qzCV/L09nR6Pvf/I5KZRkek8ESnYARBQ+cX6tad5TeIGVbXgQCRTsl2a9mvg1mme/SLrDOZD7ewrp4D1G5liWXZDQGkoURFf4HI9ywzFiip+Lg17dY1BHZTiXSE8mJYEmSk=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB4276.apcprd06.prod.outlook.com (2603:1096:820:78::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 03:59:44 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::3422:d7b:74de:51a7]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::3422:d7b:74de:51a7%6]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 03:59:44 +0000
From: =?gb2312?B?s6O37+mq?= <changfengnan@vivo.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>
Thread-Topic: [PATCH] f2fs: remove redunant invalidate compress pages
Thread-Index: AQHX7/+tiRoTXJt3SkWX4Un7LLQUFKw8Wf2Q
Date: Tue, 21 Dec 2021 03:59:44 +0000
Message-ID: <KL1PR0601MB4003AE5E6A8449368F3290BBBB7C9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20211213085857.8554-1-changfengnan@vivo.com>
In-Reply-To: <20211213085857.8554-1-changfengnan@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 773f8ff3-805e-4f7e-6133-08d9c43652a4
x-ms-traffictypediagnostic: KL1PR0601MB4276:EE_
x-microsoft-antispam-prvs: <KL1PR0601MB427627CFD6B44EB702E3BF50BB7C9@KL1PR0601MB4276.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:192;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bb1ibIjQEwzUfAeXHj0FoDAplf7ai2DNeY0Icfb0jNdfXzfbYbwpXCf/5cssrMYzre4TUzX2YvnmQIk4WSoXhlRH/0ygLWI/73qvtHM/UPmWOYBbe8iol2F5fUKM7sPycd8gaygf4AZ+oo7KvnTYGvorAiaaxFz4rL1OZEKxfHwTXDLy/K6vwi4lYDDLbdEzQ9uGqwlYDpEwLTM1nMybxe9xNQJzlUFLd/UgDoLK4+IH/WuNiZhhykTJyrboweFTpKkOnch97arEKqqtg/C/ouXXSBRAeDfe9HhjmzI0z8HtA15GBvN/JKKyr84Vejve+vMV2eXP5fCAGe0bttSF29Utbv9+CJpYjNg+OUj2qxEOcv+2V5lRBtZgViBAH394XLYQhx54vZfxT6ZbXMXB4Qxq+0jJhVFLRJ8K54dsEi9DDaEhi/VMn6Dgr4jT3Jd1XArPxe75SHfQ5Rrnoc1/GwtBpZffpmERGUO1tsdS7lmuvaX4Sgzq6uSvBpvaJMjcE3v60pDNpKwPq01+aXJK1pVxsRrokn3qm2osqdXJE3ulzNqDRFxUTIgrKQZ4nJzuKJC0F5XPSXR7DNkExwmRlGLbIW2dUZs1f+gd/BL0SXCnUCMn37V0H9gyDeCg8X3FHZX+VzfAUyAOogqCc+x2Tvth2wLuSVoMklu6RjKiwDK9SFnVVXpHaa04jR7SktyPDWma2JbKSfPPDWpRh1rkeQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(38070700005)(85182001)(122000001)(66476007)(71200400001)(55016003)(7696005)(2906002)(64756008)(66946007)(76116006)(86362001)(508600001)(33656002)(53546011)(9686003)(38100700002)(5660300002)(66446008)(6506007)(316002)(966005)(8676002)(83380400001)(8936002)(52536014)(4326008)(186003)(110136005)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: SELPj+dllPFGi6eVGwjXiuvcnuQSHcW5mGY8c+LoOLLYpMthCSvHHtA8IZOljUvVGntxj7RXx55hE9nte3ZAhU6qSJuQ0IawkvdrHZR3cRYsdlOQcE0nV59S49TQKbjKVZ7q8szodf5B8JPtSyQVjq07DXwGfeRGLXcbvFAI6srnmGqy9tWoVLy1d14ULL4C+88vsmzeFLEk5vfPLK6yO6jI4Rczt66aTqoCNW86lryEMC6/PSqrvclkHl1MpUjusOGAUvOjTTfrRrG8a0EQohy84e0fxO3NXQdk9utf4QL0A1aNmzp1xyKkkvbDSpdghW92o/seCsTWBx75cX6FnVRZn6hbkHQYz1ECMCoLrBHIkAoicaPhTWE152i61eqF+Z3otUhwLNZ4+m+ZCGtVPaVav3ByCtCiqZlOFZh6lChmB+Hc+AijvLhqttDreYPO
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 773f8ff3-805e-4f7e-6133-08d9c43652a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 03:59:44.1543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YdAQofAKCxd4VZItxQ+gf4/2H3maK2XN8f/yCwRWxqWa6MJRCjgMNXiv2ikEIJNh/dZx7QsyQcgEIshiLcSLWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4276
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.106 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.106 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1mzWJg-0003OM-Qa
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove redunant invalidate compress
 pages
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiCzo7fv6aoNCj4gU2VudDogTW9u
ZGF5LCBEZWNlbWJlciAxMywgMjAyMSA0OjU5IFBNDQo+IFRvOiBqYWVnZXVrQGtlcm5lbC5vcmc7
IGNoYW9Aa2VybmVsLm9yZw0KPiBDYzogbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQ7ILOjt+/pqiA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hd
IGYyZnM6IHJlbW92ZSByZWR1bmFudCBpbnZhbGlkYXRlIGNvbXByZXNzIHBhZ2VzDQo+IA0KPiBD
b21wcmVzcyBwYWdlIHdpbGwgaW52YWxpZGF0ZSBpbiB0cnVuY2F0ZSBibG9jayBwcm9jZXNzIHRv
bywgc28gcmVtb3ZlDQo+IHJlZHVuYW50IGludmFsaWRhdGUgY29tcHJlc3MgcGFnZXMgaW4gZjJm
c19ldmljdF9pbm9kZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEZlbmduYW4gQ2hhbmcgPGNoYW5n
ZmVuZ25hbkB2aXZvLmNvbT4NCj4gLS0tDQo+ICBmcy9mMmZzL2lub2RlLmMgfCAzIC0tLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9pbm9kZS5jIGIvZnMvZjJmcy9pbm9kZS5jIGluZGV4IDkzNTAxNmU1NjAxMC4uNTk1MjcwNjQ2
ZDY5DQo+IDEwMDY0NA0KPiAtLS0gYS9mcy9mMmZzL2lub2RlLmMNCj4gKysrIGIvZnMvZjJmcy9p
bm9kZS5jDQo+IEBAIC03NTEsOSArNzUxLDYgQEAgdm9pZCBmMmZzX2V2aWN0X2lub2RlKHN0cnVj
dCBpbm9kZSAqaW5vZGUpDQo+ICAJdHJhY2VfZjJmc19ldmljdF9pbm9kZShpbm9kZSk7DQo+ICAJ
dHJ1bmNhdGVfaW5vZGVfcGFnZXNfZmluYWwoJmlub2RlLT5pX2RhdGEpOw0KPiANCj4gLQlpZiAo
dGVzdF9vcHQoc2JpLCBDT01QUkVTU19DQUNIRSkgJiYgZjJmc19jb21wcmVzc2VkX2ZpbGUoaW5v
ZGUpKQ0KPiAtCQlmMmZzX2ludmFsaWRhdGVfY29tcHJlc3NfcGFnZXMoc2JpLCBpbm9kZS0+aV9p
bm8pOw0KPiAtDQoNCkhpIEphZWdldWssIGNoYW86DQpBZnRlciBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9qYWVnZXVrL2YyZnMuZ2l0L2NvbW1pdC8/aD1k
ZXYmaWQ9NjYyZjZhY2RiMDEzNmRmZGEzZDA1NWYwMDA4NmUyYzhlZDVjOGJmYw0KSSB0aGluayB0
aGlzIHBhdGNoIHN0aWxsIG5lY2Vzc2FyeSwgaXQgY291bGQgc3BlZWQgdXAgZXZpY3QgaW5vZGUu
IGYyZnNfaW52YWxpZGF0ZV9jb21wcmVzc19wYWdlcyBmaW5kIGFsbCBwYWdlcyBhbmQgY29tcGFy
ZSB0byBkZWNpZGUgd2hpY2ggcGFnZXMgbmVlZCBpbnZhbGlkYXRlLCBpZiB0aGVyZSBhcmUgbWFu
eSBjb21wcmVzc2VkIGZpbGUgY2FjaGVkLCBpdCBtYXkgbmVlZCBtdWNoIHRpbWUuIEFuZCBpbiBs
YXRlciB0cnVuY2F0ZSBibG9jayB3aWxsIGludmFsaWRhdGUgcGFnZSBvbmUgYnkgb25lLCB0aGlz
IG1heSBtb3JlIGVmZmVjdGl2ZS4NCg0KPiAgCWlmIChpbm9kZS0+aV9pbm8gPT0gRjJGU19OT0RF
X0lOTyhzYmkpIHx8DQo+ICAJCQlpbm9kZS0+aV9pbm8gPT0gRjJGU19NRVRBX0lOTyhzYmkpIHx8
DQo+ICAJCQlpbm9kZS0+aV9pbm8gPT0gRjJGU19DT01QUkVTU19JTk8oc2JpKSkNCj4gLS0NCj4g
Mi4zMi4wDQoNCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
