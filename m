Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBEA507E09
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 03:16:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngyxg-0003AT-2g; Wed, 20 Apr 2022 01:16:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <xuyang2018.jy@fujitsu.com>) id 1ngyxe-0003AN-QV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 01:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X/WSFZzwDRFJ87Rb7HwHc2/mPD5bEW/Qz45Dv07PzNE=; b=lmu0I6axmefNQUVWrVVQy4GMaS
 Ud/s0PRofoN3D7JA1pYdcdkz44p7F7sIhdizMKKgtJqHh0y9pI6BOYMqlwEs0OF2mdkYhTtAAK+yY
 jf5Dvd3RAKlWDd8L1a7RZA8/RKwxAlkHWnojLR6Y3kZy8hWHva/9O3colSw+49+u3JYQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X/WSFZzwDRFJ87Rb7HwHc2/mPD5bEW/Qz45Dv07PzNE=; b=isBCNumgoHzt0XGySgYIu8zg6L
 gLT36IpMexdTvF22uyD+mNMKR3JwGK1kM0ttrW38bZoHF1yfeY+mH3JrTjMbYmZGjWmDPOgVTAeaM
 BGLssGPQbfjJu9nxQyoUuP2CHNXpT5frdnRUhgYX72P8fuvytvs1RNPZaRd/tngQVvb4=;
Received: from esa1.fujitsucc.c3s2.iphmx.com ([68.232.152.245])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngyxY-0003x9-I3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 01:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1650417404; x=1681953404;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=X/WSFZzwDRFJ87Rb7HwHc2/mPD5bEW/Qz45Dv07PzNE=;
 b=u0MNFyHhG9pnL+kTHCNkPXNS6LByuyABB9asw4swNw9tvYF/So5/tDSq
 VCuepNPxNgseT5nYsPfXoAD9f7dLEGganH1g40mVW+dlJ822HAujrzQ93
 jsISLPQnz77L6EjfHYNmrhhfttOiGKwDpjM8Gqx9vioneetAtRXQ6CJTN
 9Kfjuxa8lklq70G0vz1xhPVgiPSBsesimm6gyBoVwuj7xtLQLdIZvXTTU
 nv6SJ8vHjV5m9QMsOALVM/1jpXO7xtJrocFlF5ag9qe/FfrcIqEU2cF1V
 nryjNkcS6RjwwaQMYACkYkySrxVv1kFQ10YP4PQAX9hlrK2UuSgBu0d88 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="62450105"
X-IronPort-AV: E=Sophos;i="5.90,274,1643641200"; d="scan'208";a="62450105"
Received: from mail-tycjpn01lp2176.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.176])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 10:16:31 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xlz7z9QhDIfiNCJ7Pw9+vUDvWi2pX8ExWs3zSN+Q3sFUyGv39/V/JzFPspIfTPCXrcg6lXPj6IxRmIWaoonFFhxmAXa1O7x+3BLaqS5CJjuOqe1e58tX9qY7FjI7VxPqTIH5xgC/qwYp9BNl8vBHyCjkvU9Xm+X8qvCZ9MIGWCkxZlEMc/nG25D8YgDE8cyZE+du9fB/ksE0+lEyJjOftJUSfjKOHeEtYZlrNsgF0lkpVD3sDGre2+xyMdtX5Vhc9yu9iJKAaZXu6AJGIxIuy0aYqUm9Xbr2JAWGQCIFt3FVIiZyJiuO8u+42pAuUuE9cMhGxLshLlVJKLtUb57/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/WSFZzwDRFJ87Rb7HwHc2/mPD5bEW/Qz45Dv07PzNE=;
 b=DMjhgN64UZTuRjzD7YqFJfBo8OqDjnkQxt+3s+bATFLSBFxuF0Iat7tGJQvbuSC5y9qxJZHBdMTIlU1/AgNtHOYuhKVs4dqDuWdU/rXEnsXs5HCmqkdMP4LfAm2/lUK7APvVIAafpguKywNGmaSqaD5hcJZIIPE81POLw9FRMg35REtzzI8UYLklhiIQT9ol6HQvCN1uKZhFjXnGxcKMD6HaJx1wMoGPEMPh92xxt9NtId5FE5dF3IRBDWigSc05GTuKGbz34WflHS0T2LgSSv4JN3AkqbpEDItyqNozDxpysqBDQTz63EBDgJoOR79DvyrNLps52PJ6QCuXuzTQEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/WSFZzwDRFJ87Rb7HwHc2/mPD5bEW/Qz45Dv07PzNE=;
 b=YNvrMZadYX3EEdV+hR+U8i/+8tqIHIHusvL4lBjl4bneLLErra+bwVhktzhWOVAsIqZrydaPUlS6BMmcj4R0ZGDqblTzjXb1b/WkeSfPMnOZOxQy+qYVV63SZJQwv6oFjeuURMYxmtqxNhRcxeUI5UZRUbfl90vTM4XSoHBlSRU=
Received: from TY2PR01MB4427.jpnprd01.prod.outlook.com (2603:1096:404:10d::20)
 by OS3PR01MB10073.jpnprd01.prod.outlook.com (2603:1096:604:1e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Wed, 20 Apr
 2022 01:16:28 +0000
Received: from TY2PR01MB4427.jpnprd01.prod.outlook.com
 ([fe80::fca9:dcb9:88b4:40fd]) by TY2PR01MB4427.jpnprd01.prod.outlook.com
 ([fe80::fca9:dcb9:88b4:40fd%7]) with mapi id 15.20.5164.026; Wed, 20 Apr 2022
 01:16:28 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Christian Brauner <brauner@kernel.org>
Thread-Topic: [PATCH v4 7/8] fs: strip file's S_ISGID mode on vfs instead of
 on underlying filesystem
Thread-Index: AQHYU9smrES0QaSd7UyAJX8RLA+ZpKz3RliAgADLkgA=
Date: Wed, 20 Apr 2022 01:16:28 +0000
Message-ID: <625F6D46.3010604@fujitsu.com>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1650368834-2420-7-git-send-email-xuyang2018.jy@fujitsu.com>
 <20220419140905.7pbfqrzmyczyhneh@wittgenstein>
In-Reply-To: <20220419140905.7pbfqrzmyczyhneh@wittgenstein>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ddb09ae7-3188-4f68-3fe4-08da226b654e
x-ms-traffictypediagnostic: OS3PR01MB10073:EE_
x-microsoft-antispam-prvs: <OS3PR01MB10073F10CB0A5D2A51C5FC677FDF59@OS3PR01MB10073.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zX+gFvvLM0S08TSOXW4Kn2C2wUJInizZdZg7enmdZOjd5lmwOM2KMZD38IQUBq2TvWLPWwaszzQpraqM97IN/zUE+EhZynaW3xoIFshtY/GJGqBvNOG+XcMzJ/d8gd3uCRaBTfVbbCHyaxTjKJpbfNA8Wd7m2UoYAHNd8K189k3pS4nbwiyqu896Ld8UCMAxzAkuKob6YBnL+BDoflR6y4HsWkZxnjtLJQKlHqeM56Cwjv+VCtZaxtZa6pF3/MgypNkKF2cHledW8pzSRUNfcz/YZlMXtZawk/Cs0739//wOo3GnhLLYl37hD8/EtbtB0qfa+RUP3Mle3bMrjbTOeR3x86eVBeFFrkfNNGTA4tQPm0TpZs9IOg4zFTuGHKNvawRmk0KnFH2aM6NsChzYjlYmEv2+iXga1RsHn3H45klK6wzPR4G+3qY5teB8wLd4+4XWCIviTR+TBxDvYlpvY4pmwmv3WD4O1XMM+Ewj3iFZr9uMA5XtvJ/CldhGNweFqQtlmQl57nux+V+L40OvFI/jMQNQDUNaC/xcazkj5syC1l/8D5vbU3j7eRPeUJGho/kgH0BrAX5M90bItgal/sMZ2bX4lO04sw/BzCizInsUmXg7Rf9EE6BaHrlMxJTbSxfdfZ4LGyp3hZXlpGfjRLhVyg82RsYAXHPofcP/ZgB9kJOA0OG76leX1fG5nibSWbXiOdE/ZBjN76FheiO1qA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB4427.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(54906003)(6916009)(8936002)(6512007)(87266011)(26005)(2616005)(2906002)(64756008)(8676002)(82960400001)(38070700005)(38100700002)(91956017)(122000001)(6486002)(36756003)(66946007)(6506007)(33656002)(83380400001)(7416002)(85182001)(316002)(66446008)(86362001)(186003)(71200400001)(66476007)(66556008)(76116006)(508600001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZU4vdjE3MDVoZW95ZHhJN3V4MXFRblhMaUwvMW5DblRDdzBtTHlvT3p5cEFx?=
 =?utf-8?B?RVdKWXpnalBUVHc3amFxUS9CaW5rK2Z1ZHo5NytBSG0xR1hpOStSVzJmbUtU?=
 =?utf-8?B?Z21LRWJsUVdhL2dvbGIzSE42cEtpQzlQQVprbkFlUWFwTDRseDh1cm9FZ2t0?=
 =?utf-8?B?U2lkbzR6T0dJUFZCZnpLaVU4WlJpVmREMUpPNzVkdkFxTzhrdXpYU1FzMFU4?=
 =?utf-8?B?VHZkenplRlZibUFpaWl2M2ZteDF4dk5OQVA3NHBuMW5kSVJVWUEvYWN6YVVY?=
 =?utf-8?B?UW81b3dUYm51di9qNnJLeXZib2g5TzAvTVh6M0lvd1N6eGZjL2JPR1BYNm9a?=
 =?utf-8?B?bExvZ1JsU3RWTHBaYzRZMVVWa2psdkxwcm00R3VXVURTMmx6UWRVbCtqOVQ2?=
 =?utf-8?B?dCt6RmVLOUJLMnlMaHBFRFdCK1NHRnVaQnpwdndKU1dVS2U5UnNnVjBKbDdF?=
 =?utf-8?B?UUVkTVJNSjNSSTBibEpKOFp2MjRXalkrYTZ5Mzd3L2dPNUtHM2FmVlFpRDJm?=
 =?utf-8?B?bDVTbjNvNDFmQnUvWWhOTlpxRlpad3lpeml6aUVEMnR3OGhKb05HWWhLRlJl?=
 =?utf-8?B?eWptQlBMWjVyang0TEVGdkpqbEFOWS8vNm1ydDRBV2ErOEcySlBnYSs4bXNj?=
 =?utf-8?B?bEhPcytlWFpCQzBFWVpZcU5EYmRTYkFhYmF0N3gzM1NhN2NnZ2hJZk14MWFE?=
 =?utf-8?B?U3ZOVld3c1FqZFJsNFZmb0hxRC9RcmhvSzdOMkZWcW9LbTJhVXlnL2JHZURD?=
 =?utf-8?B?Y091d2Z4WVErSWx4ck40RGNZcVpMZGlqREsxVm5Yd29DRmdLVmlHeXEzNVRT?=
 =?utf-8?B?NDRyMkduS2Ntc21vVjQvMDI5SXB2ZWk0SVZ4Wmd6Z1FhSmdsaDBlRjR5b1Jn?=
 =?utf-8?B?M3NuaHcvN01RMEZycWM1bjI0djRFNlhoYVRMbGtqdFJYaEdHWGxlL0JFbnQx?=
 =?utf-8?B?STAydGViVDJFbFljZnhDdEtMeTEySHAxSVZhd2EveVYybnpKTStUY0lvUGtn?=
 =?utf-8?B?RHpXRTBoOGVNdE9iUzB6V0FMV3RMS3B2QXd3UjF4TTdTR1grR09YWi9aU3Vr?=
 =?utf-8?B?Uis4RDlHRFE0bkprN0JMUkY5TXZqQzJrR0NheHU0ZUs0MElKV1F6RFFsZ2s1?=
 =?utf-8?B?dzBIeHovbjk3OUwyc0U2L3F3dW53L0I2bDFkVGdVYTRUNTFoR2kwM3V2MllU?=
 =?utf-8?B?KzdPalgyZjRvRXoraFlvdWxWbjhibzNvNDVSaWUvdkRKMFFmSlJ0eEtNS1Fj?=
 =?utf-8?B?MUpCdnQzcnN4aGVBQlB4RW8wQnR2ckxYZVZ5U3VMc3I2R2RHaTNSVFI0dVY5?=
 =?utf-8?B?eGY0QmZ4bi9hWEhrcFAyNzR2ZkhPY2xkRTJDM01kTGJYQTA1Y1Z1Z0pjcjBI?=
 =?utf-8?B?RzN3anh1ZWxwNUVpSDZMQngwblVmc29jMUd6UWd2TVdMaVg3OUtWbnVUbWRX?=
 =?utf-8?B?OUNUaUNMS3JSalpRbDNCMWRZTHJadzhZY1N0cUVveVFyRnpLZkFOblcvQkJv?=
 =?utf-8?B?ckpTVDVTWGtJMlBmeEdDUVYrcEh4MmtlVmZqUzd1VEFjc0N2ZTFHNktmZnB6?=
 =?utf-8?B?aXoxaWVHV1Jmb29TNWJGSzhuWW5oVHhycEFHMlpaRm03eHdQMkY3eFBEVndx?=
 =?utf-8?B?amNwM3dUL21GWXIxTUVockJLWmRrZ2QyUVNsdGpaL0l6TzBHdGxKRWRXbEF5?=
 =?utf-8?B?L09PYkdjTDI3dmMwaFFuaE5XcUt3K1ZtbkRnQnZGR2RXU2Nyd2MvbXBBZGkw?=
 =?utf-8?B?aHJUUDVFODIxSHdyZnF5TGg1Tm1WQzZGdFVTR1lOSi91b3lGWjhuOEZqeHh3?=
 =?utf-8?B?N095aFJ0b1BZL3VybXBLdlp6Zm1xK3VpR2JCbzYwWklTZHdCZWhDSmV0YTlU?=
 =?utf-8?B?NUtLVDlnaDA5dVhFTUFwSXd4TjMvTkVUWGtRZ04ya1dyNEpiMmovR2ZQVlBz?=
 =?utf-8?B?U05vcGozZ3oxeXgvT3A5OVFzbyt0MkcrUlFDMEszUUNPdlMrc003WXlQWFhu?=
 =?utf-8?B?VWJSbmtaaGZVUnZaM2xxNVZHSzJkS2c0OEFHdkhQdi8zSjdLL2YwSXBKdkZR?=
 =?utf-8?B?TjZkd0xzdTdiTHhIV0dvODJHZk5YRm1OU1JpWmhjSEF5UzJaYW82SytqR2tq?=
 =?utf-8?B?ZFFGenIyMXBvdXlacXVLSUlucVByeWlzT1BlRElPMmp2VDNEVm85b0w0S002?=
 =?utf-8?B?VTdmK24yVEhRSU5QTEIwVk02T2VZYm5yQjlwd295WTIyOFFSRktpZGI0ZDZJ?=
 =?utf-8?B?YmYzTzdGRE8wT1hocXk3cm1nbllqTjlrM0xEa0ZFZmNCemYzZ28wWXlFakhm?=
 =?utf-8?B?QnIyZDRlRVVRNC9jRjRvQUZGdC9uUlJKWjdwYUxDNEZVaUtvTi9EMzJPc0dp?=
 =?utf-8?Q?iWeBS9/lVtxTELrmP44fo3tLCNNy0BI+4UvTm?=
Content-ID: <348444529BD3CC4E836A044AF0CB71A3@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB4427.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb09ae7-3188-4f68-3fe4-08da226b654e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 01:16:28.2037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l7Yqe7+ftJ01gFjLiydtOlzxBLAYP1v4E+klafS2yjiABNiZ/EoLtRCSqwOQTHikczK/Gn9Ks/3xksoqJYf9UoQxQmFInEYHE2UBdKKbT4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10073
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  on 2022/4/19 22:09, Christian Brauner wrote: > On Tue, Apr
 19, 2022 at 07:47:13PM +0800, Yang Xu wrote: >> Currently, vfs only passes
 mode argument to filesystem, then use inode_init_owner() >> to str [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.152.245 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [68.232.152.245 listed in wl.mailspike.net]
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
X-Headers-End: 1ngyxY-0003x9-I3
Subject: Re: [f2fs-dev] [PATCH v4 7/8] fs: strip file's S_ISGID mode on vfs
 instead of on underlying filesystem
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

on 2022/4/19 22:09, Christian Brauner wrote:
> On Tue, Apr 19, 2022 at 07:47:13PM +0800, Yang Xu wrote:
>> Currently, vfs only passes mode argument to filesystem, then use inode_init_owner()
>> to strip S_ISGID. Some filesystem(ie ext4/btrfs) will call inode_init_owner
>> firstly, then posxi acl setup, but xfs uses the contrary order. It will affect
>> S_ISGID clear especially we filter S_IXGRP by umask or acl.
>>
>> Regardless of which filesystem is in use, failure to strip the SGID correctly is
>> considered a security failure that needs to be fixed. The current VFS infrastructure
>> requires the filesystem to do everything right and not step on any landmines to
>> strip the SGID bit, when in fact it can easily be done at the VFS and the filesystems
>> then don't even need to be aware that the SGID needs to be (or has been stripped) by
>> the operation the user asked to be done.
>>
>> Vfs has all the info it needs - it doesn't need the filesystems to do everything
>> correctly with the mode and ensuring that they order things like posix acl setup
>> functions correctly with inode_init_owner() to strip the SGID bit.
>>
>> Just strip the SGID bit at the VFS, and then the filesystems can't get it wrong.
>>
>> Also, the inode_sgid_strip() api should be used before IS_POSIXACL() because
>> this api may change mode.
>>
>> Only the following places use inode_init_owner
>> "
>> arch/powerpc/platforms/cell/spufs/inode.c:      inode_init_owner(&init_user_ns, inode, dir, mode | S_IFDIR);
>> arch/powerpc/platforms/cell/spufs/inode.c:      inode_init_owner(&init_user_ns, inode, dir, mode | S_IFDIR);
>> fs/9p/vfs_inode.c:      inode_init_owner(&init_user_ns, inode, NULL, mode);
>> fs/bfs/dir.c:   inode_init_owner(&init_user_ns, inode, dir, mode);
>> fs/btrfs/inode.c:       inode_init_owner(mnt_userns, inode, dir, mode);
>> fs/btrfs/tests/btrfs-tests.c:   inode_init_owner(&init_user_ns, inode, NULL, S_IFREG);
>> fs/ext2/ialloc.c:               inode_init_owner(&init_user_ns, inode, dir, mode);
>> fs/ext4/ialloc.c:               inode_init_owner(mnt_userns, inode, dir, mode);
>> fs/f2fs/namei.c:        inode_init_owner(mnt_userns, inode, dir, mode);
>> fs/hfsplus/inode.c:     inode_init_owner(&init_user_ns, inode, dir, mode);
>> fs/hugetlbfs/inode.c:           inode_init_owner(&init_user_ns, inode, dir, mode);
>> fs/jfs/jfs_inode.c:     inode_init_owner(&init_user_ns, inode, parent, mode);
>> fs/minix/bitmap.c:      inode_init_owner(&init_user_ns, inode, dir, mode);
>> fs/nilfs2/inode.c:      inode_init_owner(&init_user_ns, inode, dir, mode);
>> fs/ntfs3/inode.c:       inode_init_owner(mnt_userns, inode, dir, mode);
>> fs/ocfs2/dlmfs/dlmfs.c:         inode_init_owner(&init_user_ns, inode, NULL, mode);
>> fs/ocfs2/dlmfs/dlmfs.c: inode_init_owner(&init_user_ns, inode, parent, mode);
>> fs/ocfs2/namei.c:       inode_init_owner(&init_user_ns, inode, dir, mode);
>> fs/omfs/inode.c:        inode_init_owner(&init_user_ns, inode, NULL, mode);
>> fs/overlayfs/dir.c:     inode_init_owner(&init_user_ns, inode, dentry->d_parent->d_inode, mode);
>> fs/ramfs/inode.c:               inode_init_owner(&init_user_ns, inode, dir, mode);
>> fs/reiserfs/namei.c:    inode_init_owner(&init_user_ns, inode, dir, mode);
>> fs/sysv/ialloc.c:       inode_init_owner(&init_user_ns, inode, dir, mode);
>> fs/ubifs/dir.c: inode_init_owner(&init_user_ns, inode, dir, mode);
>> fs/udf/ialloc.c:        inode_init_owner(&init_user_ns, inode, dir, mode);
>> fs/ufs/ialloc.c:        inode_init_owner(&init_user_ns, inode, dir, mode);
>> fs/xfs/xfs_inode.c:             inode_init_owner(mnt_userns, inode, dir, mode);
>> fs/zonefs/super.c:      inode_init_owner(&init_user_ns, inode, parent, S_IFDIR | 0555);
>> kernel/bpf/inode.c:     inode_init_owner(&init_user_ns, inode, dir, mode);
>> mm/shmem.c:             inode_init_owner(&init_user_ns, inode, dir, mode);
>> "
>>
>> They are used in filesystem init new inode function and these init inode functions are used
>> by following operations:
>> mkdir
>> symlink
>> mknod
>> create
>> tmpfile
>> rename
>>
>> We don't care about mkdir because we don't strip SGID bit for directory except fs.xfs.irix_sgid_inherit.
>> But we even call it in do_mkdirat() since inode_sgid_strip() will skip directories anyway. This will
>> enforce the same ordering for all relevant operations and it will make the code more uniform and
>> easier to understand by using new helper prepare_mode().
>>
>> symlink and rename only use valid mode that doesn't have SGID bit.
>>
>> We have added inode_sgid_strip api for the remaining operations.
>>
>> In addition to the above six operations, four filesystems has a little difference
>> 1) btrfs has btrfs_create_subvol_root to create new inode but used non SGID bit mode and can ignore
>> 2) ocfs2 reflink function should add inode_sgid_strip api manually because we don't add it in vfs
>> 3) spufs which doesn't really go hrough the regular VFS callpath because it has separate system call
>> spu_create, but it t only allows the creation of directories and only allows bits in 0777 and can ignore
>> 4)bpf use vfs_mkobj in bpf_obj_do_pin with "S_IFREG | ((S_IRUSR | S_IWUSR)&  ~current_umask()) mode and
>> use bpf_mkobj_ops in bpf_iter_link_pin_kernel with S_IFREG | S_IRUSR; , so bpf is also not affected
>>
>> This patch also changed grpid behaviour for ext4/xfs because the mode passed to them may been
>> changed by inode_sgid_strip.
>>
>> Also as Christian Brauner said"
>> The patch itself is useful as it would move a security sensitive operation that is currently burried in
>> individual filesystems into the vfs layer. But it has a decent regression  potential since it might strip
>> filesystems that have so far relied on getting the S_ISGID bit with a mode argument. So this needs a lot
>> of testing and long exposure in -next for at least one full kernel cycle."
>>
>> Suggested-by: Dave Chinner<david@fromorbit.com>
>> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
>> ---
>
> I think we're getting closer but please focus the patch series. This has
> morphed into an 8 patch series where 4 or 5 of these patches are fixes
> that a) I'm not sure are worth it or fix anything b) they are filesystem
> specific and can be independently upstreamed and c) have nothing to do
> with the core of this patch series.
>
> So I'd suggest you'd just make this about sgid stripping and then this
> doesn't have to be more than 3 maybe 4 patches, imho.
Ok, will focus on this sgid stripping.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
