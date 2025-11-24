Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD4EC7F540
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 09:07:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oINhJydpMgKVDk4WCjrhG7kRfRQYYLCKPbdqdaxQQdM=; b=iUtLdQFLi/agcLLAA2MceVqm30
	4Cyc2uw3GljOJP4AI7+qc1Nt3K/7CuD8I74oNivd0BO73TyJU+YelwWCncceFiGHvQItaj9/yo+dp
	aYskERwPsrdm3cvBL477QZVErwlcwJJz1Ju0zU9WDK8ttLh5L2Q18ZqW5GbmWKk2RAsA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNRbD-000336-Fe;
	Mon, 24 Nov 2025 08:07:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=41613d8e1=Johannes.Thumshirn@wdc.com>)
 id 1vNRbB-00032x-9o for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 08:07:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f+z6ql9M5JhawzkmfcJJBxApS2D5ls0dv54BOWw8ja8=; b=TNBGWnzfAaIUOtsJdJosjXD6HR
 TWYyOvtaQLrFGsrrN5ZMo1QcD59SLFzWCvm8boJQxHMBVxLzqrO3MVlBmpeOE0HltpxrNf4nK1Crk
 gXY/2zOAADBVxPe9+SWoAiMB+WJMZJwd8fauMeEer2rgVjt6EtcBq0Qxuuev4HRWhusA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f+z6ql9M5JhawzkmfcJJBxApS2D5ls0dv54BOWw8ja8=; b=JTYf/6Y9UDkqQWH+mRsHlNdqRl
 bq9xD7lLTwlminq6JdRy1XsjvLXjgAerlX1MnTPk3QO4dokDl+y+k3eQaiQsAF7MTtqgE+n3cDZCD
 8tRR9aASYYUgxCusVfV6L0Cg3Gyggbfso8JkDiipYVFL3l3ltdM44rgPug4VQrlkK4Qo=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNRbB-0005ww-CJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 08:07:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1763971620; x=1795507620;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=f+z6ql9M5JhawzkmfcJJBxApS2D5ls0dv54BOWw8ja8=;
 b=BjnKbRJOQU29T2azijwY8JhDPQFoJmhBwAESo4FCA0s/gsI6zRtbxk2D
 sruEsNVsOXk07Z4yKHgfSM8a4/MSf5yKGso+lp+Dt5crbqqOYpI+SFIhm
 cLTehyMahE8uBdL4Oqprf+Hn4bC7fFKezkfQBhmCuE+bixJ/tEA4soDlx
 Kd1J8J9R3pp6/WB+wTHL8QpJI5aEPKje4Z3eLEBCB3ciQSq8oLSyuoCPL
 qlSPcr9Vc1HkMfqnpjqAFGq/a+YEmDJr8Scxy4fkRI/NlqWD+FBbTcCnr
 WFHFwk5G8ghloYf8XSi0ncBxjdnwiPjITWFPYupnZAZl3JZYALgYwjbQR g==;
X-CSE-ConnectionGUID: ef6QrZSISlactz9Cs3y+xw==
X-CSE-MsgGUID: B6/UchyRSO2X+oCinVKg9A==
X-IronPort-AV: E=Sophos;i="6.20,222,1758556800"; d="scan'208";a="135269329"
Received: from mail-eastusazon11011003.outbound.protection.outlook.com (HELO
 BL2PR02CU003.outbound.protection.outlook.com) ([52.101.52.3])
 by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Nov 2025 15:50:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8yIWwFbL2j84JLKYs1f/hzM5HsbE6y+aJx3aDUJ3tIN1KAUu367YY0D8Ewu7FIRlE3l6AAJiVmy62H6qAT8BXFZ+GYAOs7UwXGKdrSnN9I1KUIdSsCygJdDgQlui6aW7mMmv0DbZIRDBcmz8AkvVj7CH8e3DQVpnI6od72KZi70jauNGzBEQdOFrmAbjmAiMk52opgUzE1wDF+Pg5SR6jcBR5BC+nD3oMN0Z4GuDTW7H5AHFFq/fGnhaDJCBVE34y83JjsOnbUDSAx3PcDcDysGgH+JTcYVFx1MpxaQvRzSnlj3bSnewmFvDoBwU9GHsZB9YkinDrrq08i8iLrX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+z6ql9M5JhawzkmfcJJBxApS2D5ls0dv54BOWw8ja8=;
 b=R5iBiiDjcixUBRrCYHdrXVZbApOqA0Y0Uya7HZ8RwBFKlMzQ/wm1fgc0rQQKQg8WAYO5FtNGNMvnNzrES15JyXSMocOgWTW9rnIWKUN+UfYkNBorClZbMiOykU3yrXzzmRTUzXHDJFlHSCYBK6N1axnCZ2i15zghmtEO0DYNPdXgx9WHOQe0wPtgNIMIs1Z1eALWdjyJlM1A70lh9vBO3qCZX/wI5Aph/8hoMVLnLPrSLd9cjVBduZfBTdCIWAUa+A+5Qf0f+2Y3TuWUyPcSaZuOWR1wTXp/bomCuIQdDksQIID0IlEpOm1cv5+IwXI8wzHMpFGbwMqTIc+FzbYqyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+z6ql9M5JhawzkmfcJJBxApS2D5ls0dv54BOWw8ja8=;
 b=TDw9hvD5L+N34KYW6NW43teVgAB8qozV9S+HfKBAYHPH2grnme1Z6ubIRFu2YZEeatE/rJzzciC7F1yIAskPg4y3k+Bd/xXRd/p9ZlFiTgn87Ok4oeX2Pg741cpZPOCBAd8CLd1VBLOL3vJn8K66a9pe3GjttTAGi+s3Ceufz/U=
Received: from SA0PR04MB7418.namprd04.prod.outlook.com (2603:10b6:806:e7::18)
 by PH0PR04MB7288.namprd04.prod.outlook.com (2603:10b6:510:1f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 07:50:56 +0000
Received: from SA0PR04MB7418.namprd04.prod.outlook.com
 ([fe80::17f4:5aba:f655:afe9]) by SA0PR04MB7418.namprd04.prod.outlook.com
 ([fe80::17f4:5aba:f655:afe9%3]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 07:50:56 +0000
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, "axboe@kernel.dk"
 <axboe@kernel.dk>, "agk@redhat.com" <agk@redhat.com>, "snitzer@kernel.org"
 <snitzer@kernel.org>, "mpatocka@redhat.com" <mpatocka@redhat.com>,
 "song@kernel.org" <song@kernel.org>, "yukuai@fnnas.com" <yukuai@fnnas.com>,
 hch <hch@lst.de>, "sagi@grimberg.me" <sagi@grimberg.me>, "kch@nvidia.com"
 <kch@nvidia.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "chao@kernel.org" <chao@kernel.org>, "cem@kernel.org" <cem@kernel.org>
Thread-Topic: [PATCH V2 1/5] block: ignore discard return value
Thread-Index: AQHcXO4jMdY+ZQ/AbESblk64rCNQn7UBdEUA
Date: Mon, 24 Nov 2025 07:50:56 +0000
Message-ID: <3d5062bf-f7cf-4db9-88e1-c64cc5b928e3@wdc.com>
References: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
 <20251124025737.203571-2-ckulkarnilinux@gmail.com>
In-Reply-To: <20251124025737.203571-2-ckulkarnilinux@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA0PR04MB7418:EE_|PH0PR04MB7288:EE_
x-ms-office365-filtering-correlation-id: a71c139b-2b8e-4063-e2de-08de2b2e339e
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|376014|1800799024|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?ZlZsczNRajk2YjB4MUo3YitwNWxmQVpmT1VROUhubE9HdG5DbGljNVhVQUxa?=
 =?utf-8?B?cjI4QUpDMkVCMGVabUVtbGRRSkhpYVhNcXVQWUk3UEljamNJWW5SeXhNK1pU?=
 =?utf-8?B?Y3Y5YWtTZ0c5OTY2ZEJhSWVZZi8yaEZlOTVnT2VjdXRNRFo1L3NkVmtmMDFl?=
 =?utf-8?B?VE9saVRLTWVORTFyOW9xUExlZThQa1ZkS2picFJER1hGRzlUaVhMOEpSSllB?=
 =?utf-8?B?ZVVNVWVzZDdzaG02U3ZJcVloTzc4UnI5dFB0cHllUUx5Wi9yYi82cXJSLzVV?=
 =?utf-8?B?ZU9zamFpMTJZcmlCeWRDUWc5VDNUVDllbE9IT2l6RDdYL1ArUGtmT1hFSGVs?=
 =?utf-8?B?QnlHYVhoR3lVeDNQU0JycCt3Mzk1cElTL2FIZWppUlFISUtMMEpUVUMrTlpT?=
 =?utf-8?B?Qm5nYXA3NnNVR0dQK01PR1JXYUI2NndVQUNDU3d0L2ZBZ1VVWFlqWk9zOWFH?=
 =?utf-8?B?Qld5VlFDY2dWWTBzNUQxY2IvcGxOemtWeWV1U3Q1djdtV0FhQzlSL2RDSFdj?=
 =?utf-8?B?Y21LUDBEODFTdWFpWE1qVlZYelJnWTJHb0hqMkhRT05FWE9raG9ldWFPNk5k?=
 =?utf-8?B?YzVDVnNvSGNEMXRGQTZsZE1qM3Z6eGsycWFaZ283NG5idGdtcFZERHJXajBm?=
 =?utf-8?B?dWVHR2dvakVQTU5rVjJRb0t1UGU2R0QyemtuTXVvYnNNMWU3OEwxS01lZ3Fy?=
 =?utf-8?B?L2lZSm5oTFpSQ2lvNmNFUUFPdEZpRkFzdWFHSVNiODdyQ1RDVmJPL3BEZ3NK?=
 =?utf-8?B?bm5keG96bmVtTkF5UjNwWnc0TUhOdWsrZ3QzV2Fab0NrZEN4dVZOc0VKQ00y?=
 =?utf-8?B?b3hoa3BINXhkZ3RVcm9mSWpVRVBiYTlsNzYxZFZUUXh2N0RkdEN6dDJnZjB1?=
 =?utf-8?B?WmtrWUtnS2dFd2RKK0dTa3I3VG5JaXpzR0kwaCtSUzIyUEJjTEVoRG1lS1Q2?=
 =?utf-8?B?czJEc0NTYUlEdnVJSFZuNjNnaXBueUdwdlg5M3BwbjVHcXc4UWhNY3dsb0tm?=
 =?utf-8?B?UXRKQndhRjg4Q3VHa3E3L01ja0QzTVM2K0ZabXhyS0pwVkNxYlV1c2JUa3ZH?=
 =?utf-8?B?TGpnT2MreGord2kvVGFaYzR6K05TNXVrVXJkY1BnRXRITFdkZzdBeHY1dHh5?=
 =?utf-8?B?bG11Qy9nVys2Y2ZxR1dWVEV4NTJBeEVrNDIwbXAraENCR1B5ektMZmNNYVg2?=
 =?utf-8?B?UzRhVzNHWmVYcUVCQ3BWZUd5MnlkdGNHcThPOXdLS21pRC9hM1N0Z1NLQU5u?=
 =?utf-8?B?YmZYZ0k2UzdDSE5qTUlzN2NRMHJKbC9VdHlXOVZBYW40R3lqcFlZcHMrcGc1?=
 =?utf-8?B?Yit2a2VmSThyYUoyNnlYNFJidzNjY2czRHZoVEdZcm8xN1F1SFJLTHMrR2l3?=
 =?utf-8?B?ZlRRSmFiTmkzZHk4b0NhcDVhalE5bHJjYlhvQVJBUW5Sc21DdS9SMEdQeEg0?=
 =?utf-8?B?OE9Hay9EREprRFg5WWlrTWFlTFJJWGlqbnNnWnVtM1lWeVZoU2c5MGFBOFRv?=
 =?utf-8?B?UldyUUJpK3c4N0FhbHFjZWI3UGxtOVQ0V3BReVZBZ3ovRUdVUTlGVmRJaUJV?=
 =?utf-8?B?d0hIaGxoUlpubXYrcEZSWUwvY0xpV3ZtWnBpdHBsbUZoNmhvcXBaWHEyMVpR?=
 =?utf-8?B?cWpFMHJqeDdCWWZ1ajZ1QlBTS0JNQ2hGNzhXZUJabUsrdkZzcktQNXJNNkc4?=
 =?utf-8?B?QmY0SFNEbXhDaUZLWHNtM1hqM2ttRUE5SUJwU1I2VUJLU0lKb2dEcStGVE5R?=
 =?utf-8?B?WFhyeC85Zml1UmJQUWJkSkorYzgwOXNjTjd1Sjl1MEJzSXZnYkJZMzRPazV4?=
 =?utf-8?B?bWNvajFrT3JjcjB6MCtDeEN1YnBBYUk2U01PSWdyNlV2RmlMbVQxanAvVzdx?=
 =?utf-8?B?Rjd6K2UzMGxoQTl6R2JqeTNLemxwOUtkNWpPUC8xbnYrbnphclJMQkI2d3Nl?=
 =?utf-8?B?K0ZPTnpLNHhHUWRxc01xeU9TaGF1RGVOdTlPcjhsK2w4Y1hCOENZbUE0dFl5?=
 =?utf-8?B?NGE2T20vVDFLd2VIZ0V2SWcxT1RtaThiU1E4bmg1TThTUWhzaThOa01FV01x?=
 =?utf-8?B?YkRKV2ZHS2wvSjRLRC9USlRWRzJZZWlKYy9mdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR04MB7418.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWFRVEJBV3Nsb21FOWNpYWw5WU11eVZ5d3pmZm41ZHhRSmh1bzBMVEpDclQw?=
 =?utf-8?B?VEdIMXM0Y0l4Rzc5LzgyWWRJTE4rTWtycXVSanBSWnd2S0Rmd0toUkhtQ01T?=
 =?utf-8?B?SXZ5M1E2bHJjNkMxNXBVZXVycm85VUM4MzdXNjRDYUxBN3Z4d3hLWHFucitt?=
 =?utf-8?B?ejVjUG9wdnJSKzFQdlNxR095aTd0MlN5MGJzcUxmUjZHc05FOHhxQVJkckhQ?=
 =?utf-8?B?UWZxbVQyNjhZSWR6Zk92cjVsYS9FVmVWWFBkNUlSVG9JNXErQXBkdm9WRHFQ?=
 =?utf-8?B?STNnY3lQOWM4aHJFTGgvUmM3UFNwWGxQQmhNbzJjZkJGbXhkempZSG9PbjNy?=
 =?utf-8?B?YTJVOFVBQ0Z3VWxYUnJOdldLY0RpRC9EQjhCakNJODU0czJrakU5VmpNR3I3?=
 =?utf-8?B?N1ZmTUJ0NzJhQmxHTHkvMlNrd1F6cjMxc01saWZLZ1ltaVpXR0l2SXJpUkpV?=
 =?utf-8?B?cXEwRDhWMHlOZHlqby9RU0NUYVpWSE1oNWxjK2d1aVpxaHoyOFZ6bDljZzhX?=
 =?utf-8?B?YzMzSG1RbDhwWnFBL0N5T1RmbWRyRVJkWW9CSUprdzhMUCtscFNQYi9wTmFn?=
 =?utf-8?B?SWIyeFozWHJicEF3M1VlTXVtNTRNN0ZoenJNcjNGYmlENWsxV28rY0hhUzhF?=
 =?utf-8?B?Q2kyNWYvbjMxTzA2bmt4dGxyaDl0ajhYZnZOSVdlSUNJQVNDdG1XNEttMitz?=
 =?utf-8?B?RnVta2IvYnRBSEIrZ1RPcG91SzRzRWUxYURxWHlYUDFNQlFrMi9WdmxiWncw?=
 =?utf-8?B?UldCaWlXU0wwYTc1WDZnOGtHL1JITW5kSU1ESXU2SndyaUpxcUhSelFLak5H?=
 =?utf-8?B?R2grWDlyNzlMMDVodWd2KyttSVBMMEZDMUhZeXJnTEZNUHp3cVB1NGJUeWF0?=
 =?utf-8?B?YjROVkRGMDk4a2FwMzdSTzhVWVFJQVAzaklTNnJlMGNsSjBXeEdKTFZlQ0Ew?=
 =?utf-8?B?bm40TnFrcnptdHJvWEJycTZmM1MrTFkydnl5WHFzY1oxYjZtVWlMKzFSYVBp?=
 =?utf-8?B?VmFLTXVBNzFyZk1nVHUrL2k0ZllMRktGd2VGT3VWbGU1ZDZrRzdBOEpUaHV0?=
 =?utf-8?B?NklUUVA5amJQc1VPL0VIZ1FtWE5VK0I3VnArTWw0dWVmT3BkcmwvKzRyQTVU?=
 =?utf-8?B?cnluS3hUdENhcEFoYnFWcTlKY3NzZERsQlYyemFEYkFxODlqOHIyRGVHOTNC?=
 =?utf-8?B?MjJSMlp2WmlMNEZrZWZsTjdOc2VtZWdwNnhwMkdpeURycjA2VkJGS0VKRFhq?=
 =?utf-8?B?SjBlS3ZPWU8wQzRGbUJtSHFab29YYWlNL3FFeDIyeHd3OW91TTE4aDZVMXR1?=
 =?utf-8?B?eWIrdGpSYk1FaStSVTFiNEh5RVNTWlkrd1lGbmtnWGRXL09lc0phdmxkVC9F?=
 =?utf-8?B?dHNqclBZOFI4NWwzRGhtS1BCVzhiV2xqZWhjaHZ4K3pWQkpPWmNYK1orVWMr?=
 =?utf-8?B?WTFScGM0MGVINjhhOHdVYnBYbitTMlVEN0pOTmMwWVp0Mmx6WWZtYnh6VHpW?=
 =?utf-8?B?eERuZDVraUdxbVVKKzBwNTVmWUxZOW5hcTBUdHhqNUl6cG5zWDBYazRHbjJC?=
 =?utf-8?B?di94NHlYcVgvckMzcGZOWk5OaHpkMEJTTHdFOEkvK1IwbkVLMWptMFowU2ZK?=
 =?utf-8?B?UEpYSFp5NjFaUHVmdTAyMUlVZlRkSUJDZDllYy91VGNIUFcxOWFzdVVXWkhH?=
 =?utf-8?B?T3RiSzY2Zmc3NUZLcWVQSkhpWFlnRDhid1gyTEZRWkhHVjdWKzZJTlo1VE1J?=
 =?utf-8?B?WWRWZWtDTFV5T0lCRytzVFdWcE8vQkpwVUNCZDFYRE5wazFCOFVLZGhzOVFP?=
 =?utf-8?B?THdWZ2F3NVNWeEl1MmNHRUxtenA5ZEFBaE0rTkZ3a1l1RDVkSFJMNTVYcGw1?=
 =?utf-8?B?Tm01cDlFQmd2K1U0b25Pc3RGQWg4UmpUUXFiUFRvVk1WWVNoek9icXF5c0t3?=
 =?utf-8?B?U2g0TE5rZ1U0ZGJoVmdUU0ZYSmJJMmVXT3B0TEpyRVR2NnpuN0R4Q1N6RFNS?=
 =?utf-8?B?aWNWaHdHNzFNa1JCbjFsQU1nY0NBR0h1eXpVL21RVzBqaEFtRmhXYmpxRnpo?=
 =?utf-8?B?VU5VOEtFODFMcWdJVjZyaUVKN0xLNk9idWJnV1VZQm1DYVdmZzlrUGpzdzRz?=
 =?utf-8?B?eEhBSk5Ud0l2OEw2aWtrYmFyditvTC9Ud0RQQ3VxUDhFaDhXRUZUNHVyQy9w?=
 =?utf-8?B?NFE9PQ==?=
Content-ID: <2A7745910216B54498616AABF4ADAC86@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 7FROIVtkbgysyEFELxgkEAGryUUL1M3x/AOFHuFY9/pTUfT1dnt5xYvi3ug85rWPISxo8EhSpobpUiIQTAMf3Vu9OUPwWplV7ikCAzugX2y3KG0E7dCHWAP4SjJhrCXpw0ehwRtM4U+Y33bB/vTqiqYHbj8nnf1rUuyOq8p8oK3fnS6mKzEF/k0WkC/xxd4hbiAFrKLksOi6NI9gqFqi8bm/TYbHru9OLFmFQDcR+zdHcGulISoPxiAvHynTifp0XvZLC7wVmMAoPMoO+DN2Nn4fbCz3mqZe9GP3VAGXey/6WW1JPVydTojizGuj7pNZvSf+EpfXo76w0fbIh22TFv5UHaD7I+GCA5gPhLbDIvO2Js7c9DVnrJanf7Zyec9Pp+QMA/GX+8WM78PMg9UHqhyXZrnhvUEbZvNsDvpLbgWKs9ysNvleTffrMnlK6EpQzP27A3F2t0ZxN8eYlrXFRDyhz4k/qSn11eQhSOKG417vZEK5HWNd75dke2X+iGVhRpNtXY2mQHrJR3kjYYZy+9ww1xZGJiUyKCiTwwEyhYg15g5/QqKWaBqXnY4j1ba3wkH+pho3Y1yLiiZuh+aBbJggkF1t/6I+yL4PFTYimLngLo6O+o3Q4Hn9wTA1PPTD
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR04MB7418.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a71c139b-2b8e-4063-e2de-08de2b2e339e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 07:50:56.7146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p8+pWvcmowaZFTZfI6FEBBHoC7DU0zWGXHnFQimJkBZNIi9zrqSv81wm3zAlrgTFDaQraY/p/Dh7oQBl5av3bX9qhURK8lrE0vWA7lS4bZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7288
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Looks good,
 Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vNRbB-0005ww-CJ
Subject: Re: [f2fs-dev] [PATCH V2 1/5] block: ignore discard return value
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
From: Johannes Thumshirn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
Cc: "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Looks good,

Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
