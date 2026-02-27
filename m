Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENQaJMvtoWlDxQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 20:17:31 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2F51BC943
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 20:17:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6zDo7y1WOjLhf9eYKz6+xwhLJUVJPAk/VDqeVmxLxA=; b=KeH1afJVBrPjxS7KlwTxukDCP3
	IRnaoVrBOrbNngFGd3/My+HpcKFkoDixc3SxPYXLDX1zl43WvIFDXa9ryZQCpedxvDItsiS/7/LG+
	CTXCCmb3mNnaNKJrXDHZOviYhmtFKP3BMwfCzQiUwf4Q4Jg9TYt5Y+t2XJKD4PWIg0wM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vw3Kz-0003gA-Ef;
	Fri, 27 Feb 2026 19:17:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mathieu.desnoyers@efficios.com>) id 1vw3Kx-0003fx-1G;
 Fri, 27 Feb 2026 19:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dk29SJfpJGFgRzCY4PLuyyiHP3wfz8v8GzH3ejR7jAg=; b=AycoOn3bguLGEhfY0r23sSwdNr
 CCooh1mM+KtnEgBPINr12Tsoa9K8L2fT0IN+7Ys8I9ihqBscHr7DMuuxJkwovbEyGEjnBvFeanbXI
 iGMgKzl71G26MvRAmSquuL2ZxYZySnFT0gPUli8Ec0feI38JwNKIyohKqttkSrhWuGZo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dk29SJfpJGFgRzCY4PLuyyiHP3wfz8v8GzH3ejR7jAg=; b=kqIEdyUZHDuEkclpwiuJbkTY/4
 s1SkOqqRtrr8qY5thQ4fK0/DaDnuC4kZj3MRsog0tgfmJclNDQeCfCRXu0b7/Ai3Xkk0RWNRBtMoM
 u5WuHUDZw07qR03AwItn3nSepBj3RFk6bLofQxruO5uceJDaL8YJakn4DBa68cm1qZFk=;
Received: from mail-canadacentralazon11022087.outbound.protection.outlook.com
 ([40.107.193.87] helo=YT6PR01CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vw3Kw-000702-Cf; Fri, 27 Feb 2026 19:17:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyWwHYXaVOptQRjpaDCuF4hX/enC3EN1ccyldunU2wcevIBwMn9BnOGxGD2tx6mNv2iDEfk53Wkb+mXDN6Wy1RRTfBXh05wOgeNkmYt3e+eOWyUhal8NMrjmlic+zvb9MjpNgRN6zV2ix8G3mGzzkKp9UIE3S8+g5ZOTeIUlnwdhSnjTZh0OpOo+HF45xYcoJ08qgzDL8K8x07DVajgNSAUGcGl83azMyTH2jMTbtcPaeWpW9LFyU/rFSzWixvxi0sdePJRrTFKDEPGkrJybWd9BQEUJdMXTYcQupc6NcTNKlhsb8aFscFJ4g7suzdjyHzXvi1epNRTS46558UCwpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dk29SJfpJGFgRzCY4PLuyyiHP3wfz8v8GzH3ejR7jAg=;
 b=T/5vtpzi65/kGBQeFBOb1FizZ5xT99Epgu0mbyUUbqjynBQknAe1BiYJ1tIT0APElGf/6Qz2Tlu05gkDD3WHqUBMFfW7OmX1V4rMzQKSvykSY9dlQ2Nw23aR8bDSpLJje0huzK4J4iMVlvk7P6Jdoi1SiUFCCIkOThQwG1FVGs21u9DCLttv7j5sXbuklzS+wsIGTD4ZcEVIWbnj9bJ3DfMoAvP6+E3o5uVfIJS4OTPVUDbVdMn8zu2k9zQwBIMf1rDn4/rVRVCej+upBRGxFTuruchoLY5AU2+RKBKGnseXTaqMhhD8d4WK9OHld9/TFl3BcRLeqsQaKMEgdaxIWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dk29SJfpJGFgRzCY4PLuyyiHP3wfz8v8GzH3ejR7jAg=;
 b=RE5ahWBWyrGgAr1sG7157mWsSYBEmmBEnr7QZWJmeZoxo07+7Wmsur2peObaGSX2ionx0Os9kpbDaookJJtmUDDy2fzm+/kNnTT+f/sqpNrUWdNEZXJJL9Jsymke28jJ4T9AFgOo6v0bW94a5FL3D8qALq2+Fcpk3s/nsUZ1ndql+tEcOrOGxuMwjm2bjbybwp3NiS18loGQQr1D0Ntikr/JBB20P1mLVqoNIMR5dT+ABqPDsYrLSmVDcvhuazN9ruHa078fP/fMaK368bO3o+4pGmy6eQ9x0nmNOEiqdjoJieszjoSJbQmXQRuZ8tzAAurF5kCVbC+/0AjVZ7gpbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YQ1PR01MB11446.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 19:01:37 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1%3]) with mapi id 15.20.9654.015; Fri, 27 Feb 2026
 19:01:36 +0000
Message-ID: <b808e186-3eeb-46ed-9826-b0ae6cdcdb8b@efficios.com>
Date: Fri, 27 Feb 2026 14:01:25 -0500
User-Agent: Mozilla Thunderbird
To: Jeff Layton <jlayton@kernel.org>, Matthew Wilcox <willy@infradead.org>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
 <aaB5lgKd8FOIizPg@casper.infradead.org>
 <4a462d40899698586c110add96ce3fab6ddac30b.camel@kernel.org>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <4a462d40899698586c110add96ce3fab6ddac30b.camel@kernel.org>
X-ClientProxiedBy: YT4PR01CA0096.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::13) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YQ1PR01MB11446:EE_
X-MS-Office365-Filtering-Correlation-Id: d47bfdf5-e3c5-40d3-8017-08de7632a081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: EY5Md8YGJJIuzUva9Rf1G3srlPfJ5z4HLDU6C28LTRbhf3S6k+BFTAgq/Uj3DeAKWxjHXSRUJ3gWvR9+H8pmPkJM+6uucug3fgz6+OSzVebBsXgFLIEdolRXYlAJa/tfXD0GDY6CPY00XUEby3BNWa3oEYAvKV6x1O+HT39G3mfrOeFNbIsisjN6kW1FDRI37V9NxrGtMS6ym/l5L0OuMDlQdeofrJksRx2JGYHieHYV6tstWrSpduIm4wJU55wk8eG4Y5gLGYkTeVVTXI7fxkW/Qm4+BO/o+eSAdyo5f6HXZtAUxCYqHFwWqcH83Ds7ek0iedsiYntL1PyL/q7ogdDfnHRANarXn8RwmRXSub0BC7XfsSN4xJWSa98OHzdiLHIJJucQFYYm2dM2KoPVPf+02lUhjUllo9S0nu+tKlgr1cykR3yatmYz4Tc6+N5SsWXdY+4ZKhIDmaGzvL+lJ4o8l3T7sPuHxKexmgIIDCDUr4ncdJSKp4T7v386CeuGWnbZRN9Ni9Razm7gj1TN9n7YulxgaC9Y70JJNwFaP+NxaPz9NezUrvwST3ExKfGEshqKR3Gk0WoJQncvCrdNFJrc7bTXhFCxkM043XpimNHjrcJwuHBVOhHY6vH3pbNFYF//dn6hsV3mxzb47wcvsDRk4++7MFAj7Fi7EO7E8SEnWmxVEgxU/J1UgxKQtJQr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTNML0R3RmJSb2FhSmRmUlF1aC9FelFaU2ppWFBTN3ZUOTQrRFpoLytyM05q?=
 =?utf-8?B?T242Vlg5MUpZMnZpYVVjMGFsU0Z1SVhrWStxKzJwRVFyWlpYT3VEYzk2RGN4?=
 =?utf-8?B?eUMrSDlaeHJNRUNLb1pBbzFxbitUNVUwOHIvc3UyQzFpWk5KYlBveDdSTFBU?=
 =?utf-8?B?Y21YMnc0eHl2Wi8xZXNZYnR1VDc5UG9WU0I5YnBYd295ZHBBM3BzQTk4M202?=
 =?utf-8?B?cnk2QjRCM2oyWmpmK24wMjFIWUp1TTNCeW9EbmFuL3U4bUNQbTVEZ0tVYlk4?=
 =?utf-8?B?Q0hEZUNmK3dGMEsvamdQTmdXekpnN2xyMGw0azNIcDI2ditWQml5dkJzZDhl?=
 =?utf-8?B?emQ3cW1jY3ZFS1dQNThwdTJ6bExURk1pd0FjQ1FrSzdIdjhTeG85K2JkdWhK?=
 =?utf-8?B?bFFDUXFNVVdibG1PY0hCNVZQVVZDaVBRUSszZ210TzhEdWg2b0NLOUZObGZs?=
 =?utf-8?B?aEo1d0p4NG1aaDB0YTRVSG03VFpXL05UZ0VQWWU4NUpSblNNQUw4OXdsZUhZ?=
 =?utf-8?B?Szl5elZnZDBTdWxtUnFmQW9GUkFyTnNsS0xUR3o5cGw3ekwyZU5NSFVUN2pE?=
 =?utf-8?B?aGdLaEVaclcxQUpVam1TaC9BRXRBOElzRDJvK3hhTithSTByeWVvNSs2SVk0?=
 =?utf-8?B?UVdkcTJ4Uzdrb1dtSFFZMHV6aUVBb25wRnVYMTRiNHQzQzZVVS91Y0MvcnZH?=
 =?utf-8?B?Um05L2tTZlBaUXdTVkZJUW52UmtaV3ZweGZyZ3lwTGNuZmF4d2U5cEp1aHBT?=
 =?utf-8?B?QzY0OU5nazBSN3JNdGpiMEtYU3MyYmZ6TEg3R0c5WHdCMXhGVkdyYkFGMlUz?=
 =?utf-8?B?OGVCRXNwN1R4ZTJyRjVwZ1JxR1V1clJSeVNtdFhIM295d2tUaGVLZTdIc05o?=
 =?utf-8?B?aVd1TTVPR1FnTWtuS1EwbkI5Q0RmTHgxZDJzU1NwdFVHcTY2TG1OamM5a09D?=
 =?utf-8?B?RWJtSDlPbEpXVm1wRmxTUVFRT0lFMk1FNm1acjBxajFrQjRXVVFuTUh3dHZu?=
 =?utf-8?B?d1N3NDBKOFBWYUtkbHdSbWEvTjQ4TFVtV1VjWitQa2xWelU2VmZtMkluVngx?=
 =?utf-8?B?R0tZRGoxQzJ4SjljMHE3UTBQY1JCM2ZaSWNlRHB2TEo1OHFBRWg4ajdVdFJ0?=
 =?utf-8?B?UUJudzZEMHJXM1RaWFJsTnpXdis0YU50MWhMdDFXQ2JWbmQzMC9sY3JmSnVT?=
 =?utf-8?B?MUwrRDRLcU93NEpXMFBESUE5T2ttMzB4QjhTTHF1UFVWa01IWEJaSDV2UWRH?=
 =?utf-8?B?MGtFaEloTlpZRkY1di9Jb1Z1Y2cxWHhEbnRyNGtMdURrVkFBQ2FDV01sS1lY?=
 =?utf-8?B?TEF2YUsrTXJ1eVNPVlBBYmczc3VrK3o2ZDJ0aFpqSlZMOHJMck9Hb2hsMWVE?=
 =?utf-8?B?RGxBWnNUQ1M0SlQxZWJqNVBLRTFVeXJYYmw4QlR5RzNqRGxHTFB2a21xU2Fj?=
 =?utf-8?B?RzQrakhPTXlGcVVUSGZSL0U5Nm1DUDlUVTQ0dDRIcStxaU9kbnVRcUxUb2Fp?=
 =?utf-8?B?S0dDRHI5K1BrU3FoOGRkQUJ5ZG1uNEhiandXbjlsNzVDSlQ1TVk3WVo3YnBW?=
 =?utf-8?B?UzJ0bStQV1NsQnVjSXJscURubG95M1VGYmVlRDB5V2dXVVh6Y0ZUZUVrd0hz?=
 =?utf-8?B?QUN4cGwxdTUwdjl5R3lDRUNSaHlibzdCVzlQMXp3MEQzVE5jbjJmSmNONkRm?=
 =?utf-8?B?cjJ4QmZxSHhrWUxBRThYYjIyNWpwejl2SUN5QVp2dGIxTzZ5dW1TZzBBOXhj?=
 =?utf-8?B?NW5PMGtqZ24weUs0QTJjdFNrLzJrd1VETFNlUHlGY2ZwQ0ZzZW5wVWhaVFkw?=
 =?utf-8?B?d2p1S3Y2dnNKYlF0SXNab2tOTy91OUNaYnlIZWVUVjBvME9iU1FIc3ZuYmJT?=
 =?utf-8?B?NDF2Z2EyZkpnUVd2T09OYld1cjAzQmNjTHFIaHl4MkIwL1FhMGx1b1liUm5F?=
 =?utf-8?B?VStJcFVQbVB6ais2UjlCZ2tnSVZsd3RKWjhlUU8va1RDcGF4cDA3Wjd5a25U?=
 =?utf-8?B?c3hhcUpvY0t0bXZBbVdvQm51ckRpTVcyUk14T3NBdnRUNHowVzNPNHlhdmJO?=
 =?utf-8?B?SEZYL3NTM1ZyZGlzYVUzR1BkNmtOVkhoNzNQTU1VbDd4MGZVWlFwTGtOK1pw?=
 =?utf-8?B?NWtrL3NNcVVnUGVCQldkcGl1Sm1mSTFLMTdkWFdkRkZBS3g3QTAyK0Qydit3?=
 =?utf-8?B?MVpTWWFLSHRXRDZoUXBqNC9aK1hZTm5JMk4rbEVNR0ljZ3N0cm50TmNyb1NU?=
 =?utf-8?B?N3g5SCswVUUvcnhobzdVYllrQlhqR2JvUjJBTzRTQzN6NlExSkp3cjM4RjNC?=
 =?utf-8?B?Zk9zQWY5anI1ZkVqR1M2b1F0dE9POEpLay9jakFKR3UwZlVCVlh2UHNiKzZR?=
 =?utf-8?Q?lCpXuAN1+w3tLwc4=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d47bfdf5-e3c5-40d3-8017-08de7632a081
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 19:01:35.6014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4N2/gZXBOwu3d4VpitFMRZidRWQIRoSaCdC/f2/Xt4bR8UjH6GueZon/NbacX7XPHqlUxfYPoxzUF4l4veiYQEGXWzrhYaUYiwshNafmDIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQ1PR01MB11446
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-02-27 12:19, Jeff Layton wrote: > On Thu, 2026-02-26
 at 16:49 +0000, Matthew Wilcox wrote: >> On Thu, Feb 26, 2026 at 10:55:02AM
 -0500, Jeff Layton wrote: >>> The bulk of the changes are to fo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.193.87 listed in wl.mailspike.net]
X-Headers-End: 1vw3Kw-000702-Cf
Subject: Re: [f2fs-dev] [PATCH 00/61] vfs: change inode->i_ino from unsigned
 long to u64
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>, "Darrick J. Wong" <djwong@kernel.org>,
 Anders Larsen <al@alarsen.net>, dri-devel@lists.freedesktop.org,
 linux-hams@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 Fan Wu <wufan@kernel.org>, ceph-devel@vger.kernel.org,
 James Morris <jmorris@namei.org>, Tyler Hicks <code@tyhicks.com>,
 Christoph Hellwig <hch@infradead.org>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Martin Schiller <ms@dev.tdt.de>,
 Jan Harkes <jaharkes@cs.cmu.edu>, Willem de Bruijn <willemb@google.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-fscrypt@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Hildenbrand <david@kernel.org>, Eric Van Hensbergen <ericvh@kernel.org>,
 Christian Brauner <brauner@kernel.org>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Jan Kara <jack@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 linux-media@vger.kernel.org, Trond Myklebust <trondmy@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Dave Kleikamp <shaggy@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Oleg Nesterov <oleg@redhat.com>,
 Eric Dumazet <edumazet@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-cifs@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>,
 linux-nilfs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 codalist@coda.cs.cmu.edu, linux-trace-kernel@vger.kernel.org,
 Olga Kornievskaia <okorniev@redhat.com>, Yangtao Li <frank.li@vivo.com>,
 selinux@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Casey Schaufler <casey@schaufler-ca.com>, netfs@lists.linux.dev,
 Jaegeuk Kim <jaegeuk@kernel.org>, fsverity@lists.linux.dev,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Nicolas Pitre <nico@fluxnic.net>,
 Muchun Song <muchun.song@linux.dev>, Roberto Sassu <roberto.sassu@huawei.com>,
 "David S. Miller" <davem@davemloft.net>, Anna Schumaker <anna@kernel.org>,
 linux-integrity@vger.kernel.org, Alex Markuze <amarkuze@redhat.com>,
 Martin Brandenburg <martin@omnibond.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 ocfs2-devel@lists.linux.dev, jfs-discussion@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, Marc Dionne <marc.dionne@auristor.com>,
 linux-afs@lists.infradead.org, Ian Kent <raven@themaw.net>,
 Naohiro Aota <naohiro.aota@wdc.com>, Eric Biggers <ebiggers@kernel.org>,
 Miklos Szeredi <miklos@szeredi.hu>, amd-gfx@lists.freedesktop.org,
 coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>,
 NeilBrown <neil@brown.name>, Ilya Dryomov <idryomov@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Amir Goldstein <amir73il@gmail.com>, James Clark <james.clark@linaro.org>,
 autofs@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Damien Le Moal <dlemoal@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Oscar Salvador <osalvador@suse.de>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 samba-technical@lists.samba.org, Ondrej Mosnacek <omosnace@redhat.com>,
 Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Ian Rogers <irogers@google.com>, Alexander Aring <alex.aring@gmail.com>,
 Jan Kara <jack@suse.cz>, Peter Zijlstra <peterz@infradead.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, ecryptfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 linux-f2fs-devel@lists.sourceforge.net, David Airlie <airlied@gmail.com>,
 Eric Snowberg <eric.snowberg@oracle.com>, linux-x25@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Salah Triki <salah.triki@gmail.com>,
 Simon Horman <horms@kernel.org>, apparmor@lists.ubuntu.com,
 Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Namhyung Kim <namhyung@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 John Johansen <john.johansen@canonical.com>,
 Luis de Bethencourt <luisbg@kernel.org>, netdev@vger.kernel.org,
 v9fs@lists.linux.dev, Adrian Hunter <adrian.hunter@intel.com>,
 linux-security-module@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Joel Becker <jlbec@evilplan.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[efficios.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,efficios.com:s=selector1];
	FREEMAIL_CC(0.00)[ionkov.net,lists.linux.dev,manguebit.org,kernel.org,alarsen.net,lists.freedesktop.org,vger.kernel.org,linaro.org,omnibond.com,namei.org,tyhicks.com,infradead.org,lists.orangefs.org,microsoft.com,dev.tdt.de,cs.cmu.edu,google.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,oracle.com,suse.com,amd.com,arm.com,linux.ibm.com,redhat.com,ffwll.ch,paul-moore.com,coda.cs.cmu.edu,vivo.com,lists.linaro.org,schaufler-ca.com,mit.edu,fluxnic.net,linux.dev,huawei.com,davemloft.net,linux.intel.com,lists.sourceforge.net,lists.infradead.org,auristor.com,themaw.net,wdc.com,szeredi.hu,dubeyko.com,brown.name,hallyn.com,goodmis.org,intel.com,suse.de,paragon-software.com,kvack.org,lists.samba.org,samba.org,suse.cz,codewreck.org,crudebyte.com,linux.alibaba.com,dilger.ca,artax.karlin.mff.cuni.cz,nod.at,fasheh.com,lists.ubuntu.com,talpey.com,canonical.com,evilplan.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mathieu.desnoyers@efficios.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,efficios.com:-];
	RCPT_COUNT_GT_50(0.00)[143];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[efficios.com:url,efficios.com:mid]
X-Rspamd-Queue-Id: 8F2F51BC943
X-Rspamd-Action: no action

On 2026-02-27 12:19, Jeff Layton wrote:
> On Thu, 2026-02-26 at 16:49 +0000, Matthew Wilcox wrote:
>> On Thu, Feb 26, 2026 at 10:55:02AM -0500, Jeff Layton wrote:
>>> The bulk of the changes are to format strings and tracepoints, since the
>>> kernel itself doesn't care that much about the i_ino field. The first
>>> patch changes some vfs function arguments, so check that one out
>>> carefully.
>>
>> Why are the format strings all done as separate patches?  Don't we get
>> bisection hazards by splitting it apart this way?
> 
> Circling back to this...
> 
> I have a v2 series (~107 patches) that I'm testing now that does this
> more bisectably with the typedef and macro scaffolding that Mathieu
> suggested. I'll probably send it early next week.
> 
> I had done it this way originally since I figured it was best to break
> this up by subsystem. Should I continue with this series as a set of
> patches broken up this way, or is it preferable to combine the pile of
> format changes into fewer patches?

Here is the approach I would recommend to maximize signal over noise
for the follow up email thread discussions:

Now that your series is bisectable, you could post a [RFC PATCH v2]
series with the following:

- Patch 00 introduces the series, points to your git branch implementing
   the whole series,
- The first few patches introduce the new type (kino_t) and macro to
   do the format string transition. Initially kino_t would typedef to
   unsigned long (no changes).
- Followed by patches implementing the type + format string changes for
   a few key subsystems.
- The final patch would change kino_t and the format string macro to
   64-bit integers.

Once everyone agree on those core changes, you could proceed to post
patches that change additional subsystems in a subsequent round.

One more comment: have you tried using Coccinelle to do this kind of
semantic code change ?

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
