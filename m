Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E75ABF725
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 May 2025 16:06:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAhbPNkq5lXiT6Skr2UiI/imAMSWuYf6z7mT8yggcS8=; b=cTIrbHdGnJU7oMICMfh+UM9cc7
	28l7XsuxYNCJcySWzPw5jl73tXUhhJydf+tEMaZ5RNSewtvJS7Vj4XpU6Biwj8w11anOS+F20pdwS
	YJTNpIf72j7S5rjGgYjpQW1jGhUZjUQOc6B4WUJQChTRLs94231geqfZKSpY+60vUq/4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uHk5Y-0000yu-Ox;
	Wed, 21 May 2025 14:06:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1uHk5U-0000yk-Dx
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 May 2025 14:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2wVfQ8/6ZuWG+D8hPEiRdh4esMcgW97oV5rixtadTG8=; b=R2S9L30g8SjIsawpYEV6PdxE2G
 zxOQ4OB1xvAhEt9WN2B9AP8LU4JvCEhj0TeXPO6+H72PkCcM33ADc1ohmixoKtLMk9xpTflPocg7P
 rxRY2mhCspCjioGA7sEXQ0foPENX9j7YZgJQ/hT3T+AGhmJc1fgcERm2I9NmplCu9aTw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2wVfQ8/6ZuWG+D8hPEiRdh4esMcgW97oV5rixtadTG8=; b=Lj/cAheCiWt9FyrcLCOzGpEAv6
 7XuoJZU7y/I+G7rOFmUTgpmXxiD4Hsj8KWFk9aucFmR9ppUm66T43aCQqG3dUKXwVCmvYY7aFQhhu
 IIxNan/Q9+DPO7yvw/vj6j0cfnx0yOeovzh/7J/OFbob84Jw6qpELEOtgt8Kbc7pBs2c=;
Received: from mail-japaneastazon11013065.outbound.protection.outlook.com
 ([52.101.127.65] helo=TYDPR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uHk5T-0004V2-94 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 May 2025 14:06:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWtPChicHBSHBIotD+CooIsAzZZ3eJxwZrqvMdi+DL61GxmLs2Tjgh+jhqVUYmdAsZEUlLr9udLraanvIVn10jJHRvzAuPF6H18+0Bun8RfqHrZ2NIzUa4VHebgfT8ALIjVX0YgaPAo/rezspsjcgwpAFHBvY7G8nvWeICF4+EI8vXfgEQSTomZNIuqBgtN4VjU0Ee+2jQk0W4vMBivEGbz8e7CCFTrPRhe0wYTAiU9rTw74SOV1UVN2GIpqqKzZPyEKqB1smUjlivGLsnpRjcFbY3rzVIokxx8yoegroYT/LYyL4t+PkFl2fOf52D4pU+5U3FAEM373SeDDgfQFnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wVfQ8/6ZuWG+D8hPEiRdh4esMcgW97oV5rixtadTG8=;
 b=Ka9cBVeVf8y2LrQfdWbySfXpqqeRW0ceYVUU1uDjkaAg07BMgaUK2yRujCb2NuchGQTDTUM+FhMHaOgeRZ5qg3yf3rBRBPXhJpxfGSp1uZLzpErWR2WO3zuox0JnhPcFuI/udYDY8oALZGm7abhNWV0UVzXss/+44n4RA3K7zC2P9vNQHdzq3WMUjtbQfwuWxBYN77hwkp4KQ/16xa/LP0pFKCl5omZ87eMnhJlRxad0kU6x+srgIKnDHJn/OZSroFeZNDROJbHnamedDdcNOKvCu8DJF7jooJfXMxwsJ6WuEGwnkjg9GmD4bSZGkMM2nel/YUdEUeMOJCYqmnj3uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wVfQ8/6ZuWG+D8hPEiRdh4esMcgW97oV5rixtadTG8=;
 b=hM7WxtnbTBsOPs58RRo2/85A6xPK6YsKmlsxyUSjwS+miyQU0nbnYt05F7o7yZAx0erMEtpCm3Bu6A5e8IrKcPCeLs1vSkWF1RSXoSP7KldU7lTlrGujPb9a/gJ9qNl6ou/opCeynlvw37X/a8BjIwLg97Z1ghrQgbqiJO1M8DhsE6DyaFJENO9nyzY0Rhf96H6NhuL5iRolLYKaycQH5GFULz1deg/yueQsa3Qf3PgiWHT4ybZhw9BMsGVuOfsxk/xxx2Bc/Iwwl3gFqbKbB9t2cKgsP56uGxhR8ezJnz17eCVhgc+747mpuEEFupp1LDcBcszCWFzY6SarC2kF5w==
Received: from TY1PPF33E28B4E6.apcprd06.prod.outlook.com (2603:1096:408::90e)
 by SEYPR06MB6506.apcprd06.prod.outlook.com (2603:1096:101:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.33; Wed, 21 May
 2025 13:51:30 +0000
Received: from TY1PPF33E28B4E6.apcprd06.prod.outlook.com
 ([fe80::a0e8:c3a8:8f3f:825c]) by TY1PPF33E28B4E6.apcprd06.prod.outlook.com
 ([fe80::a0e8:c3a8:8f3f:825c%5]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 13:51:30 +0000
To: Chunhai Guo <guochunhai@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [PATCH v3] f2fs: fix missing discard candidates in fstrim
Thread-Index: AQHbkzXTVgozripjeUWgKe9uCQaXHrNvj14AgALkiACAaxSVgA==
Date: Wed, 21 May 2025 13:51:30 +0000
Message-ID: <e0d3d08a-8809-49b7-8144-eec405464bde@vivo.com>
References: <20250312102005.2893698-1-guochunhai@vivo.com>
 <Z9GZ1kg6VVMFpomb@google.com> <3df184dd-8a8e-43e7-9b1c-6cfafc95aabe@vivo.com>
In-Reply-To: <3df184dd-8a8e-43e7-9b1c-6cfafc95aabe@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY1PPF33E28B4E6:EE_|SEYPR06MB6506:EE_
x-ms-office365-filtering-correlation-id: d4ce076f-faf6-4b17-7c8f-08dd986e96e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|13003099007; 
x-microsoft-antispam-message-info: =?utf-8?B?TzdtUmFUZ0g3c0UyR2ozbUR0aVpPTURtamVDRVBnd2RYZU94QTBLUjA0c0o0?=
 =?utf-8?B?ZjNQQmZLK1dNQzluUFREQUlIenBDOHRvSDJjVTJhTmM2Q1ZWTFZiNWEvRGRi?=
 =?utf-8?B?bXprRnltWDlSdEdrNkZUZ1psbGtYT2paajVudEZXY3JvaExzYW8vZUpRQzBP?=
 =?utf-8?B?dHVQSTBnRmx5OXoyTXl5SXNENjRkc2NDOVJlbGtQb1JEdHlRTzk0UGthSVo0?=
 =?utf-8?B?UGpYM2ZDZW9xTkFQOEJPZFVsSTFBbDE3MHdQYlo3ZGEvcFk2SUFOQjBXV0Vn?=
 =?utf-8?B?ZWxaVWhSc042bCtWM3IzNWtlQVE1MDgyUXFHQlY2N0NUcElNL2lVd3NPeERY?=
 =?utf-8?B?cE5seVUvRXB0empzQ0FXTVlRRW56OHJUaGJ4WU1ielBPeEVWdUZLMVVvazJt?=
 =?utf-8?B?T2N3eExiYk1TRWlqUmszZjc2eDZpZHlOVm13b3RqNGVTeUQxVWFEUTFZM2xx?=
 =?utf-8?B?TTRSTGtUc1F6UGlOcVNmeG9nYkM2VCtMTnNuVUd4bmhibmZseXFpRHhJNU03?=
 =?utf-8?B?Sms0aTdaakd0TnF6bEZ5VktlRjBWZDZpT2NWTDczOHZ1NzVXV0Uza2F5d2k4?=
 =?utf-8?B?b3ZDS1lhbUo3MTU3emNRWTdlbGJuckRyMkdUbnFoUjduZGFhZ2FHcWNqcEwy?=
 =?utf-8?B?aVhKUHVFZWQ2eFBtZGhUM1IxYmxmYi9OMWVOYmdOVGk1YU9WYlExdE1YVlc5?=
 =?utf-8?B?bWZsZ1NST1pBMC8wN0NvSWMzWFhwY0xvSlloMGFFd2NFdzRMdEdhTUFIMHpx?=
 =?utf-8?B?SC8yaWplVU9XQ2lLVU5GTXl6a2l0LzJmdjd6Q0UyYk5RK2RnaGFubnp5aW5l?=
 =?utf-8?B?Z0NTcnZSanVsT3VBdW9xbGh3OHJPVUk5a3BsM0xZYlJMKzE5NTNDeU8vSXMy?=
 =?utf-8?B?T21yR3BWZ3UwL3ZFTmZjdzhKOFd1UzI1ZGVoWi9VUmtiQ1lZdTllVmVYdkZP?=
 =?utf-8?B?OFZLZitLTjB2aytBYVpCLzBlbWlHTW8vMktYZFVkUGd5bG9FME4xTkpaSzdR?=
 =?utf-8?B?MC9GcU9Yd2p4YTlJdTVpRkZyZXVqYjFQcWRVUU5PaVQvSlNvZzBobENMakc1?=
 =?utf-8?B?ZVdpS2VrQVJES1lOaXVkZjQzcjlDdzRZTTNsVVpnZ0o2RUlGUllxa0JtTUlN?=
 =?utf-8?B?dTlKRFZnWVRMTG5jQUlsRVVnZ1g0ZUErRnZhamRFSUlRdXdLSlBGZTk4RnlR?=
 =?utf-8?B?TFBQQVdod2JVelIwMWFvSUp6TGlZWEthZTVqVk9NMGcyb2p5TUtRS0ZiMUZC?=
 =?utf-8?B?U0RqSFcxckwwTC94Q210dnQ3YWZtcVlld01YTEhZRDZrYzdaYmExTUhtY0FR?=
 =?utf-8?B?QWZZdlF2Zlg0Tk15S0NwQlE3MDFrbVBhZlI1TUZLMEhOOWJYV0Q0WTJMTjUy?=
 =?utf-8?B?L2dUd0QzYmJQUlVqemFNWVFJRmF0eWZNWTdHOXlmbHpHdEsxVTU3L203VENW?=
 =?utf-8?B?a1RPN2JPcGFFRE5Ma05rUWI3REZCYUpLWjBlL2dLUUtlSC8yOW5tc3Z4dTdK?=
 =?utf-8?B?TmdGeWs4anVlUzJjcGg5RldzTjR1RlJaSlZxZXBRYkZ2WFE4eEw2SWQwNDFZ?=
 =?utf-8?B?enNLWG1wQXpXeGp0R2ZBeXJqN1ZtRW9SdTlFK0dHM2FZbVp4RVhPVTRxREtZ?=
 =?utf-8?B?SWgzM0NoMXgzcnBUVFZWWG5rNWtVNzZFZWx2VkdGOUYxZVpMRG1DeEdDb2V0?=
 =?utf-8?B?dGZ5UENnc0tIZWU4T09YMWFremFmZmRQMk56SjlpaWlhSC8rQjIvT1k2Q0tv?=
 =?utf-8?B?N2pxa2NZQW9HTG5SaXlYbzhrWHlaU1FZSGhaY20rcStKNHRPWmFOU1RZK0w2?=
 =?utf-8?B?cml4N21zczFibDg2VXp2RTh5aFVtY0xwbEZlMnVlbUlzRUY0cGk2SnZ1NGhl?=
 =?utf-8?B?a0FuRmFxNElsVmp6VmVqTExjVm1FSXBFRzc1eVE1KytZeFl6UnZ2NVg4SmRW?=
 =?utf-8?B?ekIrWC9lQzQyRDBGN1RNYTVtcXpYY1NHQy82M0crYnNDTUZzdEZaSUJCNjlo?=
 =?utf-8?Q?iiHdD4zslaE/Z35E4duU3AT4WlthMU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:TY1PPF33E28B4E6.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVhXNGdMN2V3ZXFlcWxaeUdwcWR4Mkh1Vm8wM055a1ptek93cGVkQnFkRkRl?=
 =?utf-8?B?MGxCV0JCb3JhMHNibVFqMjJSUWpmZEFWWWM2N092SDZlN0VMMVVIMG55OEJM?=
 =?utf-8?B?d0ErOXpuZWJSaTFIaHgvcm1URk5VdGRsaDB4NXRnenZBcHNveFhMU0QwMFIr?=
 =?utf-8?B?U1JRWmlPLzI3ZjhtMEdtRDNTZFQxaUxvb0RyZGJ6cHdPUXM4TjBHZDJnYTlm?=
 =?utf-8?B?V0lpWGdQUldsZG5wcHdSdlQ0TVlPZHFwMGI0Vy9XbTdjTm0yVG1HQTFzUVNC?=
 =?utf-8?B?QkZ6a2tKaHYvQ3Y4NGRDNG5uV0M2NUlaOVA2a0wrU0JBc2NkeElqZnNEVTNm?=
 =?utf-8?B?Z3JFMlBHSVcvN1RSRytDUExiQVFvRy9tTjVMWWlkbVVoRkNMNnRmR0c2bXBz?=
 =?utf-8?B?K0tER1VidjJtSW5NdlVVVHdJNHpUQ3AzOHVDVmVKZkI3YXZZdkRKWHVHVDNp?=
 =?utf-8?B?OFN4OHF2RUZBdTFtakRiMDRwbUZBd3djUWJRdVpiNGxIZnJuYlBFbUN4NllH?=
 =?utf-8?B?OWtoY2QyZzVZM3I0bHVQK250d3BIMHdaWDYwQmpKQVArR2I1dkJ4UTdoWk53?=
 =?utf-8?B?aXZsVEdvN0cvSWZOUzlwVWppaFJSUkg2ZncyZThkaVc2bGZTNnI2UElIM0cx?=
 =?utf-8?B?dGRaa2QvVWxsMDZTSkhqQk56R0tjR1FnQUs1SThHaWNqeDVBb0ErZXpRNEFj?=
 =?utf-8?B?NTMzRGdLTDRVOTBMNEdSaFBOVWF3TmhPY1ZQMkh1cWtYRG10aVdobUJUTmo4?=
 =?utf-8?B?VHFNaVJ5YnJvWkhXM24rN09tZDY5b2plS01JeW82WkV1Y0tKa3JMak5LeWFS?=
 =?utf-8?B?SEJGT2F3aGcwdGI3TERlNUdnTXMzNjU0T00xL0ZEekFoQXltTzZsYnNTSDRt?=
 =?utf-8?B?aTRBWXpQWldIRFVDZHR0WXpPbDVYVTFoVUlGWVRWa1NlVTBJMUxQQVpYZDNk?=
 =?utf-8?B?V3JJdmFjS3FKeTRLQ1YzNGNTRkQ1dEhiN1dlcElvNTNJdGwzaG4zeThUaHBs?=
 =?utf-8?B?YXltUHF3RmhKS3BXRjFDOE1hWi9NbnZTeUw3OTQrQ2kwMmpsQzlnZTZkMVRr?=
 =?utf-8?B?ay9pZ0QxckJGOTViTGZiNkdVWnIyZzlJSUJDSDkvL1hVMjUyRHBhUG1SSUsz?=
 =?utf-8?B?Uy9sZVlmNUhvZWtPaHJaSGF0REdsZW85ZDl6ckFSaXp3ZUJLRVlRZHVua3VB?=
 =?utf-8?B?MXdtV0tQRmQ0dW9rZ3Z3YndQR1RZK1FMVDFjOFJCbmxJOVRkb3lnbUVkWDVE?=
 =?utf-8?B?b0ZZMnZweXJDMHNqajNnemgzN1IyL0dIdTd5NGJ0MUFzdWo1aTU3K09UbGZD?=
 =?utf-8?B?dHZNcmNkdFAwd2dLRUFUVmo5Q0ZqeGF3aGh1ZHIxeEZZdmpqUnFlaFIza1gy?=
 =?utf-8?B?bVBEYW0xVThRZVk2bVhjTjQ0bkdOc213dWJScDJQTGp3eHExeDVqM3lqZVNK?=
 =?utf-8?B?R3ZpMGh1dzhiajFyNnJ4SnN6TFNnQ3IvRXNlTE1pV1FkYWZTVGpvWHd4QjJr?=
 =?utf-8?B?OE03QWNwcU05MFNKKzJGbm5QMVFpQlJXeTZIdXJMVGJVV1lPSmszdEpKeUxj?=
 =?utf-8?B?UmxJaWVJNFB6YVBrVnNSUkU5VXBYVjN1STd0cU1UUGRmaWt5VWJXeGJiUkRR?=
 =?utf-8?B?VzlhcUZmbi9ianNQTEF5VGh1WENrTVNFMms5NDZqbW5HeWhkdS83dXBBMUhJ?=
 =?utf-8?B?eStSQ200OXhISE0vN2VVOWE4em9oSmRjNEE0RFdhbUhYVGtBb0FqTXE5S3Ax?=
 =?utf-8?B?c2V2bXZ5TzFqYWYvZkp5dVJiTWh0WXJHYldqaEUzdmhmWE5tY1VZWlJUZjNq?=
 =?utf-8?B?OUZRSzhBVldVNThJdjdxa0xrbFVsSXhidG16QUU3TkdzLzNMa2crZWRGcDJU?=
 =?utf-8?B?eTNMV1BPTkg1S3A4OHVhSGJKdGsyZ1FEUVo3VTF5RHZYOHpqdi9aVVd3ZGZk?=
 =?utf-8?B?eEl0ZnpRSElUb0lpSU5JOUhaRnNJdzcyUGhHMk9tSlVmM2RscWtxZ1lYNHRS?=
 =?utf-8?B?VDZDNlQvZ1h3OHZ2ZGREbmk2Vm93bXQ5cGFLMmV4cVZkUi91SmswTGhPbXVp?=
 =?utf-8?B?REZReDdYbGJCNzJNUS83VTBWQnpnQ21VS2dzM3lYQTh5aDFJUEx5ZkNvbVM5?=
 =?utf-8?Q?R+CY=3D?=
Content-ID: <0BC9ACE24E806F4BA91EEE16BFFE281E@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY1PPF33E28B4E6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ce076f-faf6-4b17-7c8f-08dd986e96e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 13:51:30.1701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xkhwhJ71pOYdoOYPA0MzfpVcXqc0Uh8CbWjZo+DZu8+06LSUoHp/W0G0Tkq4XWqsqaaMCLZBGo5JAHK/R2cREg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6506
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "0e5755722a66",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 3/14/2025 6:38 PM, Chunhai Guo 写道: > 在 3/12/2025
    10:27 PM, Jaegeuk Kim 写道: >> On 03/12, Chunhai Guo wrote: >>> fstrim
   may miss candidates that need to be discarded, as shown in the >>> e [...]
    
 
 Content analysis details:   (-0.3 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 ARC_VALID              Message has a valid ARC signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
                             trust
                             [52.101.127.65 listed in list.dnswl.org]
X-Headers-End: 1uHk5T-0004V2-94
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix missing discard candidates in
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

5ZyoIDMvMTQvMjAyNSA2OjM4IFBNLCBDaHVuaGFpIEd1byDlhpnpgZM6DQo+IOWcqCAzLzEyLzIw
MjUgMTA6MjcgUE0sIEphZWdldWsgS2ltIOWGmemBkzoNCj4+IE9uIDAzLzEyLCBDaHVuaGFpIEd1
byB3cm90ZToNCj4+PiBmc3RyaW0gbWF5IG1pc3MgY2FuZGlkYXRlcyB0aGF0IG5lZWQgdG8gYmUg
ZGlzY2FyZGVkLCBhcyBzaG93biBpbiB0aGUNCj4+PiBleGFtcGxlcyBiZWxvdy4NCj4+Pg0KPj4+
IFRoZSByb290IGNhdXNlIGlzIHRoYXQgd2hlbiBjcGMtPnJlYXNvbiBpcyBzZXQgd2l0aCBDUF9E
SVNDQVJELA0KPj4+IGFkZF9kaXNjYXJkX2FkZHJzKCkgZXhwZWN0cyB0aGF0IGNrcHRfdmFsaWRf
bWFwIGFuZCBjdXJfdmFsaWRfbWFwIGhhdmUNCj4+PiBiZWVuIHN5bmNlZCBieSBzZWdfaW5mb190
b19yYXdfc2l0KCkgWzFdLCBhbmQgaXQgdHJpZXMgdG8gZmluZCB0aGUNCj4+PiBjYW5kaWRhdGVz
IGJhc2VkIG9uIGNrcHRfdmFsaWRfbWFwIGFuZCBkaXNjYXJkX21hcC4gSG93ZXZlciwNCj4+PiBz
ZWdfaW5mb190b19yYXdfc2l0KCkgZG9lcyBub3QgYWN0dWFsbHkgcnVuIGJlZm9yZQ0KPj4+IGYy
ZnNfZXhpc3RfdHJpbV9jYW5kaWRhdGVzKCksIHJlc3VsdGluZyBpbiB0aGUgZmFpbHVyZS4NCj4+
IEkgdGhpbmsgd2UgbmVlZCB0byBmaXggdGhlIGFib3ZlIGxvZ2ljLg0KDQpIaSBKYWVnZXVrLA0K
DQpDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUgc29tZSBhZHZpY2Ugb24gaG93IHRvIGZpeCB0aGUg
YWJvdmUgbG9naWMgd2hlbiB5b3UgaGF2ZSBhIG1vbWVudD8NCg0KVGhhbmtzLA0KDQoNCj4NCj4g
SGkgSmFlZ2V1aywNCj4NCj4gSSBpbml0aWFsbHkgYXR0ZW1wdGVkIHRvIGFkZHJlc3MgdGhpcyBp
c3N1ZSBieSBjaGVja2luZyB3aGV0aGVyDQo+IHNlZ19pbmZvX3RvX3Jhd19zaXQoKSBydW5zIGJl
Zm9yZSBhZGRfZGlzY2FyZF9hZGRycygpLiBUaGUNCj4gaW1wbGVtZW50YXRpb24gY2FuIGJlIGZv
dW5kIGluIHRoZSBWMSBwYXRjaCBoZXJlOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1mMmZzLWRldmVsLzIwMjUwMTAyMTAxMzEwLjU4MDI3Ny0xLWd1b2NodW5oYWlAdml2by5jb20v
DQo+DQo+IEhvd2V2ZXIsIGFmdGVyIGRpc2N1c3Npbmcgd2l0aCBDaGFvLCBJIHJlYWxpemVkIHRo
YXQgcGVyaGFwcyBhIGJldHRlcg0KPiB3YXkgaXMgdG8gZmluZCBhbGwgdGhlIGRpc2NhcmQgYmxv
Y2tzIGJhc2VkIG9ubHkgb24gZGlzY2FyZF9tYXAuIFRoaXMNCj4gYXBwcm9hY2ggaXMgbXVjaCBz
aW1wbGVyIGFuZCBtYWtlcyBhZGRfZGlzY2FyZF9hZGRycygpIGluZGVwZW5kZW50IG9mDQo+IHRo
ZSBwcmUtcnVuIG9mIHNlZ19pbmZvX3RvX3Jhd19zaXQoKS4NCj4NCj4gQ291bGQgeW91IHBsZWFz
ZSBkZXRhaWwgeW91ciBvcGluaW9uPw0KPg0KPiBUaGFua3MsDQo+DQo+DQo+Pj4gVGhlIGNvZGUg
bG9naWMgY2FuIGJlIHNpbXBsaWZpZWQgZm9yIGFsbCBjYXNlcyBieSBmaW5kaW5nIGFsbCB0aGUN
Cj4+PiBkaXNjYXJkIGJsb2NrcyBiYXNlZCBvbmx5IG9uIGRpc2NhcmRfbWFwLiBUaGlzIG1pZ2h0
IHJlc3VsdCBpbiBtb3JlDQo+Pj4gZGlzY2FyZCBibG9ja3MgYmVpbmcgc2VudCBmb3IgdGhlIHNl
Z21lbnQgZHVyaW5nIHRoZSBmaXJzdCBjaGVja3BvaW50DQo+Pj4gYWZ0ZXIgbW91bnRpbmcsIHdo
aWNoIHdlcmUgb3JpZ2luYWxseSBleHBlY3RlZCB0byBiZSBzZW50IG9ubHkgaW4NCj4+PiBmc3Ry
aW0uIFJlZ2FyZGxlc3MsIHRoZXNlIGRpc2NhcmQgYmxvY2tzIHNob3VsZCBldmVudHVhbGx5IGJl
IHNlbnQsIGFuZA0KPj4+IHRoZSBzaW1wbGlmaWVkIGNvZGUgbWFrZXMgc2Vuc2UgaW4gdGhpcyBj
b250ZXh0Lg0KPj4+DQo+Pj4gcm9vdCMgY3AgdGVzdGZpbGUgL2YyZnNfbW91bnRwb2ludA0KPj4+
DQo+Pj4gcm9vdCMgZjJmc19pbyBmaWVtYXAgMCAxIC9mMmZzX21vdW50cG9pbnQvdGVzdGZpbGUN
Cj4+PiBGaWVtYXA6IG9mZnNldCA9IDAgbGVuID0gMQ0KPj4+ICAgICAgICAgICBsb2dpY2FsIGFk
ZHIuICAgIHBoeXNpY2FsIGFkZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFncw0KPj4+IDAgICAg
ICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwNDA2YTAwMDAwIDAwMDAwMDAwM2Q4MDAwMDAgMDAw
MDEwMDANCj4+Pg0KPj4+IHJvb3QjIHJtIC9mMmZzX21vdW50cG9pbnQvdGVzdGZpbGUNCj4+Pg0K
Pj4+IHJvb3QjIGZzdHJpbSAtdiAtbyAweDQwNmEwMDAwMCAtbCAxMDI0TSAvZjJmc19tb3VudHBv
aW50IC0tIG5vIGNhbmRpZGF0ZSBpcyBmb3VuZA0KPj4+IC9mMmZzX21vdW50cG9pbnQ6IDAgQiAo
MCBieXRlcykgdHJpbW1lZA0KPj4+DQo+Pj4gUmVsZXZhbnQgY29kZSBwcm9jZXNzIG9mIHRoZSBy
b290IGNhdXNlOg0KPj4+IGYyZnNfdHJpbV9mcygpDQo+Pj4gICAgICAgZjJmc193cml0ZV9jaGVj
a3BvaW50KCkNCj4+PiAgICAgICAgICAgLi4uDQo+Pj4gICAgICAgICAgIGlmIChjcGMtPnJlYXNv
biAmIENQX0RJU0NBUkQpIHsNCj4+PiAgICAgICAgICAgICAgICAgICBpZiAoIWYyZnNfZXhpc3Rf
dHJpbV9jYW5kaWRhdGVzKHNiaSwgY3BjKSkgew0KPj4+ICAgICAgICAgICAgICAgICAgICAgICB1
bmJsb2NrX29wZXJhdGlvbnMoc2JpKTsNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgZ290byBv
dXQ7IC8vIE5vIGNhbmRpZGF0ZXMgYXJlIGZvdW5kIGhlcmUsIGFuZCBpdCBleGl0cy4NCj4+PiAg
ICAgICAgICAgICAgICAgICB9DQo+Pj4gICAgICAgICAgICAgICAuLi4NCj4+PiAgICAgICAgICAg
fQ0KPj4+DQo+Pj4gWzFdIFBsZWFzZSByZWZlciB0byBjb21taXQgZDdiYzI0ODRiOGQ0ICgiZjJm
czogZml4IHNtYWxsIGRpc2NhcmRzIG5vdA0KPj4+IHRvIGlzc3VlIHJlZHVuZGFudGx5IikgZm9y
IHRoZSByZWxhdGlvbnNoaXAgYmV0d2Vlbg0KPj4+IHNlZ19pbmZvX3RvX3Jhd19zaXQoKSBhbmQg
YWRkX2Rpc2NhcmRfYWRkcnMoKS4NCj4+Pg0KPj4+IEZpeGVzOiAyNTI5MGZhNTU5MWQgKCJmMmZz
OiByZXR1cm4gZnNfdHJpbSBpZiB0aGVyZSBpcyBubyBjYW5kaWRhdGUiKQ0KPj4+IFNpZ25lZC1v
ZmYtYnk6IENodW5oYWkgR3VvIDxndW9jaHVuaGFpQHZpdm8uY29tPg0KPj4+IC0tLQ0KPj4+IHYy
LT52MzogQWRkIGYyZnNfYnVnX29uKCkgdG8gbWFrZSBzdXJlIGl0IG5ldmVyIGlzc3VlcyBkaXNj
YXJkIHRvIHZhbGlkIGRhdGEncyBibG9jayBhZGRyZXNzLg0KPj4+IHYxLT52MjogRmluZCBhbGwg
dGhlIGRpc2NhcmQgYmxvY2tzIGJhc2VkIG9ubHkgb24gZGlzY2FyZF9tYXAgaW4gYWRkX2Rpc2Nh
cmRfYWRkcnMoKS4NCj4+PiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1k
ZXZlbC8yMDI1MDEwMjEwMTMxMC41ODAyNzctMS1ndW9jaHVuaGFpQHZpdm8uY29tLw0KPj4+IC0t
LQ0KPj4+ICAgIGZzL2YyZnMvc2VnbWVudC5jIHwgOCArKysrLS0tLQ0KPj4+ICAgIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYw0KPj4+IGluZGV4IDg2
ZTU0N2YwMDhmOS4uYzhhZDhlM2JmZWJiIDEwMDY0NA0KPj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVu
dC5jDQo+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMNCj4+PiBAQCAtMjA3NSw3ICsyMDc1LDYg
QEAgc3RhdGljIGJvb2wgYWRkX2Rpc2NhcmRfYWRkcnMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LCBzdHJ1Y3QgY3BfY29udHJvbCAqY3BjLA0KPj4+ICAgIAlpbnQgZW50cmllcyA9IFNJVF9WQkxP
Q0tfTUFQX1NJWkUgLyBzaXplb2YodW5zaWduZWQgbG9uZyk7DQo+Pj4gICAgCXN0cnVjdCBzZWdf
ZW50cnkgKnNlID0gZ2V0X3NlZ19lbnRyeShzYmksIGNwYy0+dHJpbV9zdGFydCk7DQo+Pj4gICAg
CXVuc2lnbmVkIGxvbmcgKmN1cl9tYXAgPSAodW5zaWduZWQgbG9uZyAqKXNlLT5jdXJfdmFsaWRf
bWFwOw0KPj4+IC0JdW5zaWduZWQgbG9uZyAqY2twdF9tYXAgPSAodW5zaWduZWQgbG9uZyAqKXNl
LT5ja3B0X3ZhbGlkX21hcDsNCj4+PiAgICAJdW5zaWduZWQgbG9uZyAqZGlzY2FyZF9tYXAgPSAo
dW5zaWduZWQgbG9uZyAqKXNlLT5kaXNjYXJkX21hcDsNCj4+PiAgICAJdW5zaWduZWQgbG9uZyAq
ZG1hcCA9IFNJVF9JKHNiaSktPnRtcF9tYXA7DQo+Pj4gICAgCXVuc2lnbmVkIGludCBzdGFydCA9
IDAsIGVuZCA9IC0xOw0KPj4+IEBAIC0yMDk3LDkgKzIwOTYsMTAgQEAgc3RhdGljIGJvb2wgYWRk
X2Rpc2NhcmRfYWRkcnMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgY3BfY29udHJv
bCAqY3BjLA0KPj4+ICAgIAl9DQo+Pj4gICAgDQo+Pj4gICAgCS8qIFNJVF9WQkxPQ0tfTUFQX1NJ
WkUgc2hvdWxkIGJlIG11bHRpcGxlIG9mIHNpemVvZih1bnNpZ25lZCBsb25nKSAqLw0KPj4+IC0J
Zm9yIChpID0gMDsgaSA8IGVudHJpZXM7IGkrKykNCj4+PiAtCQlkbWFwW2ldID0gZm9yY2UgPyB+
Y2twdF9tYXBbaV0gJiB+ZGlzY2FyZF9tYXBbaV0gOg0KPj4+IC0JCQkJKGN1cl9tYXBbaV0gXiBj
a3B0X21hcFtpXSkgJiBja3B0X21hcFtpXTsNCj4+PiArCWZvciAoaSA9IDA7IGkgPCBlbnRyaWVz
OyBpKyspIHsNCj4+PiArCQlkbWFwW2ldID0gfmRpc2NhcmRfbWFwW2ldOw0KPj4+ICsJCWYyZnNf
YnVnX29uKHNiaSwgKGN1cl9tYXBbaV0gXiBkaXNjYXJkX21hcFtpXSkgJiBjdXJfbWFwW2ldKTsN
Cj4+PiArCX0NCj4+PiAgICANCj4+PiAgICAJd2hpbGUgKGZvcmNlIHx8IFNNX0koc2JpKS0+ZGNj
X2luZm8tPm5yX2Rpc2NhcmRzIDw9DQo+Pj4gICAgCQkJCVNNX0koc2JpKS0+ZGNjX2luZm8tPm1h
eF9kaXNjYXJkcykgew0KPj4+IC0tIA0KPj4+IDIuMzQuMQ0KPg0KDQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
