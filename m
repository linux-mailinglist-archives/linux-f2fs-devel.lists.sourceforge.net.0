Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A06809A973D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2024 05:45:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t35qD-0007yS-4o;
	Tue, 22 Oct 2024 03:45:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hanqi@vivo.com>) id 1t35q8-0007yH-AP
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Oct 2024 03:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cak3I6V82n8076oL4dVeZCvppxf3Dkhb88eDEKjSoUQ=; b=GqlU+fdVg7pjFtXhDj9SK29BGW
 BCCvqR1LYebBWiHyyaJVd3vw9JEawGqd0PE+NOQiR+dU7ytpSjwtoD+VW3AcGTjTbIH3Jqv/jaNtk
 Hr7BX2EQ4QcFMcMUH9KskpX8OLJx8a6eElqTDPTgG/i2ODlCdhAB1WsxEyVDIzr/9wlE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cak3I6V82n8076oL4dVeZCvppxf3Dkhb88eDEKjSoUQ=; b=WfSQFZNzbiWNC0AdtapsOVtH+g
 KPPFDHDSwXk6C/evTPSL76e9QtY+0LccMLAR9vTeRmfFATQ+G1h8VqOPEqpLBiXH74FWXsfDaHM9p
 aS26Kre65A/Z+vyqwSBH9dTO8EHxc4bjyVSfAFmb6fhyLm4T9rDVRulIpWh/yKfaf1FM=;
Received: from mail-eastasiaazon11011052.outbound.protection.outlook.com
 ([52.101.129.52] helo=HK3PR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t35q7-0002dI-MK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Oct 2024 03:45:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2P0c3cf/9cgWjWnQcczpgpsoSVldKIBxgf7Eopv+3K30tOJ+k1w29uMBMXrW8GvpKlN8y+ZSSYIhd5VarVejN7cIhXMWX+hIpFm4aTWsZJpYOoogVU4gmAxfhmnXCKH0xoDFLPG858HJzhLj4jiZHuKqWZI4QdLgpC0n1+KYB1XyXZJUkPczSjKmn5F6vl0YXroIdFyHeNPAabuUndL1fk1zR1J5keV61U0dmv/+y6om0xuC/zwQHJ49q6xiUf4NXpfFU4FasIEoAz7pKh6r/ZNb4Ls8F5dtnL3E+vWJMfnIBHj4hDgUogmJU/bNwVgjFQ89QOy3tvpGc6wzzXsuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cak3I6V82n8076oL4dVeZCvppxf3Dkhb88eDEKjSoUQ=;
 b=PopLvwlXOCDXaLvqv9uO4DoSBp8iQAKQn2ysU4XL++HUI0L3tIxTSza7EKgWQIx/o4ej6QamUN0SrZB0nlWOJKMs1WDh440+vuoJ6af2x79VZgsx49LYnoEQBf1nF2sT6ydDyX1yeVvJTmC0WtaBOKmaP2kEOFDLPcHbcG+puEwMeXI8VjoJx7sRx1jbPN+hFslMTGIKs7jIheUeYEy6kh5d2sYFEOJQd7wqn3LZabo3p0JijfoYGLwy0g++zj4qQItQCnfz+610ZFjNK/ng9TU3zhwEmjGG2E6+nAHMYIXlCeckUKBMhoFo1wAnvdNMcP5ysfUC9bqJYDvUssF7MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cak3I6V82n8076oL4dVeZCvppxf3Dkhb88eDEKjSoUQ=;
 b=X1dskDVaNaVC1MqFs1HSqebT53/uCbA5iA5frQsy1qvjc0L1LUcEKQnje7xwC/hlZdXm/Zu65VlYUnhEMybbFxbf0XLR/VafUffYYJ5SREXrpwae3P51V0S5X9taqM5prg48IG3kV/wllmoD/43axEFyep+q8e0iLRqY7Rwg8CSJpGit5WOsFE99iMxUKWeSjqJ4BI7ZWTYw0GAXOr5hFjBhdR38yqroPSNoHpq/QsLDV7v1xs6BTkJFUMk5sY4rGS82SmH10WNHH3AsrFM2yNkUHZtLxBfhvnQUTm3Hr46yBx7Mblrl/Afc7BEzCbz3nkrNy52gd1mXyRfd5ML3wg==
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
 by TYUPR06MB5912.apcprd06.prod.outlook.com (2603:1096:400:353::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.14; Tue, 22 Oct
 2024 03:45:37 +0000
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0]) by SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0%6]) with mapi id 15.20.8093.014; Tue, 22 Oct 2024
 03:45:37 +0000
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH] f2fs: modify f2fs_is_checkpoint_ready logic to allow
 more data to be written with the CP disable
Thread-Index: AQHbGjOl9uPnM3AaYEqxY543nx+w4bKSJqqAgAAGDwCAAAbJgIAAAcsA
Date: Tue, 22 Oct 2024 03:45:36 +0000
Message-ID: <37129398-430d-4a2a-b17a-a38cdc2bd9e6@vivo.com>
References: <20241009102745.1390935-1-hanqi@vivo.com>
 <3fdd8fdd-8b80-4989-8cfd-78051bd85936@kernel.org>
 <7450a770-22cf-45e4-bc92-1812d1295eec@vivo.com>
 <febd8e72-acf6-4f33-9a49-4f09f4b5a25a@kernel.org>
In-Reply-To: <febd8e72-acf6-4f33-9a49-4f09f4b5a25a@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB7140:EE_|TYUPR06MB5912:EE_
x-ms-office365-filtering-correlation-id: 903c1ae5-835d-4f01-6429-08dcf24bfd89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cm1GZUpVLzEwREM5M1lIRG1tTFVTY3hJdVFiOFEvK25NcGcxUUVKd1NZZ0Rl?=
 =?utf-8?B?Kzk4SmxRYXU0dFV4WHJseUlTcjlGL2sxdkY1QllKbTlha053T3k4TjdBZU5h?=
 =?utf-8?B?VThXdDFQWVV2ZXpsVjVSS2tkcklwVWNUdXZLbUJoZXVzbmpZU2RRRW1LYXJv?=
 =?utf-8?B?K0t1enArUTZBbFByN2tvOEtmVHRKMU05cytPdzlCcWNhTllQdm1KN3lheEdy?=
 =?utf-8?B?L0ZPOEV2ZGtCbytIZUllSjJwblVvYkhSNWlQZmoxNlhFMXFIN3ExM21UVEZ3?=
 =?utf-8?B?ZzNVNkRDeUxxYWlSbGNrQ01WZ09PRXRjM1JHMlB2NzFlV1RGOXFRTDZYMmZG?=
 =?utf-8?B?WTFCcXFibjQ4cW5YMzA5Wk1SUjZmOXRkQjdsakpqUDBySWdQMy9JaUlHR2VJ?=
 =?utf-8?B?cWJjak9EeGdxalpsTmk5Ym8zQ3hUZENBeFpsWFh3MnV0U0hzMk9kVTBRK0Qw?=
 =?utf-8?B?S0RYWitKYXFocGU0cml5cktvYzRyazZ0aWFRVktocmQrTGgwWWc0dENtQ3p6?=
 =?utf-8?B?dkU5SDRpam0zWEUyUmh2dWdVblRvdHQ5MGxLMTlWUlRjRE5Ga21RaGpxaDRr?=
 =?utf-8?B?QTQ4RzM0ejF6VDB5c0I5UDEyYVZ2cXVRb1ROK2RqVDBsRVY1eGNRZnROZDB2?=
 =?utf-8?B?WHFSc3liZVcvVWN4UVNCY3dQb08vaDZ4S1Y5TStpOVUvTzBpRU51VDQvR0Vi?=
 =?utf-8?B?MStHUHB5VEJSeXNGZmQ3MTV0WFI0Z3FhWHpGZjFLU2p6bkxXU05pTnBQYXZs?=
 =?utf-8?B?NlRQNzVjYkZWa1BPSzlsQ1M3RS9TZGN6QmRsMWc2eGptTFBwUHBidGRLWHUx?=
 =?utf-8?B?TU1UNGZPM3RGV3REVkQ0MTBjdG40UW8vSWF3Q2EwRi8yL04wOHNhTmlVUFE1?=
 =?utf-8?B?ZU5hemNEaDMwQkpyU2VGYTMwOFNxR21obzEyNXQ2TUl0OG9ZelRKVXhSZHY1?=
 =?utf-8?B?UG4xaUZBNjBqM29WdWc0MC9nK2JiS2xmTGpNVlpNQTFHMFJVSGxpbHVsRzNk?=
 =?utf-8?B?ZnRnejZqOFRoMTg5Z0xXaTRiREdpN3Z4U3pRQlZZUXgzaTJQQ04yU0JKMjBR?=
 =?utf-8?B?TzFrTnh4TzZieUJtdHNhRlF3UUhna2d3TUNmVVJzRm0zdkNRV0FrS2hpV3dz?=
 =?utf-8?B?czhVRXNOUTVvTEVlRWQ2WjZSOEVPSVZ6aU9XOXBKVGVaemorS0FFeDY3LzdE?=
 =?utf-8?B?R2ZSTXhENUVzbnc5MTBsNHBxRGlKangreGJlNXF3Qm5teEREeHYzTnp5T1gy?=
 =?utf-8?B?OXBKYXpza3V6STlEZlBmeEMrc1pnTk1Sdm5vVDY3ME1kT1RSOS9jUnJoVzBN?=
 =?utf-8?B?WDV4OUxtbTkrUjdRZUtEc0orS3N1ek9kUEtRS3p3cmh6M0xJZGZWeEVSSEF4?=
 =?utf-8?B?cWxnWllNZ1BzdGFSUWhRdlFhbDF1b05USi9keDM3eVFrUG9LMXJxWVVadmZy?=
 =?utf-8?B?NjBGcjRJWDdqVm4wN2M3NzZabjdicUJaSHJRNnBkYkM3eHgzUzhxTWJtUXVt?=
 =?utf-8?B?R2k4bk5iZUZnUmNoaDFQVUNlT1I5MmwreW1lMllFSUVtbktHU0VsVm5PNHQv?=
 =?utf-8?B?NGRsb0hSTkttMi9PbVRISVEwVWg2N0dYVEtCdThadll4N1JwaXVKdlhONEZS?=
 =?utf-8?B?b2dmSXViZ3dub0xxaytqWU1WV25pcUF6aVkrUm9rU0M1R1BPNVViaUFnL05m?=
 =?utf-8?B?SmZkVEM4Q24wNlNYMGhvQnl3TVFqMGtNK3dPRThpa0hxRG10MTM3QXhXYnpF?=
 =?utf-8?B?a2xXYmoyanBFSEkvZm5taXRaK3RZWmliMG9RbU1UcHJSQkxWOG1ycEFoTExB?=
 =?utf-8?Q?ycnmLHZQoRodPElyhe2e8d/n9LKpJuI10l4cs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:SEZPR06MB7140.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGZEd09LT2dXQ3JMeU15aU5sdDc2NnQvN1U4ZHBRbE9Ga2hWZHJ3Nnh5L0FV?=
 =?utf-8?B?ZUhkMFFMZHE4OWN1a3JPZmdMQnd1cnNPWGhYTGthSWZqalpUd2p5UzlTUG5u?=
 =?utf-8?B?QkRGbTFYekNPaElBS2NEUGg3MHl5MXlpVlBnNWFCMXJDQzQ2ZVB4NVlUb0g0?=
 =?utf-8?B?Vm5oK1p0bDNwTVprL3lKOTBnMmxYQjgxTERwdnR2MUV2LzAyQzNXd3dvZW5h?=
 =?utf-8?B?T3c2b2RDZmdYYTNxQStHRHhGM2JPUi94bEpCamNpL3REMk9ZM0JpZlhEQld6?=
 =?utf-8?B?WFQ5bzYwc1FKQlFSRlFUNmFxVjZ3YkdBWnFwZ3BoUXhUWkJhTGFqR29RcFVJ?=
 =?utf-8?B?WEpXdldHSXluaktnbjdHVHRlaFVsQjB6K3JtYndqNy9iN2ZLOXdRZFh2RVJB?=
 =?utf-8?B?djNoOU9mSHBINDA1S3hYOE8wbTREejl6UGp6bG9IWkVBMUtLb1ozK05pcFBo?=
 =?utf-8?B?QWdOZ0l2MGt5WEV0NUtyd0l3YkNtQ2xidDFGa1QzZFNDdW9mdFFBODJ2ODBP?=
 =?utf-8?B?bEtUWDhNblBtRzY4OWZtYlh1SnZPWWttdWw4YlMvN2NlVDZJSkZkTVFucGpS?=
 =?utf-8?B?a2NUMDdnYlZhUFUvL3gvbFo4ZE10L3pQQmN2dTkvQ0d4Y21oSTFZS29XM0h5?=
 =?utf-8?B?YUxmUGRxakpEYkdoZGJOR0Z5OHpvNzRJbGxBWXc5SWZjZXU2L1FIVG9HLzMr?=
 =?utf-8?B?VHlGeFgrRE54V2hCbFpYOFVZaDFBUUdSbklDUkhLN1JlRmlVaG05UjhJZ0xt?=
 =?utf-8?B?aU1qbFQ3ZzJsbWFwQ3VhTmlQbTRBa3dCQ2s1a2Qra0pGYkgvQmVJNnlGWENE?=
 =?utf-8?B?ZmRuaU1Eb2pvM1hDaTNZaVgxUzZETGhCWDZheUVxSEVTSTFldnU3VDh3L1ZN?=
 =?utf-8?B?bXRudDQ2aXUvdUhHajUzU3FUZlRLVDBRM2RYdGdnMGo5TFA3NmpMU2FpekpF?=
 =?utf-8?B?WEc1dXU4S1pONXFPWGpLbktrV1p6aDY0UXd6eFdUb2tkclpqUlFaN3A4Qi8y?=
 =?utf-8?B?RDlCdU1Jb0cvaDlCRkZnUkdudWNUK2hRbWFCdUNYWHd4L0c1a1RUelo2c2Zj?=
 =?utf-8?B?bWdTc1FuVFBMOTd1NlNJdVNqMm1ZMml4SnlsL2Z0bUllQWdBSjVLYjUvM3Y4?=
 =?utf-8?B?cWtUbm9rSHc4eUpvSXFPbGZwdTQzOG9LWWVHR2NTakVKZDZPc1lBMU9JOHNi?=
 =?utf-8?B?eU5JR1FpVFN2a1pTbFFCeUtqUmgzSjJSL3FsWUJ4WVdaZEpsNkI4N1gzQnZB?=
 =?utf-8?B?K0VkMkhVOERXTUlEREJqSWwwWEw0VllLWnVRcFlhZ04xR1FlRUZoUjhoTGVw?=
 =?utf-8?B?cWFkYW9nZ25Dd3ZHQ24yd3VUUEg3dzc2cW5rQkJ5NXVjZ2lFSmFZY0hKTnNl?=
 =?utf-8?B?M3JtSW1UK2FaUlJFYnFzMGtpWXFVZTdKQUs5b1I3aWl3Rm1mQWNlSjFYNnp2?=
 =?utf-8?B?ZFVCTVJJVGVqRnVMWWsvSm5QdkhZT1hEdGtrelN0YlJWRHFwVDBITzJ6YnRo?=
 =?utf-8?B?RGNTcFY0cjY5bzdKNzdnWUh4VDNwYnZhTGRUcTR3bU14cDFVZFJCSjRhUmxW?=
 =?utf-8?B?VlRHVVFRZUJyczduUjhQTXd5VUU2UEpQU1doVUlYU3U0SVZoYUxwSko2NndS?=
 =?utf-8?B?Q0IyL2crOVlZOXdjaGFybkhYNW5vcVlEWElObnJLc3YrREVNSXhxNTA5STN0?=
 =?utf-8?B?UGd0bTJ5NkpJaWZQSU1CWHQ2UU1ZWVNDaWNZTFh0UTFRVkdvbTlITE8zR1ZS?=
 =?utf-8?B?MEcvZFp2WVpOVytQWUlQMXRFTzZFaTdyenJoeU4yUXU4bHJvV1VZWnVieitQ?=
 =?utf-8?B?R2J0cU4vL2YrVU5tc3FhdE1PaWFkRHJMRzlzcmZSZjRxUUdlZG1WMTJ0M2Na?=
 =?utf-8?B?QXpXN05KQjJWeW5CMmxBb1RINjBLeWZZakVrQTdyRVZHK29NUzE1bkZqdFFx?=
 =?utf-8?B?TlV2UmxJckxqREo4WWNlRE12TGY5cWlkTTZRZkd5K29aeUl0N3dMRGtEVWlD?=
 =?utf-8?B?cUN2TkdOeUxCZXc5bm11c21ya1hGUTFhVzNrM0VVVWY4bzM0dzZBTytiaVdO?=
 =?utf-8?B?OFZNQVdoZmFKT0JKNFVQTG1wcUhmb1QvcGgrNUVrNUNPdTBySmRhb1pnU3ZR?=
 =?utf-8?Q?JXQ8=3D?=
Content-ID: <542013824856394C8B414BBC15C1D685@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 903c1ae5-835d-4f01-6429-08dcf24bfd89
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 03:45:36.9582 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j1J5UZFtcYcKFPti4p6DdmcvnAzkK/i0g6RBr1DNKDo9wasG8nj9FpFWGbzMjebwb4tgBn/4kz6M9qnL7bJ92Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB5912
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2024/10/22 11:39, Chao Yu 写道: > On 2024/10/22 11:14,
    韩棋 wrote: >> 在 2024/10/22 10:53, Chao Yu 写道: >>> On 2024/10/9 18:27,
    Qi Han wrote: >>>> When the free segment is used up during C [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [52.101.129.52 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1t35q7-0002dI-MK
Subject: Re: [f2fs-dev] [PATCH] f2fs: modify f2fs_is_checkpoint_ready logic
 to allow more data to be written with the CP disable
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
From: =?utf-8?B?6Z+p5qOL?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?B?6Z+p5qOL?= <hanqi@vivo.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5ZyoIDIwMjQvMTAvMjIgMTE6MzksIENoYW8gWXUg5YaZ6YGTOg0KPiBPbiAyMDI0LzEwLzIyIDEx
OjE0LCDpn6nmo4sgd3JvdGU6DQo+PiDlnKggMjAyNC8xMC8yMiAxMDo1MywgQ2hhbyBZdSDlhpnp
gZM6DQo+Pj4gT24gMjAyNC8xMC85IDE4OjI3LCBRaSBIYW4gd3JvdGU6DQo+Pj4+IFdoZW4gdGhl
IGZyZWUgc2VnbWVudCBpcyB1c2VkIHVwIGR1cmluZyBDUCBkaXNhYmxlLCBtYW55IHdyaXRlIG9y
DQo+Pj4+IGlvY3RsIG9wZXJhdGlvbnMgd2lsbCBnZXQgRU5PU1BDIGVycm9yIGNvZGVzLCBldmVu
IGlmIHRoZXJlIGFyZQ0KPj4+PiBzdGlsbCBtYW55IGJsb2NrcyBhdmFpbGFibGUuIFdlIGNhbiBy
ZXByb2R1Y2UgaXQgaW4gdGhlIGZvbGxvd2luZw0KPj4+PiBzdGVwczoNCj4+Pj4NCj4+Pj4gZGQg
aWY9L2Rldi96ZXJvIG9mPWYyZnMuaW1nIGJzPTFNIGNvdW50PTU1DQo+Pj4+IG1rZnMuZjJmcyAt
ZiBmMmZzLmltZw0KPj4+PiBtb3VudCBmMmZzLmltZyBmMmZzX2RpciAtbyBjaGVja3BvaW50PWRp
c2FibGU6MTAlDQo+Pj4+IGNkIGYyZnNfZGlyDQo+Pj4+IGRkIGlmPS9kZXYvemVybyBvZj1iaWdm
aWxlIGJzPTFNIGNvdW50PTUwDQo+Pj4+IHN5bmMNCj4+Pj4gcm0gYmlnZmlsZQ0KPj4+PiBpPTE7
IHdoaWxlIFtbICRpIC1sdCAxMDAwMDAwMCBdXTsgZG8gKGZpbGVfbmFtZT0uL2ZpbGUkaTsgZGQg
XA0KPj4+PiBpZj0vZGV2L3JhbmRvbSBvZj0kZmlsZV9uYW1lIGJzPTFNIGNvdW50PTApOyBpPSQo
KGkrMSkpOyBkb25lDQo+Pj4+IHN0YXQgLWYgLi8NCj4+Pj4NCj4+Pj4gSW4gZjJmc19uZWVkX1NT
UigpIGZ1bmN0aW9uLCBpdCBpcyBhbGxvd2VkIHRvIHVzZSBTU1IgdG8gYWxsb2NhdGUNCj4+Pj4g
YmxvY2tzIHdoZW4gQ1AgaXMgZGlzYWJsZWQsIHNvIGluIGYyZnNfaXNfY2hlY2twb2ludF9yZWFk
eSBmdW5jdGlvbiwNCj4+Pj4gY2FuIHdlIGp1ZGdlIHRoZSBudW1iZXIgb2YgaW52YWxpZCBibG9j
a3Mgd2hlbiBmcmVlIHNlZ21lbnQgaXMgbm90DQo+Pj4+IGVub3VnaCwgYW5kIHJldHVybiBFTk9T
UEMgb25seSBpZiB0aGUgbnVtYmVyIG9mIGludmFsaWQgYmxvY2tzIGlzDQo+Pj4+IGFsc28gbm90
IGVub3VnaD8NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogUWkgSGFuIDxoYW5xaUB2aXZvLmNv
bT4NCj4+Pj4gLS0tDQo+Pj4+IMKgwqAgZnMvZjJmcy9zZWdtZW50LmggfCAyMSArKysrKysrKysr
KysrKysrKysrKysNCj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQ0K
Pj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmggYi9mcy9mMmZzL3NlZ21l
bnQuaA0KPj4+PiBpbmRleCA3MWFkYjRhNDNiZWMuLjliZjBjZjNhNmEzMSAxMDA2NDQNCj4+Pj4g
LS0tIGEvZnMvZjJmcy9zZWdtZW50LmgNCj4+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmgNCj4+
Pj4gQEAgLTYzNywxMiArNjM3LDMzIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBoYXNfZW5vdWdoX2Zy
ZWVfc2VjcyhzdHJ1Y3QNCj4+Pj4gZjJmc19zYl9pbmZvICpzYmksDQo+Pj4+IMKgwqDCoMKgwqDC
oCByZXR1cm4gIWhhc19ub3RfZW5vdWdoX2ZyZWVfc2VjcyhzYmksIGZyZWVkLCBuZWVkZWQpOw0K
Pj4+PiDCoMKgIH0NCj4+Pj4gwqDCoCArc3RhdGljIGlubGluZSBib29sIGhhc19lbm91Z2hfYXZh
aWxhYmxlX2Jsb2NrcyhzdHJ1Y3QgZjJmc19zYl9pbmZvDQo+Pj4+ICpzYmkpDQo+Pj4+ICt7DQo+
Pj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IHRvdGFsX2ZyZWVfYmxvY2tzID0gc2JpLT51c2VyX2Js
b2NrX2NvdW50IC0NCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHZhbGlkX3VzZXJfYmxvY2tzKHNiaSkgLQ0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc2JpLT5jdXJyZW50X3Jlc2VydmVkX2Jsb2NrczsNCj4+Pj4gKw0KPj4+
PiArwqDCoMKgIGlmICh0b3RhbF9mcmVlX2Jsb2NrcyA8PSBzYmktPnVudXNhYmxlX2Jsb2NrX2Nv
dW50KQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAgdG90YWxfZnJlZV9ibG9ja3MgPSAwOw0KPj4+PiAr
wqDCoMKgIGVsc2UNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHRvdGFsX2ZyZWVfYmxvY2tzIC09IHNi
aS0+dW51c2FibGVfYmxvY2tfY291bnQ7DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoCBpZiAodG90YWxf
ZnJlZV9ibG9ja3MgPiBGMkZTX09QVElPTihzYmkpLnJvb3RfcmVzZXJ2ZWRfYmxvY2tzKQ0KPj4+
PiArwqDCoMKgwqDCoMKgwqAgdG90YWxfZnJlZV9ibG9ja3MgLT0gRjJGU19PUFRJT04oc2JpKS5y
b290X3Jlc2VydmVkX2Jsb2NrczsNCj4+Pj4gK8KgwqDCoCBlbHNlDQo+Pj4+ICvCoMKgwqDCoMKg
wqDCoCB0b3RhbF9mcmVlX2Jsb2NrcyA9IDA7DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoCByZXR1cm4g
KHRvdGFsX2ZyZWVfYmxvY2tzID4gMCkgPyB0cnVlIDogZmFsc2U7DQo+Pj4NCj4+PiBDYW4geW91
IHBsZWFzZSByZXVzZSBnZXRfYXZhaWxhYmxlX2Jsb2NrX2NvdW50KCkgYXMgbXVjaCBhcyBwb3Nz
aWJsZT8NCj4+PiBhbmQgY292ZXIgaXQgdy8gc3RhdF9sb2NrPw0KPj4+DQo+Pj4gVGhhbmtzLA0K
Pj4NCj4+IFRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9uLiBJIHdpbGwgc2VuZCB0aGUgdjIg
dmVyc2lvbiBwYXRjaCBsYXRlci4NCj4NCj4gQlRXLCBpdCBsb29rcyB5b3VyIHRlc3RjYXNlIHdv
bid0IGNyZWF0ZSBzcGFyc2UgYXZhaWxhYmxlIHNwYWNlIGluDQo+IHNlZ21lbnQgZm9yIGZvbGxv
d2luZyByZXVzZSBieSBTU1IsIGNhbiB5b3UgcGxlYXNlIHVwZGF0ZSB5b3VyDQo+IHRlc3RjYXNl
Pw0KPg0KPiBUaGFua3MsDQoNCk9rYXksIEkgZ290IGl0LiBJJ2xsIHVwZGF0ZSBsYXRlci4gVGhh
bmsgeW91IGZvciB5b3VyIGFkdmljZS4NCg0KPg0KPj4NCj4+Pg0KPj4+PiArfQ0KPj4+PiArDQo+
Pj4+IMKgwqAgc3RhdGljIGlubGluZSBib29sIGYyZnNfaXNfY2hlY2twb2ludF9yZWFkeShzdHJ1
Y3QgZjJmc19zYl9pbmZvIA0KPj4+PiAqc2JpKQ0KPj4+PiDCoMKgIHsNCj4+Pj4gwqDCoMKgwqDC
oMKgIGlmIChsaWtlbHkoIWlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9DUF9ESVNBQkxFRCkpKQ0K
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsNCj4+Pj4gwqDCoMKgwqDCoMKg
IGlmIChsaWtlbHkoaGFzX2Vub3VnaF9mcmVlX3NlY3Moc2JpLCAwLCAwKSkpDQo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOw0KPj4+PiArwqDCoMKgIGlmIChsaWtlbHkoaGFz
X2Vub3VnaF9hdmFpbGFibGVfYmxvY2tzKHNiaSkpKQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIHRydWU7DQo+Pj4+IMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7DQo+Pj4+IMKgwqAgfQ0K
Pj4+DQo+Pj4NCj4+DQo+DQo+DQoNCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
