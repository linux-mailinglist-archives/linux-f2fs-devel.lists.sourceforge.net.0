Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCB3E2DF9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Oct 2019 11:55:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iNZpk-0005Mm-HQ; Thu, 24 Oct 2019 09:55:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <alexandru.Ardelean@analog.com>) id 1iNZpi-0005Mc-MU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Oct 2019 09:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sza/BjyjDh+TXmUe/gMhAWsR9dYohx6Laih0s8KZzUM=; b=RCEWap88ZBMcu/fQApuxUydNZB
 HZ0p6upk2urM1kTUfH1V/reUVgL7eDq/a5jxwFITDydZ4vcL/tFhmzHW/f3Ljnf+6bSV7lp2ri4Pk
 sH/0ucOFXFpLss/1c7VJgow//TY1PPuGKmtraAdplUnsCi40zo+A9RzWlO+agCq/uFnc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sza/BjyjDh+TXmUe/gMhAWsR9dYohx6Laih0s8KZzUM=; b=QjjIegvLkKU4ahNCta1yC8Ol14
 bldGXVzBy3ytGZGqvHiEReZKPN0DsT6yA1yrxei/ZXcXavISTJXFH0qb3mY0vKPITxEmqa7xHtDmM
 GCqi1oyQJZhdALkGxEXKiH5Pnq2Dn6jLloqcLlctcgT/rzxv6Stn0qC1/9UGDhPgx4Sc=;
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iNZpa-001Mfb-1M
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Oct 2019 09:55:06 +0000
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9O9npCc030915; Thu, 24 Oct 2019 05:54:50 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-00128a01.pphosted.com with ESMTP id 2vt9t2619d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2019 05:54:50 -0400
Received: from m0167090.ppops.net (m0167090.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id x9O9ntDI030926;
 Thu, 24 Oct 2019 05:54:50 -0400
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2050.outbound.protection.outlook.com [104.47.38.50])
 by mx0b-00128a01.pphosted.com with ESMTP id 2vt9t2619c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2019 05:54:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQ8i2k6O8ciZW/A0tUBoekJst1ksL0r/9UHwKKRm+FLoSnlBz/Dfn3lSPN9dlJYHlFIQO1OYdqxfKFGpd7XhNw3hl1V/nda/G96O6FeLv8bzW9Zf0IcDp/FpV10cK9gWsgHVyZgjCeDDvVqtrn6dk71pHyQTbYWvNBiRAKXJhwRpHRIJ+cfSHnl8Jjek3jnBMOkVu51HAD7askclJppyPG3+AIhMKQOOtGTVpMSnmkdWiwm+Y/bqsDrzi06dwQIVycCmxR58la7DHRRjq0xNsBLWxqUgy4ErRU2QFU1ox9b98lcIxKH3IJWNYcbC2StYywl5DrmXMibzHlrzHwXxWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sza/BjyjDh+TXmUe/gMhAWsR9dYohx6Laih0s8KZzUM=;
 b=bP05FOWnvtCDNw5iwtH4ykraYc73NPbxk+N1vjsOvmgQ6AL+7FmfkS1OgCoWRTfgePiaLq26UHEomJTcTo9C7+LAcvfJ4MtitzgAq62cqwAydXrm24FVKCTuPsGmVVC6C9hmVIEuuQgnt3eKnG+dJYaiGXKRGt/MGzEfkXJLVtT+MY6iWUK46/r3Z2FDQcKhV4xhkgEjINSLcZ9HFrwl9mrwDrwb1gyr6QirlMhlvDkIKxWKsJzVVTVU0y3k2OxkxsS3OpwxU7U0ZmE9qsoDoAywMgdrGWj3w5bWMF9/kMU9ev4rQXlWVGMjfSJBuTlBZRB3ZhCrm8qNfaNQGqUrrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sza/BjyjDh+TXmUe/gMhAWsR9dYohx6Laih0s8KZzUM=;
 b=PdlbXMEtbesN2FTA/C7kd4jx7jF36ux7iknjESPssb4VBo7tfzb/N5wDa5wZ7xDqVMkp2d+DJESzvSRzyq273/rYu/ozkb68RSQRb+WgPuPfHSrrndWvLEtbY3PvGc7Dr0YeN8L1RhdNG5kh8GfTnH8WozeX1M+kKxXWr4cgEnE=
Received: from CH2PR03MB5192.namprd03.prod.outlook.com (20.180.12.152) by
 CH2PR03MB5222.namprd03.prod.outlook.com (20.180.15.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Thu, 24 Oct 2019 09:54:48 +0000
Received: from CH2PR03MB5192.namprd03.prod.outlook.com
 ([fe80::99:71f2:a588:977c]) by CH2PR03MB5192.namprd03.prod.outlook.com
 ([fe80::99:71f2:a588:977c%3]) with mapi id 15.20.2387.023; Thu, 24 Oct 2019
 09:54:48 +0000
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: "yuchao0@huawei.com" <yuchao0@huawei.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: =?utf-8?B?W2YyZnMtZGV2XSBbYnVnIHJlcG9ydF0gY29tcGlsZXIgd2FybmluZzogZnMv?=
 =?utf-8?B?ZjJmcy9ub2RlLmM6IEluIGZ1bmN0aW9uIOKAmF9fc2V0X25hdF9jYWNoZV9k?=
 =?utf-8?B?aXJ0eeKAmTog4oCYaGVhZOKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVk?=
Thread-Index: AQHViktCSRPmHY43rEW4OGBYNCm4v6dpja8A
Date: Thu, 24 Oct 2019 09:54:47 +0000
Message-ID: <425c2a3697b9973bb2bb51b692f80c02ef105285.camel@analog.com>
References: <fc71f3b73116115f78bcee2753e7bb3d5331731e.camel@analog.com>
 <e815981a-50ef-0f49-cab6-e510ea44ddc0@huawei.com>
In-Reply-To: <e815981a-50ef-0f49-cab6-e510ea44ddc0@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8ed82662-e5e9-4e90-81f1-08d7586834b9
x-ms-traffictypediagnostic: CH2PR03MB5222:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <CH2PR03MB5222A634C6C0C5F458A36798F96A0@CH2PR03MB5222.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(376002)(366004)(346002)(136003)(189003)(199004)(6306002)(6512007)(6116002)(99286004)(3846002)(2906002)(25786009)(5660300002)(110136005)(316002)(2501003)(76176011)(76116006)(66556008)(64756008)(66446008)(53546011)(66476007)(6506007)(66946007)(8936002)(6246003)(81166006)(7736002)(81156014)(305945005)(4326008)(102836004)(91956017)(476003)(446003)(118296001)(486006)(11346002)(14454004)(26005)(2201001)(966005)(2616005)(478600001)(36756003)(86362001)(186003)(229853002)(6486002)(71200400001)(71190400001)(66066001)(4001150100001)(6436002)(256004)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR03MB5222;
 H:CH2PR03MB5192.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dlpqnjQOi3q2hI/zsLratwCM5ReRfxFqnt7tFW0S6aZsJnggTuc1djZGxu/NwNLdU+CAuyIyHSnDqERA/hqhAyU3nVzsIgQRVnjGg/C8maLzR2EPTyEUDx7nIGJr76+h6CKmZRjVqfYsyFJ9qt14N5UqsCqbdpH3VF9brHiEsaL1FaTP6W+r/6uweI83Mx6/9L1qD9N5zSDPvKkd7f7Rz9IXjKxa6zJNcQe8L5yw3QvPcBkwQErzoeP3MKznLUGEyzKNTY3boD1q6788bMI1Khdk3VUdz6Pd3tP0lcD6IkxjtqKpNy0n3PiHvyIJH/oDvw3eNyspbndoCFEuahlJpU4ZePmRjVEmVoLA2pThvwRbCWyQkc8mPYwg700bhOOjT0OfKOXAdPxhleLnN+FO8faEnBQ/txWb0djZSASAj/46+Qs5sMjb6u+D/S+q7F5RH7X7rp8kIwMORhWblvAyWxpGwYyqjX8tMFkk4DtX4NI=
x-ms-exchange-transport-forked: True
Content-ID: <DEDC2262C1EE794388BB7F376E94477B@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed82662-e5e9-4e90-81f1-08d7586834b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 09:54:47.9246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MgYVVtat/YwVXTloRauoxItwmqMu+TrvPih+a1HiVZny70N2YsugxbUU/SJzayDO6kYdI8jHh/EBnoOK3MiVSCuyFDW95/q2zVpnHpTBsko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5222
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-24_06:2019-10-23,2019-10-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910240097
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: travis-ci.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iNZpa-001Mfb-1M
Subject: Re: [f2fs-dev] 
 =?utf-8?q?=5Bbug_report=5D_compiler_warning=3A_fs/f2f?=
 =?utf-8?b?cy9ub2RlLmM6IEluIGZ1bmN0aW9uIOKAmF9fc2V0X25hdF9jYWNoZV9kaXJ0?=
 =?utf-8?b?eeKAmTog4oCYaGVhZOKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVk?=
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
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCAyMDE5LTEwLTI0IGF0IDE3OjEyICswODAwLCBDaGFvIFl1IHdyb3RlOg0KPiBbRXh0
ZXJuYWxdDQo+IA0KPiBPbiAyMDE5LzEwLzIzIDIyOjAyLCBBcmRlbGVhbiwgQWxleGFuZHJ1IHdy
b3RlOg0KPiA+IFNlZW1zIHRvIGhhdmUgYmVlbiBpbnRyb2R1Y2VkIHZpYToNCj4gPiANCj4gPiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+ID4gDQo+ID4gY29tbWl0IDc4MGRlNDdjZjZjYjVmNTI0Y2Q5OGVjOGZmYmZmYzNk
YTU2OTZlMTcNCj4gPiBBdXRob3I6IENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT4NCj4gPiBE
YXRlOiAgIFR1ZSBNYXIgMjAgMjM6MDg6MzAgMjAxOCArMDgwMA0KPiA+IA0KPiA+ICAgICBmMmZz
OiBkb24ndCB0cmFjayBuZXcgbmF0IGVudHJ5IGluIG5hdCBzZXQNCj4gPiAgICAgDQo+ID4gICAg
IE5hdCBlbnRyeSBzZXQgaXMgdXNlZCBvbmx5IGluIGNoZWNrcG9pbnQoKSwgYW5kIGR1cmluZyBj
aGVja3BvaW50KCkNCj4gPiB3ZQ0KPiA+ICAgICB3b24ndCBmbHVzaCBuZXcgbmF0IGVudHJ5IHdp
dGggdW5hbGxvY2F0ZWQgYWRkcmVzcywgc28gd2UgZG9uJ3QNCj4gPiBuZWVkIHRvDQo+ID4gICAg
IGFkZCBuZXcgbmF0IGVudHJ5IGludG8gbmF0IHNldCwgdGhlbiBuYXRfZW50cnlfc2V0OjplbnRy
eV9jbnQgY2FuDQo+ID4gICAgIGluZGljYXRlIGFjdHVhbCBlbnRyeSBjb3VudCB3ZSBuZWVkIHRv
IGZsdXNoIGluIGNoZWNrcG9pbnQoKS4NCj4gPiAgICAgDQo+ID4gICAgIFNpZ25lZC1vZmYtYnk6
IFl1bmxlaSBIZSA8aGV5dW5sZWlAaHVhd2VpLmNvbT4NCj4gPiAgICAgU2lnbmVkLW9mZi1ieTog
Q2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPg0KPiA+ICAgICBTaWduZWQtb2ZmLWJ5OiBKYWVn
ZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPg0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiANCj4gPiBDb21w
aWxlciB3YXJuaW5nIGlzOg0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiANCj4gPiAgIENDICAgICAgZnMvZjJm
cy9ub2RlLm8NCj4gPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi9pbmNsdWRlL2xpbnV4L3dhaXQu
aDo3OjAsDQo+ID4gICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC93YWl0X2Jp
dC5oOjgsDQo+ID4gICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9mcy5oOjYs
DQo+ID4gICAgICAgICAgICAgICAgICBmcm9tIGZzL2YyZnMvbm9kZS5jOjExOg0KPiA+IGZzL2Yy
ZnMvbm9kZS5jOiBJbiBmdW5jdGlvbiDigJhfX3NldF9uYXRfY2FjaGVfZGlydHnigJk6DQo+ID4g
Li9pbmNsdWRlL2xpbnV4L2xpc3QuaDo2MzoxMzogZXJyb3I6IOKAmGhlYWTigJkgbWF5IGJlIHVz
ZWQgdW5pbml0aWFsaXplZA0KPiA+IGluDQo+ID4gdGhpcyBmdW5jdGlvbiBbLVdlcnJvcj1tYXli
ZS11bmluaXRpYWxpemVkXQ0KPiA+ICAgbmV4dC0+cHJldiA9IG5ldzsNCj4gPiAgICAgICAgICAg
ICAgXg0KPiA+IGZzL2YyZnMvbm9kZS5jOjIzODoyNDogbm90ZTog4oCYaGVhZOKAmSB3YXMgZGVj
bGFyZWQgaGVyZQ0KPiA+ICAgc3RydWN0IG5hdF9lbnRyeV9zZXQgKmhlYWQ7DQo+IA0KPiBUaGF0
J3Mgbm90IGNvcnJlY3QsIEBoZWFkIHdpbGwgb25seSBiZSBhc3NpZ25lZCBhbmQgdXNlZCBpZiBu
ZXdfbmUgZXF1YWxzDQo+IE5VTEwuDQoNCkFjay4NCkkgYWRtaXQgdGhhdCBJIGRvbid0IHVuZGVy
c3RhbmQgdGhlIGNvZGUsIGFuZCBkb24ndCBjbGFpbSB0byB1bmRlcnN0YW5kIGl0Lg0KDQpUaGlz
IG1heSBiZSBqdXN0IGEgd2VpcmQgY29tcGlsZXIgaXNzdWUuDQpJIHRob3VnaHQgSSdkIHNlbmQg
aXQganVzdCBhcyBhIGhlYWRzLXVwLg0KSSBzYXcgdGhpcyBvbiBhIFJhc3BiZXJyeSBQaSBicmFu
Y2ggW2FmdGVyIHdlIGVuYWJsZWQgd2FybmluZ3MgYXMgZXJyb3JzXToNCmh0dHBzOi8vdHJhdmlz
LWNpLm9yZy9hbmFsb2dkZXZpY2VzaW5jL2xpbnV4L2pvYnMvNjAxODQ0OTI2I0wxMjA4DQoNCkxv
b2tpbmcgaW4gdGhlIGxhdGVzdCBmMmZzL2RldlstdGVzdF0gdHJlZSwgaXQgbG9va3MgbGlrZSB0
aGUgY29kZSBpcw0Kc2ltaWxhciBhcyBpbiA0LjE5Lg0KaHR0cHM6Ly9naXRodWIuY29tL2FuYWxv
Z2RldmljZXNpbmMvbGludXgvYmxvYi9ycGktNC4xOS55L2ZzL2YyZnMvbm9kZS5jI0wyMzUNCg0K
Q291bGQgYmUgdGhhdCB0aGUgUlBpIGJyYW5jaCBoYXMgc29tZSBtb3JlIGNvbXBpbGVyLXN0dWZm
IGVuYWJsZWQuDQoNCkluIGFueSBjYXNlLCBmZWVsIGZyZWUgdG8gZGlzcmVnYXJkIHRoaXMuDQpX
ZSB3aWxsIHNlZSBob3cgd2UgZml4IHRoaXMgb24gb3VyIGVuZCBmb3IgdGhhdCBicmFuY2ggc3Bl
Y2lmaWNhbGx5Lg0KDQpUaGFua3MNCkFsZXgNCg0KPiANCj4gVGhhbmtzLA0KPiANCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICBeDQo+ID4gY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRl
ZCBhcyBlcnJvcnMNCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gDQo+ID4gVGhhbmtzDQo+ID4gQWxleA0KPiA+
IA0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+
ID4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gPiBMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldA0KPiA+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwNCj4gPiANCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
