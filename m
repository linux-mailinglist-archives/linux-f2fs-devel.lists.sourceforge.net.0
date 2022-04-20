Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 471D9507E04
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 03:15:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngywb-0006ni-Dm; Wed, 20 Apr 2022 01:15:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <xuyang2018.jy@fujitsu.com>) id 1ngywM-0006nS-W0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 01:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=upUBr+KN3eH6eLSrc8P5xV6BhelVmGypneby0Vzs5tw=; b=NMAuJIJgC+AHT+dm+5VCyLSkME
 PUfgpkPW2p4fsicPXrbJd7dBIgzJR32VFTEMOa0ftK5CSBognpg9HDd7jx3AzOyzW0drQUEEp9h3T
 6KsP65sORS2x2spCqLnO1smLf635KJambPWhuvHLlx4wf2bmULqUlgjGIktlhm232ufw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=upUBr+KN3eH6eLSrc8P5xV6BhelVmGypneby0Vzs5tw=; b=Gy4kRJix76FaL5Bb4dy8sH5ARu
 JtlLGRYdLl4Mn8cg7Ay7f+A58Ch+RqvgMwJno5TNR1KulhWynwcknzv338hb/RczAIQKo5yVwbfRI
 nxr0x3JPkZxDp1UDbMUBjkDY9G2umlL7Ux/5xNEdJtkbQtZWfM2xaamtlX8rPe7Edr7o=;
Received: from esa1.fujitsucc.c3s2.iphmx.com ([68.232.152.245])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngywK-004Isg-42
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 01:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1650417328; x=1681953328;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=upUBr+KN3eH6eLSrc8P5xV6BhelVmGypneby0Vzs5tw=;
 b=Y0HoN5oT61sIf7W5pUiU7V7A1FzxxWj1swcbFSHRCacDd7DXZb/3vrco
 fH6Q5j0+jHrtbWHDVPXnktaviBPjIr4zxmyotDKV1bQ0Sxn5rNmWoJzzO
 XASP/IoE1FgsachPR+gOGKnSuxaT0v2Eq9M3olu4spotoe5j15ixW5pw1
 8PzFwj7h/BX7URNUxXoiu+oMvqSRlA/Iv5zGTBgmqhwgGYlms/BZP4HYx
 aAJrK4VODtD70QssE4Mf0wcTQspImzCKfciFiEM3lrV6fIW4asIDBOs6G
 7J1BfxdZ/jGm1xZji67v4HyUwSg5HWdpC0FfgLpzuT+oEqazaPx5bbQdV w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="62450015"
X-IronPort-AV: E=Sophos;i="5.90,274,1643641200"; d="scan'208";a="62450015"
Received: from mail-tycjpn01lp2170.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.170])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 10:15:17 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsXaWDhEiBb861MXoOuesKuvClc8frK1hL3Ub7lXu67x7Q4bWNe5j5CoOgoZr+RC1By8u4mNKYY/lQSvzajfavMlTTQphgDld74cAzA23ASBhGWrfzVrSfieiHFf37Zhy2XuAECVcBTlZVWeWMhsQRspHAGhkEnIIi2lF8y+91e9go1mw40TQKMHuaWMip6dSn2RWSoIl3ZyUhzU/zyLcvLT8PfaZBTHTn3cILEAiQIV61K28cvqBPv9zSH1qi+zihyBXo6yHHGmyjYMG3OcfblwbCntLbU2c70KUdbdPm+4Gg98NvuMg59drTh3OS967sEHrrnH5RKgiKq62LAM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upUBr+KN3eH6eLSrc8P5xV6BhelVmGypneby0Vzs5tw=;
 b=DaOUYVzrRyDE7YurQsLR01wW7fehzLngysp1Cul3p/udh14EInmm9pnodunOdFVqvUFuCAQtEN/Vc6PPN8OJCwT9cOtzO+QuUtgV70iVZ2+mF9RgXUsqMuhu7pTrI1vRTZyYAqnmh7DmlSBfqyVthTFPScfSiH1ElWKSPEiFG569YZOihvMIdpNF+zZLy4qP69eXwTCQCL4f2Ip/exWxoYmosKe9yYPwJUSV7oqgPXcyDGCgYDioTrzC3GyMrvb67o2hW5q0iPhB+L0ZavdL138VDeIerD5+98W/iMcWOz08jVKmR9n3HOd/HNQezGFmTFoWnlQtOaMnKDtp8gIEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upUBr+KN3eH6eLSrc8P5xV6BhelVmGypneby0Vzs5tw=;
 b=QQUXe7y04Y7xPX0Y6h3/imK/agWvbbpEdXPYEZ98m4jDhfGdO18sbv+uO7oeibJ/J+A9q69fzhLc/E/oau5Juoiyj12SVMnGPe4tUNpv7cXMm46aXvfCWH8EQUu0X+UH0viXU0h3a8kiqRxU8+/6Vc/oc5ZskfB/zQlqxFZo5nI=
Received: from TY2PR01MB4427.jpnprd01.prod.outlook.com (2603:1096:404:10d::20)
 by OS3PR01MB10073.jpnprd01.prod.outlook.com (2603:1096:604:1e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Wed, 20 Apr
 2022 01:15:14 +0000
Received: from TY2PR01MB4427.jpnprd01.prod.outlook.com
 ([fe80::fca9:dcb9:88b4:40fd]) by TY2PR01MB4427.jpnprd01.prod.outlook.com
 ([fe80::fca9:dcb9:88b4:40fd%7]) with mapi id 15.20.5164.026; Wed, 20 Apr 2022
 01:15:14 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Christian Brauner <brauner@kernel.org>
Thread-Topic: [PATCH v4 6/8] ntfs3: Use the same order for acl pointer check
 in ntfs_init_acl
Thread-Index: AQHYU9sMzZ7q+jW9SU2N1QUozq55caz3RMgAgADMy4A=
Date: Wed, 20 Apr 2022 01:15:14 +0000
Message-ID: <625F6CFD.4000803@fujitsu.com>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1650368834-2420-6-git-send-email-xuyang2018.jy@fujitsu.com>
 <20220419140330.jogjwtdzy735j567@wittgenstein>
In-Reply-To: <20220419140330.jogjwtdzy735j567@wittgenstein>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4795b91c-9b7a-45c1-6033-08da226b396a
x-ms-traffictypediagnostic: OS3PR01MB10073:EE_
x-microsoft-antispam-prvs: <OS3PR01MB10073B80E936A686D724D3915FDF59@OS3PR01MB10073.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UGqbQv/Q4MjPyjOdTRKJs9xIHaT6xXimadAPxJ9px3uAMFhw+sdPnAzokRG5IjLD0ocFzgXbGCcxccpRNukAq1t0MkZC62CwWxM5CeUQaOAXQ1J4wy8ieWEELwxTeRrd3jBpiHxLZGSyKQw/rNMHHVmtZ1xc2CrnOHhR88uWI/9ZLR2SoSAYVly4buzOinmQMA2/zYziOb0GUqpfoATYF6E6F65SMNqkEB9x4C9eujzNcq/kJMeF6nLpMjS6ZE5XZfyZuMgMzVFK0Kmhn2MleWM2KtzEjg3Z3Q7SuVitZ7ePpKBWCSPH537zg+bIUROqD+i9y+McokwOcoYJ4AlzZbwmC2tjtqCeVgHf4Eh83v3mm/88s2szjgxZ8UX73wvtJXPMmoI1vpyq5GNLg7Wm+Rbo9lriStrt0r0+Cnq+LZyXE2+OSoeON/o0AinQpbtFelig15neSN375fhyMnQQegdECpVKmT0XmMS6hdqU8LXFZkytCceuQsLRr9CPOdsjxRvVqgyOEsZ4g9UTZw78T2hpnsl17CSXkVsVHzR9bcfFtnRDVKQQKBdoUnI2+vgkI7DrDqrX4aXPIs/W0LcRZL5mzTdjFxQ/Pa+vWM2T72a4OEWIe36/npiqyP38dJuIQBT1IYnh5wJn7GouNGn22zPFkkWwE2SbEnekbOa8gaO07+5+8wlcP8WvHdwOd2wbYKeCe5l8oTK8qWIMdbP/FA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB4427.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(54906003)(6916009)(8936002)(6512007)(87266011)(26005)(2616005)(2906002)(64756008)(8676002)(82960400001)(38070700005)(38100700002)(91956017)(122000001)(6486002)(36756003)(66946007)(6506007)(33656002)(83380400001)(7416002)(85182001)(316002)(66446008)(86362001)(186003)(71200400001)(66476007)(66556008)(76116006)(508600001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEltWm1VR0FCaXJqMUtuZ0p0VE1BRnBFOXh4ZHd5cEVHZUpvaUNXbVgvSE9O?=
 =?utf-8?B?RkdzTU1DZW1qdkRvbHlOSmZ5K05MdXlhQ2twWmVMWlo5UTlNVFI4N2hBYllI?=
 =?utf-8?B?MTNRZFRmTUFQNTd6SUVyYUVoYlcybkdOODU5SmkxbUFReEZKN0YzT2w5UkFD?=
 =?utf-8?B?TVBzWVd1aW9LYm1VOHlUWjlRM3N5UWZxdVhDTVc0YVN4Q0ozdmUreFNnMzQ0?=
 =?utf-8?B?T1NCMkpBUzEvdlp3WFE4ai9kbW5RK3hoOGNBZTRBTzZWZ0ZSZnowdGpkcTdh?=
 =?utf-8?B?OStzSUU1QThadEJJdTZpL0dETzZpYkFKeU9XeVRaOGZkSGFoOWNBRTFEWnRj?=
 =?utf-8?B?eVdzTWM0WjJER3VFNjJKNXA4T3c5Z0Z4R2pBdVZETWxUMGVGOGJ4SHYyWlV6?=
 =?utf-8?B?eHNySlB2QS9NODlGbzBkdEJVTGorVkdZNEpueW9jb0VEUXEvc0NyVFpacm9U?=
 =?utf-8?B?UWZPZDFqZVBCMW85ZlkvVnZvWWtoRy9CZG1RT042eWpMY1FLSWJGR0YrNHVJ?=
 =?utf-8?B?OGl6dmhWeEJBNlhrelNoQVg4YlhGQ25sLzlNcTEwZ3YrRzhmYmxycFM1OFVr?=
 =?utf-8?B?TEdtQms0WFVKbXlkcU5YQ3lDY3N3NFRVL3F5TW1WYUIvZFRraVNOVlFncW90?=
 =?utf-8?B?OEphNnJ6TzJDWHRVajkyK1JRZW9mZWdpQW5NZzBVdVUzditpdkJ6WVhPM25L?=
 =?utf-8?B?djZzQjkvYnhVM2xocm1lQlQ5TXUvQmJ6NnJBQmlFWCtGclNaTmh5RTFzUlZN?=
 =?utf-8?B?d002RVNyVHJrNlROTjZzRXJoOGtGZTIzODAyZ29Dd2F4R3N6VWR1UGdvS3Zn?=
 =?utf-8?B?Tk52cXIvYWFRM1pjQmpidU1qZWR2VktYYkR3L1RuUkZnWmRaTDJVK3E4bWhV?=
 =?utf-8?B?K1BBa0t4VHVtMHVJejBiaGFDSkFCK21tZStNaVR2Vjd6MUhLSXVnN0krcDh0?=
 =?utf-8?B?WWh4bUtESUtUbGJXNUtaUUFBaUpQWTNsZnVYaGtvSW4wNEdTWWk1NE5TUGFV?=
 =?utf-8?B?bmJ5b25tUWNmTldUclVpQkE3aU1QV1ArTjRzYXh2S3JibVhFYnJrNEsxamJm?=
 =?utf-8?B?dGNnQU1jbXNFZFIwVXZRZTdoRmoxVVFxc29tdzhLWkVhT1hmWW9ESTQ5QWU5?=
 =?utf-8?B?bnNqeVRUVDZSMzR0TEtjdlQ5dW5DK20rdndTcHZOWExlN1VRMmJwODc4TzVh?=
 =?utf-8?B?RlpHNUJpQkpobm9yTEFEUFZ3RTJ5N3BWRkg5M0N5SGlEdXlqTElGZkt6aHRs?=
 =?utf-8?B?cWVBcFBvUHo1OTVDbFFRNHVoRFFSOFkxRDRJMzZva0dWeWtTOWFSaU9Bb1NK?=
 =?utf-8?B?NXF4dHVhMzVncVJKdjBHNFZZY2VZSGx3VEhiUUVhbDBKSmdqaXJrOWgrQTF5?=
 =?utf-8?B?UUhqYXRiZisrUU0xZG80TTkvRDhBYkpJRC9IcGQxVHY3dkJuL0xhNjJkK3o3?=
 =?utf-8?B?alRTTWhPbjV4M2l6ejIwUFNFM2hjR2JwVUNGNmZpVG1YaWRsVVVKbjhqQWNt?=
 =?utf-8?B?VnNnbXk0Z0QyeUNKc0NSTVJjTk9vT1drVXJFUGZXeERXWWlKall2UTgxWWx6?=
 =?utf-8?B?UGRMbjcvQnVoSmtPNVJ1b2xSK3RrQm96ek5LSUJzUzZIOE1aa280VFFpL0s2?=
 =?utf-8?B?aVFZRUhqVmxoQ1owREg3WmVjbG0yRURvZklwcWh5Q0RSOCtNRElld3hVVTNK?=
 =?utf-8?B?ZFdDeS9sMFpnUTI1VW5INUFleS9xVnNJR0lYSFJNSWpKckNoam5yN2p4ZWdP?=
 =?utf-8?B?V29xQlRUem5EdEFmczZ1a21DWlFWTHp6K3hQVDgzRUpsOEs2dGVzU0FBekhD?=
 =?utf-8?B?N2JVZ1lKZ3NiVFJwN1dQaDhZQjRhODVZalk2djN6cVBuWVQ0MFlUZ0gzeDg5?=
 =?utf-8?B?eTRnd3A1Ty9MNnBzNWFTeUh6MWlBSUF3SnY4SzRITXp5SkdoaW1oMlhMTnlT?=
 =?utf-8?B?WWsvck1yMm5iV2FGODUzbk54cFYrTlVUYlJ0ZUlxOUhHbFYyZXlaTWhTcHBD?=
 =?utf-8?B?YjkzNEZaV3h3bUpBS1Jubkw2bXNjYXNBaWw1TDVlS05qeEZkR0NkakJqTk1m?=
 =?utf-8?B?UG1IbDIwRm1KODU0cDB2WWFUYkluTFA5ZHF2YjhudXFnNVpnblZXbGNYbHI4?=
 =?utf-8?B?ZkExZWlhUit1WTVXZXlUSWF0V3dEVXZ5UDVOQ1pZb1AyNlhySTJUQUFOT1Jq?=
 =?utf-8?B?MUl6T0dzS2RhQlVyUVA1bHNpR1IvTDVQSVhVNFhuTWxraS83ZUhJV1M1cXJU?=
 =?utf-8?B?WTNnWFNVazNCWjVPOVlSYy9lV0FyU0hRZlZESkp2QkVjR0ZoTW8zVlpWTnRO?=
 =?utf-8?B?bm9iMnV1ZlF0bksrV2hVelNzcUs5NmFWS1p4eG11KzVqSTJ2MXVLUmowRGM3?=
 =?utf-8?Q?qhQj+6lpRTTcPvMqqVLtToL1fkj1rKtO4OQi1?=
Content-ID: <EB0F22C109A815419E991B16D02BDE31@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB4427.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4795b91c-9b7a-45c1-6033-08da226b396a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 01:15:14.5839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6q0t/3ghIZZgc3OCA/umixVspUVwhrTjbuNrN2qdLX5mVjuouLOg5srTgE5Tpm9hSFnmd7hduaxMjBAuyygkJmUJweeuohM+hvYVfU+Yxwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10073
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  on 2022/4/19 22:03, Christian Brauner wrote: > On Tue, Apr
 19, 2022 at 07:47:12PM +0800,
 Yang Xu wrote: >> Like ext4 and other use ${fs}_init_acl
 filesystem, they all used the following >> style >> >> [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.152.245 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [68.232.152.245 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ngywK-004Isg-42
Subject: Re: [f2fs-dev] [PATCH v4 6/8] ntfs3: Use the same order for acl
 pointer check in ntfs_init_acl
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
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "djwong@kernel.org" <djwong@kernel.org>,
 "david@fromorbit.com" <david@fromorbit.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "jlayton@kernel.org" <jlayton@kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

on 2022/4/19 22:03, Christian Brauner wrote:
> On Tue, Apr 19, 2022 at 07:47:12PM +0800, Yang Xu wrote:
>> Like ext4 and other use ${fs}_init_acl filesystem, they all used the following
>> style
>>
>>         error = posix_acl_create(dir,&inode->i_mode,&default_acl,&acl);
>>         if (error)
>>                  return error;
>>
>>          if (default_acl) {
>>                  error = __ext4_set_acl(handle, inode, ACL_TYPE_DEFAULT,
>>                                         default_acl, XATTR_CREATE);
>>                  posix_acl_release(default_acl);
>>          } else {
>>                  inode->i_default_acl = NULL;
>>          }
>>          if (acl) {
>>                  if (!error)
>>                          error = __ext4_set_acl(handle, inode, ACL_TYPE_ACCESS,
>>                                                 acl, XATTR_CREATE);
>>                  posix_acl_release(acl);
>>          } else {
>>                  inode->i_acl = NULL;
>>          }
>> 	...
>>
>> So for the readability and unity of the code, adjust this order.
>>
>> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
>> ---
>
> Again, this patch is irrelevant to the main drive of this patch series
> and it's sensitive enough as it is. Just drop it from this series and
> upstream it separately to the relevant filesystem imho.
OK, will do.
_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
