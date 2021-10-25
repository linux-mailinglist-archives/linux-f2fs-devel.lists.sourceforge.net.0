Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE0743923A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Oct 2021 11:24:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mewD3-0005kJ-5u; Mon, 25 Oct 2021 09:24:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1mewCx-0005k2-RD
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Oct 2021 09:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8yObeCLuELvGdha/tc9t1oexbeybI7wFKhTPlPPuTPs=; b=P1GpGYy2tdJglfUMRm2aCdfDq1
 buJkMAfrRVP3YPnZqwyYsalsCYFfVrW6Ksrh4/52Q+Eq01dh5jf5K9zkAzumBZcWnsujKIA2nZ1VE
 4ykY49b9PpaBfJu720cD+TSqmJrwux9Di78JLg41UoCUAbWB/Ha69r0bQjkY522uWuzU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8yObeCLuELvGdha/tc9t1oexbeybI7wFKhTPlPPuTPs=; b=blLMCYQQcX6WXZRflvH4LXSs+i
 xmT+UfXrnrp26Crl782C/gjWsihVJbWMMVodb+NW+s5PbxHq3awhV/rYoFzMmWOyiPohNUAbUeAA7
 dPz6AUsP3/P2GBasJTe+KtJCu6eKHF0SL/5ZdchWft0018pN+XnKrMi9XKvG57AX9xJ0=;
Received: from mail-eopbgr1300094.outbound.protection.outlook.com
 ([40.107.130.94] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mewCq-00FQUI-AL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Oct 2021 09:23:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgVrJWwpDSPew/b03Ug507XmWSVPc65cUGslBHl1zj9EoXDjY5w1dikBs4dyOBouAgL6OIl/CLno65uHaW2d05JO+X4dWEGJpZRQZIP3dNGnwu/LK26DLKewE3/YXzsws3KyxUilthE61fTWXl5J36eo7tx83S1eGWOYnrvwD9kCIsueTvHDY2rolHmgI3BDpSPmNh1K/kn3jNhWRdvvCOkOrEUJJpMt1hGeQ6J2c/nrv+i+dZo/+orn77Sz6SmR442mp/k+j2H53EkHdyMIE2nGs0iALoi3lhBoWFTMIkjuXebvRw1NI7Qk/15ONr3cAOY182UADLq5bYBc6XYCFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yObeCLuELvGdha/tc9t1oexbeybI7wFKhTPlPPuTPs=;
 b=Sd5NvQIapLY9JNKAzQO2ykt4YMWM/RF7DXvGgt4s30E+l/ewZAFMV/Tyx/UWGo1pX7SGGFL7cz5tduMIvsnJRJb22SDHbINI/Vcr++CAXhoE9xIvXKmGfOH0zij9NqaHrKleDeD+abiiwzAAh8CG/4Y5bFaS4b8ceRJpG0dKdpXL6ICQJC1FpeUANj0XlMRML/kQtFyL9rJSxmt7a7sy83n09mf/WR1Z9mu7F9SESVQ66Cj90y/i9lzUVFIREGINPT5YQWy2zvnmaTKS9DDlP+LfxLdLutFvC1Z/k3NmF2DUjaUCRm4vrWzDPiMf5aeGooKxha4eYWzveNDLFvMVVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yObeCLuELvGdha/tc9t1oexbeybI7wFKhTPlPPuTPs=;
 b=dGGH9BDKOjcj5lM8/IwNhjiNXwNYIE+MAUJ/ItgXuUpM8Y7i6ZPDYHA23qg5geHQaR3iy1gBZr3EvXMXKGGQpmWiohMmTOunH+M8+kYB/Ke9XHiRF0CB57gAKYD+MAdOetSzpUByutLVToyiMO1UUAfrEC+JRL1EhirTI+l3olU=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB4049.apcprd06.prod.outlook.com (2603:1096:820:22::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Mon, 25 Oct
 2021 09:23:37 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%5]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 09:23:36 +0000
From: =?gb2312?B?s6O37+mq?= <changfengnan@vivo.com>
To: =?gb2312?B?s6O37+mq?= <changfengnan@vivo.com>, "chao@kernel.org"
 <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [PATCH v1] f2fs: compress: reduce one page array alloc and free
 when write compressed page
Thread-Index: AQHXn9hc6D9gyrPODUe/6gsvDogGu6vjw4wg
Date: Mon, 25 Oct 2021 09:23:36 +0000
Message-ID: <KL1PR0601MB4003668527080D9D68E51ED7BB839@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20210723083745.172016-1-changfengnan@vivo.com>
In-Reply-To: <20210723083745.172016-1-changfengnan@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8decea1-bad4-4c6e-c70f-08d997991fb6
x-ms-traffictypediagnostic: KL1PR0601MB4049:
x-microsoft-antispam-prvs: <KL1PR0601MB4049C6D3D6CECAFA4EE4CAF1BB839@KL1PR0601MB4049.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eJ0/AUNWy4+vGt5QRX3Fw2a6zuImJT99BIo6n8NOGlE5/Rgm43L7fazrDUQKVlymZ6iJzzVTnZNsuhZsTg3AyFb6oXZ+P+dpkHEWXLeTg0ZZNNKlmglrk6u08NdQLwez8WRZsARxxkRSkestdQ6/ZY8Lqo6FtFpfVEjDzksPjc1TC0f6GYLIMxxIjrrtOzBMQwtjbLPKfIlR61+SJ5ezmzEWmfctyQZEHjRGxP6bqD+LFi0b2FCT126U5qATHpXqOMCo8y4BcxwHxnNmQzjJBT0/w+XO/yjZFoV5HtH+V5zgs/GEGt9dqJP5K0IsnyA3LHlLtNxu2Pk6boOHFjUrNE5jO1z1l/6UbpJR7NkW71rSQ7SLJwWYgXsFpW5BI3DrnFQ0WHyL4nhIvzKUNvY9yAQPwfcULTnoW8cHVdNeDLo1GfjjDOaBA6W+3MPV9/xwIuZOdZZkRYL5s6CVkS8AXnUtiR6k0jXgfLjCoDyMCYbV1TLJp96DTbkGtmq7XhbPkrY6oSkIHJb2LyR0fYEBSfbBiPzvtbJPUM/6GIaMYXndylSVWdfspz+SNcrfeh4sxRk5D+oxa2T8UQD071b2qYlhy00243lRK9dmGoYdR3xRFOTVsinPUcNRK7gJf3rQxkdpM7zIvsDxghEKjX0p0B60maTpDu/JDp4hF5MyAqio2VjE4dk5HeJQ4nKm+M/HzVPEQjCnxPNZuWU9QjUT4Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(316002)(186003)(38070700005)(7696005)(9686003)(5660300002)(6506007)(53546011)(55016002)(86362001)(71200400001)(66556008)(508600001)(26005)(66446008)(76116006)(122000001)(66946007)(2906002)(8676002)(52536014)(8936002)(38100700002)(85182001)(83380400001)(64756008)(66476007)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?RUR1eWNUK0hmaVhGcEo4d3J0eXVxajkyMy9KNDBPTml5T0IxZ21IWkEzdjAw?=
 =?gb2312?B?ZnI5Wm8vMVdsQ2V0azg1OEh3QUxzTXJKSXNpYTNyeGt3eHRCMzIxV20yemNw?=
 =?gb2312?B?MzN4c0tacU5WN21jSzVDRThhQ2ZteUkwN1pBRzYxVDlZUnQ5MFB0Wi9BYzRx?=
 =?gb2312?B?YmxaelpTei9Yc1VrMTN5WnNYWnZveVFQQTlnK1hpdmVpWTBwcjZOWHZDeE1i?=
 =?gb2312?B?T0I1Ymg4TitzUFpPV3pFd0x3bG5kTHhzNktvVDJwSFphZE8yOTRWeVIxWS9y?=
 =?gb2312?B?UFpzZEJhZEhoSDZ0TnVGQ0NtMjlaQ1Exb2FoUml2eGN2clNNeW52aGpVUXBr?=
 =?gb2312?B?QytFd1dEc284UkxMNm1TUGNPNWk4VWgxV0IrczQ1M0o0bVIrVDlkZTM4MUxY?=
 =?gb2312?B?Y2IvZFdFSHJ6SHNhc21Vakp3Mmc0TU1kUWQ0QVZUMS80S3ZzdDIwOVZydlRY?=
 =?gb2312?B?OHB3RXVIMlhvY3BBUXpCQmFKcjNFbHlqdi9zWlYySnFNODBFeXNMVzlVYUhE?=
 =?gb2312?B?V1g5S1BBbHhrV3hFSzZNUE9FeVNUcm5TeU5VOGErdEM2TzIyOFo5OUF5a2Ry?=
 =?gb2312?B?bmI3SVA1MWx4bGtHUlFObkFkQUJIYitISTdHRFFSLzUrOE8zdGU5VFBmZVd0?=
 =?gb2312?B?NjgrWUFRQ3RoTDgxUWtRQ1Izb3p5c3lqbElRMnY1UUZLOTA5S0tWQVdzdTEw?=
 =?gb2312?B?VGVDNFlpQnh4aWlHRFVCdDUrc0F5aldWT0ptSU9WZWJRWFFnWFFwejNqN0Zx?=
 =?gb2312?B?SDRCQ0dhcmxUd09wa1RSWXFKN2ozV2tHcHpjNE1wNDFIOU0xeEcvZTdQRDhM?=
 =?gb2312?B?em5nS1J2ZktVOWhsOUxoN2prQjRvYkFvNG40VVNWTUdBam5aeUlVMm1EQmcx?=
 =?gb2312?B?dTR5OTNjaVRYWWtaSTZxeGx2YldiL2VvNjRjbXduKys1eEhWcllQQ3M1YzBP?=
 =?gb2312?B?U0RQRFh1NlpsYUlBa0hWblZPOHN0aWtxS1ZzRnc2TC9oQU1ZMzhwaUtaSmN5?=
 =?gb2312?B?d0VYNkVicG5XOUhpMnh6ZjhJYmN4UkZmUDIrc1N1dDc1dFVpVDh6V0RUN1Bl?=
 =?gb2312?B?SnpRVmZFMzlhWGkzdExyanN6L2ZnamlmclVLSUR6Nms5dmlQc3lvZnNZY2la?=
 =?gb2312?B?R3dOYmVGSm9MM1ZEenoxRFB4S1V0SDQ1bGdKaVYzR29QMzhacjJXaTRHcExM?=
 =?gb2312?B?RTNmdUNMSXc1T3FMRDN5QXUwamF2eTAzRElzYVBJcFV6RFVVOGwrbGpGcTFF?=
 =?gb2312?B?YzQ3bVh6dC93L1hmOVM3Zi9FRGNxbSs1WFdid29nQ1Vza1NLUnI5WGRmaHNJ?=
 =?gb2312?B?S2tQUkEyL0pnVGtpSlRiRnNVNkdYS1N5bGFqYWcvMXd6YWFuR0FIcG1lV3lu?=
 =?gb2312?B?REVZM3dBQjkzRkRuZEk3cUhBTi85L0M4WDQ5T0d2SUVhRldGc1ZpTVd5MTNz?=
 =?gb2312?B?STdDMnVVM1JIdEs0eW9tSndTUUdQc3lMN2hEdDJyY1RYUTZHZUh1RCsrS3A3?=
 =?gb2312?B?OEpHTnRRRURaNFpOWHF6QU9hMUVJNll3RkpicTFiUlpkd3l3RDdmS29VYW8r?=
 =?gb2312?B?anducDc4YmJJQktBTHJ0S0txdmZCZ09OVGVyenVCN0lvZncvME9jK0x2OEMr?=
 =?gb2312?B?dUY0eHBEOVg4T1EyZEhyUlI4c0pnWEgvbW1RUDJJV0h4S3BYa0RUWUdUV0Q3?=
 =?gb2312?B?N2R2RXJvM3RLWWZqTU03WkN4TlU0azNzVFBIRVZZOFV5ZTkyZzBQTWMwcGk1?=
 =?gb2312?B?TDBQamF5cXlhNjFWRWZhRWNZS3JnclE4cks3dEZHUmJ2Z1BLL2RSTnhvWGxI?=
 =?gb2312?B?bVkyWldsaXQ0Zk1YVk9vRVEyRk50ZlEvenNRcDUxVnM2aGVpUU9CMGtYN1oz?=
 =?gb2312?B?TzJKa3I5a3h2TURrRllqV09CMDY3d0dXNjA1NTNOdjRHYVlEa3h6WWtsY2N3?=
 =?gb2312?B?dVNUbGc5Szg1dG01RTFQUjNiTFc3a2hxTWlDZ3ZuM0VHRFN0VEJabWJldmxx?=
 =?gb2312?B?dStOZXJScmI3NG9PcVYzV1ZSKzE2VDVpZndobmE2a0pZaUsvV2l1Tk90M0Yw?=
 =?gb2312?B?V016N3dHZjltQU04ZFoxR3ZoUGg3Y0xkY1dWTG5hL0dhdFh4MVJaK3R5T3RO?=
 =?gb2312?B?b0IvYnM1cDhZU3kwZWFSVVczYjBUb0sveWcvODdQNjUzNGJrNzZNV0ttV0gw?=
 =?gb2312?B?WVE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8decea1-bad4-4c6e-c70f-08d997991fb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 09:23:36.3715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IJbSzX0uZoyRGS9ztvf5ofput9FX0EqJTahIe7Tq2+u6piIBUuRE0QyC3ZRI0Ha9ZS/WVAcPJx2Alq6KuvuZ9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4049
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  It seems this has been forgotten.. > 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.94 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.130.94 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mewCq-00FQUI-AL
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: compress: reduce one page array
 alloc and free when write compressed page
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It seems this has been forgotten..

> -----Original Message-----
> From: Fengnan Chang <changfengnan@vivo.com>
> Sent: Friday, July 23, 2021 4:38 PM
> To: chao@kernel.org; jaegeuk@kernel.org;
> linux-f2fs-devel@lists.sourceforge.net
> Cc: Fengnan Chang <changfengnan@vivo.com>
> Subject: [PATCH v1] f2fs: compress: reduce one page array alloc and free
> when write compressed page
> 
> Don't alloc new page array to replace old, just use old page array, try to
> reduce one page array alloc and free when write compress page.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>  fs/f2fs/compress.c | 18 ++++--------------
>  fs/f2fs/f2fs.h     |  1 +
>  2 files changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c index
> 455561826c7d..1395b9cec7f4 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -618,7 +618,6 @@ static int f2fs_compress_pages(struct compress_ctx
> *cc)
>  	const struct f2fs_compress_ops *cops =
>  				f2fs_cops[fi->i_compress_algorithm];
>  	unsigned int max_len, new_nr_cpages;
> -	struct page **new_cpages;
>  	u32 chksum = 0;
>  	int i, ret;
> 
> @@ -633,6 +632,7 @@ static int f2fs_compress_pages(struct compress_ctx
> *cc)
> 
>  	max_len = COMPRESS_HEADER_SIZE + cc->clen;
>  	cc->nr_cpages = DIV_ROUND_UP(max_len, PAGE_SIZE);
> +	cc->raw_nr_cpages = cc->nr_cpages;
> 
>  	cc->cpages = page_array_alloc(cc->inode, cc->nr_cpages);
>  	if (!cc->cpages) {
> @@ -683,13 +683,6 @@ static int f2fs_compress_pages(struct compress_ctx
> *cc)
> 
>  	new_nr_cpages = DIV_ROUND_UP(cc->clen + COMPRESS_HEADER_SIZE,
> PAGE_SIZE);
> 
> -	/* Now we're going to cut unnecessary tail pages */
> -	new_cpages = page_array_alloc(cc->inode, new_nr_cpages);
> -	if (!new_cpages) {
> -		ret = -ENOMEM;
> -		goto out_vunmap_cbuf;
> -	}
> -
>  	/* zero out any unused part of the last page */
>  	memset(&cc->cbuf->cdata[cc->clen], 0,
>  			(new_nr_cpages * PAGE_SIZE) -
> @@ -700,7 +693,6 @@ static int f2fs_compress_pages(struct compress_ctx
> *cc)
> 
>  	for (i = 0; i < cc->nr_cpages; i++) {
>  		if (i < new_nr_cpages) {
> -			new_cpages[i] = cc->cpages[i];
>  			continue;
>  		}
>  		f2fs_compress_free_page(cc->cpages[i]);
> @@ -710,8 +702,6 @@ static int f2fs_compress_pages(struct compress_ctx
> *cc)
>  	if (cops->destroy_compress_ctx)
>  		cops->destroy_compress_ctx(cc);
> 
> -	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
> -	cc->cpages = new_cpages;
>  	cc->nr_cpages = new_nr_cpages;
> 
>  	trace_f2fs_compress_pages_end(cc->inode, cc->cluster_idx, @@ -727,7
> +717,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
>  		if (cc->cpages[i])
>  			f2fs_compress_free_page(cc->cpages[i]);
>  	}
> -	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
> +	page_array_free(cc->inode, cc->cpages, cc->raw_nr_cpages);
>  	cc->cpages = NULL;
>  destroy_compress_ctx:
>  	if (cops->destroy_compress_ctx)
> @@ -1330,7 +1320,7 @@ static int f2fs_write_compressed_pages(struct
> compress_ctx *cc,
>  	spin_unlock(&fi->i_size_lock);
> 
>  	f2fs_put_rpages(cc);
> -	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
> +	page_array_free(cc->inode, cc->cpages, cc->raw_nr_cpages);
>  	cc->cpages = NULL;
>  	f2fs_destroy_compress_ctx(cc, false);
>  	return 0;
> @@ -1356,7 +1346,7 @@ static int f2fs_write_compressed_pages(struct
> compress_ctx *cc,
>  	else
>  		f2fs_unlock_op(sbi);
>  out_free:
> -	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
> +	page_array_free(cc->inode, cc->cpages, cc->raw_nr_cpages);
>  	cc->cpages = NULL;
>  	return -EAGAIN;
>  }
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h index 867f2c5d9559..8b1f84d88a65
> 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1454,6 +1454,7 @@ struct compress_ctx {
>  	unsigned int nr_rpages;		/* total page number in rpages */
>  	struct page **cpages;		/* pages store compressed data in cluster
> */
>  	unsigned int nr_cpages;		/* total page number in cpages */
> +	unsigned int raw_nr_cpages;	/* max total page number in cpages */
>  	void *rbuf;			/* virtual mapped address on rpages */
>  	struct compress_data *cbuf;	/* virtual mapped address on cpages */
>  	size_t rlen;			/* valid data length in rbuf */
> --
> 2.29.0
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
