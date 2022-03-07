Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE164CF300
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Mar 2022 08:55:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nR8DB-0004Ne-7P; Mon, 07 Mar 2022 07:55:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1nR8D1-0004Mp-Pk
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Mar 2022 07:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9+muokG0DWOenwDx6nGP8s0Wp3udH8naaNINndDbBto=; b=dQOc9dmXLGsKJVFdzEpiO1zf6V
 TFwxydR+t95j7S6oQ2uUkj2Cv5vet0dJcxSvhuKyK+diiBtfxW4bsDswq52iNoZqRrCq0mlGjVhrt
 RmbxgnGVzAdfH5LAj1UqlOhNd0JuaRsXf6M+UURaBjMgfEUkp66dl7271fMv12t39eyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9+muokG0DWOenwDx6nGP8s0Wp3udH8naaNINndDbBto=; b=Oa24T/bSMO53ppobfNdvhB9f7B
 iF7cpvgJLwHvkd1pAVH1VhfPuuHowZCw+NZkjhzjTvNzBvYFt83My+OTIEbFDmJAiyG+TWvDw2W1b
 sPiLfbeeSyRAuVlHvdDdSMjNvgOFYCitrHI1a3qeyhT2fKLUoF1YEQsjBNISsDk3vt7w=;
Received: from mail-sgaapc01on2127.outbound.protection.outlook.com
 ([40.107.215.127] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nR8Cr-0078jA-UI
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Mar 2022 07:55:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqvLKAQHh2E1jS/dzSjNKn1BZnbMlLkI5GZSlDlezHj/ZpNLCY/lQkqqcFNEfADoQ0wdrEzy+iX3ZxIOZrUWgoe/+UgyMsn3ASrAukjgzaN2xH9ZJCK40f4wBHvMX2QGClWkL/3z+HZjFkblEAyKVNJ186CzVJNBmRFqfVLuCpuUo8HtIywx8SOk9m8G2M009A8fnp/fTgRfozr/Uwa5zhNIwT07TkMMk9veuu4qPa5mBSXj7SlCm7QU4x6GGz79ZQCcj0I4iUB1/EX3bmgtYdKmpS4WIFC5NIhp5AGK/wdM19J6khdcYZLzwDwgocstPb3kM/SRs227ja7eaxEfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+muokG0DWOenwDx6nGP8s0Wp3udH8naaNINndDbBto=;
 b=cJb1RpxFtHU/Rskwo33KVN4+qiKB1UWvslkiwQfXKx51Nuz0t27OYoAvab7opavC93CeR5Gv6yMZAmIzt/pGZssN60chRw+D4E5WdDTE9QwB72RbqLpimFOKxnEBGu2AscSkd9Y3uvxTgmBrqfV5UP6OF9yNvVfXIRP7nCoQSW01ZVYEQ0GmIMWn000a+uEWXwH9ULrJnpcZYLVL9Lo9Lntq3IpxGAnbFNFUVafPbg7d0ZIP5iqWgvle2/sbuItGi9ERzMVnSI6rPO8Ve0ZwFDrtVc2+X6osh2PLTaENaEK6vnqw4ivdyX0UTDIVYUbn1yREHGwVpzlZ9+cMWfpk0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+muokG0DWOenwDx6nGP8s0Wp3udH8naaNINndDbBto=;
 b=fzeEpe080nWg+/gRdPzXJqAU37sh7RFGHR6bWyToqNGG+K7wyKzy0fYM0JaR5vJqoWZ+q4KQkA59PDrewUvGGvwuovSdk0VqgXPxufdifWAR5aDJlB+SXhEL9sWIfFDKGo17TUaS2TpQ+NbWXdCQ02s6sA/YmSbZRjot8XYMOZ0=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by HK2PR06MB3265.apcprd06.prod.outlook.com (2603:1096:202:30::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Mon, 7 Mar
 2022 07:54:48 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::1168:21dd:36ff:be89]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::1168:21dd:36ff:be89%8]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 07:54:48 +0000
To: Chao Yu <chao@kernel.org>, Fengnan Chang <fengnanchang@gmail.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [RFC PATCH] f2fs: fix compress file start atomic write may cause
 data corruption
Thread-Index: AQHYMEWV1GPMOM+dJ0u8RV72JQzQt6yzKM6AgABlLGA=
Date: Mon, 7 Mar 2022 07:54:48 +0000
Message-ID: <KL1PR0601MB40038428764F5731EEEF7AABBB089@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20220305040019.225150-1-fengnanchang@gmail.com>
 <bc67518a-37c9-724d-9a27-d8e9354c5404@kernel.org>
In-Reply-To: <bc67518a-37c9-724d-9a27-d8e9354c5404@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e76b067-33d0-412f-5f30-08da000fc0ad
x-ms-traffictypediagnostic: HK2PR06MB3265:EE_
x-microsoft-antispam-prvs: <HK2PR06MB326523F255CED13345675285BB089@HK2PR06MB3265.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fqCqu/JuUlZbSn7RhmGtOv3gj4mHpPYuzJnwYdTYh0w+fFLFXdqihO6a7O4d0EvdcUGY+1b1HbVWk+hvBW4Jy187Q7PC0BdRjhw3QAAuStuujmqJspNuZqSwBCVhkBsJetdMac49VoAJx888hi6UP8YWtqQb6Ixhh9I2R3sgctLzDXjXukadg5+8Z7P0kuHGQLp3E+4jrC0roQ8E9LZ+FwERF5l7+TBE31BQZGpa3ys7uFGn9T4vngb2qzOPhvvjOjHiDMdbx1kM08R3e+iPlKdBTELug2fZwxK12fp0uh2wLmwFz78exm7Ek8Qe16QFWld7M/jKkClTwWtGmR4Vg/bD6ohqLE5KTDinXIGZnRVk5272LuC+XKo/7Kd5LsLTOiOj0s4AcdJLG3YhBaN6hr6+KOT95SlGmFmEzIh1d0HSLVlNTp6LRAMKggfe2oSXhEYjU0c61xCXiIILLioheOyocyBi9DoQ6/MgqNSWJejzoGTCE1jHW9Q6ieNvUkTJYMRX64d+iS4m1/uXsr0MtA/6tXkX2K9+vfkYisbftDuj7Kmpj3n8E3FO7tVKjtygzc1Bcm3mg4s+f88ObQliPIHs1xVLBnopyudA7FlfzPFSu+qAelCK7hi4pNpbpIoA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(5660300002)(38100700002)(53546011)(64756008)(52536014)(66556008)(66946007)(76116006)(71200400001)(186003)(83380400001)(66446008)(66476007)(4326008)(508600001)(86362001)(85182001)(26005)(6506007)(110136005)(55016003)(316002)(122000001)(38070700005)(33656002)(2906002)(9686003)(7696005)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: NQjv4q1sT7fDR/yR3m/n5dRnOU/2Ovex2GIJEDBqL+Fp0yFgVYVxu8nqDEKMJKfHNVSVP/zV3i2PIgRB4svdPA9pb/3gZ8bXrbd0XwN1a5BeLaXW/l/VcJZXLEDA41SSSOhVi5mLR4gn48cGFlo0SKi4B8JmTEZCWJMe6wDiLOR2f7xlSxvyMm+nZOgOuBxkFd/xFVXUnk1KOQo5LFf1EnaE0w8ts68+HypYRRyHlSILSxtAuLzpdRpOHtGIshgEXI6xqQZKsx+MVmi0DyE+VtFOaGEgKxjSFRwj6aYiuh/TzaeNoDTSpnstxt7qhMwgidXKCp/Olk3amsKk6Ynie9pixTTb7exSN1vJd+/+HVGS2NWwglT8NsmXDl23fvcmYyTVHUsN2OAVmIxarJ0uChBjfKC4e6m2GPBFtaCX2wr/DWTcco5VW3gn4HgUBciA
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e76b067-33d0-412f-5f30-08da000fc0ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 07:54:48.2662 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q28c92BCrSOPAhTGK4Y3HKCPmwhu5wfR9ZcVb/7u5+016RXCEXvD6UT0PWlU1jkyP87dNkebtoBw5vOQyp0ckw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3265
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.127 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.127 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nR8Cr-0078jA-UI
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: fix compress file start atomic
 write may cause data corruption
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
From: =?utf-8?B?5bi45Yek5qWg?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IENoYW8gWXUgPGNoYW9Aa2Vy
bmVsLm9yZz4NCj4gU2VudDogTW9uZGF5LCBNYXJjaCA3LCAyMDIyIDk6NDMgQU0NCj4gVG86IEZl
bmduYW4gQ2hhbmcgPGZlbmduYW5jaGFuZ0BnbWFpbC5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmcN
Cj4gQ2M6IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0OyDluLjlh6TmpaAN
Cj4gPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4NCj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0hdIGYy
ZnM6IGZpeCBjb21wcmVzcyBmaWxlIHN0YXJ0IGF0b21pYyB3cml0ZSBtYXkgY2F1c2UNCj4gZGF0
YSBjb3JydXB0aW9uDQo+IA0KPiBPbiAyMDIyLzMvNSAxMjowMCwgRmVuZ25hbiBDaGFuZyB3cm90
ZToNCj4gPiBXaGVuIGNvbXByZXNzZWQgZmlsZSBoYXMgYmxvY2tzLCBzdGFydCBhdG9taWMgd3Jp
dGUgd2lsbCBiZSBmYWlsZWQsDQo+ID4gYnV0DQo+IA0KPiBZb3UgbWVhbiBmMmZzX2lvY19zdGFy
dF9hdG9taWNfd3JpdGUgd2lsbCBzdWNjZWVkLCBidXQgY29tcHJlc3NlZCBmbGFnIHdpbGwNCj4g
YmUgcmVtYWluZWQgaW4gaW5vZGU/DQoNClllcy4NCg0KPiANCj4gPiBzdGlsbCBzZXQgRklfQVRP
TUlDX0ZJTEUgZmxhZywgaWYgd3JpdGUgcGFydGlhbCBjbHVzdGVyIGFuZCBjb21taXQNCj4gPiBh
dG9taWMgd3JpdGUgd2lsbCBjYXVzZSBkYXRhIGNvcnJ1cHRpb24uDQo+IA0KPiBDb3VsZCB5b3Ug
cGxlYXNlIGV4cGxhaW4gbW9yZSBhYm91dCB3aHkgZGF0YSB3aWxsIGJlIGNvcnJ1cHRlZD8NCg0K
U3RlcCAxOg0KQ3JlYXRlIGEgY29tcHJlc3NlZCBmaWxlICx3cml0ZSA2NEsgZGF0YSAsIGNhbGwg
ZnN5bmMoKSwgdGhlbiB0aGUgYmxvY2tzIGFyZSB3cml0ZSBhcyBjb21wcmVzc2VkIGNsdXN0ZXIu
DQpTdGVwMjoNCmlvdGNsKEYyRlNfSU9DX1NUQVJUX0FUT01JQ19XUklURSkgIC0tLSB0aGlzIHNo
b3VsZCBiZSBmYWlsLCBidXQgbm90Lg0Kd3JpdGUgcGFnZSAwIGFuZCBwYWdlIDMuDQppb3RjbChG
MkZTX0lPQ19DT01NSVRfQVRPTUlDX1dSSVRFKSAgLS0gcGFnZSAwIGFuZCAzIHdyaXRlIGFzIG5v
cm1hbCBmaWxlLCANClN0ZXAzOg0KZHJvcCBjYWNoZS4NClJlYWQgcGFnZSAwLTQgICAtLSBTaW5j
ZSBwYWdlIDAgaGFzIGEgdmFsaWQgYmxvY2sgYWRkcmVzcywgcmVhZCBhcyBuby1jb21wcmVzc2Vk
LCBwYWdlIDEgYW5kIDIgd2lsbCBiZSBjb21wcmVzc2VkIGRhdGEgb3IgemVyby4gDQoNCkFuZCBi
ZWZvcmUgZjJmczogY29tcHJlc3M6IHJlbW92ZSB1bm5lZWRlZCByZWFkIHdoZW4gcmV3cml0ZSB3
aG9sZSBjbHVzdGVyKSwgZXZlbiBTdGVwIDIgaXMgbm90IHJpZ2h0LCBidXQgd2hvbGUNCmNsdXN0
ZXIgd2lsbCBtYXJrIGRpcnR5IGluIHdyaXRlX2JlZ2luLCBhbmQgd2hvbGUgY2x1c3RlciB3aWxs
IGJlIHJlLXdyaXRlIGFzIG5vLWNvbXByZXNzZWQgY2x1c3Rlciwgc28gaXQncyBvay4NCg0KPiAN
Cj4gVGhhbmtzLA0KPiANCj4gPiBGaXhlczogNGM4ZmY3MDk1YmVmIChmMmZzOiBzdXBwb3J0IGRh
dGEgY29tcHJlc3Npb24pDQo+ID4gRml4ZXM6IDdlYWI3YTY5NjgyNyAoZjJmczogY29tcHJlc3M6
IHJlbW92ZSB1bm5lZWRlZCByZWFkIHdoZW4gcmV3cml0ZQ0KPiA+IHdob2xlIGNsdXN0ZXIpDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBGZW5nbmFuIENoYW5nIDxmZW5nbmFuY2hhbmdAZ21haWwu
Y29tPg0KPiA+IC0tLQ0KPiA+ICAgZnMvZjJmcy9kYXRhLmMgfCA0ICstLS0NCj4gPiAgIGZzL2Yy
ZnMvZmlsZS5jIHwgMyArKy0NCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIv
ZnMvZjJmcy9kYXRhLmMgaW5kZXgNCj4gPiA2YjVmMzg5YmE5OTguLjVjYmVlNGVkMDk4MiAxMDA2
NDQNCj4gPiAtLS0gYS9mcy9mMmZzL2RhdGEuYw0KPiA+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jDQo+
ID4gQEAgLTMzNTgsOCArMzM1OCw3IEBAIHN0YXRpYyBpbnQgZjJmc193cml0ZV9iZWdpbihzdHJ1
Y3QgZmlsZSAqZmlsZSwgc3RydWN0DQo+IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsDQo+ID4gICAJ
CWludCByZXQ7DQo+ID4NCj4gPiAgIAkJKmZzZGF0YSA9IE5VTEw7DQo+ID4gLQ0KPiA+IC0JCWlm
IChsZW4gPT0gUEFHRV9TSVpFKQ0KPiA+ICsJCWlmIChsZW4gPT0gUEFHRV9TSVpFICYmICEoZjJm
c19pc19hdG9taWNfZmlsZShpbm9kZSkpKQ0KPiA+ICAgCQkJZ290byByZXBlYXQ7DQo+ID4NCj4g
PiAgIAkJcmV0ID0gZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZShpbm9kZSwgcGFnZXAs
IGRpZmYgLS1naXQNCj4gPiBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMgaW5kZXgg
Y2ZkYzQxZjg3ZjVkLi4yNmE2NDhlZjllMWYNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9mcy9mMmZz
L2ZpbGUuYw0KPiA+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jDQo+ID4gQEAgLTIwMDksNyArMjAwOSw4
IEBAIHN0YXRpYyBpbnQgZjJmc19pb2Nfc3RhcnRfYXRvbWljX3dyaXRlKHN0cnVjdA0KPiA+IGZp
bGUgKmZpbHApDQo+ID4NCj4gPiAgIAlpbm9kZV9sb2NrKGlub2RlKTsNCj4gPg0KPiA+IC0JZjJm
c19kaXNhYmxlX2NvbXByZXNzZWRfZmlsZShpbm9kZSk7DQo+ID4gKwlpZiAoIWYyZnNfZGlzYWJs
ZV9jb21wcmVzc2VkX2ZpbGUoaW5vZGUpKQ0KPiA+ICsJCXJldHVybiAtRUlOVkFMOw0KPiA+DQo+
ID4gICAJaWYgKGYyZnNfaXNfYXRvbWljX2ZpbGUoaW5vZGUpKSB7DQo+ID4gICAJCWlmIChpc19p
bm9kZV9mbGFnX3NldChpbm9kZSwgRklfQVRPTUlDX1JFVk9LRV9SRVFVRVNUKSkNCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
