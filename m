Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF36F40DA40
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Sep 2021 14:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ol/RxSL5t2aE9COCu0w9HIDH2f2PxhbV33ZxsS2dXtQ=; b=fuj4Addw53vLm8e+/5FGKuQop
	FWy3qmYXTLteB8G1kJrbv5r1HAIB5lvilkcCxU10Dv7tTDQxbJiaGLKvHh39BTswhC2Kke/SKiAnV
	mNfHaC9ELdA9OxEu7CDVpj828lModQeaU8kbpC7pDWheLM+w7+ArpsnHerxkSLmlB//zg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mQqlv-0006Gg-2n; Thu, 16 Sep 2021 12:45:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1mQqls-0006GT-ID
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Sep 2021 12:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=42xKJ6ACv2vh3QB+oM/ixlEPiLIblPoZ0wFm3vAuL5M=; b=hgTyLf9nYwIY/bll+7lQEPwa7Z
 e0GUIqOdpuS8xwhQuUPeZPI1dVyi/TyYtfXUM6QtiUmeKuWoPHSw/vVUMeI0x3ddx7IzmwgRQZP58
 SlR9awtsTXWsQKqHUx3Q/As2DZSothNRFHJF0ecmaFyp5ORKSsaOoVFwOV35Ko5D/jAo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=42xKJ6ACv2vh3QB+oM/ixlEPiLIblPoZ0wFm3vAuL5M=; b=h2KxvX2jX0092pF2FpnlRUwxyV
 0Xm4ccZgXmWjq+bFiAVKMJ2CMx+EW7Vt+UOOVrEbQpseB6tGcGdhsyyPsW4LxpGo/v3t+74VRu4/N
 0QWT68DmEFQ6XdSnhTaCzIOjvhdlo2+H5iz+PZ8Hf/FQ20/v5Lqelo1uZ+HUK1vSzzTw=;
Received: from mail-eopbgr1310115.outbound.protection.outlook.com
 ([40.107.131.115] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mQqlr-00040e-H5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Sep 2021 12:45:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efaph9cAOIyCY1PNDstx/48qioCS0dKsltJJtIDoNC7WJXDFim+dJXcdQksiL9kN9hlIMXBaBYhIB8bMr3KPBev54INZdhugr8Tt9kztH45kNC63gXf8MAnbAZJXWRVXOQnvM7pqfxtXi6V8QZbxcZbMTKUu9BLOKFUi5721lOL1Knpi7lavy+RD4K+T4p6zapbeDFp1GXhKk+eNLFg3KIlrKIbvj0x6jwENEGuTmoHT2tAaodv8X+suEKcd/egwXfU9fhfg14PX/8IfORpPsoZ9MKG7aQOWoOu+m/x7xUIiZsFp7cmthxh7U8evxNmSJRQpMc+JTHpNXKY+Nm5bmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=42xKJ6ACv2vh3QB+oM/ixlEPiLIblPoZ0wFm3vAuL5M=;
 b=iT802NBoTnWnA2vZaF4MucGgLHFvw0n3Ys06SobzY4+wbNCAn20gbGBGtSTft+3KBoDuq5NO7ywNTAw485UDjfFSlS9P8mxRAkjLxF2nPhN+ZQb9YJ73HYBrcpc/btSPnFowXgAx2kRQ900/yP2cBWUkcTMTHTJ5FIoIrpbynPg+8GgXgcGrZjfSrDYTvOcBDhZrzL79ohp2gDE2Xzc0L9jqypN4+l5uGSqdy3sYVtGlogPSbgVXQk/JhDNfKtDYPJdAWjoCtxejA9mcdP4EkVGYUqIg53ypxWjrDw7w5FAjLqjL24WrTfsa8spmbmIKC4Vo+fFiVlA4LqCK7yt69Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42xKJ6ACv2vh3QB+oM/ixlEPiLIblPoZ0wFm3vAuL5M=;
 b=L+bKbFZZazPVASatt/Gc3Mh7wi55o5336nm1CYjp7BCLhMdIrTxfY+297kCbO5Xg5BiYjoWyRXmPh8Y6VQGU6eXBtQsEdITNx2qiZs35G815l/hyjs3DZMD8QPCkNzPC8Bo6+lDFDWRBI37EyEWTj5JP7KzTMGm9qpCRRjWE0Ns=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB2008.apcprd06.prod.outlook.com (2603:1096:802:a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Thu, 16 Sep
 2021 12:45:33 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970%7]) with mapi id 15.20.4523.015; Thu, 16 Sep 2021
 12:45:33 +0000
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH v2 2/2] f2fs: fix missing inplace count in overwrite with
 direct io
Thread-Index: AQHXqu5PjxLZ5rWf40GUlvKwiLN686umkaiAgAAJteA=
Date: Thu, 16 Sep 2021 12:45:33 +0000
Message-ID: <KL1PR0601MB400388BC823D5FD0558D43D2BBDC9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20210916113026.378385-1-changfengnan@vivo.com>
 <20210916113026.378385-2-changfengnan@vivo.com>
 <AFQA*QDoEjqpHYJlWwMYT4qj.9.1631794201010.Hmail.changfengnan@vivo.com>
In-Reply-To: <AFQA*QDoEjqpHYJlWwMYT4qj.9.1631794201010.Hmail.changfengnan@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 446329f3-3530-4525-eed0-08d9790fdfd8
x-ms-traffictypediagnostic: KL1PR0601MB2008:
x-microsoft-antispam-prvs: <KL1PR0601MB2008DECCC49F34E71021A5B4BBDC9@KL1PR0601MB2008.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:660;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iikcb6mZsI/S6yAt8RWVwI0JOdCMEp46e0EidSqRxVlsBd3cwx4Fu5scP97f/38rZPPizxEvSwHmg7+MB0VPA8wg7o/XsodIWnwBR/XtmlVu2Q8M5nOsqMbYKbZ5mfsRleHlR+XIQ3MayM9WV6fpOa9+dOTsr9m7cxSH6SM/Lu3w2WKxhlnrkV1/8921AHsB++MLxxunLlWG78h5vTphMfRlffMYfpS//p/iN6qXaBfi7eGFchsB/7F5MkTNZWSs+hWv9sAxeMoBEQbXCgGVrVLwitlIxMxx/NAmhfVZrYMj2C9kJPUbmwrkMr54dfdtuKzwR85OqbgLfAvIvUv7/iyyK0iPiGgTqS1AxWHWX8LZ7XQmCowF2CkUGewPDaMfZPQpZ0bLBxwHAXHUMQMbFUk7J4GfMFJTJzDepTIO6o7dHg8Dz6N+qDhESUkvrajiJDuC4+eyaGBi1aJNo56rz2EbsbjPrTlPRb1EsojyjMqeXNpTV+IgfmfYVBybaYvJavRBoW25bJWU6eEcZrDLaLW0HQh2D/aly8yBONDKb6XO82hb2YqBOD54NTb3TheWK+JlQAehg0anPA/XssIDLIinfc/sVgU0ZT6Mowk1KUhlJ8awdj9bCvNfK66QTp4/8bi19A9c2huA4zvofwxmT5Ip52pIOv4PtkMMjN+RfQspFl5hhXuYLEzNcdjUm/02NYyMcD12IaH5bjJx0yr0bQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(8676002)(66446008)(66476007)(71200400001)(110136005)(8936002)(4326008)(316002)(83380400001)(38070700005)(52536014)(6506007)(53546011)(64756008)(5660300002)(55016002)(33656002)(76116006)(38100700002)(186003)(85182001)(86362001)(7696005)(26005)(122000001)(66946007)(66556008)(478600001)(9686003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGZZZU8xdTZRd0FxNWtTTmRLYWthUXFCZ1BDdTZHd1ZFdDhoSnl5YWtRdit3?=
 =?utf-8?B?blg5cWtYcUlVNGxVYjQzVmFIV2E2STR5eDhEU0Fqd3ZaMTFiTUJhaEVHeEkx?=
 =?utf-8?B?ZUJ1d3RYOC9qM21XUlI5YkhSTlF4YjBMUGtjcWtjQ2pBUlJRMEVXUDVMZUFl?=
 =?utf-8?B?Q0VxcDV1VlRQN2tFTkdEekI2Q0Z4SWFkY3RZWVY1alBHZEZvSFFPVHhyY3BJ?=
 =?utf-8?B?MWJuM253RzFuamZVZGQ0NVJUWUJPWlp1MkRwa0U0YmN0c1RESnZ4ZFk2UDlG?=
 =?utf-8?B?NnRERkxadnFiVnZZWFdJc05uUUI5QUsvczZNaUlaV3k5aytvTWhWK2hrQWZz?=
 =?utf-8?B?dzNPWmlXZWx2R1RYNDY5ZFRFZXRrR2pTVDFyb0tkUE92S1FEem1DWFZBTk54?=
 =?utf-8?B?KzRmdlZNV2p4UExmK04zcVZUVlNMU0ZESnBua2pKYWRScll2UTB0SE9ZeHVh?=
 =?utf-8?B?YkFGeU1sVFVVZmRGYnZQd2p0NzFsTUN0THBMMmk5blRKdzkwME9lelFPcnk5?=
 =?utf-8?B?cnB3ckh1TUZITmFhSitUWXBEcnVXeFNsL0pVc3NsZlBBQ25pREpVMHBBY0lE?=
 =?utf-8?B?eGVqVENxRys3M25xWWY2ZXYwV3BRazFJWmMzdUl1eDN1OU5KNHNXUkZYMFE4?=
 =?utf-8?B?WEU3V3hEMExVRVUvYXYxcnB1dlZhSVZJZEZpcWFYQTdXRit6Vi9NRzZrVW00?=
 =?utf-8?B?dyt4Und0dHoxbEsyZjNJYmMvOEpmTHRLU0U4K2ZZTW5LWmIxWkpJMSs4SjVx?=
 =?utf-8?B?VFhmQ2Z0OVNYRjh6NWovQ3hPdktOckpwM3JPekZkdS85UnRCbVJmbDBwaC8x?=
 =?utf-8?B?YmRJOWNsY3llbGt4T0pzV3ZGV0pzZVhaRi9wWkR1aEJOY0d5UzBhTFFLQXMv?=
 =?utf-8?B?T084SVRSSkhhMk0vTWNET2RTUTdxRkFwVFQvUVNpQVZtVDFSR1VlMnZ5RTcy?=
 =?utf-8?B?ZzAxcERjV3lCWGRBR0h3ZmFkSWN4REJGTDdYamJGdlBGOVlGS3psUGUrOW43?=
 =?utf-8?B?SmphcnduV2UvdzhMSmRoZXpydU43b2hnSXFGY0FhVy84QkJORUc3M2ZLMGNj?=
 =?utf-8?B?UVdjMFE1SmJTaFpKTDcrZHg3cStoZW02LzVwbFBFeWhFZHRtenp6M3ByeHcz?=
 =?utf-8?B?OUFaV1BLUjNxb1BRaFlZelRaZDJGUllJTVRDL0FMZ29KdjlsNlVTRW9jSUtH?=
 =?utf-8?B?bHpveVpqcDQxV0xZZUc4aDZodWJtYWllYzI4SngrYndleXhPOTRyckk5NXpz?=
 =?utf-8?B?K012MXZKSWxENkNTRC95MVFadlVaNlRsNFYrRnVqRVpiMnpMMlZtNGV2Zk4y?=
 =?utf-8?B?d3NWd2lucTV6czNYdW1KREpna2pUWTF5NEpUM2Q5NnFHVXZVa1MyTE9TWVMy?=
 =?utf-8?B?T25FbXBDaTRvNkVIYXYvSVVtZGNBU3R6RWdKMTlWVitTa2ZqbFdqWC9QQVor?=
 =?utf-8?B?TGk2L3RuZ09Nbm5WYXhLYjl5azAya3FFcEhXazV0eGxCS3ZNaGcwaXBVSXVS?=
 =?utf-8?B?dzlHenJlclR3UGp1RVVOTFhPWlBxVmRuK2NvQlJ6TU8vaXlQRHVYZlBEa3Yv?=
 =?utf-8?B?dFdlYndteE5aUHE0ajVSVzdCS2VWRmhwQUsyU0NEb1FzWEcwZWRBSnF3Q3dU?=
 =?utf-8?B?RytkTWd0Wno3dGlxb2dYMWJIdHJxRXVyWFpWQkJBdHQrV0cvNnpRSThJTUhK?=
 =?utf-8?B?cjFUQVp0R0lLYU1hdkpaUEwzTytBdlBER1NIK0ZMNlAvbTdlZmVEZStndTRY?=
 =?utf-8?Q?lfcXdmnPWGrfG119uo=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 446329f3-3530-4525-eed0-08d9790fdfd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 12:45:33.4392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ct25IyG5oVZqUCTIpdrI/Q9pgh0tg8EqzY4TezH+HMhls7yVL+YxsDLrOyntSPmaTDpDXZk9bh1GCaodRhclrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB2008
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.131.115 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.131.115 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mQqlr-00040e-H5
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogY2hhbmdmZW5nbmFuQHZp
dm8uY29tIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+IE9uIEJlaGFsZiBPZg0KPiBDaGFvIFl1DQo+
IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTYsIDIwMjEgODoxMCBQTQ0KPiBUbzog5bi45Yek
5qWgIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmcNCj4gQ2M6IGxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgMi8yXSBmMmZzOiBmaXggbWlzc2luZyBpbnBsYWNlIGNvdW50IGluIG92ZXJ3cml0ZSB3
aXRoDQo+IGRpcmVjdCBpbw0KPiANCj4gT24gMjAyMS85LzE2IDE5OjMwLCBGZW5nbmFuIENoYW5n
IHdyb3RlOg0KPiA+IEZvciBub3csIG92ZXJ3cml0ZSBmaWxlIHdpdGggZGlyZWN0IGlvIHVzZSBp
bnBsYWNlIHBvbGljeSwgYnV0IG5vdA0KPiA+IGNvdW50ZWQsIGZpeCBpdC4gQW5kIHVzZSBzdGF0
X2FkZF9pbnBsYWNlX2Jsb2NrcyhzYmksIDEsICkgaW5zdGVhZCBvZg0KPiA+IHN0YXRfaW5jX2lu
cGxhY2VfYmxvY2tzKHNiLCApLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRmVuZ25hbiBDaGFu
ZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPg0KPiA+IC0tLQ0KPiA+ICAgZnMvZjJmcy9kYXRhLmMg
ICAgfCA3ICsrKysrKy0NCj4gPiAgIGZzL2YyZnMvZjJmcy5oICAgIHwgOCArKysrLS0tLQ0KPiA+
ICAgZnMvZjJmcy9zZWdtZW50LmMgfCAyICstDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYyBpbmRleA0KPiA+IGMxNDkwYjlhMTM0NS4uMGM1NzI4
ZDYzYzMzIDEwMDY0NA0KPiA+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jDQo+ID4gKysrIGIvZnMvZjJm
cy9kYXRhLmMNCj4gPiBAQCAtMTQ5MSw2ICsxNDkxLDkgQEAgaW50IGYyZnNfbWFwX2Jsb2Nrcyhz
dHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QNCj4gZjJmc19tYXBfYmxvY2tzICptYXAsDQo+ID4g
ICAJCWlmIChmbGFnID09IEYyRlNfR0VUX0JMT0NLX0RJTykNCj4gPiAgIAkJCWYyZnNfd2FpdF9v
bl9ibG9ja193cml0ZWJhY2tfcmFuZ2UoaW5vZGUsDQo+ID4gICAJCQkJCQltYXAtPm1fcGJsaywg
bWFwLT5tX2xlbik7DQo+ID4gKwkJaWYgKCFmMmZzX2xmc19tb2RlKHNiaSkgJiYgZmxhZyA9PSBG
MkZTX0dFVF9CTE9DS19ESU8gJiYNCj4gPiArCQkJCW1hcC0+bV9tYXlfY3JlYXRlKQ0KPiA+ICsJ
CQlzdGF0X2FkZF9pbnBsYWNlX2Jsb2NrcyhzYmksIG1hcC0+bV9sZW4sIHRydWUpOw0KPiA+ICAg
CQlnb3RvIG91dDsNCj4gPiAgIAl9DQo+ID4NCj4gPiBAQCAtMTU1Myw3ICsxNTU2LDkgQEAgaW50
IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QNCj4gZjJmc19tYXBf
YmxvY2tzICptYXAsDQo+ID4gICAJCQkJZ290byBzeW5jX291dDsNCj4gPiAgIAkJCWJsa2FkZHIg
PSBkbi5kYXRhX2Jsa2FkZHI7DQo+ID4gICAJCQlzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVBQ
RU5EX1dSSVRFKTsNCj4gPiAtCQl9DQo+ID4gKwkJfSBlbHNlIGlmICghY3JlYXRlICYmICFmMmZz
X2xmc19tb2RlKHNiaSkgJiYgZmxhZyA9PQ0KPiBGMkZTX0dFVF9CTE9DS19ESU8gJiYNCj4gPiAr
CQkJCW1hcC0+bV9tYXlfY3JlYXRlKQ0KPiANCj4gV2h5IG5vdA0KPiANCj4gfSBlbHNlIGlmIHsh
ZjJmc19sZnNfbW9kZShzYmkpICYmIGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tfRElPICYmDQo+IAkJ
CQkJbWFwLT5tX21heV9jcmVhdGUpDQo+IA0KDQpZb3UgYXJlIHJpZ2h0LCBubyBuZWVkIHRvIGNo
ZWNrIGNyZWF0ZS4NCg0KVGhhbmtzLg0KPiBUaGFua3MsDQo+IA0KPiA+ICsJCQlzdGF0X2FkZF9p
bnBsYWNlX2Jsb2NrcyhzYmksIDEsIHRydWUpOw0KPiA+ICAgCX0gZWxzZSB7DQo+ID4gICAJCWlm
IChjcmVhdGUpIHsNCj4gPiAgIAkJCWlmICh1bmxpa2VseShmMmZzX2NwX2Vycm9yKHNiaSkpKSB7
IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaA0KPiA+IGIvZnMvZjJmcy9mMmZzLmggaW5kZXgg
M2Q0ZWU0NDRkYjI3Li4yZDgxZTlmMGEwZWUgMTAwNjQ0DQo+ID4gLS0tIGEvZnMvZjJmcy9mMmZz
LmgNCj4gPiArKysgYi9mcy9mMmZzL2YyZnMuaA0KPiA+IEBAIC0zNzg1LDEyICszNzg1LDEyIEBA
IHN0YXRpYyBpbmxpbmUgc3RydWN0IGYyZnNfc3RhdF9pbmZvDQo+ICpGMkZTX1NUQVQoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpKQ0KPiA+ICAgCQllbHNlCQkJCQkJCQlcDQo+ID4gICAJCQkoKHNi
aSktPmJsb2NrX2NvdW50WzFdWyhjdXJzZWcpLT5hbGxvY190eXBlXSsrKTsJXA0KPiA+ICAgCX0g
d2hpbGUgKDApDQo+ID4gLSNkZWZpbmUgc3RhdF9pbmNfaW5wbGFjZV9ibG9ja3Moc2JpLCBkaXJl
Y3RfaW8pCQkJCQlcDQo+ID4gKyNkZWZpbmUgc3RhdF9hZGRfaW5wbGFjZV9ibG9ja3Moc2JpLCBj
b3VudCwgZGlyZWN0X2lvKQkJCVwNCj4gPiAgIAlkbyB7CQkJCQkJCQlcDQo+ID4gICAJCWlmIChk
aXJlY3RfaW8pCQkJCQkJXA0KPiA+IC0JCQkoYXRvbWljX2luYygmKHNiaSktPmlucGxhY2VfY291
bnRbMF0pKTsJCVwNCj4gPiArCQkJKGF0b21pY19hZGQoY291bnQsICYoc2JpKS0+aW5wbGFjZV9j
b3VudFswXSkpOyAgXA0KPiA+ICAgCQllbHNlCQkJCQkJCQlcDQo+ID4gLQkJCShhdG9taWNfaW5j
KCYoc2JpKS0+aW5wbGFjZV9jb3VudFsxXSkpOwkJXA0KPiA+ICsJCQkoYXRvbWljX2FkZChjb3Vu
dCwgJihzYmkpLT5pbnBsYWNlX2NvdW50WzFdKSk7CVwNCj4gPiAgIAl9IHdoaWxlICgwKQ0KPiA+
ICAgI2RlZmluZSBzdGF0X3VwZGF0ZV9tYXhfYXRvbWljX3dyaXRlKGlub2RlKQkJCQlcDQo+ID4g
ICAJZG8gewkJCQkJCQkJXA0KPiA+IEBAIC0zODc3LDcgKzM4NzcsNyBAQCB2b2lkIGYyZnNfdXBk
YXRlX3NpdF9pbmZvKHN0cnVjdCBmMmZzX3NiX2luZm8NCj4gKnNiaSk7DQo+ID4gICAjZGVmaW5l
IHN0YXRfaW5jX21ldGFfY291bnQoc2JpLCBibGthZGRyKQkJZG8geyB9IHdoaWxlICgwKQ0KPiA+
ICAgI2RlZmluZSBzdGF0X2luY19zZWdfdHlwZShzYmksIGN1cnNlZykJCQlkbyB7IH0gd2hpbGUg
KDApDQo+ID4gICAjZGVmaW5lIHN0YXRfaW5jX2Jsb2NrX2NvdW50KHNiaSwgY3Vyc2VnKQkJZG8g
eyB9IHdoaWxlICgwKQ0KPiA+IC0jZGVmaW5lIHN0YXRfaW5jX2lucGxhY2VfYmxvY2tzKHNiaSkJ
CQlkbyB7IH0gd2hpbGUgKDApDQo+ID4gKyNkZWZpbmUgc3RhdF9hZGRfaW5wbGFjZV9ibG9ja3Mo
c2JpLCBjb3VudCwgZGlyZWN0X2lvKQkJZG8geyB9IHdoaWxlDQo+ICgwKQ0KPiA+ICAgI2RlZmlu
ZSBzdGF0X2luY19zZWdfY291bnQoc2JpLCB0eXBlLCBnY190eXBlKQkJZG8geyB9IHdoaWxlICgw
KQ0KPiA+ICAgI2RlZmluZSBzdGF0X2luY190b3RfYmxrX2NvdW50KHNpLCBibGtzKQkJZG8geyB9
IHdoaWxlICgwKQ0KPiA+ICAgI2RlZmluZSBzdGF0X2luY19kYXRhX2Jsa19jb3VudChzYmksIGJs
a3MsIGdjX3R5cGUpCWRvIHsgfSB3aGlsZSAoMCkNCj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9z
ZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYyBpbmRleA0KPiA+IGRlZDc0NGU4ODBkMC4uYzU0
MmM0YjY4N2NhIDEwMDY0NA0KPiA+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jDQo+ID4gKysrIGIv
ZnMvZjJmcy9zZWdtZW50LmMNCj4gPiBAQCAtMzYxMSw3ICszNjExLDcgQEAgaW50IGYyZnNfaW5w
bGFjZV93cml0ZV9kYXRhKHN0cnVjdCBmMmZzX2lvX2luZm8NCj4gKmZpbykNCj4gPiAgIAkJZ290
byBkcm9wX2JpbzsNCj4gPiAgIAl9DQo+ID4NCj4gPiAtCXN0YXRfaW5jX2lucGxhY2VfYmxvY2tz
KGZpby0+c2JpLCBmYWxzZSk7DQo+ID4gKwlzdGF0X2FkZF9pbnBsYWNlX2Jsb2NrcyhzYmksIDEs
IGZhbHNlKTsNCj4gPg0KPiA+ICAgCWlmIChmaW8tPmJpbyAmJiAhKFNNX0koc2JpKS0+aXB1X3Bv
bGljeSAmICgxIDw8IEYyRlNfSVBVX05PQ0FDSEUpKSkNCj4gPiAgIAkJZXJyID0gZjJmc19tZXJn
ZV9wYWdlX2JpbyhmaW8pOw0KPiA+DQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
