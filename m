Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BE444BA01
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Nov 2021 02:41:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mkcc9-0002rM-NX; Wed, 10 Nov 2021 01:41:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mkcc8-0002rG-00
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Nov 2021 01:41:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OLOi3CnaZz9l65r3SftWENMQXMM51NNN0nuLT9aDyIE=; b=WHPDr44n2UiNE5vzVo5W4tVMAF
 iYf0gd2/EjZNSfAqv5X7MpvO7cXC7N7TvzM/5Ma4m6sV0aJWyo5cHgfNj1JPgjLxhqhuVA0U4AuN2
 9GWP4yV3CwiKZsOpXCxTh+bY3yniGCoC8n5G/xClnEcWjrPXCvEYZHNqsfoBTXkqxjBg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OLOi3CnaZz9l65r3SftWENMQXMM51NNN0nuLT9aDyIE=; b=AZ1wYkDuvJWsffFGQrwrvCHaHP
 UiMUsnCP6l4SZfiGAnIDzb7Gj8JEGprw70SG4AZOd7Pu1u7MZ9qf6/xOkVzPsGPsa9tdp2XW7wvLk
 lVbx8G+RedRQUWvAnrIB1S+fCbOeD/oHplUcZ/42zJ23B8reMAomUYcY1kisEOCxXCrU=;
Received: from mail-eopbgr1300104.outbound.protection.outlook.com
 ([40.107.130.104] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mkcc6-0005lJ-23
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Nov 2021 01:41:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n843qNzsIXSTMwSAetWwc9+83ZTZ3wuAt4m5RzNDp99bnzUpYlDt5xpp0Q5MXA0F/3XIJe1cvfPEYN7eunlKlpriXMgyc9vNAA3udlzl6W3nIVVb7U0v9ChDkczN3fmAT5A+CMYro5nO/YT3gbgN2UL1OSLvwVgMkzpObttRwd2/Bw1H5Pyo83TmY/FyHUVF3Lw19RcX0loHZ6VJWlVJEDG9D9ReMOSVI8xZuh7qw03sbJOk+zx7QHb96PhxBg5fjCFatkZf6qvyfc3YYsBsEZTCGSmA1mPqiVGQJ+WIveqgpNZ0eoW7dV1T2/rn36FII7w2ipewekMk+rr8O5w7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLOi3CnaZz9l65r3SftWENMQXMM51NNN0nuLT9aDyIE=;
 b=ij7gi+nPbxRNPWmpCp22Y4aUU0Rax9YJ+ug8iFRxzV67ADRiVJugEs+dVbjU86Wiwn9PDfRGlALvcqVgsOdNhDQJHWziXvGFWtyFH2I43yeUF2ZTZQeKm+bGQHvVMg7AJxEeT6yVjO1fu5znkeSc/2TqYihy1yPULz3dyDoNifkaUeXTtHG5TX3iYl4bWDsD4aadoHYhBiUzhqJ2hFw+6Jv0xbtwDGiXzqYwXlvLTbs3HIxDmlI9208+GgYVhtXdHzglVYC8nCbPw9Mb48a5e52sNbPr0XJZM2Us9PAPFPXiCB/07v4hrCT2ET7tp/1M4R6hJ9qYgolw7FKaGE19ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLOi3CnaZz9l65r3SftWENMQXMM51NNN0nuLT9aDyIE=;
 b=VskrSzo5p3RkYasUtmv4CKfLD7lkjATCy/0eUK7uxlYUAGH8XLJPsV92F/C4fWl5qYRka6S2XFXkKYjdPC4g32su85ATo6zea5KYYSifQfGUO+XWF2Bt24r49ac6uyUkau8OZ0+gfUZqJGoMDGrfk0WQMpVZvcBBi990BkGbVP4=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3767.apcprd06.prod.outlook.com (2603:1096:820:17::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 10 Nov
 2021 01:41:13 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%5]) with mapi id 15.20.4690.016; Wed, 10 Nov 2021
 01:41:12 +0000
From: =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: Do we need serial io for compress file?
Thread-Index: AQHX1FRqrNmTjuyOY0ChZa278NHys6v5UtHQgABe1ACAANWicIAAsHWAgADF9AA=
Date: Wed, 10 Nov 2021 01:41:12 +0000
Message-ID: <KL1PR0601MB40034AE177D7AB8FE4E2E59EBB939@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20211108035459.40139-1-changfengnan@vivo.com>
 <KL1PR0601MB4003615E989DEFDE86793B58BB919@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <AI6AmQANEzwDyLqc-ild4qqN.9.1636381829406.Hmail.changfengnan@vivo.com>
 <KL1PR0601MB400396B05790858364501F3EBB929@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <AFUAIwC1E3YFUbOLaOBVbqp6.9.1636465594624.Hmail.changfengnan@vivo.com>
In-Reply-To: <AFUAIwC1E3YFUbOLaOBVbqp6.9.1636465594624.Hmail.changfengnan@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa310fc4-c191-4cd3-91f9-08d9a3eb2dca
x-ms-traffictypediagnostic: KL1PR0601MB3767:
x-microsoft-antispam-prvs: <KL1PR0601MB3767B3F0D88C8FAE034DBBDEBB939@KL1PR0601MB3767.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SmIq5xqprnCBMmtJTa7x3J+EgsFTaj6mUjcd++VKJ+AcRb+NMh0A7HoBnLZZrfjJH9WIe7RPFxnO9p0NuJexdKg2kyT7xJwEs7zAcaK0lKTSrqKfA0NBc/1G7/HVGgsPf48mynp2a+1xRsBefku8MltSet2hL3lOTY4oSDgl9Eku5I2WMXZ18FMO3RXK4T1xJRJyPjRJpEFKunSB0vkDWvUlXoIQhTQReLniSj0jRMdRjX1fsrpfR5ingBl9tMgVP77PBlr/fcmeq+OzXHKm1Hvxx/2FLM58geFRzdXgPSJw6vwFXbIEX2KpCrGRyWVlS5bkNmzd5cEPfg0gDaso3kxfMWVRdq+DON6fKYKG/BhVRpcFzd3VE5LpYQg83akeUOhRdlz4uhai1aGrgYzABHKRg2SoYGjNhZdVXp6mZMkAeXQbt7NpoQZyH1Qh1dQxuNMw7A4AUHWVmhSDGNuPWzbWjonV9CyATFJo6dXTwAwn23CTLaxBnwjoGIuxWlP+B6w6bzbZKc+mt/G1p40ypfuJiNqgrfooyhLcxh9yIVUbKys8En1CkRYIRdWroycKzDTXGGpjcCRoKU3jxmDWWzWFB1jueJ0GeDqVn9wFbDF6GBIyzIEbmB/0OERC3x6j
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(76116006)(71200400001)(26005)(85182001)(66446008)(52536014)(38070700005)(508600001)(110136005)(66946007)(64756008)(66556008)(316002)(83380400001)(66476007)(33656002)(86362001)(5660300002)(38100700002)(122000001)(2906002)(55016002)(53546011)(9686003)(6506007)(186003)(8936002)(7696005)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWRsbTErRUM0REZUTEpINUdBZnhLLzAxakZmUTRta0ZDdFNIMHlnMm54RFZX?=
 =?utf-8?B?TU80d1JnaUhheXBpMyt1dVpJMGc0NWNkK1Y2NitOMFRGc0ZkQ1FkREZlQ0tv?=
 =?utf-8?B?cDcyTXBjRVhCM0FzL1NzS2ZuYzBsU1NjOU91TTJaVjRBM2JZMk1sbGtmSHA0?=
 =?utf-8?B?M2JWdTkvYys4UnBCNVA0eThFeWkxQ2x1SGNSUHgrUXpDa3VRdUVlWXg3WGJM?=
 =?utf-8?B?VUJFaXh6bG5wSHF5NUtLK1dTVVVOejN3ZnRpVnc5OVZsZEtFSHJsNE8vN3RS?=
 =?utf-8?B?UmhFaklkL0FJNnpDbzB2TUVTamZLMWNZcE9XYXVHczluWCtmNjNkMVE2Vmc4?=
 =?utf-8?B?M3BjRy8zZ0Yzd3ZNa3RReGtzamNRUzZRTGFoVmlObjVoM1Bwc3kzVi82SFVH?=
 =?utf-8?B?N0l5V2ZFajFXVlhva2tYZytydStab0VtSmZzODEvMGtDcS93Z3h3bGpyOW5O?=
 =?utf-8?B?TTl5emxlUEQ2L1Y0RlhWOGY4dVQ3Uyt0K0QySG1BakdPTDdNaEpKbjNQRysr?=
 =?utf-8?B?SG95ZEFCUmRHeVdLK2VMRi9mOEVITk9JOVFqeWtaTjJLSVBQKzRMQVZ3bFpQ?=
 =?utf-8?B?U21HNnRROVdtSm5SbWxWakxBc2Jwa2g0b1UrOFdzaXlmY3c1T0RHbWlMQUpq?=
 =?utf-8?B?RTRvNnVKcTVJK0s0S01MZHZYd09ld2tpTE5rZmQ1N3dueDhTalE4a0VxZURZ?=
 =?utf-8?B?b285SHozbE1oUGZuODBRbFJQL0Uyc2lhaXRXNUtNZHZidU5uNTE2eFo3c1Fa?=
 =?utf-8?B?N29Tb2IxUEpUeGZuWnE0WFBxWGZJcGRROU56ZGNCMHMxbHhYSTN6aDlGN3RS?=
 =?utf-8?B?OW93UE9UZ3hkOWl1cHVNYXFKUGgyUUUzN2FkUDA5enlYbWV1bFZCOVhjdkFV?=
 =?utf-8?B?NWpzb1U3R3hxbjlXVWllTlUvaXBoeFlZeTl0ZlVQM1NmaE9qa08wNGovOWdk?=
 =?utf-8?B?OWtla0FqTHJ2QlRjeHNpV2xIdUJ4KzdkWW1jUnNPSzlubm9XNi9oVC9aRlMz?=
 =?utf-8?B?Y2lzQUIzSlFacFcxNGJWTm9IL0tjZWZPQnB5VnpXdTlydlhiVFI1Y09QMmRR?=
 =?utf-8?B?eDZlVTdaT3g2WTVMSU11bFZIcTYrbTlmSVZzVVE0OGY3aGN0cFJJTlIxMHF2?=
 =?utf-8?B?L2pZcTl1R3doM0QzZ2k5M1hsaktxNmJmeUFuY2NRay9RWnlLVUpZNDg3NmY4?=
 =?utf-8?B?Y2pOZkdZMUVuVGdHY1JZMXg0UXpFbmtvWm93UEY1THQybG9CMXI4eU9TWFNT?=
 =?utf-8?B?TDMzWVRQVGFIL08xeG9WLzRLVXAxcFpvUXpvVjkxenZBTi9uUHZscTJCUG5Y?=
 =?utf-8?Q?9YavAVAvp5z6UL6VMDAbBlyhvz1QQVS811?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa310fc4-c191-4cd3-91f9-08d9a3eb2dca
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 01:41:12.5928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VQWwmgXzTAhsm3cVUvfrUKNYpp1tzTueSRPlOl96iQIYtGklqyHKsE3EiXQqYdnHPJQAYEpRHCmo8FexFV2f0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3767
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
 no trust [40.107.130.104 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.104 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mkcc6-0005lJ-23
Subject: Re: [f2fs-dev] Do we need serial io for compress file?
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjaGFuZ2ZlbmduYW5Adml2by5j
b20gPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4gT24gQmVoYWxmIE9mDQo+IENoYW8gWXUNCj4gU2Vu
dDogVHVlc2RheSwgTm92ZW1iZXIgOSwgMjAyMSA5OjQ2IFBNDQo+IFRvOiDluLjlh6TmpaAgPGNo
YW5nZmVuZ25hbkB2aXZvLmNvbT47IGphZWdldWtAa2VybmVsLm9yZw0KPiBDYzogbGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQNCj4gU3ViamVjdDogUmU6IERvIHdlIG5lZWQg
c2VyaWFsIGlvIGZvciBjb21wcmVzcyBmaWxlPw0KPiANCj4gT24gMjAyMS8xMS85IDExOjE4LCDl
uLjlh6TmpaAgd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+PiBGcm9tOiBjaGFuZ2ZlbmduYW5Adml2by5jb20gPGNoYW5nZmVuZ25hbkB2aXZvLmNv
bT4gT24gQmVoYWxmDQo+IE9mIENoYW8NCj4gPj4gWXUNCj4gPj4gU2VudDogTW9uZGF5LCBOb3Zl
bWJlciA4LCAyMDIxIDEwOjMwIFBNDQo+ID4+IFRvOiDluLjlh6TmpaAgPGNoYW5nZmVuZ25hbkB2
aXZvLmNvbT47IGphZWdldWtAa2VybmVsLm9yZw0KPiA+PiBDYzogbGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQNCj4gPj4gU3ViamVjdDogUmU6IERvIHdlIG5lZWQgc2VyaWFs
IGlvIGZvciBjb21wcmVzcyBmaWxlPw0KPiA+Pg0KPiA+PiBPbiAyMDIxLzExLzggMTY6NTYsIOW4
uOWHpOaloCB3cm90ZToNCj4gPj4+IEFueXdheSwgSSBkaWQgc29tZSBtb2RpZnkgdG8gdmVyaWZ5
IG15IGlkZWEsIGFuZCBkaWQgc29tZSB0ZXN0LCBub3QNCj4gPj4gZm91bmQgcHJvYmxlbSBmb3Ig
bm93Lg0KPiA+Pg0KPiA+PiBDb3VsZCB5b3UgcGxlYXNlIGNvbnNpZGVyOg0KPiA+PiAxLiBwaW4g
ZmlsZQ0KPiA+PiAyLiBmYWxsb2NhdGUgZmlsZSB3LyBmaWxlc2l6ZSBrZWVwZWQNCj4gPj4gICAg
LSBpdCB3aWxsIHByZWFsbG9jYXRlIHBoeXNpY2FsIGJsb2NrcyBhbGlnbmVkIHRvIHNlZ21lbnRz
IDMuIHVucGluIGZpbGUNCj4gNC4NCj4gPj4gb3ZlcndyaXRlIGNvbXByZXNzZWQgZmlsZQ0KPiA+
DQo+ID4gU28geW91IG1lYW5zIGFmdGVyIHN0ZXAgMS0zLCBpdCB3aWxsIG1ha2UgY29tcHJlc3Nl
ZCBmaWxlIGZyYWdtZW50YXRpb24NCj4gd29yc2UgPw0KPiANCj4gT2gsIEknbSB0cnlpbmcgdG8g
ZmluZCBhIHdheSB0byBhdm9pZCB3cml0ZSBwZXJmb3JtYW5jZSByZWdyZXNzaW9uIGR1ZSB0bw0K
PiByYWNlIGNvbmRpdGlvbiBvbiB3cml0ZXBhZ2VzIGxvY2sgbWVhbndoaWxlIGF2b2lkaW5nIGZy
YWdtZW50YXRpb24gb2YNCj4gY29tcHJlc3NlZCBmaWxlLg0KDQpZZXAsIHRoYXQncyB3aGF0IEkg
d2FudCB0byBkbywgbG9va2luZyBmb3J3YXJkIHlvdXIgaWRlYS4NCkFuZCBob3cgYWJvdXQgdGhl
IG1vZGlmeSBhcyBiZWxvdyA/DQoNClRoYW5rcy4NCj4gQnV0IEknbSBvdXQgb2YgbXkgbWluZCwg
YWJvdmUgY2FzZSB3b3VsZG4ndCBoZWxwLCBwbGVhc2UgaWdub3JlIHRoaXMuDQo+IA0KPiBUaGFu
a3MsDQo+IA0KPiA+DQo+ID4gVGhhbmtzLg0KPiA+Pg0KPiA+PiBUaGFua3MsDQo+ID4+DQo+ID4+
Pg0KPiA+Pj4gVGhlIG1vZGlmeSBhcyBmb2xsb3dzOg0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jIGluZGV4DQo+ID4+PiBmNGZkNmMyNDZj
OWEuLjBlZDY3N2VmZTgyMCAxMDA2NDQNCj4gPj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jDQo+ID4+
PiArKysgYi9mcy9mMmZzL2RhdGEuYw0KPiA+Pj4gQEAgLTMxNjUsOCArMzE2NSw2IEBAIHN0YXRp
YyBpbmxpbmUgYm9vbA0KPiA+Pj4gX19zaG91bGRfc2VyaWFsaXplX2lvKHN0cnVjdA0KPiA+PiBp
bm9kZSAqaW5vZGUsDQo+ID4+PiAgICAJaWYgKElTX05PUVVPVEEoaW5vZGUpKQ0KPiA+Pj4gICAg
CQlyZXR1cm4gZmFsc2U7DQo+ID4+Pg0KPiA+Pj4gLQlpZiAoZjJmc19uZWVkX2NvbXByZXNzX2Rh
dGEoaW5vZGUpKQ0KPiA+Pj4gLQkJcmV0dXJuIHRydWU7DQo+ID4+PiAgICAJaWYgKHdiYy0+c3lu
Y19tb2RlICE9IFdCX1NZTkNfQUxMKQ0KPiA+Pj4gICAgCQlyZXR1cm4gdHJ1ZTsNCj4gPj4+ICAg
IAlpZiAoZ2V0X2RpcnR5X3BhZ2VzKGlub2RlKSA+PQ0KPiA+Pj4gU01fSShGMkZTX0lfU0IoaW5v
ZGUpKS0+bWluX3NlcV9ibG9ja3MpDQo+ID4+PiBAQCAtMzIxOCwxMSArMzIxNiwxNiBAQCBzdGF0
aWMgaW50IF9fZjJmc193cml0ZV9kYXRhX3BhZ2VzKHN0cnVjdA0KPiA+PiBhZGRyZXNzX3NwYWNl
ICptYXBwaW5nLA0KPiA+Pj4gICAgCQltdXRleF9sb2NrKCZzYmktPndyaXRlcGFnZXMpOw0KPiA+
Pj4gICAgCQlsb2NrZWQgPSB0cnVlOw0KPiA+Pj4gICAgCX0NCj4gPj4+ICsJaWYgKGYyZnNfbmVl
ZF9jb21wcmVzc19kYXRhKGlub2RlKSkNCj4gPj4+ICsJCW11dGV4X2xvY2soJihGMkZTX0koaW5v
ZGUpLT5jb21wcmVzc19sb2NrKSk7DQo+ID4+Pg0KPiA+Pj4gICAgCWJsa19zdGFydF9wbHVnKCZw
bHVnKTsNCj4gPj4+ICAgIAlyZXQgPSBmMmZzX3dyaXRlX2NhY2hlX3BhZ2VzKG1hcHBpbmcsIHdi
YywgaW9fdHlwZSk7DQo+ID4+PiAgICAJYmxrX2ZpbmlzaF9wbHVnKCZwbHVnKTsNCj4gPj4+DQo+
ID4+PiArCWlmIChmMmZzX25lZWRfY29tcHJlc3NfZGF0YShpbm9kZSkpDQo+ID4+PiArCQltdXRl
eF91bmxvY2soJihGMkZTX0koaW5vZGUpLT5jb21wcmVzc19sb2NrKSk7DQo+ID4+PiArDQo+ID4+
PiAgICAJaWYgKGxvY2tlZCkNCj4gPj4+ICAgIAkJbXV0ZXhfdW5sb2NrKCZzYmktPndyaXRlcGFn
ZXMpOw0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMv
ZjJmcy5oIGluZGV4DQo+ID4+PiAwMzlhMjI5ZTExYzkuLjNhNjU4N2YxM2QyZiAxMDA2NDQNCj4g
Pj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oDQo+ID4+PiArKysgYi9mcy9mMmZzL2YyZnMuaA0KPiA+
Pj4gQEAgLTc2Myw2ICs3NjMsNyBAQCBzdHJ1Y3QgZjJmc19pbm9kZV9pbmZvIHsNCj4gPj4+ICAg
IAlzdHJ1Y3QgbGlzdF9oZWFkIGlubWVtX3BhZ2VzOwkvKiBpbm1lbW9yeSBwYWdlcyBtYW5hZ2Vk
IGJ5DQo+ID4+IGYyZnMgKi8NCj4gPj4+ICAgIAlzdHJ1Y3QgdGFza19zdHJ1Y3QgKmlubWVtX3Rh
c2s7CS8qIHN0b3JlIGlubWVtb3J5IHRhc2sgKi8NCj4gPj4+ICAgIAlzdHJ1Y3QgbXV0ZXggaW5t
ZW1fbG9jazsJLyogbG9jayBmb3IgaW5tZW1vcnkgcGFnZXMgKi8NCj4gPj4+ICsJc3RydWN0IG11
dGV4IGNvbXByZXNzX2xvY2s7CS8qIGxvY2sgZm9yIGNvbXByZXNzIGZpbGUgKi8NCj4gPj4+ICAg
IAlzdHJ1Y3QgZXh0ZW50X3RyZWUgKmV4dGVudF90cmVlOwkvKiBjYWNoZWQgZXh0ZW50X3RyZWUg
ZW50cnkgKi8NCj4gPj4+DQo+ID4+PiAgICAJLyogYXZvaWQgcmFjaW5nIGJldHdlZW4gZm9yZWdy
b3VuZCBvcCBhbmQgZ2MgKi8gZGlmZiAtLWdpdA0KPiA+Pj4gYS9mcy9mMmZzL3N1cGVyLmMgYi9m
cy9mMmZzL3N1cGVyLmMgaW5kZXggYTEzMzkzMjMzM2M1Li44NTY2ZTljMzQ1NDANCj4gPj4+IDEw
MDY0NA0KPiA+Pj4gLS0tIGEvZnMvZjJmcy9zdXBlci5jDQo+ID4+PiArKysgYi9mcy9mMmZzL3N1
cGVyLmMNCj4gPj4+IEBAIC0xMzIzLDYgKzEzMjMsNyBAQCBzdGF0aWMgc3RydWN0IGlub2RlICpm
MmZzX2FsbG9jX2lub2RlKHN0cnVjdA0KPiA+PiBzdXBlcl9ibG9jayAqc2IpDQo+ID4+PiAgICAJ
SU5JVF9MSVNUX0hFQUQoJmZpLT5pbm1lbV9pbGlzdCk7DQo+ID4+PiAgICAJSU5JVF9MSVNUX0hF
QUQoJmZpLT5pbm1lbV9wYWdlcyk7DQo+ID4+PiAgICAJbXV0ZXhfaW5pdCgmZmktPmlubWVtX2xv
Y2spOw0KPiA+Pj4gKwltdXRleF9pbml0KCZmaS0+Y29tcHJlc3NfbG9jayk7DQo+ID4+PiAgICAJ
aW5pdF9yd3NlbSgmZmktPmlfZ2NfcndzZW1bUkVBRF0pOw0KPiA+Pj4gICAgCWluaXRfcndzZW0o
JmZpLT5pX2djX3J3c2VtW1dSSVRFXSk7DQo+ID4+PiAgICAJaW5pdF9yd3NlbSgmZmktPmlfeGF0
dHJfc2VtKTsNCj4gPj4+IC0tDQo+ID4+Pg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4+Pj4gRnJvbTog5bi45Yek5qWgDQo+ID4+Pj4gU2VudDogTW9uZGF5LCBOb3ZlbWJl
ciA4LCAyMDIxIDExOjU1IEFNDQo+ID4+Pj4gVG86IGphZWdldWtAa2VybmVsLm9yZzsgY2hhb0Br
ZXJuZWwub3JnDQo+ID4+Pj4gQ2M6IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0DQo+ID4+Pj4gU3ViamVjdDogRG8gd2UgbmVlZCBzZXJpYWwgaW8gZm9yIGNvbXByZXNzIGZp
bGU/DQo+ID4+Pj4NCj4gPj4+PiBJbiBteSB0ZXN0LCBzZXJpYWwgaW8gZm9yIGNvbXByZXNzIGZp
bGUgd2lsbCBtYWtlIG11bHRpdGhyZWFkIHNtYWxsDQo+ID4+Pj4gd3JpdGUgcGVyZm9ybWFuY2Ug
ZHJvcCBhIGxvdC4NCj4gPj4+Pg0KPiA+Pj4+IEknbSB0cnkgdG8gZmluZ3VyZSBvdXQgd2h5IHdl
IG5lZWQgX19zaG91bGRfc2VyaWFsaXplX2lvLCBJTU8sIHdlDQo+ID4+Pj4gdXNlIF9fc2hvdWxk
X3NlcmlhbGl6ZV9pbyB0byBhdm9pZCBkZWFkbG9jayBvciB0cnkgdG8gaW1wcm92ZQ0KPiA+Pj4+
IHNlcXVlbnRpYWwgcGVyZm9ybWFuY2UsIGJ1dCBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHdlIHNo
b3VsZCBkbw0KPiA+Pj4+IHRoaXMgZm9yIGNvbXByZXNzZWQgZmlsZS4gSW4gbXkgdGVzdCwgaWYg
d2UganVzdCByZW1vdmUgdGhpcywgd3JpdGUNCj4gPj4+PiBzYW1lIGZpbGUgaW4gbXVsdGl0aHJl
YWQgd2lsbCBoYXZlIHByb2JsZW0sIGJ1dCBwYXJhbGxlbCB3cml0ZQ0KPiA+Pj4+IGRpZmZlcmVu
dCBmaWxlcyBpbiBtdWx0aXRocmVhZCBpcyBvay4gU28gSSB0aGluayBtYXliZSB3ZSBzaG91bGQN
Cj4gPj4+PiB1c2UgYW5vdGhlciBsb2NrIHRvIGFsbG93IHdyaXRlIGRpZmZlcmVudCBmaWxlcyBp
biBtdWx0aXRocmVhZC4NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
