Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B26A793A081
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jul 2024 14:30:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWEes-0007c0-4Z;
	Tue, 23 Jul 2024 12:30:22 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mika.penttila@mbosol.com>) id 1sWEer-0007bp-0E
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 12:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y8TwekNpdN1y4VFj09Ow6qLGldPY3FW9/TkeBb1YhHY=; b=dqcEdacEPrUyzQFjOwLELUrtHI
 ScQaQFDcK8yO+5DKewmc8tPOYfH3/jYJDrbI6XCoB6bVWLwiesOfwDJ2Yl8VPSs7RHWTm0SF2XMVH
 xrpi5EwBrSWi7kP7sCtzy0jrV6vqdaC/VdcuvbZ32TcMlVw723t/nPFiTmsR9INgKHkY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y8TwekNpdN1y4VFj09Ow6qLGldPY3FW9/TkeBb1YhHY=; b=C0oiKAC3+x0IDQgl7x5MJJdNRW
 arQMcUVmm7UgmuXW3IvJ6VW+suBMLEg469hD+jq19zDHxNo1q+K9S+Z+iKjXUcvDPZPPoYRxD1v2l
 oyLKrwTr9MEUAFj2MZEGyR3553C8N0Qs9lXWYn5o8/uznKrzHidEXLgT+MR45ngi6J94=;
Received: from mail-db8eur05on2096.outbound.protection.outlook.com
 ([40.107.20.96] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWEep-0004kZ-VH for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 12:30:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gzy0Ott9CJ7xYgqSYGRJR3zf5BpyknVcfLV3Gcvh6Dw64LZYFRE8YbjXx9J3vvgrD4886AjuhQ6j2NLasQzO8ZumQxzPLu+NX1E7afOAug0YiY0gJ8xVp5o7e/zxh/Agdz0GYUMbVQ6FNc1cUaEuapzJf3cgFCkz+0Q4S8TRTwTapzA5j5p1oTviMEmqkEHo52Uv1UuTqgLxwZgbUMQjWMqRe6UqkoUryVCz5idjCA571kQOU/AZl30oZ/+NbLMKt6WbiU2CBVXTXhQExrOJo7NQW741JQ7LhfKOyyZq7d6b9pCqZAmkfS8XwKwqYkrArSBrXEYPmdR+RKt7m1VBAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8TwekNpdN1y4VFj09Ow6qLGldPY3FW9/TkeBb1YhHY=;
 b=q8xbjlcsf81XumbUWMoB6GeOs+04BZZ0qv1hoUW0HkZO/ZSYqgGLGu+HNKZHKqi23abZLh8Jq1XznVyFmT8LZz9NFY9guM4KBAEBOuTspFBrshjIZ3d8A/G54eQ4jDVbOhy7WrNesEMmlPE1bBg8LJlHPNGW4SRL1fdj50jqx1tlGxXOA5iekiIuod5DkNn9Kt6dYDdriiDkBt4/KIsYKYpJGftTqW9p60VxuDTz92ENt/T7v6VcNDXzF81BTj+p4WDkn2Vp5n5cML4SbgddcrpMWQiaDvelQQvhYElpalH+vPIQZfY4OavPfdfBR3U4fZyflVMxkbGR4h2MoEyD4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mbosol.com; dmarc=pass action=none header.from=mbosol.com;
 dkim=pass header.d=mbosol.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mbosol.com;
Received: from DB8P192MB0533.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:16b::17)
 by PAWP192MB2226.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:35f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Tue, 23 Jul
 2024 09:58:13 +0000
Received: from DB8P192MB0533.EURP192.PROD.OUTLOOK.COM
 ([fe80::5e04:af01:44a6:f354]) by DB8P192MB0533.EURP192.PROD.OUTLOOK.COM
 ([fe80::5e04:af01:44a6:f354%5]) with mapi id 15.20.7762.027; Tue, 23 Jul 2024
 09:58:13 +0000
Message-ID: <4570c972-de09-4818-bd1b-3112f651b49d@mbosol.com>
Date: Tue, 23 Jul 2024 12:58:10 +0300
User-Agent: Mozilla Thunderbird
To: Youling Tang <youling.tang@linux.dev>, Arnd Bergmann <arnd@arndb.de>,
 Luis Chamberlain <mcgrof@kernel.org>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 tytso@mit.edu, Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Christoph Hellwig <hch@infradead.org>
References: <20240723083239.41533-1-youling.tang@linux.dev>
 <20240723083239.41533-2-youling.tang@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mika.penttila@mbosol.com>
In-Reply-To: <20240723083239.41533-2-youling.tang@linux.dev>
X-ClientProxiedBy: GV3PEPF00002BBB.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:15) To DB8P192MB0533.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:16b::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8P192MB0533:EE_|PAWP192MB2226:EE_
X-MS-Office365-Filtering-Correlation-Id: d665f04b-c932-44a9-6477-08dcaafdf73c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDJNbFQ1eHM2QitpNmdqUG5tZDRXS0lUZ2F3cUZxVXBzVEFSKzBCZFFHOTRo?=
 =?utf-8?B?Q1R6dHg4SFVWNVN2dzNBdnFuS1ltclZhazA5ZkdWVUEzVVpXOHBEcWMwSjVl?=
 =?utf-8?B?endlM0RoZmRtU3JLQmdBaW1jOEJRY0Q1cXQrVHdaYXEzYUZyc0FQb1dWWkx4?=
 =?utf-8?B?enYraEk5VWRrdmJteW1xZ1RhVGJDUzN2RDB0NzZMNEdQbnprbjNmYlNpdmNi?=
 =?utf-8?B?QklPMHJtNXhvWUs4MWQ2VU80cDJJa0RHN1pOQzZyNkpvcTFxK2dITnFBUGI2?=
 =?utf-8?B?TFovamQ2WmFFMENOZGt2eWZ6Q1M0QmgyOXJydllpVnhhNEI0R05MUXVNZXpw?=
 =?utf-8?B?QkVtdEFoMmdGZldOR2pISStNZmNUZWt0enlScmZReWV3S3A0NHpvemQ2bk9t?=
 =?utf-8?B?RXBOcDdmMGs5Q3g3S09raGF4Uk9nTEZ4MTd0V2tZYVhwRjNSb20zaENINXlU?=
 =?utf-8?B?M09MTEllWDJsVzFvbVJ5L2g5NUlRbEM4VXVJY2RrdEM3bmtvaDJ1aXEzdW5L?=
 =?utf-8?B?VnZHK1JWMEt6NUM5NVJ6Ymx4d2NBZ0FiZ28zRkJnZWtPYnhPeEtDUWx3dHRP?=
 =?utf-8?B?eG8zb0tlY1MrUWlrbWxsemZkbXdOTkhRWjZxeHJKUXRWYkFSSFk5Y0dYSUNw?=
 =?utf-8?B?VEc0ck5yeFNlT3BqNVFHNy9OV1hMQ1ArNit0aGVBNW9hMVp0ai9xYU1NU2Iv?=
 =?utf-8?B?T3huZEJka3VjcmxMd3NhNGNUcXhaSXVyZTV5OE9ad3pISGYxVzltWUl0Qm1F?=
 =?utf-8?B?Y2JyTC9wNGVtN1o0NzZhWUVDQVhkbjhZNTh0cTZGV3d4N1lCMXp2aXRXeUR4?=
 =?utf-8?B?ejYraE4wMHhYekU0aEpZOG4rZ2RZOE9YY1NMdGU4Z3UyM2lVL2FWZWZGb1VV?=
 =?utf-8?B?N2kwaXFzdnRuZ2xUM2F3eGExbVAxQVB3S1J4VFBEZzJnUVB4ZUljYmplQ2FK?=
 =?utf-8?B?WDU2Yk9FbUlScVdzTCtFdUYzVGhvSFJNVW5abzc2ZWl5QXczQzgyVVZFcUdq?=
 =?utf-8?B?bHFtVkRyclc5VXhjLzlFMFdUNWZnQnp5cmdkK2ZTMFAyUGRRanRIZmFmTVVk?=
 =?utf-8?B?NUlPdWN6Wks2ZzRMV2I1WWp1VnQ0QUtFdGlBdHo0ODAyaUVaUXd4dS8yUlI2?=
 =?utf-8?B?cUlna3RsdU9JV244bUZSZUdCdHF2K3VicG5zaDhLNkZCbEhwRTUrWjZ6RXN6?=
 =?utf-8?B?b2NSTFVWVmpZNHBkWlZNOSsxR0ZsZ0ZFTkZKUlNvQnJYdTVLWXJaWUpYQVkx?=
 =?utf-8?B?US92TnBFV2RDSUpBekt1ZnJWQ3BsQnZFSnR5NUlYemdNK1NpWGZzYXpvT3pa?=
 =?utf-8?B?SXdxTWJpc0M5NmpVMmVpWXptVThQZEFaK0ltWDNCc3NRU2xEWmV1UElkbXZQ?=
 =?utf-8?B?c0s4SnlPangzMnlySk9uSGNNL3NLbEttYXNlOG5rMWxIdjZMOUh5NE93VXRJ?=
 =?utf-8?B?eWVLVjhKY0ZXRCtEd2N6OWU4NU52d0F2OVJUUFB0KzV0eW9QSWx3M0JDeFhh?=
 =?utf-8?B?RmFJZk9qZm5ndHNWOHFZZGVHQVN6WHhHOW5EZG83N3U1VVl5bWdmMW5JdHYy?=
 =?utf-8?B?alVWMC9KTTFzMGtNREI5cWJFc2lLY2tjdXlZVnJ3SmdWczdjdVN1WGNrbHNH?=
 =?utf-8?B?VUkrbUhqNmFXUDQyZXlNMmE2VGtjMlBiSUNTYW5qUjM2bVZ0bWZ4V3VBUW5P?=
 =?utf-8?B?ait4VjMxOGxqMkV5bFZIRWNQTDRYYkNtTFhYRHhLa0VpSmgrWjNYTTQ1SitU?=
 =?utf-8?B?YjJSV3cwckJESWhVSHcrbjc1Q3pMd2ZpR1FMaTFzY0JRUkRPSzBXcHY2b2h3?=
 =?utf-8?B?dUg3QU9xdzBxS3RScFRxR3IxZFpubFRDSllHRk1MSUd6VU1nZTVrN0hJZUVE?=
 =?utf-8?Q?0wsXOecq/zT7H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8P192MB0533.EURP192.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzBUZUcySnJkaEdsTUx3K0pNeTFnQXZHVUNuRElzZlVEVC9LOG82MkR5ajNp?=
 =?utf-8?B?aGxhSHVjelpISkVSWWJLcWRYcUNrakUrZ2JYeVlPUXNWNjJyWWFDVDNJaXBU?=
 =?utf-8?B?T2ExdlNxNmNqbG9hcHp3NU9oSENBM0gyLzRpQ0NPTThCZWVPZlVHUkxubDJ6?=
 =?utf-8?B?dlhXTnp3WFdLUThFd2dLbUQrVnpLY3I4SlRNZC9RbDJYM1dSNnNVRzdoOVFi?=
 =?utf-8?B?K3JUVzlEWTVNc1lEYXpuNzRnZm9CZlNjeTRXS0YxWTduMVVGOHYrNThpMEpC?=
 =?utf-8?B?eCtGQTZLVHZ3cVNWOXl1ckRXL2FwMGt4S0tXQTBoMmxmNXltN2g3WHhyaGxi?=
 =?utf-8?B?Zm5VWFduZGlTM29BeFJBazRzb250eFNrem0rRFlQT3o4emxFRGhvVzlqcC9G?=
 =?utf-8?B?YndISndDSytEdXVtYnB2eFVxTEM2eDY4NlgzZVNqVVN3MS92allXbFdvU24r?=
 =?utf-8?B?bkhWVk8zVXE4WHlubjVqVnBEbUNUL2htMTBBZkNjYzl5TStjeUpIbUpJYm43?=
 =?utf-8?B?cm1YNGRiU0NmV1VVd3hheFlWOTB2TDVsekNlS0FTS2Q0aU9EZ0F1WFp5aHd0?=
 =?utf-8?B?bVFJcUtkSmpnUHdPUk9EUGFJc2k1cWs0bkMvR3h4Wk50NkEzeDMveGUwQmtq?=
 =?utf-8?B?aHU2YWJOV3VwS1JzMHlvN3AxOHYzZ1NodEFEaHBoMG42VzNXR0tJZkd4NzFh?=
 =?utf-8?B?QkErMXFaLzFhb0pGblRFUmtKWGhRVXVEaHFuT2dra2JsYVh1YWlVNHVQSTNh?=
 =?utf-8?B?SDVhZlFSWWhtVWNyUDAwNjdTeXg2YTRhYkJHSm5JNEhxZi95aEZTY3JLMTNJ?=
 =?utf-8?B?R2t3YnNPenhkZXo4Q0M5ZGo4M2MvekFkQUdUQ0REL3psanFOVm9RYWtUYVBN?=
 =?utf-8?B?d3hzVzZrcU0vWTk4QThGWCt0d0dTcVVqZkhxdDRVYm0zanNBSUFzaEF3UGhC?=
 =?utf-8?B?c2V3dlJLaG1lWmJld0NNMHlhRzhGbGw0SXRieTdYZk9SWmJJTS80aTluTHN2?=
 =?utf-8?B?RFBIWFp0MEFQc2xwOC9Mc1d1RlJydVRtSlYyc2dJV0hCUDlhOUJJQnBLR055?=
 =?utf-8?B?YnAxRVpUMU1TbnJTMXFNR0w0Tkw3NTNoWnczMnlmY1lGRzZMT2tMS284MGdN?=
 =?utf-8?B?UXNMeERPbUR6eDJTRDVnMlpmQ2JoSUpSR2p2SS9MZ1hqbnRLWlFkL2lwL3Fn?=
 =?utf-8?B?U1VIK0lMbFNyVEVMTmJ4ZzdqMkVlT1hNYzFFV3dDWGJlTm1RSzRBN2ZxcHdC?=
 =?utf-8?B?aGFKSXpIYjQ2OUVrMHJiU1Y2ZERVSTRwblJJQXcxWDR1MkY3RFhtWEhGd2Fz?=
 =?utf-8?B?c3d3Y1BMY3FnQksyVjN5Zi9sQ1ViNFEydzV5eGlSbHV0SXQzTm9MRUtwUHEw?=
 =?utf-8?B?VmhRbXN2OVVzOUFySkVhQ05UZVlaUlE1UXZKc1dZUTFyeElvWldvZmRtcjls?=
 =?utf-8?B?Yms1eFdScnNYa0xvNi9yT0p0elFDNmFRNXA4Ukd5U1E1Y1VGSGN6NVlpWndz?=
 =?utf-8?B?U080TGN4M09RK1QrN3Q3OWNVaG9iOWlRcHJGcmQ0VTJkV1d6MThSdnd0WTlk?=
 =?utf-8?B?VlZ6S3JLN3prOWtSb1FJd09zY0QyKzRGTmpCV0h5dWpmb2luWHR1Q1M0cmtJ?=
 =?utf-8?B?M01vS3ZrdDdsTmMxeG4yY0U0NFhITVFhNG9oYWlTUEpxaHlLREhSWnZ2LzQ1?=
 =?utf-8?B?MnZ4MVZWWkd1QkdWMzgwWVI3VFBMNWVjZ1YzV2F0cW9oWWYxbUVjUXJZaU1i?=
 =?utf-8?B?NStPWFh6NEtGVWhMUEVVMEcwTXdiR2ZIZ0tzUzdZZ2dBWlhFejE4YnlFSkhU?=
 =?utf-8?B?dGltVjRXb0pORmh4ZS9xVTQranMrcVhzaFUzY3BWck8xLzBPZ3krT2hoTU8x?=
 =?utf-8?B?dStsRTZadWJIN0w2ZEFmeWtRajI4THFJdnorTk8xMTF1T1ovdSttSzhzdTF4?=
 =?utf-8?B?RDY1Q2hmR0lzOVI2b3ZZRUVuRmUwUGJyRWszZ0poZTlMcENiSUhaRG4zbGtC?=
 =?utf-8?B?Q1FRUk14M3A1bUczNlV3RkxsZ1R1Y2JDTFFNemZjUG51YnZkS0sxdnhxYUN5?=
 =?utf-8?B?Tm03VWxDYzdmL2JFUGZUS244T3JhaGRtbW5oUFFSYWdwWWsxUjlpc2szWUgv?=
 =?utf-8?B?LytqZk8rVVNLWVBIMVpVV0RpOUNUSHlKSDV0Uk9wVS93WGk1WURDSmNKcEZV?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: mbosol.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d665f04b-c932-44a9-6477-08dcaafdf73c
X-MS-Exchange-CrossTenant-AuthSource: DB8P192MB0533.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:58:13.3734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 571b6760-44e0-4aae-b783-84984ac780c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqhxMFIoG1MU/MZKk/GQFi3xErFEVy8UZfo3Y7VTG5eSiyC6v0wW4FVkiC/WGFH8RR0TsHpk4c1qzDbTxhp4r3vwBfdP2zvmKE1EQHxjUr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP192MB2226
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/23/24 11:32, Youling Tang wrote: > From: Youling Tang
 <tangyouling@kylinos.cn> > > In theory init/exit should match their sequence, 
 thus normally they should > look like this: > [...] 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.20.96 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.20.96 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.20.96 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [40.107.20.96 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-Headers-End: 1sWEep-0004kZ-VH
Subject: Re: [f2fs-dev] [PATCH 1/4] module: Add module_subinit{_noexit} and
 module_subeixt helper macros
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
Cc: linux-arch@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-modules@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 7/23/24 11:32, Youling Tang wrote:
> From: Youling Tang <tangyouling@kylinos.cn>
>
> In theory init/exit should match their sequence, thus normally they should
> look like this:
> -------------------------+------------------------
>     init_A();            |
>     init_B();            |
>     init_C();            |
>                          |   exit_C();
>                          |   exit_B();
>                          |   exit_A();
>
> Providing module_subinit{_noexit} and module_subeixt helps macros ensure
> that modules init/exit match their order, while also simplifying the code.
>
> The three macros are defined as follows:
> - module_subinit(initfn, exitfn,rollback)
> - module_subinit_noexit(initfn, rollback)
> - module_subexit(rollback)
>
> `initfn` is the initialization function and `exitfn` is the corresponding
> exit function.
>
> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
> ---
>  include/asm-generic/vmlinux.lds.h |  5 +++
>  include/linux/init.h              | 62 ++++++++++++++++++++++++++++++-
>  include/linux/module.h            | 22 +++++++++++
>  3 files changed, 88 insertions(+), 1 deletion(-)
>
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index 677315e51e54..48ccac7c6448 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -927,6 +927,10 @@
>  		INIT_CALLS_LEVEL(7)					\
>  		__initcall_end = .;
>  
> +#define SUBINIT_CALL							\
> +		*(.subinitcall.init)					\
> +		*(.subexitcall.exit)
> +
>  #define CON_INITCALL							\
>  	BOUNDED_SECTION_POST_LABEL(.con_initcall.init, __con_initcall, _start, _end)
>  
> @@ -1155,6 +1159,7 @@
>  		INIT_DATA						\
>  		INIT_SETUP(initsetup_align)				\
>  		INIT_CALLS						\
> +		SUBINIT_CALL						\
>  		CON_INITCALL						\
>  		INIT_RAM_FS						\
>  	}
> diff --git a/include/linux/init.h b/include/linux/init.h
> index ee1309473bc6..e8689ff2cb6c 100644
> --- a/include/linux/init.h
> +++ b/include/linux/init.h
> @@ -55,6 +55,9 @@
>  #define __exitdata	__section(".exit.data")
>  #define __exit_call	__used __section(".exitcall.exit")
>  
> +#define __subinit_call	__used __section(".subinitcall.init")
> +#define __subexit_call	__used __section(".subexitcall.exit")
> +
>  /*
>   * modpost check for section mismatches during the kernel build.
>   * A section mismatch happens when there are references from a
> @@ -115,6 +118,9 @@
>  typedef int (*initcall_t)(void);
>  typedef void (*exitcall_t)(void);
>  
> +typedef int (*subinitcall_t)(void);
> +typedef void (*subexitcall_t)(void);
> +
>  #ifdef CONFIG_HAVE_ARCH_PREL32_RELOCATIONS
>  typedef int initcall_entry_t;
>  
> @@ -183,7 +189,61 @@ extern struct module __this_module;
>  #endif
>  
>  #endif
> -  
> +
> +#ifndef __ASSEMBLY__
> +struct subexitcall_rollback {
> +	/*
> +	 * Records the address of the first sub-initialization function in the
> +	 * ".subexitcall.exit" section
> +	 */
> +	unsigned long first_addr;
> +	int ncalls;
> +};
> +
> +static inline void __subexitcall_rollback(struct subexitcall_rollback *r)
> +{
> +	unsigned long addr = r->first_addr - sizeof(r->first_addr) * (r->ncalls - 1);
> +
> +	for (; r->ncalls--; addr += sizeof(r->first_addr)) {
> +		unsigned long *tmp = (void *)addr;
> +		subexitcall_t fn = (subexitcall_t)*tmp;
> +		fn();
> +	}
> +}

How does this guarantee the exit calls match sequence? Are you assuming
linker puts exit functions in reverse order?


--Mika






_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
