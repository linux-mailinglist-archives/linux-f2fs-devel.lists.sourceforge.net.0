Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDB28D7BAA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Jun 2024 08:37:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sE1K0-0001oW-Sr;
	Mon, 03 Jun 2024 06:37:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng1@oppo.com>) id 1sE1Jz-0001oQ-H1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Jun 2024 06:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s7+Gb5ehAup3aJEnj2pXRB69guzUToFkrHPFSRPXZfg=; b=VKaMVdf1ASO4nRV/YwfB2BDuKc
 sQgJXKLgQXxoh8r0V5ej6/Prn6sQCdZebJUCX+/LkzZ5PhGyGxk+uRe0cNnVsdDTJnKMZfdY9fIm8
 k7pIKBLtMYSPZ/C0WYT4xxCWbfeTdrpsgusfsmoPKwYfxP3J64GNeTp8zNijdNhulqdM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s7+Gb5ehAup3aJEnj2pXRB69guzUToFkrHPFSRPXZfg=; b=f7hhAb3ykNjlq5UdyAiyVBEzA7
 f79jadCn5dL5XjHuBawe5Z9JQgcn/PslMw5U/yMzQaomE5/9a7UwYMNfnD7FgUQskySprL7iiF5jK
 ZkiYKKRvd1fshdqlMvPX7zxjG4WHGRAdGW5FPVbUDRYu2amhIkVirBj8y7PAFgexB1lo=;
Received: from mail-sgaapc01on2070.outbound.protection.outlook.com
 ([40.107.215.70] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sE1Jz-00087C-Pp for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Jun 2024 06:37:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCGqSWTDieEfZGxb/RVNFGTEA0wzyCSzq80uzc1BsluDPA/2jjSsgBDMVrkfjI2Gn5gR4yPeTveZK9w8vQKsl+ikrwWQfysjTozkf2b8HgwAED5BnH/JK0jQHVVcdXXWw/M3xStPeLBI7SKs8x9G0FkWFyyVMu7id4TpozpzZSrpWbgFM7N17ixVgdTTFWHy5ahmNQhFux6BoB61F/m5y6NKQJq5nogcgaHi+7R9p9Pd5N5sgIwoyY1Wvgrb1EHAa92Zb8EqHhAw2dCGJuMFU/IfRJQdBzmLcDIpLsWCSgCj0O001dSh8rqlKyfkkVWC6TTRmd0Q9Li5RgYY3saU+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7+Gb5ehAup3aJEnj2pXRB69guzUToFkrHPFSRPXZfg=;
 b=I3UoZpjfFAl3vydvxoqn92jxPqz5NRi8YcsNXOsWj1QqFjrZkFwBfrCRiDAnX1Uor/FRhZjSxcsym9qoAYHUAd6Xj0jHHPWEAE6W/8iWTwoYBLAg1kCkRQ+pmcAIDW4cJh904WcsaYD9UIMPlz5htKozOqvXUtqxGYcbcsrVozqtERpni1BZFvQlyWFPzDteMq9/1eVrulD8m8Y9vwwcHQN+kuZ5QwpfrM1ADO5KRqOnphSCt0mbXgOTtEuJBTEFtcatr1iKJtp/Lg5bQLxJxpdIxoqeFD8VlhHSDVeYhVKdDC0AhpjtovHFSdLY3NxUTgE5R7H90l18fDlatCoqmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7+Gb5ehAup3aJEnj2pXRB69guzUToFkrHPFSRPXZfg=;
 b=vGnozO+dg5QUOMEW9wGz2MWZqdl1mGk6BEKq60Ld0IXXHtlS+LegJmkkstM87/u2gHJi518TKY6wzLwz2KzVBohYz6XlFjwx9UhK28J1jqsjT1VUVPFQRvBmFvvpsAIGuE0/Q19319yntWU6hbqi32xnzfYCg0hiG/Cn70reAuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com (2603:1096:301:90::7)
 by SEZPR02MB6650.apcprd02.prod.outlook.com (2603:1096:101:198::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Mon, 3 Jun
 2024 06:37:17 +0000
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::a138:e48f:965e:36f9]) by PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::a138:e48f:965e:36f9%6]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 06:37:16 +0000
Message-ID: <0db07a4a-91da-402e-9601-46b196b8cf1b@oppo.com>
Date: Mon, 3 Jun 2024 14:37:12 +0800
User-Agent: Mozilla Thunderbird
To: daejun7.park@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "chao@kernel.org" <chao@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CGME20240531074640epcms2p46c3cf8b7cc4e707948ae200115e28e39@epcms2p4>
 <20240531074640epcms2p46c3cf8b7cc4e707948ae200115e28e39@epcms2p4>
Content-Language: en-US
In-Reply-To: <20240531074640epcms2p46c3cf8b7cc4e707948ae200115e28e39@epcms2p4>
X-ClientProxiedBy: TYCP286CA0059.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::16) To PSAPR02MB4727.apcprd02.prod.outlook.com
 (2603:1096:301:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4727:EE_|SEZPR02MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 27f1a954-e300-4d81-094a-08dc83979c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|7416005|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXpROWdIYzdHZVBPTlM2aG1KU3JaYyt5ZEE5REFGMVFsMURkRGQybFBybVg5?=
 =?utf-8?B?VFZZTHlRalQyd3JiNzBVemtRcTMyVVRZdW5iTVVWdUEyTHo1SlkyWDl4ZStt?=
 =?utf-8?B?SGE1ZFh4dzd6YktDdDAzOW1qbzVuVHArQUw4eXJSQ0FwdUlRblEzQmg0ZVlj?=
 =?utf-8?B?NzVuL0o0UmJ2amNZUUVCSXVtd0V4TXA5R0czQXVzUzNqRWhndXZRQkxnYlpU?=
 =?utf-8?B?M29jUFRZMStRRWNBSVlPQXdMWlppQXFDcU0rUFV1M3kyOUZFVkozbDNTeHMx?=
 =?utf-8?B?a05NRi9GMHJDUFVZNkMrMCszcnJBalV2a1VCVU5EK29wTzlmS3FtUzZ2bW4y?=
 =?utf-8?B?WlJBZmRsenBiUExTcEZEQzBuTFc4SmhLOFNYTXdUQXZibTZkSlBYdnZEdkFV?=
 =?utf-8?B?aGlVNUlPK3hndXVlUlFuNjN5enAwVXFOMW42aEd1OHlIMjYzRElwUGtYcVRh?=
 =?utf-8?B?R3YrSW1UY2UvU1p4U214TVZJa1JodVArM052aXM5ditiTGVtVVdJVS9DSExK?=
 =?utf-8?B?M29qSmVGV3I0ai9FQ29IcFVzR1JId3FqSjE4dE0rM0Y4alNQUFdCV0ZRL1hE?=
 =?utf-8?B?ZldRS1RPbjh6eDJ3WndySVk0T21JYXlQS0I4RXpxUldGQWhWdGFKNmJyOU8z?=
 =?utf-8?B?OWpkcnNKYTUzYmx0TjkzYTl1YU5mU0d6TmQ3blRDU1FIWXFCcmk2STJMNloy?=
 =?utf-8?B?NE9wdHFHOW5zazg5dy9QblNyN3RFWW5NbHI2MjNUdm16OWRZc25ZTFhPR1VX?=
 =?utf-8?B?elVnYW9JeHJKQ2JWdVlzb280aUJhdjkwdExqVGVBYTlhaDFNemNSRGNvNjJp?=
 =?utf-8?B?dnptWmNObE5PeDE3UUlnSUpWa2lJT3VkbjRsZnRFMGwzc3VkdWJqSStPUnNa?=
 =?utf-8?B?UURVTG4xSWI0TEJGd25qYldhRE00YW1tRVZCeEdPZ1krZlJPSDJzekwvQTRs?=
 =?utf-8?B?b1hrMmVFaXVQOEFaaU5xRXFlbkpGMlIxNmpCY1pPSnVDN0tmSzRBSlFKc0xB?=
 =?utf-8?B?UFl6NTN4bjIvT2kxbSt5ZVdsOTBWL3VCdXNBRzdjM3NraFY0MlVtZTZ3TzFN?=
 =?utf-8?B?eVRXa1FPUHlhaFhvN3dJckdUeUZGNUlyWkRQcWJrQzlMaCsyaGcvdTBpZkw0?=
 =?utf-8?B?bzF5Z2VLMVk2UnpZemhCNTkrVW9vQUxLK3NCbXZPcHkxZlpvdGtGc2tubmFO?=
 =?utf-8?B?YVBEOVZzTWtIM2l1RzhLMVBCTjhLOW5TUUxuZ1FQSjNMQm8xY2tvcTVQWU1o?=
 =?utf-8?B?czBzditvM0I4cnJtbGp2bi9UT2F1WUR2OUNlaE1LdFkzMHI1VnlHcHZ3VGQ4?=
 =?utf-8?B?VkVyV2F3Q2IxbkJtUncvK0lBZlJzU2RNakFyU0NmQmkrQ05KMk81ODJJYTRk?=
 =?utf-8?B?TTc4a0ZVd01nQU9tdklONkxOWlhZbnZPQzQ5N0VNdWNnQ2lFYUkvMm5Qd25Y?=
 =?utf-8?B?RE5lQVNOOVVlalF3ZytmWDh4VXVGYzhndThQM1Q2Z205SGNWR3F0VTZzZnNM?=
 =?utf-8?B?aEpMeGZPVDNFaHhHVnhMNzY2K3RJeWpLL1k1MHdpc3NQOS94L3p3UnRFOG1W?=
 =?utf-8?B?MGhaQmFmSlU4Qk81TzQvNWxsVGgvNndFT3p4VnBhTWlLTHo2MWhzUWtEQmlh?=
 =?utf-8?B?TVNoQzBUNUVTcFJRN0VZcC9CcnhTdUZaOXhNaytVN0hEMGJHVm1OeFNadnNK?=
 =?utf-8?B?NkthUHVrQ01oYXA1akhjV01YdkR0N1BpNHQyeWkwNG1XeDVhcEVtZlBRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR02MB4727.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(7416005)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHJGSnVqcTN3NDVjck5nL0VCdTd5SFdLNzZjc0pMSklXaFd2YnZWblBjUGVi?=
 =?utf-8?B?RzFHME1LSG1oVXhFMGcwM2dRenV4TVYxVDhQckNqN3VheWd4czIwQlpmeTRP?=
 =?utf-8?B?aVNGY3U4bldkUGRqbzlsb2tKSVJteXFBVlBpNlZnVVhRZ1dvbmVORXJScy9G?=
 =?utf-8?B?Vy9NY0h1YjY3bUVYZ0plMzBMQWxhRW1ibGV5ZENVeHZ0dHVLek40eGdDYVRJ?=
 =?utf-8?B?NEhYRnZQWGkwTDBGOWxlejNUcE5FNGNWNU9TUFlIT0hsMzhjZzZ4S0k1NHQ3?=
 =?utf-8?B?anpCSXVJTmRHeU5OUVZEMW50RElOY2dVNHM1V0RUR3YxU0I5UzR6L1VmN3ZZ?=
 =?utf-8?B?K0ZHUGV6N3VWaTB2S3dldXhKdmcwdnhaaDV5aDVsbEJrSWgwQStmeHJMeXph?=
 =?utf-8?B?cW1lNFNGZ3JNK3dpWmJhNVNXbjhZc2U1L2hsbkpRdm43VkVLaFhaT2tlcnlZ?=
 =?utf-8?B?UGFIU25CR1M3NVRLYTI4UDhsZ2hSMW83TUF2dmRzcStBYVBlN3JxbitsSjBm?=
 =?utf-8?B?R2ZKL0h2V1R6eEZ6Y25KcThyWmFETzBnbTBsY3NhMi82dFhORGJ3WE8xak9R?=
 =?utf-8?B?V0pDNU5tSmJFbFhlcHdVM1BCdkhGUE9CZWRKTzA5eU10NTlyeGNjcWpZMmhQ?=
 =?utf-8?B?b3phLytMS0RSc0ZWa1Zvbk02ZGpSODZwNDI0V0dKeCtlbWVoNWxzaEREVVhG?=
 =?utf-8?B?TkdDa1R0cFhnVzJPbW9hUy9rUk01UzNNUExMYURsaXZXdGJmMGFlYTk3N1Iy?=
 =?utf-8?B?TmdVcHBiS0lDVXNZRnJkekFnTVA2L3BsUEhVdlZFdVpTQm5ldkZxZGk5K3RL?=
 =?utf-8?B?S1NoblB5UGRtNXlzUzlVYW1tUytrMEEvelQrSm41REpvUGZxaHFJVHV5bGpy?=
 =?utf-8?B?R3UxSGRyQkhjbU1wUzdHbkhuTkdta2NJN2tZMEJ2OVNxRE5tWDFyT0ExWkkx?=
 =?utf-8?B?R3hyak8yL0JHWUVGTDZTZlBJbHpvN3loeTNMMWxKOG0wZDVQR0RlM1VkZlZy?=
 =?utf-8?B?Q2pERUI5bmlkRXYxc3BqdTQzWmxsY0IrMXpYUTVHc1c2MHpRTUZNb2MxUS91?=
 =?utf-8?B?ZTR2OHo4MDh6elgzb2hDMyszYmE2WlVEQyt4enJDNVpxdEJ6b1R2QzJ0d0xz?=
 =?utf-8?B?Vml3ajFRTTdkMkNVRElwbjRva1ZRUElpSFhpSm8yd1BDUXhQbVAwd3pvcC8z?=
 =?utf-8?B?OGNQeDNSYTZRbFZuQ2hOOVZna2RtbkQzOTNxR2xKVFp6UXlGbTJhaVl2Mm9m?=
 =?utf-8?B?SWxwVVBlanBLSnBCNXRuTTRwSzV1TUthWm5NK2xSK2MwNVVNcDJHNUMyVzhV?=
 =?utf-8?B?d05jSnMrRENwcHBKbmJMUGRidy8ycXpuUzZlN1kvcDBVYUY3Q2ZGQzQzZ0FI?=
 =?utf-8?B?aUd5K3VGbnM0bmRDekhBUWNRNXJjdFZ5U2RrbFg3RWNUQngzRGxPekIxbEs5?=
 =?utf-8?B?R0hPQXFKSWdWZllTZXF4NkRvTlZkKzZleWNKQXZEUWo4M01yTThlRWNpT1Mv?=
 =?utf-8?B?bjZ5NU5UQlhOK2R0bGt5QnFLTGY1enFSZ1BHOHFNcVlyS04zc3Myc251c3Fs?=
 =?utf-8?B?eTVIWmIrRVJLWTl3QWFRR3VGOUtiTmhJZ1lEZ0krekkwNUdkclVDNWpBN3Qx?=
 =?utf-8?B?Tjcvb2R5NU1sR3J4czd4ekdDZ29HaExsMWU5T2c3MGRDUnVNQnlYYklZWEhO?=
 =?utf-8?B?YzV1WDFGd25hSGRtLzJHbmY2Snh3MFhEcmZEZmJac3p0L2hmRFB3Y0xOd1or?=
 =?utf-8?B?Ym9yZUlLZDhSK0VWaDhXRnVtV3lhRW45dTNaSU81eUdGQ01lcEVacnRnTFAx?=
 =?utf-8?B?S1dPa1ZEcFdsa1FKYlIrOUFyaDA1VDJEU2owc0xEaU1TODF5NDU3b2d0RENl?=
 =?utf-8?B?ZnBSRnFyTVhaTmZERmxsZjhWTXFsdnpNeS9UUTl3NzB5NDdEckxrSUdNZ2FW?=
 =?utf-8?B?UTliN0QrYlZCKzNLbHBzVlUzUGZxWEhzdEZCeWtXQ1plbG9ibEtYY1Ewdzli?=
 =?utf-8?B?cktsaU5GL0lNZkFpKzRWVVI3VmhWWm84bVBtNXNKMS9rUXJKM1k5WFBaa1l6?=
 =?utf-8?B?Y2ljN1VzZ3AyZDJSd28ySWtVQzV4d1Q2am05by9DUm9qL1kzcmZscGJHakor?=
 =?utf-8?B?QVFJOHVjY3hQVmtndEZFMmthaUxOdkNITXJmbkg0SVJ6YStYRUdFT1Bzelpl?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f1a954-e300-4d81-094a-08dc83979c63
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4727.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 06:37:16.7895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKHivPR7rsA/uwc9k3qYlh/hIB3GyKtFbFlfJLp3tNtYgD6EUfhz0KKWYzGDdmSa5+IDC5O7EW/VRZyqH/gtqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB6650
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/31/2024 3:46 PM, Daejun Park wrote: > The amount of node
 writes is small compared to the amount of user data > writes in most
 workloads.
 Therefore, even if there is enough free space > in the nod [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.70 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.70 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.70 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.215.70 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sE1Jz-00087C-Pp
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: add support single node section
 mode
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
From: Yongpeng Yang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yongpeng Yang <yangyongpeng1@oppo.com>
Cc: Seokhwan Kim <sukka.kim@samsung.com>, Nayeon Kim <nayeoni.kim@samsung.com>,
 Dongjin Kim <dongjin_.kim@samsung.com>, Siwoo Jung <siu.jung@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 5/31/2024 3:46 PM, Daejun Park wrote:
> The amount of node writes is small compared to the amount of user data
> writes in most workloads. Therefore, even if there is enough free space
> in the node section, it cannot be used by another type because the type
> for its section is fixed. When using zoned storage, the free space in
> node section issue can be a problem due to the large section.
> 
> This patch can avoid the problem by using a single node section without
> considering the hotness of the node section. For particularly high file
> system usage, two sections can be used as free sections, which makes it
> more efficient.
> 
> To use single node section, add the 'single_node_sec' in mount option.
> 
> Signed-off-by: Daejun Park <daejun7.park@samsung.com>
> ---
>   Documentation/filesystems/f2fs.rst |  2 +
>   fs/f2fs/f2fs.h                     |  3 ++
>   fs/f2fs/recovery.c                 |  3 ++
>   fs/f2fs/segment.c                  | 77 ++++++++++++++++++++++++++++++
>   fs/f2fs/segment.h                  |  2 +
>   fs/f2fs/super.c                    | 12 +++++
>   6 files changed, 99 insertions(+)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 68a0885fb5e6..ba26b2ce4fa4 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -134,6 +134,8 @@ noacl			 Disable POSIX Access Control List. Note: acl is enabled
>   active_logs=%u		 Support configuring the number of active logs. In the
>   			 current design, f2fs supports only 2, 4, and 6 logs.
>   			 Default number is 6.
> +single_node_sec	 Support single node section mode, it enables single active
> +			 log for hot/warm/cold nodes. This is disabled by default.
>   disable_ext_identify	 Disable the extension list configured by mkfs, so f2fs
>   			 is not aware of cold files such as media files.
>   inline_xattr		 Enable the inline xattrs feature.
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 1974b6aff397..90f13a6b64ce 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -116,6 +116,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
>   #define	F2FS_MOUNT_GC_MERGE		0x02000000
>   #define F2FS_MOUNT_COMPRESS_CACHE	0x04000000
>   #define F2FS_MOUNT_AGE_EXTENT_CACHE	0x08000000
> +#define F2FS_MOUNT_SINGLE_NODE_SEC	0x10000000
>   
>   #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
>   #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
> @@ -1655,6 +1656,8 @@ struct f2fs_sb_info {
>   
>   	struct f2fs_mount_info mount_opt;	/* mount options */
>   
> +	bool single_node_sec;			/* single node section */
> +
>   	/* for cleaning operations */
>   	struct f2fs_rwsem gc_lock;		/*
>   						 * semaphore for GC, avoid
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index 496aee53c38a..b5cdb0845ac7 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -414,6 +414,9 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
>   
>   	/* get node pages in the current segment */
>   	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
> +	/* check hot node if single node section mode is enabled */
> +	if (sbi->single_node_sec && curseg->segno == NULL_SEGNO)
> +		curseg = CURSEG_I(sbi, CURSEG_HOT_NODE);
>   	blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
>   	blkaddr_fast = blkaddr;
>   
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index a0ce3d080f80..c1fe5c92bdfb 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -394,6 +394,9 @@ int f2fs_commit_atomic_write(struct inode *inode)
>   	return err;
>   }
>   
> +static int new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec);
> +static void locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno);
> +
>   /*
>    * This function balances dirty node and dentry pages.
>    * In addition, it controls garbage collection.
> @@ -420,6 +423,58 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>   	if (has_enough_free_secs(sbi, 0, 0))
>   		return;
>   
> +	if (test_opt(sbi, SINGLE_NODE_SEC) && !sbi->single_node_sec) {
> +		int type, segno, left_blocks = 0;
> +
> +		for (type = CURSEG_HOT_NODE; type <= CURSEG_COLD_NODE; type++) {
> +			segno = CURSEG_I(sbi, type)->segno;
> +			left_blocks += CAP_BLKS_PER_SEC(sbi) -
> +					get_ckpt_valid_blocks(sbi, segno, true);
> +		}
> +
> +		/* enable single node section mode if we get 2 free sections */
> +		if (left_blocks < CAP_BLKS_PER_SEC(sbi) * 2)
> +			goto do_gc;
> +
> +		f2fs_down_read(&SM_I(sbi)->curseg_lock);
> +		down_write(&SIT_I(sbi)->sentry_lock);
> +
> +		/* it can be enabled by others */
> +		if (sbi->single_node_sec)
> +			goto unlock;
> +
> +		/* leave current zone by allocating new section */
> +		for (type = CURSEG_WARM_NODE; type <= CURSEG_COLD_NODE; type++) {
> +			struct curseg_info *curseg = CURSEG_I(sbi, type);
> +
> +			mutex_lock(&curseg->curseg_mutex);
> +			segno = curseg->segno;
> +			if (new_curseg(sbi, type, true)) {
> +				mutex_unlock(&curseg->curseg_mutex);
> +				goto unlock;
> +			}
> +			locate_dirty_segment(sbi, segno);
> +			mutex_unlock(&curseg->curseg_mutex);
> +		}
Hi Daejun,
1. It is not compatible with "F2FS_OPTION(sbi).active_logs == 2".
2. Once has_enough_free_secs is false, F2FS cannot restore to multi-node 
sections even after has_enough_free_secs becomes true and the filesystem 
is unmounted and remounted. This seems unreasonable.
> +
> +		/* clear warm node, cold node information */
> +		for (type = CURSEG_WARM_NODE; type <= CURSEG_COLD_NODE; type++) {
> +			struct curseg_info *curseg = CURSEG_I(sbi, type);
> +
> +			mutex_lock(&curseg->curseg_mutex);
> +			segno = curseg->segno;
> +			curseg->segno = NULL_SEGNO;
> +			curseg->inited = false;
> +			__set_test_and_free(sbi, segno, false);
> +			mutex_unlock(&curseg->curseg_mutex);
> +		}
> +		f2fs_notice(sbi, "single node section mode enabled");
> +		sbi->single_node_sec = true;
> +unlock:
> +		up_write(&SIT_I(sbi)->sentry_lock);
> +		f2fs_up_read(&SM_I(sbi)->curseg_lock);
> +	}
> +do_gc:
>   	if (test_opt(sbi, GC_MERGE) && sbi->gc_thread &&
>   				sbi->gc_thread->f2fs_gc_task) {
>   		DEFINE_WAIT(wait);
> @@ -3502,6 +3557,9 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>   		return f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
>   						inode->i_write_hint);
>   	} else {
> +		if (fio->sbi->single_node_sec)
> +			return CURSEG_HOT_NODE;
> +
>   		if (IS_DNODE(fio->page))
>   			return is_cold_node(fio->page) ? CURSEG_WARM_NODE :
>   						CURSEG_HOT_NODE;
> @@ -4116,6 +4174,15 @@ static int read_normal_summaries(struct f2fs_sb_info *sbi, int type)
>   							CURSEG_HOT_NODE]);
>   		blk_off = le16_to_cpu(ckpt->cur_node_blkoff[type -
>   							CURSEG_HOT_NODE]);
> +		if (segno == NULL_SEGNO && type != CURSEG_HOT_NODE) {
> +			if (!test_opt(sbi, SINGLE_NODE_SEC)) {
> +				f2fs_err(sbi, "single_node_sec option required");
> +				return -EFAULT;
> +			}
> +			sbi->single_node_sec = true;
> +			return 0;
> +		}
> +
>   		if (__exist_node_summaries(sbi))
>   			blk_addr = sum_blk_addr(sbi, NR_CURSEG_NODE_TYPE,
>   							type - CURSEG_HOT_NODE);
> @@ -4884,6 +4951,8 @@ static void init_free_segmap(struct f2fs_sb_info *sbi)
>   		struct curseg_info *curseg_t = CURSEG_I(sbi, type);
>   
>   		__set_test_and_inuse(sbi, curseg_t->segno);
> +		if (sbi->single_node_sec && type == CURSEG_HOT_NODE)
> +			break;
>   	}
>   }
>   
> @@ -5027,6 +5096,10 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
>   			f2fs_handle_error(sbi, ERROR_INVALID_CURSEG);
>   			return -EFSCORRUPTED;
>   		}
> +
> +		/* in single node section mode, WARM/COLD NODE are invalid */
> +		if (sbi->single_node_sec && i == CURSEG_HOT_NODE)
> +			break;
>   	}
>   	return 0;
>   }
> @@ -5153,6 +5226,10 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
>   	if (!zbd)
>   		return 0;
>   
> +	/* in single node section mode, WARM/COLD node are not valid */
> +	if (sbi->single_node_sec && type > CURSEG_HOT_NODE)
> +		return 0;
> +
>   	/* report zone for the sector the curseg points to */
>   	zone_sector = (sector_t)(cs_zone_block - zbd->start_blk)
>   		<< log_sectors_per_block;
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index e1c0f418aa11..152a07e61b5f 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -570,6 +570,8 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>   				get_ckpt_valid_blocks(sbi, segno, true);
>   		if (node_blocks > left_blocks)
>   			return false;
> +		if (sbi->single_node_sec) /* check only hot node */
> +			break;
>   	}
>   
>   	/* check current data section for dentry blocks. */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 1f1b3647a998..c21eeca86b0a 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -129,6 +129,7 @@ enum {
>   	Opt_acl,
>   	Opt_noacl,
>   	Opt_active_logs,
> +	Opt_single_node_sec,
>   	Opt_disable_ext_identify,
>   	Opt_inline_xattr,
>   	Opt_noinline_xattr,
> @@ -207,6 +208,7 @@ static match_table_t f2fs_tokens = {
>   	{Opt_acl, "acl"},
>   	{Opt_noacl, "noacl"},
>   	{Opt_active_logs, "active_logs=%u"},
> +	{Opt_single_node_sec, "single_node_sec"},
>   	{Opt_disable_ext_identify, "disable_ext_identify"},
>   	{Opt_inline_xattr, "inline_xattr"},
>   	{Opt_noinline_xattr, "noinline_xattr"},
> @@ -803,6 +805,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   				return -EINVAL;
>   			F2FS_OPTION(sbi).active_logs = arg;
>   			break;
> +		case Opt_single_node_sec:
> +			set_opt(sbi, SINGLE_NODE_SEC);
> +			break;
>   		case Opt_disable_ext_identify:
>   			set_opt(sbi, DISABLE_EXT_IDENTIFY);
>   			break;
> @@ -2039,6 +2044,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>   					F2FS_OPTION(sbi).s_resuid),
>   				from_kgid_munged(&init_user_ns,
>   					F2FS_OPTION(sbi).s_resgid));
> +	if (test_opt(sbi, SINGLE_NODE_SEC))
> +		seq_puts(seq, ",single_node_sec");
>   #ifdef CONFIG_F2FS_FAULT_INJECTION
>   	if (test_opt(sbi, FAULT_INJECTION)) {
>   		seq_printf(seq, ",fault_injection=%u",
> @@ -3675,6 +3682,9 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>   	blocks_per_seg = BLKS_PER_SEG(sbi);
>   
>   	for (i = 0; i < NR_CURSEG_NODE_TYPE; i++) {
> +		/* bypass single node section mode */
> +		if (le32_to_cpu(ckpt->cur_node_segno[i] == NULL_SEGNO))
> +			goto check_data;
>   		if (le32_to_cpu(ckpt->cur_node_segno[i]) >= main_segs ||
>   			le16_to_cpu(ckpt->cur_node_blkoff[i]) >= blocks_per_seg)
>   			return 1;
> @@ -3823,6 +3833,8 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
>   	init_f2fs_rwsem(&sbi->io_order_lock);
>   	spin_lock_init(&sbi->cp_lock);
>   
> +	sbi->single_node_sec = false;
> +
>   	sbi->dirty_device = 0;
>   	spin_lock_init(&sbi->dev_lock);
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
