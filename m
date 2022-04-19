Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C7E506276
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 05:04:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngeAc-00023O-SO; Tue, 19 Apr 2022 03:04:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1ngeAb-00023I-If
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 03:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZhppFNiunxnkOrb+SrsnoOg6pZjAeVWxcG4K1TKAu/o=; b=YaL9PlfpNFA4nt97zZaQ4VJRJl
 qworMUk+BmVz6E3NYpmnSt7kAK/nIi8zIWQ2RLLMk7Mb8RVU/a/4TSST/EiRBc4LvB5XWeeGBvZI+
 2VHQz25dELvkf6svoAjI219ZzqzdqJGKp64HknvX3+jdFRouUvs9nTHvhGGGCBPfrHLM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZhppFNiunxnkOrb+SrsnoOg6pZjAeVWxcG4K1TKAu/o=; b=aJwvBTYKWE96YTQEyQLdj9PoX7
 nwNr5Mmggigd3qjqzQX/YEZRjutpF5V9vxMVNzbRlNQhXNfGdfilCcKusKF+CcAzx4kyhQW4dCNi3
 eMxJ7FOmwY8sgtnfmEDOI21WKGRmocldPH1WkZWgyji7qAzUF2tagdXb9N4MRFbb5sYA=;
Received: from mail-sgaapc01on2112.outbound.protection.outlook.com
 ([40.107.215.112] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngeAV-0004Oo-Tv
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 03:04:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWtL1xymvX7UlFlXrnzWN9UVSXUmX4pO0najlNVDMwxv3w4uCilFGJxrOge3SiBl6YuHk46lyyIcsJaqAVDqT8FmFWdztNRrA9cSuORHDTuY1SrzbKE+7E+eDyGeui6mNVXgk+3HW14ZlB/lfOZdyssKU7TtnlP/lwIA0trKBa58z+bG0yEgIpcEKuhW60cjB/wTkZ30wYAhfFNwgT3PvYgzAnAcSdZ7aXwqN0CdTJJ2trF30cs1U5wZyfQKiYL+RsqREseIiQjkpUIStvc+axE0rpvrdw73QWXPtWZFKLjm29JGu1LMfxZ+8JaXesRPhBZzGzshKxnE1jgawtD3Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhppFNiunxnkOrb+SrsnoOg6pZjAeVWxcG4K1TKAu/o=;
 b=L9pOtEV30l7TG1cDVai8JdIUxm34QZ+BFbPAL+SpEeGCli/erqjx+jNWLLTkwWrz1H+pzAk35WyDHThWoQfyvs/LtpJ36JvdLR4JEnUei5Y38Zceb9tI+LUT4om1UpnPmAz9o+Nk0UXyzUYZ2fQKNWrwE4qSfF+7negdrafYn0iZPGpZv6ubaDIYPgLX9pVfAcffcxi4K5E6zeqDvqZDqGP3WrHRAFV7RBI8DdOpE58bUr9Vb8XL+a7fVpPUH5RntHJTcXbBp1YUzHCuiXJpi47/BKtLphb6fxL/Ojo9b4IKfIlKoqLuT7kSI1FbR/tOEN5MX6y/kPikWrxuV2ceug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhppFNiunxnkOrb+SrsnoOg6pZjAeVWxcG4K1TKAu/o=;
 b=CjZsdIRxst/yfOaCWsmSYIOh8Vzd+Mxc8KQgKu4kD8pWr2a7IbKcsSJzOvTuB4GvfzFRnzg3NdeFMgU2R+iqoXkmaH8+/jeJKnAjAjYNvbASotbjEi5UAD6ZbQ8MGsK4X8KCOcir6JzvygIAufcqGTGFuaXyrKlvHx3O3VksbFI=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by HK2PR06MB3507.apcprd06.prod.outlook.com (2603:1096:202:3e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 02:48:43 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f0c7:9081:8b5a:7e7e]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f0c7:9081:8b5a:7e7e%8]) with mapi id 15.20.5164.026; Tue, 19 Apr 2022
 02:48:42 +0000
To: Eric Biggers <ebiggers@kernel.org>
Thread-Topic: f2fs compressed file bio merge problem
Thread-Index: AdhS+AtDj5k4fJ3JTzKRhS7cHVTSKwAUe7EAABMcBSA=
Date: Tue, 19 Apr 2022 02:48:42 +0000
Message-ID: <KL1PR0601MB40039A40AA4600669A04E707BBF29@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <KL1PR0601MB4003AA93745F5F9A79794BE4BBF39@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <Yl2gLG/8U9HdRpUT@gmail.com>
In-Reply-To: <Yl2gLG/8U9HdRpUT@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f87dcbfd-df1b-4906-0ebe-08da21af1dd2
x-ms-traffictypediagnostic: HK2PR06MB3507:EE_
x-microsoft-antispam-prvs: <HK2PR06MB350793CA928CC2DAE1DA115ABBF29@HK2PR06MB3507.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pRMx739b0zxquYc/EVJVM/yl2MpeiwuX77gTp4rb75kPNCHpCuqewrj0n9EWwKxG2YIGF1hcx939OITXWjyLxgnrGP0GsuP6dbNwboakRGUAJto0Ty6G1LjAimunMSttg7A8QXD8Ybl9aey5iXOEqozeNgG/1tsTbY9DWH3zLeOSwwZMlcEucH7U6JmynKjHrsnzqSoCsqOAx5HSKYnSn/NhUb6YsSwlEe5iKMwnRy10M7a3TuJWDOg77MbjlWLjfhz6EDOOaSnI3uxEfdoCf8N6pcRbkjDdkI3Owl3v12IcSRz4CwilGp/aaYYm6+qG0lurmqh7Dhpixl1tdKmfTQTBWELjZj6ilkWY7wNxloY/WtvrETkbMpaxVfLdAPg7d/dMohlFKKuJjkAyuVrwnwoQ4avUFdgBLtJjF3oR6no+GjizTZDs99AlD5lldXkosH1ZducHrwykA7q8nlOSswUgDL6LDkpiltB3ZXNRAmSWjgeuiVtrbe04QScMxGo8gCGvikCwAnClfVTLlmzL7NU4tCO82gaeKYtH43pRXYG6u5LIMaar5kcKK2r6YnBhz1SK+p0NWtHJA49NOyU+xAOj9PzjhOV1+Cvx6WIob0WbeNHWQm0KYznP+f9525+9Ej2kLDIgLisYl2n3nyXi1IS+6362Kz01moUo5xPPhw5OopR3aMeaN3l67ua5OmhfpfwUdqoKKG2vFIearrt2fXRwWKepEVC27y/Afz70OB/1xCDw/vtMHuH3I7OLHIVRM+iPKiEWq1Ew7BzGErmRchbZgwgpVBCTbmWGyqiYAEnNJrofVP4BkgHDZUVSvktaGF++zKyedMoid0wqN4vIbg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52536014)(186003)(33656002)(9686003)(54906003)(53546011)(7696005)(6506007)(4326008)(64756008)(83380400001)(71200400001)(66946007)(76116006)(8676002)(86362001)(45080400002)(508600001)(26005)(6916009)(316002)(85182001)(38070700005)(66556008)(66476007)(66446008)(5660300002)(55016003)(8936002)(2906002)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UytXSUp4NWNweGtCTDdkSW5mQXFvWmxNaEUxMTdCellsRHZ3NnR2ZStRc3Y0?=
 =?utf-8?B?ZEhVbWcrZ2tIN3grNnJVLzFMYnRhcnc4L2Vvd0hGWTVrZDBKRVpoRHFEYWgx?=
 =?utf-8?B?K0pKaGRrdGFxdFVPdmhMTEdUVzlhbmRMRVZuVUowUStmalhvb0RlRHYzbHB0?=
 =?utf-8?B?bFRUT0wrb1g2dk5TdklZTVVqSkI0ZXJSNnQvbUl0Z012eURBNGlOcm1sY2ww?=
 =?utf-8?B?TFk4eVNWZzNCaUpuTkVSSVZNa0tNVXpaR090YnRKRzJEeTVEbnBPbE9jNElw?=
 =?utf-8?B?MVQ3aG5aWnZPZnlIWDZlSUxSTW9zTWdvOWZCT0piU25CQWxBSHc3UTJVd3ZZ?=
 =?utf-8?B?Q1ZvaTFVaTJVMzZBNENJbWYrT1J5Unk1VzA2K2Q3UGJ4Lyt5cXZzRCtRajZm?=
 =?utf-8?B?dGo4NVZia1RkWlpmTGtJYW1yc3NHTVhkelJWd3lCUEdLSWlUOXFlQmxkbnhY?=
 =?utf-8?B?WmtnM1hNOXlaUDVkdzBIb2Z3M0FOQTEvMkhISkl1dlpTU25LempraGVJU0s4?=
 =?utf-8?B?b2dDTEpTb3cwMUNIbU1IcnZkOG5vM3JEdHJwczVmUGdjZ051Q3k5Qm9GTVRW?=
 =?utf-8?B?TXBNZ1ZuRVk1eCtCc0NQM1lGZUplQUxsU1dGemZFMTVEUTVrOHVGR05nTS9C?=
 =?utf-8?B?TVR5dlpkSXE0NWJjT01kald5dVQvMW5LMW1wOWQrTmpCNndNNS9ZNGhJZHFT?=
 =?utf-8?B?cVRvZExGajFuOXF6aXZsZldwWC9VbUF1Q2dna2x3N2JqSnFaRUtrbXJtSkVm?=
 =?utf-8?B?SHd0dDZ3VGNhZXE0NGNEQ01yOUppZGxvQ05zWDIzb3pJK1lRMEttSVp6b3BH?=
 =?utf-8?B?cnRsd2xLUm4zRVFnMUdJQjlPeWIvVXA5L0ZGODRrMnptOWdDRGJwbzhsa2FL?=
 =?utf-8?B?Z3BPMm42cmVXNFJGZHJSQUZUeDEwdkxDaWozcXYrUXlnOU9XVkVmdVBXTFhv?=
 =?utf-8?B?L0h2Z2xkOVhsR3hFOWUvYzZWQStHYnZ2WjNRSU5vM0U1VjJUeitMUjluL1Jz?=
 =?utf-8?B?YXYvSU80c3UxcGorNkhwVHBZc0FLZGx1dmNjRTJ3UVBEZ3EzOG1Oc2hZemw0?=
 =?utf-8?B?TEh6eDdZU2RQSDlyRWVTQ25Sd0JIS1ZDRE1iNEM0cmIrNXBuOEIxS3lOeGFM?=
 =?utf-8?B?N1JwN0ZFaTlKMFRRZ013bXc5SWpzbml3VVQwbG5jaGFkNmU1a2JIcStBNUdS?=
 =?utf-8?B?Z0dnM3JrcmVvQ2tlSENVaGJBUkxwKzN4VGRJMWRJOG0yZ2xWNm5QUDlOKzRn?=
 =?utf-8?B?NllnaGNJdXh2bkorVkpVcnVSV3o4ZHRFaGQwK1p0SFlLdDVCMHFMUUkvSlp4?=
 =?utf-8?B?S25ldGJWeGFFVHAzdFZjQTVybUZremFSMTNLQ2hoelFvM0l4REl6eEhtdmxX?=
 =?utf-8?B?U1VQbk9sUG14ZHkrRGY3eXozaFJhVjBnWmhFNStjRVAzR3Bqem15YVllcDdr?=
 =?utf-8?B?OXJwV3EwRC9zR0FhVDN5dFd0UXM4SVowNHdqc01jRWd3aUVUaGlVdWc4V1pr?=
 =?utf-8?B?Zk44Wm5NaGlzWk1nUTBZSEM2RW84R0p3em1icmM5WFZUd0ZacmMwZkw1RnpD?=
 =?utf-8?B?eVJxS3psZit3NlpKRGxPVE4xalhBZ0xWNktGbThxRDlqam5aNXJjYUV3SUtB?=
 =?utf-8?B?RnlHMHZtQi9tbGdsWTMzakt5VlVsRzQ5UDJqZmhEaU16VFMrUGZ5WkVjeXJj?=
 =?utf-8?B?UlBNRjNIOHdWWnhlYlNNQWdSblBBZWJoWXZ0bTBNSVNaNEs1ZDdGbjh1U0M5?=
 =?utf-8?B?WUFvUCtsNXM3QzEwbEN5cG55M0Fmek52S1poSDZMQ2duNm5SVGl1azF5NWVx?=
 =?utf-8?B?VndkSWt0Y0RDU3BrSThPd01nbEV4aitqak84RWE2bFdCVWNEZDVCdG5VeTdq?=
 =?utf-8?B?Z2w5dmkvTGtmS29ITmZzUjNVR21UZzZjSjdEWG5VY0tSbzUvQzNnTTBycXF5?=
 =?utf-8?B?RWFvcVV4QzMwZEUra0VrVy9CcEhPUU4vRnhxc2Q0ZnFhbk4xbGdiUDQ1QVlP?=
 =?utf-8?B?MktEMUlXcXg0b0FtQ29GbVJxY2Y1akh5b2Y1S09hUmdOZXZIazNpdG5JdnpY?=
 =?utf-8?B?ZjJDaW1JM2g0eTU5WFZmeGR1QnZiQW4zQlMwekxoODVzMjA0UEV2dVNCSFVx?=
 =?utf-8?B?Y2ZOcEx1NHpuWkRWTTF4Q1hTOTBzUXJCMWNWV0w5WTgxNjJWcUtzWnhDcmJ1?=
 =?utf-8?B?aVV2dktHckN5RDVoQTBKSjJrcWd0c2JDeWR6VFB6b3NuZW9TSXNXaWVWakN4?=
 =?utf-8?B?RlQ4VXpTaHkvdjdYcWxIeWVEenR3Y0M0NkhkZ0MxZlhxOFRJQzhBcDUrd3Ns?=
 =?utf-8?B?eFNXTFJSQ0Z3M1Q1Z3hWOXM5UDNKcnJOc3h1eEdWbnhPc1B4MllTZz09?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f87dcbfd-df1b-4906-0ebe-08da21af1dd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 02:48:42.7302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BmCuGxOj7EHfi2z7J4iLEo7pvyDpWm7PVBfrKXgNw9IsyWAbkZclwS/iszG/7e7uvz0n6BkHluAbtQxZwMs0RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3507
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.112 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.112 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1ngeAV-0004Oo-Tv
Subject: Re: [f2fs-dev] f2fs compressed file bio merge problem
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
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-fscrypt@vger.kernel.org" <linux-fscrypt@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRXJpYyBCaWdnZXJzIDxl
YmlnZ2Vyc0BrZXJuZWwub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAxOSwgMjAyMiAxOjMw
IEFNDQo+IFRvOiDluLjlh6TmpaAgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4NCj4gQ2M6IGphZWdl
dWtAa2VybmVsLm9yZzsgY2hhb0BrZXJuZWwub3JnOyBheGJvZUBrZXJuZWwuZGs7DQo+IGxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0OyBsaW51eC1mc2NyeXB0QHZnZXIua2Vy
bmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogZjJmcyBjb21wcmVzc2VkIGZpbGUgYmlvIG1lcmdlIHBy
b2JsZW0NCj4gDQo+IFsrQ2MgbGludXgtZnNjcnlwdF0NCj4gDQo+IE9uIE1vbiwgQXByIDE4LCAy
MDIyIGF0IDA4OjE1OjQ3QU0gKzAwMDAsIOW4uOWHpOaloCB3cm90ZToNCj4gPiBIaToNCj4gPiAJ
V2hlbiBJIHRlc3Qgc2VxLXdyaXRlIG9uIGYyZnMgY29tcHJlc3NlZCBmaWxlLCBJIGZvdW5kIGl0
IG1heSBoYXZlDQo+IHNpZ25pZmljYW50IHBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uIHdoZW4gbW91
bnQgd2l0aCBpbmxpbmVjcnlwdC4gSGVyZSBpcyBteQ0KPiBhbmFseXNpczoNCj4gPiAJZjJmcyB3
cml0ZSBjb21wcmVzc2VkIGZpbGUgaW4gdW5pdCBvZiBjbHVzdGVyLCBhZnRlciBjb21wcmVzc2Vk
LCBvbmUgY2x1c3Rlcg0KPiB1cCB0byBoYXZlIHRocmVlIHZhbGlkIHBhZ2VzIHRvIHdyaXRlLiBT
byBiZXR3ZWVuIG11bHRpIGNsdXN0ZXJzLCB0aGUgcGFnZQ0KPiBpbmRleCBjb3VsZG4ndCBiZSBj
b250aWd1b3VzLiBGb3IgZXhhbXBsZSwgSXQgbWF5IGxpa2UgdGhpczogQ2x1c3RlciAwIHdyaXRl
DQo+IHBhZ2UgMCBhbmQgMSwgQ2x1c3RlciAxIHdyaXRlIHBhZ2UgNCBhbmQgNS4NCj4gPiAJSW4g
ZjJmc19jcnlwdF9tZXJnZWFibGVfYmlvLCBmc2NyeXB0X21lcmdlYWJsZV9iaW8gd2lsbCBjaGVj
ayB3ZWF0aGVyDQo+IGZpbGUgbG9naWNhbCBibG9jayBudW1iZXIgaXMgY29udGlndW91cywgcmVz
dWx0IGluIG11bHRpIGNsdXN0ZXJzIGNhbm5vdCBiZQ0KPiBtZXJnZSBpbnRvIG9uZSBiaW8uDQo+
ID4gCUluIG15IHRlc3QsIGlubGluZWNyeXB0IG1vdW50IG9wdGlvbiBtYXkgY2F1c2Ugc2VxLXdy
aXRlIHBlcmZvcm1hbmNlIHRvDQo+IGRyb3AgYnkgaGFsZi4NCj4gPiAJVGhlIGF0dGFjaG1lbnQg
aXMgbXkgZmlvIHRlc3QgY29uZmlndXJlIGZpbGUuDQo+ID4gCVRoaXMgaXMgYSB0cmlja3kgcHJv
YmxlbSBmb3IgbWUuIElzIHRoZXJlIGFueSBzb2x1dGlvbiBmb3IgdGhpcyBwcm9ibGVtPw0KPiAN
Cj4gVGhhbmtzIGZvciBjbGFyaWZ5aW5nIHRoYXQgeW91IGFyZSB1c2luZyBmMmZzIGNvbXByZXNz
aW9uOyBpbiB5b3VyIHByZXZpb3VzDQo+IG1lc3NhZ2UgeW91IGRpZG4ndCBtZW50aW9uIHRoaXMN
Cj4gKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9LTDFQUjA2MDFNQjQwMDM5OThCODQxNTEz
QkNBQTM4NkFERUJCRUUNCj4gOUBLTDFQUjA2MDFNQjQwMDMuYXBjcHJkMDYucHJvZC5vdXRsb29r
LmNvbS9ULyN1KS4NCj4gDQo+IFVuZm9ydHVuYXRlbHksIEkgZG9uJ3QgYmVsaWV2ZSB0aGVyZSBp
cyBhbnkgcHJhY3RpY2FsIHdheSB0aGF0IHdlIGNvdWxkIGRvIHRoZQ0KPiBlbmNyeXB0aW9uIGRp
ZmZlcmVudGx5IHRoYXQgd291bGQgcmVzdWx0IGluIHRoaXMgbm8gbG9uZ2VyIGJlaW5nIGEgcHJv
YmxlbS4NCg0KRm9yIG5vdyBJIGFncmVlIHdpdGggeW91LiBNYXliZSBzb21lb25lIGVsc2UgaGF2
ZSBiZXR0ZXIgaWRlYT8NCg0KPiANCj4gVGhpcyBpcyBiZWNhdXNlIGZvciBhZGphY2VudCBjbHVz
dGVycyB0byBoYXZlIGNvbnRpZ3VvdXMgRFVOcywgdGhlIERVTnMNCj4gd291bGQgaGF2ZSB0byBp
bmNyZW1lbnQgYWNjb3JkaW5nIHRvIHRoZSBjb21wcmVzc2VkIHNpemUsIG5vdCB0aGUNCj4gdW5j
b21wcmVzc2VkIHNpemUuDQo+IEhvd2V2ZXIsIGluIHRoaXMgY2FzZSBpdCB3b3VsZG4ndCBiZSBw
b3NzaWJsZSB0byBzdXBwb3J0IHJhbmRvbS1hY2Nlc3Mgd3JpdGVzLA0KPiBzaW5jZSBhbnkgd3Jp
dGUgd291bGQgcmVxdWlyZSByZS13cml0aW5nIHRoZSBlbnRpcmUgZmlsZS4NCj4gDQo+IFRoaXMg
Y291bGQgYmUgcHJvdmlkZWQgYXMgYW4gb3B0aW9uIGZvciByZWFkLW9ubHkgZmlsZXN5c3RlbXMs
IEkgc3VwcG9zZS4gIEJ1dA0KPiBJIGRvdWJ0IHRoYXQgdGhhdCBpcyB5b3VyIHVzZSBjYXNlLg0K
WWVzLCBtYXliZSB3ZSBjYW4gZml4IHRoaXMgZm9yIHJlYWQtb25seSBmaWxlc3lzdGVtcyBmaXJz
dC4gVGhpcyBwcm9ibGVtIGV4aXN0IGluIHNlcS1yZWFkIHRvby4NCg0KPiANCj4gLSBFcmljDQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
