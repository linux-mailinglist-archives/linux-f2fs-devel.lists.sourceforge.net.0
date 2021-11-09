Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 398D544A468
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Nov 2021 03:00:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mkGRG-0001Jp-R0; Tue, 09 Nov 2021 02:00:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mkGRD-0001Jj-OX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 02:00:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kJvD/GcB8nCdydz2rTciGhvlbLHtyXfT++TTeI9l5Eg=; b=Wmep5gn1JVwAWOGjEpJk6ChPiA
 ktNdZefrsDeVL8SCIQAdxCNZmp+531h9x9m7wToiGDKulUG36r5eJSp/GkbLuXo0cZHVVvV3lqZw8
 8N/9GtOpc0gXMw8nx1FuDxUHeBbNZdY8bgXuvfKcH2qIqNIIVYT+P6AkhKXo/qx98g2w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kJvD/GcB8nCdydz2rTciGhvlbLHtyXfT++TTeI9l5Eg=; b=QdZgyvVLK5IOD80rxHIujiUrlK
 0BiMrCH74N9XM49HXevzO/lq4WgVmlDQv6Z+GPUqEdeJsytOtOQaggAXRRHIevTy77EmmNaQt6kw2
 DKBFTm724+fxpniJaoSZyti/nVOVXykp4U55hWpbpaGcewuilqD5PxtchNe4X2eRthKc=;
Received: from mail-eopbgr1320129.outbound.protection.outlook.com
 ([40.107.132.129] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mkGRA-0002hS-LG
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 02:00:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwXKIakcTfHz/Gzs82df+uDnX7EpcRqbvNfBNeozyX00DkprdcTKNo3BVcAbZXMaFm+j0kukeZRTH3l55e7ru/oFRtnyAdhGGnY5tBpPV1h16W1Bz+W4uNDzl+AdbTdmM7OGNSqKTqznF1AmWYU/Ck+SCVLtIRHVU+6sa7AGe1j3CeBuAwcEwPJ/pMv0ofplUTWpr9KXmfuimonxZG7zTMrXObOWkJrZ6sZtFYyGVgqDH7iUh7lCK9nphdtaagaEqLJHNl1qLuoWYcU3nHaBS9Ez38L2Yvbv3s2gpbUXfjx2PAL9Nso4FNvnYXAhgr4z1NCKLAHfC38VZC9M5PwFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJvD/GcB8nCdydz2rTciGhvlbLHtyXfT++TTeI9l5Eg=;
 b=cjaJfOWvXANHmg0ip73oOH5DeTd3ZTNLMZ0zwh1l7ftb1IyJs7O8lRUofIYkE6/CAr3tRHr2UlptKEnReQrk/7sbxNz9ZR40i/rwFdDjNxjW46Tq4wc5McVaoIKzi26kc6iq8vTzUjG1gmj5w1Taa3iX1zRxBkoEzdaPbUe/omViGXDyMsS1g8f6hKL8hr5Q3SfjwE83fs+zhTORNBEj4o3n+GSowNvIg0ZwpTOxNX9JIPnTSVsLHfQ0CExlWt6zrgOMizPyeVWjZevO0g5GmWBgdhq1kk+OlKoJ6wdE1kYESLbow02bjivQ6KVAAABQb2pFb7cFY3wJLPB5KHx3nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJvD/GcB8nCdydz2rTciGhvlbLHtyXfT++TTeI9l5Eg=;
 b=pNcrHMjaH+6ka+UzBmgUK35D4/jGPmFWtfa+pNb1hVHiGoAV/pMheqBE0ZbuZ66KgBaK+RTCyk7JBmsShM9YdG5ZLpN5IdqFAPiDJpKkNkbor9GwTH+xrvHUCW27KB48WMJH++/+2DHsOXW61zKc+qT1LPGjLkT1tSnOQbMDARk=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3874.apcprd06.prod.outlook.com (2603:1096:820:28::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Tue, 9 Nov
 2021 01:59:59 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%6]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 01:59:59 +0000
From: =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: Do we need serial io for compress file?
Thread-Index: AQHX1FRqrNmTjuyOY0ChZa278NHys6v5rw+AgAC9xfA=
Date: Tue, 9 Nov 2021 01:59:58 +0000
Message-ID: <KL1PR0601MB4003E2DBE5941C1BBAC84F8FBB929@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20211108035459.40139-1-changfengnan@vivo.com>
 <AOQAuQAvE4gDy5nrp7t7Q4pj.9.1636381271838.Hmail.changfengnan@vivo.com>
In-Reply-To: <AOQAuQAvE4gDy5nrp7t7Q4pj.9.1636381271838.Hmail.changfengnan@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ed64472-9f55-4eef-f0e1-08d9a324a28a
x-ms-traffictypediagnostic: KL1PR0601MB3874:
x-microsoft-antispam-prvs: <KL1PR0601MB38744662E0590EDBF5441FC2BB929@KL1PR0601MB3874.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Y2+sOgVvsNug6NR4n73rUV5WBwWJmgoL1L5AACJyCcw1R0bQNgZkJbaMl3wJEi5nSe9kcp3AQqfiSzzdgrCw9WmgtGbgvsuo7Udh+Hgm3OcruCfWat+DMsbPt75VRbOqu8KuwaHkWfJt7jv/sVBmOOa1OCRimuhMD3G/JzhvE1V3qLew4LMQuWB4M//s+XePZOR8wP/AMh+NXjwi+xmNHwkxbOPWlfr0e37OVchUhUWHWA4nslAymHDSUiujNf5vue5ML24Kl3pn70KBUXSPwLCw6PBYqi+mmMoeiZBlJ2ZgkASPUbVk3tvQLTd6kMjMhVQLK8s07JlSdtnhzMljC66cbKPU9JZdmTrcBVOYUwMwmltyCt17viF01jIq2mxcEBS3+VV8Dj/2YEDKbvOlwD5dtPp5lOlM9LVTMLaxoxGrvL2t/muJTImU3UGwp3arXM/V8bPmvjfACXwBNvFsHJpoMih6xGZ2qWVOKnLmrb004y+Et/S8uMXzpaLxJOfaqrjslAkjcJ1AS++UlO1HRF4wtIMdn78ft+7aYYkSe6NYndmYHYwIA66aprx/UW3igWmSQDSdCSg3SLRj/IKs5/8dDIDHwortQd54YGkxzJlL+0ch7D7syRsPTFeJu8oenKkHAPx5gzNkcaO+u1c4MBxsyns0EaSx5ChBECNmUhTkF+3WLJ27uTP7kwx9cF006p8/MD61G9jYZ5zEZP5JA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9686003)(38070700005)(85182001)(4326008)(55016002)(33656002)(38100700002)(122000001)(83380400001)(86362001)(26005)(71200400001)(7696005)(66946007)(2906002)(76116006)(508600001)(5660300002)(8676002)(6506007)(110136005)(64756008)(66556008)(316002)(66476007)(53546011)(66446008)(52536014)(8936002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVVtOXcvTlp2TzZ6eXZEbmxLdjhHbmF1c2pvdG1pZm1Hcy9pQlhLbkNnbWJt?=
 =?utf-8?B?SnNqVTJUQ1lSNDIrWngvVEM2WjFKclJBdi9FQzdoZzBJWjMwalJGS3ZKWmEy?=
 =?utf-8?B?MG9maXM1UzlzUVhhS1NCRng3QStNUkNoejJ4aHFxOUozVDRHUVFwbW5lekJ5?=
 =?utf-8?B?TDJrQ0xWME1CbEwrcVlJckNmRzZ4ZVB0b0xYQ0NNa1lJclBIbmNUbG9ZOTlK?=
 =?utf-8?B?cEJOL0o5T1NUbnpIczAxRXdua2VMMENIaFN2VW5jT3JzdGh0b1orYjRNL1Ex?=
 =?utf-8?B?UHM5RFU2Z1YyWjRpQWhTa1NvV2hSZEhNUTFmTHR2RWYvTU1tWFVKRFR6c3Bp?=
 =?utf-8?B?dXJsd21YMy9OcWNsYU8ybUl3NWhtZytTclMxaEVxaGVFdEwxNGVJdEpvWEsr?=
 =?utf-8?B?MEFCcHlSdlFkS2J3SFRMYlVYRytoZzRzWU53ODgzK0FUUlN5TS8zQ1JtbE15?=
 =?utf-8?B?cDRFZVJIamtkaXkxK2JaK3NNZkdxVzBObWZhK3dPeXkvQlZaYUhRZ2dROVJy?=
 =?utf-8?B?clZVazBsYTg3aFFtMXUzTXpHcHRDUWVYVTY4ZzFlK0JpYk5uY0htUDNHVUxW?=
 =?utf-8?B?MnpSQlpRU1lOa3hpUlRWa0lET0hBNGsxMCtEbGc1NXFzWmFnTUdZU3plQTVy?=
 =?utf-8?B?QkhDVUlFbHFkMGJCNG9rc05jcVk4K0FKbHpDTm5DbkwrZTY1UnJXaVlJTzR3?=
 =?utf-8?B?NjJrOVl1OXhpUTM0SWRLU3NEZkR2MGRsRzllaC93cGc5Y1cyRzI5QzZwYW1G?=
 =?utf-8?B?SkhqamZjNU9iTVdZUzBBL2UzWUZkTUVYajhYRWZaMlh1cmxFeWJSUGhLcnQx?=
 =?utf-8?B?bGlFa3dhZjVhOE5GNzlLRFN5RjJyeUVLV1RxWGtBbTNkSDA5ZUV2OWVEdXVX?=
 =?utf-8?B?ekNISVN6VzYzQjh0NjQ1NDVhMlh6Z2ZySXFEUTNBZ3daQkV4akY5U2RVMHE2?=
 =?utf-8?B?alNEcGpJM2hEWU5YQWhJVGw3N1ZCb2Y5Zkx2RUE2WThSNnVjTy8zemtzQkc3?=
 =?utf-8?B?d0hmTGwvbExjT1hCVXpuOTgzZXd6bk5lUDJoOVlGOTdrV1ozU2xXTElOL0Va?=
 =?utf-8?B?R3lRY2JzUnhaYWFHQWtTV3Zma0pGSitMU1o5TzFQc1BUVUZpUGRYNGpmbFd3?=
 =?utf-8?B?NDVadGhpNnJmNk0vOFhJNzlWTDF6VTBpWW9lOGw4OEZxa2ZOaXZudkk1a1A4?=
 =?utf-8?B?YXdPZ2NaeWQvMjUyb3JERDBPYnFYcmljZ0Z6K3BYRkFJOHFNRlVMdUYxd2Vw?=
 =?utf-8?B?NjFWNTJqMDZMY29NTVY5NGNoL3dDK1Y1ZkUrbnNQRVZBa3hrcUZlMEIwUGk4?=
 =?utf-8?B?UExZRWw2R05zbjNldjVRaVpjbzE1cko1citVSE85Y0VNOThaQTdhelJOaDcw?=
 =?utf-8?B?dW5lSmdINzAxaVUvamtsVWhBdXk1ZHU3ak1EVXRBb1hldkxMT0tDS3Q3dkI2?=
 =?utf-8?B?N2t2STE5U3Y1R2hmdHhxYmNmd2NZZFpqK0FYL2ZVYnBaYm5sbnQwWFZzbUNB?=
 =?utf-8?B?NENHNUJYN0hBQ3d2WnJLb1lvK3ZOeVJtOGJySkNUOTZ6SEc2VVRhc1RkYUlt?=
 =?utf-8?B?ZzQrMmlISUNqNWlTakJBU1ZkYlZrc2FrSmNFcEZkMDlTUTgveEwxWUxPbWMy?=
 =?utf-8?B?aDBwRGFCUW1uZGF3TWVlSUZMQVhRclVLQzJ6d2kzWFBNbVVQcmMvL3c2aTdW?=
 =?utf-8?B?RnNRVk5BSU5MM2ZUcWU1N1dzQThYYldXZEppd3czZElTVjlBRjhWamZsZE85?=
 =?utf-8?B?RmhWaFZSRG80bE1oT3BXcDl5dC9wb0FYZnJ4cXVSZE5vUXBhOFBoZWo3NkZ5?=
 =?utf-8?B?aldXeU5EalJmZldmd2tDd2xzVEJwbFB4VllsdG9VTHgwZ0E5WnN4ZlVvWWdJ?=
 =?utf-8?B?VmNvLzFGb0E0UkxZR05kTW5xSU1SLzB0MWRockdsd2pGYVVHb3E1MGF0R0tz?=
 =?utf-8?B?cURpRU9mTHJyRXJHSXMzV0IvNGsySmVJaFNmdmllMUhXY0hRVXRGUEUwVS81?=
 =?utf-8?B?YTlBN0lRRWxnK1FUWVd2NVladW5ESlBLc2d5M3RKTmxQeTliRjc0YTBHckxS?=
 =?utf-8?B?OHVJc21lbXoxL3pYS3F3aTNlVXBXMmg1SHY2RkRZTkM2MXR2VTNtVktQdUJI?=
 =?utf-8?B?by9YNUIrYUhHckRKbHl0YXo5UGFlUmJtRU5hVitXUDUyYnhZYm9CMjc5bE1E?=
 =?utf-8?B?YUE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed64472-9f55-4eef-f0e1-08d9a324a28a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 01:59:58.6608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kT582tI80oYDji06jhHhqqJEviTALAj8gTD+qezP6CVs1fczcvXObiTb6QGWh99iWOCIPBEUhswNiaUAhWx1FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3874
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
 no trust [40.107.132.129 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.132.129 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mkGRA-0002hS-LG
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
IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgOCwgMjAyMSAxMDoyMSBQTQ0KPiBUbzog5bi45Yek5qWg
IDxjaGFuZ2ZlbmduYW5Adml2by5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0DQo+IFN1YmplY3Q6IFJlOiBEbyB3ZSBu
ZWVkIHNlcmlhbCBpbyBmb3IgY29tcHJlc3MgZmlsZT8NCj4gDQo+IE9uIDIwMjEvMTEvOCAxMTo1
NCwgRmVuZ25hbiBDaGFuZyB3cm90ZToNCj4gPiBJbiBteSB0ZXN0LCBzZXJpYWwgaW8gZm9yIGNv
bXByZXNzIGZpbGUgd2lsbCBtYWtlIG11bHRpdGhyZWFkIHNtYWxsDQo+ID4gd3JpdGUgcGVyZm9y
bWFuY2UgZHJvcCBhIGxvdC4NCj4gPg0KPiA+IEknbSB0cnkgdG8gZmluZ3VyZSBvdXQgd2h5IHdl
IG5lZWQgX19zaG91bGRfc2VyaWFsaXplX2lvLCBJTU8sIHdlIHVzZQ0KPiA+IF9fc2hvdWxkX3Nl
cmlhbGl6ZV9pbyB0byBhdm9pZCBkZWFkbG9jayBvciB0cnkgdG8gaW1wcm92ZSBzZXF1ZW50aWFs
DQo+ID4gcGVyZm9ybWFuY2UsIGJ1dCBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHdlIHNob3VsZCBk
byB0aGlzIGZvcg0KPiANCj4gSXQgd2FzIGludHJvZHVjZWQgdG8gYXZvaWQgZnJhZ21lbnRhdGlv
biBvZiBmaWxlIGJsb2Nrcy4NCg0KU28sIGZvciBzbWFsbCB3cml0ZSBvbiBjb21wcmVzcyBmaWxl
LCBpcyB0aGlzIHN0aWxsIG5lY2Vzc2FyeT8gSSB0aGluayB3ZSBzaG91bGQgdHJlYXQgY29tcHJl
c3MgZmlsZSBhcyByZWd1bGFyIGZpbGUuIA0KPiANCj4gPiBjb21wcmVzc2VkIGZpbGUuIEluIG15
IHRlc3QsIGlmIHdlIGp1c3QgcmVtb3ZlIHRoaXMsIHdyaXRlIHNhbWUgZmlsZQ0KPiA+IGluIG11
bHRpdGhyZWFkIHdpbGwgaGF2ZSBwcm9ibGVtLCBidXQgcGFyYWxsZWwgd3JpdGUgZGlmZmVyZW50
IGZpbGVzDQo+ID4gaW4gbXVsdGl0aHJlYWQNCj4gDQo+IFdoYXQgZG8geW91IG1lYW4gYnkgIndy
aXRlIHNhbWUgZmlsZSBpbiBtdWx0aXRocmVhZCB3aWxsIGhhdmUgcHJvYmxlbSI/DQoNCklmIGp1
c3QgcmVtb3ZlIGNvbXByZXNzIGZpbGUgaW4gX19zaG91bGRfc2VyaWFsaXplX2lvKCkNCg0KZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMNCmluZGV4IGY0ZmQ2YzI0
NmM5YS4uN2JkNDI5YjQ2NDI5IDEwMDY0NA0KLS0tIGEvZnMvZjJmcy9kYXRhLmMNCisrKyBiL2Zz
L2YyZnMvZGF0YS5jDQpAQCAtMzE2NSw4ICszMTY1LDggQEAgc3RhdGljIGlubGluZSBib29sIF9f
c2hvdWxkX3NlcmlhbGl6ZV9pbyhzdHJ1Y3QgaW5vZGUgKmlub2RlLA0KICAgICAgICBpZiAoSVNf
Tk9RVU9UQShpbm9kZSkpDQogICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0KIA0KLSAgICAg
ICBpZiAoZjJmc19uZWVkX2NvbXByZXNzX2RhdGEoaW5vZGUpKQ0KLSAgICAgICAgICAgICAgIHJl
dHVybiB0cnVlOw0KKyAgICAgICAvL2lmIChmMmZzX25lZWRfY29tcHJlc3NfZGF0YShpbm9kZSkp
DQorICAgICAgIC8vICAgICAgcmV0dXJuIHRydWU7DQogICAgICAgIGlmICh3YmMtPnN5bmNfbW9k
ZSAhPSBXQl9TWU5DX0FMTCkNCiAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCiAgICAgICAg
aWYgKGdldF9kaXJ0eV9wYWdlcyhpbm9kZSkgPj0gU01fSShGMkZTX0lfU0IoaW5vZGUpKS0+bWlu
X3NlcV9ibG9ja3MpDQoNCmFuZCB1c2UgZmlvIHRvIHN0YXJ0IG11bHRpIHRocmVhZCB0byB3cml0
ZSBzYW1lIGZpbGUsIGZpbyB3aWxsIGh1bmcuDQpmaW8uY29uZjoNCltnbG9iYWxdDQpkaXJlY3Q9
MQ0KbnVtam9icz04DQp0aW1lX2Jhc2VkDQpydW50aW1lPTMwDQppb2VuZ2luZT1zeW5jDQppb2Rl
cHRoPTE2DQpidWZmZXJfcGF0dGVybj0iWlpaWiINCmZzeW5jPTENCg0KW2ZpbGUwXQ0KbmFtZT1m
aW8tcmFuZC1SVw0KZmlsZW5hbWU9ZmlvLXJhbmQtUlcNCnJ3PXJ3DQpyd21peHJlYWQ9NjANCnJ3
bWl4d3JpdGU9NDANCmJzPTFNDQpzaXplPTY0TQ0KDQpbZmlsZTFdDQpuYW1lPWZpby1yYW5kLVJX
DQpmaWxlbmFtZT1maW8tcmFuZC1SVw0Kcnc9cmFuZHJ3DQpyd21peHJlYWQ9NjANCnJ3bWl4d3Jp
dGU9NDANCmJzPTRLDQpzaXplPTY0TQ0KDQo+IA0KPiBUaGFua3MsDQo+IA0KPiA+IGlzIG9rLiBT
byBJIHRoaW5rIG1heWJlIHdlIHNob3VsZCB1c2UgYW5vdGhlciBsb2NrIHRvIGFsbG93IHdyaXRl
DQo+IGRpZmZlcmVudCBmaWxlcyBpbiBtdWx0aXRocmVhZC4NCj4gPg0KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
