Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CE344FD26
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Nov 2021 03:28:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mmRjO-0001VT-Qn; Mon, 15 Nov 2021 02:28:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mmRjM-0001VN-R5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Nov 2021 02:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TBtM8o6IVD7EabhX4s5ivum/+sRvRnvS6yk3UOKx95o=; b=Rwt3XGgvjAiQwu70fG08lMqIN9
 JfJZDgc5Tx93GWqNwEkvP9js2JzqGDoJoFLfk4NHmvly0KWvOqBtqgufNHYIGRDKO06ntLO5mpfKH
 Nf4nRLVla6g8u5QQue/xN7eF3C1ua8ufMGLtzWLxfKuKPSwn4E94NIJyWGLts8ri8g9M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TBtM8o6IVD7EabhX4s5ivum/+sRvRnvS6yk3UOKx95o=; b=CVdOGZTV2BB9oLI1xlJMQnT71n
 Et4nF7LvaH8KVv5q20jlFZVtHnAJk/i4qY/hWAEWq3c5YafdmSXZ/20t4oKdn3v6HICbCA0inz0r+
 i2+OWyfFlxj55M2X8RfGK+YwEgTOT6oPMHIyISKkBLPbC1mL0Lz9dCjv0s0UR0MAkZFs=;
Received: from mail-eopbgr1320127.outbound.protection.outlook.com
 ([40.107.132.127] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mmRjI-0002tt-Q9
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Nov 2021 02:28:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuZExrB6y8MCy9LX8ZHRbMpeQ7nFPo4UR9oONhnZ0lZaOJQQa5snvFVOwAbWxgBW8U1W5OvXgPMjoO5t97FLc0GfRQj1Bz9pJLIxpR0dgXcJTwdYEXsyJbHBHxCBHafv4oIQCnrWPKYzJNfS6/nmsESc8FYFeUxXy0y3nIU+fWuiwMDaB8BSapN2+8BbezVgVGzFXsJIbztPuD/++moxfpjp3EuN2xT+dnEK9mFaHvBxX0+9cf2hxUrRgvIeMvmAbTH8+2u8nc0RwkiYXWXRbUp8ATzvmlijL/4g9aWHIDTVvxcgBHS2GjLim4lYOk+fLfBIC/LogqtOftA291nyrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBtM8o6IVD7EabhX4s5ivum/+sRvRnvS6yk3UOKx95o=;
 b=dJI7ziMD10mbsBrQDnZOuMZamlCVWDwZK7R5R+QXDknpRNEfAmkYeUuZTCTq9okscKEU7lKt+gNDsitHNOh91vCqloCgzddOAlLPFIhmiaSbxpQYWO7fG/ItLLOOk0pywZKdqbgPvDA1+O84UX5eHTpyrw7I6e7NWlvYYLVKkoTQpgbvMEMhYJktxyh7BEPN9k2qTAofeH1Vr+yTG7bWHmX+AWW5CBRWH7C/XHnUl44Rskn4diPLLQXH5hz0v7MTP4BMhv/Lm7dnOYM34899PdJIoTJDbRizK4LZCtrCMHfEN2jjrqqD8evBg9SrAIz5MSNGJ1tHZ/S0n06XrxpiuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBtM8o6IVD7EabhX4s5ivum/+sRvRnvS6yk3UOKx95o=;
 b=EK1ZJO3Kaml4gs3P9gOzIIJhPz834MDf7lwSQuJWvpB9C1Ul/JqK5z1IgTXTZvDOzRDskRrmIOf3C9IH7yLJTUFRevNDBSmKkQOQGogljSMzLfgftPk/QXIORPuKbpWVkKHdLZxC1Hi8FqEQ+/+cheqeGNCPLX7szr+pdY656zA=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB4148.apcprd06.prod.outlook.com (2603:1096:820:30::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Mon, 15 Nov
 2021 02:28:02 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%5]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 02:28:02 +0000
From: =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [RFC PATCH] f2fs:compress: introduce compress private data slab
 cache
Thread-Index: AQHXy+5n4i8SZ/0EIk2BYeCYuNHQ8awBGYQAgALe8UA=
Date: Mon, 15 Nov 2021 02:28:01 +0000
Message-ID: <KL1PR0601MB4003D0E5EF4DCEA4E0217E4BBB989@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20211028112433.23879-1-changfengnan@vivo.com>
 <AIIAWwDBE7sNmxjtkrk7dqq6.9.1636785352506.Hmail.changfengnan@vivo.com>
In-Reply-To: <AIIAWwDBE7sNmxjtkrk7dqq6.9.1636785352506.Hmail.changfengnan@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c848e7b2-b5f3-434e-6b5e-08d9a7df8c32
x-ms-traffictypediagnostic: KL1PR0601MB4148:
x-microsoft-antispam-prvs: <KL1PR0601MB4148B5809820D013F549B447BB989@KL1PR0601MB4148.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HMo3rjgApDU7iM36ydHaPHbwo1ebQ3LZk73EXSnCqmx8vHNkc/DUnfNUnrLx0yom+t39uNgM0WrABg5HDmi173Bzi4KVkTWjxhaGamEA6D6uHMHxslt7syZHw3BuWGsxsV+QzA15Ao9wfxZQd42G1bHrv2OjT7leg+BQ3d1QfZa8YHlwQsj9B2yK1aCwEloehz/7m5Y+9T15FDCOLA9ZJ+j+dp5jFyGR873v5zUnS9B5BS+qbA1Q8a91I0reqyBL2I+UvnvpWblUCZCl08dclHt7AHF4NhzJI1dXNQvVH+0gWYi83w+EL44RZGkAYh7lCT4dQxtdf541yYXK+Ci7LDnbFjuR/orEo7FpLj66fZu9lUlbeOVCbefPLh/mxFcKmC0NtTV1a051N4nZMonGAs8wV7iQqDkC8bkeVraMCua3l40Jf+wvpj9/0NbFG7zh8hU8zVVZCx51sgwx7yArejFEuSM7ZrbgwPMbBKt91qNf7z2h40mQUipCZBAZSfjvLlXwd61E2WrASjNcnd5c39kxj3+kRIXD0Sf7++Ub9iPftfYyv9Ma05VD35Okf/6Rs2NiXH0dngRW8NfUKxbPd1t8WaSk2BkpbA1Vl34PfqwPc3+6jHUXJi3wxLtEGrhuAFqz5XP86Cps1kX5kNwBPN3DKO5m2K7nYQMpiwssyOiwG+ISIKD4xEHuom9lmHIORE2NwwBB59GrxiFwah4VQw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(8676002)(64756008)(66556008)(52536014)(5660300002)(6506007)(110136005)(38070700005)(66446008)(7696005)(2906002)(33656002)(83380400001)(66946007)(76116006)(66476007)(8936002)(53546011)(316002)(508600001)(86362001)(55016002)(186003)(38100700002)(122000001)(85182001)(26005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1Z1eTBaMHBTUnoxZ0U3REJESm10d1hXRU82ODYrRnl4K0s2dFhVL2tyY3dp?=
 =?utf-8?B?SVVuVGdMbDRvK3hyQTJ3MlZ0ZG41b0RDTGJOMkFIdDAzQ0ZiVk0yaVNjdUxu?=
 =?utf-8?B?RGk2TXVoNVI5RXM4VVk4SjhlUFd0QkphVmE5MnZXSHRwVWRQeTh1MzlYUURz?=
 =?utf-8?B?bzhrZ1NrbDM0L3FUTTRCV3FXUUVnUnBwcExaUHR6TnE5WGhuRkE5MEhFUXFO?=
 =?utf-8?B?Vm5ISmZqQjNnMEJ3VFJSR1d4RkRhaUNwSkJqZHMxN1FaUVl4WlVmMkZsMnho?=
 =?utf-8?B?S2FSSFF1cVdyTXVONGs5WkFNcHZKQ2tyMk0zRnpiV0hZaUY0ZWJpRWhOb0t5?=
 =?utf-8?B?NUhuOFQwNlZObzEyUUswZlEvSFUvai9CaGNpM0l5K1l4cTNqMjdnRUJ4M0hm?=
 =?utf-8?B?RnpON1pud1RVNVgxOHBudVE3SlQrSStjelRmb210TVdUeHgxdkJIODVNeUsv?=
 =?utf-8?B?Tzc2RGlLT056R1BEUzNIdjIzLzN1UVdQU1FGdWdqWEY3SC8vbGRkMVFNb05P?=
 =?utf-8?B?ZHczRmZPOUtHeSs4RWRnT2JtUGMwZmcwRFNlOVdNNGlFTWF1dVZvRDM0UExw?=
 =?utf-8?B?ckdNd0gydkNVelZEckQvSVl5OVZHQ241dnZQUlNVdXFWNithbGlINTNGM1RG?=
 =?utf-8?B?NjZXWm9JaWJNQ29RYTJGUWwyREg5MXRMbmN2M0ZTdUErLzRTVmpYNFpBNzhj?=
 =?utf-8?B?dmRiNlNUa3FwSVptYlk4bnZFZDJkYjlqYzJWOGtSSE9kSFlNYjNra0l3RFMv?=
 =?utf-8?B?bEpIbWsvMjAvVjd1OXU5dVRCeE5MeUJNbVFFRGdCejZOMHNQYUpvZjZRbTRo?=
 =?utf-8?B?eWxtREVQT2JGMGc0YTY3dlRBdjBRMDBqNlRNbjEwL1ZuNFcxOUE2R2wzMGU2?=
 =?utf-8?B?M2FoK29mM0Rla2pSTkd4VnZwMFVBeFRRTXN5MVA4RWs3M3lhQWg1cCtQTGp4?=
 =?utf-8?B?WGIyMGFtcjJJWVl5bTlqTHo4WUp0S0ZFdVhDK1ZlTTVWMC9rbWxocFVmbnAr?=
 =?utf-8?B?ZGRrSVFlOEIzeGRjM2lDajhjOVNubm5UUXBNbHdEOElUM0grVnFaajRyU1dh?=
 =?utf-8?B?TDBCRHFtUWswenRhcXJXZnZZMktMZ3lYMU9SMHJ4RXk1VHFEK2cySTd3V2o3?=
 =?utf-8?B?bjZuVGZ6SUQrN3Z5UHQwOU1vT0NUdlJOeEhTNUF6d0w1NHFzNDRHVUxQY25I?=
 =?utf-8?B?UlFIMXVmd1BpaittRmcycWdYL0hCM2lOZ1NYeTI1Sk4rdi80NFcyMTBWTnl4?=
 =?utf-8?B?YlY1bEozbUI3TTRITlN4Q3poMXUrU2l3b1R0SWhaN0svOElNNzBWWkV3N1VO?=
 =?utf-8?B?blFOM3E5eWNNMFh0andiN1ByaTR5RDBnSUswenkyeFFSVEVjTFJDQUtIbVQ4?=
 =?utf-8?B?dzN5ZW9jVWxidmtFaytCODZUay8rbTdJUlhKdzl4OXNZdy9oN2pqTnVjbHVp?=
 =?utf-8?B?b0ZZTWkra09VNmJ3S2RpbXNlVS9qTTlxUTgvZnlTZTJvUmFpZWZiVFJtL1RD?=
 =?utf-8?B?Q1dKK3Qreml6T0V3dUFSdlBMNWhuUG91bk16Q055aTI3dW0rRkk1MDVKbWxM?=
 =?utf-8?B?b09mMWgvY1pGUlNqeEQxRncremY1Tm0veGhaM2I2K1d5RFdxTnp0aUplcW9O?=
 =?utf-8?B?ZTB3Z0huUzBHR3ArS3J6a1VTTUVGcXhlQnZRMHVrUUZQb0o2V3lZU2lsQWdC?=
 =?utf-8?B?Q2R4czhqaFFnVjdGSEphRWJnUVNUcmdlRUxlRTA0dHNWbWVwTUJEai8yT092?=
 =?utf-8?B?Ni8zL2JmZlNnT0NQeml3S05XY2lnKy9oQU12YmI0SFZScE9FMFpnZjZJeElv?=
 =?utf-8?B?K1kvQkFLTWdFMWdQZk5EUXVBWHFidlBQdFIzdE8reEJoS2hIMG5yT2ZTZ3dV?=
 =?utf-8?B?S0pybzc5KzhtaDJJaUVGTFArTmtqcFV0M0wreWQyS1ZTc1Vpb1dKSVRFWHVj?=
 =?utf-8?B?aXI4NHZ2bk5iSVBlZnZXTU5XVS9GY1hKVTdXR0VyWGdmOUk5a1JEOHZMSUMv?=
 =?utf-8?B?OWgrazJwVFZ2NzVaanJFc2FZcEcxM0dOUm00NjB2aE4xaERocUNUM29lQW5D?=
 =?utf-8?B?MlNHTXJsRjlnK3czYmtmTHNPT1RoOEJiMk14eGlHKzRnOXZJenlMb21ZeXZ3?=
 =?utf-8?B?NklVY0xtN0FBdEZXdG1LbEt5WE8rLzdyS2UzK2J0S3B6b2ZUYkNjNWhBVEp1?=
 =?utf-8?B?cWc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c848e7b2-b5f3-434e-6b5e-08d9a7df8c32
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 02:28:01.8926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RBSqH8bVxnxR1MuENvHHA+84HV21tvifczuh+JedgaNWeZmRIyqHW9ncTxo7GaJi2xz9kAKqTsBDqL3tFXn6zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4148
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
 no trust [40.107.132.127 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.132.127 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mmRjI-0002tt-Q9
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs:compress: introduce compress
 private data slab cache
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogY2hhbmdmZW5nbmFuQHZp
dm8uY29tIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+IE9uIEJlaGFsZiBPZg0KPiBDaGFvIFl1DQo+
IFNlbnQ6IFNhdHVyZGF5LCBOb3ZlbWJlciAxMywgMjAyMSAyOjM2IFBNDQo+IFRvOiDluLjlh6Tm
paAgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT47IGphZWdldWtAa2VybmVsLm9yZzsNCj4gbGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQNCj4gU3ViamVjdDogUmU6IFtSRkMgUEFU
Q0hdIGYyZnM6Y29tcHJlc3M6IGludHJvZHVjZSBjb21wcmVzcyBwcml2YXRlIGRhdGENCj4gc2xh
YiBjYWNoZQ0KPiANCj4gT24gMjAyMS8xMC8yOCAxOToyNCwgRmVuZ25hbiBDaGFuZyB3cm90ZToN
Cj4gPiBBZGQgImYyZnNfbHpvX2NvbXByZXNzX3ByaXZhdGUiIGFuZCAiZjJmc19sejRfY29tcHJl
c3NfcHJpdmF0ZSIgc2xhYg0KPiA+IGNhY2hlLCB0byBzcGVlZCB1cCBtZW1vcnkgYWxsb2NhdGlv
biB3aGVuIGluaXQgY29tcHJlc3MgY3R4Lg0KPiA+IE5vIHNsYWIgY2FjaGUgaXMgYWRkZWQgdG8g
enN0ZCBhcyB0aGUgcHJpdmF0ZSBkYXRhIGZvciB6c3RkIGlzIHJlbGF0ZWQNCj4gPiB0byBtb3Vu
dCBvcHRpb24sIGFuZCB0b28gYmlnLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRmVuZ25hbiBD
aGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPg0KPiA+IC0tLQ0KPiA+ICAgZnMvZjJmcy9jb21w
cmVzcy5jIHwgNDUNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NvbXByZXNzLmMgYi9mcy9mMmZzL2Nv
bXByZXNzLmMgaW5kZXgNCj4gPiA3NTg4ZTRlODE3YjguLjRhOGE0ODU4ZDM1OCAxMDA2NDQNCj4g
PiAtLS0gYS9mcy9mMmZzL2NvbXByZXNzLmMNCj4gPiArKysgYi9mcy9mMmZzL2NvbXByZXNzLmMN
Cj4gPiBAQCAtMTcxLDEwICsxNzEsMTEgQEAgdm9pZCBmMmZzX2NvbXByZXNzX2N0eF9hZGRfcGFn
ZShzdHJ1Y3QNCj4gY29tcHJlc3NfY3R4ICpjYywgc3RydWN0IHBhZ2UgKnBhZ2UpDQo+ID4gICB9
DQo+ID4NCj4gPiAgICNpZmRlZiBDT05GSUdfRjJGU19GU19MWk8NCj4gPiArc3RhdGljIHN0cnVj
dCBrbWVtX2NhY2hlICpsem9fY29tcHJlc3NfcHJpdmF0ZV9zbGFiOw0KPiA+ICAgc3RhdGljIGlu
dCBsem9faW5pdF9jb21wcmVzc19jdHgoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MpDQo+ID4gICB7
DQo+ID4gLQljYy0+cHJpdmF0ZSA9IGYyZnNfa3ZtYWxsb2MoRjJGU19JX1NCKGNjLT5pbm9kZSks
DQo+ID4gLQkJCQlMWk8xWF9NRU1fQ09NUFJFU1MsIEdGUF9OT0ZTKTsNCj4gPiArCWNjLT5wcml2
YXRlID0gZjJmc19rbWVtX2NhY2hlX2FsbG9jKGx6b19jb21wcmVzc19wcml2YXRlX3NsYWIsDQo+
ID4gKwkJCUdGUF9GMkZTX1pFUk8sIGZhbHNlLCBGMkZTX0lfU0IoY2MtPmlub2RlKSk7DQo+ID4g
ICAJaWYgKCFjYy0+cHJpdmF0ZSkNCj4gPiAgIAkJcmV0dXJuIC1FTk9NRU07DQo+ID4NCj4gPiBA
QCAtMTg0LDcgKzE4NSw3IEBAIHN0YXRpYyBpbnQgbHpvX2luaXRfY29tcHJlc3NfY3R4KHN0cnVj
dA0KPiA+IGNvbXByZXNzX2N0eCAqY2MpDQo+ID4NCj4gPiAgIHN0YXRpYyB2b2lkIGx6b19kZXN0
cm95X2NvbXByZXNzX2N0eChzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYykNCj4gPiAgIHsNCj4gPiAt
CWt2ZnJlZShjYy0+cHJpdmF0ZSk7DQo+ID4gKwlrbWVtX2NhY2hlX2ZyZWUobHpvX2NvbXByZXNz
X3ByaXZhdGVfc2xhYiwgY2MtPnByaXZhdGUpOw0KPiA+ICAgCWNjLT5wcml2YXRlID0gTlVMTDsN
Cj4gPiAgIH0NCj4gPg0KPiA+IEBAIC0yMzQsNiArMjM1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBmMmZzX2NvbXByZXNzX29wcw0KPiBmMmZzX2x6b19vcHMgPSB7DQo+ID4gICAjZW5kaWYNCj4g
Pg0KPiA+ICAgI2lmZGVmIENPTkZJR19GMkZTX0ZTX0xaNA0KPiA+ICtzdGF0aWMgc3RydWN0IGtt
ZW1fY2FjaGUgKmx6NF9jb21wcmVzc19wcml2YXRlX3NsYWI7DQo+ID4gICBzdGF0aWMgaW50IGx6
NF9pbml0X2NvbXByZXNzX2N0eChzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYykNCj4gPiAgIHsNCj4g
PiAgIAl1bnNpZ25lZCBpbnQgc2l6ZSA9IExaNF9NRU1fQ09NUFJFU1M7IEBAIC0yNDMsNyArMjQ1
LDggQEANCj4gc3RhdGljDQo+ID4gaW50IGx6NF9pbml0X2NvbXByZXNzX2N0eChzdHJ1Y3QgY29t
cHJlc3NfY3R4ICpjYykNCj4gPiAgIAkJc2l6ZSA9IExaNEhDX01FTV9DT01QUkVTUzsNCj4gPiAg
ICNlbmRpZg0KPiA+DQo+ID4gLQljYy0+cHJpdmF0ZSA9IGYyZnNfa3ZtYWxsb2MoRjJGU19JX1NC
KGNjLT5pbm9kZSksIHNpemUsIEdGUF9OT0ZTKTsNCj4gDQo+IFRoZSBzaXplIGNvdWxkIGJlIExa
NEhDX01FTV9DT01QUkVTUyByYXRoZXIgdGhhbg0KPiBMWjRfTUVNX0NPTVBSRVNTIGlmIHdlIGVu
YWJsZSBsejRoYyBhbGdvcml0aG0sIHNvIHRoZXkgc2hvdWxkIG5ldmVyDQo+IHNoYXJlIHRoZSBz
YW1lIGx6NF9jb21wcmVzc19wcml2YXRlX3NsYWIgc2xhYiBjYWNoZS4NCj4gDQo+IE90aGVyIGNv
bmNlcm4gaXMgSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhlcmUgaXMgYW55IHNpZGUtZWZmZWN0IGlm
IHdlDQo+IGludHJvZHVjZSBzbGFiIGNhY2hlIHdoaWNoIGhhcyBzdWNoIGxhcmdlIG9iamVjdCBz
aXplLi4uDQoNCg0KWWVzLCBJIGhhdmUgdGhpcyBjb25jZXJuIHRvbywgYnV0IGluIG15IHRlc3Qs
IHdpdGggc2xhYiBjYWNoZSBpbmRlZWQgYmUgZmFzdGVyLi4uDQoNCj4gDQo+IFRoYW5rcywNCj4g
DQo+ID4gKwljYy0+cHJpdmF0ZSA9IGYyZnNfa21lbV9jYWNoZV9hbGxvYyhsejRfY29tcHJlc3Nf
cHJpdmF0ZV9zbGFiLA0KPiA+ICsJCQlHRlBfRjJGU19aRVJPLCBmYWxzZSwgRjJGU19JX1NCKGNj
LT5pbm9kZSkpOw0KPiA+ICAgCWlmICghY2MtPnByaXZhdGUpDQo+ID4gICAJCXJldHVybiAtRU5P
TUVNOw0KPiA+DQo+ID4gQEAgLTI1OCw3ICsyNjEsNyBAQCBzdGF0aWMgaW50IGx6NF9pbml0X2Nv
bXByZXNzX2N0eChzdHJ1Y3QNCj4gPiBjb21wcmVzc19jdHggKmNjKQ0KPiA+DQo+ID4gICBzdGF0
aWMgdm9pZCBsejRfZGVzdHJveV9jb21wcmVzc19jdHgoc3RydWN0IGNvbXByZXNzX2N0eCAqY2Mp
DQo+ID4gICB7DQo+ID4gLQlrdmZyZWUoY2MtPnByaXZhdGUpOw0KPiA+ICsJa21lbV9jYWNoZV9m
cmVlKGx6NF9jb21wcmVzc19wcml2YXRlX3NsYWIsIGNjLT5wcml2YXRlKTsNCj4gPiAgIAljYy0+
cHJpdmF0ZSA9IE5VTEw7DQo+ID4gICB9DQo+ID4NCj4gPiBAQCAtMTk0NCw2ICsxOTQ3LDMyIEBA
IHZvaWQgZjJmc19kZXN0cm95X3BhZ2VfYXJyYXlfY2FjaGUoc3RydWN0DQo+IGYyZnNfc2JfaW5m
byAqc2JpKQ0KPiA+ICAgew0KPiA+ICAgCWttZW1fY2FjaGVfZGVzdHJveShzYmktPnBhZ2VfYXJy
YXlfc2xhYik7DQo+ID4gICB9DQo+ID4gK3N0YXRpYyBpbnQgX19pbml0IGYyZnNfaW5pdF9jb21w
cmVzc19wcml2YXRlX2NhY2hlKHZvaWQpDQo+ID4gK3sNCj4gPiArI2lmZGVmIENPTkZJR19GMkZT
X0ZTX0xaNA0KPiA+ICsJbHo0X2NvbXByZXNzX3ByaXZhdGVfc2xhYiA9DQo+IGYyZnNfa21lbV9j
YWNoZV9jcmVhdGUoImYyZnNfbHo0X2NvbXByZXNzX3ByaXZhdGUiLA0KPiA+ICsJCQkJCUxaNF9N
RU1fQ09NUFJFU1MpOw0KPiA+ICsJaWYgKCFsejRfY29tcHJlc3NfcHJpdmF0ZV9zbGFiKQ0KPiA+
ICsJCXJldHVybiAtRU5PTUVNOw0KPiA+ICsjZW5kaWYNCj4gPiArI2lmZGVmIENPTkZJR19GMkZT
X0ZTX0xaTw0KPiA+ICsJbHpvX2NvbXByZXNzX3ByaXZhdGVfc2xhYiA9DQo+IGYyZnNfa21lbV9j
YWNoZV9jcmVhdGUoImYyZnNfbHpvX2NvbXByZXNzX3ByaXZhdGUiLA0KPiA+ICsJCQkJCUxaTzFY
X01FTV9DT01QUkVTUyk7DQo+ID4gKwlpZiAoIWx6b19jb21wcmVzc19wcml2YXRlX3NsYWIpDQo+
ID4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ID4gKyNlbmRpZg0KPiA+ICsJcmV0dXJuIDA7DQo+ID4g
K30NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIGYyZnNfZGVzdHJveV9jb21wcmVzc19wcml2YXRl
X2NhY2hlKHZvaWQpDQo+ID4gK3sNCj4gPiArI2lmZGVmIENPTkZJR19GMkZTX0ZTX0xaNA0KPiA+
ICsJa21lbV9jYWNoZV9kZXN0cm95KGx6NF9jb21wcmVzc19wcml2YXRlX3NsYWIpOw0KPiA+ICsj
ZW5kaWYNCj4gPiArI2lmZGVmIENPTkZJR19GMkZTX0ZTX0xaTw0KPiA+ICsJa21lbV9jYWNoZV9k
ZXN0cm95KGx6b19jb21wcmVzc19wcml2YXRlX3NsYWIpOw0KPiA+ICsjZW5kaWYNCj4gPiArfQ0K
PiA+DQo+ID4gICBzdGF0aWMgaW50IF9faW5pdCBmMmZzX2luaXRfY2ljX2NhY2hlKHZvaWQpDQo+
ID4gICB7DQo+ID4gQEAgLTE5ODMsNyArMjAxMiwxMiBAQCBpbnQgX19pbml0IGYyZnNfaW5pdF9j
b21wcmVzc19jYWNoZSh2b2lkKQ0KPiA+ICAgCWVyciA9IGYyZnNfaW5pdF9kaWNfY2FjaGUoKTsN
Cj4gPiAgIAlpZiAoZXJyKQ0KPiA+ICAgCQlnb3RvIGZyZWVfY2ljOw0KPiA+ICsJZXJyID0gZjJm
c19pbml0X2NvbXByZXNzX3ByaXZhdGVfY2FjaGUoKTsNCj4gPiArCWlmIChlcnIpDQo+ID4gKwkJ
Z290byBmcmVlX2RpYzsNCj4gPiAgIAlyZXR1cm4gMDsNCj4gPiArZnJlZV9kaWM6DQo+ID4gKwlm
MmZzX2Rlc3Ryb3lfZGljX2NhY2hlKCk7DQo+ID4gICBmcmVlX2NpYzoNCj4gPiAgIAlmMmZzX2Rl
c3Ryb3lfY2ljX2NhY2hlKCk7DQo+ID4gICBvdXQ6DQo+ID4gQEAgLTE5OTQsNCArMjAyOCw1IEBA
IHZvaWQgZjJmc19kZXN0cm95X2NvbXByZXNzX2NhY2hlKHZvaWQpDQo+ID4gICB7DQo+ID4gICAJ
ZjJmc19kZXN0cm95X2RpY19jYWNoZSgpOw0KPiA+ICAgCWYyZnNfZGVzdHJveV9jaWNfY2FjaGUo
KTsNCj4gPiArCWYyZnNfZGVzdHJveV9jb21wcmVzc19wcml2YXRlX2NhY2hlKCk7DQo+ID4gICB9
DQo+ID4NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
