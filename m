Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C710A507E2B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 03:28:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngz9G-0007F5-Bb; Wed, 20 Apr 2022 01:28:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <xuyang2018.jy@fujitsu.com>) id 1ngz9F-0007Ez-JR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 01:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h4lVbkwE9iY4rgO++ePIZ27Vig6fDxv3rjm8euEexmA=; b=XUr5kUbTYElcteuThS0B3oWN2d
 GeG+ClgB8h5LGOy3NcT/E7oPW/+j9ZWxzqUOLk9lgmSOGWgEV4ccb7vlnpHORgy9N6YxOhuBVhVxo
 Mswwr87kgQIJ9NITLgIp926eAV5/mgMU7fNTHRnBzOWao+7OVhcPf5fpjb4Tiueytois=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h4lVbkwE9iY4rgO++ePIZ27Vig6fDxv3rjm8euEexmA=; b=eW6+TMP4KpK2Ex3xrHJp0zZCiv
 S4eu4/m0sN3A0qSt9DW713T/mddwY3CZsXTP+q1QlCPbcSSw8yD1rypPiCEy1AZDbgS6/7RQi27Q3
 qjsAgn/ImjRKhTEya0Cz0dcjUwa7vM2Jsye3E3PjW73mE2mct5jRsnxacnUtg+D1Cptk=;
Received: from esa4.fujitsucc.c3s2.iphmx.com ([68.232.151.214])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngz9A-0004NY-M2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 01:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1650418125; x=1681954125;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=h4lVbkwE9iY4rgO++ePIZ27Vig6fDxv3rjm8euEexmA=;
 b=DwHND4LKzWMFRLsQpF9CNe0YcKEcCj/tVt093ygXgDsrWT3SAA0kR714
 ZbhM00CJnmaDLM+6An+FuSIJOSMsfHAX9Jp45nWjXFVx0Ypy/H+OSLLxc
 Q4Jq/ILDlfr1aGcJsPMT17n6pT3NJKdPhGBNrQ3LQF+0GmE0YCkuJGa+d
 IuNNEeM7ee1g5YOdCg3J0IpsRGcd6mju0D5/9Q4KtVugpQ1M/RoCZjLM4
 /sr0jC32jD0MtvYYBo3eHSO8zGlVpov2z/pTXZlSBdTM9UEPydTAfqk3r
 ZMVyWaGgprAcQR40ju8VEgfZIhdUuE1Mx4edv3Np79EwOk/CyeC9AK9M9 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="62117320"
X-IronPort-AV: E=Sophos;i="5.90,274,1643641200"; d="scan'208";a="62117320"
Received: from mail-tycjpn01lp2170.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.170])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 10:12:55 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCsoO1xU04wlFh+pW2Qq/QzGjVuIDf5WT8W7O8OZgH0eA3SlF/yp5isj4a7P0RSAnxVyCkm2g0KvubQ27wSIAnILPoTEFP80uvn6XkB582RDW0wVYGt0BoLbJ7wflL/GLqvSMWNl4sA1BaQZplOhTPSzFsVKVacHeVL/SlD/5q9xNXLRh/xjuAhQEVxOdy3V7zD6yblvFnhThSW2pw0tISO6pmusTTOa+If3wqccDJLhtFwloq4esOMzQdgEDYOuwm+04yVb4UKwIzp0TsfGMYUTxWCwnIbeYZMAAfS0sGMdU8gJA/1lVALpJPjZKtiVTmXcrEURh/JrM4yEi4P1Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4lVbkwE9iY4rgO++ePIZ27Vig6fDxv3rjm8euEexmA=;
 b=RykBLIb+uNKqhOAbKlaK9aJ/8PzgZ8vfVQ1vlIfLtxH4b/uWRLA/y9GSeG3Wuc3+WLPKLTRqwzlsbKI4PS+MWNEaP+5Ca5e7Ou0IDvQK3mirsKPrBsA5BJ0edI/xT7uyLWMGhNtii9BJSa/jhkzDz5KL1nwIc1u5PQ8eY1TKPHM/EaOqFj8Y7kqWNbCIcaE49SIvYsTGmPQf2VrFyrNm4lHTICvhrWIGkBPFfBukE7ihrrx0vQBD4OSVbF7XSaeUAm9Ws/e4yrNOvZg0987XY+bNgtO0ULJmCMMt59naBH52W7EqsJWr0Ze095f1MI9xcf0qQIOsYnRrGpiRsM77Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4lVbkwE9iY4rgO++ePIZ27Vig6fDxv3rjm8euEexmA=;
 b=j6vkFcEHSggKpMaWdLOt3A7Si1LMrhzNRBpTgf7EW9QiqkycQI0GsI4zt0G4V3cVvcdYBeijM9JIz0wtAVkZAISugBpNjM2O1erYJFh7UCYZ5FAEU6ZA8lzSQfJIIekc0AinS5pzI63Qn03Q9xKSs0u9o+4E+8fTetRTTHvu0BQ=
Received: from TY2PR01MB4427.jpnprd01.prod.outlook.com (2603:1096:404:10d::20)
 by TY2PR01MB4267.jpnprd01.prod.outlook.com (2603:1096:404:d6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 01:12:51 +0000
Received: from TY2PR01MB4427.jpnprd01.prod.outlook.com
 ([fe80::fca9:dcb9:88b4:40fd]) by TY2PR01MB4427.jpnprd01.prod.outlook.com
 ([fe80::fca9:dcb9:88b4:40fd%7]) with mapi id 15.20.5164.026; Wed, 20 Apr 2022
 01:12:51 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Trond Myklebust <trondmy@hammerspace.com>
Thread-Topic: [PATCH v4 4/8] NFSv3: only do posix_acl_create under
 CONFIG_NFS_V3_ACL
Thread-Index: AQHYU9rWp6whriugHU6e+5hk49Dgxqz3Q7QAgAADdICAAMnBAA==
Date: Wed, 20 Apr 2022 01:12:51 +0000
Message-ID: <625F6C6E.4020706@fujitsu.com>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1650368834-2420-4-git-send-email-xuyang2018.jy@fujitsu.com>
 <20220419135938.flv776f36v6xb6sj@wittgenstein>
 <707fc9d665b44943d4235a51450bff880248eda6.camel@hammerspace.com>
In-Reply-To: <707fc9d665b44943d4235a51450bff880248eda6.camel@hammerspace.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4148dacb-c82a-4bd1-feee-08da226ae455
x-ms-traffictypediagnostic: TY2PR01MB4267:EE_
x-microsoft-antispam-prvs: <TY2PR01MB42676AC30E5E449C428406A2FDF59@TY2PR01MB4267.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3r+q6ClMbz+HclD6TN8jf3pYMQcDuLf3azWn6sNiynyxg1bKl1/wCV/pcN/M5dflTxTNuQO4nZ7ouEpjJUf+ePUmseW6xHyQweN6M/xuDtEsey1/mY+3kWGELYc3/wUlfH3Ge0DlwWgcHTep7AYKgHhICBkNDdflTWSbm0VkPbbQ+/99gkWrjdsdqX942j32NQmq3wjDV3gySVYVD/H7aR5HAomr55kt7Gjm8BMWox9UyhSwt7HBE4nqlNXne+pE1aivNc6esA94azQT1yApLY7d4xoNaEYYtsVhrg1Ha8Ac/88BkA34tZH4vUUJONmgNY6txFZRT5KJGf3L5N7ipuc//10s7dHeTbV+AkuVJ1OFEwD/kgoGWqrtyeD+xFqfQKgOWiFtIAKgimzd6KMV9KENUQ/XOT5QQBhLolavSyXhWKv09mrrJ5dJkUrjlOMBreMI8RuqeZfgfSVEk2+LkviO931H1WRRKviUAuSwtVkClamE+f575bpGIJN2tiyDhI16LjpifdQIxfzyJ13fU3h6OjCZvkFZUstn8/hzJwLWznXvKEDcbSu35C0FDcgpfQc8MfdjXHtW2vSMuU2lVKudVsLjl0VdhdrW3STphgQb2nQcZqADOg0lNSyTN9agaEnRPBnhHLs/rlHPavSiRLlw+rR4lbffjrOu2yGRq9PcJwdrMO4k+4CdDuL08qXQoe74ygo2oC0/1ISjNOT3TQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB4427.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(82960400001)(186003)(38070700005)(2616005)(66476007)(66946007)(76116006)(54906003)(36756003)(2906002)(87266011)(6506007)(85182001)(316002)(86362001)(38100700002)(66556008)(66446008)(508600001)(91956017)(5660300002)(7416002)(71200400001)(6512007)(122000001)(26005)(8676002)(64756008)(6916009)(33656002)(4326008)(6486002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0o0S1Y3TkRpS3NJc0djQ0Z3RkE2MnVZZnoxdXJWS2QvUlZNRUhrRUJtWFhx?=
 =?utf-8?B?MCtXeDF5RUd6RVhVaUFxTDlVeFI5U1N4akQxcnNpaHdraEx0d2NDSHJ1WEgx?=
 =?utf-8?B?OUxodnhHRmZSRjN4cXlRWVcybkJ3R3VXUFJaUlpvUXB1SmdVcjloU0docy8x?=
 =?utf-8?B?Y2w0Q29sNDFVZlZqVkRBQjc1U0tMaEpaMXozMjk0RWU2azBoN3dLcTUrZnIv?=
 =?utf-8?B?bTZiWmMvalZ5WE1ZWWRiUzc5ZlVGUHhxZk5MQ0ZCMkhINUtRMzYxMHpWQ01W?=
 =?utf-8?B?bEhuOVV3cTdvUkNXbDI5REd5S05tTURzWGlxVWkzWVlXQWtnKzRFVzNkNVN5?=
 =?utf-8?B?S2h0M3ZrTTNjNEV5TkJQN1Y1VCtSYnl3U0w5SVVuVnFQZkpubTVtYitvK21R?=
 =?utf-8?B?ZmNlYmQ3VkVvODYwWFF0SlBxUHdBVVJkSzJidDdFczRBZlovUzBYVnpLMnBZ?=
 =?utf-8?B?OEtzcFZQUTd6NnRybk8xdTlNZUxOenRFaTA0RzExSFVxS3p5akc1SDIyV21Y?=
 =?utf-8?B?NVhHRlljQTkxcVQrZG82dTIrYk0rdXlkTHlxMkNUdC9FdVQ5TFQ0emU2Z0JW?=
 =?utf-8?B?bWVNTkh4MzlSaE1zSmJ4K1h5RkIwSGpuT0FVRTQ1UElDK2dQV1FiYlVwMU5S?=
 =?utf-8?B?WSsvd0lGNjNReTZvK3FVVDE5SzU3enovaGpBeFBwTjhWNm85V0xiUHpEVUlH?=
 =?utf-8?B?Y1VIQVc0RjFWRUthcEtkVmlmM3k4MTBSUm5KZEcvVVNnYmFqN3lKTVR3RnhW?=
 =?utf-8?B?NXExWU8zK0JhUWl1cjFRZkZyekRmN3M0T1Myb204V0tuK01CQVZjdWNkMUE5?=
 =?utf-8?B?VHFFSnIrazNLNjVPYUZKaXp2dUZ1UytrajNGN2VWSEwweEJkMnYxazc0Q0Ro?=
 =?utf-8?B?ZElNZCtrQmwzby9Ia0IrY1NVOTd6Zlpqanh5a2RYV1E3OHlna3J3RmYvcktT?=
 =?utf-8?B?aTR6amZHdnVsMC9ZK25mY0ZqV0hEU0lZdHhrellTMFZhKzdtYmVqOEJNOU13?=
 =?utf-8?B?Yi8xRE9TQW5Wd0ZjYktzeHhOMWtaTldRNUVid0VCc2ZTMFcvbm9FejBMRmUz?=
 =?utf-8?B?aDU1T2Rka3hhSkVYdnd1Z0FNc3ViYlBJeFZqQVY1SFByMTR5YVdoYmlIY3NU?=
 =?utf-8?B?RWZUOXZSQ01WWk1Eb055VU9pL3BVKzh0MXYrMHU2dlhId2dnVUlLdTdtQ2RS?=
 =?utf-8?B?T0w1M2tGdmEvOW1MU2plOXZpampNZnZ0eGFqS0h0SGZOanJBUVRQdjVtOFVm?=
 =?utf-8?B?ZW4vTGkrTVI2RmRYVkVFeVVSYk54bjg1UW52bzc2b1lUbWRKRWh2cjR5emJh?=
 =?utf-8?B?TUpkeTNzVUQxTlI5dWRwNVBZSExCeFROcGNKL0tlNFUrL2F3UFlCZGtQRGRh?=
 =?utf-8?B?OE5GU0NwUzJtcnhibGdYNlRyb3RNUzFtQmEwT0xSSlN6Tlpjdk9xSklWZE8y?=
 =?utf-8?B?R1o5aEdGMUZUSVZseDZxN3YycW83Y242VDFSRFc1NkNlTC9GRWUrVk9lZTNh?=
 =?utf-8?B?cVlJOVZORmtlQTJDTDYvelhiVUk2NzlPNE5qUHhpekk4U1YxSTdCSkp2b1pH?=
 =?utf-8?B?TkFtSUJ0WkNJUDhZa1BBYTg5V1ZWQzc2MzBieUNWd1RmMDJNa2pNVENKdlVL?=
 =?utf-8?B?ejlxMUdnWWJlZUR0MEc2bGx6K0YzNGlId2xjcUZWZ2FpNllCM3FWdkRzQ2Zs?=
 =?utf-8?B?c3BvVkFZaC9rTm4yQXNhYUVoRkpiWkRDcXZ2Zndwa0tyMW92TnRoRkR2Q1Bw?=
 =?utf-8?B?WktEWFVmdzRoSFZsTUR6ZEdZZHVuZGgvUGt2cnpsNXhVRVQzQ1dOYmMyK2lk?=
 =?utf-8?B?RTU2bXd4ckl1cVp6d2ovbkFKaWJoNk1iNktUc0dML0lER3ZjWDNwbnhITzR5?=
 =?utf-8?B?Uld0b1pJUWkxMU1USzAxTFhWL282VHVrRjNTSUw3SVd4cE1OZWd4VjdLZXpk?=
 =?utf-8?B?VVBHYzIwMU1oQUJrVkJLdnFBKzYrTlhrRzIvbGlGQVkwVGtWU1A0Y2x1TGFv?=
 =?utf-8?B?V3c4L3NaTitFNncvSHpIZVNkWkllajZ6b3V5YXhCSFMvYXBXZmdUWW10bDlp?=
 =?utf-8?B?RGVRd3VMbWxvSTFMdlFhNTNyaE5waGJLVzlnRllFY3l4ZzhITWlwanF5aVV0?=
 =?utf-8?B?UVpUb0U1ODRpY0pmdEZidHdvdHRiVmxhOWdxbndWTGZWRTJzL09raTdURFkw?=
 =?utf-8?B?QVc3YS9QSUhoMC84MHgxM3JhZGRnSUZuNytHTko5bmQ1VHF4Q2JrejQwYXEw?=
 =?utf-8?B?cWorTDlBbUtxZE9JVE40aHVHRlp3ODUvV2crVGxwT21ZdXNneExXblB3QzBD?=
 =?utf-8?B?a0dqQ1dpQXFnblRvb3BqK3FDd2ZVYXVPd3h4OHRYVWVMNGFlY2JvQXFLQlYr?=
 =?utf-8?Q?ie+FckXuy+5iWAXAvcc6cwtC522OsN7OMJUQS?=
Content-ID: <9976F979AF7A1C4694979D37AC7D820B@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB4427.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4148dacb-c82a-4bd1-feee-08da226ae455
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 01:12:51.8596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hkHrqOySpp7dr27tgvAjrZetPdeOuXUJ/j4Xrs7rrWfnYMddOXkOWPgvmJ0T8/2mMtmJdeMBRAVnWJ+p3rRzPBnY2jhfUKFe+icp3ryt6UM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4267
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  on 2022/4/19 22:11, Trond Myklebust wrote: > On Tue,
 2022-04-19
 at 15:59 +0200, Christian Brauner wrote: >> On Tue, Apr 19, 2022 at 07:47:10PM
 +0800, Yang Xu wrote: >>> Since nfs3_proc_create/nfs3_pro [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.151.214 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [68.232.151.214 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ngz9A-0004NY-M2
Subject: Re: [f2fs-dev] [PATCH v4 4/8] NFSv3: only do posix_acl_create under
 CONFIG_NFS_V3_ACL
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
Cc: "brauner@kernel.org" <brauner@kernel.org>,
 "djwong@kernel.org" <djwong@kernel.org>,
 "david@fromorbit.com" <david@fromorbit.com>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
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

on 2022/4/19 22:11, Trond Myklebust wrote:
> On Tue, 2022-04-19 at 15:59 +0200, Christian Brauner wrote:
>> On Tue, Apr 19, 2022 at 07:47:10PM +0800, Yang Xu wrote:
>>> Since nfs3_proc_create/nfs3_proc_mkdir/nfs3_proc_mknod these rpc
>>> ops are called
>>> by nfs_create/nfs_mkdir/nfs_mkdir these inode ops, so they are all
>>> in control of
>>> vfs.
>>>
>>> nfs3_proc_setacls does nothing in the !CONFIG_NFS_V3_ACL case, so
>>> we put
>>> posix_acl_create under CONFIG_NFS_V3_ACL and it also doesn't affect
>>> sattr->ia_mode value because vfs has did umask strip.
>>>
>>> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
>>> ---
>>
>> I have the same comment as on the xfs patch. If the filesystem has
>> opted
>> out of acls and SB_POSIXACL isn't set in sb->s_flags then
>> posix_acl_create() is a nop. Why bother placing it under an ifdef?
>>
>> It adds visual noise and it implies that posix_acl_create() actually
>> does something even if the filesystem doesn't support posix acls.
>>
>
> Agreed and NACKed...
>
> Any patch that gratuitously adds #ifdefs in situations where cleaner
> alternatives exist is not going going to be applied by the NFS
> maintainers.
Ok, will drop this patch.
>

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
