Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D47EA0725C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jan 2025 11:03:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tVpO9-00054X-01;
	Thu, 09 Jan 2025 10:03:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1tVpO4-000546-Ew
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jan 2025 10:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KVtUcPblbxNixTykZeRe782DzTdK+QduZlAonVCMH3w=; b=RC9Lkh/1dzBS8DPHNLiAI4J58H
 VTFnl93bpDvZ7bP7Rp7+7vwUX+BYUdltkzWOpMBQPt0r+GyvEt6HkiVR+kv+DHhJUr2udyPyol0GU
 Kwb2OlyNKlmvTAPzAX70cKN2KpWiK6DjjW0zb5ZMp0ewjpMU9o7xaaKqkqOD9kquCQnI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KVtUcPblbxNixTykZeRe782DzTdK+QduZlAonVCMH3w=; b=KRceO4T68qgNzS0nkEbcLxkh5L
 mUgmpYWNLN6tpi4Nq+RySCMv/FTbtYfmENLrZR9wv7YwnaJ+4siJApeEdRHZumYOlmL7His5GpSMk
 CHp4jDupXPmhEow5xeUiSJpFgznj6TG1KfU3xhgCBhZcsJpkSou3K+ATPTjHA/WAZVmM=;
Received: from mail-koreacentralazon11013036.outbound.protection.outlook.com
 ([40.107.44.36] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tVpO3-0008HL-CC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jan 2025 10:03:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAyNdpk/lFcM5y57m7RbbbY2VC4sG3zu7RL/pVBRL47yLQS9lZSWSCSqDY6gmCXVbP7xcN+ohCmrqyibuY62EPansBDwpljnvI1vwpdHxhPM0+BEQHGNLm6DKhfYlJ56oKH1vZT+Yz0DOEgqznqCFPxHksa+VX93qqjCgDG1vYDfBSM4O96v+RmnU1zM4QGeJoCdTDocPFE2Qx4TKpvqoSj3YghfDzy+GG/nF+N113MXM+N8R15MtbatbZj0aVvgOGJ/On32zAMcmPlHAMo0qBgQ9lL+huZLmIGCJmf1YsJtJRoHE9KkR2bOdPP8XuQREmrPDucqrvxAQ8Dy7PCpMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVtUcPblbxNixTykZeRe782DzTdK+QduZlAonVCMH3w=;
 b=SBan5XRasyX9WQOzy/Y2YlAfY2olcacq8Fa4PJNAH4N2kkOQud1qN3aSySv2s4ydkkEdoy18Knk2anCIsmRksZRPD+JPE1M2SkHvM5WcmZvIiSG5+NCAZUTmx5mwrhm8g4GuPZ1Jg69xlNTWX3QilGYAp+PPTwodf3z1qE+ufUcG/Z4AyPEznmAsmjAkIjkA7Y+TAB7ZpX4X6X73DlcITGTTNN00hQfOTFuj0lA27ymTqC/nixj5TpIRLGUmB5ex55MsTQ0GisMsvADSQMh0zO3SKZs0Tmu6v2B3prUhqPzu+c6kZ3/i2vDE+wETmLLlpwjq/fMgRWrBccyk5a/VhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVtUcPblbxNixTykZeRe782DzTdK+QduZlAonVCMH3w=;
 b=Gi5hUAgYnNWTb8I3z5hmx5FG8WxmqKn4dQ0U/tjLyxEtTuwBN3QUSbL/rPGt72vmgEbsg8IRJwKxvD59uAxr2Y6eueQDaIkdAtDkoO9hqNhE8w9P5BSJC73I2ZpcvZfkvBGtiF8UBT2BRVwx/b5Kc94F4x6WQ9jzzq1C3mdOrY7zya9YZ3FPh6u9/WP7nwUdEqn6aZaCdUqlWr84EuQrHxiGuakIQL92mA2MsHQCDKACpVfWsOPMNJrBlqIMI7C99wdq04wPJ5C9n4mMNnKGwe8HNMtSwpE65JLd9UiqetKsNH/hYAoHj7mV+iWw8Oh3+MESyrN7P86oiMaVubORYA==
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com (2603:1096:405:b5::13)
 by KL1PR0601MB5774.apcprd06.prod.outlook.com (2603:1096:820:b2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 10:03:19 +0000
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b]) by TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b%4]) with mapi id 15.20.8335.007; Thu, 9 Jan 2025
 10:03:19 +0000
To: Chao Yu <chao@kernel.org>, Chunhai Guo <guochunhai@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH 1/2] f2fs: fix missing discard candidates in fstrim
Thread-Index: AQHbXPx8oQ8hJSG8D0iyeVcEHNoDB7MEZI2AgABOhYCACCl+AIABZOGA
Date: Thu, 9 Jan 2025 10:03:19 +0000
Message-ID: <a73d4f97-724e-4d42-9730-6ead37af25a1@vivo.com>
References: <20250102101310.580277-1-guochunhai@vivo.com>
 <62b14417-1297-4ed6-9ff3-b24115d433c4@kernel.org>
 <a4523b96-56eb-4b1d-a031-ec4a67c2c42b@vivo.com>
 <677e5946-3b3e-4f4a-892a-8aa8bfb3e45b@kernel.org>
In-Reply-To: <677e5946-3b3e-4f4a-892a-8aa8bfb3e45b@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB7096:EE_|KL1PR0601MB5774:EE_
x-ms-office365-filtering-correlation-id: 8eb2679b-8423-4291-566f-08dd3094d820
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VmE1QkxEY2ZEcGFlWW9ETHhqKzZhTXE4WGtMZm5lQWUvUGdKcE5WRTg1ZFRQ?=
 =?utf-8?B?VzhYM1p3ZTJIaVB3VGpRemZYK3JKdGRpWEYrdUNvOVV0U3BXR1JQNWt3cmto?=
 =?utf-8?B?RnE3UDdYRHN0NWY0UjdsN1VzSTdJWU5hMXpMSlowVXVLQkpWYndCVGxQK1Vn?=
 =?utf-8?B?UHF2UERiemNzREI4WVZLbU5lUjkvRytqRzJvT2l5ZEhvN0FHc1pjOWRrY3Q0?=
 =?utf-8?B?QUZGM1NpMWoyUnBZODdDU29hc3EzOTVDVll1Z1VPVzhHcG8wNUp4MjhuS29F?=
 =?utf-8?B?ZVdEOFJhZEYxNkxCaE85cE5EdTVSaVdaRlFjemF0UVZvU2hya09ObEVKQU1S?=
 =?utf-8?B?cFJyaEhNZFZCaGtFbkNpUXg2TFZ6TUJhaDdWV2g0R1YzWm5RZURwZlhydWs5?=
 =?utf-8?B?NjdsWUIvd2ZiUTFsMzlSMWE4amlkVmtabGpwdThkdWxON1pTMEx2YlRzbmRS?=
 =?utf-8?B?YWZLMnpRMDBlb2E0N1JTT2tKV2JIUFhKNExBVWYyaEZqVDY4RjkyVngzdW1q?=
 =?utf-8?B?eVZyK1VGNjFERDJ4Ulh5a1ZJSEdUeWIvSFBQSmxDem1uTC9PSnZxSjZZeW5V?=
 =?utf-8?B?ZDZLL1pVdDhYaE96YVJseXVQRGJsTzd0Vkl2YkdIYWxpSzN1WUpKMThjWFNm?=
 =?utf-8?B?ZDlqUE1IVnJBdlNoTk5UMERJVjBHSy9vTXpZUkdmRXAyMjdTR2dRbFpLaFBX?=
 =?utf-8?B?L3V5YW1uRWVpaEZqUzhKZ1hkUTc5SVlyVDlQVFEreDQvRENKM2pha21rWlNq?=
 =?utf-8?B?L21SRVNzSCsrQ3JhcGlia3RPamVqZWRDOGNDZ3AveWN3enFPNGdrRkFYRkh1?=
 =?utf-8?B?eE56ZFlRVDdRaFo5Y2tkeXk0ZFpwQnd6TTg3K1BvdnZwZE1jdjBmNFRKTXU4?=
 =?utf-8?B?c1VPeTcvam5aNEI3ZXA5c25vWVR4V0ZoTXYxbnlhU01HZkJqUnA1NHVnUjVp?=
 =?utf-8?B?M29BM3BQRm1NUEVJb1JQWjFIcytqanZQekN2ZXBKY1NKcHdEVlBiQVVqdVph?=
 =?utf-8?B?TFNNdlg2bHRaVFF6S0c0dlZCNlBvN1dTeXAxUkYrRWZVY3dtejBmYUc4Wmov?=
 =?utf-8?B?c0J2WG5VNjFaOEJWRG0wVjdMOHlKTExvMUV5TVAzcGxTSEtVczhNUGxDVlpZ?=
 =?utf-8?B?emhZZzlXcTZoM2tzME9OZ09mU3ZqdEE0SWhJSlZ5azI3WjN5N00xK0RINDFC?=
 =?utf-8?B?ajA5elNXRytZZmdOeWlKZXNzQ25yaXNCRmFBZ0MwU3pWVHZ3aVM2ME9wMm9S?=
 =?utf-8?B?M1JpY0VMS0pHOFZnRG1uSTNNcEhnUGlwSnJDU2d4eDI1TEdoT3RmdVRXUEIz?=
 =?utf-8?B?Ti9ocTQzYjU5K0pIQVFWazlQemgwenNnZ1RidU5NSU00dldZSWhSQkZFMUZ0?=
 =?utf-8?B?Wk9KdWRRc0F5K1Ira1pOMXlWREs2Zjd5ZlRWVW1VY29hQVo3bVpXN2ZuRisr?=
 =?utf-8?B?K1BpZzN4NWpyOEd6bXdMQUFxaHZOY2FjSUtYSlRPdlVoWmhNdXl2cEt4c0V5?=
 =?utf-8?B?L2JIQXdvRVhoMWRzM09aSmc3Q1BORVhpMCt3VnhDZzY1dDdxcWIvTmtVUXVp?=
 =?utf-8?B?N2tBZDRqNWJkSEJGd2xYYWtoT3Jvc05iTzloa3NWNDhNZHcxdkt6dkE2bFB5?=
 =?utf-8?B?YUhWZ2JUcHBvY0h0MVZJaVhaVWZoL0dRVnJXbVBsZlFPWVR0RlVvTVFSN013?=
 =?utf-8?B?dGVSMUJ6Ti9hcFlYekVrSmNRVW5wc1NnZ0F1UXBubWZGUjFPTDllQ3RJREl1?=
 =?utf-8?B?USszMnJFcGtuWnRCcjhrbHYwREY4b3dSL0MxczhJclhEMXhVTkZEWnV3dWhU?=
 =?utf-8?B?Z2g1cUdWdzRPbGdOdU1Ub0JVUk85V2N6RHAveWthdFE4R0NlNnVRVEs0bzdZ?=
 =?utf-8?B?QW96c1RwSTVDblB4eHJsbkxlTVNXTlZ1UnoyeDBkWGdiMnhYdGFodHpZeFYw?=
 =?utf-8?Q?TWYNeUaXLIoIb+ogj/owmIkuH6XGYdD4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:TYZPR06MB7096.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dE11UWcwZkkwYmZ0ai9oM3JDeitrVUk0VkF1aHZ2M1dYRzlGUVEyNVpPQUU2?=
 =?utf-8?B?OGs3SWc2enU4dDhGTmhieXIvc251bXl1L0FEUkdhYTNkOStqWGZXZ25VQi91?=
 =?utf-8?B?OTRCUysybkZoOGhwWi9uMVFmdXJyZEVJYXY3d3k2ZkZWSk45eTZtYTRjUFRi?=
 =?utf-8?B?WC9Zc0NoTjV2cTF0SUEwWW8xbkkwZkYvUW82aWZXSVNsclRaSG45NFdSTFNt?=
 =?utf-8?B?dWhtUks4MzFJVWZBczhmeFlRYjhOSWY5dURndFEyTnNZZEJKU0ZybFVQd2kz?=
 =?utf-8?B?OGF0RUovTFJQNG9vQlZkQ3hPZ0JHcXlrbW1zT2tiN3F3ZXRDSytDajRuNmpI?=
 =?utf-8?B?Mms0b1Fpa3VoeW5LRUt1ZFY2UG0reG01ZEhqN045RjBqajNwTXBnd1JMSEcv?=
 =?utf-8?B?U0ZOSHpiVDUvYXhYblczUjhrWUZ4RmZWVGhnMFNPdmN2YjQ0SFhjRHN6V1Iv?=
 =?utf-8?B?aXZNTEp6WFVyTTRqVVlCL2dnZmRhQndXYUdtWGZGOVRtOWVXRlRkVW5yZXg0?=
 =?utf-8?B?VHFocy9KOEU3cGpRV1pqM2RjY09JQUdad3p0NmJmakJSdlZTL3hoQTBsTzls?=
 =?utf-8?B?UHd1ajE3Z21MMjdqSXBiUUJmNm5TR0pkRVRJY3hHemVlRU1xVXVjRmRaOHF5?=
 =?utf-8?B?bHdJbVNoYVlwOHhjRzdiT2Z3K3h2alc5bWZWNFIwUmVuVjdCNEgvNE4xVnZx?=
 =?utf-8?B?Tk4rejdtQjNpVllvVHZuOVI3dUlLN3oremtFVGh0cGYxVWcrQ0ErVTNaYVV6?=
 =?utf-8?B?THQrdmFFOTdndjhWRHpMODkzaHZpMk8rRUhBUnpTTTNXcWxNWHQ5UVl5SDRM?=
 =?utf-8?B?aEd5QjErM3ZwMFNmOW9BMDM1aGJJYUkxU1J0RHNLUHozUlpBZm43cHBNR2t2?=
 =?utf-8?B?dVdjSlRhOUxEQzFOZEFFcFhFajZoUTNWY0E2MlZyRnROK3Z1YmkwbDVhSFpa?=
 =?utf-8?B?SkhHMFMxcDdwT0YwdUs3eWdaVjdYZ2xIbStUUkpQcUQ1WDlicWp0K2YwV2xX?=
 =?utf-8?B?KzlNS2dMcmVFb2dIeEVuY09VMW93N0I2RmNjYTltcDgzeTN4bndzVy9qMkpG?=
 =?utf-8?B?c0s5TlhScjdIU2V2bWwxNlNoeGlXQm8xbUR4TGlKYkkrUEpqZ3QrUWZ2RDlY?=
 =?utf-8?B?aXJxOHVxSXBVRHAwNVM4ZkFZZzB1dFYrNlNuTDduYnozQlpab0dwUng5RW4v?=
 =?utf-8?B?SEZyOTF1R3hzallzaEp1Qm82cFdvaVY5RHBITVUzdU1rNStGQ3hFZWhvcDB6?=
 =?utf-8?B?OXp1U2xhUFVoaW5xMkVEUDZOc203WHhVN2kvQjFBZWFtNUVwRjJrVVB1V0RE?=
 =?utf-8?B?YTJpK2VERmZBWTk2dnQ4MUtVQUF4ZUs0N1pkcEFTMGNNY3l4WXkwODJlMDZt?=
 =?utf-8?B?TlFmcHBkMWVLWkpyQkJGRFY3MmhrNDFTMlhRZVVXQkp0L2xQQU9aV0Y4RC93?=
 =?utf-8?B?Tk1jdkFtZWtFUGlMaFcyZjZTZkRBUWVoUWJJR3FBbTh2c0h4VFo1OGd4M1BE?=
 =?utf-8?B?SXAyMjFpOGgvOSs4ZGxjTmp3aFc4QkZIcmgwaTR1TzVDT1ZXUkMrSEZHRXlQ?=
 =?utf-8?B?TGg4ZUV0TmhOOXhjT0JaMEZPMitCczh4Wm5FbFc3Q3Q5ZmhrSnlUSzF5bEdS?=
 =?utf-8?B?d0tZV0NlYWVTOGZLVnUwOUtpZ1lYQzJ6Q2NJclcyS1A1aUxsVzc4bFlBVUhL?=
 =?utf-8?B?dnUycEFKeW4vRTV3ZWgxNlJwR0tSeCs5M3FVY2kvNU9JOFZVazBxdnVOUlow?=
 =?utf-8?B?djcvbGtqNUoxUmhWNXdBUGlOKzViZHVrWlJNTlVxWFAxRDlTQUdRRUpyMXp1?=
 =?utf-8?B?bUl0NS9QTnJGbGlyZDZISTAwank1aGV4V2xaVUtUeFZXZUFwbU5kUEJDMGdV?=
 =?utf-8?B?bnF3UnhiWkl4N0FRaXRRQkJiUW01S2VNNlA5U3J4MHAwRmloZHAvWXhZeDhO?=
 =?utf-8?B?dk13M3Q1THV0QnA4alRlT0tKUVZrL0VZdGY5OFlZSU5mU2lIcTYwMXp5anZV?=
 =?utf-8?B?amxrYjJ0M1d2Si9kQ0x0QnYvV0JBeTBReVUyTXM3OXdBWUdvZDdKZWw0aHVG?=
 =?utf-8?B?WlZFdzVuNmtsOWEyeWZkT3U3eGdrbFhPc09LK01BWllLSTg4cE9mb28wRENH?=
 =?utf-8?Q?djD4=3D?=
Content-ID: <09A1B22A019CC846A513165B4E9442CA@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB7096.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb2679b-8423-4291-566f-08dd3094d820
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 10:03:19.5475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QC49+SzTfp8q7GSRXIfclsNnJum80Ucu3zM3OAJnZkz5JIlunwSjwD1+/Uh6ju9EcBU7XGBspl9Otoi9o0t0Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5774
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 1/8/2025 8:46 PM, Chao Yu 写道: > On 2025/1/3 16:07,
    Chunhai Guo wrote: >> 在 1/3/2025 11:26 AM, Chao Yu 写道: >>> On 2025/1/2
    18:13, Chunhai Guo wrote: >>>> fstrim may miss candidates that n [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [40.107.44.36 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                           [40.107.44.36 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.44.36 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [40.107.44.36 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1tVpO3-0008HL-CC
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix missing discard candidates in
 fstrim
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5ZyoIDEvOC8yMDI1IDg6NDYgUE0sIENoYW8gWXUg5YaZ6YGTOg0KPiBPbiAyMDI1LzEvMyAxNjow
NywgQ2h1bmhhaSBHdW8gd3JvdGU6DQo+PiDlnKggMS8zLzIwMjUgMTE6MjYgQU0sIENoYW8gWXUg
5YaZ6YGTOg0KPj4+IE9uIDIwMjUvMS8yIDE4OjEzLCBDaHVuaGFpIEd1byB3cm90ZToNCj4+Pj4g
ZnN0cmltIG1heSBtaXNzIGNhbmRpZGF0ZXMgdGhhdCBuZWVkIHRvIGJlIGRpc2NhcmRlZCBpbiBm
c3RyaW0sIGFzIHNob3duIGluDQo+Pj4+IHRoZSBleGFtcGxlcyBiZWxvdy4NCj4+Pj4gVGhlIHJv
b3QgY2F1c2UgaXMgdGhhdCB3aGVuIGNwYy0+cmVhc29uIGlzIHNldCB3aXRoIENQX0RJU0NBUkQs
DQo+Pj4+IGFkZF9kaXNjYXJkX2FkZHJzKCkgZXhwZWN0cyB0aGF0IGNrcHRfdmFsaWRfbWFwIGFu
ZCBjdXJfdmFsaWRfbWFwIGhhdmUgYmVlbg0KPj4+PiBzeW5jZWQgYnkgc2VnX2luZm9fdG9fcmF3
X3NpdCgpIFsxXSBhbmQgdHJpZXMgdG8gZmluZCB0aGUgY2FuZGlkYXRlcyBiYXNlZA0KPj4+PiBv
biBja3B0X3ZhbGlkX21hcCBhbmQgZGlzY2FyZF9tYXAuIEhvd2V2ZXIsIHNlZ19pbmZvX3RvX3Jh
d19zaXQoKSBkb2VzIG5vdA0KPj4+PiBhY3R1YWxseSBydW4gYmVmb3JlIGYyZnNfZXhpc3RfdHJp
bV9jYW5kaWRhdGVzKCksIHdoaWNoIHJlc3VsdHMgaW4gZmFpbHVyZS4NCj4+PiBDaHVuaGFpLA0K
Pj4+DQo+Pj4gQ2FuIHlvdSBwbGVhc2UgdXNlIG5vZGlzY2FyZCBvcHRpb24gZHVlIHRvIGZzdHJp
bSBzdG9wcGVkIHRvIHJldHVybg0KPj4+IHRyaW1tZWQgbGVuZ3RoIGFmdGVyIGJlbG93IGNvbW1p
dDoNCj4+Pg0KPj4+IDVhNjE1NDkyMGZhZiAoImYyZnM6IGRvbid0IGlzc3VlIGRpc2NhcmQgY29t
bWFuZHMgaW4gb25saW5lIGRpc2NhcmQgaXMgb24iKQ0KPj4gVGhhbmsgeW91IGZvciB5b3VyIGV4
cGxhbmF0aW9uLCBidXQgSSBndWVzcyB0aGlzIGlzc3VlIGlzIG5vdCByZWxldmFudA0KPj4gdG8g
dGhpcyBjb21taXQsIGFuZCBJIHVuZGVyc3RhbmQgdGhhdCAnMCBCICgwIGJ5dGVzKSB0cmltbWVk
JyBpcyBmaW5lLg0KPj4NCj4+IFRoZSByZWFsIHByb2JsZW0gaXMgdGhhdCB0aGVyZSBhcmUgYWN0
dWFsbHkgbWFueSBjYW5kaWRhdGVzIHRoYXQgc2hvdWxkDQo+PiBiZSBoYW5kbGVkIGluIGZzdHJp
bSwgYnV0IGl0IGNhbm5vdCBmaW5kIGFueSBvZiB0aGVtLg0KPj4NCj4+IGYyZnNfdHJpbV9mcygp
DQo+PiAgICDCoMKgwqAgZjJmc193cml0ZV9jaGVja3BvaW50KCkNCj4+ICAgIMKgwqDCoMKgwqDC
oMKgIC4uLg0KPj4gICAgwqDCoMKgwqDCoMKgwqAgaWYgKGNwYy0+cmVhc29uICYgQ1BfRElTQ0FS
RCkgew0KPj4gICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghZjJmc19leGlz
dF90cmltX2NhbmRpZGF0ZXMoc2JpLCBjcGMpKSB7DQo+PiAgICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB1bmJsb2NrX29wZXJhdGlvbnMoc2JpKTsNCj4+ICAgIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0OyAvLyBOb3QgY2FuZGlk
YXRlIGlzIGZvdW5kIGhlcmUgYW5kIGV4aXQuDQo+PiAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfQ0KPj4gICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLi4NCj4+ICAgIMKgwqDC
oMKgwqDCoMKgIH0NCj4+DQo+Pj4+IHJvb3QjIGNwIHRlc3RmaWxlIC9mMmZzX21vdW50cG9pbnQN
Cj4+Pj4NCj4+Pj4gcm9vdCMgZjJmc19pbyBmaWVtYXAgMCAxIC9mMmZzX21vdW50cG9pbnQvdGVz
dGZpbGUNCj4+Pj4gRmllbWFwOiBvZmZzZXQgPSAwIGxlbiA9IDENCj4+Pj4gICAgICAgICAgICAg
bG9naWNhbCBhZGRyLiAgICBwaHlzaWNhbCBhZGRyLiAgIGxlbmd0aCAgICAgICAgICAgZmxhZ3MN
Cj4+Pj4gMCAgICAgICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDA0MDZhMDAwMDAgMDAwMDAwMDAz
ZDgwMDAwMCAwMDAwMTAwMA0KPj4+Pg0KPj4+PiByb290IyBybSAvZjJmc19tb3VudHBvaW50L3Rl
c3RmaWxlDQo+Pj4+DQo+Pj4+IHJvb3QjIGZzdHJpbSAtdiAtbyAweDQwNmEwMDAwMCAtbCAxMDI0
TSAvZjJmc19tb3VudHBvaW50IC0tIG5vIGNhbmRpZGF0ZSBpcyBmb3VuZA0KPj4+PiAvZjJmc19t
b3VudHBvaW50OiAwIEIgKDAgYnl0ZXMpIHRyaW1tZWQNCj4+Pj4NCj4+Pj4gWzFdIFBsZWFzZSBy
ZWZlciB0byBjb21taXQgZDdiYzI0ODRiOGQ0ICgiZjJmczogZml4IHNtYWxsIGRpc2NhcmRzIG5v
dCB0bw0KPj4+PiBpc3N1ZSByZWR1bmRhbnRseSIpIGZvciB0aGUgcmVsYXRpb25zaGlwIGJldHdl
ZW4gc2VnX2luZm9fdG9fcmF3X3NpdCgpIGFuZA0KPj4+PiBhZGRfZGlzY2FyZF9hZGRycygpLg0K
Pj4+Pg0KPj4+PiBGaXhlczogMjUyOTBmYTU1OTFkICgiZjJmczogcmV0dXJuIGZzX3RyaW0gaWYg
dGhlcmUgaXMgbm8gY2FuZGlkYXRlIikNCj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2h1bmhhaSBHdW8g
PGd1b2NodW5oYWlAdml2by5jb20+DQo+Pj4+IC0tLQ0KPj4+PiAgICAgIGZzL2YyZnMvc2VnbWVu
dC5jIHwgMTAgKysrKystLS0tLQ0KPj4+PiAgICAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3Nl
Z21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jDQo+Pj4+IGluZGV4IGVhZGUzNmM1ZWYxMy4uOGZl
OWY3OTRiNTgxIDEwMDY0NA0KPj4+PiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYw0KPj4+PiArKysg
Yi9mcy9mMmZzL3NlZ21lbnQuYw0KPj4+PiBAQCAtMjA3MCw3ICsyMDcwLDcgQEAgc3RhdGljIGlu
dCBmMmZzX2lzc3VlX2Rpc2NhcmQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLA0KPj4+PiAgICAg
IH0NCj4+Pj4gICAgICANCj4+Pj4gICAgICBzdGF0aWMgYm9vbCBhZGRfZGlzY2FyZF9hZGRycyhz
dHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBjcF9jb250cm9sICpjcGMsDQo+Pj4+IC0J
CQkJCQkJYm9vbCBjaGVja19vbmx5KQ0KPj4+PiArCQkJCQlib29sIHN5bmNlZCwgYm9vbCBjaGVj
a19vbmx5KQ0KPj4+PiAgICAgIHsNCj4+Pj4gICAgICAJaW50IGVudHJpZXMgPSBTSVRfVkJMT0NL
X01BUF9TSVpFIC8gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpOw0KPj4+PiAgICAgIAlzdHJ1Y3Qgc2Vn
X2VudHJ5ICpzZSA9IGdldF9zZWdfZW50cnkoc2JpLCBjcGMtPnRyaW1fc3RhcnQpOw0KPj4+PiBA
QCAtMjA5OCw3ICsyMDk4LDcgQEAgc3RhdGljIGJvb2wgYWRkX2Rpc2NhcmRfYWRkcnMoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgY3BfY29udHJvbCAqY3BjLA0KPj4+PiAgICAgIA0K
Pj4+PiAgICAgIAkvKiBTSVRfVkJMT0NLX01BUF9TSVpFIHNob3VsZCBiZSBtdWx0aXBsZSBvZiBz
aXplb2YodW5zaWduZWQgbG9uZykgKi8NCj4+Pj4gICAgICAJZm9yIChpID0gMDsgaSA8IGVudHJp
ZXM7IGkrKykNCj4+Pj4gLQkJZG1hcFtpXSA9IGZvcmNlID8gfmNrcHRfbWFwW2ldICYgfmRpc2Nh
cmRfbWFwW2ldIDoNCj4+Pj4gKwkJZG1hcFtpXSA9IHN5bmNlZCA/IH5ja3B0X21hcFtpXSAmIH5k
aXNjYXJkX21hcFtpXSA6DQo+Pj4gSSBndWVzcyB0aGlzIGNvbmRpdGlvbiAiZm9yY2UgPyB+Y2tw
dF9tYXBbaV0gJiB+ZGlzY2FyZF9tYXBbaV0iIGRpZG4ndCBjb3Zlcg0KPj4+IGFsbCBiZWxvdyBj
YXNlcywgdGhvdWdodHM/DQo+Pj4gLSBja3B0X21hcFtpXSA9PSAwIC8vIHdyaXRlIGRhdGEsIGFu
ZCB0aGVuIHJlbW92ZSBkYXRhIGJlZm9yZSBjaGVja3BvaW50DQo+Pj4gLSBja3B0X21hcFtpXSAh
PSAwIC8vIHJlbW92ZSBkYXRhIGV4aXN0ZWQgaW4gcHJldmlvdXMgY2hlY2twb2ludA0KPj4gICAg
RnJvbSB0aGUgaGFuZGxpbmcgb2YgY2twdF92YWxpZF9tYXAgaW4gdXBkYXRlX3NpdF9lbnRyeSgp
LCBJIGd1ZXNzIHRoZQ0KPj4gY29uZGl0aW9uIGNhbiBjb3ZlciBib3RoIGNhc2VzLg0KPj4gRm9y
IGV4YW1wbGUsIHdoZW4gdGhlIGNoZWNrcG9pbnQgaXMgZW5hYmxlZCwgYWxsIHRoZSBzZXQgYml0
cyBpbiB0aGUNCj4+IGNrcHRfdmFsaWRfbWFwIHJlbWFpbiBzZXQgYmVmb3JlIHRoZSBjaGVja3Bv
aW50IChldmVuIHdoZW4gdGhlIGJsb2Nrcw0KPj4gYXJlIGRlbGV0ZWQpLCB3aGljaCBtYWtlcyBp
dCBmaW5kIGFsbCB0aGUgcmlnaHQgYml0cyBpbiBib3RoIGNhc2VzLg0KPiBNeSBwb2ludCBpcyBm
b3IgZnN0cmltIGNhc2UsIHdlIG9ubHkgbmVlZCB0byBjaGVjayBkaXNjYXJkX21hcCBiaXRtYXA/
DQo+IG9uY2UgYml0KHMpIGluIGRpc2NhcmRfbWFwIGJpdG1hcCBpcyB6ZXJvLCBubyBtYXR0ZXIg
dGhlIHN0YXR1cyBvZg0KPiBiaXQocykgaW4gY2twdF9tYXAgYml0bWFwLCB3ZSBuZWVkIHRvIHRy
aWdnZXIgYSBjaGVja3BvaXQgZm9yIGZvbGxvd2luZw0KPiBkaXNjYXJkIHN1Ym1pc3Npb24/DQoN
Cg0KT2gsIHllcy4gSXQgaXMgcmVhc29uYWJsZSB0byBjaGVjayBvbmx5IHRoZSBkaXNjYXJkX21h
cCBiaXRtYXAuIFdoYXQgZG8gDQp5b3UgdGhpbmsgYWJvdXQgdGhlIGNvZGUgYmVsb3c/DQoNCmZv
ciAoaSA9IDA7IGkgPCBlbnRyaWVzOyBpKyspIHsNCiDCoMKgwqAgaWYgKGNoZWNrX29ubHkpDQog
wqDCoMKgwqDCoMKgwqAgZG1hcFtpXSA9IH5kaXNjYXJkX21hcFtpXTsNCiDCoMKgwqAgZWxzZQ0K
IMKgwqDCoMKgwqDCoMKgIGRtYXBbaV0gPSBmb3JjZSA/IH5ja3B0X21hcFtpXSAmIH5kaXNjYXJk
X21hcFtpXSA6DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoY3VyX21hcFtpXSBeIGNrcHRfbWFw
W2ldKSAmIGNrcHRfbWFwW2ldOw0KfQ0KDQpUaGFua3MsDQoNCj4NCj4gVGhhbmtzLA0KPg0KPj4g
VGhhbmtzLA0KPj4NCj4+PiBUaGFua3MsDQo+Pj4NCj4+Pj4gICAgICAJCQkJKGN1cl9tYXBbaV0g
XiBja3B0X21hcFtpXSkgJiBja3B0X21hcFtpXTsNCj4+Pj4gICAgICANCj4+Pj4gICAgICAJd2hp
bGUgKGZvcmNlIHx8IFNNX0koc2JpKS0+ZGNjX2luZm8tPm5yX2Rpc2NhcmRzIDw9DQo+Pj4+IEBA
IC0zMjc1LDcgKzMyNzUsNyBAQCBib29sIGYyZnNfZXhpc3RfdHJpbV9jYW5kaWRhdGVzKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSwNCj4+Pj4gICAgICANCj4+Pj4gICAgICAJZG93bl93cml0ZSgm
U0lUX0koc2JpKS0+c2VudHJ5X2xvY2spOw0KPj4+PiAgICAgIAlmb3IgKDsgY3BjLT50cmltX3N0
YXJ0IDw9IGNwYy0+dHJpbV9lbmQ7IGNwYy0+dHJpbV9zdGFydCsrKSB7DQo+Pj4+IC0JCWlmIChh
ZGRfZGlzY2FyZF9hZGRycyhzYmksIGNwYywgdHJ1ZSkpIHsNCj4+Pj4gKwkJaWYgKGFkZF9kaXNj
YXJkX2FkZHJzKHNiaSwgY3BjLCBmYWxzZSwgdHJ1ZSkpIHsNCj4+Pj4gICAgICAJCQloYXNfY2Fu
ZGlkYXRlID0gdHJ1ZTsNCj4+Pj4gICAgICAJCQlicmVhazsNCj4+Pj4gICAgICAJCX0NCj4+Pj4g
QEAgLTQ2MTEsNyArNDYxMSw3IEBAIHZvaWQgZjJmc19mbHVzaF9zaXRfZW50cmllcyhzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBjcF9jb250cm9sICpjcGMpDQo+Pj4+ICAgICAgCQkJ
LyogYWRkIGRpc2NhcmQgY2FuZGlkYXRlcyAqLw0KPj4+PiAgICAgIAkJCWlmICghKGNwYy0+cmVh
c29uICYgQ1BfRElTQ0FSRCkpIHsNCj4+Pj4gICAgICAJCQkJY3BjLT50cmltX3N0YXJ0ID0gc2Vn
bm87DQo+Pj4+IC0JCQkJYWRkX2Rpc2NhcmRfYWRkcnMoc2JpLCBjcGMsIGZhbHNlKTsNCj4+Pj4g
KwkJCQlhZGRfZGlzY2FyZF9hZGRycyhzYmksIGNwYywgZmFsc2UsIGZhbHNlKTsNCj4+Pj4gICAg
ICAJCQl9DQo+Pj4+ICAgICAgDQo+Pj4+ICAgICAgCQkJaWYgKHRvX2pvdXJuYWwpIHsNCj4+Pj4g
QEAgLTQ2NTMsNyArNDY1Myw3IEBAIHZvaWQgZjJmc19mbHVzaF9zaXRfZW50cmllcyhzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBjcF9jb250cm9sICpjcGMpDQo+Pj4+ICAgICAgCQlf
X3U2NCB0cmltX3N0YXJ0ID0gY3BjLT50cmltX3N0YXJ0Ow0KPj4+PiAgICAgIA0KPj4+PiAgICAg
IAkJZm9yICg7IGNwYy0+dHJpbV9zdGFydCA8PSBjcGMtPnRyaW1fZW5kOyBjcGMtPnRyaW1fc3Rh
cnQrKykNCj4+Pj4gLQkJCWFkZF9kaXNjYXJkX2FkZHJzKHNiaSwgY3BjLCBmYWxzZSk7DQo+Pj4+
ICsJCQlhZGRfZGlzY2FyZF9hZGRycyhzYmksIGNwYywgdHJ1ZSwgZmFsc2UpOw0KPj4+PiAgICAg
IA0KPj4+PiAgICAgIAkJY3BjLT50cmltX3N0YXJ0ID0gdHJpbV9zdGFydDsNCj4+Pj4gICAgICAJ
fQ0KPj4NCg0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
