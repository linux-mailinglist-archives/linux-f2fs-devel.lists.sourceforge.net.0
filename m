Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F76506290
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 05:22:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngeRu-0002c9-Gq; Tue, 19 Apr 2022 03:22:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1ngeRt-0002c3-U7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 03:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vPufU/3c3D4WIa2W8KmD6j5ogA94uvlga5imJyah4wM=; b=CgkIzI5p5OamZrZ/VpVRGhG00H
 9H8gtPggQ+PWNYE/ZXpPBTkhfmc2Geju4UI64TkrbO176rOejL3xVISuIfKBgHikMfUl6wHCzAuLB
 5L8YWzavTeG8+Z6rArBqEYrAhMhRFhCl2X8OWfzIXyvnOV6L2DxWVlgWVHzw4aeHjZPc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vPufU/3c3D4WIa2W8KmD6j5ogA94uvlga5imJyah4wM=; b=mCR5duJazZGsSK2pwR7XkIguUx
 mwQVQpIlwKNV0V7U1BVDOcGL56xaVWmrtTQNa2vB0ClbF5anHm1IslvuBLMT8BzRoXj2EA//Eskbx
 K7UaLCONtdDCVn19zQBb55JFuRd1fnG+DpX3uIgi+8SYPWnRp98X/lCkN1uUIhNom2Yo=;
Received: from mail-tyzapc01on2136.outbound.protection.outlook.com
 ([40.107.117.136] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngeRt-003W21-AR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 03:22:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVTJ0OSNSGHBGIgTTT0FJvCGLG1HkpoMmEnxvfVSpqzHHEye2lQMFeXjzBEztDqg4veEhi2nDzNbzGnxkXrDZQlnStIvGLu3d6ecBdzCLjlFstPmSLJy4kLhwu0zwZhDleIMX6bd2TdQwJ9EXWHDFjq5J3qm26Pm49Qao3UMXycuogHt90ndInNtCHO1NjHKYPfe06cHfmsdhiNSc+//3VnWn057uNGGzFcQ6S3UTdXmPAkJKNcmPmh64tp2octBkg9+euU6SNcQ8GDrR1vpS/42KWcwZi7zcimXWPU0++z5MtophxwecEjjP/cpQGOkYJnH3/vN/x8dZQ+F+apLLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPufU/3c3D4WIa2W8KmD6j5ogA94uvlga5imJyah4wM=;
 b=Vj2kOxfuM7Dols/PUh72IVE8/bhikYHfO9p2HK0fAu/jcgwXiEKQusgU0rygfgcdC1t4UrYL6/vKjsnJXoybj853xoJao7p3zUM9ZRJ6f9haEz0qxWOZ8QrUwiw2+7gOXrSk4gJcikejNy+0F8tA6kI/KvK/rSdVXIN8lkl97HfT5ljfeVKVLL4PYWPtga4PtvW+wLY7cvE8qTEouGzuJxNbq2SvpFuG4v4MYTlbaWbd1HY7600efr+Yw4k5yeYnsazLoow3/PhS6Q3i2O68V2cC7pOzeZIffXw87EECWEdgq8pDfkDgFaEwPLe50fA3I0wDbyHKmtDgGkn/JLsd3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPufU/3c3D4WIa2W8KmD6j5ogA94uvlga5imJyah4wM=;
 b=pENgm9P+TV+IF6enQJvAus4tmFULuSQOHnHUBg+umxHNFVPjJsStz2+RfFLz+F+FVlZBGg3JDbH5FxQ5kzjGZusRmvVPPbzn+W30e+xei39BCpdHfbgf617Yh8oNb/hkKH/w39xASL+frwQvd1V83oRLpIPYgUle9IX+bDtokL4=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by SEYPR06MB5254.apcprd06.prod.outlook.com (2603:1096:101:86::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.19; Tue, 19 Apr
 2022 03:22:32 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f0c7:9081:8b5a:7e7e]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f0c7:9081:8b5a:7e7e%8]) with mapi id 15.20.5164.026; Tue, 19 Apr 2022
 03:22:31 +0000
To: Eric Biggers <ebiggers@kernel.org>
Thread-Topic: [PATCH 2/3] f2fs: notify when device not supprt inlinecrypt
Thread-Index: AQHYUu45GoDAOd0+BUSILnKkLO2jc6z1RCGAgAABOZCAAPuzAIAATRAwgAAEZwCAAACpwA==
Date: Tue, 19 Apr 2022 03:22:31 +0000
Message-ID: <KL1PR0601MB4003E83BD65B8381C030FAC3BBF29@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20220418063312.63181-1-changfengnan@vivo.com>
 <20220418063312.63181-2-changfengnan@vivo.com>
 <Yl0RmUoZypbVmayj@sol.localdomain>
 <KL1PR0601MB400369725474F2A2DE647057BBF39@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <Yl3lxMnZ5teL+bkU@sol.localdomain>
 <KL1PR0601MB4003A659B51814320E156C35BBF29@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <Yl4qGkrfMT7FqbJj@sol.localdomain>
In-Reply-To: <Yl4qGkrfMT7FqbJj@sol.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5deaf085-5f65-455c-ee19-08da21b3d71d
x-ms-traffictypediagnostic: SEYPR06MB5254:EE_
x-microsoft-antispam-prvs: <SEYPR06MB5254633CF5A38C2BF12C1919BBF29@SEYPR06MB5254.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IC5XtlboOySQlnDAtfEUo2wXqpwOechquHDWaz23vvkgkgazAbUGITJXnSCUdWAfsnQu/ps2v624PZf+NU6YiD/twwpgB0JQUhLT2RcJ2Cd1LOO7w3yh2tqKv996fH8SrLZnSNea2z6rS9Ttp5U+rFcONWLSuPMxNQl2uswgMO5EUrrDP06El6bDK8IHULUEqPOSKobaESXviMuDOeZ6SXxddtO2G9FWa8Yl74NI/weFitIbsGj9OzYkzregT6HKlpE1biAFlG6At3cUJO9D5Qcu2GMjjTW28CD9rBQq0eQ/1OONuzAlGcbugQfDekWr/EelDcas9nKwiWGL0q8PP+NBghxptC19JyXv6nadKFN6fwlmSgN1HL4sO2NUQM8C1hujUoQ/nyew6pK5bRpGSX2kY66NvJEL0pMp1vYR9J99eiD8sZkPJOcxZ9uq44Y7+H1YOlZOghcsCWN8zKqgwX0mVQIMnQdmN3Bkejo0cupOnHGYnkSyczSCbKA//W13BiRfqvM+IKJpp/kdbs5/spklvA00rK9ZzV4jPuRLny2Ky8C/mSzQMXjcRxd/Iezr0L/LdMc41VBcHMnYsJwE65ajjdJjqc/WgwQLWvuPGxWfLByPwK+fcUNIgNE7Hzw/qlmwIJeVYfT0bRaOG73r+40vYBxByTzx/I81NHW8AoEz63YqXB08FWTfI+A3xP7Ded5mDzynH0/XLPK/LJjMMHq3Kbly1RRWRlMCblaXaI1bZvFMc4vQgJjNLYiT5W4OrefWQjTK2QmJDaZ4HjTrdgAJLLejPofpFsSoAGuzXgM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(66446008)(966005)(52536014)(33656002)(64756008)(38070700005)(8936002)(66476007)(4326008)(26005)(186003)(55016003)(53546011)(86362001)(8676002)(71200400001)(6916009)(2906002)(508600001)(9686003)(4744005)(66946007)(85182001)(122000001)(76116006)(316002)(54906003)(83380400001)(38100700002)(5660300002)(6506007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vm8xUUlEVmo2T2FXSlJieTBqelBOZGVRWElPUmpIdm5TdnhFWVh0NTdJN0VP?=
 =?utf-8?B?N2x1RnVMK0EvRU1lbkxOZDNNMFdqTFRVQVF6dEpCN3JncjQzZ3AyQmIzbzV5?=
 =?utf-8?B?OEZPWkZxdXBvQkw0blR1Q3VuUCsrQW9odkRkRXl1cEVuR25NWEZLeWcrY2pB?=
 =?utf-8?B?VUxrb0VsaG94YTZac2w2SXlOMzNURkdWOFd5MXgwRGxYSlhlRVlpckNTNmR1?=
 =?utf-8?B?S2Q1emVhd1ZQODN5L2ZiMy84TDh6KzJGQnNvdHQwZk1CK1FDbUp3d21oMHJs?=
 =?utf-8?B?amJ0Mnc1V3pibm1DZTJsQ1JuUmJZSlZROVpoWFNwdVRwUDRTVlNUK3dLU2ho?=
 =?utf-8?B?eDM3eGxNSWFDYnZWKzJLOVVISW1HSHErQkhRby9DN2ZZNEdSRHQ1WGVzeGxC?=
 =?utf-8?B?MzRUU3lYWXdCWFdKa0YzYllrbmdYUFJBaDNOb0czemV4WHRKaXNrSEVGOEdF?=
 =?utf-8?B?bXJ3YjcrK0VJZW1RQUZZVzE3V3JwOTVCZ0VFR1BOZEY3N0Q0SkJVTmRiTW9k?=
 =?utf-8?B?M0hhZ3JwcDhMLzB3bFovZzFtMEdQZm01bEtDb3c5bXhFcDVtUk9JcFdiaE16?=
 =?utf-8?B?VVhiQ1NHY1cxTlJ5SWNFU0I4VktzR3ZIQTdqckJuYXQzVXhXMHZ0cElSQXZB?=
 =?utf-8?B?TFdHV2dNdXJpV2Z0LzBIekU2TEo5bHkyemRBWDJqN3lXRkx1RThDaDdST0g3?=
 =?utf-8?B?RG9WbStFZVBHTDJEV3ZQRkNOdURldnRuMzJZVnBZUS95RkNSYmN4UHB0QlRm?=
 =?utf-8?B?b0NRa00xVE9hcnh3RTJZblMwTGpWVWVhOGw4cFd4anljcWNIMHgvUk1tazEz?=
 =?utf-8?B?ckhqZXlCY29yUE5vcVZNaElpdDF5aEVjd3o1VW5VaE9Gc0hYZW9NK1R5TXZN?=
 =?utf-8?B?SnNTK1o5UGt1WGlaeHZiMUVNUTNiS3hvSk1UZVhBeFJubE9icFV0NzRqQXY4?=
 =?utf-8?B?ZGIrN0FvV0JqeDVEWVE4MFNNRGQvdW5KdW1LSzNpbEpDOTNBTlZ2MVFzUEdh?=
 =?utf-8?B?MXlDWEs2eEtUWUMvL1QvZ2dZRVdKdXpDUko5anpBNmJOdmxITXV5cWVDa0dM?=
 =?utf-8?B?OVlyeFdqTXhESDFicVovUTlYbUJWRHBXZ0xSOE9QM2xWeFRuRHRacFFqMSti?=
 =?utf-8?B?SkhqUXJhK2dEVkpKbjROVkg1bHFYU1JJeVNMeThxazdJRXNRUU51RlYwZnk5?=
 =?utf-8?B?UWhRRGo4b1RuWkI0Mk1CMDczZ1M2QlZHUnRCWGtZR04rb01QcHpBdGV6QVQ1?=
 =?utf-8?B?TEVpWFdxc050cHdzZ0YxbTBGZVJvUWt0c2JoSEdqcys1aXltT1I0NW5FTWNm?=
 =?utf-8?B?WlVDMkRMb0JsZEdTdE1sRGxFQ3FjV21Dek1LY2ZLcDV5MUtNL1VLWjRic1lk?=
 =?utf-8?B?ZFlidms2N3UwVUFBK1dOODd0dmcyOXZGa0lzUDR3amY3K0xVUDRvdTBzUFpi?=
 =?utf-8?B?eE9UN0lSTGwvU3doQ0Q2NVY5WjZ6OUMwbndkV1BQTDNSSnE4NUhGWmtiUnJx?=
 =?utf-8?B?TENBTEJYYW9IcUhVNzNFS1JwamtyRnBkOEZqdWhYOFh5MGYxZ1F3NnpnaUYv?=
 =?utf-8?B?ZzdMTmdjMW1EWHVpMTZoaTdxVjd4aUU1am5hUHZtMlZWY2tqd2pBUTlmWldZ?=
 =?utf-8?B?VU9nV3F0b1VEY0YwRk1BQXV3UkZ5T0M1NmRSUmYzMmdMclJvZlNOditjN0RC?=
 =?utf-8?B?dWVVN1FDTEV0U21FMG1VUmdLcjNxWEdsL1A4WndsU3NkRGdXbVBJZ3B1ei9x?=
 =?utf-8?B?dkVuTWFPNVdkSUZOM1k2cWlvSmxOQnpTTVV1MlBSSitSOHN5Z2lqSUI1K0JR?=
 =?utf-8?B?aEoxUVdvL29nbGQvKyt6bHRaV3BubXFKVlpNbEpCb05JSHhQRW90UG55NUJW?=
 =?utf-8?B?UTkzREZ2YUR6UUFjaVpuSmIzemlsZWt0QUFQclFWM3NRUDRlQWs5VWxLd3Jj?=
 =?utf-8?B?ZitrT2tjb0lnQWRlRmc3QmdpY1dSMVZjLzBtRk52RGZEYmJodUNsOWtreHJP?=
 =?utf-8?B?VnZWSFFKTDhidHdJcVdPL3BBenNYbUl1blZkdEdjMFJDYW16YUlNQ1RMOFQ5?=
 =?utf-8?B?ekI1WkFZdHZ2cWhiZ1ArWllnZGh3eVdJUnczdEJZQzNLTHlhWU5QaUREaDQr?=
 =?utf-8?B?dGZjT2NJMklJZFloY1RiZGRyZEhiV0NyWjNLUlRwVDBaT2Q0YnJNSFFJRFlo?=
 =?utf-8?B?b1AzQXorUnhPRzl3aDJOS0NEU0YrOXNLSTF5Y3hjRVJRQjNTelQwS0I2dWlK?=
 =?utf-8?B?WFc0TFI5U1ducERkbjJwUkZ0b2xZZXRsRmxLeTZ0SndsQjZXRnJ1VG85VXFh?=
 =?utf-8?B?TTFkUTFXNk5yUUlmdG1TRWlUbEliN1BSakcwV3Fsd1dVMkNjRXJPdz09?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5deaf085-5f65-455c-ee19-08da21b3d71d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 03:22:31.2503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bJNdVwB7GmKRpLtPqdvhMDJD+O5SUgzUreaHyZAYcR4K1K1EWtog+xVrkBmcQFpWWZfTyb0zz5w7SODIrvINVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5254
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
 [40.107.117.136 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.136 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1ngeRt-003W21-AR
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: notify when device not supprt
 inlinecrypt
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
Cc: "axboe@kernel.dk" <axboe@kernel.dk>, "tytso@mit.edu" <tytso@mit.edu>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBFcmljIEJpZ2dlcnMgPGViaWdn
ZXJzQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDE5LCAyMDIyIDExOjE5IEFN
DQo+IFRvOiDluLjlh6TmpaAgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4NCj4gQ2M6IGphZWdldWtA
a2VybmVsLm9yZzsgY2hhb0BrZXJuZWwub3JnOyB0eXRzb0BtaXQuZWR1Ow0KPiBhZGlsZ2VyLmtl
cm5lbEBkaWxnZXIuY2E7IGF4Ym9lQGtlcm5lbC5kazsgbGludXgtYmxvY2tAdmdlci5rZXJuZWwu
b3JnOw0KPiBsaW51eC1leHQ0QHZnZXIua2VybmVsLm9yZzsgbGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzNdIGYyZnM6IG5vdGlm
eSB3aGVuIGRldmljZSBub3Qgc3VwcHJ0IGlubGluZWNyeXB0DQo+IA0KPiBPbiBUdWUsIEFwciAx
OSwgMjAyMiBhdCAwMzoxNDo1MUFNICswMDAwLCDluLjlh6TmpaAgd3JvdGU6DQo+ID4NCj4gPiBU
aGFua3MgZm9yIHlvdXIgZXhwbGFuYXRpb24sIHRoaXMgcGF0Y2hzZXQgaGFzIHRvbyBtYW55IGNh
c2UgdG8gZm9yZ2V0IHRvDQo+IGhhbmRsZS4uLg0KPiA+IEJhY2sgdG8gbXkgZmlyc3QgdGhvdWdo
dCwgbWF5YmUgdGhlcmUgc2hvdWxkIGhhdmUgb25lIHN5c2ZzIG5vZGUgdG8NCj4gPiBpbmRpY2F0
ZSB0aGUgZGV2aWNlIHN1cHBvcnQgaW5saW5lY3J5cHQgb3Igbm90ID8gU28gdXNlciBjYW4ga25v
dyBpdCdzDQo+ID4gZGV2aWNlIG5vdCBzdXBwb3J0IGlubGluZWNyeXB0IGFuZCBub3QgZm9yIG90
aGVyIHJlYXNvbnMuDQo+ID4NCj4gDQo+IExpbnV4IHY1LjE4IGhhcyB0aGF0LiAgU2VlIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvbGludXMvMjBmMDFmMTYzMjAzNjY2MA0KPiAoImJsay1jcnlwdG86
IHNob3cgY3J5cHRvIGNhcGFiaWxpdGllcyBpbiBzeXNmcyIpLg0KT2gsIEkgc2VlLCB0aGFua3Mg
YSBsb3QuIA0KDQo+IA0KPiAtIEVyaWMNCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
