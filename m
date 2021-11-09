Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8C944A546
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Nov 2021 04:18:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mkHep-0005A5-PP; Tue, 09 Nov 2021 03:18:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mkHeg-00059u-Ts
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 03:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uZq0M3Wi+NdJ5CYxfmxTeTAyOyVnAiJXEPx/5uMN6xU=; b=MguuWFFGARKtHDZqKISEFL/W1d
 RBmqgn7e00guj1Av+PCZbIr7K/f1Y/vRc8/PnRt8bWwHr40luoupvL+1uhetGwAvS3vciZVriTRJV
 woJBKHpO6M0zMurAGv5tkuhzYEkbS+Yvt0ppBC5yVQGdCYxKVlAQHOen4cfQfkNB9Cg4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uZq0M3Wi+NdJ5CYxfmxTeTAyOyVnAiJXEPx/5uMN6xU=; b=ITkTI/heDv9Tbu0Qn2nuL/ik6w
 iEhbdLK/TbetYpWUBmd599vhGU8GtmgZD8Mf5rZA31r+5A4rzQ2kV0IUSRgZZOdSApXVxyKZShC8s
 pPdlurqampInD08acKDx7gK1L1q00oY1dBhbU2dHmbUKDUM9Ta/eQAFrnAGTxmOP/BCw=;
Received: from mail-eopbgr1310118.outbound.protection.outlook.com
 ([40.107.131.118] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mkHeY-0007gi-1j
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 03:18:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwoDtuxXiK5cx7UXJ/Jg+w9BTTozX5G/6C/VMe9jVMZYWfMBGwifzZKX7oN1QSne5cMzv8j/4+BQS4Nyp6fVw9U6+l0shoVywyEkPdxuqCNrfzr1oPxH2BxWam1yVZU75/6/JQONuDreirySZ6DchZ5UXsBcWn5daumIp1Z6p9sxGSXYHrqoN1O/xaFH6kaMjIrgLKSAWJJo+JoQu62pO8JeWpC/tiWnCGJ91PPlrhgm/GZDEg/RtDMm7NTcusxgtAbZctQzKbxgpoNoy65zmO55wpIgfmFvEXmUGBFxS4KJxpEPhbj3fhVZnfmy4Th9q8gJW2/i3hj5jnRvcwfwNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZq0M3Wi+NdJ5CYxfmxTeTAyOyVnAiJXEPx/5uMN6xU=;
 b=hRqs7oP+t8Gmb3zf1Eb5zQ6sQSDOu3Ma5Db14zaVyzIWVMOBklaeLBjWf/W1tXiDOQJWxt306TQvgb/5uk0ksjZCst6BQ37YHULGP3t+DH4e7vhVjtMy59yGT6HC2SEme28xg0Czsn7TpsRgpC7e7za8DQpE1q21qd/GV/cBwUe5K7FHAA4voAEzeIrEeWeGMOftCWyMlwj1dnlV5pnC02lTJB/kd9VQT0Drg7elZ12wBEjFlc4Z8B1hY71RnRdiBC0qh+jt6p6zQxSgYqzBtOBjoIl2ikP1XUM4HlORNgLCBMCstfEV8Qm8aFGYINiSXHcGY5IAUR7FsH9lU+yy8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZq0M3Wi+NdJ5CYxfmxTeTAyOyVnAiJXEPx/5uMN6xU=;
 b=Bt2521TunaM+uVDbpnynckrBtkdDK0Vwnx70DPK88WIgLgnVXU2oiCfm/edDW++zNIcm+md/uTyl+IAKREPhEmz6F1dUO0y9GPAbMIGn5Yd+sLxS38Qi/X39PHhFtCKv/9ZBaRvWMVvXwK7tn+UE5FajQ1OrYOITCa4WQCOp0AM=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3781.apcprd06.prod.outlook.com (2603:1096:820:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 03:18:20 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%6]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 03:18:20 +0000
From: =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: Do we need serial io for compress file?
Thread-Index: AQHX1FRqrNmTjuyOY0ChZa278NHys6v5UtHQgABe1ACAANWicA==
Date: Tue, 9 Nov 2021 03:18:20 +0000
Message-ID: <KL1PR0601MB400396B05790858364501F3EBB929@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20211108035459.40139-1-changfengnan@vivo.com>
 <KL1PR0601MB4003615E989DEFDE86793B58BB919@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <AI6AmQANEzwDyLqc-ild4qqN.9.1636381829406.Hmail.changfengnan@vivo.com>
In-Reply-To: <AI6AmQANEzwDyLqc-ild4qqN.9.1636381829406.Hmail.changfengnan@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02c83dc9-ae58-4275-a619-08d9a32f94b8
x-ms-traffictypediagnostic: KL1PR0601MB3781:
x-microsoft-antispam-prvs: <KL1PR0601MB3781AA71E08AE738F57C4FD7BB929@KL1PR0601MB3781.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:454;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n8CJ/yEyWB79BM/ndg8t/K5CnNnydj00MsUWjTGYyeaHJUIdrJ+LsLhLhCSGDLPI+8i2EPXmtcwY1U6+Chr2n9MtAuCrKtjjwz/ElX5FSo7r4fbnyC+4joUj7u6ynrr+2DeSjXYVHWz/kAksoGz+frIZX1KghaZdl7vM1j9ejYlTuDSZrP2ZWCJFE2n9oIHi5YvDvFR+nA4kJkXwJdJ1vf3Y4Mh1TO3nHbQr3cAFfZH63JKQZVT2OS4zjSHKCIVXP9/7a2xvL28Pw1WIzlt+RhGw4JctyFlOGZjfiPd+wjWvrO9MjV1OaDvW1sLM93JZtz7Wq4kS5f9eh1muG8tPF2ONS9SWHz7BkpP6K90A4U0YhU4JzxqrOiRNiv6bmqvZsnbP4tVFfIwBNHzRn6wJ3Gp4870XdMbSP1jZXldjL63sjwoXu2g2gTyM9AGMJK+V0BjFs/5FgACNtO8M6cHBz1QF3KA6Qi1UOrIawJECbO7vQ5FrnzNY8ncP4+nAVaMvlCcS5SvpOkW61jMTUIawZyt/+imF3xeKiX5darT2jXEFg8Q6fXQQNLNRBp0zQ+FNU8m1LWN+rZzPHEUJz2iz++DEekZHdkgnt/VTqS1d/Vx/VUstNs/JtM1LCOTdz072
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(2906002)(9686003)(66946007)(33656002)(186003)(26005)(83380400001)(85182001)(55016002)(7696005)(53546011)(5660300002)(8936002)(6506007)(316002)(52536014)(71200400001)(38100700002)(76116006)(508600001)(66556008)(66476007)(64756008)(8676002)(66446008)(110136005)(122000001)(86362001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enZ5VzVOT3AxRGFkckdkTm9GTlVHWXNZTUhUdTA0dkVIcHRqRGZWY1htVlI3?=
 =?utf-8?B?c3Uzc0lDd3JPOGxPNHhMNTI0N2xIZEZIODNOd2s0aVpnZXZPN0Uvdmd1TWVH?=
 =?utf-8?B?OW1lTFNtY1ZzQmZDdXpxbXFWY1dPbGwveEZEcS9rZEU4M3pPUlNMQVJvUEdv?=
 =?utf-8?B?dWtmR05wRVdWNjRSNjN4SDlWRis5VnBIcU8zNjVHTzk2eUIreWVQNGtEU0t6?=
 =?utf-8?B?d1Z0UmJlUHBUV2x4RDBkWkFBQUxvWldXRmNnRkxrRDZzUGVZODhoWk10U0ND?=
 =?utf-8?B?MlZFQVBFRkRldDM1OWxtYlJTOEU3UEMzb0VZRnZNQ1RJajEyK0lWb2VPWkRY?=
 =?utf-8?B?OGJodFl6SXQxR3hQbm1lMjdseUdpTk9pTEN0K2QxdlhldjNjTzg3Zk5pNzRT?=
 =?utf-8?B?d1ZkeURBWDNsNHI4L3BlSGIvOEhRWjBLYys1TlZkVlJkd3Q0RGw5TlV3UFVE?=
 =?utf-8?B?aVZ5QjNvMUJySEk5UkN6dW1xTGlDcml6azFNYWljR1QxWjh0M3ovN1NRS2wy?=
 =?utf-8?B?YWFIRGxOV2MvN3hSNVN0L0hsUkRtNmZQZy93VGNVK0o4ZmRXMkNWQkdpdVpj?=
 =?utf-8?B?M3NGVlVLQzZDcFpKYVlsWXI1dkRTKzhDMnZRU21lTUlZUVljK3Q5cGFvK3lL?=
 =?utf-8?B?TDY1ZmN5YnhRcDRxQmpadElJM1c2YjFIb0J1ZzgwckUvOEg1SkI2UkszRFh3?=
 =?utf-8?B?NEZjcDhIb08vVXFjTVFFemJsbmpJbWJhblV0QmdjL2o4VWd4bjVSalhsRDRj?=
 =?utf-8?B?UTVEZ2JYWFBnQUo5RzlURk82RHMxMVVDN3NnaWxvUGpvNnpWZHhHaU15OXo0?=
 =?utf-8?B?WCtxbTgrc2M5dHZ3Uk5qbmJ6ZDJxT0MzcW1US1NMa3pOYnczOVpQWkMrTjNv?=
 =?utf-8?B?dXJBT0FROTBtZTdkb1A1TXphajlNYzdpbXZWZ1BKSEdKMlJ3OFhCVkl6eEw3?=
 =?utf-8?B?OXpWTXFGektFT2R4Y1hDbGU1TW5uOUxXSzhYbm4xS0w4S3FVemVoMTl4aGlM?=
 =?utf-8?B?Yys5ZDA2ZG1kT2FMdkJPVUMrT1IxSFJVb1ptODFTMUt3SkEzVy9MOGp3U3hy?=
 =?utf-8?B?OWVRYUQxYVhzTUh1aXRDZ01GUllYN1VlMHpaWWtqUWFOdHdCTDhjS0Rwa3NG?=
 =?utf-8?B?L1I2aTllc0FwTElCZDRCcmgzRXpLQmdwNVkzNGFyOTRTRnl5aTUveEFsMnVI?=
 =?utf-8?B?ZVJQR3pacjFIQnhJQXBWb3FXQkgrMkFXSEVpekVZMlhRbFhmRDhJZ0ttcFRZ?=
 =?utf-8?B?ZVM2M09mT2pTV0VMUWNrVTJXQmpiK25vQ0N2akxQVG1oK05rSDFiZVZ5dUdE?=
 =?utf-8?Q?ySiHdbFTjqsg2sJbKPFmvghM1/N5IfO9C7?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c83dc9-ae58-4275-a619-08d9a32f94b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 03:18:20.1056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kcoManzM0l+612/CQmJp6qleGO+AkjBJuCekIDjhwW5J5/SIJASxE5SfdgiRUVM5sggaP9d0xtdY7Pi6dh+bDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3781
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.131.118 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.131.118 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mkHeY-0007gi-1j
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogY2hhbmdmZW5nbmFuQHZp
dm8uY29tIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+IE9uIEJlaGFsZiBPZg0KPiBDaGFvIFl1DQo+
IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgOCwgMjAyMSAxMDozMCBQTQ0KPiBUbzog5bi45Yek5qWg
IDxjaGFuZ2ZlbmduYW5Adml2by5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0DQo+IFN1YmplY3Q6IFJlOiBEbyB3ZSBu
ZWVkIHNlcmlhbCBpbyBmb3IgY29tcHJlc3MgZmlsZT8NCj4gDQo+IE9uIDIwMjEvMTEvOCAxNjo1
Niwg5bi45Yek5qWgIHdyb3RlOg0KPiA+IEFueXdheSwgSSBkaWQgc29tZSBtb2RpZnkgdG8gdmVy
aWZ5IG15IGlkZWEsIGFuZCBkaWQgc29tZSB0ZXN0LCBub3QNCj4gZm91bmQgcHJvYmxlbSBmb3Ig
bm93Lg0KPiANCj4gQ291bGQgeW91IHBsZWFzZSBjb25zaWRlcjoNCj4gMS4gcGluIGZpbGUNCj4g
Mi4gZmFsbG9jYXRlIGZpbGUgdy8gZmlsZXNpemUga2VlcGVkDQo+ICAgLSBpdCB3aWxsIHByZWFs
bG9jYXRlIHBoeXNpY2FsIGJsb2NrcyBhbGlnbmVkIHRvIHNlZ21lbnRzIDMuIHVucGluIGZpbGUg
NC4NCj4gb3ZlcndyaXRlIGNvbXByZXNzZWQgZmlsZQ0KDQpTbyB5b3UgbWVhbnMgYWZ0ZXIgc3Rl
cCAxLTMsIGl0IHdpbGwgbWFrZSBjb21wcmVzc2VkIGZpbGUgZnJhZ21lbnRhdGlvbiB3b3JzZSA/
DQoNClRoYW5rcy4NCj4gDQo+IFRoYW5rcywNCj4gDQo+ID4NCj4gPiBUaGUgbW9kaWZ5IGFzIGZv
bGxvd3M6DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2Rh
dGEuYyBpbmRleA0KPiA+IGY0ZmQ2YzI0NmM5YS4uMGVkNjc3ZWZlODIwIDEwMDY0NA0KPiA+IC0t
LSBhL2ZzL2YyZnMvZGF0YS5jDQo+ID4gKysrIGIvZnMvZjJmcy9kYXRhLmMNCj4gPiBAQCAtMzE2
NSw4ICszMTY1LDYgQEAgc3RhdGljIGlubGluZSBib29sIF9fc2hvdWxkX3NlcmlhbGl6ZV9pbyhz
dHJ1Y3QNCj4gaW5vZGUgKmlub2RlLA0KPiA+ICAgCWlmIChJU19OT1FVT1RBKGlub2RlKSkNCj4g
PiAgIAkJcmV0dXJuIGZhbHNlOw0KPiA+DQo+ID4gLQlpZiAoZjJmc19uZWVkX2NvbXByZXNzX2Rh
dGEoaW5vZGUpKQ0KPiA+IC0JCXJldHVybiB0cnVlOw0KPiA+ICAgCWlmICh3YmMtPnN5bmNfbW9k
ZSAhPSBXQl9TWU5DX0FMTCkNCj4gPiAgIAkJcmV0dXJuIHRydWU7DQo+ID4gICAJaWYgKGdldF9k
aXJ0eV9wYWdlcyhpbm9kZSkgPj0NCj4gPiBTTV9JKEYyRlNfSV9TQihpbm9kZSkpLT5taW5fc2Vx
X2Jsb2NrcykNCj4gPiBAQCAtMzIxOCwxMSArMzIxNiwxNiBAQCBzdGF0aWMgaW50IF9fZjJmc193
cml0ZV9kYXRhX3BhZ2VzKHN0cnVjdA0KPiBhZGRyZXNzX3NwYWNlICptYXBwaW5nLA0KPiA+ICAg
CQltdXRleF9sb2NrKCZzYmktPndyaXRlcGFnZXMpOw0KPiA+ICAgCQlsb2NrZWQgPSB0cnVlOw0K
PiA+ICAgCX0NCj4gPiArCWlmIChmMmZzX25lZWRfY29tcHJlc3NfZGF0YShpbm9kZSkpDQo+ID4g
KwkJbXV0ZXhfbG9jaygmKEYyRlNfSShpbm9kZSktPmNvbXByZXNzX2xvY2spKTsNCj4gPg0KPiA+
ICAgCWJsa19zdGFydF9wbHVnKCZwbHVnKTsNCj4gPiAgIAlyZXQgPSBmMmZzX3dyaXRlX2NhY2hl
X3BhZ2VzKG1hcHBpbmcsIHdiYywgaW9fdHlwZSk7DQo+ID4gICAJYmxrX2ZpbmlzaF9wbHVnKCZw
bHVnKTsNCj4gPg0KPiA+ICsJaWYgKGYyZnNfbmVlZF9jb21wcmVzc19kYXRhKGlub2RlKSkNCj4g
PiArCQltdXRleF91bmxvY2soJihGMkZTX0koaW5vZGUpLT5jb21wcmVzc19sb2NrKSk7DQo+ID4g
Kw0KPiA+ICAgCWlmIChsb2NrZWQpDQo+ID4gICAJCW11dGV4X3VubG9jaygmc2JpLT53cml0ZXBh
Z2VzKTsNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJm
cy5oIGluZGV4DQo+ID4gMDM5YTIyOWUxMWM5Li4zYTY1ODdmMTNkMmYgMTAwNjQ0DQo+ID4gLS0t
IGEvZnMvZjJmcy9mMmZzLmgNCj4gPiArKysgYi9mcy9mMmZzL2YyZnMuaA0KPiA+IEBAIC03NjMs
NiArNzYzLDcgQEAgc3RydWN0IGYyZnNfaW5vZGVfaW5mbyB7DQo+ID4gICAJc3RydWN0IGxpc3Rf
aGVhZCBpbm1lbV9wYWdlczsJLyogaW5tZW1vcnkgcGFnZXMgbWFuYWdlZCBieQ0KPiBmMmZzICov
DQo+ID4gICAJc3RydWN0IHRhc2tfc3RydWN0ICppbm1lbV90YXNrOwkvKiBzdG9yZSBpbm1lbW9y
eSB0YXNrICovDQo+ID4gICAJc3RydWN0IG11dGV4IGlubWVtX2xvY2s7CS8qIGxvY2sgZm9yIGlu
bWVtb3J5IHBhZ2VzICovDQo+ID4gKwlzdHJ1Y3QgbXV0ZXggY29tcHJlc3NfbG9jazsJLyogbG9j
ayBmb3IgY29tcHJlc3MgZmlsZSAqLw0KPiA+ICAgCXN0cnVjdCBleHRlbnRfdHJlZSAqZXh0ZW50
X3RyZWU7CS8qIGNhY2hlZCBleHRlbnRfdHJlZSBlbnRyeSAqLw0KPiA+DQo+ID4gICAJLyogYXZv
aWQgcmFjaW5nIGJldHdlZW4gZm9yZWdyb3VuZCBvcCBhbmQgZ2MgKi8gZGlmZiAtLWdpdA0KPiA+
IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jIGluZGV4IGExMzM5MzIzMzNjNS4u
ODU2NmU5YzM0NTQwDQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvZnMvZjJmcy9zdXBlci5jDQo+ID4g
KysrIGIvZnMvZjJmcy9zdXBlci5jDQo+ID4gQEAgLTEzMjMsNiArMTMyMyw3IEBAIHN0YXRpYyBz
dHJ1Y3QgaW5vZGUgKmYyZnNfYWxsb2NfaW5vZGUoc3RydWN0DQo+IHN1cGVyX2Jsb2NrICpzYikN
Cj4gPiAgIAlJTklUX0xJU1RfSEVBRCgmZmktPmlubWVtX2lsaXN0KTsNCj4gPiAgIAlJTklUX0xJ
U1RfSEVBRCgmZmktPmlubWVtX3BhZ2VzKTsNCj4gPiAgIAltdXRleF9pbml0KCZmaS0+aW5tZW1f
bG9jayk7DQo+ID4gKwltdXRleF9pbml0KCZmaS0+Y29tcHJlc3NfbG9jayk7DQo+ID4gICAJaW5p
dF9yd3NlbSgmZmktPmlfZ2NfcndzZW1bUkVBRF0pOw0KPiA+ICAgCWluaXRfcndzZW0oJmZpLT5p
X2djX3J3c2VtW1dSSVRFXSk7DQo+ID4gICAJaW5pdF9yd3NlbSgmZmktPmlfeGF0dHJfc2VtKTsN
Cj4gPiAtLQ0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206
IOW4uOWHpOaloA0KPiA+PiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDgsIDIwMjEgMTE6NTUgQU0N
Cj4gPj4gVG86IGphZWdldWtAa2VybmVsLm9yZzsgY2hhb0BrZXJuZWwub3JnDQo+ID4+IENjOiBs
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldA0KPiA+PiBTdWJqZWN0OiBEbyB3
ZSBuZWVkIHNlcmlhbCBpbyBmb3IgY29tcHJlc3MgZmlsZT8NCj4gPj4NCj4gPj4gSW4gbXkgdGVz
dCwgc2VyaWFsIGlvIGZvciBjb21wcmVzcyBmaWxlIHdpbGwgbWFrZSBtdWx0aXRocmVhZCBzbWFs
bA0KPiA+PiB3cml0ZSBwZXJmb3JtYW5jZSBkcm9wIGEgbG90Lg0KPiA+Pg0KPiA+PiBJJ20gdHJ5
IHRvIGZpbmd1cmUgb3V0IHdoeSB3ZSBuZWVkIF9fc2hvdWxkX3NlcmlhbGl6ZV9pbywgSU1PLCB3
ZSB1c2UNCj4gPj4gX19zaG91bGRfc2VyaWFsaXplX2lvIHRvIGF2b2lkIGRlYWRsb2NrIG9yIHRy
eSB0byBpbXByb3ZlIHNlcXVlbnRpYWwNCj4gPj4gcGVyZm9ybWFuY2UsIGJ1dCBJIGRvbid0IHVu
ZGVyc3RhbmQgd2h5IHdlIHNob3VsZCBkbyB0aGlzIGZvcg0KPiA+PiBjb21wcmVzc2VkIGZpbGUu
IEluIG15IHRlc3QsIGlmIHdlIGp1c3QgcmVtb3ZlIHRoaXMsIHdyaXRlIHNhbWUgZmlsZQ0KPiA+
PiBpbiBtdWx0aXRocmVhZCB3aWxsIGhhdmUgcHJvYmxlbSwgYnV0IHBhcmFsbGVsIHdyaXRlIGRp
ZmZlcmVudCBmaWxlcw0KPiA+PiBpbiBtdWx0aXRocmVhZCBpcyBvay4gU28gSSB0aGluayBtYXli
ZSB3ZSBzaG91bGQgdXNlIGFub3RoZXIgbG9jayB0bw0KPiA+PiBhbGxvdyB3cml0ZSBkaWZmZXJl
bnQgZmlsZXMgaW4gbXVsdGl0aHJlYWQuDQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
