Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6951FB59006
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Sep 2025 10:08:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBTph8hgg4oI1JcZmezkSjNZ7QhIuwuQzDsMNCOb0qw=; b=QiqJb5ukbbbBxB8ysYgBZbkoDr
	9XVYisJOcantUH66SGJAjKgy2dBeys9FXgdcT3u2Aq4yeY7Dk3kce5tTogjmZn8w3AAqDdeplMwV2
	M12x9ahEQkPmyCB3DwJW/ItYhRYr539t1KTY+B2osmjH/7r9KA0cmiyq1PLc9OdmMay8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uyQjH-0004Zi-Hm;
	Tue, 16 Sep 2025 08:07:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hanqi@vivo.com>) id 1uyQjE-0004ZY-R5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 08:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JBXR2ybveZRe35z3WN+M3fR/brWt8KPlUHAEPm6FA9Y=; b=ZoTtoBbgOI6SqgiB3j7n7OSmze
 riBwotP84oMHoSIap2EAUFQkjc4V/Q8BtpULvfgpN+aU0rtm9qXwcU5TYqvzy6KdIi1RxuiG1+azP
 U06o9aEihSi56o0nv3oaRtJkbiOZ/n72obcW0Trgr4bpRUqCPgZl8nRJdTZWjjDbBMqo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:
 Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JBXR2ybveZRe35z3WN+M3fR/brWt8KPlUHAEPm6FA9Y=; b=TYETVmoEYXytjcqyaFI7vN/Ie6
 uuUpWqfr+mEn4OWZRH9QQTudfDf51VGbWjiFBmrQfE3XEadT07doXLkg3emzMSFSAKC5TSF5m4Uwn
 k/eem0T4Qqme3O0UzGYvTMGuCXo/E3KTZn9XYO8bySWp2OilmwL1XQDGMcBRKb1zUmAE=;
Received: from mail-koreacentralazon11013017.outbound.protection.outlook.com
 ([40.107.44.17] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uyQjC-00048x-BY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 08:07:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozUq0tigP5v5AiGK8CATykKNM5sLkMyPh8oV+e+Q+dJJcZN9asJEpWD5t8TvqvtVyJhTnvjFUwNGWU7XGPy938AvPrEV7qu6ewNtCGuuK8HmCQ21eucR5fsAQM231GWN4v/DEvsNpUjBvD9zkmSF9W5DvGGzwTUy2B3NNi9a98wIKOlL84k2HU23I3Zp3oghoe4SFn5T3hGD0rutbjDc5kbCzjuzI2EeefOdVJ08QRox5ClRBM7DFRPoOTEMmcHmJi1tNHPR03bYrt3xOdPCTfl9mg/kq1ZwxT99PI1Hy4lJxZPJ+DDxmavRI1bSKBdjZXr3gkNV/yBAN+/JNXITqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBXR2ybveZRe35z3WN+M3fR/brWt8KPlUHAEPm6FA9Y=;
 b=ZTYIKjEqHD78gByU2ruHt4UHno1gBw8PM2bWufAJ5j88sL2KU/ojltuMFifn5NRdBTYGLOcKbKgL3LGpdvtxwW1MxYHXtFTciquyfXQIGDr/CkMZqWIj9Vi/bEJ0Ak0548fZJk/x5qJiKUEPHidWeuR226S5XuzMYA5+VrSoHSUi6YMUL9uHkgOg4AEx3VcX1xk8f4c36yJc0nuA/QFl9d4M/nRmoa3U6kPSlq2UAx6mHmtQ47NezeK7AA0LlSDZ0U0G9JySvpSYj0VrlTA9/1QcrwQbhNfo6L8mqyuZ0QBrVy2UAHRvdLDc0+L4FPBpyM7oBwvEm/O68T/2othc8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBXR2ybveZRe35z3WN+M3fR/brWt8KPlUHAEPm6FA9Y=;
 b=ehiGDvXkLwa9uo2R6xbpjPY1h5dB1BQJWKfT8rE4i9PrfQLCsXFe3t1m/fp5pzy7UrAb7PVGTOfqAvNKMVjkwczHNsYcSSpBHtCg98Yy8dbbkw5/TSblD9AXF9iV6w/ktWTvX2izao7GzewUR7yszNxLgf+QPQnFMtt4kM+9APwm5isheshNrXHn0SjSIriG+TpkReg5PPTiV2lNHCRltL051csuTTTt2youNGYW2tzo1b29qgn0Pq9dSqSAy8H8ek2wzS31tCSTDPsFM5Z9vhVIX+ggPsh/uoO1Pi+Nm70HX/hyCDLD2EOquuP9zUcJJferuaGSR6XJT4CCUjRfcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
 by PUZPR06MB5475.apcprd06.prod.outlook.com (2603:1096:301:101::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Tue, 16 Sep
 2025 08:07:44 +0000
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0]) by SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0%6]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 08:07:43 +0000
Message-ID: <6157a05f-f385-448c-9ba9-69e2614d028a@vivo.com>
Date: Tue, 16 Sep 2025 16:07:39 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 axboe@kernel.dk
References: <20250828121131.3694154-1-hanqi@vivo.com>
 <aMNg-dNDsWo2BemN@google.com>
 <5bc1e227-eff8-47a5-8e64-f53135341a7c@kernel.org>
In-Reply-To: <5bc1e227-eff8-47a5-8e64-f53135341a7c@kernel.org>
X-ClientProxiedBy: SG2PR03CA0094.apcprd03.prod.outlook.com
 (2603:1096:4:7c::22) To SEZPR06MB7140.apcprd06.prod.outlook.com
 (2603:1096:101:228::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB7140:EE_|PUZPR06MB5475:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b8018f-ff00-48cc-9980-08ddf4f81cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjZMNnRYSlhjdnlWNVZQRGJoaE1UUGYrY3RsejNYbGZZWWxhOFFoSldzcG16?=
 =?utf-8?B?N3hmc1phb1VJWmRacS9xUHFyeTJDQ1A0K2UzTENXMGhBdFBOU05RZHVNcllx?=
 =?utf-8?B?SThUbmxqb2RmTFZJYloxRXNGY1lCSUJ6NUlHcVpjS05MTDlxTHd1eXlGU2l6?=
 =?utf-8?B?emkyY2RUUGdIR0RIclRIRGdVVzhKcGpSbEM4TWV1ZHZOYUhZVGJFV1VPMnc4?=
 =?utf-8?B?UjE0OXVGNnh5T09FOGRSMjNUcm96S05TZGk5OGtNeURCRmNXRkpEYy9FN3d4?=
 =?utf-8?B?eEdneW1jNC84TzZmZzhDblpXSjgyb0dGMHkxM2I1NDVJZFpXckZtV0JBLzlT?=
 =?utf-8?B?eTdDOE5sS2NSVmtoUFV0UFg1VnF0NDVFSWhIMGtkZzFHZFZ5dDFQOHFmZmQw?=
 =?utf-8?B?MHpzczJ1R0Rybi9ZbEd3RWx3UHdNalhzQWJOWjQ0OGxrZG1CbDY1ZEgyc0xp?=
 =?utf-8?B?RGZJSnRGTlVEZm5TTThoWGw4ZXFUdjVEQVJaZC8xelNxL2l0R21BZngzSEZF?=
 =?utf-8?B?aXl6SVl1dlJ5V0xuNHYzYkl5WGFCL3BLWWVOUnVhaGdqdnZQbU5tUExpLzdq?=
 =?utf-8?B?SFFqQ0tJTlU1czFoRlFSN2xsclFqRHRKMVhPY2ZFemJtQStYZkg4Y0ludVVh?=
 =?utf-8?B?RFdZelcwcVZ2Q1h2YjJtTFQyQVFFVHpBTEdkNFJKQkpvcjdLZ2xPNmg1MjFU?=
 =?utf-8?B?ZnVlRE9NSWFDdjN0UHpqN3F4azkxZVJqVnJOWXpmSW9LMllGenJwb1FUYmRw?=
 =?utf-8?B?c3BjajNoQzE1M3VCMGljNmJCQlJtT0lDK3d3NHVUU3k0TFJ0NWhvcE5zYTgv?=
 =?utf-8?B?M0hXaUZ5dzlVRStJSFQ1RnZLVytwQTJsOXZ4T0dCUk1hTGd4ZDQ5bmEvaFRs?=
 =?utf-8?B?UUp5NVNBbXZtNlUwZm1UMUEzRmpuaTBNVVRwcFNRR2RMY004Y2VFTVU5dkhn?=
 =?utf-8?B?VC96NFkycnBKUnFRckd1QzlFQzFyNHFib3lQb1BMTCtyQldNMG5DejVBYys0?=
 =?utf-8?B?ZjFUb3NaS1dPR2JQWkQvOTNwVUQzMTE2MG1Nc1Y1R3NHTDNjL3V1cWo4ck91?=
 =?utf-8?B?Rno1Y2kxR0s1cGJYc1pXRERUWEdsZWFxZDhCQldUNEs4dVI1NnJYVTYyNDZy?=
 =?utf-8?B?YXhJS0loeURvbit6cWE1TExLU2k1ZDRhMklHVUNUMTNvR1FWOUhLQkpLTkNP?=
 =?utf-8?B?em9ISERrYTBWVTdzK09iVUJJSmlQelBsZnhLTVNXRHNubk9ra21NMjJSS05T?=
 =?utf-8?B?SHVVV1hzRnF3cnVzWGRoUFpyTG9Fc1NuR3NyVVk5K250bmM4bXhUeXR3OXBw?=
 =?utf-8?B?SzM5VHJ3YktyZzRzYlVJd2tIaTdrR0xOT1pMd3prRXo1SkhBSGYyVEpxTDRu?=
 =?utf-8?B?M0RDcU5tWEVXQVROSHJ6NmVHb3R2azZlS3krcUlLODc0RHdaM1FjSlBPU3BI?=
 =?utf-8?B?Snl6ZG9EU3JjN3hpV0hnNi9rWTc5bDdzTTRGSHlXL2Y3RGNreitUcG83bmFx?=
 =?utf-8?B?QVBZMjJuYnhQK1l3dkU1bnRGZjNrYlRKR09LaEpTS0N3cDhjSEYrSElkZ2l1?=
 =?utf-8?B?Q0E1aTY5UmNBS3pWckJYcnZRT1krZyt5RmMwYTlmODlxdFNvN3FlY0d1WU5v?=
 =?utf-8?B?WU1BRnBkcEZVUkFQWWp6UVhtUElJcUJLUHdxUnZaaFIrclR0NkUyNUpTTHBK?=
 =?utf-8?B?Vk9JMzNQNWM2UldFbU45MDQxYVE5ZnRnbkJmK3hXcjBtUmprQkIvejRuanls?=
 =?utf-8?B?aUVHS0VhcXMxU2FiU3pwUytEcVo1WjdWNkhFdkxWa3dQSXk1RUdiL1IvSkhL?=
 =?utf-8?Q?yKfdLnR5x67xEVexQPfr32SxBEqiRL0H0WTdY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB7140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW8zMUxTNUJ2MEMrdTZiTVRRSG9oRWdYN2ZJcWw5UzFVeEYwYXNXcTlQSUJH?=
 =?utf-8?B?dFlqbUhDNERNNlFDSzZ2NldxaWtia3BxWk1oL09lTStkRjJvV2Z3YjZWcFkw?=
 =?utf-8?B?eGZEMjg5T2FQTVBIMi9wSXNQdEwxZm4ycVFnME41QU5wcy9xbEMyVUVZampy?=
 =?utf-8?B?SkFITzJpdnBNcmZIKzNzb0trbDFxVjJtelltVmdkRzduSmtPbVdha0R2a2Vw?=
 =?utf-8?B?M0NZMU9jT1M2c0MvNm1Xcjhkb3VqUUhHcnRjN2MwSW52WG4weFpBTXp2M2Mw?=
 =?utf-8?B?TGIyNHQvOHhjYWlTQmxyMitSWFhubDBhOGJiZE1Kbm9oYVhoRlJadlpTbTVG?=
 =?utf-8?B?elJRWk1zM296YkhCT01rOURWQ1NYUWd2V2dFMDI1c0ZuRkU2Q1oxY3Y3V0dp?=
 =?utf-8?B?T1JNRmlXR0hEY2JtcEhwRmllZm16eDZ0d3BFU1JsQ0JMRHdoOHl6TkRCbFRR?=
 =?utf-8?B?WXJtQnc4R2RpUVpXTWRJZFpteWFhZ1JPSmV1b1c2cm1sUm90QlNxS3VHZ2N3?=
 =?utf-8?B?cEpzdGdBeEVrYUFKVEFqNXJON0QvTjhGVThoU2xOdzVOMXRmL0xYc0lZZnlM?=
 =?utf-8?B?L1VWQk84Mm9iWC9qYmxUUVdxd0pCb080MC9QVndDK2U1aEVEdG5kU0UwZXVD?=
 =?utf-8?B?V2dJdmtOMGhFOWpxUUZLck9TT3B6Mmx4eFUrQ0NqTnl3dVpZcjFwNHhsUFRw?=
 =?utf-8?B?NVJWNmFpSHJ6cVpLU3NPdkIvakdYd2g4a2xybi9oUzVHVytvUFlZazdiaS90?=
 =?utf-8?B?N0pVSW1wMHR5U1Zoblp4amtqMkJlMmpocXNHb1Q4a1F3UTVCSDVMOFJSVXMz?=
 =?utf-8?B?bWlwMHRzeENLTW1zOXNLZm1KWHhlUUR2VDlCTFhSQi9pcnNxWHNuYjQ5VGNr?=
 =?utf-8?B?aFNpQzNqRXNZVnpsb3FaRXhQem4vUTVFWnpnVUhxejRIUndaL2tFVEd3WEhH?=
 =?utf-8?B?OVpRNU1yRWpjcjZXcWRFelI4WG5xc20xNDVJcEdoaDhTZ1BjNXdBbXIrT2xN?=
 =?utf-8?B?NWxHVDVTRGJNdHExNHJyM0dRWGZ2MHhtVmIrVC9vT3ovSHFJeTZMV0R4cWw0?=
 =?utf-8?B?OHdTMmRyWHgxUE9oQjRWdUZPS1JtaTVCTDFzUVdpSUt6OGtUTjJHOUJTYSt6?=
 =?utf-8?B?cVVqNDI2ZVlrUE1kS1VYdlFXcVFRZENDWHJidGlVc0h2SEhVckU1S3FBL2pm?=
 =?utf-8?B?Z05ZUHdHeExRQ0FlSWJDaCsyUloyWktBRVl4bkRPZjN4Z0JnWHRuOFdGZUVM?=
 =?utf-8?B?akhWRjJYT29RUFZRK1h3dDQwcWd4cjJMaE1nZmdQeGlPYVBQaGRtSW9RMlpP?=
 =?utf-8?B?TUpCcUdmY2hzRXFCQnc3RkZNVE9VWWxOVGc3OHJqU2tFUTQwRE9VTHc0VlRv?=
 =?utf-8?B?alpRd1BNNDdkMHUzVmRkK1RrM2Zhc2FpSTN6a0VmSldxa09Dd0FZdUxtMEQr?=
 =?utf-8?B?NjR1V0VpWEpGNk5ndWF6dTYzc1l2b01jSXhyZGc2WGphbjdyNStIN2pZUTA1?=
 =?utf-8?B?MVo3alI5NHJmb0Y1bHoyM1JRbm5oVVd4K2xrZGlqWmFVcDJDcmM5U0pnNXJN?=
 =?utf-8?B?a1puQ3Fxdlp0bEx3bmNDbFMzTnkxSFFmaVA3YUpKSStrY25FNjRiQUl4K3Fl?=
 =?utf-8?B?TU10VzlQSytXWnhlK1IrdHJvNy9CYmg1d0VOK2lVSUVBeitqcFN6dGZsYy9a?=
 =?utf-8?B?bm5pMzAraklKZHJrbzM3VW52Z0Y5MFBGR2daZ05nMWMzRzcrRG14UW1IZHBi?=
 =?utf-8?B?UWxjNTZTc3k1QTVlS0pUR0o5OUJVc1ZUMXAyK3RIY1pCditPNUFVbFAyREdx?=
 =?utf-8?B?Yloyem1WZ2R1UnNMVlp2SndPK3pwRWRPcFdXYVY1cmp5bDY3YjNhME1aWlZY?=
 =?utf-8?B?UmtmRG9hYUNSZlZuencwTi9yNFh0dkt1Y2VPL1ZRK1NrSGlXRmJybzZUbnds?=
 =?utf-8?B?TFhEajhqNlpBRGRQVEJkT1dleVlBQkNENnFlb3hVcjBvckZFcXF1ZHJQYTdC?=
 =?utf-8?B?NzZQbkZwUGR2MitKckxaWHRkL3NCZElmdmlhaFovd2xMTG80SUx1NTRVeW5T?=
 =?utf-8?B?MkZPZmNia0JhaFhqZDNKWURsWWdYNUY0OEFzUC81bkwwd0orcHQ1YjN6dnVW?=
 =?utf-8?Q?RObyh/2XobdK6aC4/r0kT7Reo?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b8018f-ff00-48cc-9980-08ddf4f81cbd
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 08:07:43.5471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8f3ns/gwHrEXXzCGeiGUFEFgfQZjbiGsvHlcVs7KEkt4Rttm7NVBv1aaH+HyeMebrowo7vVwFIUdlHVmXal4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5475
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Yes, for most storage devices, since disk performance is much
 lower than memory,
 writing with F2FS uncached buffer IO does not bring significant
 performance benefits. Its advantages might only become [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.17 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1uyQjC-00048x-BY
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: f2fs support uncached buffer I/O
 read and write
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
From: hanqi via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: hanqi <hanqi@vivo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Yes, for most storage devices, since disk performance is much lower
than memory, writing with F2FS uncached buffer IO does not bring
significant performance benefits. Its advantages might only become
apparent in scenarios where disk performance exceeds that of memory.

Therefore, I also agree that F2FS should first support uncached buffer
IO for reads, as Chao mentioned.

Thanks,

On 2025/9/16 11:13, Chao Yu wrote:
> On 9/12/25 07:53, Jaegeuk Kim wrote:
>> Given the performance data and implementation overhead, I'm also questioning
>> whether we really need to support this for writes or not. Can we get some common
>> sense of usage models?
> Seems uncached write implementation affects the performance a lot, I don't see
> a good reason to merge this for now.
>
> I think we can try to enable uncached read functionality and return -EOPNOTSUPP
> for uncached write first, meanwhile, let's see if there is anything good usecase
> for uncached write.
>
> Thanks,
>
>> On 08/28, Qi Han wrote:
>>> In the link [1], we adapted uncached buffer I/O read support in f2fs.
>>> Now, let's move forward to enabling uncached buffer I/O write support
>>> in f2fs.
>>>
>>> In f2fs_write_end_io, a separate asynchronous workqueue is created to
>>> perform the page drop operation for bios that contain pages of type
>>> FGP_DONTCACHE.
>>>
>>> The following patch is developed and tested based on the v6.17-rc3 branch.
>>> My local testing results are as follows, along with some issues observed:
>>> 1) Write performance degradation. Uncached buffer I/O write is slower than
>>> normal buffered write because uncached I/O triggers a sync operation for
>>> each I/O after data is written to memory, in order to drop pages promptly
>>> at end_io. I assume this impact might be less visible on high-performance
>>> storage devices such as PCIe 6.0 SSDs.
>>> - f2fs_file_write_iter
>>>   - f2fs_buffered_write_iter
>>>   - generic_write_sync
>>>    - filemap_fdatawrite_range_kick
>>> 2) As expected, page cache usage does not significantly increase during writes.
>>> 3) The kswapd0 memory reclaim thread remains mostly idle, but additional
>>> asynchronous work overhead is introduced, e.g:
>>>    PID USER         PR  NI VIRT  RES  SHR S[%CPU] %MEM     TIME+ ARGS
>>> 19650 root          0 -20    0    0    0 I  7.0   0.0   0:00.21 [kworker/u33:3-f2fs_post_write_wq]
>>>     95 root          0 -20    0    0    0 I  6.6   0.0   0:02.08 [kworker/u33:0-f2fs_post_write_wq]
>>> 19653 root          0 -20    0    0    0 I  4.6   0.0   0:01.25 [kworker/u33:6-f2fs_post_write_wq]
>>> 19652 root          0 -20    0    0    0 I  4.3   0.0   0:00.92 [kworker/u33:5-f2fs_post_write_wq]
>>> 19613 root          0 -20    0    0    0 I  4.3   0.0   0:00.99 [kworker/u33:1-f2fs_post_write_wq]
>>> 19651 root          0 -20    0    0    0 I  3.6   0.0   0:00.98 [kworker/u33:4-f2fs_post_write_wq]
>>> 19654 root          0 -20    0    0    0 I  3.0   0.0   0:01.05 [kworker/u33:7-f2fs_post_write_wq]
>>> 19655 root          0 -20    0    0    0 I  2.3   0.0   0:01.18 [kworker/u33:8-f2fs_post_write_wq]
>>>
>>> >From these results on my test device, introducing uncached buffer I/O write on
>>> f2fs seems to bring more drawbacks than benefits. Do we really need to support
>>> uncached buffer I/O write in f2fs?
>>>
>>> Write test data without using uncached buffer I/O:
>>> Starting 1 threads
>>> pid: 17609
>>> writing bs 8192, uncached 0
>>>    1s: 753MB/sec, MB=753
>>>    2s: 792MB/sec, MB=1546
>>>    3s: 430MB/sec, MB=1978
>>>    4s: 661MB/sec, MB=2636
>>>    5s: 900MB/sec, MB=3542
>>>    6s: 769MB/sec, MB=4308
>>>    7s: 808MB/sec, MB=5113
>>>    8s: 766MB/sec, MB=5884
>>>    9s: 654MB/sec, MB=6539
>>>   10s: 456MB/sec, MB=6995
>>>   11s: 797MB/sec, MB=7793
>>>   12s: 770MB/sec, MB=8563
>>>   13s: 778MB/sec, MB=9341
>>>   14s: 726MB/sec, MB=10077
>>>   15s: 736MB/sec, MB=10803
>>>   16s: 798MB/sec, MB=11602
>>>   17s: 728MB/sec, MB=12330
>>>   18s: 749MB/sec, MB=13080
>>>   19s: 777MB/sec, MB=13857
>>>   20s: 688MB/sec, MB=14395
>>>
>>> 19:29:34      UID       PID    %usr %system  %guest   %wait    %CPU   CPU  Command
>>> 19:29:35        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:29:36        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:29:37        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:29:38        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:29:39        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:29:40        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:29:41        0        94    0.00    2.00    0.00    0.00    2.00     0  kswapd0
>>> 19:29:42        0        94    0.00   59.00    0.00    0.00   59.00     7  kswapd0
>>> 19:29:43        0        94    0.00   45.00    0.00    0.00   45.00     7  kswapd0
>>> 19:29:44        0        94    0.00   36.00    0.00    0.00   36.00     0  kswapd0
>>> 19:29:45        0        94    0.00   27.00    0.00    1.00   27.00     0  kswapd0
>>> 19:29:46        0        94    0.00   26.00    0.00    0.00   26.00     2  kswapd0
>>> 19:29:47        0        94    0.00   57.00    0.00    0.00   57.00     7  kswapd0
>>> 19:29:48        0        94    0.00   41.00    0.00    0.00   41.00     7  kswapd0
>>> 19:29:49        0        94    0.00   38.00    0.00    0.00   38.00     7  kswapd0
>>> 19:29:50        0        94    0.00   47.00    0.00    0.00   47.00     7  kswapd0
>>> 19:29:51        0        94    0.00   43.00    0.00    1.00   43.00     7  kswapd0
>>> 19:29:52        0        94    0.00   36.00    0.00    0.00   36.00     7  kswapd0
>>> 19:29:53        0        94    0.00   39.00    0.00    0.00   39.00     2  kswapd0
>>> 19:29:54        0        94    0.00   46.00    0.00    0.00   46.00     7  kswapd0
>>> 19:29:55        0        94    0.00   43.00    0.00    0.00   43.00     7  kswapd0
>>> 19:29:56        0        94    0.00   39.00    0.00    0.00   39.00     7  kswapd0
>>> 19:29:57        0        94    0.00   29.00    0.00    1.00   29.00     1  kswapd0
>>> 19:29:58        0        94    0.00   17.00    0.00    0.00   17.00     4  kswapd0
>>>
>>> 19:29:33    kbmemfree   kbavail kbmemused  %memused kbbuffers  kbcached  kbcommit   %commit  kbactive   kbinact   kbdirty
>>> 19:29:34      4464588   6742648   4420876     38.12      6156   2032600 179730872    743.27   1863412   1822544         4
>>> 19:29:35      4462572   6740784   4422752     38.13      6156   2032752 179739004    743.30   1863460   1823584        16
>>> 19:29:36      4381512   6740856   4422420     38.13      6156   2114144 179746508    743.33   1863476   1905384     81404
>>> 19:29:37      3619456   6741840   4421588     38.12      6156   2877032 179746652    743.33   1863536   2668896    592584
>>> 19:29:38      2848184   6740720   4422472     38.13      6164   3646188 179746652    743.33   1863600   3438520    815692
>>> 19:29:39      2436336   6739452   4423720     38.14      6164   4056772 179746652    743.33   1863604   3849164    357096
>>> 19:29:40      1712660   6737700   4425140     38.15      6164   4779020 179746604    743.33   1863612   4571124    343716
>>> 19:29:41       810664   6738020   4425004     38.15      6164   5681152 179746604    743.33   1863612   5473444    297268
>>> 19:29:42       673756   6779120   4373200     37.71      5656   5869928 179746604    743.33   1902852   5589452    269032
>>> 19:29:43       688480   6782024   4371012     37.69      5648   5856940 179750048    743.34   1926336   5542004    279344
>>> 19:29:44       688956   6789028   4364260     37.63      5584   5863272 179750048    743.34   1941608   5518808    300096
>>> 19:29:45       740768   6804560   4348772     37.49      5524   5827248 179750000    743.34   1954084   5452844    123120
>>> 19:29:46       697936   6810612   4342768     37.44      5524   5876048 179750048    743.34   1962020   5483944    274908
>>> 19:29:47       734504   6818716   4334156     37.37      5512   5849188 179750000    743.34   1978120   5426796    274504
>>> 19:29:48       771696   6828316   4324180     37.28      5504   5820948 179762260    743.39   2006732   5354152    305388
>>> 19:29:49       691944   6838812   4313108     37.19      5476   5912444 179749952    743.34   2021720   5418996    296852
>>> 19:29:50       679392   6844496   4306892     37.13      5452   5931356 179749952    743.34   1982772   5463040    233600
>>> 19:29:51       768528   6868080   4284224     36.94      5412   5865704 176317452    729.15   1990220   5359012    343160
>>> 19:29:52       717880   6893940   4259968     36.73      5400   5942368 176317404    729.15   1965624   5444140    304856
>>> 19:29:53       712408   6902660   4251268     36.65      5372   5956584 176318376    729.15   1969192   5442132    290224
>>> 19:29:54       707184   6917512   4236160     36.52      5344   5976944 176318568    729.15   1968716   5443620    336948
>>> 19:29:55       703172   6921608   4232332     36.49      5292   5984836 176318568    729.15   1979788   5429484    328716
>>> 19:29:56       733256   6933020   4220864     36.39      5212   5966340 176318568    729.15   1983636   5396256    300008
>>> 19:29:57       723308   6936340   4217280     36.36      5120   5979816 176318568    729.15   1987088   5394360    508792
>>> 19:29:58       732148   6942972   4210680     36.30      5108   5977656 176311064    729.12   1990400   5379884    214936
>>>
>>> Write test data after using uncached buffer I/O:
>>> Starting 1 threads
>>> pid: 17742
>>> writing bs 8192, uncached 1
>>>    1s: 433MB/sec, MB=433
>>>    2s: 195MB/sec, MB=628
>>>    3s: 209MB/sec, MB=836
>>>    4s: 54MB/sec, MB=883
>>>    5s: 277MB/sec, MB=1169
>>>    6s: 141MB/sec, MB=1311
>>>    7s: 185MB/sec, MB=1495
>>>    8s: 134MB/sec, MB=1631
>>>    9s: 201MB/sec, MB=1834
>>>   10s: 283MB/sec, MB=2114
>>>   11s: 223MB/sec, MB=2339
>>>   12s: 164MB/sec, MB=2506
>>>   13s: 155MB/sec, MB=2657
>>>   14s: 132MB/sec, MB=2792
>>>   15s: 186MB/sec, MB=2965
>>>   16s: 218MB/sec, MB=3198
>>>   17s: 220MB/sec, MB=3412
>>>   18s: 191MB/sec, MB=3606
>>>   19s: 214MB/sec, MB=3828
>>>   20s: 257MB/sec, MB=4085
>>>
>>> 19:31:31      UID       PID    %usr %system  %guest   %wait    %CPU   CPU  Command
>>> 19:31:32        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:31:33        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:31:34        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:31:35        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:31:36        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:31:37        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:31:38        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:31:39        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:31:40        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:31:41        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:31:42        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:31:43        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:31:44        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:31:45        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:31:46        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:31:47        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:31:48        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>> 19:31:49        0        94    0.00    0.00    0.00    0.00    0.00     4  kswapd0
>>>
>>> 19:31:31    kbmemfree   kbavail kbmemused  %memused kbbuffers  kbcached  kbcommit   %commit  kbactive   kbinact   kbdirty
>>> 19:31:32      4816812   6928788   4225812     36.43      5148   1879676 176322636    729.17   1920900   1336548    285748
>>> 19:31:33      4781880   6889428   4265592     36.78      5148   1874860 176322636    729.17   1920920   1332268    279028
>>> 19:31:34      4758972   6822588   4332376     37.35      5148   1830984 176322636    729.17   1920920   1288976    233040
>>> 19:31:35      4850248   6766480   4387840     37.83      5148   1684244 176322636    729.17   1920920   1142408     90508
>>> 19:31:36      4644176   6741676   4413256     38.05      5148   1864900 176322636    729.17   1920920   1323452    269380
>>> 19:31:37      4637900   6681480   4473436     38.57      5148   1810996 176322588    729.17   1920920   1269612    217632
>>> 19:31:38      4502108   6595508   4559500     39.31      5148   1860724 176322492    729.17   1920920   1319588    267760
>>> 19:31:39      4498844   6551068   4603928     39.69      5148   1819528 176322492    729.17   1920920   1278440    226496
>>> 19:31:40      4498812   6587396   4567340     39.38      5148   1856116 176322492    729.17   1920920   1314800    263292
>>> 19:31:41      4656784   6706252   4448372     38.35      5148   1817112 176322492    729.17   1920920   1275704    224600
>>> 19:31:42      4635032   6673328   4481436     38.64      5148   1805816 176322492    729.17   1920920   1264548    213436
>>> 19:31:43      4636852   6679736   4474884     38.58      5148   1810548 176322492    729.17   1920932   1269796    218276
>>> 19:31:44      4654740   6669104   4485544     38.67      5148   1782000 176322444    729.17   1920932   1241552    189880
>>> 19:31:45      4821604   6693156   4461848     38.47      5148   1638864 176322444    729.17   1920932   1098784     31076
>>> 19:31:46      4707548   6728796   4426400     38.16      5148   1788368 176322444    729.17   1920932   1248936    196596
>>> 19:31:47      4683996   6747632   4407348     38.00      5148   1830968 176322444    729.17   1920932   1291396    239636
>>> 19:31:48      4694648   6773808   4381320     37.78      5148   1846376 176322624    729.17   1920944   1307576    254800
>>> 19:31:49      4663784   6730212   4424776     38.15      5148   1833784 176322772    729.17   1920948   1295156    242200
>>>
>>> [1]
>>> https://lore.kernel.org/lkml/20250725075310.1614614-1-hanqi@vivo.com/
>>>
>>> Signed-off-by: Qi Han <hanqi@vivo.com>
>>> ---
>>>   fs/f2fs/data.c    | 178 ++++++++++++++++++++++++++++++++++------------
>>>   fs/f2fs/f2fs.h    |   5 ++
>>>   fs/f2fs/file.c    |   2 +-
>>>   fs/f2fs/iostat.c  |   8 ++-
>>>   fs/f2fs/iostat.h  |   4 +-
>>>   fs/f2fs/segment.c |   2 +-
>>>   fs/f2fs/super.c   |  16 ++++-
>>>   7 files changed, 161 insertions(+), 54 deletions(-)
>>>
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index 7961e0ddfca3..4eeb2b36473d 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -30,8 +30,10 @@
>>>   #define NUM_PREALLOC_POST_READ_CTXS	128
>>>   
>>>   static struct kmem_cache *bio_post_read_ctx_cache;
>>> +static struct kmem_cache *bio_post_write_ctx_cache;
>>>   static struct kmem_cache *bio_entry_slab;
>>>   static mempool_t *bio_post_read_ctx_pool;
>>> +static mempool_t *bio_post_write_ctx_pool;
>>>   static struct bio_set f2fs_bioset;
>>>   
>>>   #define	F2FS_BIO_POOL_SIZE	NR_CURSEG_TYPE
>>> @@ -120,6 +122,12 @@ struct bio_post_read_ctx {
>>>   	block_t fs_blkaddr;
>>>   };
>>>   
>>> +struct bio_post_write_ctx {
>>> +	struct bio *bio;
>>> +	struct f2fs_sb_info *sbi;
>>> +	struct work_struct work;
>>> +};
>>> +
>>>   /*
>>>    * Update and unlock a bio's pages, and free the bio.
>>>    *
>>> @@ -159,6 +167,56 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
>>>   	bio_put(bio);
>>>   }
>>>   
>>> +static void f2fs_finish_write_bio(struct f2fs_sb_info *sbi, struct bio *bio)
>>> +{
>>> +	struct folio_iter fi;
>>> +	struct bio_post_write_ctx *write_ctx = (struct bio_post_write_ctx *)bio->bi_private;
>>> +
>>> +	bio_for_each_folio_all(fi, bio) {
>>> +		struct folio *folio = fi.folio;
>>> +		enum count_type type;
>>> +
>>> +		if (fscrypt_is_bounce_folio(folio)) {
>>> +			struct folio *io_folio = folio;
>>> +
>>> +			folio = fscrypt_pagecache_folio(io_folio);
>>> +			fscrypt_free_bounce_page(&io_folio->page);
>>> +		}
>>> +
>>> +#ifdef CONFIG_F2FS_FS_COMPRESSION
>>> +		if (f2fs_is_compressed_page(folio)) {
>>> +			f2fs_compress_write_end_io(bio, folio);
>>> +			continue;
>>> +		}
>>> +#endif
>>> +
>>> +		type = WB_DATA_TYPE(folio, false);
>>> +
>>> +		if (unlikely(bio->bi_status != BLK_STS_OK)) {
>>> +			mapping_set_error(folio->mapping, -EIO);
>>> +			if (type == F2FS_WB_CP_DATA)
>>> +				f2fs_stop_checkpoint(sbi, true,
>>> +						STOP_CP_REASON_WRITE_FAIL);
>>> +		}
>>> +
>>> +		f2fs_bug_on(sbi, is_node_folio(folio) &&
>>> +				folio->index != nid_of_node(folio));
>>> +
>>> +		dec_page_count(sbi, type);
>>> +		if (f2fs_in_warm_node_list(sbi, folio))
>>> +			f2fs_del_fsync_node_entry(sbi, folio);
>>> +		folio_clear_f2fs_gcing(folio);
>>> +		folio_end_writeback(folio);
>>> +	}
>>> +	if (!get_pages(sbi, F2FS_WB_CP_DATA) &&
>>> +				wq_has_sleeper(&sbi->cp_wait))
>>> +		wake_up(&sbi->cp_wait);
>>> +
>>> +	if (write_ctx)
>>> +		mempool_free(write_ctx, bio_post_write_ctx_pool);
>>> +	bio_put(bio);
>>> +}
>>> +
>>>   static void f2fs_verify_bio(struct work_struct *work)
>>>   {
>>>   	struct bio_post_read_ctx *ctx =
>>> @@ -314,58 +372,32 @@ static void f2fs_read_end_io(struct bio *bio)
>>>   	f2fs_verify_and_finish_bio(bio, intask);
>>>   }
>>>   
>>> +static void f2fs_finish_write_bio_async_work(struct work_struct *work)
>>> +{
>>> +	struct bio_post_write_ctx *ctx =
>>> +		container_of(work, struct bio_post_write_ctx, work);
>>> +
>>> +	f2fs_finish_write_bio(ctx->sbi, ctx->bio);
>>> +}
>>> +
>>>   static void f2fs_write_end_io(struct bio *bio)
>>>   {
>>> -	struct f2fs_sb_info *sbi;
>>> -	struct folio_iter fi;
>>> +	struct f2fs_sb_info *sbi = F2FS_F_SB(bio_first_folio_all(bio));
>>> +	struct bio_post_write_ctx *write_ctx;
>>>   
>>>   	iostat_update_and_unbind_ctx(bio);
>>> -	sbi = bio->bi_private;
>>>   
>>>   	if (time_to_inject(sbi, FAULT_WRITE_IO))
>>>   		bio->bi_status = BLK_STS_IOERR;
>>>   
>>> -	bio_for_each_folio_all(fi, bio) {
>>> -		struct folio *folio = fi.folio;
>>> -		enum count_type type;
>>> -
>>> -		if (fscrypt_is_bounce_folio(folio)) {
>>> -			struct folio *io_folio = folio;
>>> -
>>> -			folio = fscrypt_pagecache_folio(io_folio);
>>> -			fscrypt_free_bounce_page(&io_folio->page);
>>> -		}
>>> -
>>> -#ifdef CONFIG_F2FS_FS_COMPRESSION
>>> -		if (f2fs_is_compressed_page(folio)) {
>>> -			f2fs_compress_write_end_io(bio, folio);
>>> -			continue;
>>> -		}
>>> -#endif
>>> -
>>> -		type = WB_DATA_TYPE(folio, false);
>>> -
>>> -		if (unlikely(bio->bi_status != BLK_STS_OK)) {
>>> -			mapping_set_error(folio->mapping, -EIO);
>>> -			if (type == F2FS_WB_CP_DATA)
>>> -				f2fs_stop_checkpoint(sbi, true,
>>> -						STOP_CP_REASON_WRITE_FAIL);
>>> -		}
>>> -
>>> -		f2fs_bug_on(sbi, is_node_folio(folio) &&
>>> -				folio->index != nid_of_node(folio));
>>> -
>>> -		dec_page_count(sbi, type);
>>> -		if (f2fs_in_warm_node_list(sbi, folio))
>>> -			f2fs_del_fsync_node_entry(sbi, folio);
>>> -		folio_clear_f2fs_gcing(folio);
>>> -		folio_end_writeback(folio);
>>> +	write_ctx = (struct bio_post_write_ctx *)bio->bi_private;
>>> +	if (write_ctx) {
>>> +		INIT_WORK(&write_ctx->work, f2fs_finish_write_bio_async_work);
>>> +		queue_work(write_ctx->sbi->post_write_wq, &write_ctx->work);
>>> +		return;
>>>   	}
>>> -	if (!get_pages(sbi, F2FS_WB_CP_DATA) &&
>>> -				wq_has_sleeper(&sbi->cp_wait))
>>> -		wake_up(&sbi->cp_wait);
>>>   
>>> -	bio_put(bio);
>>> +	f2fs_finish_write_bio(sbi, bio);
>>>   }
>>>   
>>>   #ifdef CONFIG_BLK_DEV_ZONED
>>> @@ -467,11 +499,10 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
>>>   		bio->bi_private = NULL;
>>>   	} else {
>>>   		bio->bi_end_io = f2fs_write_end_io;
>>> -		bio->bi_private = sbi;
>>> +		bio->bi_private = NULL;
>>>   		bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi,
>>>   						fio->type, fio->temp);
>>>   	}
>>> -	iostat_alloc_and_bind_ctx(sbi, bio, NULL);
>>>   
>>>   	if (fio->io_wbc)
>>>   		wbc_init_bio(fio->io_wbc, bio);
>>> @@ -701,6 +732,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
>>>   
>>>   	/* Allocate a new bio */
>>>   	bio = __bio_alloc(fio, 1);
>>> +	iostat_alloc_and_bind_ctx(fio->sbi, bio, NULL, NULL);
>>>   
>>>   	f2fs_set_bio_crypt_ctx(bio, fio_folio->mapping->host,
>>>   			fio_folio->index, fio, GFP_NOIO);
>>> @@ -899,6 +931,8 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>>>   alloc_new:
>>>   	if (!bio) {
>>>   		bio = __bio_alloc(fio, BIO_MAX_VECS);
>>> +		iostat_alloc_and_bind_ctx(fio->sbi, bio, NULL, NULL);
>>> +
>>>   		f2fs_set_bio_crypt_ctx(bio, folio->mapping->host,
>>>   				folio->index, fio, GFP_NOIO);
>>>   
>>> @@ -948,6 +982,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>>>   	struct f2fs_bio_info *io = sbi->write_io[btype] + fio->temp;
>>>   	struct folio *bio_folio;
>>>   	enum count_type type;
>>> +	struct bio_post_write_ctx *write_ctx = NULL;
>>>   
>>>   	f2fs_bug_on(sbi, is_read_io(fio->op));
>>>   
>>> @@ -1001,6 +1036,13 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>>>   		f2fs_set_bio_crypt_ctx(io->bio, fio_inode(fio),
>>>   				bio_folio->index, fio, GFP_NOIO);
>>>   		io->fio = *fio;
>>> +
>>> +		if (folio_test_dropbehind(bio_folio)) {
>>> +			write_ctx = mempool_alloc(bio_post_write_ctx_pool, GFP_NOFS);
>>> +			write_ctx->bio = io->bio;
>>> +			write_ctx->sbi = sbi;
>>> +		}
>>> +		iostat_alloc_and_bind_ctx(fio->sbi, io->bio, NULL, write_ctx);
>>>   	}
>>>   
>>>   	if (!bio_add_folio(io->bio, bio_folio, folio_size(bio_folio), 0)) {
>>> @@ -1077,7 +1119,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
>>>   		ctx->decompression_attempted = false;
>>>   		bio->bi_private = ctx;
>>>   	}
>>> -	iostat_alloc_and_bind_ctx(sbi, bio, ctx);
>>> +	iostat_alloc_and_bind_ctx(sbi, bio, ctx, NULL);
>>>   
>>>   	return bio;
>>>   }
>>> @@ -3540,6 +3582,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>>>   	bool use_cow = false;
>>>   	block_t blkaddr = NULL_ADDR;
>>>   	int err = 0;
>>> +	fgf_t fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT;
>>>   
>>>   	trace_f2fs_write_begin(inode, pos, len);
>>>   
>>> @@ -3582,12 +3625,13 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>>>   #endif
>>>   
>>>   repeat:
>>> +	if (iocb && iocb->ki_flags & IOCB_DONTCACHE)
>>> +		fgp |= FGP_DONTCACHE;
>>>   	/*
>>>   	 * Do not use FGP_STABLE to avoid deadlock.
>>>   	 * Will wait that below with our IO control.
>>>   	 */
>>> -	folio = __filemap_get_folio(mapping, index,
>>> -				FGP_LOCK | FGP_WRITE | FGP_CREAT, GFP_NOFS);
>>> +	folio = __filemap_get_folio(mapping, index, fgp, GFP_NOFS);
>>>   	if (IS_ERR(folio)) {
>>>   		err = PTR_ERR(folio);
>>>   		goto fail;
>>> @@ -4127,12 +4171,38 @@ int __init f2fs_init_post_read_processing(void)
>>>   	return -ENOMEM;
>>>   }
>>>   
>>> +int __init f2fs_init_post_write_processing(void)
>>> +{
>>> +	bio_post_write_ctx_cache =
>>> +		kmem_cache_create("f2fs_bio_post_write_ctx",
>>> +				sizeof(struct bio_post_write_ctx), 0, 0, NULL);
>>> +	if (!bio_post_write_ctx_cache)
>>> +		goto fail;
>>> +	bio_post_write_ctx_pool =
>>> +		mempool_create_slab_pool(NUM_PREALLOC_POST_READ_CTXS,
>>> +				bio_post_write_ctx_cache);
>>> +	if (!bio_post_write_ctx_pool)
>>> +		goto fail_free_cache;
>>> +	return 0;
>>> +
>>> +fail_free_cache:
>>> +	kmem_cache_destroy(bio_post_write_ctx_cache);
>>> +fail:
>>> +	return -ENOMEM;
>>> +}
>>> +
>>>   void f2fs_destroy_post_read_processing(void)
>>>   {
>>>   	mempool_destroy(bio_post_read_ctx_pool);
>>>   	kmem_cache_destroy(bio_post_read_ctx_cache);
>>>   }
>>>   
>>> +void f2fs_destroy_post_write_processing(void)
>>> +{
>>> +	mempool_destroy(bio_post_write_ctx_pool);
>>> +	kmem_cache_destroy(bio_post_write_ctx_cache);
>>> +}
>>> +
>>>   int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi)
>>>   {
>>>   	if (!f2fs_sb_has_encrypt(sbi) &&
>>> @@ -4146,12 +4216,26 @@ int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi)
>>>   	return sbi->post_read_wq ? 0 : -ENOMEM;
>>>   }
>>>   
>>> +int f2fs_init_post_write_wq(struct f2fs_sb_info *sbi)
>>> +{
>>> +	sbi->post_write_wq = alloc_workqueue("f2fs_post_write_wq",
>>> +						 WQ_UNBOUND | WQ_HIGHPRI,
>>> +						 num_online_cpus());
>>> +	return sbi->post_write_wq ? 0 : -ENOMEM;
>>> +}
>>> +
>>>   void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi)
>>>   {
>>>   	if (sbi->post_read_wq)
>>>   		destroy_workqueue(sbi->post_read_wq);
>>>   }
>>>   
>>> +void f2fs_destroy_post_write_wq(struct f2fs_sb_info *sbi)
>>> +{
>>> +	if (sbi->post_write_wq)
>>> +		destroy_workqueue(sbi->post_write_wq);
>>> +}
>>> +
>>>   int __init f2fs_init_bio_entry_cache(void)
>>>   {
>>>   	bio_entry_slab = f2fs_kmem_cache_create("f2fs_bio_entry_slab",
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index 46be7560548c..fe3f81876b23 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -1812,6 +1812,7 @@ struct f2fs_sb_info {
>>>   	/* Precomputed FS UUID checksum for seeding other checksums */
>>>   	__u32 s_chksum_seed;
>>>   
>>> +	struct workqueue_struct *post_write_wq;
>>>   	struct workqueue_struct *post_read_wq;	/* post read workqueue */
>>>   
>>>   	/*
>>> @@ -4023,9 +4024,13 @@ bool f2fs_release_folio(struct folio *folio, gfp_t wait);
>>>   bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len);
>>>   void f2fs_clear_page_cache_dirty_tag(struct folio *folio);
>>>   int f2fs_init_post_read_processing(void);
>>> +int f2fs_init_post_write_processing(void);
>>>   void f2fs_destroy_post_read_processing(void);
>>> +void f2fs_destroy_post_write_processing(void);
>>>   int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi);
>>> +int f2fs_init_post_write_wq(struct f2fs_sb_info *sbi);
>>>   void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi);
>>> +void f2fs_destroy_post_write_wq(struct f2fs_sb_info *sbi);
>>>   extern const struct iomap_ops f2fs_iomap_ops;
>>>   
>>>   /*
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index 42faaed6a02d..8aa6a4fd52e8 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -5443,5 +5443,5 @@ const struct file_operations f2fs_file_operations = {
>>>   	.splice_read	= f2fs_file_splice_read,
>>>   	.splice_write	= iter_file_splice_write,
>>>   	.fadvise	= f2fs_file_fadvise,
>>> -	.fop_flags	= FOP_BUFFER_RASYNC,
>>> +	.fop_flags	= FOP_BUFFER_RASYNC | FOP_DONTCACHE,
>>>   };
>>> diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
>>> index f8703038e1d8..b2e6ce80c68d 100644
>>> --- a/fs/f2fs/iostat.c
>>> +++ b/fs/f2fs/iostat.c
>>> @@ -245,7 +245,7 @@ void iostat_update_and_unbind_ctx(struct bio *bio)
>>>   	if (op_is_write(bio_op(bio))) {
>>>   		lat_type = bio->bi_opf & REQ_SYNC ?
>>>   				WRITE_SYNC_IO : WRITE_ASYNC_IO;
>>> -		bio->bi_private = iostat_ctx->sbi;
>>> +		bio->bi_private = iostat_ctx->post_write_ctx;
>>>   	} else {
>>>   		lat_type = READ_IO;
>>>   		bio->bi_private = iostat_ctx->post_read_ctx;
>>> @@ -256,7 +256,8 @@ void iostat_update_and_unbind_ctx(struct bio *bio)
>>>   }
>>>   
>>>   void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
>>> -		struct bio *bio, struct bio_post_read_ctx *ctx)
>>> +		struct bio *bio, struct bio_post_read_ctx *read_ctx,
>>> +		struct bio_post_write_ctx *write_ctx)
>>>   {
>>>   	struct bio_iostat_ctx *iostat_ctx;
>>>   	/* Due to the mempool, this never fails. */
>>> @@ -264,7 +265,8 @@ void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
>>>   	iostat_ctx->sbi = sbi;
>>>   	iostat_ctx->submit_ts = 0;
>>>   	iostat_ctx->type = 0;
>>> -	iostat_ctx->post_read_ctx = ctx;
>>> +	iostat_ctx->post_read_ctx = read_ctx;
>>> +	iostat_ctx->post_write_ctx = write_ctx;
>>>   	bio->bi_private = iostat_ctx;
>>>   }
>>>   
>>> diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
>>> index eb99d05cf272..a358909bb5e8 100644
>>> --- a/fs/f2fs/iostat.h
>>> +++ b/fs/f2fs/iostat.h
>>> @@ -40,6 +40,7 @@ struct bio_iostat_ctx {
>>>   	unsigned long submit_ts;
>>>   	enum page_type type;
>>>   	struct bio_post_read_ctx *post_read_ctx;
>>> +	struct bio_post_write_ctx *post_write_ctx;
>>>   };
>>>   
>>>   static inline void iostat_update_submit_ctx(struct bio *bio,
>>> @@ -60,7 +61,8 @@ static inline struct bio_post_read_ctx *get_post_read_ctx(struct bio *bio)
>>>   
>>>   extern void iostat_update_and_unbind_ctx(struct bio *bio);
>>>   extern void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
>>> -		struct bio *bio, struct bio_post_read_ctx *ctx);
>>> +		struct bio *bio, struct bio_post_read_ctx *read_ctx,
>>> +		struct bio_post_write_ctx *write_ctx);
>>>   extern int f2fs_init_iostat_processing(void);
>>>   extern void f2fs_destroy_iostat_processing(void);
>>>   extern int f2fs_init_iostat(struct f2fs_sb_info *sbi);
>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>> index cc82d42ef14c..8501008e42b2 100644
>>> --- a/fs/f2fs/segment.c
>>> +++ b/fs/f2fs/segment.c
>>> @@ -3856,7 +3856,7 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct folio *folio,
>>>   		f2fs_inode_chksum_set(sbi, folio);
>>>   	}
>>>   
>>> -	if (fio) {
>>> +	if (fio && !folio_test_dropbehind(folio)) {
>>>   		struct f2fs_bio_info *io;
>>>   
>>>   		INIT_LIST_HEAD(&fio->list);
>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>> index e16c4e2830c2..110dfe073aee 100644
>>> --- a/fs/f2fs/super.c
>>> +++ b/fs/f2fs/super.c
>>> @@ -1963,6 +1963,7 @@ static void f2fs_put_super(struct super_block *sb)
>>>   	flush_work(&sbi->s_error_work);
>>>   
>>>   	f2fs_destroy_post_read_wq(sbi);
>>> +	f2fs_destroy_post_write_wq(sbi);
>>>   
>>>   	kvfree(sbi->ckpt);
>>>   
>>> @@ -4959,6 +4960,12 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>>>   		goto free_devices;
>>>   	}
>>>   
>>> +	err = f2fs_init_post_write_wq(sbi);
>>> +	if (err) {
>>> +		f2fs_err(sbi, "Failed to initialize post write workqueue");
>>> +		goto free_devices;
>>> +	}
>>> +
>>>   	sbi->total_valid_node_count =
>>>   				le32_to_cpu(sbi->ckpt->valid_node_count);
>>>   	percpu_counter_set(&sbi->total_valid_inode_count,
>>> @@ -5240,6 +5247,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>>>   	/* flush s_error_work before sbi destroy */
>>>   	flush_work(&sbi->s_error_work);
>>>   	f2fs_destroy_post_read_wq(sbi);
>>> +	f2fs_destroy_post_write_wq(sbi);
>>>   free_devices:
>>>   	destroy_device_list(sbi);
>>>   	kvfree(sbi->ckpt);
>>> @@ -5435,9 +5443,12 @@ static int __init init_f2fs_fs(void)
>>>   	err = f2fs_init_post_read_processing();
>>>   	if (err)
>>>   		goto free_root_stats;
>>> -	err = f2fs_init_iostat_processing();
>>> +	err = f2fs_init_post_write_processing();
>>>   	if (err)
>>>   		goto free_post_read;
>>> +	err = f2fs_init_iostat_processing();
>>> +	if (err)
>>> +		goto free_post_write;
>>>   	err = f2fs_init_bio_entry_cache();
>>>   	if (err)
>>>   		goto free_iostat;
>>> @@ -5469,6 +5480,8 @@ static int __init init_f2fs_fs(void)
>>>   	f2fs_destroy_bio_entry_cache();
>>>   free_iostat:
>>>   	f2fs_destroy_iostat_processing();
>>> +free_post_write:
>>> +	f2fs_destroy_post_write_processing();
>>>   free_post_read:
>>>   	f2fs_destroy_post_read_processing();
>>>   free_root_stats:
>>> @@ -5504,6 +5517,7 @@ static void __exit exit_f2fs_fs(void)
>>>   	f2fs_destroy_bio_entry_cache();
>>>   	f2fs_destroy_iostat_processing();
>>>   	f2fs_destroy_post_read_processing();
>>> +	f2fs_destroy_post_write_processing();
>>>   	f2fs_destroy_root_stats();
>>>   	f2fs_exit_shrinker();
>>>   	f2fs_exit_sysfs();
>>> -- 
>>> 2.50.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
