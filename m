Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA7843C66F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Oct 2021 11:30:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mffGF-0003WH-Jf; Wed, 27 Oct 2021 09:30:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1mffGD-0003Vh-Uo
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Oct 2021 09:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rj1arTzCnMzIFfOzeDyZt4Kxr1I0oOcbhX1gZC4qTX0=; b=dAZMhugyCCK68EiOP6gRRqjqG9
 gJgP6C/uqmtqW/PX1vvMwFTjWa47DXpmjpjqKKUlaXNGeG6Rwd0UH/vLrSqVxpUeaL1JNsNyBSpPZ
 ykUpjrmVTeftHbw5wqVZhQyh6GjycIRtJ4RYn0ctAWrlOpBQkzLnCThel2QplOM6In14=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rj1arTzCnMzIFfOzeDyZt4Kxr1I0oOcbhX1gZC4qTX0=; b=X8Eom8dt7xO5YWRdFmclKGEVPt
 HPisGJNl92tObjEJTt72dU/Y2lFV68wubz4V85/jDCTB4bkLNTlFAr0tmUnCReBBwcpGVF7KYl76o
 Tymoq7FNcZSLHGS59CHibuor29hDDUlJ4xXLH6K/VQG90cwZlMwdmyIi5FokmFuBxpJs=;
Received: from mail-eopbgr1300137.outbound.protection.outlook.com
 ([40.107.130.137] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mffG7-000335-0T
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Oct 2021 09:30:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+fDPNThC1UcJw60RznQKLPQ37P14vnJY5dnhabdkI/Oca4WQcKQncvr5B1Rf1b9NXYa939yUyV+JrWlW1YZy7xYWxJmJvxMKK8ux3ZNf2yNrdmK7httZV5XK/ihPjBGN874AgNh7ITXYCklZmC1XLjuskV8ov0IFaaFaKiocyOYtTivB07DcY1+eO4GP2xU3WifpZy4K7fbdC8AP/qFRrFEjqcz7fTwxh1JxlBv8J3OfXYra+cLHFLCKj3pX4CTlAloHsnuL6R3lDWTTVuwNAQ+QaRbjM7URsh7EqJle1PoMb3tF4RptxG+Pwla5rr/JxYkP2m8qzNBwO3wSJV80w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rj1arTzCnMzIFfOzeDyZt4Kxr1I0oOcbhX1gZC4qTX0=;
 b=NDSi3u42Urm48vAhaehktX3VzrXsCwsSZb/z+zMe49IYDrM1DjC+6Fnq0bCOCQqfVpjGETsfDcD4TpOj4UaB9S/z4hIZJTurmCMwyvslyDrCGpU9XQdZocWRMjZy8nA7m/RerfqW0dASGv8ZTTvNtE5tcjJfv7mC1EzGjB2IAGNWOjvJs34WLOUplMk2C/+fExEJVJZ4AymPTzpw+yrgOmFkLz2tx9WeMK+WV/vu3/yJ0cavnY0yxvTJFO6XLb11lo7exnF7NzRt0IMas8O4acMeNfzOE1NfUgai1xVUkzEuLOhh9wZNWqotW8wKMiD71oSjDXdCSPRnP3Pj/AtFkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rj1arTzCnMzIFfOzeDyZt4Kxr1I0oOcbhX1gZC4qTX0=;
 b=gh86PMRItOVhH8ndGJS6Sw0pLE3uJP5/qbJ+jFGxlTunSpOPnsAdkDzsrEPEAWnZmKlaEJ80lB87ifuxGZMjX6AIwvd5iytP2xq2WqfHWvFOwYYLeTR6xAu+IN8/XQ1t/9Cjz8k9BkY+g4XpZ7g8dyE7NhPzv8++0jfOUBrzKcA=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3969.apcprd06.prod.outlook.com (2603:1096:820:27::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 09:24:09 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%7]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 09:24:09 +0000
From: =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>
To: Chao Yu <chao@kernel.org>, fengnan chang <fengnanchang@gmail.com>
Thread-Topic: [f2fs-dev] [PATCH v5 2/2] f2fs: fix missing inplace count in
 overwrite with direct io
Thread-Index: AQHXvQC4gnP6XTDXzEeiDKKjjzQSgqvmTBCDgABiPsA=
Date: Wed, 27 Oct 2021 09:24:08 +0000
Message-ID: <KL1PR0601MB4003BB38785B2BFC3EE76F6BBB859@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20211009112744.33698-1-changfengnan@vivo.com>
 <20211009112744.33698-2-changfengnan@vivo.com>
 <66a243ca-53ed-cb8b-064b-5f0d3c954579@kernel.org>
 <CALWNXx-cHN3TduduXP2cNmVPR0V5J0Ea8RQ5fcw91Q3pmFvUxg@mail.gmail.com>
 <AOYAygA-EjrsqgsUALfVQapx.9.1635305442578.Hmail.changfengnan@vivo.com>
In-Reply-To: <AOYAygA-EjrsqgsUALfVQapx.9.1635305442578.Hmail.changfengnan@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d14fa87-7794-4fbb-f8a6-08d9992b87e8
x-ms-traffictypediagnostic: KL1PR0601MB3969:
x-microsoft-antispam-prvs: <KL1PR0601MB396960620F5E7716500A0851BB859@KL1PR0601MB3969.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: togozhNwW7IVElnos2BXyIB4pit6qeHjSKUAAYxRCLxuJkNZq8YWA/JRaCT8EXg207yWtvzQA/1spcVNmpflrdWIONfkGLZ604GfThO9oKfQcxw8GN4iS7H1rS/pSH/Z+gedR9s+O9rpjA/GrzcG8EHu/Av5whYAJ9Wl19HToV6e8Bnq1U0QymMZ5R72YjUybNSf70MNZnFQosDK5EgcIq6Lra9Z1qlWu/7I35Co4ngcaz+/4aH24yVdREifY3NmI6h99kBmXl/tPFzX9TqhzqKEmbet4+Xu2IO9pqYowX725Rt2AdtNL105in1SoeWS8NiF85OEB4TxlrFY7DVtyqrQa8xEkvQo5bbXFa5DC2ciWEKCi/rK/xmPZ1b0B2Ked+9Q9U5WYH4TH1tLAg76H05n+efuLWJxuwiDeWmotrc26kJLhaXPi6nvScSiDusLHda9Y1XEsQWgbth7knCd1PETbLkw6dGhD8MDCfQp0r77eMxwN5Nq7yig/7tQRM6A54RM6vpke5rc51KxX73pfpeDBtGa2wiA6ckP6fQrDDO1Yh9mLw1hCCwvrD/gr1JNHi2GitRnTXTEmD9AT1WQnJmHt053ug0JP/MXgcWXeNQ0bocf8u50Bj1y8AgAPthQHCH4qb9KMoudqejaTfpfrGd4HGSg4Ck5ZMeQj5/EqWk1S2mU6hEU8KcWoWwSV8bCKBzcYzoXxz/yD29fkJfK78QS6JNWz90Q/Q1QOluxotKlwtr4qjSITy9itLviajS0fdhDfjZHmRapOJkl0X4Ehw5WxO8keAb8e9iNWfrrzWE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(66446008)(110136005)(71200400001)(76116006)(966005)(64756008)(66476007)(316002)(8936002)(52536014)(66946007)(8676002)(66556008)(83380400001)(86362001)(508600001)(33656002)(54906003)(6506007)(53546011)(38100700002)(186003)(85182001)(26005)(9686003)(4326008)(122000001)(2906002)(55016002)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHllR1VKMmR4VWdNVXlSKzJydHVtdmJaOUdvWDdxclk1ME40R2N1S1JhN2xH?=
 =?utf-8?B?ZC9DYzNZWTFVVTYvbXJHZXZ4QTZwSUg5dmhyNzFiZFJ4bTJSZ2IrbTA4UTVq?=
 =?utf-8?B?SFY3bG03bFNvVEVhMGQvMXZ5KzZsaThCZjEzdTNIdzdiVFV0RGl3Zml2a3o5?=
 =?utf-8?B?NGtwNksvZDNoRnRlUzdlRHN6NUdhZGZ4emFGU1V6cDVzekxPaldNTlUzVlZF?=
 =?utf-8?B?c0psQ0FEeDFiRDhyODRUVkRId25RbnJJV05vQURBaThyckhNUVlmWnBoMDh5?=
 =?utf-8?B?cTJWenNkNTVsc3lRZm5JVTVnOFlkZVRaYmMyb1NFWnFzMTV6ci9LbDljaDBh?=
 =?utf-8?B?TFlsVlIvSk1tc0xCT1oyN29McmkyR1lDMlZpZzFKUURCc3gwcXJQRHVLNytE?=
 =?utf-8?B?ODhxYWF0U3hSSTRNdmJUNlhaNEk3TEE5VjBhRlVkMWNrN1ZlSkFIQUI4OWV1?=
 =?utf-8?B?RnAzd1BjQ29tNXRqTmx3R0h3elJ3ZDY3WFZBSFI1QTV3OCt0bDBmTEF2ZmFl?=
 =?utf-8?B?V1RnUUIwZkNkUVBEY0ljOWQvaWg3WWs2M1dFRmNsMjZPbUpoVDRkeFEvRU0y?=
 =?utf-8?B?eEh6OU5IZ0F6RmttN3ErTlVWRGNNQlMxUnIrbFFydFI0d0hNM29aQzh3eFpi?=
 =?utf-8?B?SGRtKzNCSWgzdzZDbmg5cUlNS3BPT2pNODFXQlVzQmp5em5sV0lKNnR2ck5D?=
 =?utf-8?B?MmZWaXJEQmxXcEt6TTAxT1lmc0w4cTFtQVQ4OW1kT1k0ZERlenN0WFJ2N21S?=
 =?utf-8?B?RFFvdWRpQWdDVlFSMFZ4N2xzaTN1aVhuZHdUNm04Mktzc0Q1Q2tTWGc3bndz?=
 =?utf-8?B?cUN0L2FuaEE3b2NlRDUxL1NDTmhrUFA2aDQ2YnlaWUJCR3JIdTVOYTU0cmhB?=
 =?utf-8?B?eHNuZzFWdHlRM0M0enZsbWZ3bE9QTk00TExUT1FKT1lsY1lnbWJtbTJWQSt5?=
 =?utf-8?B?SUU5MXprWEN0QTcvSjRPNFc5eEFXaVNORXRIZ3ozd0NqUDI1MnhrYzhmNXBC?=
 =?utf-8?B?ZE9aaUlkcmwxYUNaRVpPTkY0WTJWYXkrUmVtWitUUVJFdllBaXNVTDBMZnZr?=
 =?utf-8?B?OHhPMDhUVDZSc2w4TjZUSVB0eVpuOGZLNFZFcDh0dG9hdXlBYmx2UHRERGlq?=
 =?utf-8?B?TUZ6MTkrcGJRT3pqYmFLZDVmc28xMUZ5UU13b2s1UTdaQ3FQYys1cndSUksv?=
 =?utf-8?B?UWhmcHlMKzJhMXY1RnVzL3FsR0F2dzJXOVJrbEhYcEw1bWZNMnBRMkc3K1Rx?=
 =?utf-8?B?Ujh4Wk4zLzN2TExGRjJFZ1BMMFBlVC82cEowZ3BPc1Nzb1Vnc0x4dmJ2L0xZ?=
 =?utf-8?Q?c8ykiz+entZTjbznCoKpUVbJWRMryfnAg7?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d14fa87-7794-4fbb-f8a6-08d9992b87e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 09:24:08.9703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NecMrmctN00EBAor7286jywQnX3Kx/dDJL2YWtfWJdNCtZ/L1Vzawb3DHCOolo9vfLu2xIiMzneWc3F+TAHNxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3969
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.130.137 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.137 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mffG7-000335-0T
Subject: Re: [f2fs-dev] [PATCH v5 2/2] f2fs: fix missing inplace count in
 overwrite with direct io
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogY2hhbmdmZW5nbmFuQHZp
dm8uY29tIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+IE9uIEJlaGFsZiBPZg0KPiBDaGFvIFl1DQo+
IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyNywgMjAyMSAxMTozMSBBTQ0KPiBUbzogZmVuZ25h
biBjaGFuZyA8ZmVuZ25hbmNoYW5nQGdtYWlsLmNvbT4NCj4gQ2M6IOW4uOWHpOaloCA8Y2hhbmdm
ZW5nbmFuQHZpdm8uY29tPjsgSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz47DQo+IGxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0DQo+IFN1YmplY3Q6IFJlOiBbZjJm
cy1kZXZdIFtQQVRDSCB2NSAyLzJdIGYyZnM6IGZpeCBtaXNzaW5nIGlucGxhY2UgY291bnQgaW4N
Cj4gb3ZlcndyaXRlIHdpdGggZGlyZWN0IGlvDQo+IA0KPiBPbiAyMDIxLzEwLzE2IDE2OjAxLCBm
ZW5nbmFuIGNoYW5nIHdyb3RlOg0KPiA+IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4g5LqOMjAy
MeW5tDEw5pyIMTPml6XlkajkuIkg5LiL5Y2IMTE6MTnlhpnpgZPvvJoNCj4gPj4NCj4gPj4gT24g
MjAyMS8xMC85IDE5OjI3LCBGZW5nbmFuIENoYW5nIHdyb3RlOg0KPiA+Pj4gRm9yIG5vdywgb3Zl
cndyaXRlIGZpbGUgd2l0aCBkaXJlY3QgaW8gdXNlIGlucGxhY2UgcG9saWN5LCBidXQgbm90DQo+
ID4+PiBjb3VudGVkLCBmaXggaXQuIEFuZCB1c2Ugc3RhdF9hZGRfaW5wbGFjZV9ibG9ja3Moc2Jp
LCAxLCApIGluc3RlYWQNCj4gPj4+IG9mIHN0YXRfaW5jX2lucGxhY2VfYmxvY2tzKHNiLCApLg0K
PiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IEZlbmduYW4gQ2hhbmcgPGNoYW5nZmVuZ25hbkB2
aXZvLmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gICAgZnMvZjJmcy9kYXRhLmMgICAgfCA0ICsrKy0N
Cj4gPj4+ICAgIGZzL2YyZnMvZjJmcy5oICAgIHwgOCArKysrLS0tLQ0KPiA+Pj4gICAgZnMvZjJm
cy9zZWdtZW50LmMgfCAyICstDQo+ID4+PiAgICAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9k
YXRhLmMgYi9mcy9mMmZzL2RhdGEuYyBpbmRleA0KPiA+Pj4gYzE0OTBiOWExMzQ1Li43Nzk4Zjcy
MzYzNzYgMTAwNjQ0DQo+ID4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYw0KPiA+Pj4gKysrIGIvZnMv
ZjJmcy9kYXRhLmMNCj4gPj4+IEBAIC0xNTUzLDcgKzE1NTMsOSBAQCBpbnQgZjJmc19tYXBfYmxv
Y2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsDQo+IHN0cnVjdCBmMmZzX21hcF9ibG9ja3MgKm1hcCwN
Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHN5bmNfb3V0Ow0KPiA+
Pj4gICAgICAgICAgICAgICAgICAgICAgICBibGthZGRyID0gZG4uZGF0YV9ibGthZGRyOw0KPiA+
Pj4gICAgICAgICAgICAgICAgICAgICAgICBzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVBQRU5E
X1dSSVRFKTsNCj4gPj4+IC0gICAgICAgICAgICAgfQ0KPiA+Pj4gKyAgICAgICAgICAgICB9IGVs
c2UgaWYgKCFmMmZzX2xmc19tb2RlKHNiaSkgJiYgZmxhZyA9PQ0KPiBGMkZTX0dFVF9CTE9DS19Q
UkVfRElPICYmDQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXAtPm1fbWF5
X2NyZWF0ZSAmJiBjcmVhdGUpDQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgc3RhdF9hZGRf
aW5wbGFjZV9ibG9ja3Moc2JpLCAxLCB0cnVlKTsNCj4gPj4NCj4gPj4gV2hhdCBhYm91dCB0aGlz
IGNhc2U/DQo+ID4+DQo+ID4+IC0gZjJmc19wcmVhbGxvY2F0ZV9ibG9ja3MNCj4gPj4gICAgLSBm
MmZzX21hcF9ibG9ja3MNCj4gPj4gICAgIC0gc3RhdF9hZGRfaW5wbGFjZV9ibG9ja3MNCj4gPj4g
ICAgIG1hcC5tX2xlbiA+IDAgJiYgZXJyID09IC1FTk9TUEMNCj4gPj4gICAgIGVyciA9IDA7DQo+
ID4+IC0gX19nZW5lcmljX2ZpbGVfd3JpdGVfaXRlcg0KPiA+PiAgICAtIGdlbmVyaWNfZmlsZV9k
aXJlY3Rfd3JpdGUNCj4gPj4gICAgIC0gZjJmc19kaXJlY3RfSU8NCj4gPj4gICAgICAtIGdldF9k
YXRhX2Jsb2NrX2Rpb193cml0ZQ0KPiA+PiAgICAgICAtIF9fYWxsb2NhdGVfZGF0YV9ibG9jaw0K
PiA+PiAgICAgICAgLSBzdGF0X2luY19ibG9ja19jb3VudA0KPiA+Pg0KPiA+PiBESU8gYmxvY2tz
IHdpbGwgYmUgYWNjb3VudGVkIGludG8gZGlmZmVyZW50IHR5cGU/IElJVUMuDQo+ID4gWWVzLCBp
dCB3aWxsIGJlIGFjY291bnRlZCBpbnRvIGRpZmZlcmVudCB0eXBlLCAgSVBVIGFuZCBMRlMsIGJ1
dCBpdA0KPiA+IHdpbGwgbm90IGFjY291bnRlZCBpbnRvIGJvdGggaW4gc2FtZSB0aW1lIGZvciBv
bmUgYmxvY2suDQo+IA0KPiBOb3Qgc3VyZSB0aGlzIGlzIHJpZ2h0LCBzaW5jZSBhbGwgd3JpdGVz
IHNob3VsZCBiZSBhY2NvdW50ZWQgaW50byBMRlMuDQoNClNvcnJ5LCBJIGRpZG4ndCBnZXQgeW91
ciBwb2ludCwgd2h5IGFsbCB3cml0ZXMgc2hvdWxkIGJlIGFjY291bnRlZCBpbnRvIExGUyA/IGV2
ZW4gb3ZlcndyaXRlIHdpdGggZGlyZWN0IGlvID8NCg0KPiANCj4gPg0KPiA+IHJvb3RAa3ZtLXhm
c3Rlc3RzOi9tbnQjIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9mMmZzL3N0YXR1cyB8Z3JlcCBTU1Ig
LUMgMg0KPiA+ICAgICAgICAgICAgIGJ1ZmZlciAgICAgZGlyZWN0ICAgc2VnbWVudHMNCj4gPiBJ
UFU6ICAgICAgICAgICAxNiAgICAgICAgIDMyICAgICAgICBOL0ENCj4gPiBTU1I6ICAgICAgICAg
ICAgMCAgICAgICAgICAwICAgICAgICAgIDANCj4gPiBMRlM6ICAgICAgICAgICAzOCAgICAgICAg
IDQ4ICAgICAgICAgIDANCj4gPiByb290QGt2bS14ZnN0ZXN0czovbW50IyBkZCBpZj0vZGV2L3pl
cm8gb2Y9Li8xIGJzPTMySyBjb3VudD0xDQo+ID4gb2ZsYWc9ZGlyZWN0IHJvb3RAa3ZtLXhmc3Rl
c3RzOi9tbnQjIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9mMmZzL3N0YXR1cw0KPiB8Z3JlcCBTU1Ig
LUMgMg0KPiA+ICAgICAgICAgICAgIGJ1ZmZlciAgICAgZGlyZWN0ICAgc2VnbWVudHMNCj4gPiBJ
UFU6ICAgICAgICAgICAxNiAgICAgICAgIDMyICAgICAgICBOL0ENCj4gPiBTU1I6ICAgICAgICAg
ICAgMCAgICAgICAgICAwICAgICAgICAgIDANCj4gPiBMRlM6ICAgICAgICAgICAzOCAgICAgICAg
IDU2ICAgICAgICAgIDANCj4gPg0KPiA+IHJvb3RAa3ZtLXhmc3Rlc3RzOi9tbnQjIGRkIGlmPS9k
ZXYvemVybyBvZj0uLzEgYnM9MzJLIGNvdW50PTENCj4gPiBvZmxhZz1kaXJlY3QgY29udj1ub3Ry
dW5jIHJvb3RAa3ZtLXhmc3Rlc3RzOi9tbnQjIGNhdA0KPiA+IC9zeXMva2VybmVsL2RlYnVnL2Yy
ZnMvc3RhdHVzIHxncmVwIFNTUiAtQyAyDQo+ID4gICAgICAgICAgICAgYnVmZmVyICAgICBkaXJl
Y3QgICBzZWdtZW50cw0KPiA+IElQVTogICAgICAgICAgIDE2ICAgICAgICAgNDAgICAgICAgIE4v
QQ0KPiA+IFNTUjogICAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMA0KPiA+IExGUzog
ICAgICAgICAgIDM4ICAgICAgICAgNTYgICAgICAgICAgMA0KPiA+DQo+ID4gcm9vdEBrdm0teGZz
dGVzdHM6L21udCMgZGQgaWY9L2Rldi96ZXJvIG9mPS4vMSBicz0zMksgY291bnQ9Mg0KPiA+IG9m
bGFnPWRpcmVjdCBjb252PW5vdHJ1bmMgcm9vdEBrdm0teGZzdGVzdHM6L21udCMgY2F0DQo+ID4g
L3N5cy9rZXJuZWwvZGVidWcvZjJmcy9zdGF0dXMgfGdyZXAgU1NSIC1DIDINCj4gPiAgICAgICAg
ICAgICBidWZmZXIgICAgIGRpcmVjdCAgIHNlZ21lbnRzDQo+ID4gSVBVOiAgICAgICAgICAgMTYg
ICAgICAgICA0OCAgICAgICAgTi9BDQo+ID4gU1NSOiAgICAgICAgICAgIDAgICAgICAgICAgMCAg
ICAgICAgICAwDQo+ID4gTEZTOiAgICAgICAgICAgNDEgICAgICAgICA2NCAgICAgICAgICAwDQo+
ID4NCj4gPg0KPiA+Pg0KPiA+Pj4gICAgICAgIH0gZWxzZSB7DQo+ID4+PiAgICAgICAgICAgICAg
ICBpZiAoY3JlYXRlKSB7DQo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgIGlmICh1bmxpa2Vs
eShmMmZzX2NwX2Vycm9yKHNiaSkpKSB7IGRpZmYNCj4gPj4+IC0tZ2l0IGEvZnMvZjJmcy9mMmZz
LmggYi9mcy9mMmZzL2YyZnMuaCBpbmRleA0KPiA+Pj4gYmYyZTczZTQ2MzA0Li5hN2RhODM2Y2E2
NGYgMTAwNjQ0DQo+ID4+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaA0KPiA+Pj4gKysrIGIvZnMvZjJm
cy9mMmZzLmgNCj4gPj4+IEBAIC0zNzg1LDEyICszNzg1LDEyIEBAIHN0YXRpYyBpbmxpbmUgc3Ry
dWN0IGYyZnNfc3RhdF9pbmZvDQo+ICpGMkZTX1NUQVQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
KQ0KPiA+Pj4gICAgICAgICAgICAgICAgZWxzZQ0KPiBcDQo+ID4+Pg0KPiAoKHNiaSktPmJsb2Nr
X2NvdW50WzFdWyhjdXJzZWcpLT5hbGxvY190eXBlXSsrKTsgICAgICAgIFwNCj4gPj4+ICAgICAg
ICB9IHdoaWxlICgwKQ0KPiA+Pj4gLSNkZWZpbmUgc3RhdF9pbmNfaW5wbGFjZV9ibG9ja3Moc2Jp
LCBkaXJlY3RfaW8pDQo+IFwNCj4gPj4+ICsjZGVmaW5lIHN0YXRfYWRkX2lucGxhY2VfYmxvY2tz
KHNiaSwgY291bnQsIGRpcmVjdF9pbykNCj4gXA0KPiA+Pj4gICAgICAgIGRvDQo+IHsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+
ID4+PiAgICAgICAgICAgICAgICBpZiAoZGlyZWN0X2lvKQ0KPiBcDQo+ID4+PiAtICAgICAgICAg
ICAgICAgICAgICAgKGF0b21pY19pbmMoJihzYmkpLT5pbnBsYWNlX2NvdW50WzBdKSk7DQo+IFwN
Cj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAoYXRvbWljX2FkZChjb3VudCwgJihzYmkpLT5p
bnBsYWNlX2NvdW50WzBdKSk7DQo+ID4+PiArIFwNCj4gPj4+ICAgICAgICAgICAgICAgIGVsc2UN
Cj4gXA0KPiA+Pj4gLSAgICAgICAgICAgICAgICAgICAgIChhdG9taWNfaW5jKCYoc2JpKS0+aW5w
bGFjZV9jb3VudFsxXSkpOw0KPiBcDQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgKGF0b21p
Y19hZGQoY291bnQsICYoc2JpKS0+aW5wbGFjZV9jb3VudFsxXSkpOw0KPiA+Pj4gKyBcDQo+ID4+
DQo+ID4+IElmIGNvdW50IGFsd2F5cyBiZSBvbmUsIHdlIGNhbiBqdXN0IGtlZXAgdG8gdXNlIGF0
b21pY19pbmMoKSBoZXJlPw0KPiA+Pg0KPiA+IEkgc3VnZ2VzdCBub3QsIHdlIG1heSB1c2UgdGhp
cyBpbiBsYXRlciBwYXRjaCwgbm90IHJlYWR5IGZvciBub3cuDQo+IA0KPiBJIGRvbid0IHRoaW5r
cyB0aGlzIGlzIHRoZSByaWdodCB3YXksIHdoeSBub3QgaW5jbHVkaW5nIGFib3ZlIGNoYW5nZSBp
biB5b3VyDQo+IGxhdGVyIHBhdGNoPw0KPiANCj4gVGhhbmtzLA0KPiANCj4gPg0KPiA+PiBUaGFu
a3MsDQo+ID4+DQo+ID4+PiAgICAgICAgfSB3aGlsZSAoMCkNCj4gPj4+ICAgICNkZWZpbmUgc3Rh
dF91cGRhdGVfbWF4X2F0b21pY193cml0ZShpbm9kZSkNCj4gXA0KPiA+Pj4gICAgICAgIGRvDQo+
IHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcDQo+ID4+PiBAQCAtMzg3Nyw3ICszODc3LDcgQEAgdm9pZCBmMmZzX3VwZGF0ZV9zaXRf
aW5mbyhzdHJ1Y3QgZjJmc19zYl9pbmZvDQo+ICpzYmkpOw0KPiA+Pj4gICAgI2RlZmluZSBzdGF0
X2luY19tZXRhX2NvdW50KHNiaSwgYmxrYWRkcikgICAgICAgICAgIGRvIHsgfSB3aGlsZSAoMCkN
Cj4gPj4+ICAgICNkZWZpbmUgc3RhdF9pbmNfc2VnX3R5cGUoc2JpLCBjdXJzZWcpICAgICAgICAg
ICAgICAgICAgICAgIGRvIHsgfQ0KPiB3aGlsZSAoMCkNCj4gPj4+ICAgICNkZWZpbmUgc3RhdF9p
bmNfYmxvY2tfY291bnQoc2JpLCBjdXJzZWcsIGRpcmVjdF9pbykgICAgICAgIGRvIHsgfQ0KPiB3
aGlsZSAoMCkNCj4gPj4+IC0jZGVmaW5lIHN0YXRfaW5jX2lucGxhY2VfYmxvY2tzKHNiaSwgZGly
ZWN0X2lvKSAgICAgICAgICAgICAgZG8geyB9IHdoaWxlDQo+ICgwKQ0KPiA+Pj4gKyNkZWZpbmUg
c3RhdF9hZGRfaW5wbGFjZV9ibG9ja3Moc2JpLCBjb3VudCwgZGlyZWN0X2lvKSAgICAgICBkbyB7
IH0NCj4gd2hpbGUgKDApDQo+ID4+PiAgICAjZGVmaW5lIHN0YXRfaW5jX3NlZ19jb3VudChzYmks
IHR5cGUsIGdjX3R5cGUpICAgICAgICAgICAgICBkbyB7IH0NCj4gd2hpbGUgKDApDQo+ID4+PiAg
ICAjZGVmaW5lIHN0YXRfaW5jX3RvdF9ibGtfY291bnQoc2ksIGJsa3MpICAgICAgICAgICAgZG8g
eyB9IHdoaWxlICgwKQ0KPiA+Pj4gICAgI2RlZmluZSBzdGF0X2luY19kYXRhX2Jsa19jb3VudChz
YmksIGJsa3MsIGdjX3R5cGUpIGRvIHsgfSB3aGlsZQ0KPiA+Pj4gKDApIGRpZmYgLS1naXQgYS9m
cy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jIGluZGV4DQo+ID4+PiBkZWQ3NDRl
ODgwZDAuLmM1NDJjNGI2ODdjYSAxMDA2NDQNCj4gPj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5j
DQo+ID4+PiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYw0KPiA+Pj4gQEAgLTM2MTEsNyArMzYxMSw3
IEBAIGludCBmMmZzX2lucGxhY2Vfd3JpdGVfZGF0YShzdHJ1Y3QgZjJmc19pb19pbmZvDQo+ICpm
aW8pDQo+ID4+PiAgICAgICAgICAgICAgICBnb3RvIGRyb3BfYmlvOw0KPiA+Pj4gICAgICAgIH0N
Cj4gPj4+DQo+ID4+PiAtICAgICBzdGF0X2luY19pbnBsYWNlX2Jsb2NrcyhmaW8tPnNiaSwgZmFs
c2UpOw0KPiA+Pj4gKyAgICAgc3RhdF9hZGRfaW5wbGFjZV9ibG9ja3Moc2JpLCAxLCBmYWxzZSk7
DQo+ID4+Pg0KPiA+Pj4gICAgICAgIGlmIChmaW8tPmJpbyAmJiAhKFNNX0koc2JpKS0+aXB1X3Bv
bGljeSAmICgxIDw8DQo+IEYyRlNfSVBVX05PQ0FDSEUpKSkNCj4gPj4+ICAgICAgICAgICAgICAg
IGVyciA9IGYyZnNfbWVyZ2VfcGFnZV9iaW8oZmlvKTsNCj4gPj4+DQo+ID4+DQo+ID4+DQo+ID4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4+IExp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0DQo+ID4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0DQo+ID4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwNCj4gPg0KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
