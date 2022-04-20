Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F181507DF2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 03:12:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngytW-0006hB-2q; Wed, 20 Apr 2022 01:12:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <xuyang2018.jy@fujitsu.com>) id 1ngytU-0006h5-5f
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 01:12:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8QbU6+VIAuCYczDMhdelrb+mJl6ir8oP1Fz7JNZgwbY=; b=NgqagLD6hJKMQRyuj43G+UDDEJ
 L+r5LGOxcYa+FJ6BFTBcwq62yJ0fFGgYnsCGnro29bFhBRV2IEwVzJACujMFOZKnb3601HlfxKPVn
 ZC1YyIRXMaXrNgQXPGhnwTpZUtNAQvdVO8Lx6wqEBguyGKk1ZACGHcFESbo4budUfrj4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8QbU6+VIAuCYczDMhdelrb+mJl6ir8oP1Fz7JNZgwbY=; b=JRRBWNyW4DC6Nw3TypDvV55o4u
 VAGXJ3bEmaJWKgKK0boEadZ/sBIkkIj1PK3iB3Nq/X0O4zYFxqf97KhcezGtiSs9e5uCPUK0PyWVh
 IvQdJICjrPAzTkq9Z34wDY5mxw+SqMWfE8ZTwT4/MGexdom2lF8jIBFc2BMitNuXwO5Y=;
Received: from esa6.fujitsucc.c3s2.iphmx.com ([68.232.159.83])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngytN-004Ioi-Hb
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 01:12:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1650417145; x=1681953145;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8QbU6+VIAuCYczDMhdelrb+mJl6ir8oP1Fz7JNZgwbY=;
 b=auk38ZhU+/oYmwJyVYEZgErHbEjrX93oG64cbdOLSQHLPxv80m/fu6p+
 bYxb9lqFA3HeVHvd0gU4V2lQMuprYHiAZIhS8K3obBDOSGO9TnqkateXK
 dokjtuksqiDYP/se6TeETV1P3p182TDs2BFaMw6Fj9FzkaGsttXYfMLhy
 5zXOoPgbJJNwNk3fCZqkDiyf2jgXUBik/ifGbHwxwqDtYTOKbijuk3San
 YJLEDROVXB2u9oCaW3eoio0W9ymJfpdm1wlSzA/SEXXCbrd5bHgzP7HJi
 F9Rf0a2tCTbyag/hAA/IvfsEf4intc8aUrq0zksmI0xd5pMSMclfmMeaz A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="54269785"
X-IronPort-AV: E=Sophos;i="5.90,274,1643641200"; d="scan'208";a="54269785"
Received: from mail-tycjpn01lp2176.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.176])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 10:12:10 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPNtln7WrkpnN/S1sU62/IqNqScm0qYRugawaCVZhRG13n3Sm1GTGWBj4KmgG6dm6kzXvTBgCm07/42YueLWjI8lu4INX/KgxAHzhHPNOOdoDlb20Dp5frGD+WeKdKvARQgCoL80fnD91L788ylIfOslEpkqlNxZTPzvMMlxlR9j7StVabK+TD6cObYCrBbeEXbUIwk6wFaDophPFjEEJszh7dQ9LY2GVLFDuyF8FY51w5glv3Udpul03hVNPeu0o6DfYnibVawRuZr1JGk4yvOt6wyZt7e2lgklBgkcFFdGn5ZxhIr4W2IbuSgTjhuryh2fv6V3VuUEUTHCCvLv+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QbU6+VIAuCYczDMhdelrb+mJl6ir8oP1Fz7JNZgwbY=;
 b=NoEWXJ65IU5j2vorT/fhjApiPY+e4WQkgm4fsY+Dhxlxhqu9fpEPWhI/+eYSvKUoRmwPXusVnr5KVP0uUbwXpsGNHMRuOhLmFIICapyCBYkBYHFzb53BN+X1gtWgExRitd0nwsPJPEineEMYxQ9llUl8ny3mI6iKvynDTLG+cNf9JHHtoXkgdiJJw6x9DdwgAK52W+FSN/nEG1T9la/PmgYAJw89Vf7nrIuOKlIO35zE+3qcPudO/guAx8WcFOfXY0fSL/QK2MWMufBHJWMVJIDm//KFCYUa8NAHo8OwX2uNDic2rSkyeiJAIAEHP0RgKKyfSBrkn7gS4GreFXghBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QbU6+VIAuCYczDMhdelrb+mJl6ir8oP1Fz7JNZgwbY=;
 b=dD8O9xTvwNiXojHIiDOjbBaabz10STZcA2Uaxf/deT9JJppXhPScGXamjg2PW2M68VQxdJguUvf0praYN92IMBAvPliqe+yauMXVn42ZHpfxYs3NcCfrT8kH+XqY57//KIezEkcPLYMs0nenVTGrisY+Rvu5VZqBJGsGDJoNATY=
Received: from TY2PR01MB4427.jpnprd01.prod.outlook.com (2603:1096:404:10d::20)
 by OSBPR01MB2327.jpnprd01.prod.outlook.com (2603:1096:604:1b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 01:12:05 +0000
Received: from TY2PR01MB4427.jpnprd01.prod.outlook.com
 ([fe80::fca9:dcb9:88b4:40fd]) by TY2PR01MB4427.jpnprd01.prod.outlook.com
 ([fe80::fca9:dcb9:88b4:40fd%7]) with mapi id 15.20.5164.026; Wed, 20 Apr 2022
 01:12:05 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Christian Brauner <brauner@kernel.org>
Thread-Topic: [PATCH v4 3/8] xfs: only call posix_acl_create under
 CONFIG_XFS_POSIX_ACL
Thread-Index: AQHYU9rQ1RyFOxEMHEKdCE0i0JLGpaz3QeCAgADO0YA=
Date: Wed, 20 Apr 2022 01:12:04 +0000
Message-ID: <625F6C3F.1040308@fujitsu.com>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1650368834-2420-3-git-send-email-xuyang2018.jy@fujitsu.com>
 <20220419135305.7vztxq5mld5jynt5@wittgenstein>
In-Reply-To: <20220419135305.7vztxq5mld5jynt5@wittgenstein>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e4d3b8c-6bf3-45ae-f1cd-08da226ac865
x-ms-traffictypediagnostic: OSBPR01MB2327:EE_
x-microsoft-antispam-prvs: <OSBPR01MB23274BB5C5DDF55F91216EA1FDF59@OSBPR01MB2327.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E54VF5UbTlShbAmjCgPqTBe0L28m7yfiz5dVNC8719/Upr517woLw7LunzIbhbsQCkvJTDpr5mKMb9nr4SiSjYVksi5A6s0cLdGGgMxQlB99BIpwj2espKhElX33pwCd8MtunVVAFMq+NjUMC2GxpjeeaOTAnPMEPFFC0cn/T9wY5L8LaGRTBWYPrkrhDZ7vENa0ipN5XH/QWz97yJ4cEp7CZcvxp7IgSDroOpMBnhWSiacQyjcsYq1tDqdcbdHtUvb6magGSjEe7yUt8t8x5YAIUMBlzRqmHfr9AUzSvODI9EBkcLXKNv4uhyb+OxTCANsHdqvgopEsiQzIqbEMUiFCkrO43JcwA2Tlpza5S3fKvUICiMUm3dog27jE8T+P9+MKB8hNrCoTlG5MFuC9wBuIt4Z5pZYR2pL6g0ZSaJRSx0rtEkG7RqBUjMUQTNve/AECwcr2FA4JNT5yViRKfw6FK3+JrfwnTYyHypVanQv4I2vi29/bggmMSZm4pMyjmhuU7qljTlH69GF3GOySAk/yu0HvSEqooFLFMjmT8Y1BRdTN1tNvZlWjJP6UYVEh1p/zLkq6qyBrXM05IDcBR6vWh81cX0BsjEkL4P8UWdH1204zbYHTGTbC9jReMDXRr82s9MMyL/zUKKy2xZUYwkmJ2Sit3L1JgfsNnliAX5SNqPQWaV5enD4GTDQGynP31LwSOOmov6lrDVLHTEErkA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB4427.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(6916009)(91956017)(186003)(7416002)(316002)(8936002)(82960400001)(71200400001)(76116006)(86362001)(2616005)(66446008)(66946007)(66476007)(66556008)(64756008)(4326008)(83380400001)(8676002)(6512007)(5660300002)(508600001)(38070700005)(26005)(36756003)(6506007)(87266011)(38100700002)(2906002)(85182001)(122000001)(6486002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGFIeXJBcVU2QkpCY2FDZWNlUmgxSjcxYkxIN3hLV1NwVTFkNndUUzRsdm1z?=
 =?utf-8?B?dE1aOVFPdUFSOUtoUVZ6dDdGZU16QVVhTnBBSTR4dkdEcG9qSWFEUXNWSUdD?=
 =?utf-8?B?b21jTkF4TXhxL01GY3hqY3JOM09hNUprUUlRUm43NW4wKzhpamxLQ01rTzZB?=
 =?utf-8?B?MEpsdEZoRkZKQ0NTUFFlNFBWVnhwQS8vUE5FcXlHWWVETVF5Y2ttNmp0NXJs?=
 =?utf-8?B?ZVI1U2JPaExlUXVWVUpyL2R4ZWhYWmNVdEpyWjRlRFVJbW5XTm1KenpmSDVj?=
 =?utf-8?B?cllndjdSUiszUnh5ZmhSMkVoTU55U1gyYmNYZU5WczVBc1JueW9VMmNpZzBa?=
 =?utf-8?B?bVZRMmdvWHluM2VGYlJLS3hjVUxXVEZOR3ExR2paTUlLRCtUQUZSN1BTRnly?=
 =?utf-8?B?VFVEcDVzKy9aSm5HTFlFdUxINjdNNGUrRWlDUFRSd2J5UjN4clN6cVVOVW5y?=
 =?utf-8?B?NFRObVhMT3FkQ1BoclMvOWd1aHNRZlhEL3lYRWVoZFI0bHJOYmV3YmRBWUJV?=
 =?utf-8?B?UERIRXBkSHpibmdsS21tN1FqZXVydHY3cWQvTjF2ZWpwak5rNDdpS0s1anpY?=
 =?utf-8?B?bXJDODJrd0ZtS2tROG56cnZuK2szbGZhU3hPRlVHMEcrL1UyUnhNTGlHYXBk?=
 =?utf-8?B?bTg5ZFdXNysxM2ZUTXY5N2NPTUpWUTNaYXY5Tjc0Nnc2d3RVZW55NU5YMm84?=
 =?utf-8?B?d2hWVWl1aDc4VTN1RHZRenRCVGs0bjAzbkhXeE4xYmg3Tmd0V2kybmFCdGQ0?=
 =?utf-8?B?US9vL2lMZW1ROUhGYTVXZmVDVnVJaTQ4cXlwcC9ZRTlQeEhVL2xsQnM5RnlL?=
 =?utf-8?B?T2VoTXNCZ3d2V1VmQXRRbmUySHZYQkdDMUwzdWZ1VjdhY2s4RkZWY2FMUUFF?=
 =?utf-8?B?RjZYZ3V6OEJ4dmhTRXYwYnhVbXdvY2FXY0o5Z1hVRWkzMnZSZzJTdkhZNnl1?=
 =?utf-8?B?MFBiVTBqd1ZBcEsySUFyY2Nlb3l1NU54bFl0RTZRTkYxNmQ2WU5UL3ZGSEN6?=
 =?utf-8?B?THNCdndjenA5dU5BdGJvcFhLNVN6UE13NncxVVZUZUxhdUdjYjdnajF0cHg0?=
 =?utf-8?B?SmU3eEVabjN0SFRTOGg0SUdEL1hsYWZoL1puNXVGSWp3NVJQenYzL1d4NS9k?=
 =?utf-8?B?Q25Wam82TVZtcmVTQlZMUlNEMmk4c1R1YytmcnpUbDRWZ1B0TWhYNEFHTGtl?=
 =?utf-8?B?NE52TkszTkNvc1FWL1pJY0RQcDRNRUZydEE1TGxrVDZMS3p0YnRXeWhRbEZN?=
 =?utf-8?B?ZFZjMWptYUxBSWo3RjJGeW9qVzZVa3BNcWFxMWhtNTlqV3JBREdpQmZ4M1FM?=
 =?utf-8?B?QU1YSWliZmh3U3FIT0RKUWN6eXhCRHAzSUVxY3RMTGFrbjY0UnFwNUt3VkRq?=
 =?utf-8?B?dzBzZHE4Y0tPSVJLcng3Qk5ITTJpak0wWG1PcFZFekJSb3ArZzU0bWVEc3Fa?=
 =?utf-8?B?c2FpN0JXV2hJQ3AvTjI3Y0ZTQTh0cjJVOHVZNlo0V2x0ZE5XdS8zbzl5MEFJ?=
 =?utf-8?B?L29RYkpjbzczUXg0VGM2dUJTRGxsZ0tkZU1LSXRibTFCWkl0NllmSC9taDhq?=
 =?utf-8?B?UXRWMlFGalZBOVllZXVGcUFzK0pjTHgxK1RGRk94NU1GNU5aNTBmTUlPS09i?=
 =?utf-8?B?V2t6ZG1tQktEYVFkMjZzYWluZDBmc3JXWjdlRi9uTExrcVhZY1VyVWhzREV6?=
 =?utf-8?B?Tm15RHpqN21XeWx6b2VhbUdURy9EMlZ4MmFmbXVySUd3MUIxWUNrbmRqREp2?=
 =?utf-8?B?TmVwUnVESFFrZUI2a0JVelZveFBQLzBGUXp1QUVyRTZ2K0c3RTBvT1prZER2?=
 =?utf-8?B?R0lza25QZjVpMllaeXRtWUJWSUtVL2pOYmRBZ0V5dmxJdTB0Zy85WTNqdGVm?=
 =?utf-8?B?aVE2RWRJVnFPaHRhVmpPL1VDT2RyS2s1U3pPYVBFbllQR2laNFJwZUk5SVlD?=
 =?utf-8?B?K1BtZE1qcUYzeWhmS0xIelFmNUdWdWJFcnY4ZzdxWmdIclFvcHY4eVJ0M24x?=
 =?utf-8?B?ME14cUlMRGdjckRCS2svdTlEUzgwTmdoSVJTaEszZXkyd2tZanJNcVl0czFJ?=
 =?utf-8?B?Yk1DNUJvYi9lZGtZTEFaM1FKMVV0bnJuWFloaUhBRGN3Q0lzbmxNVisvb3hS?=
 =?utf-8?B?cUdpOElHUHo2L3k0Mnk0RmkvblZDMStjZ09pTEIzWTJ5Y1ExakVnTUQzelll?=
 =?utf-8?B?V0h6TlVwenk1cXZEQm9CZ2RpYndqdTh5WkxRdFRnNlJBdHl3MXZ1SndqT1FZ?=
 =?utf-8?B?WGVhUXJteW5mT3pUVU4vVlBtcFlmYWE2QzdNL1BudW9UZFZndU9UdzdqN3Rq?=
 =?utf-8?B?WmgwcHVMUjQrTnJZZXBaYlYxN0huRjRYUEdCVkJjRUp4NkVGeUJLZ1liN0x1?=
 =?utf-8?Q?7fgavEa4FA75sWBme7NSODEJlXjx9q3aMNtQe?=
Content-ID: <84416A9CBF797F4A8BAC76E478B72786@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB4427.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4d3b8c-6bf3-45ae-f1cd-08da226ac865
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 01:12:04.9567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a6SRKlYqrvas2o4q6gpcA112U6UZG3y7DzHL/iAhhOpUEwfGF/x15MXLM5CChbSnHImZbJBP1MmkrLYN2+STl5456GJTww6QERJQTp1Jg2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2327
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  on 2022/4/19 21:53, Christian Brauner wrote: > On Tue, Apr
 19, 2022 at 07:47:09PM +0800, Yang Xu wrote: >> Since xfs_generic_create
 only calls xfs_set_acl when enable this kconfig, we >> don't need to [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.159.83 listed in list.dnswl.org]
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
X-Headers-End: 1ngytN-004Ioi-Hb
Subject: Re: [f2fs-dev] [PATCH v4 3/8] xfs: only call posix_acl_create under
 CONFIG_XFS_POSIX_ACL
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

on 2022/4/19 21:53, Christian Brauner wrote:
> On Tue, Apr 19, 2022 at 07:47:09PM +0800, Yang Xu wrote:
>> Since xfs_generic_create only calls xfs_set_acl when enable this kconfig, we
>> don't need to call posix_acl_create for the !CONFIG_XFS_POSIX_ACL case.
>>
>> The previous patch has added missing umask strip for tmpfile, so all creation
>> paths handle umask in the vfs directly if the filesystem doesn't support or
>> enable POSIX ACLs.
>>
>> So just put this function under CONFIG_XFS_POSIX_ACL and umask strip still works
>> well.
>>
>> Also use unified rule for CONFIG_XFS_POSIX_ACL in this file, so use IS_ENABLED in
>> xfs_generic_create.
>>
>> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
>> ---
>>   fs/xfs/xfs_iops.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
>> index b34e8e4344a8..6b8df9ab215a 100644
>> --- a/fs/xfs/xfs_iops.c
>> +++ b/fs/xfs/xfs_iops.c
>> @@ -150,6 +150,7 @@ xfs_create_need_xattr(
>>   		return true;
>>   	if (default_acl)
>>   		return true;
>> +
>>   #if IS_ENABLED(CONFIG_SECURITY)
>>   	if (dir->i_sb->s_security)
>>   		return true;
>> @@ -169,7 +170,7 @@ xfs_generic_create(
>>   {
>>   	struct inode	*inode;
>>   	struct xfs_inode *ip = NULL;
>> -	struct posix_acl *default_acl, *acl;
>> +	struct posix_acl *default_acl = NULL, *acl = NULL;
>>   	struct xfs_name	name;
>>   	int		error;
>>
>> @@ -184,9 +185,11 @@ xfs_generic_create(
>>   		rdev = 0;
>>   	}
>>
>> +#if IS_ENABLED(CONFIG_XFS_POSIX_ACL)
>>   	error = posix_acl_create(dir,&mode,&default_acl,&acl);
>>   	if (error)
>>   		return error;
>> +#endif
>
> Does this actually fix or improve anything?
> If CONFIG_XFS_POSIX_ACL isn't selected then SB_POSIXACL won't be set in
> inode->i_sb->s_flags and consequently posix_acl_create() is a nop. So
> ifdefing this doesn't really do anything so I'd argue to not bother with
> this change.
It only avoid useless mode &= ~current_mask here.
>
>>   	/* Verify mode is valid also for tmpfile case */
>>   	error = xfs_dentry_mode_to_name(&name, dentry, mode);
>> @@ -209,7 +212,7 @@ xfs_generic_create(
>>   	if (unlikely(error))
>>   		goto out_cleanup_inode;
>>
>> -#ifdef CONFIG_XFS_POSIX_ACL
>> +#if IS_ENABLED(CONFIG_XFS_POSIX_ACL)
>>   	if (default_acl) {
>>   		error = __xfs_set_acl(inode, default_acl, ACL_TYPE_DEFAULT);
>>   		if (error)
>
> Side-note, I think
>
> 	#ifdef CONFIG_XFS_POSIX_ACL
> 	extern struct posix_acl *xfs_get_acl(struct inode *inode, int type, bool rcu);
> 	extern int xfs_set_acl(struct user_namespace *mnt_userns, struct inode *inode,
> 			       struct posix_acl *acl, int type);
> 	extern int __xfs_set_acl(struct inode *inode, struct posix_acl *acl, int type);
> 	#else
> 	extern int xfs_set_acl(struct user_namespace *mnt_userns, struct inode *inode,
> 			       struct posix_acl *acl, int type)
> 	{
> 		return 0;
> 	}
> 	
> 	extern int __xfs_set_acl(struct inode *inode, struct posix_acl *acl, int type)
> 	{
> 		return 0;
> 	}
> 	#endif
>
> and then removing the inline-ifdef might be an improvement.
Maybe, but it should not be in this patchset as you said.

Best Regards
Yang Xu

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
