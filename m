Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CC945E447
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Nov 2021 03:15:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mqQlL-0005qs-8i; Fri, 26 Nov 2021 02:14:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mqQlJ-0005ql-1U
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Nov 2021 02:14:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lWwdFkb5NOkViVmRJs0g1RW1Cjwaq1myQ3Vk35Rrx30=; b=Jyg7T+OEClg2K1LRaNh37pnd21
 ZXkef2N4f1bgygv9ATYHTg+5Z7nrNSgyk0EnYDZrLl29+vDpENQ3GtyyXoE+Ld5h13QPC31U8Vd60
 NoC9SrCFBhdMFg6UE02xOJfy7n9s4Hma9+s+KyYfgHUXNsUYMiOcVThqEnUjkwTUn9HA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lWwdFkb5NOkViVmRJs0g1RW1Cjwaq1myQ3Vk35Rrx30=; b=lZzzxPbKZnHrTjXfIS0bD8ELT0
 mV8P/HzRaxtspl4hD9hQxlTbCQiCjparr+dWj+BSUF8Se6FKrVSWUJmW14bK46yS9Se+07bkJSBsd
 I6ADB6ni+rgJDMO5i/f3+uLSiXRrS4MLozhr3VXRPVKRapz9tb+JRu3Q+uxp0SZ/Bpy8=;
Received: from mail-psaapc01on2125.outbound.protection.outlook.com
 ([40.107.255.125] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mqQlE-009WoI-DV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Nov 2021 02:14:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+QKT9wLWiEHVzuaHsveS5AKrWxzbcuDZPDE9hDHdVBpwawfhB8soPIvlnscAYUZEcFC7M7kLpXYINpUX6GdkmqxIi/QMyAa7ft0/hxWkKkEdGsiiR3pfW/G5jq8Zj2yPcnW4wMFBZKL2qIxjjSr7W7Eo+vXhInNm57GIwSdMU3mXXTDYIWygIJXtxS6jf05x2IRaID1uCPnDurOYnFW/NImhOieEfNW98rYuoWfdY16+4UOT+cElzhfYm+hBGLOT75/pks8oOZ+RXSTOosrt6enz96lfOSGf4IrJovHQxXFdmWcOJQ9Wo8JlCIy5LfP2om8+2sAL0AkjXTxVu6XKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWwdFkb5NOkViVmRJs0g1RW1Cjwaq1myQ3Vk35Rrx30=;
 b=VDOSGdd+cwDGyLAsm6f9A8hMJdErVM24ymVZqjJ7sAvDkQWjOc0HQeOKQUckoUk6EOfgDdzYeHK90BNJ79AXEx6B3aDBLbUdJn4zIGeDAo6RklUrXluViwzP7ddCg0eC84Hbx0lLPoB0pxjRvRoboL7BmoH7RnwtqVOUnSsa0RuhgtOP70IcrJomV7Dgc7WwTyN29jmVeTu9y2Jqbs8CNZ4ldGAo2TP8p5rLXZPS1Xha5m1Ahb4zb1/Z18zzD5VVE1uixCvx+/0J755TedMNnM0VkJE3dk90U3UCXO7MS1vu9Yl+3giIR90ItZixcWszJszPQhDnegnodFkT03Lbig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWwdFkb5NOkViVmRJs0g1RW1Cjwaq1myQ3Vk35Rrx30=;
 b=pdrhSh+saQQ8KQK5EAY7UfdLgbIMbZ6Pz70nufH+8gPhmR9asUvfArPMaGThSXIuHC47FIMiac9NLJu5NFGf3/ZlZWMm4nJoq5xBCbUULiFG8UBrXJ27Yd55sjraiVW46zfQu6EXtM9Z5//Hl3BQkxU4XLY6/dXm0lSlmIf8fes=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB1848.apcprd06.prod.outlook.com (2603:1096:802:5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 02:14:34 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%5]) with mapi id 15.20.4734.022; Fri, 26 Nov 2021
 02:14:34 +0000
From: =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH 2/2] f2fs: support POSIX_FADV_DONTNEED drop compressed
 page cache
Thread-Index: AQHX4Q7S93pDb1d7S0uCDiq5qD0NTqwUXFyAgAC3AmA=
Date: Fri, 26 Nov 2021 02:14:33 +0000
Message-ID: <KL1PR0601MB4003860E394F4796A2128C97BB639@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20211124083929.259433-1-changfengnan@vivo.com>
 <20211124083929.259433-2-changfengnan@vivo.com>
 <AI2AswABE2wldWuXsm4geaoQ.9.1637853316644.Hmail.changfengnan@vivo.com.@PGZmZmE2ZjgyLTIyYTktYjE5ZC01YmMyLTJlNzlmZDE4MjBiN0BrZXJuZWwub3JnPg==>
In-Reply-To: <AI2AswABE2wldWuXsm4geaoQ.9.1637853316644.Hmail.changfengnan@vivo.com.@PGZmZmE2ZjgyLTIyYTktYjE5ZC01YmMyLTJlNzlmZDE4MjBiN0BrZXJuZWwub3JnPg==>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1dd6b22d-7bf3-4098-f2be-08d9b0827d2e
x-ms-traffictypediagnostic: KL1PR0601MB1848:
x-microsoft-antispam-prvs: <KL1PR0601MB18481FF7C8EEC81A812F2A09BB639@KL1PR0601MB1848.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1169;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WSFBfoNx3ljXHvXeEJNYYQP1xZBfcKzTopJjUUX8ojPexfWCAeI7WccGtNXMv1i8dZRvplAPAtS30mI4Cfn/JJuWNFP4Z07D/8Ik8ENltMCRrK2Lez9CO6iWCgetlKOz32rzRKzrxd6z4Y1u6ntWVOQHiI/vXrcpZaBDETZu2PmTKFx6WLXWL6jbLJxNrAtKluO8Ag6hX1p/DOkLT53dUXT/4fIokxmHvlB7sAvCVIiikUqBamM6mV8w832zsTTxYH9bD4gKl6QL0bTT/4DohNIUSJRmJt6L37tF3+O+dGazbjudntTXl56yVmrIe3zhbTAmMlP/qt65raC4KJmjL9hG0UeZpz6IlTlWHqNG1CgDrXH4LUBbfQICSHXxdd+/ZN7oWtEFQO6Tt58wEeOvC9XAbGva6v3gEmtf4JU5aNcBJxE+r+x7bLpIszintREKFFB6kogSboCeWWVA2oKbnZYx5KZoiZGRvOxMaU+fmD51u8F2fI4xlCLK422YLrscwdAEUVLZZZXqh7/0Xw93Pq+ZWZ39YqQFrVs2nAurZCMFQUSQ2VKSketaMrk4Zi/J0uo7eNYQxKNMFbN8ulPDj4wMyLWaWunjhW0sS9v9j0NRQpEigiGCLXuVGCP4yFTtyFxDGd7B6R3NYAfB9dwUZqKkxibl77FZR2Upg0RVUDaSkfatiavKiPsElsmq53WaOhlB1OErVrEGgIalcy//Ag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(33656002)(316002)(8676002)(7696005)(38100700002)(86362001)(76116006)(55016003)(2906002)(71200400001)(52536014)(110136005)(83380400001)(8936002)(26005)(6506007)(85182001)(9686003)(4326008)(122000001)(5660300002)(53546011)(508600001)(38070700005)(64756008)(66446008)(66476007)(66556008)(186003)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEZja0xtMEhSUGlWQ1JGT2RKNmpWQ3ZDU0Ixa20wTzhhSVJhakpjb3lnT25I?=
 =?utf-8?B?VkozaVlQK0ZvMHh4T0twQzZJMXZXYkMxTXlHRkFNUmJGYmNPZmpzOUVVWTBq?=
 =?utf-8?B?d0ExanZ3WHZtNVBnQXlnSnQybGRJcFdmNmFWbHpqcEhBYkViYnlJWXhsM3JY?=
 =?utf-8?B?TjlMa0o4aWhSaDZON085cUpUeWZQNEJSdCtMakNWN1JMMTZDSGZGVnNUdThh?=
 =?utf-8?B?bHZDYTRzVTFUT21YZTdIWVQ2L2ZLbFFIeXhNU1l4clBHMGoyN24veWlGU3VB?=
 =?utf-8?B?bUxNc3RyblpuMU84SzlSTUI1TFFDa1dadFFuaWlXWlB4SFc5Tm9GaWVoWWM5?=
 =?utf-8?B?NXdsYXVzRnY3Y3ZVZjZxTVRnZjYyWkl5WDI0N0traDBmcFpPZlR5enJYdjVJ?=
 =?utf-8?B?SjNaWnNQOU94eWJleGo3Y1UxaTd1VzQrQmNJcy9rcFJxb2JHTjFzc2ViUktR?=
 =?utf-8?B?S0RWdlg5a0IwWURZdVBJZUtvZzJiT1lzYllnZHBxYWFHb3l4TkNEcUh0ZzZ3?=
 =?utf-8?B?V3BxUkNheDFjTnFOeGNhcDZxd2Z2WkJVd3BVc05kWExuclF5cEQwWmJHWFNr?=
 =?utf-8?B?dEM4Zk5pSmtQVjJhWkVQMGRxK1pCUFI2WUVQQ0htVTRGVitSUTVoOFllYW92?=
 =?utf-8?B?SnJDTzY2bWZraEFmQTJGT1ptajdXWUEyS2c1cTZicHRLLzc4YWNwM2x0ZHJh?=
 =?utf-8?B?NFR0OVdCUklrOFhVbkNQV29oNmFGOXloVTR6emhwS3pNQkd2NTVacDNGTFY1?=
 =?utf-8?B?RlpVZ1ZvdkFERmJBMlJIckFxdWcrTURXSzBEQnFhTUtsb3RJYTRKL241ZWRY?=
 =?utf-8?B?TGFVTjVSU2t1SFk4d2NJQ0UzekZTbi8zNWJJVUI2MytTT1hFejNTUzhjZHZQ?=
 =?utf-8?B?UUFURERmT2l6cytyTVI5dFdCWlpsTUdtQS9RKzVSdzZUWTJLWGE3QVhIbGgy?=
 =?utf-8?B?T2ZaTlJOMjRHSkFEQWwrYUhTWGxXSDg2bzhObzhHNWhwWnZKUThWT2tBRXlo?=
 =?utf-8?B?UlpidWllUmVuT01QUmY0eUx3bzZoL1pmRU9uSW5mangyUTdVZUlIRlE4cDJ5?=
 =?utf-8?B?S0NEUW5Kd0JVaWs5MnBnYVphUElqZ0xsdnJDdUt1OWNFQzhBdVRZeTc5eE0r?=
 =?utf-8?B?em1XWmJqdjNMbUQ4VEJpbHVxU1pTZGJUeHNvVHJCbHU2a0ZxbmM0M3NyYmFr?=
 =?utf-8?B?eGRhdHhqeHpwNGZmQUc1elBSQnZkMlNrLzlBMnJOeE1GZ0ZHcTluUDVWTnAw?=
 =?utf-8?B?ZDRrWTJtRkZlVjRsbmdRclAyTkQ5bEZ5cTF3bEI1K0xXZjZzMUg5TDcxNFFv?=
 =?utf-8?B?aWxlSmJNVHVCL0JQNTI4YVdVcGF0NTJNUEZmMzlrTzF2Z05Hb3IrQ2E0VXdZ?=
 =?utf-8?B?UVpoYWw3Sk5pVEZmZ1pGUmIxNlhzeFdyR290c2VUaWYxcjBIei9zL0YzeS9R?=
 =?utf-8?B?WWcyalZBUmhIUHZPTHpCK3ExcmkyMjZ3dURBNlRaT0Vvc0RUYVB4bjNNYTRi?=
 =?utf-8?B?bDVEV25odE1YVlV1RHZvUVJaTXFJN29kNFg5MXF1aEl0aVRWNjc4ZHF4MGE0?=
 =?utf-8?B?eUE3ZjQyb1JYV2JUeUVSRmh4QWorOWwreCtRVnNYOGFuUHAxKzVmd21BNlcr?=
 =?utf-8?B?L0hncHUybGp5R1ZVS08wNXZFWDBPVW1PSkRhOFFGTlNBK2hIa3hhdkRORSty?=
 =?utf-8?B?UCtvQzhad1U5bkl2VThzUEZVWElyaGk3Yy9tbWFyenh0RmFCdjBXdkxKY0RY?=
 =?utf-8?B?bmZLNmlKbXg2OW00U2JnRlFFbDNvTEQ4eUIvUGJFZXo1dG1rcnVhQ3pZTmoz?=
 =?utf-8?B?Q1JscGZ4cHorOUtoT2VWUE5QMDhCVHdTUnpCbGR0d0E0YU1Db1lWb3NKMWMw?=
 =?utf-8?B?QWZJWXZNdmhhUFBZUUtmVC9PTHZNUzBEV1ZxS01QOGdqUllPSG1uT1REd1RX?=
 =?utf-8?B?S3lISVgybW5ESUJEM2xqL001VlhRT0t0Z054MkRHS1FpZUYvR093eStuV1NR?=
 =?utf-8?B?eGhWWE5UbzhhQ0VtQU9NeFJpaVIvb1RmcjEwZGlWcHV0YlVEemFCVWdzaTdJ?=
 =?utf-8?B?RTFDdU9veFlRS1p5bXdaejBYT1VvZ1RaYW5hSWNtaEErNmtDd2xxSmNHSEta?=
 =?utf-8?B?Z0o3eXJnNkM2aExvUndkcFV6aFRxUWY3Q3B4cFVMOXo0SVVoUC9EcHhidUs2?=
 =?utf-8?B?Rmc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd6b22d-7bf3-4098-f2be-08d9b0827d2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2021 02:14:34.0020 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 45dbH6qpr994BvAwznUmLnJQC2obYoYI1fus7hvXugqFoRGbQCLGw2/B8buGFPaeb22M5XAR0oiXA45Z/PWhEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB1848
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
 [40.107.255.125 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mqQlE-009WoI-DV
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: support POSIX_FADV_DONTNEED drop
 compressed page cache
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
IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAyNSwgMjAyMSAxMToxNSBQTQ0KPiBUbzog5bi45Yek
5qWgIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmcNCj4gQ2M6IGxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggMi8yXSBmMmZzOiBzdXBwb3J0IFBPU0lYX0ZBRFZfRE9OVE5FRUQgZHJvcA0KPiBjb21wcmVz
c2VkIHBhZ2UgY2FjaGUNCj4gDQo+IE9uIDIwMjEvMTEvMjQgMTY6MzksIEZlbmduYW4gQ2hhbmcg
d3JvdGU6DQo+ID4gUHJldmlvdXNseSwgY29tcHJlc3NlZCBwYWdlIGNhY2hlIGRyb3Agd2hlbiBj
bGVhbiBwYWdlIGNhY2hlLCBidXQNCj4gPiBQT1NJWF9GQURWX0RPTlRORUVEIGNhbid0IGNsZWFu
IGNvbXByZXNzZWQgcGFnZSBjYWNoZSwgdGhpcyBjb21taXQgdHJ5DQo+ID4gdG8gc3VwcG9ydCBp
dC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZlbmduYW4gQ2hhbmcgPGNoYW5nZmVuZ25hbkB2
aXZvLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGZzL2YyZnMvY29tcHJlc3MuYyB8IDEwICsrKysrKysr
LS0NCj4gPiAgIGZzL2YyZnMvZjJmcy5oICAgICB8ICA3ICsrKystLS0NCj4gPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9mcy9mMmZzL2NvbXByZXNzLmMgYi9mcy9mMmZzL2NvbXByZXNzLmMgaW5kZXgNCj4g
PiBmYjllNTE0OWFmNWQuLjdlYzVlM2MyNTkwYiAxMDA2NDQNCj4gPiAtLS0gYS9mcy9mMmZzL2Nv
bXByZXNzLmMNCj4gPiArKysgYi9mcy9mMmZzL2NvbXByZXNzLmMNCj4gPiBAQCAtODQyLDcgKzg0
Miw3IEBAIHZvaWQgZjJmc19lbmRfcmVhZF9jb21wcmVzc2VkX3BhZ2Uoc3RydWN0IHBhZ2UNCj4g
KnBhZ2UsIGJvb2wgZmFpbGVkLA0KPiA+ICAgCQlXUklURV9PTkNFKGRpYy0+ZmFpbGVkLCB0cnVl
KTsNCj4gPiAgIAllbHNlIGlmIChibGthZGRyKQ0KPiA+ICAgCQlmMmZzX2NhY2hlX2NvbXByZXNz
ZWRfcGFnZShzYmksIHBhZ2UsDQo+ID4gLQkJCQkJZGljLT5pbm9kZS0+aV9pbm8sIGJsa2FkZHIp
Ow0KPiA+ICsJCQkJCWRpYywgYmxrYWRkcik7DQo+ID4NCj4gPiAgIAlpZiAoYXRvbWljX2RlY19h
bmRfdGVzdCgmZGljLT5yZW1haW5pbmdfcGFnZXMpKQ0KPiA+ICAgCQlmMmZzX2RlY29tcHJlc3Nf
Y2x1c3RlcihkaWMpOw0KPiA+IEBAIC0xNjU5LDYgKzE2NTksNyBAQCBzdGF0aWMgdm9pZCBmMmZz
X3B1dF9kaWMoc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4DQo+ICpkaWMpDQo+ID4gICBzdGF0aWMg
dm9pZCBfX2YyZnNfZGVjb21wcmVzc19lbmRfaW8oc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpk
aWMsIGJvb2wNCj4gZmFpbGVkKQ0KPiA+ICAgew0KPiA+ICAgCWludCBpOw0KPiA+ICsJbmlkX3Qg
aW5vID0gZGljLT5pbm9kZS0+aV9pbm87DQo+ID4NCj4gPiAgIAlmb3IgKGkgPSAwOyBpIDwgZGlj
LT5jbHVzdGVyX3NpemU7IGkrKykgew0KPiA+ICAgCQlzdHJ1Y3QgcGFnZSAqcnBhZ2UgPSBkaWMt
PnJwYWdlc1tpXTsgQEAgLTE2NjYsNiArMTY2Nyw5IEBADQo+IHN0YXRpYw0KPiA+IHZvaWQgX19m
MmZzX2RlY29tcHJlc3NfZW5kX2lvKHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCAqZGljLCBib29s
IGZhaWxlZCkNCj4gPiAgIAkJaWYgKCFycGFnZSkNCj4gPiAgIAkJCWNvbnRpbnVlOw0KPiA+DQo+
ID4gKwkJaWYgKGRpYy0+Y3BhZ2VfY2FjaGVkKQ0KPiA+ICsJCQlzZXRfcGFnZV9wcml2YXRlX2Rh
dGEocnBhZ2UsIGlubyk7DQo+IA0KPiBJIGRpZG4ndCBnZXQgdGhlIHBvaW50LCB3aHkgc2hvdWxk
IHdlIHNldCBpbm8gaW50byByYXcgcGFnZSdzIHByaXZhdGUgZmllbGQ/DQpZZXMsIGJlY2F1c2Ug
cmF3IHBhZ2Ugd2lsbCBhZGQgaW50byBwYWdlIGNhY2hlLCBhbmQgDQpQT1NJWF9GQURWX0RPTlRO
RUVEOg0KaW52YWxpZGF0ZV9tYXBwaW5nX3BhZ2V2ZWMNCiAgLT5fX2ludmFsaWRhdGVfbWFwcGlu
Z19wYWdlcw0KICAgIC0+aW52YWxpZGF0ZV9pbm9kZV9wYWdlDQogICAgICAtPmludmFsaWRhdGVf
Y29tcGxldGVfcGFnZSAgLy8gY2FsbCB0cnlfdG9fcmVsZWFzZV9wYWdlIHdoZW4gcGFnZSBoYXMg
cHJpdmF0ZSBkYXRhDQoNClNvLCBpZiByYXcgcGFnZSBkb24ndCBoYXZlIHByaXZhdGUgZGF0YSwg
aXQgd2lsbCBub3QgY2FsbCBmMmZzX2ludmFsaWRhdGVfY29tcHJlc3NfcGFnZXMuDQpUaGlzIGNv
bW1pdCB0cnkgdXNlIHByaXZhdGUgZGF0YSB0byBjb25uZWN0IHJhdyBwYWdlIHdoaWNoIGNvbXBy
ZXNzZWQgcGFnZSBoYXMgYmVlbiBjYWNoZWQuDQogDQo+IA0KPiBUaGFua3MsDQo+IA0KPiA+ICsN
Cj4gPiAgIAkJLyogUEdfZXJyb3Igd2FzIHNldCBpZiB2ZXJpdHkgZmFpbGVkLiAqLw0KPiA+ICAg
CQlpZiAoZmFpbGVkIHx8IFBhZ2VFcnJvcihycGFnZSkpIHsNCj4gPiAgIAkJCUNsZWFyUGFnZVVw
dG9kYXRlKHJwYWdlKTsNCj4gPiBAQCAtMTc3MiwxMCArMTc3NiwxMSBAQCB2b2lkIGYyZnNfaW52
YWxpZGF0ZV9jb21wcmVzc19wYWdlKHN0cnVjdA0KPiBmMmZzX3NiX2luZm8gKnNiaSwgYmxvY2tf
dCBibGthZGRyKQ0KPiA+ICAgfQ0KPiA+DQo+ID4gICB2b2lkIGYyZnNfY2FjaGVfY29tcHJlc3Nl
ZF9wYWdlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IHBhZ2UNCj4gKnBhZ2UsDQo+
ID4gLQkJCQkJCW5pZF90IGlubywgYmxvY2tfdCBibGthZGRyKQ0KPiA+ICsJCQkJc3RydWN0IGRl
Y29tcHJlc3NfaW9fY3R4ICpkaWMsIGJsb2NrX3QgYmxrYWRkcikNCj4gPiAgIHsNCj4gPiAgIAlz
dHJ1Y3QgcGFnZSAqY3BhZ2U7DQo+ID4gICAJaW50IHJldDsNCj4gPiArCW5pZF90IGlubyA9IGRp
Yy0+aW5vZGUtPmlfaW5vOw0KPiA+DQo+ID4gICAJaWYgKCF0ZXN0X29wdChzYmksIENPTVBSRVNT
X0NBQ0hFKSkNCj4gPiAgIAkJcmV0dXJuOw0KPiA+IEBAIC0xODA0LDYgKzE4MDksNyBAQCB2b2lk
IGYyZnNfY2FjaGVfY29tcHJlc3NlZF9wYWdlKHN0cnVjdA0KPiBmMmZzX3NiX2luZm8gKnNiaSwg
c3RydWN0IHBhZ2UgKnBhZ2UsDQo+ID4gICAJfQ0KPiA+DQo+ID4gICAJc2V0X3BhZ2VfcHJpdmF0
ZV9kYXRhKGNwYWdlLCBpbm8pOw0KPiA+ICsJZGljLT5jcGFnZV9jYWNoZWQgPSB0cnVlOw0KPiA+
DQo+ID4gICAJaWYgKCFmMmZzX2lzX3ZhbGlkX2Jsa2FkZHIoc2JpLCBibGthZGRyLA0KPiBEQVRB
X0dFTkVSSUNfRU5IQU5DRV9SRUFEKSkNCj4gPiAgIAkJZ290byBvdXQ7DQo+ID4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmggaW5kZXgNCj4gPiBhYzZkZGE2YzRj
NWEuLjEyODE5MGIwYzczNyAxMDA2NDQNCj4gPiAtLS0gYS9mcy9mMmZzL2YyZnMuaA0KPiA+ICsr
KyBiL2ZzL2YyZnMvZjJmcy5oDQo+ID4gQEAgLTE1NTEsNiArMTU1MSw3IEBAIHN0cnVjdCBkZWNv
bXByZXNzX2lvX2N0eCB7DQo+ID4gICAJICovDQo+ID4gICAJcmVmY291bnRfdCByZWZjbnQ7DQo+
ID4NCj4gPiArCWJvb2wgY3BhZ2VfY2FjaGVkOwkJLyogaW5kaWNhdGUgY3BhZ2VzIGNhY2hlZCBp
biBjb21wcmVzcw0KPiBtYXBwaW5nKi8NCj4gPiAgIAlib29sIGZhaWxlZDsJCQkvKiBJTyBlcnJv
ciBvY2N1cnJlZCBiZWZvcmUgZGVjb21wcmVzc2lvbj8NCj4gKi8NCj4gPiAgIAlib29sIG5lZWRf
dmVyaXR5OwkJLyogbmVlZCBmcy12ZXJpdHkgdmVyaWZpY2F0aW9uIGFmdGVyDQo+IGRlY29tcHJl
c3Npb24/ICovDQo+ID4gICAJdm9pZCAqcHJpdmF0ZTsJCQkvKiBwYXlsb2FkIGJ1ZmZlciBmb3Ig
c3BlY2lmaWVkDQo+IGRlY29tcHJlc3Npb24gYWxnb3JpdGhtICovDQo+ID4gQEAgLTQwODUsNyAr
NDA4Niw3IEBAIHZvaWQgZjJmc19kZXN0cm95X2NvbXByZXNzX2NhY2hlKHZvaWQpOw0KPiA+ICAg
c3RydWN0IGFkZHJlc3Nfc3BhY2UgKkNPTVBSRVNTX01BUFBJTkcoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpKTsNCj4gPiAgIHZvaWQgZjJmc19pbnZhbGlkYXRlX2NvbXByZXNzX3BhZ2Uoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLCBibG9ja190DQo+IGJsa2FkZHIpOw0KPiA+ICAgdm9pZCBmMmZz
X2NhY2hlX2NvbXByZXNzZWRfcGFnZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBw
YWdlDQo+ICpwYWdlLA0KPiA+IC0JCQkJCQluaWRfdCBpbm8sIGJsb2NrX3QgYmxrYWRkcik7DQo+
ID4gKwkJCQlzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYywgYmxvY2tfdCBibGthZGRyKTsN
Cj4gPiAgIGJvb2wgZjJmc19sb2FkX2NvbXByZXNzZWRfcGFnZShzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksIHN0cnVjdCBwYWdlDQo+ICpwYWdlLA0KPiA+ICAgCQkJCQkJCQlibG9ja190IGJsa2Fk
ZHIpOw0KPiA+ICAgdm9pZCBmMmZzX2ludmFsaWRhdGVfY29tcHJlc3NfcGFnZXMoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLCBuaWRfdA0KPiA+IGlubyk7IEBAIC00MTM3LDggKzQxMzgsOCBAQCBz
dGF0aWMgaW5saW5lIGludCBfX2luaXQNCj4gZjJmc19pbml0X2NvbXByZXNzX2NhY2hlKHZvaWQp
IHsgcmV0dXJuIDA7IH0NCj4gPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX2Rlc3Ryb3lfY29t
cHJlc3NfY2FjaGUodm9pZCkgeyB9DQo+ID4gICBzdGF0aWMgaW5saW5lIHZvaWQgZjJmc19pbnZh
bGlkYXRlX2NvbXByZXNzX3BhZ2Uoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLA0KPiA+ICAgCQkJ
CWJsb2NrX3QgYmxrYWRkcikgeyB9DQo+ID4gLXN0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX2NhY2hl
X2NvbXByZXNzZWRfcGFnZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksDQo+ID4gLQkJCQlzdHJ1
Y3QgcGFnZSAqcGFnZSwgbmlkX3QgaW5vLCBibG9ja190IGJsa2FkZHIpIHsgfQ0KPiA+ICtzdGF0
aWMgaW5saW5lIHZvaWQgZjJmc19jYWNoZV9jb21wcmVzc2VkX3BhZ2Uoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLA0KPiBzdHJ1Y3QgcGFnZSAqcGFnZSwNCj4gPiArCQkJCXN0cnVjdCBkZWNvbXBy
ZXNzX2lvX2N0eCAqZGljLCBibG9ja190IGJsa2FkZHIpIHsgfQ0KPiA+ICAgc3RhdGljIGlubGlu
ZSBib29sIGYyZnNfbG9hZF9jb21wcmVzc2VkX3BhZ2Uoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LA0KPiA+ICAgCQkJCXN0cnVjdCBwYWdlICpwYWdlLCBibG9ja190IGJsa2FkZHIpIHsgcmV0dXJu
IGZhbHNlOyB9DQo+ID4gICBzdGF0aWMgaW5saW5lIHZvaWQgZjJmc19pbnZhbGlkYXRlX2NvbXBy
ZXNzX3BhZ2VzKHN0cnVjdA0KPiA+IGYyZnNfc2JfaW5mbyAqc2JpLA0KPiA+DQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
