Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3506E47FB1D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Dec 2021 09:39:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n1lXs-0008Lx-Bn; Mon, 27 Dec 2021 08:39:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1n1lXq-0008LK-RI
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Dec 2021 08:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Oh8nYXW10QSOf3Ik2EQnQfPufp0eJIZmM8KNCRlX1Rg=; b=KL58WHcqeIdDNzz/sMTSc6rUGb
 WeWE957fgdziNdcTb1TyvvusjoO6CA9t0ygus5IMptsNMYci7R2n9jE9skCvQbE8lfVdwIcAZPK6L
 chSemJaSZXT9GaiYnMQ/uHnHY6tAfimd6TtM5LAjoY9E+Og+yGn/6+Fl4/cgeOHIQHWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Oh8nYXW10QSOf3Ik2EQnQfPufp0eJIZmM8KNCRlX1Rg=; b=VNbZx/UXtex8sNk5HY6yhtDqlH
 XUXKKXntynAVL89x3jERfdgwvxNOm5UlaZqmsCm1u/skFSzhYhgtIWbshW3+ibb3pnzWS6fbc7FtN
 NC3untURSG/KnDahzaBnSGWXwD9WOWiig/Yy1NiMmZ4lxJsiDFcT27QANaFiYJrNi11U=;
Received: from mail-eopbgr1300124.outbound.protection.outlook.com
 ([40.107.130.124] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n1lXm-0005f1-UT
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Dec 2021 08:39:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CCwSqHrGzNyI52pfokPgUmpLYuEwT25gOISTUDvOY6uZatV0R//IRSiorOfVV8UetTR8jB9oxBDp6sSjKNj7arzNOKo9OPrpkqUWN/g5OAlq7PUAS9QNrFKWGNli+duCIx/nekC5uwUVTeDs00to61GmpyS/vPAjpXYVW9OigZI/WcXCO2SNtDiqDmJwlerCCHHK5uwV7PHhuZ1oj1D/s14tO8hCy5NRwPIX6OQuWhRYkJC39cOJcRK4rl8XQ3qMXMG0MYeIbvcKm99jPGLAHgE4sUQiqQwn04XhuL3i2a/0HWiwCWFaC4aWXo0dbLVwv+4S5sVlQM1SpTIvD5BzwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oh8nYXW10QSOf3Ik2EQnQfPufp0eJIZmM8KNCRlX1Rg=;
 b=mf2yRtvlCmHKH6JC1bG01G6oCUCEnxdbvZ2m46EEjy7MqOMo7jZ8080pTHPgEEFZDrtb0vOUVM/aTqulzzw6GR1d3WG9f/R3B5fT7RUzUjfW+51vI48xUk5Vd7V+btHfuZ8I6XsbULX/4kgNQnwoWd2Y5vrB7g6BsLXnQ3JaIcg6sv7LLaUv47ZYfH3rRwO9w/6CSXMnBgS0uY+2piZrIi7aypC8/z6bQPPhpP3CBFknmPmLoYGEypRHha2K2slruaAdmZOEhMWoEmaIuYxxx57cud3tZBc1ORTCZHR5sbJds8dtcJuXZ3KzTqSqrjMP3fLOMBVmQSnsj/NkiYfLHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oh8nYXW10QSOf3Ik2EQnQfPufp0eJIZmM8KNCRlX1Rg=;
 b=NXzBRVGJkWYv/wRX4XE+vutiUaOp+B97ip7crkmAAzOrjNA+cZHEIiT8zb3thBtGKVFwHA11Coki75++gfegBq358ihrsiXMAhKkLrZtONRXu/DiGgqt8pGLGTj+1ohxrijeYDKTaQaU4GhUDXy4QGi1KnBVohp2Sh4NwrYKlZc=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB4259.apcprd06.prod.outlook.com (2603:1096:820:66::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17; Mon, 27 Dec
 2021 08:39:37 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::3422:d7b:74de:51a7]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::3422:d7b:74de:51a7%9]) with mapi id 15.20.4823.022; Mon, 27 Dec 2021
 08:39:36 +0000
From: =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH] f2fs: remove redunant invalidate compress pages
Thread-Index: AQHX7/+tiRoTXJt3SkWX4Un7LLQUFKw8Wf2QgAm4goCAAAfzEA==
Date: Mon, 27 Dec 2021 08:39:36 +0000
Message-ID: <KL1PR0601MB4003FD42CA16D4E06522C3D6BB429@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20211213085857.8554-1-changfengnan@vivo.com>
 <KL1PR0601MB4003AE5E6A8449368F3290BBBB7C9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <ALcAxAD2E83dq*nz4YDAgqre.9.1640592660011.Hmail.changfengnan@vivo.com.@PDQwZTYwNGRlLWM1OWEtYjRlOC02MjY2LTk5YmQzYWRkZTVmZkBrZXJuZWwub3JnPg==>
In-Reply-To: <ALcAxAD2E83dq*nz4YDAgqre.9.1640592660011.Hmail.changfengnan@vivo.com.@PDQwZTYwNGRlLWM1OWEtYjRlOC02MjY2LTk5YmQzYWRkZTVmZkBrZXJuZWwub3JnPg==>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ff4a5dc-c991-4148-75b5-08d9c9146a2f
x-ms-traffictypediagnostic: KL1PR0601MB4259:EE_
x-microsoft-antispam-prvs: <KL1PR0601MB425982936154680A32006B58BB429@KL1PR0601MB4259.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 826PAmT1q6T3SRMm8G7TuGmmTysbYRHN6UlK1KQpTyJq9dUMTFsijKxKaEZ8nUCvkDDrLsP92ZprDvekFEUIk8NN6/+s2GUgzq3hf3d65FLgajB3rz0FfsOfkIdJwevIJU+9l+MF1voOHLVLCwNoLu1H0nu/W+B5tYRzGP8P0PjzNIRzGKFUVW+m43Mc5+WJLXmSUQRyVO5QeNJyFA8IMwVOe1J5NdXN8Dy/5FtQC/lZNQCED8aYdG1Z8Vka6nI2xgkOTqDQfDpAXMB+vVsgk7jiJZuMLROLRxClVyYhWGX2ynVngsfGejTcJiYqyC1fJZ80h1XNorec1zfSjIiujXb8sDnO4kY7UL/89OSBliyCC7y+/dydcuPwWqV1oHGWmXcHTEatCFvmFEweELzqVENqsazb1LiKB8BsxHrx/sT/VRZL7FAunyOQob517Vr4dpXgSSzLmhVWkx5U53Uy9vNXfDwCvQledZtDxvhMKvMA2/I7WKV4aDJLv4v/lit0RwY3kTopUGURatWbZl6zBhpVGJoX3uLp91SLeVGQXOmQSLjNXlVZ09hU2ZiFIkjCJ+l8mxL2eMbs5LEc7sAjW5Zw4vHGtHnS02UtdNqQBzzTMjR2P/KhCHPGBiuiFw0aTwzrXl2a5XUvLpVqX6idjqHKR2wLl22bDJ76xvCBCIdc4d5IPPG3Dgkf/POO1lHnb3NX8mIE1UGiHPTeADcM/jdcoxNrOVhyBKdu7lRO1n1IPXNqJjqtgpugGV+/yBar8EfYIt+VKW9eYeuCQvs2UMoXB4jzGpP5fuQEvi0h3KM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(85182001)(110136005)(966005)(66446008)(83380400001)(66946007)(316002)(8936002)(66556008)(6506007)(7696005)(122000001)(52536014)(2906002)(4326008)(76116006)(53546011)(38100700002)(33656002)(66476007)(26005)(55016003)(508600001)(9686003)(38070700005)(186003)(71200400001)(86362001)(64756008)(5660300002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUFBQncyRDlUNGYySVNGaVFpam5Na3psUnZyQVl5RzJWQzNJUEZ6NTk1VXN5?=
 =?utf-8?B?dUVZNG1aREJZeHdJRVJzc0NuVjBFTitjenFuYm1mYWtqZUk2dHNuMkhGbzJs?=
 =?utf-8?B?cXB5REFpcmd1UDc2Y3lXMmlNajhtaWZnd2JUT2RTTjk1VUFkYW5LZzFrTTdz?=
 =?utf-8?B?Z29BVUpNdHJGcWorRktBUlIvVWhGVHdIRlV0bXFoaHZYbTNxQkp0cTUwK0NM?=
 =?utf-8?B?a1hPazdxRm55a0hvUW0rSS8ybW1xbCs4bU1UWGdiV3FiRWZwMEkrdFh2Qkp0?=
 =?utf-8?B?Y0svMXg3a3VXZGpuUWd6M1I0U0oyangvRDNrQUI1Z1JoV21qTDFRQXBjenQz?=
 =?utf-8?B?bWNnTEo3OFQzbkZGMzBTcjBmUmE2VEdPOVVibnhDVHVnT0tYQ2NIaXhpUnhE?=
 =?utf-8?B?VytwZVJraG9icXM2OUl3cTFpZ0d4MGh0bER3V1FWVDVkU0RuY09jSTdHeDBr?=
 =?utf-8?B?S2cyQmg2UzFMSDd0Q2dwNXVBM0NQZitYUGRCazc0cEp1ZDIzelpyLzA1ODBJ?=
 =?utf-8?B?dlFnRW5jM3o4dmZwNUhzczBYWGVqeUswTWl3SVVlYWlSYjFrL1BnRDJmTnB2?=
 =?utf-8?B?amlsVm5qeVNNYnZYWkFndGFnQXB5NHFVWFAyMTUrRHUyWE1mQ2g1Tm5xQkdR?=
 =?utf-8?B?R0Juc1JBeW1HSmlRL2F4SXlmeTY0SkZKckwxR3VBVGJEWThydDlyME9IVHIy?=
 =?utf-8?B?ZHBQWUJiS1FybGtlb2tSTlU4NzNudXBoL2ZjRDhrdm4zNXVOTE9FdTZNa1Zs?=
 =?utf-8?B?L1VYWGVnWG1KYXFoVGxZMjlaekpwSnJnMDVWTnRBeHVzUWVwcGNEaTJqcE84?=
 =?utf-8?B?WWVzMXVWMmNCSFIxdisyZkdLNlhaUkxTRUh0MDBheU1xN2M0REtySngycU0z?=
 =?utf-8?B?ZEkzcnpRT3JPZjVzUDJCNVdXMWdiQWdFTEozbnVIb1NTMVdqLzY3Q1NBK0wr?=
 =?utf-8?B?UlhqaU1xd2tlMFgyOFVORWNycnoxbmF2T1JIai9UNWhYZDNYMEhGZFlwN2ZL?=
 =?utf-8?B?cWw2VXcwVTZFWEZaamovd3pJNUpkelM0TUpqcm4yNW5yNEJZREFnM25LWjNs?=
 =?utf-8?B?cmdkU0ZaRWVPejJ2V2w1bW81elJtTzRTOTg2bnBmbDJ3em1qUjNucEh0MFBY?=
 =?utf-8?B?cVBrQmZUT1hJS3hYLzNkNlU1dFZBa3gzMytMSkpSTngyVlNXcjhiZTRuSjR0?=
 =?utf-8?B?OGFHTkNlUlo0NVpEMDNRbUpCNWNEY2dNTG9PUTNYNHlkNzAvQ1hBR212SjFl?=
 =?utf-8?B?OUhYR0xMUHZDOU5Ndmh1R0pDNzN1NUNHWjBEMnNscHdpa2VFSzcrS3paNjZk?=
 =?utf-8?B?WlY3aFJLRHhPeDVobFB3S3ZxRXdjNEVWNkJia29hNnpCOUErdWczOG5OMlhX?=
 =?utf-8?B?bWFPa2xzTDBUZW5RYW45cGhuMEpsb3hVaTgrWVBGVGo3UHBqUmFvWmhRbkkx?=
 =?utf-8?B?OEROMlpldENHUWRxVGQyVXdQdWZQUzZlMVdVSTJTYU9iMG5RS25PT2puSnJY?=
 =?utf-8?B?cFJ6UCtEY1QwTnhZZEQvMnJ3ZnhmRUU3NFluaGlJZSt4d1BkUHZwMHA0Mkd4?=
 =?utf-8?B?aDdQODVqMEU1clB2VEd5ODhzaEMzVjhjMUt3QXBidFZpMDBRdVhpaVlPeFBY?=
 =?utf-8?B?SGx5U0h5V1lvV1l4WDNubnpCWEc2S0NSRGF4aTQ5YjhPZ1R2dWRhYlpaNDFw?=
 =?utf-8?B?eFY1WFRxdmdGRFEwTlE1NUpBVlZZK1djMk53M1IvaEJGTlY0UlBzVklRVStw?=
 =?utf-8?B?VmgrTGVBaXNZMFp2eGVFMlIxN0VHWjlPUEFtOVkvbXpiSjk4MklxTVpxSE5o?=
 =?utf-8?B?cWIrVnEwVWg4amlHZ3lSeWsydTMyRm12YmRUTFFESllNSUtjNExiRS8xTC9P?=
 =?utf-8?B?MzhHNU5FNzZsUUdoMGRFTmkvM2g1Ry9PaGtxVVBnN1VyL2wzSGJMaGM0VFNj?=
 =?utf-8?B?dUZId3J0bDBSSnJXWmNPK1Rxc0lxRXJibzFmcmtuZjRvRnJBMzhVclVWWlpU?=
 =?utf-8?B?VExCeXFOeHYwRFh2Zm9NOGwzZFkzUEh6RUtXNFFwUitjQkk5RXFjM3M5KzV5?=
 =?utf-8?B?Y3BiNmRDSUFtaU1EUms4V0E5bk1SV3VLVUc3ZEpja1NuRGQvMFp6T2J6blBr?=
 =?utf-8?B?b0JxSzU5Yzc4K1o2Y3p6d2JPdVBQdVdWMEtIWHZwc2ZZM2dod2JiOUhsU3Z2?=
 =?utf-8?Q?sAfl9svqUjgDAfHFZKNnq+Q=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff4a5dc-c991-4148-75b5-08d9c9146a2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2021 08:39:36.5160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: svewMAVnMzrbbAQxyZ3QMiUmCTDFWl0AV0pwUc3Z/HBGMrE+0vBpR+j6ZJmRd3fIAjUsTlRpDS+3I2feL+byXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4259
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
 [40.107.130.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.130.124 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1n1lXm-0005f1-UT
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogY2hhbmdmZW5nbmFuQHZp
dm8uY29tIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+IE9uIEJlaGFsZiBPZiBDaGFvDQo+IFl1DQo+
IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgMjcsIDIwMjEgNDoxMSBQTQ0KPiBUbzog5bi45Yek5qWg
IDxjaGFuZ2ZlbmduYW5Adml2by5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hd
IGYyZnM6IHJlbW92ZSByZWR1bmFudCBpbnZhbGlkYXRlIGNvbXByZXNzIHBhZ2VzDQo+IA0KPiBP
biAyMDIxLzEyLzIxIDExOjU5LCDluLjlh6TmpaAgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IOW4uOWHpOaloA0KPiA+PiBTZW50OiBNb25kYXksIERl
Y2VtYmVyIDEzLCAyMDIxIDQ6NTkgUE0NCj4gPj4gVG86IGphZWdldWtAa2VybmVsLm9yZzsgY2hh
b0BrZXJuZWwub3JnDQo+ID4+IENjOiBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldDsg5bi45Yek5qWgDQo+ID4+IDxjaGFuZ2ZlbmduYW5Adml2by5jb20+DQo+ID4+IFN1Ympl
Y3Q6IFtQQVRDSF0gZjJmczogcmVtb3ZlIHJlZHVuYW50IGludmFsaWRhdGUgY29tcHJlc3MgcGFn
ZXMNCj4gPj4NCj4gPj4gQ29tcHJlc3MgcGFnZSB3aWxsIGludmFsaWRhdGUgaW4gdHJ1bmNhdGUg
YmxvY2sgcHJvY2VzcyB0b28sIHNvDQo+ID4+IHJlbW92ZSByZWR1bmFudCBpbnZhbGlkYXRlIGNv
bXByZXNzIHBhZ2VzIGluIGYyZnNfZXZpY3RfaW5vZGUuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYt
Ynk6IEZlbmduYW4gQ2hhbmcgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4NCj4gPj4gLS0tDQo+ID4+
ICAgZnMvZjJmcy9pbm9kZS5jIHwgMyAtLS0NCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxl
dGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvaW5vZGUuYyBiL2ZzL2Yy
ZnMvaW5vZGUuYyBpbmRleA0KPiA+PiA5MzUwMTZlNTYwMTAuLjU5NTI3MDY0NmQ2OQ0KPiA+PiAx
MDA2NDQNCj4gPj4gLS0tIGEvZnMvZjJmcy9pbm9kZS5jDQo+ID4+ICsrKyBiL2ZzL2YyZnMvaW5v
ZGUuYw0KPiA+PiBAQCAtNzUxLDkgKzc1MSw2IEBAIHZvaWQgZjJmc19ldmljdF9pbm9kZShzdHJ1
Y3QgaW5vZGUgKmlub2RlKQ0KPiA+PiAgIAl0cmFjZV9mMmZzX2V2aWN0X2lub2RlKGlub2RlKTsN
Cj4gPj4gICAJdHJ1bmNhdGVfaW5vZGVfcGFnZXNfZmluYWwoJmlub2RlLT5pX2RhdGEpOw0KPiA+
Pg0KPiA+PiAtCWlmICh0ZXN0X29wdChzYmksIENPTVBSRVNTX0NBQ0hFKSAmJiBmMmZzX2NvbXBy
ZXNzZWRfZmlsZShpbm9kZSkpDQo+ID4+IC0JCWYyZnNfaW52YWxpZGF0ZV9jb21wcmVzc19wYWdl
cyhzYmksIGlub2RlLT5pX2lubyk7DQo+ID4+IC0NCj4gPg0KPiA+IEhpIEphZWdldWssIGNoYW86
DQo+ID4gQWZ0ZXINCj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9qYWVnZXVrL2YyZnMuZ2l0L2NvbW1pDQo+ID4gdC8/aD1kZXYmaWQ9NjYyZjZhY2Ri
MDEzNmRmZGEzZDA1NWYwMDA4NmUyYzhlZDVjOGJmYw0KPiA+IEkgdGhpbmsgdGhpcyBwYXRjaCBz
dGlsbCBuZWNlc3NhcnksIGl0IGNvdWxkIHNwZWVkIHVwIGV2aWN0IGlub2RlLg0KPiBmMmZzX2lu
dmFsaWRhdGVfY29tcHJlc3NfcGFnZXMgZmluZCBhbGwgcGFnZXMgYW5kIGNvbXBhcmUgdG8gZGVj
aWRlIHdoaWNoDQo+IHBhZ2VzIG5lZWQgaW52YWxpZGF0ZSwgaWYgdGhlcmUgYXJlIG1hbnkgY29t
cHJlc3NlZCBmaWxlIGNhY2hlZCwgaXQgbWF5IG5lZWQNCj4gbXVjaCB0aW1lLiBBbmQgaW4gbGF0
ZXIgdHJ1bmNhdGUgYmxvY2sgd2lsbCBpbnZhbGlkYXRlIHBhZ2Ugb25lIGJ5IG9uZSwgdGhpcyBt
YXkNCj4gbW9yZSBlZmZlY3RpdmUuDQo+IA0KPiBXZWxsLCBmb3IgdGhlIGNhc2UgaW5vZGUgaGFz
IG5vbi16ZXJvIG5saW5rIHZhbHVlLCBpdCBuZWVkcyB0byBpbnZhbGlkYXRlDQo+IGNvbXByZXNz
ZWQgcGFnZXMgYWZ0ZXIgdHJ1bmNhdGVfaW5vZGVfcGFnZXNfZmluYWwoKSwgb3RoZXJ3aXNlIHJl
bGF0ZWQNCj4gY29tcHJlc3NlZCBwYWdlcyBtYXkgYmUgbGVmdCBpbiBtZW1vcnkgYWZ0ZXIgaW5v
ZGUgd2FzIGV2aWN0ZWQuDQpBZ3JlZSwgSSdsbCBzZW5kIGEgbmV3IHZlcnNpb24uDQo+IA0KPiBo
dHRwczovL3d3dy5hbnN5bWJvbC5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9mcy9mMmZzL2lub2Rl
LmMjTDc1NA0KPiANCj4gVGhhbmtzLA0KPiANCj4gPg0KPiA+PiAgIAlpZiAoaW5vZGUtPmlfaW5v
ID09IEYyRlNfTk9ERV9JTk8oc2JpKSB8fA0KPiA+PiAgIAkJCWlub2RlLT5pX2lubyA9PSBGMkZT
X01FVEFfSU5PKHNiaSkgfHwNCj4gPj4gICAJCQlpbm9kZS0+aV9pbm8gPT0gRjJGU19DT01QUkVT
U19JTk8oc2JpKSkNCj4gPj4gLS0NCj4gPj4gMi4zMi4wDQo+ID4NCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
