Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DE3413FE1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Sep 2021 05:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uVyVDw9WcssgrA5RN0LbKDHnkslGMRwVSmQKm1dKbo0=; b=ANDNtJDtLVyRUm7NW/co0ha4L
	QJ2bbBupzHmwejcUPvXJiVxuMDHEKXg+qPh1Dt+UbpO2DzUKIOfqCtM9K+kVibvtYnc8JSVNG9RL/
	ZWT71Y74N6uCZXWPcJOt+Od8ZZZvxOvT2cwZxEm3Xx4vCBWoGY2VfRLuY3Jv52Mfh0ahE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mSsWd-0007yW-S7; Wed, 22 Sep 2021 03:02:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1mSsWT-0007yL-E5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Sep 2021 03:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CHvZGVLRsLK1xqUcYDKTyTwlFpQO8fDeJMzlTrLhNDk=; b=Cf4DLTEE4ZvtcSevBUgybl371r
 8K67PFQK9V/s7OXEeOveEfRDsMnKqnAa8yU29ntTEEXj0R1/Icv0jplX2+IsjUWS4S3e6zIX38P3L
 4dEyDsyVGiGTc/p4w10YlfyhknFzzvcriSKP4s00zGvxNEVAc7+88BjHZ+xN2Or1hjkw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CHvZGVLRsLK1xqUcYDKTyTwlFpQO8fDeJMzlTrLhNDk=; b=kidWgHcHJgtPNVuDT5ijSBdoMJ
 ow0lEfmP8V0J+BlSynrmRRs0Jm4tklk7TLMOtZMcHCz6vwmgE5tH/T7qckrScODfwOE6HQsV2KUwj
 CNT7zUFNbD5Urw5ULOIKVBdnJjLl9fXtgfMPYJhAxJ33FQf/LRoxvDPKxYOGfALcLvEg=;
Received: from mail-eopbgr1320113.outbound.protection.outlook.com
 ([40.107.132.113] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mSsWK-0008DY-Q7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Sep 2021 03:02:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkLK5l7sGG4QNS9VsjvHRrDDlpj/wpO6fukVrPDd0PYeqbxkq/D7TPmvH7Wuo9ij0KApenkTFWVoeqRlF1C0l3UBZ7rvfMtxq67bBmSLQ7ydjcbVvndMr34YKwKpTAK1Oa8CzrW784BTIxVrLA84zPASioEanpcH2DHBmeZptMyninuHhZr8URNHQHaO7+l8YJwyfKWLl54iLr3Uxz+opbc4w70OPyeCf67ObrZCF3ncnnUExPguf1eg3okIfcrGJI6SHaw92uWq8CMLviRDMqz71iSt1mbpcMj3R4Ps1ecPG9iGnTXyI14/z5CReqOrIJEpves9NXGixpaGPKoEYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=CHvZGVLRsLK1xqUcYDKTyTwlFpQO8fDeJMzlTrLhNDk=;
 b=e+Y/d+SMHQMZvnkRBkAqA0fDyJ2AFl52NZTbOyftsSleXNAsWrGvThJTcOSykpWd+rbIYy+tXyY9KcAqX/AamnsXdV+6yYv3LRvu/usRqVb/xVkTc7IQ524iITsB13gSbT6UVh33Y7sLIPfdc5hfUBJr7WAnNvtzKt7oVccM4Jr8F05WFpClqHTXztT+7ezLEySevzQ1PByRNZNrvsp7YVDWK410DB6vg6yFmr5ei09VWfUAYo3vmRoWYYw8VptTwu/UubHANqF6V9Ar9SZi+7qLAFQhBZmeS7nYCHrOXPft+t1wcZt9j4fbXH+a4nPQ0KNDtWBhHbfU0O9QPOH2cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHvZGVLRsLK1xqUcYDKTyTwlFpQO8fDeJMzlTrLhNDk=;
 b=dWkhZkBdlxhx3JIWFXc+zaVcOHbxPjNVCo9oEmkBS3DQde6PVmH9r5nGIQkv3sb5VXQlYNyRT77iZX7Zm3mbzxlpEJD9MvpVJWzxoyO83hvY5xrdH4rA2IIY2qtYt4B6MNOAsF0RUPMN5nK6vHd0DJV/Tg5NikmYlLvd75Jt6rA=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB4387.apcprd06.prod.outlook.com (2603:1096:820:7a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Wed, 22 Sep
 2021 03:01:50 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970%8]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 03:01:50 +0000
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH v2 2/2] f2fs: fix missing inplace count in overwrite with
 direct io
Thread-Index: AQHXqu5PjxLZ5rWf40GUlvKwiLN686umkaiAgAAJteCAAWQ9YIAAMkAAgAEpE5CAAQnMAIAFANmA
Date: Wed, 22 Sep 2021 03:01:49 +0000
Message-ID: <KL1PR0601MB4003F4A5FDBD157BF9E76E22BBA29@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20210916113026.378385-1-changfengnan@vivo.com>
 <20210916113026.378385-2-changfengnan@vivo.com>
 <AFQA*QDoEjqpHYJlWwMYT4qj.9.1631794201010.Hmail.changfengnan@vivo.com>
 <KL1PR0601MB400388BC823D5FD0558D43D2BBDC9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <KL1PR0601MB40030D121F65550D690A776DBBDD9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <ANgA6QClEsWrpLTMx5-VNqof.9.1631883577159.Hmail.changfengnan@vivo.com>
 <KL1PR0601MB40034B2A46C36B59B713B3E7BBDE9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <AJQA4AArEnKurlijneb9sapU.9.1632004451993.Hmail.changfengnan@vivo.com>
In-Reply-To: <AJQA4AArEnKurlijneb9sapU.9.1632004451993.Hmail.changfengnan@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f272577c-042d-486a-16dc-08d97d7552ae
x-ms-traffictypediagnostic: KL1PR0601MB4387:
x-microsoft-antispam-prvs: <KL1PR0601MB4387BA31D8D3B32EBE2D415BBBA29@KL1PR0601MB4387.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i8Ue2d6mDHTeBq7WxRI+l/RuNq96msJMw4GSI6+v4fJqQaVO3HUN7MeF/VTKtf3oXM4DTQ+8Gv4kXYXLfD4loRnBvNpDY4cv39zDMfsFO9GDoLEzdZZnyy9c7w6VccSBv5zwvs05+FweSb5tAFHsQsVp8KBk/G5GHzvaLgIZX27OaJC2XN88ygTxoQzy9FMjHfLv/TKNhJ04IixV7kqdRxwNo/LUbsNQGvTECIasg3I5ZWtstfWhSAfPfnMJNNDdmnfPujrinZmxVJJRzICCzo1H33cW+hvtyC4PomZd5ZCpX9Fnd7aah1N3yJVPEtMp83XJ7ovhZhscM12QLavsL2dhJo791OCAOiwvz+eUT3ccVF+2nkzX0GTNDoQP1d9DVOuYhQAPfkOSFUbAtmdYqsWzFqBQZYqDTI9AvJxc+efyYAL+6NBZbMHG4bIQhWrDfq95D3/P0V3Inexb26+onm0iR0+YiZqL5mng2IzwFhM4KjV4Jtd8qCwAi4eHUiZcfI+xpveMx/Yn+QMoOs6BSf9HlSs7J31pC5im/0qWs7KFlIfni/7I+EwI8+1H4oln7qj4rXqHObl270KkWD7KgDsbCRBTGIjjN9PYKnpSkX+EoOFzVOawkn+qCeJoKujKripNV9Nm1m2wue0CJsfI8W4vhwj1hTs304L/Dz0hW7RkD5N8d/llbeC43BO0bLPrRNHsFfcFvFbVox0BEgCZ9Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66446008)(33656002)(76116006)(5660300002)(186003)(64756008)(66556008)(66946007)(110136005)(53546011)(9686003)(316002)(26005)(2906002)(6506007)(4326008)(86362001)(8936002)(55016002)(508600001)(83380400001)(52536014)(7696005)(122000001)(38100700002)(85182001)(8676002)(38070700005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXhuOUJhbTZadHFmUE5CN0dyUnRnUVIraGNCb1JwZ3hveE1WRzVRWm1abERl?=
 =?utf-8?B?Q1hWdW94WWNZOThOK0NSakZMeHFrTnIzMmVZbGVLWWVGdDEvY2wxNVV0SHlp?=
 =?utf-8?B?anhRVEI0aDlKTkp1dlhYb2JpYk5ST0ZyUkhqaUYreExaSkxXaDdNSEtTbHY0?=
 =?utf-8?B?cmludlJTSjVsellzdElJYmxaNkdEWjNTSU15NzE0RGtzRVhYbXZZY29hQytX?=
 =?utf-8?B?LytJNVJzZTBwakhnVldhWDZSOE03eHFEdTZjSktFTlB1a1V0QTBPdUlKWS9D?=
 =?utf-8?B?L0FpSE5nclQycHlBaUtmZXJuSmR0bEZuUEY3d1hqVXlZellxVFBueUlIMmxx?=
 =?utf-8?B?Z2c3RVdIc1M3TnFBMkptb3l0R2Y1VzRNWno2bkFWaEtKejBHSTlrMG1wSUlw?=
 =?utf-8?B?K0hCc1Z5YlV2WEdJdG5lZDhTeCtaamdVSHN0WkNvamhkWWJoQVhka1NpOHA0?=
 =?utf-8?B?NG5ZdW9FczFWOU9URUJrM1J4QVdyNytRZXFLUUlncW96NDB3MnFzd2JxZFlq?=
 =?utf-8?B?WmhCYlNSUDJJMzNmNFcyZ0dXZEU2YmFlYkRYeElEQWo0ckR4K3ZUTk1mZ3J5?=
 =?utf-8?B?aVppVy9yMHBMWkRqQno2STdXVXlUbythYTdaQ1B4UW5tblpLekk2TjJpRFYr?=
 =?utf-8?B?SEdtcU9kUnVPZXk2MW9sUW1EYU9XNys2TE5STXZFZXFrcmFzakpsSWlzYm4v?=
 =?utf-8?B?cVNKeEJSZmlsNzB3bloxUGRhUjFzT3lqVmlwL1hTeUhJd2Z1RlBnc21McWFo?=
 =?utf-8?B?QlZGbFVJMlYzSUJHRWxuaG50d1JKbk5ZZ3RrakQwTHkzY0oxM01GcUpmUkFm?=
 =?utf-8?B?VDU2UjVsemR0SnVwRUhzbTZjSTNlajJSTk92YzRXdGJTcDlUNWN3bHloTThz?=
 =?utf-8?B?TUNRT3Bmem1HbGNQbU5SbjBpOWc1SFA2dWU5T1VwUzdVcFhkZXgvYklmRUVn?=
 =?utf-8?B?K0VrNFJ5bFVTKzRYeEIyN3FXdTVQdEpKcDU2MGp1NDRZaWpDN1NzalRNR1dq?=
 =?utf-8?B?ZS9EbE5xUFlSd1EyUktpMTNVMitaWk5sMmQyNGdUMitZTWxZWTFWTFFwWHNH?=
 =?utf-8?B?T2JxNGxKejdvSklxMm5mTDVKaWUzMTNqU3NFa3pJcndiTyt6VnhrLzFRM1Nj?=
 =?utf-8?B?R0gzWE9CSVhxSjNHUWxucXJ6RVhtMGJaSUlFdnMxdXMvVXBYZlNOZzhveHg3?=
 =?utf-8?B?OTNNZldpWU1qaU5GUmxIOHYrQjEycVliczUzc1p1ckFYSG5WR3NOdW4xNDlG?=
 =?utf-8?B?cG1PMnNwNHhjRjV3eUJwSmg1UXh6UnpvZUJLWTJRbU8zeGZMY2lDVUpab3A2?=
 =?utf-8?B?TUgxS0xCSXJwQzBGaHJiVmh5bmFLSGVNcnRYUkVYeDRHQ05MWDdtc1JzSktP?=
 =?utf-8?B?QTdXK1ZCNEdaUDZ0MGNCczhWZFUwT284MWJpU0FQcTd6bFA5VjVOaGNFV2ti?=
 =?utf-8?B?M1Bla1Y2Vmpwdks3Vmxab2loaVdxaE1JSUFEWXZrVHVwZTNXNnRodmZOeWYy?=
 =?utf-8?B?dGtGRDBveW5zbnhrZkdiaFREbkxvYm9ndDlLSHJ5am44QW4zL0dFMFdxekV1?=
 =?utf-8?B?emRBMDZiTjQ0Y3R1NlliSEZaanUyWGNFRytJR09EQ3ltcHhlNlJaOVFTdkNt?=
 =?utf-8?B?YXdGbmVheTZrSDdENFJWSXh3NExIOVlUZDNQVlFaRUEwT1ZrRG9LR3B4eUxJ?=
 =?utf-8?B?cUtmNXJHQk9uSjFYdGMyNXk2bFFLVmsrVGlwWGRzSkdtb0h1OEo1NVh5L1kx?=
 =?utf-8?Q?Avt6eRjjnukKL8Zb18=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f272577c-042d-486a-16dc-08d97d7552ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2021 03:01:49.7748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XR9MOxOx/KYOAfa9A1uYANgEYTUlQCyO+cuuu+2nSZGgkicKsWnUKXIhVFLe/BXE2RqeGnzoI+u972KZqrz+CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4387
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
 no trust [40.107.132.113 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.132.113 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mSsWK-0008DY-Q7
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: fix missing inplace count in
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
From: =?utf-8?B?5bi45Yek5qWg?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGNoYW5nZmVuZ25hbkB2aXZv
LmNvbSA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPiBPbiBCZWhhbGYgT2YNCj4gQ2hhbyBZdQ0KPiBT
ZW50OiBTdW5kYXksIFNlcHRlbWJlciAxOSwgMjAyMSA2OjM0IEFNDQo+IFRvOiDluLjlh6TmpaAg
PGNoYW5nZmVuZ25hbkB2aXZvLmNvbT47IGphZWdldWtAa2VybmVsLm9yZw0KPiBDYzogbGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MiAyLzJdIGYyZnM6IGZpeCBtaXNzaW5nIGlucGxhY2UgY291bnQgaW4gb3ZlcndyaXRlIHdpdGgN
Cj4gZGlyZWN0IGlvDQo+IA0KPiBPbiAyMDIxLzkvMTggMTQ6NDYsIOW4uOWHpOaloCB3cm90ZToN
Cj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IGNo
YW5nZmVuZ25hbkB2aXZvLmNvbSA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPiBPbiBCZWhhbGYgT2YN
Cj4gQ2hhbw0KPiA+PiBZdQ0KPiA+PiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciAxNywgMjAyMSA5
OjAwIFBNDQo+ID4+IFRvOiDluLjlh6TmpaAgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT47IGphZWdl
dWtAa2VybmVsLm9yZw0KPiA+PiBDYzogbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzJdIGYyZnM6IGZpeCBtaXNzaW5n
IGlucGxhY2UgY291bnQgaW4NCj4gPj4gb3ZlcndyaXRlIHdpdGggZGlyZWN0IGlvDQo+ID4+DQo+
ID4+IE9uIDIwMjEvOS8xNyAxODoxOSwg5bi45Yek5qWgIHdyb3RlOg0KPiA+Pj4NCj4gPj4+DQo+
ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+PiBGcm9tOiDluLjlh6TmpaAN
Cj4gPj4+PiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDE2LCAyMDIxIDg6NDYgUE0NCj4gPj4+
PiBUbzogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPjsgamFlZ2V1a0BrZXJuZWwub3JnDQo+ID4+
Pj4gQ2M6IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0DQo+ID4+Pj4gU3Vi
amVjdDogUkU6IFtQQVRDSCB2MiAyLzJdIGYyZnM6IGZpeCBtaXNzaW5nIGlucGxhY2UgY291bnQg
aW4NCj4gPj4+PiBvdmVyd3JpdGUgd2l0aCBkaXJlY3QgaW8NCj4gPj4+Pg0KPiA+Pj4+DQo+ID4+
Pj4NCj4gPj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+Pj4gRnJvbTogY2hh
bmdmZW5nbmFuQHZpdm8uY29tIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+IE9uIEJlaGFsZg0KPiBP
Zg0KPiA+Pj4+IENoYW8NCj4gPj4+Pj4gWXUNCj4gPj4+Pj4gU2VudDogVGh1cnNkYXksIFNlcHRl
bWJlciAxNiwgMjAyMSA4OjEwIFBNDQo+ID4+Pj4+IFRvOiDluLjlh6TmpaAgPGNoYW5nZmVuZ25h
bkB2aXZvLmNvbT47IGphZWdldWtAa2VybmVsLm9yZw0KPiA+Pj4+PiBDYzogbGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQNCj4gPj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MiAyLzJdIGYyZnM6IGZpeCBtaXNzaW5nIGlucGxhY2UgY291bnQgaW4NCj4gPj4+Pj4gb3Zlcndy
aXRlIHdpdGggZGlyZWN0IGlvDQo+ID4+Pj4+DQo+ID4+Pj4+IE9uIDIwMjEvOS8xNiAxOTozMCwg
RmVuZ25hbiBDaGFuZyB3cm90ZToNCj4gPj4+Pj4+IEZvciBub3csIG92ZXJ3cml0ZSBmaWxlIHdp
dGggZGlyZWN0IGlvIHVzZSBpbnBsYWNlIHBvbGljeSwgYnV0DQo+ID4+Pj4+PiBub3QgY291bnRl
ZCwgZml4IGl0LiBBbmQgdXNlIHN0YXRfYWRkX2lucGxhY2VfYmxvY2tzKHNiaSwgMSwgKQ0KPiA+
Pj4+Pj4gaW5zdGVhZCBvZiBzdGF0X2luY19pbnBsYWNlX2Jsb2NrcyhzYiwgKS4NCj4gPj4+Pj4+
DQo+ID4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBGZW5nbmFuIENoYW5nIDxjaGFuZ2ZlbmduYW5Adml2
by5jb20+DQo+ID4+Pj4+PiAtLS0NCj4gPj4+Pj4+ICAgICBmcy9mMmZzL2RhdGEuYyAgICB8IDcg
KysrKysrLQ0KPiA+Pj4+Pj4gICAgIGZzL2YyZnMvZjJmcy5oICAgIHwgOCArKysrLS0tLQ0KPiA+
Pj4+Pj4gICAgIGZzL2YyZnMvc2VnbWVudC5jIHwgMiArLQ0KPiA+Pj4+Pj4gICAgIDMgZmlsZXMg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gPj4+Pj4+DQo+ID4+
Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYyBpbmRleA0K
PiA+Pj4+Pj4gYzE0OTBiOWExMzQ1Li4wYzU3MjhkNjNjMzMgMTAwNjQ0DQo+ID4+Pj4+PiAtLS0g
YS9mcy9mMmZzL2RhdGEuYw0KPiA+Pj4+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMNCj4gPj4+Pj4+
IEBAIC0xNDkxLDYgKzE0OTEsOSBAQCBpbnQgZjJmc19tYXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAq
aW5vZGUsDQo+ID4+Pj4+PiBzdHJ1Y3QNCj4gPj4+Pj4gZjJmc19tYXBfYmxvY2tzICptYXAsDQo+
ID4+Pj4+PiAgICAgCQlpZiAoZmxhZyA9PSBGMkZTX0dFVF9CTE9DS19ESU8pDQo+ID4+Pj4+PiAg
ICAgCQkJZjJmc193YWl0X29uX2Jsb2NrX3dyaXRlYmFja19yYW5nZShpbm9kZSwNCj4gPj4+Pj4+
ICAgICAJCQkJCQltYXAtPm1fcGJsaywgbWFwLT5tX2xlbik7DQo+ID4+Pj4+PiArCQlpZiAoIWYy
ZnNfbGZzX21vZGUoc2JpKSAmJiBmbGFnID09IEYyRlNfR0VUX0JMT0NLX0RJTyAmJg0KPiA+Pj4+
Pj4gKwkJCQltYXAtPm1fbWF5X2NyZWF0ZSkNCj4gPj4+Pj4+ICsJCQlzdGF0X2FkZF9pbnBsYWNl
X2Jsb2NrcyhzYmksIG1hcC0+bV9sZW4sIHRydWUpOw0KPiA+Pj4+Pj4gICAgIAkJZ290byBvdXQ7
DQo+ID4+Pj4+PiAgICAgCX0NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBAQCAtMTU1Myw3ICsxNTU2LDkg
QEAgaW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLA0KPiA+Pj4+Pj4gc3Ry
dWN0DQo+ID4+Pj4+IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLA0KPiA+Pj4+Pj4gICAgIAkJCQlnb3Rv
IHN5bmNfb3V0Ow0KPiA+Pj4+Pj4gICAgIAkJCWJsa2FkZHIgPSBkbi5kYXRhX2Jsa2FkZHI7DQo+
ID4+Pj4+PiAgICAgCQkJc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FQUEVORF9XUklURSk7DQo+
ID4+Pj4+PiAtCQl9DQo+ID4+Pj4+PiArCQl9IGVsc2UgaWYgKCFjcmVhdGUgJiYgIWYyZnNfbGZz
X21vZGUoc2JpKSAmJiBmbGFnID09DQo+ID4+Pj4+IEYyRlNfR0VUX0JMT0NLX0RJTyAmJg0KPiA+
Pj4+Pj4gKwkJCQltYXAtPm1fbWF5X2NyZWF0ZSkNCj4gPj4+Pj4NCj4gPj4+Pj4gV2h5IG5vdA0K
PiA+Pj4+Pg0KPiA+Pj4+PiB9IGVsc2UgaWYgeyFmMmZzX2xmc19tb2RlKHNiaSkgJiYgZmxhZyA9
PSBGMkZTX0dFVF9CTE9DS19ESU8gJiYNCj4gPj4+Pj4gCQkJCQltYXAtPm1fbWF5X2NyZWF0ZSkN
Cj4gPj4+Pj4NCj4gPj4+Pg0KPiA+Pj4+IFlvdSBhcmUgcmlnaHQsIG5vIG5lZWQgdG8gY2hlY2sg
Y3JlYXRlIC4NCj4gPj4+Pg0KPiA+Pj4gVGhlcmUgaXMgYSBwcm9ibGVtIGhlcmUsIGlmIHJlbW92
ZSBjcmVhdGUgY2hlY2ssIHdoZW4gY3JlYXRlIGZpbGUNCj4gPj4+IGFuZCB3cml0ZSB3aXRoIGRp
cmVjdCBpbywgSXQgd2lsbCBjb3VudCBpbiBMRlMgYW5kIElQVSBib3RoLCBiZWNhdXNlDQo+ID4+
PiBwcmVhbGxvY2F0ZSBibG9jayBhZGRyIGZpcnN0LiBTbywgV2Ugc3RpbGwgbmVlZCBjaGVjayBj
cmVhdGUuDQo+ID4+PiBBbSBJIHJpZ2h0Pw0KPiA+Pg0KPiA+PiBDb3VsZCB5b3UgcGxlYXNlIGNo
ZWNrIGJlbG93IGNhc2Ugdy8geW91ciBvcmlnaW5hbCBwYXRjaDoNCj4gPj4NCj4gPj4geGZzX2lv
IC1mIGZpbGUgLWMgInB3cml0ZSAwIDhrIiAtYyAiZnN5bmMiDQo+ID4+IHhmc19pbyBmaWxlIC1j
ICJmcHVuY2ggMCA0ayINCj4gPj4geGZzX2lvICAtYyAib3BlbiAtZCBmaWxlIiAtYyAicHdyaXRl
IC1iIDRrIDAgOGsiDQo+ID4+DQo+ID4+IEl0IGFjY291bnRzIG9uIGJvdGggSVBVIGFuZCBMRlMg
c3RhdHMuDQo+ID4NCj4gPiBNeSBvcmlnaW4gcGF0Y2ggaXMgbmVlZCBjaGVjayBjcmVhdGU6DQo+
ID4gQEAgLTE1NTMsNyArMTU1Niw5IEBAIGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0IGlub2Rl
ICppbm9kZSwgc3RydWN0DQo+IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLA0KPiA+ICAgCQkJCWdvdG8g
c3luY19vdXQ7DQo+ID4gICAJCQlibGthZGRyID0gZG4uZGF0YV9ibGthZGRyOw0KPiA+ICAgCQkJ
c2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FQUEVORF9XUklURSk7DQo+ID4gLQkJfQ0KPiA+ICsJ
CX0gZWxzZSBpZiAoIWNyZWF0ZSAmJiAhZjJmc19sZnNfbW9kZShzYmkpICYmIGZsYWcgPT0NCj4g
RjJGU19HRVRfQkxPQ0tfRElPICYmDQo+ID4gKwkJCQltYXAtPm1fbWF5X2NyZWF0ZSkNCj4gPiAr
CQkJc3RhdF9hZGRfaW5wbGFjZV9ibG9ja3Moc2JpLCAxLCB0cnVlKTsNCj4gPg0KPiA+IEFuZCBi
ZWxvdyBjYXNlIGxvb2tzIGNvcnJlY3QsIFNvIEkgdGhpbmsgY2hlY2sgY3JlYXRlIGlzIG5lY2Vz
c2FyeS4NCj4gPg0KPiA+IHJvb3RAa3ZtLXhmc3Rlc3RzOi9tbnQvdGVzdCMgY2F0IC9zeXMva2Vy
bmVsL2RlYnVnL2YyZnMvc3RhdHVzIHxncmVwDQo+ID4gU1NSIC1DIDMNCj4gPg0KPiA+ICAgICAg
ICAgICAgIGJ1ZmZlciAgICAgZGlyZWN0ICAgc2VnbWVudHMNCj4gPiBJUFU6ICAgICAgICAgICAg
MCAgICAgICAgICAwICAgICAgICBOL0ENCj4gPiBTU1I6ICAgICAgICAgICAgMCAgICAgICAgICAw
ICAgICAgICAgIDANCj4gPiBMRlM6ICAgICAgICAgIDU0MiAgICAgICAgICAwICAgICAgICAgIDEN
Cj4gPg0KPiA+IEJERjogOTksIGF2Zy4gdmJsb2NrczogNDg4DQo+ID4gcm9vdEBrdm0teGZzdGVz
dHM6L21udC90ZXN0IyB4ZnNfaW8gLWYgZmlsZSAtYyAicHdyaXRlIDAgOGsiIC1jICJmc3luYyIN
Cj4gPiB3cm90ZSA4MTkyLzgxOTIgYnl0ZXMgYXQgb2Zmc2V0IDANCj4gPiA4IEtpQiwgMiBvcHM7
IDAuMDA3OCBzZWMgKDEwMTQuMDcwIEtpQi9zZWMgYW5kIDI1My41MTc2IG9wcy9zZWMpDQo+ID4g
cm9vdEBrdm0teGZzdGVzdHM6L21udC90ZXN0IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvZjJmcy9z
dGF0dXMgfGdyZXANCj4gPiBTU1IgLUMgMw0KPiA+DQo+ID4gICAgICAgICAgICAgYnVmZmVyICAg
ICBkaXJlY3QgICBzZWdtZW50cw0KPiA+IElQVTogICAgICAgICAgICAwICAgICAgICAgIDAgICAg
ICAgIE4vQQ0KPiA+IFNTUjogICAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMA0KPiA+
IExGUzogICAgICAgICAgNTQ1ICAgICAgICAgIDAgICAgICAgICAgMQ0KPiA+DQo+ID4gQkRGOiA5
OSwgYXZnLiB2YmxvY2tzOiA0ODgNCj4gPiByb290QGt2bS14ZnN0ZXN0czovbW50L3Rlc3QjIHhm
c19pbyBmaWxlIC1jICJmcHVuY2ggMCA0ayINCj4gPiByb290QGt2bS14ZnN0ZXN0czovbW50L3Rl
c3QjIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9mMmZzL3N0YXR1cyB8Z3JlcA0KPiA+IFNTUiAtQyAz
DQo+ID4NCj4gPiAgICAgICAgICAgICBidWZmZXIgICAgIGRpcmVjdCAgIHNlZ21lbnRzDQo+ID4g
SVBVOiAgICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgTi9BDQo+ID4gU1NSOiAgICAgICAg
ICAgIDAgICAgICAgICAgMCAgICAgICAgICAwDQo+ID4gTEZTOiAgICAgICAgICA1NDUgICAgICAg
ICAgMCAgICAgICAgICAxDQo+ID4NCj4gPiBCREY6IDk5LCBhdmcuIHZibG9ja3M6IDQ4OA0KPiA+
IHJvb3RAa3ZtLXhmc3Rlc3RzOi9tbnQvdGVzdCMgeGZzX2lvICAtYyAib3BlbiAtZCBmaWxlIiAt
YyAicHdyaXRlIC1iIDRrIDANCj4gOGsiDQo+ID4gd3JvdGUgODE5Mi84MTkyIGJ5dGVzIGF0IG9m
ZnNldCAwDQo+ID4gOCBLaUIsIDIgb3BzOyAwLjAzMjIgc2VjICgyNDguMTg1IEtpQi9zZWMgYW5k
IDYyLjA0NjMgb3BzL3NlYykNCj4gPiByb290QGt2bS14ZnN0ZXN0czovbW50L3Rlc3QjIGNhdCAv
c3lzL2tlcm5lbC9kZWJ1Zy9mMmZzL3N0YXR1cyB8Z3JlcA0KPiA+IFNTUiAtQyAzDQo+ID4NCj4g
PiAgICAgICAgICAgICBidWZmZXIgICAgIGRpcmVjdCAgIHNlZ21lbnRzDQo+ID4gSVBVOiAgICAg
ICAgICAgIDAgICAgICAgICAgMiAgICAgICAgTi9BDQo+ID4gU1NSOiAgICAgICAgICAgIDAgICAg
ICAgICAgMCAgICAgICAgICAwDQo+ID4gTEZTOiAgICAgICAgICA1NDUgICAgICAgICAgMSAgICAg
ICAgICAxDQo+IA0KPiBTaG91bGRuJ3QgdGhpcyBiZSBJUFU6IDEgYW5kIExGUzogMT8gZHVlIHRv
IFswLCA0a10gd2FzIGEgaG9sZSwgYW5kIFs0aywgOGtdDQo+IG1hcHBlZCB0byBhIHZhbGlkIGJs
a2FkZHIuDQo+IA0KDQpZZXMsIHlvdSBhcmUgcmlnaHQsIHdlIHNob3VsZCBjaGVjayBibGthZGRy
IGlzIHZhbGlkIHdoZW4gcGh5c2ljYWwgYmxvY2sgY2FuIGZvdW5kIGluIGV4dGVudCBjYWNoZS4N
Cg0KVGhhbmtzLg0KDQo+IFRoYW5rcywNCj4gDQo+ID4NCj4gPiBCREY6IDk5LCBhdmcuIHZibG9j
a3M6IDQ4OA0KPiA+DQo+ID4NCj4gPj4NCj4gPj4gVGhhbmtzLA0KPiA+Pg0KPiA+Pj4NCj4gPj4+
IFRoYW5rcy4NCj4gPj4+DQo+ID4+Pj4gVGhhbmtzLg0KPiA+Pj4+PiBUaGFua3MsDQo+ID4+Pj4+
DQo+ID4+Pj4+PiArCQkJc3RhdF9hZGRfaW5wbGFjZV9ibG9ja3Moc2JpLCAxLCB0cnVlKTsNCj4g
Pj4+Pj4+ICAgICAJfSBlbHNlIHsNCj4gPj4+Pj4+ICAgICAJCWlmIChjcmVhdGUpIHsNCj4gPj4+
Pj4+ICAgICAJCQlpZiAodW5saWtlbHkoZjJmc19jcF9lcnJvcihzYmkpKSkgeyBkaWZmIC0tZ2l0
DQo+ID4+Pj4+PiBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmggaW5kZXgNCj4gPj4+
Pj4+IDNkNGVlNDQ0ZGIyNy4uMmQ4MWU5ZjBhMGVlDQo+ID4+Pj4+PiAxMDA2NDQNCj4gPj4+Pj4+
IC0tLSBhL2ZzL2YyZnMvZjJmcy5oDQo+ID4+Pj4+PiArKysgYi9mcy9mMmZzL2YyZnMuaA0KPiA+
Pj4+Pj4gQEAgLTM3ODUsMTIgKzM3ODUsMTIgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgZjJmc19z
dGF0X2luZm8NCj4gPj4+Pj4gKkYyRlNfU1RBVChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpDQo+
ID4+Pj4+PiAgICAgCQllbHNlCQkJCQkJCQlcDQo+ID4+Pj4+PiAgICAgCQkJKChzYmkpLT5ibG9j
a19jb3VudFsxXVsoY3Vyc2VnKS0+YWxsb2NfdHlwZV0rKyk7CVwNCj4gPj4+Pj4+ICAgICAJfSB3
aGlsZSAoMCkNCj4gPj4+Pj4+IC0jZGVmaW5lIHN0YXRfaW5jX2lucGxhY2VfYmxvY2tzKHNiaSwg
ZGlyZWN0X2lvKQ0KPiAJXA0KPiA+Pj4+Pj4gKyNkZWZpbmUgc3RhdF9hZGRfaW5wbGFjZV9ibG9j
a3Moc2JpLCBjb3VudCwgZGlyZWN0X2lvKQkJCVwNCj4gPj4+Pj4+ICAgICAJZG8gewkJCQkJCQkJ
XA0KPiA+Pj4+Pj4gICAgIAkJaWYgKGRpcmVjdF9pbykJCQkJCQlcDQo+ID4+Pj4+PiAtCQkJKGF0
b21pY19pbmMoJihzYmkpLT5pbnBsYWNlX2NvdW50WzBdKSk7CQlcDQo+ID4+Pj4+PiArCQkJKGF0
b21pY19hZGQoY291bnQsICYoc2JpKS0+aW5wbGFjZV9jb3VudFswXSkpOyAgXA0KPiA+Pj4+Pj4g
ICAgIAkJZWxzZQkJCQkJCQkJXA0KPiA+Pj4+Pj4gLQkJCShhdG9taWNfaW5jKCYoc2JpKS0+aW5w
bGFjZV9jb3VudFsxXSkpOwkJXA0KPiA+Pj4+Pj4gKwkJCShhdG9taWNfYWRkKGNvdW50LCAmKHNi
aSktPmlucGxhY2VfY291bnRbMV0pKTsJXA0KPiA+Pj4+Pj4gICAgIAl9IHdoaWxlICgwKQ0KPiA+
Pj4+Pj4gICAgICNkZWZpbmUgc3RhdF91cGRhdGVfbWF4X2F0b21pY193cml0ZShpbm9kZSkNCj4g
CVwNCj4gPj4+Pj4+ICAgICAJZG8gewkJCQkJCQkJXA0KPiA+Pj4+Pj4gQEAgLTM4NzcsNyArMzg3
Nyw3IEBAIHZvaWQgZjJmc191cGRhdGVfc2l0X2luZm8oc3RydWN0DQo+ID4+Pj4+PiBmMmZzX3Ni
X2luZm8NCj4gPj4+Pj4gKnNiaSk7DQo+ID4+Pj4+PiAgICAgI2RlZmluZSBzdGF0X2luY19tZXRh
X2NvdW50KHNiaSwgYmxrYWRkcikJCWRvIHsgfSB3aGlsZQ0KPiAoMCkNCj4gPj4+Pj4+ICAgICAj
ZGVmaW5lIHN0YXRfaW5jX3NlZ190eXBlKHNiaSwgY3Vyc2VnKQkJCWRvIHsgfSB3aGlsZQ0KPiAo
MCkNCj4gPj4+Pj4+ICAgICAjZGVmaW5lIHN0YXRfaW5jX2Jsb2NrX2NvdW50KHNiaSwgY3Vyc2Vn
KQkJZG8geyB9IHdoaWxlICgwKQ0KPiA+Pj4+Pj4gLSNkZWZpbmUgc3RhdF9pbmNfaW5wbGFjZV9i
bG9ja3Moc2JpKQkJCWRvIHsgfSB3aGlsZSAoMCkNCj4gPj4+Pj4+ICsjZGVmaW5lIHN0YXRfYWRk
X2lucGxhY2VfYmxvY2tzKHNiaSwgY291bnQsIGRpcmVjdF9pbykJCWRvIHsgfQ0KPiA+PiB3aGls
ZQ0KPiA+Pj4+PiAoMCkNCj4gPj4+Pj4+ICAgICAjZGVmaW5lIHN0YXRfaW5jX3NlZ19jb3VudChz
YmksIHR5cGUsIGdjX3R5cGUpCQlkbyB7IH0gd2hpbGUNCj4gPj4gKDApDQo+ID4+Pj4+PiAgICAg
I2RlZmluZSBzdGF0X2luY190b3RfYmxrX2NvdW50KHNpLCBibGtzKQkJZG8geyB9IHdoaWxlICgw
KQ0KPiA+Pj4+Pj4gICAgICNkZWZpbmUgc3RhdF9pbmNfZGF0YV9ibGtfY291bnQoc2JpLCBibGtz
LCBnY190eXBlKQlkbyB7IH0gd2hpbGUNCj4gPj4gKDApDQo+ID4+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYyBpbmRleA0KPiA+Pj4+Pj4gZGVk
NzQ0ZTg4MGQwLi5jNTQyYzRiNjg3Y2EgMTAwNjQ0DQo+ID4+Pj4+PiAtLS0gYS9mcy9mMmZzL3Nl
Z21lbnQuYw0KPiA+Pj4+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMNCj4gPj4+Pj4+IEBAIC0z
NjExLDcgKzM2MTEsNyBAQCBpbnQgZjJmc19pbnBsYWNlX3dyaXRlX2RhdGEoc3RydWN0DQo+ID4+
Pj4+PiBmMmZzX2lvX2luZm8NCj4gPj4+Pj4gKmZpbykNCj4gPj4+Pj4+ICAgICAJCWdvdG8gZHJv
cF9iaW87DQo+ID4+Pj4+PiAgICAgCX0NCj4gPj4+Pj4+DQo+ID4+Pj4+PiAtCXN0YXRfaW5jX2lu
cGxhY2VfYmxvY2tzKGZpby0+c2JpLCBmYWxzZSk7DQo+ID4+Pj4+PiArCXN0YXRfYWRkX2lucGxh
Y2VfYmxvY2tzKHNiaSwgMSwgZmFsc2UpOw0KPiA+Pj4+Pj4NCj4gPj4+Pj4+ICAgICAJaWYgKGZp
by0+YmlvICYmICEoU01fSShzYmkpLT5pcHVfcG9saWN5ICYgKDEgPDwNCj4gPj4+PiBGMkZTX0lQ
VV9OT0NBQ0hFKSkpDQo+ID4+Pj4+PiAgICAgCQllcnIgPSBmMmZzX21lcmdlX3BhZ2VfYmlvKGZp
byk7DQo+ID4+Pj4+Pg0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
