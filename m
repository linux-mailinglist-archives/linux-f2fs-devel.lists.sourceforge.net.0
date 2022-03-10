Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3C64D41FD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Mar 2022 08:44:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nSDTE-0000ON-4v; Thu, 10 Mar 2022 07:44:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1nSDT9-0000OB-Mu
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 07:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FqKSK52K/Ms4DM5U6WYRNHa+VP/ZFBYHExs68F/sfKk=; b=jQ2hhEgTlXodW1XsBVRLmHuNl6
 Y8o2SgSNWe91IqYzCF2KtwZG6a8Xi+B5NoJ93C8pl91n05HtAOvtV7+Y7GdAD6TUXwypsezgxpOvD
 3+3CilDVn34nd6+mJg3PIABqwviAY9vxMU1Q4eAWk99YbJYEywghRkngrauWMr/jv7jQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FqKSK52K/Ms4DM5U6WYRNHa+VP/ZFBYHExs68F/sfKk=; b=e9rvt52qBXcnhdtuQKnbmLcNsE
 mFhl2fVWEZ4ta/iyLcSSVo2Cx0cOORg3konTy/FdwnB6Xwkftn1PLVSE39CM4So2LjO/oKleSqfCd
 MVH0YPvYSLJ3cy0rcQPRfbUIluvIWcT1ocQ/RqUSW5cP79V3E8+iDLADeoazTRf34C0s=;
Received: from mail-psaapc01on2097.outbound.protection.outlook.com
 ([40.107.255.97] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nSDT2-00Ae3Z-UN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 07:44:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMbr2xVFnElsBTgHq9EigSI6M/hZz1kJqigJh4f+1y4LJNHI8VzNGI46tucAyJCHzb1dIXWfpgEAAi6KXWYQisjTJQJQ/aUhr9xq1BKo0GlP/cLFkitukAjr1T8p1hsMxFfL1Lx9xbRcKKnqXIhnDb3824lefm7rYmORRK5a6cy0EKG527y9SngDDjLQvEMrgp8fsepgVy31MbwkANbyGtwsU5EcuDfQdlgF5i3uiXvuU9t5YNX99eVI56UwhDDXALJCk6wfVCLWeP79+poEQauNivdl6v9T8kZ77m9JP1Nf2wPtz22HXexTqr27OlZqcSFb4YUBk2FfOTw0sShB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqKSK52K/Ms4DM5U6WYRNHa+VP/ZFBYHExs68F/sfKk=;
 b=ACAvMM4+6mM6I38jqik7AdlsI066cdLcK3eTToAtwBACKbTIjmtzXYE06AaMjcSvOR1R2AWhKMXI4fqwMANofgEB97adbwy/yKw4ZuGgzh0CenrEYGbYaoe8nx+jbsYXkjUlCJo8pVYMzBardDqFauVNZhuklcp//cel25IAggiU+TWzWMyxIXgo57nazLtp0GE/n1hGk2nVPGKmUoWRUhxAsl/G6psvr71Y2tLQ0Oxx3niSIGKZim52/ufQT5DJvlM2PLNMRPfx+odRmfCyjgrDtq41GM8/wTE8bHjdPQgn3WoC1ROR3/WVUAVmDOGXSFs8DDzs9Qxs1sEiAveeXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqKSK52K/Ms4DM5U6WYRNHa+VP/ZFBYHExs68F/sfKk=;
 b=YmjgHet06TiD6ZZYDoYQY/cv0V8ZdbulCGjKpPxjTua0TXMCCqVmnxZqY+JEtddI/qrmR7FKP46+leYGPOUI6VwHO0g3+5PTxYjfoT1UwyOH7tyFoHNTyoaReQLXD5jMfD4Ftz8rV/70hM4Uyz8Q+7/n7gkKHYOe+RUjvan1pq8=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by TYZPR06MB4143.apcprd06.prod.outlook.com (2603:1096:400:28::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 07:29:35 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::1168:21dd:36ff:be89]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::1168:21dd:36ff:be89%7]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 07:29:35 +0000
To: Chao Yu <chao@kernel.org>, Fengnan Chang <fengnanchang@gmail.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [RFC PATCH] f2fs: fix compress file start atomic write may cause
 data corruption
Thread-Index: AQHYMEWV1GPMOM+dJ0u8RV72JQzQt6yzKM6AgABlLGCAAC30AIAACWJggAKm2QCAAdP/AA==
Date: Thu, 10 Mar 2022 07:29:35 +0000
Message-ID: <KL1PR0601MB4003E4712E1FA6C4AB2BBB1ABB0B9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20220305040019.225150-1-fengnanchang@gmail.com>
 <bc67518a-37c9-724d-9a27-d8e9354c5404@kernel.org>
 <KL1PR0601MB40038428764F5731EEEF7AABBB089@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <a9cbd24b-9da8-9f92-dd20-39f3a4fa5732@kernel.org>
 <KL1PR0601MB4003900FB74F94306BA32EA6BB089@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <16f9b36b-5dda-0540-1f7f-2fa0b5081a21@kernel.org>
In-Reply-To: <16f9b36b-5dda-0540-1f7f-2fa0b5081a21@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20a5bf27-c718-49fd-9f05-08da0267ba5f
x-ms-traffictypediagnostic: TYZPR06MB4143:EE_
x-microsoft-antispam-prvs: <TYZPR06MB41439731CC032209DF3E8127BB0B9@TYZPR06MB4143.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h1Q01LtquVsFFQZRArbvvo5cHKcxW770jZ3XfclfYPWqQr+YAgnDU7ApwV2lrg9YbjEVfMnsT4JTz2JEqr+g7DUgiiH1oDfLwMMMTHslhmSpgGcuQkf2WY7KGeDq8i3cKXopUMLgnyNgNvTaTvfxElgxhUZoP9PPY1707aSpmQjGSaatmjWgJ/x1xifvFBhfEq59fioChZ6C11GkJg6md6cP7pTiXTAPQbhwfUkXuOHymQ66SUQez32/hyT16ARmJedE0lRXmTGsVUHrZeZNL4hgjEee6N01rK19PmwzUbMpocCKhSUTOuSapMOzVReIStZAevMdgUo0Jsm4gwxftzySmaka0M04vTLekdBhWuaoSBc/qkqLaXIaP0yW8m+EAG8WIEehWUKKBGHTjyzvjvI2N5ePAUGqs2hKZo09NrB3c8wPkfgiJ7kh47fT0c76hko3kVoMvhUuVOlCu150usbnfowKVmkwWvMf7fdcP052Q0qTlxVZlDvlake6BMG+KGwKdC+3ws39FPP9nZJXSNWpPCnpDeDTR3ej+E3ljxAcXlrd3ywi4ZPL3KIY9g887/+LjP1eq3cDEK/Oa4gPVs5i1b5Gyni7eycaaFBq1LX0E4ttxNyijkRfWtA093wZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(33656002)(316002)(66946007)(2906002)(76116006)(71200400001)(64756008)(66446008)(66556008)(508600001)(66476007)(8676002)(7696005)(9686003)(4326008)(6506007)(53546011)(5660300002)(55016003)(86362001)(52536014)(8936002)(26005)(38100700002)(38070700005)(122000001)(83380400001)(186003)(85182001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: T6Nk2/QKIoEL5a1AfycZqOA0UgWJc5CryHeQq6b5T/ye45elmR+1GdqyD8kQLM1qT5Cer4rtNg1X6nnycrToovBWDLaKOSv3qtDMQ00VXLIAyLLRE37XKW20kG048pcCReVEc+7BRQOqFcnpJlDZtA==
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a5bf27-c718-49fd-9f05-08da0267ba5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 07:29:35.6331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wFcmiTkwPBzbWL5Ot4P2Jz6Dqt4syIQ/1qRyNQYIi3kj1+1FpwVPXBgFIvWDW76Rx2OXZfKy9gFusI7ZZD3drA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4143
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
 [40.107.255.97 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.97 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nSDT2-00Ae3Z-UN
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hhbyBZdSA8Y2hhb0Br
ZXJuZWwub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDksIDIwMjIgMTE6MzMgQU0NCj4g
VG86IOW4uOWHpOaloCA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPjsgRmVuZ25hbiBDaGFuZw0KPiA8
ZmVuZ25hbmNoYW5nQGdtYWlsLmNvbT47IGphZWdldWtAa2VybmVsLm9yZw0KPiBDYzogbGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQNCj4gU3ViamVjdDogUmU6IFtSRkMgUEFU
Q0hdIGYyZnM6IGZpeCBjb21wcmVzcyBmaWxlIHN0YXJ0IGF0b21pYyB3cml0ZSBtYXkgY2F1c2UN
Cj4gZGF0YSBjb3JydXB0aW9uDQo+IA0KPiBPbiAyMDIyLzMvNyAxOTowNywg5bi45Yek5qWgIHdy
b3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBDaGFvIFl1
IDxjaGFvQGtlcm5lbC5vcmc+DQo+ID4+IFNlbnQ6IE1vbmRheSwgTWFyY2ggNywgMjAyMiA2OjMw
IFBNDQo+ID4+IFRvOiDluLjlh6TmpaAgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT47IEZlbmduYW4g
Q2hhbmcNCj4gPj4gPGZlbmduYW5jaGFuZ0BnbWFpbC5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmcN
Cj4gPj4gQ2M6IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0DQo+ID4+IFN1
YmplY3Q6IFJlOiBbUkZDIFBBVENIXSBmMmZzOiBmaXggY29tcHJlc3MgZmlsZSBzdGFydCBhdG9t
aWMgd3JpdGUNCj4gPj4gbWF5IGNhdXNlIGRhdGEgY29ycnVwdGlvbg0KPiA+Pg0KPiA+PiBPbiAy
MDIyLzMvNyAxNTo1NCwg5bi45Yek5qWgIHdyb3RlOg0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4N
Cj4gPj4+PiBTZW50OiBNb25kYXksIE1hcmNoIDcsIDIwMjIgOTo0MyBBTQ0KPiA+Pj4+IFRvOiBG
ZW5nbmFuIENoYW5nIDxmZW5nbmFuY2hhbmdAZ21haWwuY29tPjsgamFlZ2V1a0BrZXJuZWwub3Jn
DQo+ID4+Pj4gQ2M6IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0OyDluLjl
h6TmpaANCj4gPj4+PiA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPg0KPiA+Pj4+IFN1YmplY3Q6IFJl
OiBbUkZDIFBBVENIXSBmMmZzOiBmaXggY29tcHJlc3MgZmlsZSBzdGFydCBhdG9taWMgd3JpdGUN
Cj4gPj4+PiBtYXkgY2F1c2UgZGF0YSBjb3JydXB0aW9uDQo+ID4+Pj4NCj4gPj4+PiBPbiAyMDIy
LzMvNSAxMjowMCwgRmVuZ25hbiBDaGFuZyB3cm90ZToNCj4gPj4+Pj4gV2hlbiBjb21wcmVzc2Vk
IGZpbGUgaGFzIGJsb2Nrcywgc3RhcnQgYXRvbWljIHdyaXRlIHdpbGwgYmUNCj4gPj4+Pj4gZmFp
bGVkLCBidXQNCj4gPj4+Pg0KPiA+Pj4+IFlvdSBtZWFuIGYyZnNfaW9jX3N0YXJ0X2F0b21pY193
cml0ZSB3aWxsIHN1Y2NlZWQsIGJ1dCBjb21wcmVzc2VkDQo+ID4+Pj4gZmxhZyB3aWxsIGJlIHJl
bWFpbmVkIGluIGlub2RlPw0KPiA+Pj4NCj4gPj4+IFllcy4NCj4gPj4+DQo+ID4+Pj4NCj4gPj4+
Pj4gc3RpbGwgc2V0IEZJX0FUT01JQ19GSUxFIGZsYWcsIGlmIHdyaXRlIHBhcnRpYWwgY2x1c3Rl
ciBhbmQgY29tbWl0DQo+ID4+Pj4+IGF0b21pYyB3cml0ZSB3aWxsIGNhdXNlIGRhdGEgY29ycnVw
dGlvbi4NCj4gPj4+Pg0KPiA+Pj4+IENvdWxkIHlvdSBwbGVhc2UgZXhwbGFpbiBtb3JlIGFib3V0
IHdoeSBkYXRhIHdpbGwgYmUgY29ycnVwdGVkPw0KPiA+Pj4NCj4gPj4+IFN0ZXAgMToNCj4gPj4+
IENyZWF0ZSBhIGNvbXByZXNzZWQgZmlsZSAsd3JpdGUgNjRLIGRhdGEgLCBjYWxsIGZzeW5jKCks
IHRoZW4gdGhlDQo+ID4+PiBibG9ja3MgYXJlDQo+ID4+IHdyaXRlIGFzIGNvbXByZXNzZWQgY2x1
c3Rlci4NCj4gPj4+IFN0ZXAyOg0KPiA+Pj4gaW90Y2woRjJGU19JT0NfU1RBUlRfQVRPTUlDX1dS
SVRFKSAgLS0tIHRoaXMgc2hvdWxkIGJlIGZhaWwsIGJ1dCBub3QuDQo+ID4+PiB3cml0ZSBwYWdl
IDAgYW5kIHBhZ2UgMy4NCj4gPj4+IGlvdGNsKEYyRlNfSU9DX0NPTU1JVF9BVE9NSUNfV1JJVEUp
ICAtLSBwYWdlIDAgYW5kIDMgd3JpdGUgYXMNCj4gbm9ybWFsDQo+ID4+PiBmaWxlLA0KPiA+Pj4g
U3RlcDM6DQo+ID4+PiBkcm9wIGNhY2hlLg0KPiA+Pj4gUmVhZCBwYWdlIDAtNCAgIC0tIFNpbmNl
IHBhZ2UgMCBoYXMgYSB2YWxpZCBibG9jayBhZGRyZXNzLCByZWFkIGFzDQo+ID4+IG5vLWNvbXBy
ZXNzZWQsIHBhZ2UgMSBhbmQgMiB3aWxsIGJlIGNvbXByZXNzZWQgZGF0YSBvciB6ZXJvLg0KPiA+
Pj4NCj4gPj4+IEFuZCBiZWZvcmUgZjJmczogY29tcHJlc3M6IHJlbW92ZSB1bm5lZWRlZCByZWFk
IHdoZW4gcmV3cml0ZSB3aG9sZQ0KPiA+Pj4gY2x1c3RlciksIGV2ZW4gU3RlcCAyIGlzIG5vdCBy
aWdodCwgYnV0IHdob2xlIGNsdXN0ZXIgd2lsbCBtYXJrDQo+ID4+PiBkaXJ0eSBpbg0KPiA+PiB3
cml0ZV9iZWdpbiwgYW5kIHdob2xlIGNsdXN0ZXIgd2lsbCBiZSByZS13cml0ZSBhcyBuby1jb21w
cmVzc2VkDQo+ID4+IGNsdXN0ZXIsIHNvIGl0J3Mgb2suDQo+ID4+DQo+ID4+IEFoLCBhZnRlciA3
ZWFiN2E2OTY4MjcgKGYyZnM6IGNvbXByZXNzOiByZW1vdmUgdW5uZWVkZWQgcmVhZCB3aGVuDQo+
ID4+IHJld3JpdGUgd2hvbGUgY2x1c3RlciksIHdlIGV4cGVjdCB0aGF0IGYyZnNfd3JpdGVfY2Fj
aGVfcGFnZXMoKSB3aWxsDQo+ID4+IGJlIGNhbGxlZCwgYW5kDQo+ID4+IGYyZnNfcHJlcGFyZV9j
b21wcmVzc19vdmVyd3JpdGUoKSBjYW4gcmVhZCBhbmQgc2V0IGRpcnR5IGxlZnQgcGFnZXMNCj4g
Pj4gb2YgY29tcHJlc3NlZCBjbHVzdGVyLg0KPiA+Pg0KPiA+PiBIb3dldmVyIGF0b21pYyBjb21t
aXQgZmxvdyB3b24ndCBjYWxsIGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMoKS4uLg0KPiA+Pg0KPiA+
PiBBbnl3YXksIHRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLCBhbmQsIGNvdWxkIHlvdSBwbGVh
c2UgYWRkIGFib3ZlDQo+ID4+IGNvbW1lbnRzIGludG8gY29tbWl0IGRlc2NyaXB0aW9uIG9mIHRo
aXMgcGF0Y2g/DQo+ID4NCj4gPiBZZXMsIEknbGwgYWRkIG1vcmUgY29tbWVudHMgaW4gbmV4dCB2
ZXJzaW9uLg0KPiA+IEFuZCBJIHdhbnQgdG8ga25vdyB3aHkgYXRvbWljIHdyaXRlIG5lZWQgZGlz
YWJsZSBjb21wcmVzc2VkIGZpbGUsIEkgZGlkbid0DQo+IHNlZSBhbnkgc3BlY2lhbCBpcyBpbmNv
bXBhdGlibGUgd2l0aCBjb21wcmVzc2lvbi4NCj4gDQo+IEkgZ3Vlc3MgdGhlcmUgaXMgbm8gaW5j
b21wYXRpYmlsaXR5IGlzc3VlLCBob3dldmVyLCBhcyBtb3N0IGRhdGFiYXNlIGZpbGUgd2lsbCBi
ZQ0KPiB1cGRhdGVkIGZyZXF1ZW50bHksIHdyaXRlIGFtcGxpZmljYXRpb24gZHVlIHRvIGNvbXBy
ZXNzaW9uIGNsdXN0ZXIgZGVzaWduDQo+IG1heSBodXJ0IGRhdGFiYXNlIHVwZGF0ZSBwZXJmb3Jt
YW5jZSwgYW55IHBhcnRpY3VsYXIgc2NlbmFyaW8gb2YgdXNpbmcNCj4gY29tcHJlc3NlZCBkYiBm
aWxlPw0KVGhlcmUgaXMgcGFydGljdWxhciBzY2VuYXJpbyBvZiB1c2luZyBjb21wcmVzc2VkIGRi
IGZpbGUsIGp1c3Qgb3V0IG9mIGN1cmlvc2l0eS4NCj4gDQo+IFRoYW5rcywNCj4gDQo+ID4NCj4g
PiBUaGFua3MuDQo+ID4+DQo+ID4+IFRoYW5rcywNCj4gPj4NCj4gPj4+DQo+ID4+Pj4NCj4gPj4+
PiBUaGFua3MsDQo+ID4+Pj4NCj4gPj4+Pj4gRml4ZXM6IDRjOGZmNzA5NWJlZiAoZjJmczogc3Vw
cG9ydCBkYXRhIGNvbXByZXNzaW9uKQ0KPiA+Pj4+PiBGaXhlczogN2VhYjdhNjk2ODI3IChmMmZz
OiBjb21wcmVzczogcmVtb3ZlIHVubmVlZGVkIHJlYWQgd2hlbg0KPiA+Pj4+PiByZXdyaXRlIHdo
b2xlIGNsdXN0ZXIpDQo+ID4+Pj4+DQo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IEZlbmduYW4gQ2hh
bmcgPGZlbmduYW5jaGFuZ0BnbWFpbC5jb20+DQo+ID4+Pj4+IC0tLQ0KPiA+Pj4+PiAgICAgZnMv
ZjJmcy9kYXRhLmMgfCA0ICstLS0NCj4gPj4+Pj4gICAgIGZzL2YyZnMvZmlsZS5jIHwgMyArKy0N
Cj4gPj4+Pj4gICAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQ0KPiA+Pj4+Pg0KPiA+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9m
MmZzL2RhdGEuYyBpbmRleA0KPiA+Pj4+PiA2YjVmMzg5YmE5OTguLjVjYmVlNGVkMDk4MiAxMDA2
NDQNCj4gPj4+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMNCj4gPj4+Pj4gKysrIGIvZnMvZjJmcy9k
YXRhLmMNCj4gPj4+Pj4gQEAgLTMzNTgsOCArMzM1OCw3IEBAIHN0YXRpYyBpbnQgZjJmc193cml0
ZV9iZWdpbihzdHJ1Y3QgZmlsZQ0KPiA+Pj4+PiAqZmlsZSwgc3RydWN0DQo+ID4+Pj4gYWRkcmVz
c19zcGFjZSAqbWFwcGluZywNCj4gPj4+Pj4gICAgIAkJaW50IHJldDsNCj4gPj4+Pj4NCj4gPj4+
Pj4gICAgIAkJKmZzZGF0YSA9IE5VTEw7DQo+ID4+Pj4+IC0NCj4gPj4+Pj4gLQkJaWYgKGxlbiA9
PSBQQUdFX1NJWkUpDQo+ID4+Pj4+ICsJCWlmIChsZW4gPT0gUEFHRV9TSVpFICYmICEoZjJmc19p
c19hdG9taWNfZmlsZShpbm9kZSkpKQ0KPiA+Pj4+PiAgICAgCQkJZ290byByZXBlYXQ7DQo+ID4+
Pj4+DQo+ID4+Pj4+ICAgICAJCXJldCA9IGYyZnNfcHJlcGFyZV9jb21wcmVzc19vdmVyd3JpdGUo
aW5vZGUsIHBhZ2VwLCBkaWZmDQo+ID4+Pj4+IC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9m
MmZzL2ZpbGUuYyBpbmRleA0KPiA+Pj4+PiBjZmRjNDFmODdmNWQuLjI2YTY0OGVmOWUxZg0KPiA+
Pj4+PiAxMDA2NDQNCj4gPj4+Pj4gLS0tIGEvZnMvZjJmcy9maWxlLmMNCj4gPj4+Pj4gKysrIGIv
ZnMvZjJmcy9maWxlLmMNCj4gPj4+Pj4gQEAgLTIwMDksNyArMjAwOSw4IEBAIHN0YXRpYyBpbnQN
Cj4gPj4+Pj4gZjJmc19pb2Nfc3RhcnRfYXRvbWljX3dyaXRlKHN0cnVjdA0KPiA+Pj4+PiBmaWxl
ICpmaWxwKQ0KPiA+Pj4+Pg0KPiA+Pj4+PiAgICAgCWlub2RlX2xvY2soaW5vZGUpOw0KPiA+Pj4+
Pg0KPiA+Pj4+PiAtCWYyZnNfZGlzYWJsZV9jb21wcmVzc2VkX2ZpbGUoaW5vZGUpOw0KPiA+Pj4+
PiArCWlmICghZjJmc19kaXNhYmxlX2NvbXByZXNzZWRfZmlsZShpbm9kZSkpDQo+ID4+Pj4+ICsJ
CXJldHVybiAtRUlOVkFMOw0KPiA+Pj4+Pg0KPiA+Pj4+PiAgICAgCWlmIChmMmZzX2lzX2F0b21p
Y19maWxlKGlub2RlKSkgew0KPiA+Pj4+PiAgICAgCQlpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5v
ZGUsDQo+IEZJX0FUT01JQ19SRVZPS0VfUkVRVUVTVCkpDQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
