Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3963FB1E525
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Aug 2025 10:59:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V53PK2IwS5mAFUWSIjGUBf5ONVSlbvejaX8/p6qkiAg=; b=goAGr8cYKF3TGTNx9K14nbzViJ
	gY9eN43UAH93/r0y2TF4Z48hJoOLaQQcJMHw/BxVnzKikzPt3vTBdzVk0nPtcH8ZWj108vaaeioGS
	xnod5Tc1BohwNBfQBqQWlAbx2T/J8ef9NSNHBuCg/1SXrzY0xh7eB5F10f2j8umEv6NA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ukIx2-00011X-C6;
	Fri, 08 Aug 2025 08:59:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1ukIx0-00011O-Er
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 08:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=35vnqT0Pwb7/ULCRChoERa/pUTomL/D4RodpISeDTdg=; b=fx6e/qmL7Fy1Q8/omKWI1XTTYm
 tNGPdCnyhqq3jwQc6nAyPqMGA8Q4pAH/l7PNnYFK9LFQI/2nRo7oZezXVE7TQX+BJjxB95TqipZfY
 cRJfK1D2MFrarMZEr1blq5Os4aUnNUXwVJSbOVU1bNjQ092GvSSOKDQTYNTsBWFC6r10=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=35vnqT0Pwb7/ULCRChoERa/pUTomL/D4RodpISeDTdg=; b=jjPtlDv9Jxzw2lKzGILmZLPcYH
 ej5h6d0LYKVocGNaFO1smnoP8rETI5UPDmLACNVRCFT6ri4zv5CftV42ZWZKeyQCzD1aXUxT0P5BE
 GUP/Ao3b05TLWx2LTR1rTpuT6728hfEqem6vgW7TqBoWnrDtR4Ur2cEEL43OX3RbydbI=;
Received: from mail-japaneastazon11013060.outbound.protection.outlook.com
 ([52.101.127.60] helo=TYDPR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ukIx0-0000q6-79 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 08:59:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8kQ55ZWsYMvVwOMewiq3cPkLJPRFHWYM+fQrra0mU6sQ+Loo7y7DiHLagoSyGVCs8mon0xoe/h+sWNOd7zU/n3lS4VaeC4StWG6vQC5eWKSPiSlQNLF4zhMZJB/cKoTu/tU1iKOxriAGhC+7xlr0DNM8mm0OuKjqr/C4z/VbHT5H3myAwjZvx5Jv/MLD5/3aMLnuLG8XKVSPtLpvT5dIOOhlBdkSHwdIuh6hpogQ4g6w64l7cwsFljsBuLaSHktyyfW/3p/vuEQQWAowVWZInSJElJceqksU3lxefdAUfNUO1NfAbgsK5eAtMWzl0IhpnqZ/io03KERI2ZbQwCYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35vnqT0Pwb7/ULCRChoERa/pUTomL/D4RodpISeDTdg=;
 b=daS8BgO7qz2xkUi+mLwdYE4O4EbSd7hrUBKrRCXNJYsIIBpZ+PgUgqW35G0OCPDo/I9eWlDEdMVeS+BXEhzy5C5o5mIyCCDKwK0AwYXDmHmlvKPdmsX5R2dyAEg2AnGb4pxognLYNk/ndSEldJOMbYuZCkHFEulIzuIuydk5/PS4UxhCDdciH3ODYm/X55PYxeVTU6txHeJf5kF4xa6p7E37awAIfOzUIVRjmPxXuO4gWzy+z/Y7BU2RQznBIv3xrOqbRZgeyVEbg0iPXOA84xavyPk0KXqGgTRmq25i/Ma2E0zUBQWMq8HoqOKWOumMk2byO8W9Fv1yoG3nwFZpYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35vnqT0Pwb7/ULCRChoERa/pUTomL/D4RodpISeDTdg=;
 b=CDs8LWObWKvyd5HtASoley4oj27xL8mrRc92PN/VF3dPuvuWwhqm9PVeRPXHwr5EVilU/FiyGv4FK5nyKNrsX7NXjxDV6h4NIEqQ/RNuntV0b94g5uswtSBlzkGlUXmwzeZ7EEZCHFIILmizJss2Yi1dFm8QteGxKB+sxI/KmWwknAHZv3iEK06dk0Rq6Ru4ZE3n3gr/Sz7pAjetgb5AKNSJJhsaK6gKySWx9IWpS0jUtakdLcUWZ5INnJBWmAodfbELUeY5xh+UlqOCLcoazygJchSBcphTs+B5J5WSsQNat/hRXPwMeaYynZsdlVOGEDSAXZoYkypfh+9B+nIf6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com (2603:1096:400:32f::14)
 by KL1PR06MB6041.apcprd06.prod.outlook.com (2603:1096:820:cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Fri, 8 Aug
 2025 08:59:38 +0000
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::4f2:e048:7c93:f263]) by TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::4f2:e048:7c93:f263%5]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 08:59:37 +0000
Message-ID: <ef339cbb-5179-4c4d-9315-d331e3a8f31d@vivo.com>
Date: Fri, 8 Aug 2025 16:59:35 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20250808072939.202357-1-liaoyuanhong@vivo.com>
 <459de7d9-970a-4921-b16d-d8ee658f86a8@kernel.org>
Content-Language: en-US
In-Reply-To: <459de7d9-970a-4921-b16d-d8ee658f86a8@kernel.org>
X-ClientProxiedBy: TYCPR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:405:1::20) To TY0PR06MB5579.apcprd06.prod.outlook.com
 (2603:1096:400:32f::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR06MB5579:EE_|KL1PR06MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: 5361a983-6ef3-4847-da10-08ddd659e6ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFpZMnhBd2lxbFJ0WXdFNVlKc3MzNmVheGNpWHNON21abzV6T0FJaTNxd25N?=
 =?utf-8?B?OHZwYjd6RXczK2NpZ24zWnJoRGJEWDFZbFVjUTQ5dXFQSzRLMVRLKzdHN0FM?=
 =?utf-8?B?Z1Rkb0Fia0FRbEVaVlU2cWJMd205ek9YU0RBODV4VW1OdDM3WDhPczZWTnMw?=
 =?utf-8?B?MlJrVFBJRUIweFlSY2xoTUIzNFpzbDZtVTBtd2lyLzhPeXVvdDJ6ZmlrRTI1?=
 =?utf-8?B?cTlmcngrVlY1WUF0dFphNVZQa3RrcXM0dWtlTjZ6cnFWRXhvcXQ4emlrKzNa?=
 =?utf-8?B?bEppLzBrSzdyUlNSMW5tZnYwUHR3NkR2S1YxQ1BENXNtMVc0dEpUaVBOMDBs?=
 =?utf-8?B?ZVBIZFZGZkExbGU0MzJzZG5uZUYzQVl2cmVZNWJpMFc3dTZXL1Vya242eDhm?=
 =?utf-8?B?aWN6S0VmUU9va0FQZVBrWVJ5Q2syMW9pRkN4cVoyUzB1Zkw4ZE5nSzZxanQ3?=
 =?utf-8?B?Z3cxQmxzTGhvQ3VRS0sxQisyNkFIYWZaVER5RmxNSkNTei93c2p1T3N5Ly9P?=
 =?utf-8?B?dXlrd2xHN3BYM1JPOFliTlI2YlQxTkJSSmlVUFdEVlhRSmZtcTJSY2hmVFY1?=
 =?utf-8?B?VU80cFJxNFYyN05nZmNLR3Y5NHZxMlVLR1k3TkNrZlRiNkxvQmlZc2kzUDFE?=
 =?utf-8?B?UXRsU1dVWWVrQUVsaUZTNU9MbjhJMUJSejlvS2ppYTdnZDl1UG5NSjV3VEVz?=
 =?utf-8?B?N3BDV1I2andkekZ1Vy9SRG4vZmxXRDl0ODZmRVVBQnkyQVVHRHMrc0hucGNK?=
 =?utf-8?B?MG4yTS8wcDUxVUltV2JRZFdFS1YrblV6VWk3NE14ZE9tanF4ejdGWGNIMHhD?=
 =?utf-8?B?MFNJb1FJaHlhbnpjcXlmaS91TUpVYXdXUE4yMHVldmNQNzNaSzJRUGQ5cFZy?=
 =?utf-8?B?d3J1MC9Kc25NaitFTElpTitjOUx5Z3pnRmcwdUtZWXlLS3BRaWpyMjRPUjVY?=
 =?utf-8?B?OG85d0JEM3hFWGxMSlhEdXc4NW5TVExVM3p1aWxDUkY0NHArajE0UURyZE9F?=
 =?utf-8?B?dHBnU1VGdEtPVnYxVmFwTXhGeWRWTkVoS0srOVltKzkvZkpaZ2lCUklSWEtN?=
 =?utf-8?B?SlE2QlVXVjBwUmVpQUM5aW5JVmVYTGpORXFCMGp1MStHVnJQbklaYzQ5TnBT?=
 =?utf-8?B?eTVaTGlySVB4bTNsZnAxL21rVGg2M21TRE9MSDc2U3JpSTlkNVJ1bnUrOVhl?=
 =?utf-8?B?RmVDQ3VGRVB6dndhR1FnRlh0UkhibGRFSzVYZHpYUUdYaGVPaEZrS2w2Q3VQ?=
 =?utf-8?B?eXU2MUZ3SmlGYlVuM29zQk9Melk5dkhZalJ1RTBtNTBrUDh5N2ZwTXZsR1M4?=
 =?utf-8?B?ZDRjelVma2FmY2Q0MHg3SnUyVkkwUk44eGFkNVl1M0N4dGFtVEk2cWdKaC9Z?=
 =?utf-8?B?N000KzI3ZmlMSjJvNzg0dHA2UHNFTHNoUGlZQU50RlBaeXFsZmtlb3d1VlYy?=
 =?utf-8?B?U0tvc2l1NkI5U0pZYjhqNlVlS0F0VkNCWjZTV2gyUmMvL05QNDFZc1RaMXRl?=
 =?utf-8?B?UXNYVkZFeDhFTUQzVnIyRTlzem9hOFVPdnF5T01wMWRQYk9qNDhhaHh1UGFz?=
 =?utf-8?B?OVhVK2kzOHJUdnM0RklUWkNqWVJWRFdJRWtvaDNWWXZJTHJuWXFGc2FTY0NR?=
 =?utf-8?B?RUhpUm9wWHhjb1pvWW9vSVVEYlhDeTFoZ09Ra2lIUnlhZmM3bjE0N0RHTDRq?=
 =?utf-8?B?WkcvVmNpejJKSW52T2ZuRXNkQ2o3RC90S3dqLy93VjNpdVRxRHhvZkFLc0lE?=
 =?utf-8?B?SDU4UXRQd3hmS0RZRVRCRUJTUmF5cThxNGJuY0J1TWFBSlJuc05GSUtUWElx?=
 =?utf-8?B?WllGZWFVZjNhMFNvVm92M0VLTjRZeUQvVTd1Qm5DUFZKQWY4S0RydnR4MFJy?=
 =?utf-8?B?SXlqY0hiRm56WTVubWZhbkVhMkpuTEhiVGRtN2hsOTQrenc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR06MB5579.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2h0UWJqVGxPR0lxY2RFK3RLZGpVc1E0Z1lzK2pRSGZ4bXBDVmpEMGNiUmN4?=
 =?utf-8?B?WU5LSVhwdC9EM3F6S1J3SGI0V3UyQ2NxR3JCUHR1TmduWVFmYitGRnhqSmpR?=
 =?utf-8?B?dUhoTXdBc2hhNWJSdWZTbzhtL0pzaDQxdS9iTTJZQXpGS0w3akt1WmhuTFlo?=
 =?utf-8?B?YzhDdm5pdkNSZ2IwZ25jcGZ0UFlEYjJuYkpVK2MybnZlU2dKdUpVdHU1Z0po?=
 =?utf-8?B?MCtleklBNWZEdUd2KzhJS1E5VHZFZ0hnRTRYRHduRnR5SlRqbHlORWU5TGY1?=
 =?utf-8?B?ODBrTVhZTVFyTlZvSGN1UFM3NUdJOFErZmM0VGRmUzlKNUpVOVlTU2NPMnlW?=
 =?utf-8?B?eHo2YjNjZlZIOUdtUSs2WEZRVzhBaTc4MDZrSUtyR04xVzlqV2ZuaWRqRWpK?=
 =?utf-8?B?dDNFMHNQTWpNQ0ZxUWhDU01iTW5kREh1WUZMSTVtNXVoUnBtU1h5ZUtlZzNa?=
 =?utf-8?B?eTkrWmxBazMwOElEMVBCNDJWMlZtSFlvdjRmNkxmMDRDV0VTMmhHUXdTa01h?=
 =?utf-8?B?U25Ibk4rNnAwWG5UMUhNaGRnSVZIdzFCSzJibk14aTBOWGdGT1VYbFFXdmMw?=
 =?utf-8?B?SjlVb1ltY0NHVGxPSWkyREYrZzZ5d3ZqeUFoTEMySGRZQWhhUXdvNUp5NzBh?=
 =?utf-8?B?aFV1alZuVDlTVEVoeU9TYjh5YzMwc3lJakJjZ2d0Y0lXR1NUeERXbStwNHJs?=
 =?utf-8?B?VHBseGRnTWJoM2VOcDhQRExSSkdFNlpjL0VYK0YrNTAyeWtLcDlodGlna0tj?=
 =?utf-8?B?NUJOQk5KdHRqTVR5alJGOUp2eG1OL2hCbTZIYXpOdEhpcmUzZWFPTjVOZHFN?=
 =?utf-8?B?ekxOZmFiSjNBYzM4ME9hNkw2UWNwNXBMZVNyclZaMkRRUEYzTmNJMFAweC91?=
 =?utf-8?B?L3lHR0liWFpnUXI2R1ZZTzJtU3VoUXdJMHFaTDNINTZTR0pNc2xoSzczclg5?=
 =?utf-8?B?Y0pKa0tXZEdEaGxhRTBlVDBQczZGMWo3ZjlteW85eSt0bkZZOUxvZUZNM1hR?=
 =?utf-8?B?TjVMVUZuT2ZFem0xWnlRRFh5cVRaNkNFN0NLeUI4OVRCNjNpRDZrNHNaZTE3?=
 =?utf-8?B?YkpsY01RQ29PMGJ5RWltL0F6bkhyVngyTHhRaDVyYUJoOW5RYzQ4L2Z1ZVZj?=
 =?utf-8?B?aFBoYVpSWXJ5cTZXcHBudWEwNHc1K2I3MmVqS0h6VThJVzV3VnJzNWR1Y3FT?=
 =?utf-8?B?Yk1GTEZQdC8rZzN0cjdxZHZQM3g5eDYza01TVkhINWFqMXFsY00yZGZPQzg0?=
 =?utf-8?B?Q2JoWklFSS9TWEc4UnlKVkJEbEJKRzhLTEtmY2ViRTFSSExtZTV3cHU5WXhC?=
 =?utf-8?B?MTRCMjk1NHhpQnNReDljbUMrYmloQlpmOW1NU1ZVV0hOVGdoR1o4QTl6Wnpn?=
 =?utf-8?B?ME1MUG9XMTRiNW5SelF1RFlJTmlsZzVLYndCb2czd3ZsVStLUklhbW5BK0I5?=
 =?utf-8?B?cXNTeG5DQU90SzEvL1hrNWM4QmIweStxQ0lXNldOdE1tem80Rk9MRnYyVXJN?=
 =?utf-8?B?ZFVObjRZV1RrbktSMWR2RWIrTTk3am1kd2o3Zm1NSi9pa2NFeW11U0h4TG5Q?=
 =?utf-8?B?U0t6aU9DcXQ5U0FyaWE1WWZsRVFkZ3NTRHJDRlhCV1lsN1BrMk1KeTlaSElN?=
 =?utf-8?B?QStnaFVyY2lIYlYwcTRvMFoxV3BPZ0NnOHN1MFJRdzArTkNUYkVUN2lhOVlp?=
 =?utf-8?B?T0hOWU5QRzRETUZEZmZpR0F1OXkvTDZVUXBqUzdyaHhiOHRkSUd5RTJhYzI2?=
 =?utf-8?B?TXJycHpocjE4WUl0NmtVaEZHYkxjQ1F4M0ZlUTZZTzBpblRlV1hiNHI3YmZE?=
 =?utf-8?B?Tzk4bFQ4bkd4cnBpb2kzRTl3a2I5VG9kOFZjTUEyTzkyb3gyQ1dpTHRmTWhT?=
 =?utf-8?B?N1RwVkw2dUdpa2lWaUhiTitKSUVtZEt5N25ndzZ6Vk9NOXJnaUk3WjhkSHVh?=
 =?utf-8?B?SkxwNHRsVE5nWk9xQm42dHJYemlsR2YxR1NjeXphYUViWHRGZjViMDU0cWJ1?=
 =?utf-8?B?aFJpMXJYWTNvU2JwME03Z0pHOVc4YlpwMmtZdzBPQmVSSksrbUhObTRoc0xu?=
 =?utf-8?B?N2pFd0dla3RVK1NxdEdkM2MwWjhOS3planVoT2YvZ2ExVjNyQzNMT1dEbWs3?=
 =?utf-8?Q?/nxMXUBBLGqBK51m0L8rrgObd?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5361a983-6ef3-4847-da10-08ddd659e6ed
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5579.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 08:59:37.2196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIHyNraBPxV9+rDxXKhm5lUM76jRoQnomHD10VS5FjmbmSoLBV+3Sai3tzUuFI0dV6ZlDOai38ro2Ivmr62MEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6041
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/8/2025 4:51 PM, Chao Yu wrote: > On 8/8/2025 3:29 PM,
 Liao Yuanhong wrote: >> Currently, we have encountered some issues while
 testing ZUFS. In >> situations near the storage limit (e.g., 50GB r [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
X-Headers-End: 1ukIx0-0000q6-79
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: Add bggc_block_io to adjust the
 priority of BG_GC when issuing IO
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
From: Liao Yuanhong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDgvOC8yMDI1IDQ6NTEgUE0sIENoYW8gWXUgd3JvdGU6Cj4gT24gOC84LzIwMjUgMzoyOSBQ
TSwgTGlhbyBZdWFuaG9uZyB3cm90ZToKPj4gQ3VycmVudGx5LCB3ZSBoYXZlIGVuY291bnRlcmVk
IHNvbWUgaXNzdWVzIHdoaWxlIHRlc3RpbmcgWlVGUy4gSW4KPj4gc2l0dWF0aW9ucyBuZWFyIHRo
ZSBzdG9yYWdlIGxpbWl0IChlLmcuLCA1MEdCIHJlbWFpbmluZyksIGFuZCBhZnRlcgo+PiBzaW11
bGF0aW5nIGZyYWdtZW50YXRpb24gYnkgcmVwZWF0ZWRseSB3cml0aW5nIGFuZCBkZWxldGluZyBk
YXRhLCB3ZSAKPj4gZm91bmQKPj4gdGhhdCBhcHBsaWNhdGlvbiBpbnN0YWxsYXRpb24gYW5kIHN0
YXJ0dXAgdGVzdHMgY29uZHVjdGVkIGFmdGVyIAo+PiBpZGxpbmcgZm9yCj4+IGEgZmV3IG1pbnV0
ZXMgdGFrZSBzaWduaWZpY2FudGx5IGxvbmdlciBzZXZlcmFsIHRpbWVzIHRoYXQgb2YgCj4+IHRy
YWRpdGlvbmFsCj4+IFVGUy4gVHJhY2luZyB0aGUgb3BlcmF0aW9ucyByZXZlYWxlZCB0aGF0IHRo
ZSBtYWpvcml0eSBvZiBJL09zIHdlcmUgCj4+IGlzc3VlZAo+PiBieSBiYWNrZ3JvdW5kIEdDLCB3
aGljaCBibG9ja3Mgbm9ybWFsIEkvTyBvcGVyYXRpb25zLgo+Pgo+PiBVbmRlciBub3JtYWwgY2ly
Y3Vtc3RhbmNlcywgWlVGUyBpbmRlZWQgcmVxdWlyZXMgbW9yZSBiYWNrZ3JvdW5kIEdDIGFuZAo+
PiBlbXBsb3lzIGEgbW9yZSBhZ2dyZXNzaXZlIEdDIHN0cmF0ZWd5LiBIb3dldmVyLCBJIGFpbSB0
byBmaW5kIGEgd2F5IHRvCj4+IG1pbmltaXplIHRoZSBpbXBhY3Qgb24gcmVndWxhciBJL08gb3Bl
cmF0aW9ucyB1bmRlciB0aGVzZSBuZWFyLWxpbWl0Cj4+IGNvbmRpdGlvbnMuIFRvIGFkZHJlc3Mg
dGhpcywgSSBoYXZlIGludHJvZHVjZWQgYSBiZ2djX2Jsb2NrX2lvIGZlYXR1cmUsCj4+IHdoaWNo
IGNvbnRyb2xzIHRoZSBwcmlvcml0aXphdGlvbiBvZiBiYWNrZ3JvdW5kIEdDIGluIHRoZSBwcmVz
ZW5jZSBvZiAKPj4gSS9Pcy4KPj4gVGhpcyBzd2l0Y2ggY2FuIGJlIGFkanVzdGVkIGF0IHRoZSBm
cmFtZXdvcmsgbGV2ZWwgdG8gaW1wbGVtZW50IAo+PiBkaWZmZXJlbnQKPj4gc3RyYXRlZ2llcy4g
SWYgc2V0IHRvIEFMTF9JT19QUklPUiwgYWxsIGJhY2tncm91bmQgR0Mgb3BlcmF0aW9ucyB3aWxs
IGJlCj4+IHNraXBwZWQgZHVyaW5nIGFjdGl2ZSBJL08gaXNzdWFuY2UuIFRoZSBkZWZhdWx0IG9w
dGlvbiByZW1haW5zIAo+PiBjb25zaXN0ZW50Cj4+IHdpdGggdGhlIGN1cnJlbnQgc3RyYXRlZ3ks
IGVuc3VyaW5nIG5vIGNoYW5nZSBpbiBiZWhhdmlvci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTGlh
byBZdWFuaG9uZyA8bGlhb3l1YW5ob25nQHZpdm8uY29tPgo+PiAtLS0KPj4gQ2hhbmdlcyBpbiB2
NDoKPj4gwqDCoMKgwqBBZGp1c3QgdGhlIGRlZmF1bHQgcG9saWN5IEFMTF9JT19QUklPUiB0byAw
IGFuZCBtb2RpZnkgdGhlIAo+PiBkZXNjcmlwdGlvbiB0bwo+PiDCoMKgwqDCoG1hdGNoIHRoaXMg
Y2hhbmdlCj4+Cj4+IENoYW5nZXMgaW4gdjM6Cj4+IMKgwqDCoMKgTW9kaWZpZWQgdGhlIGlzc3Vl
IHdoZXJlIGl0IGRvZXMgbm90IHdvcmsgYWZ0ZXIgY2xvc2luZwo+PiDCoMKgwqDCoENPTkZJR19C
TEtfREVWX1pPTkVELgo+Pgo+PiBDaGFuZ2VzIGluIHYyOgo+PiDCoMKgwqDCoE5vbiBaVUZTIGNh
biBhbHNvIGJlIGFkanVzdGVkIHRocm91Z2ggdGhpcyBvcHRpb24uCj4+IC0tLQo+PiDCoCBEb2N1
bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMgfCAxMyArKysrKysrKysrKysrCj4+
IMKgIGZzL2YyZnMvZjJmcy5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfCAxOCArKysrKysrKysrKy0tLS0tLS0KPj4gwqAgZnMvZjJmcy9zdXBlci5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICsr
Cj4+IMKgIGZzL2YyZnMvc3lzZnMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgOSArKysrKysrKysKPj4gwqAgNCBmaWxlcyBjaGFuZ2VkLCAzNSBp
bnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzIAo+PiBiL0RvY3VtZW50YXRpb24vQUJJL3Rl
c3Rpbmcvc3lzZnMtZnMtZjJmcwo+PiBpbmRleCBiYzBlN2ZlZmMzOWQuLjIxZTY5NTE5MTlkZSAx
MDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzCj4+
ICsrKyBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcwo+PiBAQCAtODgz
LDMgKzg4MywxNiBAQCBEYXRlOsKgwqDCoMKgwqDCoMKgIEp1bmUgMjAyNQo+PiDCoCBDb250YWN0
OsKgwqDCoCAiRGFlaG8gSmVvbmciIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4+IMKgIERlc2Ny
aXB0aW9uOsKgwqDCoCBDb250cm9sIEdDIGFsZ29yaXRobSBmb3IgYm9vc3QgR0MuIDA6IGNvc3Qg
YmVuZWZpdCwgCj4+IDE6IGdyZWVkeQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgRGVmYXVsdDogMQo+
PiArCj4+ICtXaGF0OsKgwqDCoMKgwqDCoMKgIC9zeXMvZnMvZjJmcy88ZGlzaz4vYmdnY19ibG9j
a19pbwo+PiArRGF0ZTrCoMKgwqDCoMKgwqDCoCBBdWd1c3QgMjAyNQo+PiArQ29udGFjdDrCoMKg
wqAgIkxpYW8gWXVhbmhvbmciIDxsaWFveXVhbmhvbmdAdml2by5jb20+Cj4+ICtEZXNjcmlwdGlv
bjrCoMKgwqAgVXNlZCB0byBhZGp1c3QgdGhlIEJHX0dDIHByaW9yaXR5IHdoZW4gaXNzdWluZyBJ
TywgCj4+IHdpdGggYSBkZWZhdWx0IHZhbHVlCj4+ICvCoMKgwqDCoMKgwqDCoCBvZiAwLiBTcGVj
aWZpY2FsbHksIGZvciBaVUZTLCB0aGUgZGVmYXVsdCB2YWx1ZSBpcyAxLgo+PiArCj4+ICvCoMKg
wqDCoMKgwqDCoCA9PT09PT09PT09PT09PT09PT0gCj4+ID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQo+PiArwqDCoMKgwqDCoMKgwqAgdmFsdWXCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVzY3JpcHRpb24KPj4gK8KgwqDCoMKgwqDCoMKgIGJnZ2Nf
YmxvY2tfaW8gPSAwwqDCoCBTdG9wIGJhY2tncm91bmQgR0Mgd2hlbiBpc3N1aW5nIEkvTwo+PiAr
wqDCoMKgwqDCoMKgwqAgYmdnY19ibG9ja19pbyA9IDHCoMKgIFN0b3AgYmFja2dyb3VuZCBHQyBv
bmx5IHdoZW4gaXNzdWluZyAKPj4gcmVhZCBJL08KPj4gK8KgwqDCoMKgwqDCoMKgIGJnZ2NfYmxv
Y2tfaW8gPSAywqDCoCBQcmlvcml0aXplIGJhY2tncm91bmQgR0MKPj4gK8KgwqDCoMKgwqDCoMKg
ID09PT09PT09PT09PT09PT09PSAKPj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJm
cy5oCj4+IGluZGV4IDQ2YmU3NTYwNTQ4Yy4uNDQwNTQyZWEwNjQ2IDEwMDY0NAo+PiAtLS0gYS9m
cy9mMmZzL2YyZnMuaAo+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+PiBAQCAtMTU1LDYgKzE1NSwx
MiBAQCBlbnVtIGJsa3pvbmVfYWxsb2NhdGlvbl9wb2xpY3kgewo+PiDCoMKgwqDCoMKgIEJMS1pP
TkVfQUxMT0NfUFJJT1JfQ09OVizCoMKgwqAgLyogUHJpb3JpdGl6ZSB3cml0aW5nIHRvIAo+PiBj
b252ZW50aW9uYWwgem9uZXMgKi8KPj4gwqAgfTsKPj4gwqAgK2VudW0gYmdnY19ibG9ja19pb19w
b2xpY3kgewo+PiArwqDCoMKgIEFMTF9JT19QUklPUiwKPj4gK8KgwqDCoCBSRUFEX0lPX1BSSU9S
LAo+PiArwqDCoMKgIEJHR0NfUFJJT1IsCj4KPiBIaSBZdWFuaG9uZywKPgo+IEp1c3Qgbml0cGlj
aywgOikKPgo+IEEgbGl0dGxlIGJpdCBjb25mdXNlIGZvciBCR0dDX1BSSU9SIG5hbWluZywgc2lu
Y2UgaXQgd29uJ3Qgc3VibWl0Cj4gYmdnYyBJTyBpbiBwcmlvciB0byBvdGhlciBJTywganVzdCBu
b3QgYmUgYXdhcmUgb3RoZXIgSU9zLgo+Cj4gU28sIHdoYXQgZG8geW91IHRoaW5rIG9mIHJlbmFt
aW5nIGFzIGJlbG93PyBLZWVwaW5nIGFsaWduIHcvIG5hbWluZwo+IG9mIGRpc2NhcmRfcG9saWN5
LmlvX2F3YXJlLgo+Cj4gL3N5cy9mcy9mMmZzLzxkZXY+L2JnZ2NfaW9fYXdhcmUKPgo+IGVudW0g
YmdnY19pb19hd2FyZV9wb2xpY3kgewo+IMKgwqDCoMKgQVdBUkVfQUxMX0lPLMKgwqDCoMKgwqDC
oMKgIC8qIHNraXAgYmFja2dyb3VuZCBHQyBpZiB0aGVyZSBpcyBhbnkga2luZCBvZiAKPiBwZW5k
aW5nIElPICovCj4gwqDCoMKgwqBBV0FSRV9SRUFEX0lPLMKgwqDCoMKgwqDCoMKgIC8qIHNraXAg
YmFja2dyb3VuZCBHQyBpZiB0aGVyZSBpcyBwZW5kaW5nIAo+IHJlYWQgSU8gKi8KPiDCoMKgwqDC
oEFXQVJFX05PTkUswqDCoMKgwqDCoMKgwqAgLyogZG9uJ3QgYXdhcmUgSU8gZm9yIGJhY2tncm91
bmQgR0MgKi8KPiB9Owo+Cj4gVGhhbmtzLAo+ClRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9u
LiBJIHdpbGwgc3VibWl0IGEgcmV2aXNlZCBuZXcgdmVyc2lvbi4KCgpUaGFua3MsCgpMaWFvCgo+
PiArfTsKPj4gKwo+PiDCoCAvKgo+PiDCoMKgICogQW4gaW1wbGVtZW50YXRpb24gb2YgYW4gcndz
ZW0gdGhhdCBpcyBleHBsaWNpdGx5IHVuZmFpciB0byAKPj4gcmVhZGVycy4gVGhpcwo+PiDCoMKg
ICogcHJldmVudHMgcHJpb3JpdHkgaW52ZXJzaW9uIHdoZW4gYSBsb3ctcHJpb3JpdHkgcmVhZGVy
IGFjcXVpcmVzIAo+PiB0aGUgcmVhZCBsb2NrCj4+IEBAIC0xODA0LDYgKzE4MTAsNyBAQCBzdHJ1
Y3QgZjJmc19zYl9pbmZvIHsKPj4gwqDCoMKgwqDCoCBzcGlubG9ja190IGRldl9sb2NrO8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLyogcHJvdGVjdCBkaXJ0eV9kZXZpY2UgKi8KPj4gwqDCoMKgwqDC
oCBib29sIGFsaWduZWRfYmxrc2l6ZTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGFsbCBkZXZp
Y2VzIGhhcyB0aGUgc2FtZSAKPj4gbG9naWNhbCBibGtzaXplICovCj4+IMKgwqDCoMKgwqAgdW5z
aWduZWQgaW50IGZpcnN0X3NlcV96b25lX3NlZ25vO8KgwqDCoCAvKiBmaXJzdCBzZWdubyBpbiAK
Pj4gc2VxdWVudGlhbCB6b25lICovCj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IGJnZ2NfYmxvY2tf
aW87wqDCoMKgwqDCoMKgwqAgLyogRm9yIGFkanVzdCB0aGUgQkdfR0MgCj4+IHByaW9yaXR5IHdo
ZW4gaXNzdWluZyBJTyAqLwo+PiDCoCDCoMKgwqDCoMKgIC8qIEZvciB3cml0ZSBzdGF0aXN0aWNz
ICovCj4+IMKgwqDCoMKgwqAgdTY0IHNlY3RvcnNfd3JpdHRlbl9zdGFydDsKPj4gQEAgLTI5OTgs
MTMgKzMwMDUsMTAgQEAgc3RhdGljIGlubGluZSBib29sIGlzX2lkbGUoc3RydWN0IAo+PiBmMmZz
X3NiX2luZm8gKnNiaSwgaW50IHR5cGUpCj4+IMKgwqDCoMKgwqAgaWYgKHNiaS0+Z2NfbW9kZSA9
PSBHQ19VUkdFTlRfSElHSCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOwo+PiDC
oCAtwqDCoMKgIGlmICh6b25lZF9nYykgewo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKGlzX2luZmxp
Z2h0X3JlYWRfaW8oc2JpKSkKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNl
Owo+PiAtwqDCoMKgIH0gZWxzZSB7Cj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoaXNfaW5mbGlnaHRf
aW8oc2JpLCB0eXBlKSkKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOwo+
PiAtwqDCoMKgIH0KPj4gK8KgwqDCoCBpZiAoc2JpLT5iZ2djX2Jsb2NrX2lvID09IFJFQURfSU9f
UFJJT1IgJiYgCj4+IGlzX2luZmxpZ2h0X3JlYWRfaW8oc2JpKSkKPj4gK8KgwqDCoMKgwqDCoMKg
IHJldHVybiBmYWxzZTsKPj4gK8KgwqDCoCBpZiAoc2JpLT5iZ2djX2Jsb2NrX2lvID09IEFMTF9J
T19QUklPUiAmJiBpc19pbmZsaWdodF9pbyhzYmksIAo+PiB0eXBlKSkKPj4gK8KgwqDCoMKgwqDC
oMKgIHJldHVybiBmYWxzZTsKPj4gwqAgwqDCoMKgwqDCoCBpZiAoc2JpLT5nY19tb2RlID09IEdD
X1VSR0VOVF9NSUQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+PiBpbmRleCBlMTZjNGUy
ODMwYzIuLmEyMWNlY2M1NDI0ZSAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4+ICsr
KyBiL2ZzL2YyZnMvc3VwZXIuYwo+PiBAQCAtNDYyOSw5ICs0NjI5LDExIEBAIHN0YXRpYyBpbnQg
ZjJmc19zY2FuX2RldmljZXMoc3RydWN0IAo+PiBmMmZzX3NiX2luZm8gKnNiaSkKPj4gwqAgwqDC
oMKgwqDCoCBsb2dpY2FsX2Jsa3NpemUgPSBiZGV2X2xvZ2ljYWxfYmxvY2tfc2l6ZShzYmktPnNi
LT5zX2JkZXYpOwo+PiDCoMKgwqDCoMKgIHNiaS0+YWxpZ25lZF9ibGtzaXplID0gdHJ1ZTsKPj4g
K8KgwqDCoCBzYmktPmJnZ2NfYmxvY2tfaW8gPSBBTExfSU9fUFJJT1I7Cj4+IMKgICNpZmRlZiBD
T05GSUdfQkxLX0RFVl9aT05FRAo+PiDCoMKgwqDCoMKgIHNiaS0+bWF4X29wZW5fem9uZXMgPSBV
SU5UX01BWDsKPj4gwqDCoMKgwqDCoCBzYmktPmJsa3pvbmVfYWxsb2NfcG9saWN5ID0gQkxLWk9O
RV9BTExPQ19QUklPUl9TRVE7Cj4+ICvCoMKgwqAgc2JpLT5iZ2djX2Jsb2NrX2lvID0gUkVBRF9J
T19QUklPUjsKPj4gwqAgI2VuZGlmCj4+IMKgIMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IG1h
eF9kZXZpY2VzOyBpKyspIHsKPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3lzZnMuYyBiL2ZzL2Yy
ZnMvc3lzZnMuYwo+PiBpbmRleCBmNzM2MDUyZGVhNTAuLjFiNTg3OTA4ZjA0OSAxMDA2NDQKPj4g
LS0tIGEvZnMvZjJmcy9zeXNmcy5jCj4+ICsrKyBiL2ZzL2YyZnMvc3lzZnMuYwo+PiBAQCAtODY2
LDYgKzg2NiwxMyBAQCBzdGF0aWMgc3NpemVfdCBfX3NiaV9zdG9yZShzdHJ1Y3QgZjJmc19hdHRy
ICphLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGNvdW50Owo+PiDCoMKgwqDCoMKgIH0K
Pj4gwqAgK8KgwqDCoCBpZiAoIXN0cmNtcChhLT5hdHRyLm5hbWUsICJiZ2djX2Jsb2NrX2lvIikp
IHsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICh0IDwgQUxMX0lPX1BSSU9SIHx8IHQgPiBCR0dDX1BS
SU9SKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gK8KgwqDC
oMKgwqDCoMKgIHNiaS0+YmdnY19ibG9ja19pbyA9IHQ7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1
cm4gY291bnQ7Cj4+ICvCoMKgwqAgfQo+PiArCj4+IMKgwqDCoMKgwqAgKnVpID0gKHVuc2lnbmVk
IGludCl0Owo+PiDCoCDCoMKgwqDCoMKgIHJldHVybiBjb3VudDsKPj4gQEAgLTExNzUsNiArMTE4
Miw3IEBAIEYyRlNfU0JJX0dFTkVSQUxfUldfQVRUUihibGt6b25lX2FsbG9jX3BvbGljeSk7Cj4+
IMKgICNlbmRpZgo+PiDCoCBGMkZTX1NCSV9HRU5FUkFMX1JXX0FUVFIoY2FydmVfb3V0KTsKPj4g
wqAgRjJGU19TQklfR0VORVJBTF9SV19BVFRSKHJlc2VydmVkX3Bpbl9zZWN0aW9uKTsKPj4gK0Yy
RlNfU0JJX0dFTkVSQUxfUldfQVRUUihiZ2djX2Jsb2NrX2lvKTsKPj4gwqAgwqAgLyogU1RBVF9J
TkZPIEFUVFIgKi8KPj4gwqAgI2lmZGVmIENPTkZJR19GMkZTX1NUQVRfRlMKPj4gQEAgLTEzMDMs
NiArMTMxMSw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpmMmZzX2F0dHJzW10gPSB7Cj4+
IMKgwqDCoMKgwqAgQVRUUl9MSVNUKGRpc2NhcmRfaWRsZV9pbnRlcnZhbCksCj4+IMKgwqDCoMKg
wqAgQVRUUl9MSVNUKGdjX2lkbGVfaW50ZXJ2YWwpLAo+PiDCoMKgwqDCoMKgIEFUVFJfTElTVCh1
bW91bnRfZGlzY2FyZF90aW1lb3V0KSwKPj4gK8KgwqDCoCBBVFRSX0xJU1QoYmdnY19ibG9ja19p
byksCj4+IMKgICNpZmRlZiBDT05GSUdfRjJGU19JT1NUQVQKPj4gwqDCoMKgwqDCoCBBVFRSX0xJ
U1QoaW9zdGF0X2VuYWJsZSksCj4+IMKgwqDCoMKgwqAgQVRUUl9MSVNUKGlvc3RhdF9wZXJpb2Rf
bXMpLAo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
