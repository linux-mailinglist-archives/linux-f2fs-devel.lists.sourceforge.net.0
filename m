Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C1EA5DA37
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Mar 2025 11:10:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsJ35-000592-1k;
	Wed, 12 Mar 2025 10:10:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1tsJ33-00058o-PV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 10:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MKRUb3NwH7acUHrq2TS5OzrMV4cYl1+ggWNtLxxWrZU=; b=kw2PGuqdNYSuqTEoJGc8nsXFLs
 NU+DA1qc/2FoxVzifh1JGBSv3mJ29+QL9ZVkCICebyGuCCuj2l90NbiUqbDYxdPZJKWsOLzCZj72X
 KgR9+k6mPtX5dF9HXiJb960q+ZgY9IYN/bn01PU2oHn2gqXqpWSk1NzjiECc71PNjvUQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MKRUb3NwH7acUHrq2TS5OzrMV4cYl1+ggWNtLxxWrZU=; b=cVcPMpF+ix9QbsynxlyS+H93W0
 qfoRt/veY2C6GHXmiLSA3T2c85S+qwpPCu15iSHfFgAXoQaBNbRS+/nAS9zvxmSdVaqlQJckZslO9
 P91EkjNscHxole6fOOO7gaiyR8DyP1fcVbREDqM4jqFS7DgzCSnT06FYyf7cEKj/tXBg=;
Received: from mail-psaapc01on2053.outbound.protection.outlook.com
 ([40.107.255.53] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsJ2t-0000b0-KG for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 10:10:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MuU8uKq47NIOhzuReJE1XSVMJI7N4+h7K3kwQN3DXb4Xlw3FzMddDt3xd4VKxG33jXRfWzcWVXcck2c7oF+vdQ/UAB5M84iKfIFZi9ud4x5SKlBhjvTGQvGeO0uN7364ixkeAibQ54H/ifID2FlPJfs0Kuvi2BMbSZwjXJGQ6B9SY5I+YMHlhmUKBZN2kxOeN1/9OhqFJeB4weLpigG1jjcJQrJFQz/QPh4YWcGCHzDw/N/YDwP1/kSTVg/Rg8Lv0jBIXApUUwJu1DB4dNuZA57mqGpd8BfZx2PVJwOSChiyphrF2gqZ7n6szFTGPd+Re6itUsqMWwDAjWLSt7JayQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKRUb3NwH7acUHrq2TS5OzrMV4cYl1+ggWNtLxxWrZU=;
 b=tf4WCuYJwcWZFDHVIm0OrUZillU7Fcuv2yqGN0zuPluHj+diEcvrQuhGohH9kKTe3aMO6ofMds04uned4b3LMScdbXbZKkgl6QCbq3BRoiJpHNyv9lrCqDq/CclO5g+hyE3Bciu+zxbl1Dn8npQk58a5z2ZMueRkBiQp3rx7rodC2/+kdg5nWnpeG0GvZLUK1aNEeA7XLzDn3zi3nK123wYv903oHWI/Wk1WFESWOFXqX7GMJos6xhSgPCjH/mINrkxe+6HjnK0svooYt5KhTL4qEOP2fwDS6ByAZZ2y7wBTD4vaN1WrXWSIWEbQpR56txYJQxB7eE2bR87UnZFLEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKRUb3NwH7acUHrq2TS5OzrMV4cYl1+ggWNtLxxWrZU=;
 b=RjTh4qqmJOWDGeChrFe16LLNrIVp31hGYWbvdDy0xaojxXqCM3Gp0JHYMqRe3VJ/qeW0Nuvts2eG7ZGwuYzqF4Uv94SyhrYjmx44cbZQZP1z2OovXSskhi9MtQaiHezbr2zLUaypqNmr09NUHzGpcP5FUbjjd37IY1LLTDqcDNFaRSeBiJVCwyPbBYHAbMXtVSI6uUmShkEs2PocQyGj81Jv9J+LrJpZ4FOocbYwDJgTz9O6j7WsMFG94bGLc28j0983hCvNxuRK9VcMfUNnCr0LiQEAvTPYY5zkXeHAhjJ/pAtjOWgDaqGkIzaMUVTgVK1d57nw0LL627vsiP9CVQ==
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com (2603:1096:405:b5::13)
 by SEYPR06MB5208.apcprd06.prod.outlook.com (2603:1096:101:88::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 09:38:06 +0000
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b]) by TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 09:38:06 +0000
To: Chao Yu <chao@kernel.org>, Chunhai Guo <guochunhai@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH v2] f2fs: fix missing discard candidates in fstrim
Thread-Index: AQHbanks1Og+9RgwPkqktZiDK9WrP7MfjMYAgE+ZZICAAAwyAIAAXZqA
Date: Wed, 12 Mar 2025 09:38:06 +0000
Message-ID: <69fee91d-6068-4a6f-8c37-b36deb11e66a@vivo.com>
References: <20250119140834.1061145-1-guochunhai@vivo.com>
 <77fa4633-f7db-4daa-a9e1-3fdb5bf9dd1d@kernel.org>
 <74811428-9fee-467b-802f-dcb9f9dbb5a5@vivo.com>
 <381ac49a-25e9-4c37-9855-e2adb64fa81d@kernel.org>
In-Reply-To: <381ac49a-25e9-4c37-9855-e2adb64fa81d@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB7096:EE_|SEYPR06MB5208:EE_
x-ms-office365-filtering-correlation-id: 59ebaa93-7e75-4bbd-2de1-08dd614997f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Y2Rqd3dhV1lCMXFPNE1lelRlRGZkRkdmSlZTVnRWTjJ0RElyeTBRVWtsOUt6?=
 =?utf-8?B?NjNHNXYvQlBPWjM3TnZrT1g3VW5iSFVZdG1ROEU4WDV5NHU2K1N6UUwvS2xp?=
 =?utf-8?B?UWx0SWVPTG01WmRpdzlwMkhnYmNZRVRVSzJxU0JFMVNoYnhoL3FoS1JHOWJq?=
 =?utf-8?B?cUhQb1o3L00vOTdnVkY0eGxrQWt5OUthN1FaRFNpcGRSMW14ajZXaTVWemIr?=
 =?utf-8?B?SDVtMEZ2RjJtSk9HTzlUd1p4VWRidUUrVDFFQWFrTjdhcHJQK0NQYTVDTEVs?=
 =?utf-8?B?NDY3ellzd3djMytrMzhZWW5nWmVyZS9Dd201N09uTy90MHVlNlBVQW9nN3pD?=
 =?utf-8?B?S0x0a1dmaHI5UXhRSS91d2h4RmY2Ym5KbUp6c3RWN003Ukx6THRta0l0TGFw?=
 =?utf-8?B?NkhiblRVdCtyOUNOT0NsNUcrL1dVZVI5dmwxYUN4d1p3M1ROcExiZzQvQlpa?=
 =?utf-8?B?SlFYMGRiZlk3YjZIWDVsbXY3cllaaFVvYnl6QXhreHZzSjZ6T2pTTWJkdnVt?=
 =?utf-8?B?Ylhjb2hCV1J5MTg1YTltZkhUUDBCSEkwaDJaSTFKQVpUNEFCMHdrdGErcTNK?=
 =?utf-8?B?bHlLZUkvcjFyV1VqMm1nZHFpeGRyN1gxWk9HZjBmTmk5L0t1bXVzVUJYZ1pJ?=
 =?utf-8?B?U29wMDZyTVYzMVZPVkxLQ08yVkZDS3VjYTdoVjF5Mnp1YmtpY05DNDRNWUtl?=
 =?utf-8?B?TU1tTmtlRi9pc1ZUanFSTWtlRmhOVW8wUk1vRFJyRzJISVZyNmhjMWU3QjhI?=
 =?utf-8?B?amUybGRiMk5uMVhTaEJxbVJhYUZvbWtQMkRpdW0wM3ZsWDFVaFAzeEFvOVJr?=
 =?utf-8?B?aVdmVnh2VWhYRS81VCthSk1Va1NUaUJBQTI2OGxFUXZGeTF6NlJoMEk5TjBy?=
 =?utf-8?B?dVoxN0IvUjRjRDYrK1BpL00zMXdzVktXbXh1MmR1Y25JZS92OWxGcTNQWUo0?=
 =?utf-8?B?bWNJWnpmYWV4ellUSnZFb1B6dHozd2I4WkhwR2lpZ0VieXBTRnpvWEp5MUJx?=
 =?utf-8?B?cExXTWUxRUZiZk1mczh6UG83ckJvMkI4dXE0QTlzcy91cFZkWVVLMzE1WjlQ?=
 =?utf-8?B?NnpoWmZvQ1c2MDdvbzZlbzBvWlVkQlhiNklkTGltQXJmMmtHWTlKSk9MZzdG?=
 =?utf-8?B?Qlg5TFllRnBuK1BSSzFaZHNOWlMxUDQxL2Q4ZHNQbVhwaWNzd0E0NzdCSnJj?=
 =?utf-8?B?NXcxZ3ZpYWZHY1pBdnZ5aEx6bGxnRFQwUUhjQUxybmRvV25MckdZYkcrVU1Z?=
 =?utf-8?B?bFU3eGoyR3VnMTdGUXgzQ2EzYkEvZFJaV1BCeDBKSlVEdnVDV3V6STZSQnhr?=
 =?utf-8?B?VzVxcEhHT1dNS25WU2NpaWxXQWY2eDBkbG9BY1hZdWRjVVloU2QrWENvUGtD?=
 =?utf-8?B?ZUFMOEI3TWNrY1BQZVJiWWluaVNSSFNoWUVJQlcwdk9RSEMwUFFiMkRQWTZH?=
 =?utf-8?B?c2tvcUZIb05mK2NYbEVndXQvMjhQNE94YU9DL2lhK3kwWWdNK044UGVXQmFR?=
 =?utf-8?B?RUlDL2FSNkFwOWJONDlWR0JFN05oOWFlWjhwSVd5dlZHUTlYU3Ntb0VUdktL?=
 =?utf-8?B?S1ZFN1pFdTBrR0RjSTh6ZmU5YjAxL3NwYjZIZEZvcFNqT1haSUUzQ01RQUMy?=
 =?utf-8?B?V2RqZ3ZRVnJmZTB2KzRGaFBKMjB0bndkc1FobnhTcC82cTd3U1VydDh3Wk1k?=
 =?utf-8?B?UkRrTGc4SmV1RzAzL1haRUpUOEliWlVTNkNBbmwyaHBuN3VkNXlPUFpDaUFC?=
 =?utf-8?B?WERhUG5sQytXVmFvZWhjSTNneVJOWU5ENzYvVEE5UGVtbWEwcTd2ZENzb3E0?=
 =?utf-8?B?azVpc2dVTEl5M3NGbko4bWhNcVdSc2IydEJQdnlJcjdKNGgxMHlSOVB5N2tF?=
 =?utf-8?B?TTJCVW03OExVc1ZjZ1FPRms1YURjejZpbnM2NklYRHhvYWdUazkvWndBdU5l?=
 =?utf-8?Q?GylPuUaNN3azSP0/K/NgHYT7uslHl4Ro?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:TYZPR06MB7096.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1JRN0k2NTVrZzY4cXhLM21nV2QrQnFTb0MwUSt2QjFzTU5rbnVmajhHM1lF?=
 =?utf-8?B?V0JiV0xaZ0crRjg0RWh6MnllYzNzc1YxaXpXVnB1bzF6NTZIZUVvdmwxVVpm?=
 =?utf-8?B?UVpQVGpRR3BMbzBhdVh6TUdhdXBPZWdYRzZIbXhlQVo1aXdIMW9zT1AwTTZm?=
 =?utf-8?B?R21mZWg2bHdoQWQ2cndrRUhwOHpVSkpJN2ExWTRmemhuMXBGMEZFOFlsRWRn?=
 =?utf-8?B?MW01SEpIaU8rR1VLcXg1QU9qYk1EMDVoY2VhRGwrNzEvWFhXNTB2Wm0rSU8v?=
 =?utf-8?B?MkZBM3FEaS8zUk9oOE0yQ28yZWdCZnpvRGRYR0tZZGtESEJBekR3aC8xWlRB?=
 =?utf-8?B?VXNZbkZWY3pVVXhCK3ZOY0VhQkJFTWs5dHBhemZQWVpTL1lXQXdXMnlzNmtN?=
 =?utf-8?B?bENqcWhEdTZBd2pvZjRML0RabnR6RkhtMDJhenM1OWVUd1dOZ3pNWUtaM1JR?=
 =?utf-8?B?QVVjaGFHSlNmS29aRU5FZFdzcUFvdmdzSHBwL0NreGhXamdhVDlwUzZsS0Ri?=
 =?utf-8?B?b1pGMWpzdUVZZE54UmthSWpkQy9RUmRJZG4zd2JVMmxVNm96Y29XM2RYeXlU?=
 =?utf-8?B?bUpwc0NLV0tFSUxRUnhvSWJkVVRTZktzL29aK2FUVHMrUXM5TG5FOXZmOEJs?=
 =?utf-8?B?RkJYeFVtdUdGTDJtUUFxWlpBRG96M3F4bys2Vjh5ckE2ejVSbVpEZHRMdUc2?=
 =?utf-8?B?ZTRwdVV6MiszMTRXRjMxMGtSN3RFTGpIbkQrbkozV1FMczd3cUxnZnlrUk9O?=
 =?utf-8?B?Nkl1djd5Zm5uU09laXFxNmR0bGNMZWJmM2g2VW1VR05pVElEbHVwL0t4c2U3?=
 =?utf-8?B?M0dOMXhidGYzN3JmeVZqdVIrajBWUFR2ZWJ5R3pwSVo4QU9OeW9TbFB0UHVk?=
 =?utf-8?B?akVkLzVoR1hpZDJsTEtIM2YwTWhNNlpDZDdRZ0VydHpvRitCNmRTMkJMZXhH?=
 =?utf-8?B?UWhYY1drR0ZYbm0xT25TZEcyRDgySm55K2FPSVp6S2tiaU5lTDlQcTRBWkJy?=
 =?utf-8?B?cGZTVENTY3JyN0pMM21GMUxtaDdOSUhyS0RJT0ZkbUZpUitzS1ErQXZ3bGNM?=
 =?utf-8?B?Y2pQbFIxa0tsSFBqZTk0THlyUEx1VGs4bEcrMyttTVlSUk5xMnp0dUJRbmxi?=
 =?utf-8?B?dExDMXoycm14VU9QQWEvN2dsRHYzUzBuMkIvTUhVRVoxV1VGQml1SDdZUGFS?=
 =?utf-8?B?S09IUkdaS3NoT2h4cmZOUjhFVERVeStXZmhhRUl2aFNaaEI5VGd2RUQ2a1NF?=
 =?utf-8?B?Yml6eDVoWmV0enBnQ3NhYVBiRmRXMExuNkk0NGthR2IvYXZNbHg0S3JCNi9H?=
 =?utf-8?B?N2g4YWJxTE1hZlcwcUFaMGJLOGd2Q0lOTzNxVDJXWVpDY2dTTHNNMjVpaUR5?=
 =?utf-8?B?eFF6Z1h2Z3pSSnJYOFRnT291ZnVhTHc4bnVSK2lOYW1nbWdRK3JwRElTRW5M?=
 =?utf-8?B?WHFYaUJJY1JRbXBJbFl0azhZWlVucU5wS1lPR0kvbUE5SjVNNGg5cnYwV0Zr?=
 =?utf-8?B?b2hJUEhKM213a2gwUXJ5ZnRTWXZkSFc0b3lLdG1vRGVTbGtpcmRtWm93OFky?=
 =?utf-8?B?dHB1SVJyRy9jWDFsQ2k1cHhJdTZUcFRPWVVxMnYrV1FkK2R3ZlRKaHlpVHlU?=
 =?utf-8?B?eEhnUE5PSEJyU1JoNzBTSnlSUHJoRVh6dEhVSjV4am0vSWF5NC9WU0YxV0FP?=
 =?utf-8?B?L21SRExuTjJVOFVSWTQ2dzQvVUJ1N01DbkVSSC9lLy9uWWlkRkZRcWhaK3dF?=
 =?utf-8?B?UHVnK0lLRFJNU2NFc0dMODRmaHBvRmZmejZ2UzVwUkxxQjdVSDF5eXV2T0Ra?=
 =?utf-8?B?REFCM3dSaDdKYm4rVStRTWo0TVY0V3RZcjBpcjAyUkRpdWNDby9uSE5WY1NR?=
 =?utf-8?B?eVVhUmdQWWUwc3RLU0s3QitYRTUvamtleTZobnMzT0hUbWhuSzljd1ZWWm95?=
 =?utf-8?B?eU5ValFSbWJoaC9scjZtY0dNclBMVEQrVkl4OE9NWjFTNGJaeFpCUVcwdDg4?=
 =?utf-8?B?VzlEME5UT3JiUXFVTjJvRmFYT1V2azBEd3AzbzBHZjAxK2tzZjBwSDdJMmQz?=
 =?utf-8?B?Y091YW9mb0tvZVdrT1k4R2c1ZXQvaGt5emVuSmtaNlYzS3lOc1k5dHJrS3dK?=
 =?utf-8?Q?FRIc=3D?=
Content-ID: <65A62EAA9F0C0845A93A27A83BE70E2C@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB7096.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ebaa93-7e75-4bbd-2de1-08dd614997f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 09:38:06.5967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NPt58PALmr+dYruQ20gElfOJ2Y7loBoBSUu7ZoO5krUI0n77BNGU9TBtYzPCZtIu7jAZL/VQ6BC8ixP7qjeMIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5208
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 3/12/2025 12:03 PM, Chao Yu 写道: > > On 3/12/25 11:19,
    Chunhai Guo wrote: >> 在 1/20/2025 7:45 PM, Chao Yu 写道: >>> On 1/19/25
    22:08, Chunhai Guo wrote: >>>> fstrim may miss candidates that [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [40.107.255.53 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [40.107.255.53 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.255.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1tsJ2t-0000b0-KG
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix missing discard candidates in
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

5ZyoIDMvMTIvMjAyNSAxMjowMyBQTSwgQ2hhbyBZdSDlhpnpgZM6DQo+DQo+IE9uIDMvMTIvMjUg
MTE6MTksIENodW5oYWkgR3VvIHdyb3RlOg0KPj4g5ZyoIDEvMjAvMjAyNSA3OjQ1IFBNLCBDaGFv
IFl1IOWGmemBkzoNCj4+PiBPbiAxLzE5LzI1IDIyOjA4LCBDaHVuaGFpIEd1byB3cm90ZToNCj4+
Pj4gZnN0cmltIG1heSBtaXNzIGNhbmRpZGF0ZXMgdGhhdCBuZWVkIHRvIGJlIGRpc2NhcmRlZCwg
YXMgc2hvd24gaW4gdGhlDQo+Pj4+IGV4YW1wbGVzIGJlbG93Lg0KPj4+Pg0KPj4+PiBUaGUgcm9v
dCBjYXVzZSBpcyB0aGF0IHdoZW4gY3BjLT5yZWFzb24gaXMgc2V0IHdpdGggQ1BfRElTQ0FSRCwN
Cj4+Pj4gYWRkX2Rpc2NhcmRfYWRkcnMoKSBleHBlY3RzIHRoYXQgY2twdF92YWxpZF9tYXAgYW5k
IGN1cl92YWxpZF9tYXAgaGF2ZQ0KPj4+PiBiZWVuIHN5bmNlZCBieSBzZWdfaW5mb190b19yYXdf
c2l0KCkgWzFdLCBhbmQgaXQgdHJpZXMgdG8gZmluZCB0aGUNCj4+Pj4gY2FuZGlkYXRlcyBiYXNl
ZCBvbiBja3B0X3ZhbGlkX21hcCBhbmQgZGlzY2FyZF9tYXAuIEhvd2V2ZXIsDQo+Pj4+IHNlZ19p
bmZvX3RvX3Jhd19zaXQoKSBkb2VzIG5vdCBhY3R1YWxseSBydW4gYmVmb3JlDQo+Pj4+IGYyZnNf
ZXhpc3RfdHJpbV9jYW5kaWRhdGVzKCksIHJlc3VsdGluZyBpbiB0aGUgZmFpbHVyZS4NCj4+Pj4N
Cj4+Pj4gVGhlIGNvZGUgbG9naWMgY2FuIGJlIHNpbXBsaWZpZWQgZm9yIGFsbCBjYXNlcyBieSBm
aW5kaW5nIGFsbCB0aGUNCj4+Pj4gZGlzY2FyZCBibG9ja3MgYmFzZWQgb25seSBvbiBkaXNjYXJk
X21hcC4gVGhpcyBtaWdodCByZXN1bHQgaW4gbW9yZQ0KPj4+PiBkaXNjYXJkIGJsb2NrcyBiZWlu
ZyBzZW50IGZvciB0aGUgc2VnbWVudCBkdXJpbmcgdGhlIGZpcnN0IGNoZWNrcG9pbnQNCj4+Pj4g
YWZ0ZXIgbW91bnRpbmcsIHdoaWNoIHdlcmUgb3JpZ2luYWxseSBleHBlY3RlZCB0byBiZSBzZW50
IG9ubHkgaW4NCj4+Pj4gZnN0cmltLiBSZWdhcmRsZXNzLCB0aGVzZSBkaXNjYXJkIGJsb2NrcyBz
aG91bGQgZXZlbnR1YWxseSBiZSBzZW50LCBhbmQNCj4+Pj4gdGhlIHNpbXBsaWZpZWQgY29kZSBt
YWtlcyBzZW5zZSBpbiB0aGlzIGNvbnRleHQuDQo+Pj4+DQo+Pj4+IHJvb3QjIGNwIHRlc3RmaWxl
IC9mMmZzX21vdW50cG9pbnQNCj4+Pj4NCj4+Pj4gcm9vdCMgZjJmc19pbyBmaWVtYXAgMCAxIC9m
MmZzX21vdW50cG9pbnQvdGVzdGZpbGUNCj4+Pj4gRmllbWFwOiBvZmZzZXQgPSAwIGxlbiA9IDEN
Cj4+Pj4gICAgICAgICAgICBsb2dpY2FsIGFkZHIuICAgIHBoeXNpY2FsIGFkZHIuICAgbGVuZ3Ro
ICAgICAgICAgICBmbGFncw0KPj4+PiAwICAgICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDQw
NmEwMDAwMCAwMDAwMDAwMDNkODAwMDAwIDAwMDAxMDAwDQo+Pj4+DQo+Pj4+IHJvb3QjIHJtIC9m
MmZzX21vdW50cG9pbnQvdGVzdGZpbGUNCj4+Pj4NCj4+Pj4gcm9vdCMgZnN0cmltIC12IC1vIDB4
NDA2YTAwMDAwIC1sIDEwMjRNIC9mMmZzX21vdW50cG9pbnQgLS0gbm8gY2FuZGlkYXRlIGlzIGZv
dW5kDQo+Pj4+IC9mMmZzX21vdW50cG9pbnQ6IDAgQiAoMCBieXRlcykgdHJpbW1lZA0KPj4+Pg0K
Pj4+PiBSZWxldmFudCBjb2RlIHByb2Nlc3Mgb2YgdGhlIHJvb3QgY2F1c2U6DQo+Pj4+IGYyZnNf
dHJpbV9mcygpDQo+Pj4+ICAgICAgICBmMmZzX3dyaXRlX2NoZWNrcG9pbnQoKQ0KPj4+PiAgICAg
ICAgICAgIC4uLg0KPj4+PiAgICAgICAgICAgIGlmIChjcGMtPnJlYXNvbiAmIENQX0RJU0NBUkQp
IHsNCj4+Pj4gICAgICAgICAgICAgICAgICAgIGlmICghZjJmc19leGlzdF90cmltX2NhbmRpZGF0
ZXMoc2JpLCBjcGMpKSB7DQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgdW5ibG9ja19vcGVy
YXRpb25zKHNiaSk7DQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7IC8vIE5v
IGNhbmRpZGF0ZXMgYXJlIGZvdW5kIGhlcmUsIGFuZCBpdCBleGl0cy4NCj4+Pj4gICAgICAgICAg
ICAgICAgICAgIH0NCj4+Pj4gICAgICAgICAgICAgICAgLi4uDQo+Pj4+ICAgICAgICAgICAgfQ0K
Pj4+Pg0KPj4+PiBbMV0gUGxlYXNlIHJlZmVyIHRvIGNvbW1pdCBkN2JjMjQ4NGI4ZDQgKCJmMmZz
OiBmaXggc21hbGwgZGlzY2FyZHMgbm90DQo+Pj4+IHRvIGlzc3VlIHJlZHVuZGFudGx5IikgZm9y
IHRoZSByZWxhdGlvbnNoaXAgYmV0d2Vlbg0KPj4+PiBzZWdfaW5mb190b19yYXdfc2l0KCkgYW5k
IGFkZF9kaXNjYXJkX2FkZHJzKCkuDQo+Pj4+DQo+Pj4+IEZpeGVzOiAyNTI5MGZhNTU5MWQgKCJm
MmZzOiByZXR1cm4gZnNfdHJpbSBpZiB0aGVyZSBpcyBubyBjYW5kaWRhdGUiKQ0KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBDaHVuaGFpIEd1byA8Z3VvY2h1bmhhaUB2aXZvLmNvbT4NCj4+Pj4gLS0tDQo+
Pj4+IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjUwMTAy
MTAxMzEwLjU4MDI3Ny0xLWd1b2NodW5oYWlAdml2by5jb20vDQo+Pj4+IHYxLT52MjogRmluZCBh
bGwgdGhlIGRpc2NhcmQgYmxvY2tzIGJhc2VkIG9ubHkgb24gZGlzY2FyZF9tYXAgaW4gYWRkX2Rp
c2NhcmRfYWRkcnMoKS4NCj4+Pj4gLS0tDQo+Pj4+ICAgICBmcy9mMmZzL3NlZ21lbnQuYyB8IDUg
Ky0tLS0NCj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlv
bnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJm
cy9zZWdtZW50LmMNCj4+Pj4gaW5kZXggMTNlZTczYTNjNDgxLi4yNWVhODkyYTQyZGQgMTAwNjQ0
DQo+Pj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jDQo+Pj4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVu
dC5jDQo+Pj4+IEBAIC0yMDc0LDggKzIwNzQsNiBAQCBzdGF0aWMgYm9vbCBhZGRfZGlzY2FyZF9h
ZGRycyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBjcF9jb250cm9sICpjcGMsDQo+
Pj4+ICAgICB7DQo+Pj4+ICAgICAgIGludCBlbnRyaWVzID0gU0lUX1ZCTE9DS19NQVBfU0laRSAv
IHNpemVvZih1bnNpZ25lZCBsb25nKTsNCj4+Pj4gICAgICAgc3RydWN0IHNlZ19lbnRyeSAqc2Ug
PSBnZXRfc2VnX2VudHJ5KHNiaSwgY3BjLT50cmltX3N0YXJ0KTsNCj4+Pj4gLSAgICB1bnNpZ25l
ZCBsb25nICpjdXJfbWFwID0gKHVuc2lnbmVkIGxvbmcgKilzZS0+Y3VyX3ZhbGlkX21hcDsNCj4+
Pj4gLSAgICB1bnNpZ25lZCBsb25nICpja3B0X21hcCA9ICh1bnNpZ25lZCBsb25nICopc2UtPmNr
cHRfdmFsaWRfbWFwOw0KPj4+PiAgICAgICB1bnNpZ25lZCBsb25nICpkaXNjYXJkX21hcCA9ICh1
bnNpZ25lZCBsb25nICopc2UtPmRpc2NhcmRfbWFwOw0KPj4+PiAgICAgICB1bnNpZ25lZCBsb25n
ICpkbWFwID0gU0lUX0koc2JpKS0+dG1wX21hcDsNCj4+Pj4gICAgICAgdW5zaWduZWQgaW50IHN0
YXJ0ID0gMCwgZW5kID0gLTE7DQo+Pj4+IEBAIC0yMTAwLDggKzIwOTgsNyBAQCBzdGF0aWMgYm9v
bCBhZGRfZGlzY2FyZF9hZGRycyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBjcF9j
b250cm9sICpjcGMsDQo+Pj4+DQo+Pj4+ICAgICAgIC8qIFNJVF9WQkxPQ0tfTUFQX1NJWkUgc2hv
dWxkIGJlIG11bHRpcGxlIG9mIHNpemVvZih1bnNpZ25lZCBsb25nKSAqLw0KPj4+PiAgICAgICBm
b3IgKGkgPSAwOyBpIDwgZW50cmllczsgaSsrKQ0KPj4+PiAtICAgICAgICAgICAgZG1hcFtpXSA9
IGZvcmNlID8gfmNrcHRfbWFwW2ldICYgfmRpc2NhcmRfbWFwW2ldIDoNCj4+Pj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAoY3VyX21hcFtpXSBeIGNrcHRfbWFwW2ldKSAmIGNrcHRfbWFw
W2ldOw0KPj4+PiArICAgICAgICAgICAgZG1hcFtpXSA9IH5kaXNjYXJkX21hcFtpXTsNCj4+PiBk
aXNjYXJkIGlzIGNyaXRpY2FsLCB3ZSBuZWVkIG1vcmUgc2FuaXR5IGNoZWNrIGhlcmUsIG1heWJl
Og0KPj4+DQo+Pj4gLyogbmV2ZXIgaXNzdWUgZGlzY2FyZCB0byB2YWxpZCBkYXRhJ3MgYmxvY2sg
YWRkcmVzcyAqLw0KPj4+IGYyZnNfYnVnX29uKHNiaSwgKGN1cl9tYXBbaV0gXiBkaXNjYXJkX21h
cFtpXSkgJiBjdXJfbWFwW2ldKTsNCj4+Pg0KPj4+IENhbiB5b3UgcGxlYXNlIGNoZWNrIHRoaXM/
DQo+PiBTdXJlLiBJIGhhdmUgYWRkZWQgdGhlIEJVR19PTiBjaGVjayBhbmQgcGVyZm9ybWVkIHRo
ZSBmb2xsb3dpbmcgdGVzdHMNCj4+IHdpdGhvdXQgaXNzdWU6DQo+PiAxLiBSYW4geGZzdGVzdHMg
YW5kIGZzc3RyZXNzIGluIHRoZSBRRU1VIGVudmlyb25tZW50Lg0KPj4NCj4+IDIuIFJhbiBtb25r
ZXkgYW5kIHJlYm9vdCB0ZXN0cyBvbiBBUk02NCBBbmRyb2lkIGRldmljZXMgd2l0aCB0aGUgNi42
IGtlcm5lbC4NCj4gVGhhbmtzLCBzbyBpdCBsb29rcyBmaW5lIG5vdywgY2FuIHlvdSBwbGVhc2Ug
dXBkYXRlIHRoZSBwYXRjaCB3LyBhYm92ZQ0KPiBmMmZzX2J1Z19vbiBjaGVjaz8NCg0KDQpPSy4g
SSB3aWxsIHNlbnQgdGhlIHYzIHBhdGNoLg0KDQpUaGFua3MsDQoNCg0KPiBUaGFua3MsDQo+DQo+
PiBUaGFua3MsDQo+Pg0KPj4NCj4+PiBUaGFua3MsDQo+Pj4NCj4+Pj4gICAgICAgd2hpbGUgKGZv
cmNlIHx8IFNNX0koc2JpKS0+ZGNjX2luZm8tPm5yX2Rpc2NhcmRzIDw9DQo+Pj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFNNX0koc2JpKS0+ZGNjX2luZm8tPm1heF9kaXNjYXJkcykg
ew0KPj4NCg0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
