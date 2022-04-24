Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4430750CEFE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 24 Apr 2022 05:36:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1niT3L-0002pP-8v; Sun, 24 Apr 2022 03:36:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1niT3J-0002pI-QH
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Apr 2022 03:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BJBBlTOudy8dwVLaEALu8Er3rAVRbjb6F6DuMWqbwgk=; b=LfCmuNN8gIHl4MA8VoVxKHXrJz
 BzTynzCyhUIYgTGoChjUXYzolCF5V0Js16yErOHUcJAzm7GHFuyQivO3yT0yHF+OgkbNgA0CWM0EY
 XZnCjqV2V39XI7Y0OEY+irjGpxm7xUCQLqbreWBmtWZ57p+um14FN8GDiC0Gt/HfFvLg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BJBBlTOudy8dwVLaEALu8Er3rAVRbjb6F6DuMWqbwgk=; b=Vn5mUSg34iICmWe47UPV9pN/ks
 xscV2OR8TDR6si6lrtFdz/nsdqa0ppJSku/tZDBtRjnheZzY3KqJo2I15ET695QkVN8QdjpnsDFCn
 BlusYnWCzuuZRB2aqDBDabR1NA+OnR33+O/dkSgU5Seo8EdbbrzymxyE96kTKHmmP1p8=;
Received: from mail-sgaapc01on2093.outbound.protection.outlook.com
 ([40.107.215.93] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1niT3G-0082QZ-Fy
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Apr 2022 03:36:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1P8erTK3Xo6oiFgvozeECYcn+m9oFfgBunBEHaUa7z/Ad1fgjr7ZyS99NiprIx8j6y5kxGZlN5knhjtlMhhDWwscnPZvv5+USY4xayU8MrQa/DbiEXQIPMqyuYWlJg3ytxs5SsskRGF+56y3t9tFm2KurBXdpDmC5T97QjmO+WoLcuXNksBIDG7DPpUYyv9nR479y57myx3sOhVHeiazi/aHg3mQqTXDkvjX98etwPFPBClCzFeeSWxKFKnxiAo2VaBKUM7tCB3w9JNHyvls5cQbRPy7X/TVc+6a48EVXGDoYF6VbggUXdGv4GY6WhtVgu3gsK6DcJI5GUbdh3cDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJBBlTOudy8dwVLaEALu8Er3rAVRbjb6F6DuMWqbwgk=;
 b=N5Mykh29ujyz9L9yIlmFLuHvuP4bsN6gAoOVvFTBH/kHNR9mmGBokUiipFpgzNkIxyL1AGr18iVC8uG1NJFuYfmO+W/P1uao+Puo4bwNka7SJB2yA7GvJbDs3wEYLPPLIlJyqbJ+zW3R0jXJ5zQgcbisMCMAfC7MRrvqrh8ldVXNh0o3vr4ibUeWQCEBn2PNw8ajNRxcZtNTr8A4r5AD5tbTjJj8/Jyk3Ps0P6fx9KU2kLt/9lbFQ0aqkrDrH+5TkWQhk/Oa11+qbXNv1cEJb2AMrhRbncPTFvOhBlaa33vJv+OGUi2+rtDnB+6z7hVvcqUmhZwi9gBD+dx19pbDYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJBBlTOudy8dwVLaEALu8Er3rAVRbjb6F6DuMWqbwgk=;
 b=ezybdGIHus0eyE393wWLed6ndi/OigQsNbykTNN4ySBChV8r97HOQHa47aa3MESLfGTAvvsTYVMgN1vzwihAXak8Z4j5pxjHBaw+XHArbOzlclK9X21cXSn8/WJ1K1D3fE7pJBlx9RO7vpAh27bcFTlCadHqFXP0uU3edf5m3nU=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by HK0PR06MB2516.apcprd06.prod.outlook.com (2603:1096:203:6f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Sun, 24 Apr
 2022 03:36:37 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f0c7:9081:8b5a:7e7e]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f0c7:9081:8b5a:7e7e%9]) with mapi id 15.20.5186.020; Sun, 24 Apr 2022
 03:36:36 +0000
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>
Thread-Topic: [RFC PATCH] f2fs: support forword recovery for compressed files
Thread-Index: AQHYV4vtIXDW6cgEm0m2LTWWbKhmGaz+aNKQ
Date: Sun, 24 Apr 2022 03:36:36 +0000
Message-ID: <KL1PR0601MB400375C1D24EB5B421B4C913BBF99@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20220424033218.439505-1-changfengnan@vivo.com>
In-Reply-To: <20220424033218.439505-1-changfengnan@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 284e27f4-b113-495c-6d56-08da25a3a2ba
x-ms-traffictypediagnostic: HK0PR06MB2516:EE_
x-microsoft-antispam-prvs: <HK0PR06MB251662BC631B83DD1EF33691BBF99@HK0PR06MB2516.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FG0q74Kf6V6hR5cqUeDjtFOA4wG8aFnsRx3hby3rk709I4JraI/o47zB/FBlQBnMH2kmL9IciEunrMERo7GERL2Tiog813fu2IB4NomVKXIuqMtgDqNvQ5p/BxLwPDOXpYTsfq6VvkLIoXmld5HwMgip2IFDtnuGzh8iWnfc5zoVpStBT5kZo1OB+ynFfEDG2c8lmBbRSiXcEWXxq+01Lep8AMxKj35xuPmzbzBew0aXHtStX8RdU5gre/3u5cOeD0KkKMnd3Gwqclh00rCOTrjwqngGLBUj1zZUaJPeW5q4EbjhnBKHGDkmEp5Z6MYRne5mO7S9TsDOhEqGJa61P0NqUEaHrANk7Csguk20AlvmnX0cwvLPCa3QaeC2Jy2colyWWnjh58IbAf0H7ksL+lCYU+N5mAucyg7EEWaWELCUKTdS4Yz4s389MwUvCAiT3AZzrOtyqPgNqvpxB3in2uYt5jgpcbCVIpTMMSDvoAbMd9g+A4Op4ch94g0NI211Op3hesJO//p9fnm8G359t2B3jouxCpTMYdnj3GvSHOufJMcNZP17OV4yfqmG2dra+d1MJcj27dtM/QHNQEou/l8JEu6KYA/PTLMuoT1+pcPtlld9yClXXCa3o074I1sN9SlPpw8XktsW7cU6OXuytRyFTB/Ozivlj0UJI4jHSfauPBdzdEC5gY8+a/GUZKd5EDD0gWdyNcKdEy41pBGUWA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(9686003)(7696005)(76116006)(186003)(8676002)(38070700005)(2906002)(33656002)(38100700002)(53546011)(4326008)(508600001)(26005)(6506007)(5660300002)(71200400001)(8936002)(55016003)(122000001)(110136005)(66946007)(66446008)(66476007)(64756008)(66556008)(316002)(85182001)(52536014)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?WnQ5eW5NVktVVjhBREhtOFZtRXV2K2lHeVBFWExpRmM2bmF4ZjZyczl2WVRQ?=
 =?gb2312?B?Q09Ha3pMN0hSNTE3WUNmYXFoNkx6RmthMGY5NnlUcXZmclU3N2M0ZGRrL1VH?=
 =?gb2312?B?dzlCQU1aQytlTlBaMlI2a2ZUZlgrUmJTQ1RhTnRpcHg2dkNNamZ1Y3JTMlFm?=
 =?gb2312?B?OHV1ZTdIWUpSbVcxR3pOaVc1M2d3SG1oejNUeVpPVWx6YklOUitSVHVFbjkz?=
 =?gb2312?B?WlgySjhYK0pCZEV4ZnVpbjFrdHlUOXJMN1l2UmNvQjF4ZWo2elBGeFJVRTE3?=
 =?gb2312?B?OFVlc2FmNzFDVnRldHUxN2FwUG1DZFBGQ0Q5TEFheUgzUkZYSis4OVlZM0lP?=
 =?gb2312?B?ZWl6d25UL1k2RHphNDdCRnczdmMreEtVS1JZWFdXTjcza2lmZE54ek8vVFd3?=
 =?gb2312?B?YlI1emxncW1JSytQVU9pbGVWWnpZTzFJdC81ZmcranNNaGJkUHNYWmc0TDl0?=
 =?gb2312?B?Ynd0aEYwMWxndkllWVpBV3ZwYjY4aGhodE9PMmVDdGY3VFl6SjhNUFhNSW1Y?=
 =?gb2312?B?ZGZpK083eUthR1BsbVp4aXJQcU1RcDZoSUdpTXE0OExJaHUwcm5qV255WS9B?=
 =?gb2312?B?UUlJQ3AzaEVhZFVVV2Q0ZWdBM21YZERhSXd4b2NjUUtqQ2I5c2NTam5UcHQx?=
 =?gb2312?B?Snp5VG9hOUN2bUhWTEIvQS9ZTkFwOUdwdkdQbGY2a1E1alZDOXBFc2ZIMTh3?=
 =?gb2312?B?ek43d1p1Y0U0cU9rNkp6cWFra0w5a1cwaVBpdU1iYjAvc2QzSzlvTiszUWhT?=
 =?gb2312?B?djFUTm1SMUtwdk9Hc3RJK0dTMEowMlpnY1QrY2NyVmk5aVhYTGdrRWlhTXEv?=
 =?gb2312?B?Y0xaZms1WkREZS9paHhlRFh4R0xDWFNHRVUxdm0rakJXZXduekRjQXV2dURK?=
 =?gb2312?B?ckt2U0xNdHRQcGNoSWlXODFnWkdRSlh1MVk0UE05SjdwUTdOeC91ZnlmS1ZU?=
 =?gb2312?B?Rit0MWNIVUx1V3o0VkpOTWREcXVjZmppd3ljUCt2WlRqdUpiM1BZK3c4R0Ex?=
 =?gb2312?B?ZDBXQkhlcHNRcWRicU11VjNmQXdncVlRc1RFaFdLWUViRFhyWmxwN0xjQlRm?=
 =?gb2312?B?NGdWdmh4R1N2VFVGcFZoSTB5czBFOXAxK1NjZVBNOERPVEt1U3MyclR6MVg2?=
 =?gb2312?B?aU1seHpWTGdUMlZvZ2RaMnpqU3VRSUdXaXRobDEvaUhPYkh5b2h4czJQZGgz?=
 =?gb2312?B?Qlc1OXk5bzBhSmM2NnU0R2JmNHlBU1puQmpzU2l2Snpma21mK2hjNFYwK0NX?=
 =?gb2312?B?S0VLUHJXYXZEY29mbTNiTktyZE9LYVF3bDN3MWdySllmRWs2d2J6REJyZE5Y?=
 =?gb2312?B?ZWthSnhJRVNDWXVWWDVIMkNWN2ZxaCtEQVhiMmNDcFF2dndISDZ3QWpwa1ly?=
 =?gb2312?B?S3NYbldHQmtpNWJzeG5YdjlZV3h0Uk5oQk5Da2J2RU5FS0JIbERkZ05vVGV1?=
 =?gb2312?B?K1c5WWV3dC9OV2dpZmJaVzRrL0UzNG1JcERINEJIaExBMU9DNzFRckI5UHhD?=
 =?gb2312?B?TFIxR3MwbG1EZklPOFNmeUUzbkRGVCtXVndjN3pFVHZHbXB6YTBkL2kyYi9K?=
 =?gb2312?B?cnhIM1hMWVU2cjdPcGZNelhIQmJrSlpoblVBYis3N3ArWWk3Q1JnODBuUnZO?=
 =?gb2312?B?TC9BS1hJWHBXRzFBT2lEcjVMbjlQY2hIOXRGUWUyeDI5NDYyKzBVM2NZVlVt?=
 =?gb2312?B?TXJ3S0YrQ2I4TENkWXNVNVM0UnZ5QmRWMkRlNmVOL0JTdEtFcmE0YUZXSnJI?=
 =?gb2312?B?VHgyenZtUVR1bVpMcXlWbVp6STlEWkM2WENJNnEyRmZjbEFISlpST3hpSCtP?=
 =?gb2312?B?dWplQStsQlVIOThZQnFsdjB6emF5L01GRjFrV1lodmNFTjB6SDR1OUo3cGpC?=
 =?gb2312?B?ZE9tSE8yRExYY2ZZWjgvOVhUcnlBOUdsK1lLOG90SXNTTWFSUllzTnhFcUVk?=
 =?gb2312?B?WUw4M1AzWHV1R2ZlSGcxQXFndTVJOTJlZGtWOG81cDBici9RUTdJZThieDl0?=
 =?gb2312?B?ZHoyRytzVGpWYTJrMzZTUk1YZCt6bm1Ua3B6VGlnNG8rMmlGcXZVU2IrR0ht?=
 =?gb2312?B?L0Z2RHBYaHZtRG14c1lFMW54bFk1aTFtbW5HZmFvdmNXRHZ3RzVVRTF1Z1VS?=
 =?gb2312?B?VGVkdXJuNmhvRHRDU2l6VkRUQjc4N1RzSWw0cjVxNU5xRVRyN0pMank1TTNP?=
 =?gb2312?B?SXM1a0YyVTRFUjB4enM5OENsdVBRNklTUW5QTXo2ZSsyTkwvQTVPNWJGOG9F?=
 =?gb2312?B?OXRseW01NUp1cjJrSlBwZklFZEJGdjYvYTFPQm40d1BPMTN0UUl5QkFucDFr?=
 =?gb2312?B?ZHpMSlJlK0xsZ09XSjFMZ0E4eWFWdjBjbkNOU25McnBXQ3lhazVadz09?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 284e27f4-b113-495c-6d56-08da25a3a2ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2022 03:36:36.5902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x6pPTLlmE3S08W9AK0p3++OI1aYu9WP0GeibAqOOTnuGezPvRFJle54QEhslJQ++b9W2ytenosboo2tkO41oPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2516
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For now, write compressed file with fsync, we need do CP,
 it's a heavy behavior. This patch try to support forward recovery for
 compressed
 file. This is a rough version, need more test to improve it. [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.93 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.93 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1niT3G-0082QZ-Fy
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: support forword recovery for
 compressed files
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
From: =?gb2312?B?s6O37+mq?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?gb2312?B?s6O37+mq?= <changfengnan@vivo.com>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Rm9yIG5vdywgd3JpdGUgY29tcHJlc3NlZCBmaWxlIHdpdGggZnN5bmMsIHdlIG5lZWQgZG8gQ1As
IGl0J3MgYSBoZWF2eSBiZWhhdmlvci4gVGhpcyBwYXRjaCB0cnkgdG8gc3VwcG9ydCBmb3J3YXJk
IHJlY292ZXJ5IGZvciBjb21wcmVzc2VkIGZpbGUuDQpUaGlzIGlzIGEgcm91Z2ggdmVyc2lvbiwg
bmVlZCBtb3JlIHRlc3QgdG8gaW1wcm92ZSBpdC4NCkFueXdheSwgbG9va2luZyBmb3J3YXJkIHNv
bWUgc3VnZ2VzdGlvbnMuDQoNCldoZW4gdGVzdCB0aGlzIHBhdGNoLCAgeW91IHNob3VsZCBkaXNh
YmxlIENQIHdoZW4gZnN5bmMsIGxpa2UgdGhpczoNCg0KZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmls
ZS5jIGIvZnMvZjJmcy9maWxlLmMNCmluZGV4IGYwOGU2MjA4ZTE4My4uYWVkZGE4YWU1OGFmIDEw
MDY0NA0KLS0tIGEvZnMvZjJmcy9maWxlLmMNCisrKyBiL2ZzL2YyZnMvZmlsZS5jDQpAQCAtMTk2
LDggKzE5Niw4IEBAIHN0YXRpYyBpbmxpbmUgZW51bSBjcF9yZWFzb25fdHlwZSBuZWVkX2RvX2No
ZWNrcG9pbnQoc3RydWN0IGlub2RlICppbm9kZSkNCiANCiAgICAgICAgaWYgKCFTX0lTUkVHKGlu
b2RlLT5pX21vZGUpKQ0KICAgICAgICAgICAgICAgIGNwX3JlYXNvbiA9IENQX05PTl9SRUdVTEFS
Ow0KLSAgICAgICBlbHNlIGlmIChmMmZzX2NvbXByZXNzZWRfZmlsZShpbm9kZSkpDQotICAgICAg
ICAgICAgICAgY3BfcmVhc29uID0gQ1BfQ09NUFJFU1NFRDsNCisgICAgICAgLy9lbHNlIGlmIChm
MmZzX2NvbXByZXNzZWRfZmlsZShpbm9kZSkpDQorICAgICAgIC8vICAgICAgY3BfcmVhc29uID0g
Q1BfQ09NUFJFU1NFRDsNCiAgICAgICAgZWxzZSBpZiAoaW5vZGUtPmlfbmxpbmsgIT0gMSkNCiAg
ICAgICAgICAgICAgICBjcF9yZWFzb24gPSBDUF9IQVJETElOSzsNCiAgICAgICAgZWxzZSBpZiAo
aXNfc2JpX2ZsYWdfc2V0KHNiaSwgU0JJX05FRURfQ1ApKQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206ILOjt+/pqg0KPiBTZW50OiBTdW5kYXksIEFwcmlsIDI0LCAyMDIy
IDExOjMyIEFNDQo+IFRvOiBqYWVnZXVrQGtlcm5lbC5vcmc7IGNoYW9Aa2VybmVsLm9yZw0KPiBD
YzogbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7ILOjt+/pqg0KPiA8Y2hh
bmdmZW5nbmFuQHZpdm8uY29tPg0KPiBTdWJqZWN0OiBbUkZDIFBBVENIXSBmMmZzOiBzdXBwb3J0
IGZvcndvcmQgcmVjb3ZlcnkgZm9yIGNvbXByZXNzZWQgZmlsZXMNCj4gDQo+IFRyeSBzdXBwb3J0
IGZvcndvcmQgcmVjb3ZlcnkgZm9yIGNvbXByZXNzZWQgZmlsZXMsIHRoaXMgaXMgYSByb3VnaCB2
ZXJzaW9uLA0KPiBuZWVkIG1vcmUgdGVzdCB0byBpbXByb3ZlIGl0Lg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogRmVuZ25hbiBDaGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPg0KPiAtLS0NCj4gIGZz
L2YyZnMvbm9kZS5jICAgICB8IDcgKysrKysrKw0KPiAgZnMvZjJmcy9yZWNvdmVyeS5jIHwgOSAr
KysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvbm9kZS5jIGIvZnMvZjJmcy9ub2RlLmMgaW5kZXgNCj4gYzI4MGY0
ODJjNzQxLi4xYzUzMzU3NTdkN2IgMTAwNjQ0DQo+IC0tLSBhL2ZzL2YyZnMvbm9kZS5jDQo+ICsr
KyBiL2ZzL2YyZnMvbm9kZS5jDQo+IEBAIC0yODAzLDYgKzI4MDMsMTMgQEAgaW50IGYyZnNfcmVj
b3Zlcl9pbm9kZV9wYWdlKHN0cnVjdCBmMmZzX3NiX2luZm8NCj4gKnNiaSwgc3RydWN0IHBhZ2Ug
KnBhZ2UpDQo+ICAJCQlkc3QtPmlfY3J0aW1lID0gc3JjLT5pX2NydGltZTsNCj4gIAkJCWRzdC0+
aV9jcnRpbWVfbnNlYyA9IHNyYy0+aV9jcnRpbWVfbnNlYzsNCj4gIAkJfQ0KPiArCQlpZiAoZjJm
c19zYl9oYXNfY29tcHJlc3Npb24oc2JpKSAmJiBzcmMtPmlfZmxhZ3MgJg0KPiBGMkZTX0NPTVBS
X0ZMDQo+ICsJCQkmJiBGMkZTX0ZJVFNfSU5fSU5PREUoc3JjLCBzcmMtPmlfZXh0cmFfaXNpemUs
DQo+IGlfbG9nX2NsdXN0ZXJfc2l6ZSkpIHsNCj4gKwkJCWRzdC0+aV9ibG9ja3MgPSBzcmMtPmlf
YmxvY2tzOw0KPiArCQkJZHN0LT5pX2NvbXByZXNzX2FsZ29yaXRobSA9IHNyYy0+aV9jb21wcmVz
c19hbGdvcml0aG07DQo+ICsJCQlkc3QtPmlfY29tcHJfYmxvY2tzID0gc3JjLT5pX2NvbXByX2Js
b2NrczsNCj4gKwkJCWRzdC0+aV9sb2dfY2x1c3Rlcl9zaXplID0gc3JjLT5pX2xvZ19jbHVzdGVy
X3NpemU7DQo+ICsJCX0NCj4gIAl9DQo+IA0KPiAgCW5ld19uaSA9IG9sZF9uaTsNCj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvcmVjb3ZlcnkuYyBiL2ZzL2YyZnMvcmVjb3ZlcnkuYyBpbmRleA0KPiAz
Y2I3ZjhhNDNiNGQuLjQxOThmZWQ0YWU2ZiAxMDA2NDQNCj4gLS0tIGEvZnMvZjJmcy9yZWNvdmVy
eS5jDQo+ICsrKyBiL2ZzL2YyZnMvcmVjb3ZlcnkuYw0KPiBAQCAtNjY5LDYgKzY2OSwxMSBAQCBz
dGF0aWMgaW50IGRvX3JlY292ZXJfZGF0YShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksDQo+IHN0
cnVjdCBpbm9kZSAqaW5vZGUsDQo+ICAJCSAqIGFuZCB0aGVuIHJlc2VydmUgb25lIG5ldyBibG9j
ayBpbiBkbm9kZSBwYWdlLg0KPiAgCQkgKi8NCj4gIAkJaWYgKGRlc3QgPT0gTkVXX0FERFIpIHsN
Cj4gKwkJCWlmIChmMmZzX2NvbXByZXNzZWRfZmlsZShpbm9kZSkpIHsNCj4gKwkJCQlyZWNvdmVy
ZWQrKzsNCj4gKwkJCQlmMmZzX3VwZGF0ZV9kYXRhX2Jsa2FkZHIoJmRuLCBkZXN0KTsNCj4gKwkJ
CQljb250aW51ZTsNCj4gKwkJCX0NCj4gIAkJCWYyZnNfdHJ1bmNhdGVfZGF0YV9ibG9ja3NfcmFu
Z2UoJmRuLCAxKTsNCj4gIAkJCWYyZnNfcmVzZXJ2ZV9uZXdfYmxvY2soJmRuKTsNCj4gIAkJCWNv
bnRpbnVlOw0KPiBAQCAtNzAyLDYgKzcwNywxMCBAQCBzdGF0aWMgaW50IGRvX3JlY292ZXJfZGF0
YShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksDQo+IHN0cnVjdCBpbm9kZSAqaW5vZGUsDQo+ICAJ
CQlmMmZzX3JlcGxhY2VfYmxvY2soc2JpLCAmZG4sIHNyYywgZGVzdCwNCj4gIAkJCQkJCW5pLnZl
cnNpb24sIGZhbHNlLCBmYWxzZSk7DQo+ICAJCQlyZWNvdmVyZWQrKzsNCj4gKwkJfSBlbHNlIGlm
IChmMmZzX2NvbXByZXNzZWRfZmlsZShpbm9kZSkgJiYNCj4gKwkJCQkoZGVzdCA9PSBDT01QUkVT
U19BRERSKSkgew0KPiArCQkJcmVjb3ZlcmVkKys7DQo+ICsJCQlmMmZzX3VwZGF0ZV9kYXRhX2Js
a2FkZHIoJmRuLCBkZXN0KTsNCj4gIAkJfQ0KPiAgCX0NCj4gDQo+IC0tDQo+IDIuMzIuMA0KDQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
