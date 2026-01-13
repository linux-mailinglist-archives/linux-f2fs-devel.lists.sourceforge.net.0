Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FA4D1AD63
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 19:27:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGlvqkcRlNicQTDVBezpgF9tHCpIALYzuXUcVnCmcU8=; b=WbrfGbUI+l3aXQLxVBicLV+PVF
	ZgqPJaHST+0YvFr2+0tvp/5PYjsMoP+pWfuZECxOi+42FXeC+2tCaz+ujzQrZupUyeTVGaxjr2nDZ
	6HPI+G1Hiulh2M+Yq9mED7QKmdgk2DSABRuvbi6HTXmXN9/hN+KYoRtjGrXgxaD1QXUI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfj6k-0007su-Iw;
	Tue, 13 Jan 2026 18:27:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Slava.Dubeyko@ibm.com>) id 1vfj6j-0007so-8o
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 18:27:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:CC:To:From:
 Sender:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iZEUpwtaXEQN7VDpEKw8kIes1QluY11RiwoEHeYJtq8=; b=YtpTZjrdUBog7JJ2ipV4UyOT3V
 jF/7dvU9laKr0x/6c1Z9fP25K3Dkdqg9u+f6bW2rYj0LvXg3Z/Oh3J7JdovZmT9/hDDmjMcyfIedJ
 qJ2++qDhmDnNPJAYA5APNr9iy9yFJzYwldqcPsMjcSU8dCotMTqYO/MIwGanJSO0j2Q8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iZEUpwtaXEQN7VDpEKw8kIes1QluY11RiwoEHeYJtq8=; b=j3hSKVBVbtTovHxcE39nT9AyKI
 7x5KG+t2D7k4n5At/6Xc6Z2XMe9ZpJ3R/kFihp14YJHB49LJxrSaXyA1mYNYgLDCpsKEhhnx8hMKO
 2GwfGRjlc1PqHbed+KACBBgVzwrll7FP6E9/RmpKbJHQWIKupaLeNWeHEXT0ACx6W3xk=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfj6i-0003EK-Kx for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 18:27:09 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60DGQsQG028413;
 Tue, 13 Jan 2026 17:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pp1; bh=iZEUpwtaXEQN7VDpEKw8kIes1QluY11RiwoEHeYJtq8=; b=QAmP2qKs
 Zhn9kQwDU0SRdJTZyEGfX6tBN+vzkVaZXej6mBnsNBbwiZj1v3l2AYVUDD7jiyCF
 jL0qf8ic/bLhCl+WcfH37gLWez1CbL83EruHcLOeHUl6G1hxZvGxjEbNcjJTkdwF
 fhlVHtljtOHCJ9L+6XzWG+N+eh0WY/rLO5YjHQnJ4Atoeloq8H7KEBl3Cz3TcK+o
 7o4l8MiThNix0HNJpaaajRwKGYyy3u9jX5ubICvWH6HYIuybiEEAAFkQ5VPQJ3H+
 dTUZCBQeTuYrq6zZ1qRkDQ2HnXMQwpeK2swmoQ4sRFfQ36rzQw7lplm4+1MUdDIc
 3L/CprS15UCRbA==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkedswcqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jan 2026 17:35:28 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60DHLSsk007794;
 Tue, 13 Jan 2026 17:35:27 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010042.outbound.protection.outlook.com [52.101.61.42])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkedswcqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jan 2026 17:35:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGXK0cvktTluud5J2QCOEoeKYYgp14IZzIpsShcTkbdvtz68EsIEgU920+HiYYRXcJLlfwiXJ6mAyi5Q1Bh0GKXkboYrJ6dkXeNFB2Fehh6gpO7TGmHAbvTtqiph4f9qLq2TBKhTpju2stXaGVosm8QsiUJKfYRqdSNKThic5FFRrPUEQLJJ7tyYn9Vp+QtRv6NsMF5/cEmlaNz5H6dmRFofIjEMsdfHQioFYakaHAABg0xdoYfjocfX18mDmY5AiQH49venIRzUK/Bvdw/nUNs2Tj52zJsb8+q6zghZvo0PNhyQ0EAnptB9pdDriwzPkn6cUZabVMVz0q82ifrDjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZEUpwtaXEQN7VDpEKw8kIes1QluY11RiwoEHeYJtq8=;
 b=mUG7kSKL0ujQDBFH7Y1WhU5w4p/t4CC9Yme2LIId99+Zd/hrCb54QS+n52JJLbw+4KcrsqfjxXEPpcmkRsE+UdWayNUpKcfgchHOFSEcYfP8N4qu2KswdFEN+bK4YResjkUEI4YkSGnTsiuRZ8Gg5crmfIW1i5r+e3BN9KwIkO9rQm4TjwJnu+7yVABGNyGTu6cx/a38ZSSPCBTuZrkm34x0BJJmRpI7M6uJrd6Swm5DmPYB+/geJLUgsuusMZUxuX3Chnldjg4SQwZy/IU1pr5pUuSAUJ4dAjFbEzTclvPItkw5uBx9hGrkH3gLoJtZ8IfyVQywlDr6TB7aJmV5ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SA1PR15MB5819.namprd15.prod.outlook.com (2603:10b6:806:338::8)
 by DSWPR15MB7111.namprd15.prod.outlook.com (2603:10b6:8:35f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 17:35:25 +0000
Received: from SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539]) by SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539%4]) with mapi id 15.20.9520.003; Tue, 13 Jan 2026
 17:35:25 +0000
To: "cel@kernel.org" <cel@kernel.org>, "jack@suse.cz" <jack@suse.cz>,
 "brauner@kernel.org" <brauner@kernel.org>, "vira@web.codeaurora.org"
 <vira@web.codeaurora.org>
Thread-Topic: [EXTERNAL] [PATCH v3 05/16] hfs: Implement fileattr_get for case
 sensitivity
Thread-Index: AQHcg+0IgRrKj/Abv0iKtm6PB9Dwb7VQXhWA
Date: Tue, 13 Jan 2026 17:35:25 +0000
Message-ID: <45b21443e42ac3fd009c8e6ab2caf5b02d815c72.camel@ibm.com>
References: <20260112174629.3729358-1-cel@kernel.org>
 <20260112174629.3729358-6-cel@kernel.org>
In-Reply-To: <20260112174629.3729358-6-cel@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5819:EE_|DSWPR15MB7111:EE_
x-ms-office365-filtering-correlation-id: 36f395a0-e249-4a88-3b7b-08de52ca22e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?Q1lhUXBZQU1RbmFXWE1CWXg1UWhRQlcvUTBhSFl3SDEwODJVTWNFSjNYK2Vs?=
 =?utf-8?B?QnVjWkVpcGg2NFA3SDM1ZStNYzN5bEFhOFFHNC9uYzZBZXlxb0tieU1GNTI0?=
 =?utf-8?B?Sm5JMVpjbXFYY09uNFUrTHhFYkUvbTFnUENiNTYvVjd2R2FUWWU4cmZrVHpw?=
 =?utf-8?B?SHljU1ZSdlV5aElOQ2xLU2NNMnNFVFV5THdyc0IrTWFKcXkwTkEzK0ZPMm9a?=
 =?utf-8?B?UkJWdjJZZGpobTRhYVJXVkZGSU9wN1FvZENwRWNaam54ZHRzTnRJaFVnTStH?=
 =?utf-8?B?RzhsWEx1TTJ3bGNJRGpldzZLaGZwWXYrUEo2NVZOZW1KKzJOZnVKYzBGejJu?=
 =?utf-8?B?QVNxdC9YL2RPb24zRnRmR21YQkQ1R3RROGdOOTI2KzI2eHJyK2JESFpJczJa?=
 =?utf-8?B?YmYrR0toZVBISTlJY1p2eVp2SE90TXlqLzNma0wwZXlZRVlhdjEyckoxdGtY?=
 =?utf-8?B?b2FOQWlXQjZqTVJzcU45UDhBWGlkd0lNMlFmYVdWVXRhS2k1djAzazlZYmVz?=
 =?utf-8?B?dG1nQU5ZRnlDQWRHeWhRdEhyWDJCQmt4anRsRTBDNk16VjFzRENkZFBsY3pJ?=
 =?utf-8?B?cWJMa29xM1BrTVB3Q1AzbzJTUjkwd3FNSnllRjJ0QzFVSkxjTEtSVmNSQlYw?=
 =?utf-8?B?bXlXVGNuQkFHMG1ZVWxxNmU0eExIaUYrRHZpVEhYbk1mMW81K1djQkYrOVc1?=
 =?utf-8?B?REVJYzhNcC81dnNNblZqZG5YRnR0azFtN1R3VTM5V2dlMGlQNm5DM2wxd2Nu?=
 =?utf-8?B?ZDV4RjdXNXBwSEtjOGlLK0RScDRlMElTV2dnK0Y0b3lQeGVjVkVuNS9CVWhj?=
 =?utf-8?B?Y3Jvbnpmb1BKL0hGZGpCMHUxOG1xTm9hNjJUQXBrbzUzY0VkZ1BiTExQTDVT?=
 =?utf-8?B?RFlzWGFrc2p3Ly82V1dDRDVaVXVYYjlyV0xRZTd4SFc3Zy9tam1lem5BZUw3?=
 =?utf-8?B?QTlwbzhVZ2dSeWl6Nmp6cTVRSzdBSGUxM2dLWEduUGp0NFJFZTB3VUhCRWdi?=
 =?utf-8?B?TVIwWkZRaHl5Z0M1V3RIL1BpOUhCVzRURUh5djJtcUs0K21KVEgyUWVsS0lr?=
 =?utf-8?B?dHdydFAyWnphUmZZS05hTS9zZ01ueFhRRC85b0d1MFVZWUxkWFR6WWhTZW5J?=
 =?utf-8?B?U0VrcUZ1N1o4eVc0blgxUDBBaklscFBwR0lNMWlFbUd5T3h0WFJTemRpNVVW?=
 =?utf-8?B?RmIyUjkrYzdVTTA3QkRXQUlxU05aRFlkRXdhK1hMMnBlZjJHajFxUjBnazJS?=
 =?utf-8?B?TE1zT3Yvc0RzZW5LVlFTYytoTVBUVUcrbHhuZktncjZoRzM1OGJMVVVCZ1Rh?=
 =?utf-8?B?bHBwNGgvQkxnaW1pWjhzZUpIVm0zRmRydy9STDBvUENaMFRZYkxuTGthQk1p?=
 =?utf-8?B?QnhSTmpyU2ZreC85cG1iN2JMaWdJNDZub1ZFZmtvU3VjVzlOZVdnejg4cWlo?=
 =?utf-8?B?Mlh0WGhzOWc1cUo4bExQc1BQK1FnM1pvOXdkWVZKWlRJb1NiNUkwV0ZpWjRP?=
 =?utf-8?B?ZzEvZU8rUy8yZmxJbE9VRjJtTWdjSmxCdXVvRzVVSlVKUTQrSkE2SGZJcjdE?=
 =?utf-8?B?ZThvcWNqMUNJdHloSG5oY0NwZmV1SGoxVUNTSDBFK2ZBaG9MNTlxNm5kcFVs?=
 =?utf-8?B?MEZpZTdjWnpad3I2dVlRQ2pKdnZhTnI3RG9NY1k5QnZWbHNKQThaOFBEeHVT?=
 =?utf-8?B?bWhHeFpIeFFLaHlQY2E1R1VFVk1hRlNTR1c0NFB5c3k0Tk9WdS9ocVBRNXJC?=
 =?utf-8?B?R0Y3QS9iSThFc1VYblBmOTM1Y1k3WDJSQlhVcXNsN3RJV25MR3ZXbHdHeFJp?=
 =?utf-8?B?WGNzVEZpdFdZYW5NcXk0N1NvVURMZ05vbitDcWtQNWhzV1FScFVpUFJKM1dX?=
 =?utf-8?B?YlJZaVh3Zkt5WXFpV1dOb3hjZ081WW1wcWlVWDJmV21xWFRWQlJ3Tm02VkQz?=
 =?utf-8?B?L2tMZEpWVjd5ZE5rS0Rtazg4TDdOQ2IyQ3F2OXlMMWxKNFRMTzNJVlBSRElw?=
 =?utf-8?B?K204YTMrRndFelE5b3l2SGlCYUg1NW5PQjZQYkZYd214QVJDcGpMMlI5ZE1Y?=
 =?utf-8?Q?XrDxVV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5819.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0JWa09aNGJNdTdNR2hTWjNMRXlKQ2hSRHM1ZEdDUFBkOGVlc3Z6Z2Z2TWlw?=
 =?utf-8?B?VlF6L2VYV3BIUU9tYzNSYnM1MnZ0MmoycFNDYzhGZTZmU3pMZ3ZhdVRwMUJa?=
 =?utf-8?B?RUllbHBnMXdGR3pWTEJ3RCswOUlVT0lBM2FvNTFLbmtaQUYwaFRSdFdZUmov?=
 =?utf-8?B?NzNZOUlJWnlrUnJWU2xpa3djVmJmQTJxdjZjVkpMSkNoYWE5bm8xUEFxODRz?=
 =?utf-8?B?Q3h2dHJ3dEtPU2E5WWRVNTFBaEtpanB4NUlaZFgrdWxKYy8zbkpNK2tRdkN0?=
 =?utf-8?B?NUdkVVdUSXduTkpPNnVFazFqTGlZL2JzZGcvTVY3NTRkRXBDcENIN0MzcWEy?=
 =?utf-8?B?QnhXa0dpNENrM3lMVE81ZnZ6OFRNRnkydXZZZ095RVdYU3FQeXNCbVZSN3BT?=
 =?utf-8?B?TWJNN3QvMXlENHdQcVFZYlhPWTJRcUJDb29iMU9Qa2dNdzVPZTYyY21jWmU5?=
 =?utf-8?B?QlRhWi9iQmhpMmk4bjhlSFNVSTlONHJUZ2lVVFAwZFZERDk4WG94WjF5Vkl3?=
 =?utf-8?B?UmR6ejBsTytwNWNGSmV6cTNPUHp4enhjWkxaK0Q4QitES28rY0luU1VjRFUx?=
 =?utf-8?B?eUZBaW1kQlI4K0N1ak5Oc3Y1cGJuTU9JS2IxQjhFRWRSQlJPNG5oaVdoenkw?=
 =?utf-8?B?cE9IWEJEVzJHeVZ5Q1JnU0d3VEJUcVk5aVh1U1NvK3NRbUNCU3daQ3BRMUgw?=
 =?utf-8?B?clY2NUI4SS9oZll6ckorWlAxZ21kcy9vZ1dIbENYbnNuVlhTZUJDM1pBWmth?=
 =?utf-8?B?amdJWHpFZXNyanhlVklBZ3RaTHBJSlBpWGdnVmI2eHEyamtQMEcrNzg3R3l6?=
 =?utf-8?B?MWt6SXYyaDJNVG9QREE4bjlnNGRrcG9mVERkeEtIUm1DTXhnTi91WnZEeFRS?=
 =?utf-8?B?dURtcGFPR2ZsWFZvdjNKVVhiWDVSSVNGc0NhWFdGb0gwZERiZXY5ZFUzQ0lY?=
 =?utf-8?B?aGpuNHA2WWVLTjlpdmk1U0FRd0hWcFhXWnQ1ZFlqUm54eWtEZHV3Wk5BWG9P?=
 =?utf-8?B?Ui96NjN6Q1Y3MDVVRXlRTytDVzJrVlJiVmdrVmlMcXZTZHNWTlNNOFhJcng0?=
 =?utf-8?B?UDFaNTV2aUFnQ3FJM0JaazVIVTczeFA2bzM1M05jK1JwWSsyV3l0OGJ1T1I3?=
 =?utf-8?B?VmtrVmpOckdBVG1wcEdldFZVWjAycUIybGs0am9uZTRqTUVzUlNCTEtZbTlO?=
 =?utf-8?B?TEwrWWJxc0VZMm9JMDRVY2VFVndienNuNkJZRVhSdFhTV0F2SDFsVjhlb0Rp?=
 =?utf-8?B?dk1SMTBFd0NubFdoeGszTmxrUFE1azVUWldxeXgySkpxeS9CemcrR2RtSldD?=
 =?utf-8?B?bW5LTS9qUjFEeHc1V091c2J4c3JDQlNXWGVnVGd2L1cvZjFGQWNUSWhZbnBL?=
 =?utf-8?B?K2c4b04wakVBZHBBTytxWFdob2w3MEtaMlVlblpjS2t4NnFvMWU0SXR0RGd1?=
 =?utf-8?B?QkxkbVh2bndweVBQamZNZnZxcjdxcVNyTWpHSmdCSXptYTd1Yjd6cktsRmxR?=
 =?utf-8?B?ZUNSTXhKZ2psTHkwRFR3V25jdHlrd1pOakRRdVFWaklKdGx5VGdtRGVKTURk?=
 =?utf-8?B?YThIcGFmSi9NWmkzQkQ2NEVPaXJGQmpDMFVJTUNGaW5icW1MQXRiNFRESG1j?=
 =?utf-8?B?K1ZaSzdIU205ZlYybHNBSHErTUZ4RE44MVNtUnJUb0YrR1M0eVJCOVQ2aWxq?=
 =?utf-8?B?VnVqT1pKcUFrdyszNDNnZlh5cTFIQkNLQVBrM3gvQnF3T0FTVlZESjFqWEY0?=
 =?utf-8?B?SXFNZHdIVmorQzh5bzdIWDRSTWtSUnFuR2JnVng0YXB1RlFzRUczSWtTbDY5?=
 =?utf-8?B?TDhKSWM0MHJNdmxyZTVkVXR1UmNsQW9EZ2tJTVhLNjBIWmVMc2FGL1ZTTU12?=
 =?utf-8?B?UGN3RHMzM0UzTmJIS05vWE0yczB5ZGNGSDdPOStZOEhhM3JlZDVMWEY2eHYv?=
 =?utf-8?B?RXdwM2ZhMldDa3JNYnh5TU9iNmFnOG5KcDhBaG1EKytyOGI4Ri9RQ21qeitO?=
 =?utf-8?B?TXdvTm9uVUtRSHhjRWY1ZlpFVk1WckVkN0ZSbitJTHNNdWZONnJmaHEwYTZU?=
 =?utf-8?B?MWxuOU8xd3FvdHd5YnV5WnkrUk8zWjJSZGVRYVZ1ZmRKN0FWUUFNejdFVHZn?=
 =?utf-8?B?Y2s0K3lZVkJvWHMyeUp3b1hFMUtCQWcxVXVvZnVTckxmdE9jS3llSlJnMWtV?=
 =?utf-8?B?NHlvSzh0RDJlUGlmTGtMdyszNTNuZ3NQU1A3YlZjTDBMZTM3MW9jeWZSalRk?=
 =?utf-8?B?Qzd6VUJvODNLRmVkSlNxZGFsMWk2UmhvZkRraFZ1SDFOeWFsTmk2UDFLdGNU?=
 =?utf-8?B?bzFRaTU4ZUcwL3Jhb3dGRmpPYVJUbDlxN2lqRjJ6aG1wMmViU1pGaGRRN3hi?=
 =?utf-8?Q?/b+yQqOW4X5fQ6MjWLquA0iW+y7iRgfbs0FOt?=
Content-ID: <F1126D21D7A9934C96B15943F960AD5E@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5819.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f395a0-e249-4a88-3b7b-08de52ca22e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 17:35:25.4863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /TiVS2F06MbjaVGEeBBO226V+3Q/3R9e06sPAjNZlIZWmQh6UfXHZsxjc9cRhzesbahlNTjGp7dVscFh8aVWiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR15MB7111
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0NCBTYWx0ZWRfX5M/iFL+zJ7ZK
 BujNO5gqjO49eDU7yg3/YCR9JeyQejqgbdyltd9kgLdGDrqHIN4+q4HyaDsvlMFdjEzseANX7sk
 bkWAM4sE2tAOTMLu+QYxKWpT76AORh4yRKIhXN/+1IXu6KFOGijU4gCbcADBRpIN5PtVNM4EGae
 LMNzZTfukDdJGMWbFoIQHKNLl39EVh0mLBo2psPuczZQBFBgfPadPlhZRQphy/G7/7N1Q3MQItL
 eDPP77yT6lNZeaVQdxGpgcqUyUwR8NWbh01Tw5fztpJBicpMKkcUdgUy6fPXQ0fdpWHgSek5SKP
 A41IV35o6Cw0Bt2FGimL+mLptw50cIiX0eZjJEnargwU21F3L66o/j3rozUYoVg/F8+1iNdbv3e
 1cK3Den000/GFiUBOpf6CVksWisieSpWpo4ddpOLRoPSoOE2UJStH2n7c8UfdVcyoJcDQbYOX0v
 IrJ/3PmL2TC6fTvzsRQ==
X-Proofpoint-GUID: Z-7BusmsTkJgXLEFNWl6JD12l4F9PQoq
X-Authority-Analysis: v=2.4 cv=WLJyn3sR c=1 sm=1 tr=0 ts=69668260 cx=c_pps
 a=ggyiYYPOIDPuJa++h0h3+w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8 a=wCmvBT1CAAAA:8
 a=tLsQUzVSC0ZAzv3t7DcA:9 a=QEXdDO2ut3YA:10 a=6z96SAwNL0f8klobD5od:22
X-Proofpoint-ORIG-GUID: jqhDSxE9V8sAfBdPT_1UWngFRoCD5ipD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601130144
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 2026-01-12 at 12:46 -0500, Chuck Lever wrote: > From:
 Chuck Lever <chuck.lever@oracle.com> > > Report HFS case sensitivity behavior
 via the file_kattr boolean > fields. HFS is always case-inse [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [148.163.158.5 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vfj6i-0003EK-Kx
Subject: Re: [f2fs-dev] [PATCH v3 05/16] hfs: Implement fileattr_get for
 case sensitivity
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
From: Viacheslav Dubeyko via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Cc: "pc@manguebit.org" <pc@manguebit.org>,
 "yuezhang.mo@sony.com" <yuezhang.mo@sony.com>,
 "cem@kernel.org" <cem@kernel.org>,
 "almaz.alexandrovich@paragon-software.com"
 <almaz.alexandrovich@paragon-software.com>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "sfrench@samba.org" <sfrench@samba.org>,
 "slava@dubeyko.com" <slava@dubeyko.com>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linkinjeon@kernel.org" <linkinjeon@kernel.org>,
 "sprasad@microsoft.com" <sprasad@microsoft.com>,
 "frank.li@vivo.com" <frank.li@vivo.com>,
 "ronniesahlberg@gmail.com" <ronniesahlberg@gmail.com>,
 "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "hirofumi@mail.parknet.co.jp" <hirofumi@mail.parknet.co.jp>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "tytso@mit.edu" <tytso@mit.edu>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 "chuck.lever@oracle.com" <chuck.lever@oracle.com>,
 "hansg@kernel.org" <hansg@kernel.org>, "anna@kernel.org" <anna@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "sj1557.seo@samsung.com" <sj1557.seo@samsung.com>,
 "trondmy@kernel.org" <trondmy@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 2026-01-12 at 12:46 -0500, Chuck Lever wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
> 
> Report HFS case sensitivity behavior via the file_kattr boolean
> fields. HFS is always case-insensitive (using Mac OS Roman case
> folding) and always preserves case at rest.
> 
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
> ---
>  fs/hfs/dir.c    |  1 +
>  fs/hfs/hfs_fs.h |  2 ++
>  fs/hfs/inode.c  | 13 +++++++++++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/fs/hfs/dir.c b/fs/hfs/dir.c
> index 86a6b317b474..552156896105 100644
> --- a/fs/hfs/dir.c
> +++ b/fs/hfs/dir.c
> @@ -321,4 +321,5 @@ const struct inode_operations hfs_dir_inode_operations = {
>  	.rmdir		= hfs_remove,
>  	.rename		= hfs_rename,
>  	.setattr	= hfs_inode_setattr,
> +	.fileattr_get	= hfs_fileattr_get,
>  };
> diff --git a/fs/hfs/hfs_fs.h b/fs/hfs/hfs_fs.h
> index e94dbc04a1e4..a25cdda8ab34 100644
> --- a/fs/hfs/hfs_fs.h
> +++ b/fs/hfs/hfs_fs.h
> @@ -177,6 +177,8 @@ extern int hfs_get_block(struct inode *inode, sector_t block,
>  extern const struct address_space_operations hfs_aops;
>  extern const struct address_space_operations hfs_btree_aops;
>  
> +struct file_kattr;
> +int hfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
>  int hfs_write_begin(const struct kiocb *iocb, struct address_space *mapping,
>  		    loff_t pos, unsigned int len, struct folio **foliop,
>  		    void **fsdata);
> diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
> index 524db1389737..06429decc1d8 100644
> --- a/fs/hfs/inode.c
> +++ b/fs/hfs/inode.c
> @@ -18,6 +18,7 @@
>  #include <linux/uio.h>
>  #include <linux/xattr.h>
>  #include <linux/blkdev.h>
> +#include <linux/fileattr.h>
>  
>  #include "hfs_fs.h"
>  #include "btree.h"
> @@ -698,6 +699,17 @@ static int hfs_file_fsync(struct file *filp, loff_t start, loff_t end,
>  	return ret;
>  }
>  
> +int hfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
> +{
> +	/*
> +	 * HFS is always case-insensitive (using Mac OS Roman case
> +	 * folding) and always preserves case at rest.
> +	 */
> +	fa->case_insensitive = true;
> +	fa->case_preserving = true;
> +	return 0;
> +}
> +
>  static const struct file_operations hfs_file_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
> @@ -714,4 +726,5 @@ static const struct inode_operations hfs_file_inode_operations = {
>  	.lookup		= hfs_file_lookup,
>  	.setattr	= hfs_inode_setattr,
>  	.listxattr	= generic_listxattr,
> +	.fileattr_get	= hfs_fileattr_get,
>  };

Looks good.

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>

Thanks,
Slava.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
