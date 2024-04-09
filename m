Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7160489D03D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Apr 2024 04:09:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ru0ur-0003qy-9T;
	Tue, 09 Apr 2024 02:08:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1ru0un-0003qp-Ut
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 02:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fP7CaEBprjrDwlnc/V5JpNsdZJiZUAFzS1DoWtixOjU=; b=GnxTUfPU1QiWmS0VgnMNlmE3mZ
 9fFQHccXgfvX1Hs/ZbZAPxRxYZ6lOES5Bg7t2iqB69pu1z8KvpK9+wlQoapgY4fxdvy3P9Wyw3s8Y
 JqSmlN4tHN6w/lTQ3fssT1l8NtT0lzxsRmp1ocA5a5U+5Um48c8KYDr+485NwrNDXTYY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fP7CaEBprjrDwlnc/V5JpNsdZJiZUAFzS1DoWtixOjU=; b=IxEp38atXq5VQhedvI2pMEv76I
 s75Apjgwiss+8hzLajiSy65t7i+pGg98w6t8l3yc4mlUPNxWWIReNrkJW6KVDbxeKN60SSYuvcyMR
 pDxni1WI7mRQC5KPdRs69fTzBXf7QzVOLazTp+DLUG6byIR/9EnRWcZNWZeeYkJBGXzI=;
Received: from mail-tyzapc01on2102.outbound.protection.outlook.com
 ([40.107.117.102] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ru0ul-0004kw-N6 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 02:08:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ij1s//alTEOFMCQPYzR81/CTaGEv0NaZu7gjo16aJyni9WoW0MsJZTA4zN21AQfhtHN6QMEukgmvpzmEPe7gYrl67fRwOR8ooSP3w8tBEV8292p0qbWpt7JZSvL9ZRq1gr91mNJ1oIBtt3Y9CSPy3gXqqLxantHkYvw1x7+jE8OsRbZJhP77vTfeBN+TAr8KmSJxamYOxGpt6uywKLHkNDjBYlG6ObU2735aJoyhji/f7E2BpRtmzvp1L1MMhAOx28A+9PBtJAIRVLMuFQCgphqH9ZlYUEGXDHx80ZVVm9z+OvlW43nVLxxha1okxd4AhhlFXxfvT+9a8iFV9PCiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fP7CaEBprjrDwlnc/V5JpNsdZJiZUAFzS1DoWtixOjU=;
 b=Glxq5/senWWbaJOH1Oqk5pL7ao5DY/Qm/shLvkUBMwu//5asHpnV6glmaV1MRfSTnjbB1eZIYRSkMM44cxMX5UM7ZiEKJ9clklNQLjpEtDdyX9PQU+v4nEPiYSrnpii7YqFJnKnI2uA05io79tFsua/52yF4zMURvPKlC1aXI/TrQ8wWYNnK3mhGG/4TE5Zs42wuC5u9xsLf2U1fbWWGrW+gZuykKIG7DZCfelMt1PTN8Q2irketrY/Unk+CAS9JJd7M+5py55cMV+wAxNxTiEGF3Wg6+tETwLV0PHL6tT83nWLLytLcUK0tmQk+frS0DxV0PvMeRiw39lyL2DfTog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fP7CaEBprjrDwlnc/V5JpNsdZJiZUAFzS1DoWtixOjU=;
 b=m4IgidumysE/N/gZetIg6HnsKIxvSIN9XDViHupZcEOuB0DMvAg7nbz+I68Zmw/lOg7hmkN4sfzop/LzghcCvBasPAjnIroPm7jVaK7sT3JgGn43xGz5KI9b+Yo0eYiMgCkdCHK8LUI3qZNn1UWEY2/atIczspArU+wwCI9WZT4=
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6788.apcprd02.prod.outlook.com (2603:1096:405:2b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 01:54:29 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::a99e:50b1:70a6:3afc]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::a99e:50b1:70a6:3afc%4]) with mapi id 15.20.7409.042; Tue, 9 Apr 2024
 01:54:26 +0000
Message-ID: <cd9b10d8-66a7-48a1-a764-b9424b2e1fff@oppo.com>
Date: Tue, 9 Apr 2024 09:54:22 +0800
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240408131157.4100204-1-shengyong@oppo.com>
 <ZhQ4yRwASLuwnzpm@google.com>
Content-Language: en-US
In-Reply-To: <ZhQ4yRwASLuwnzpm@google.com>
X-ClientProxiedBy: SG2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:3:18::20) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6788:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pL/WjRhTb1f5tgwZZ4VIEEVMBvYB3rXSBzA/wyoctg52mgRaksJBgBruEq48c0YUTDd6opmT2IYzPnAUJfiHljuKLfD1NwWWQDw2pE32BAFUdwcIzD04iQr/xiUYubgw8nykqy4wMwK45oIZBpilPEf4+ish3XBW9VyrWpd2Q07G2K5GZWCrMXu1yNb1kgShZs0R9Nv9GIT0PKkOsd/U0an4a7MDD9Hl1NsoJ9dOyrosjxUDsnmwKsuiLnFCxaXH81PTOzATfQAmYRW4dTjSGWz200MOYWh96WOSE2t0PBzb16QqryUe013oDw6QijrcC6E0DrYSz8YCpAuXRT135PsWBPy7ZfggPaStsqfLqYXx8PtIZDLZdtCwS4uPvss4iajNk6AgYcjPYeX32RsWkJd3QEj8tLH07jjhKecP3l2Ow9m83LvdNrtjngKaoaQozl9ANKuE9uXbf22IFAxcpi014StLGkIbgJJJdfI1/RgFOYTigcJ5IF3iU9WcldnQXjdMVkLM2CMZgE7MvUbFvTmjW3gHKSTfHXt8wjHfuaxSu8AdXKIqenauBBZcVJE/ayJ9gUlFotvUZfDXwRz43FBUvWTDVlZUBbtVmAwxhNDuTclXw2VKF71BIQhjL7EKdv8qtNHnm2TxED4Jojt3XiVMVQ1kEBrG82CAK5XMN0w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVVqem1MVnUraGpJZGNrYUVoR3B6cmthelVTWmx5dW1Hc0RweWJSNENPbGtC?=
 =?utf-8?B?TGR1eFVwUmZQZDdENEhUOCtkdlJsRUsrTTFXNjI4MjRLN1lucUxqcEFUWHlu?=
 =?utf-8?B?SXJVWTJkR3o4R0crTll4bytCOUpKTnhUcnRQWStUU1RQeFRyWWs3TW9EQXVn?=
 =?utf-8?B?bWdLT3NlWHQ0bUpPRkcrTTdEM3R4aVRhaTNkSGxYMFA4c3dRaG1tdmVUcUUw?=
 =?utf-8?B?eEU4TXhOWVVtSU14a205ek1Ed3Z1UGNaT0Q5cHhkNkZPTVNkdE9URlp0Q05T?=
 =?utf-8?B?RkJyYXdrV0paVnBBc3BGeTRPcS9CTVI0eng4ZGlPUmFvV3duRUxxRmFCa2FV?=
 =?utf-8?B?ajdNbmdNYkFhdTk0SFFSRy9oNjhVV1NIVDJ3SVBMMjllblBGbkl4N3ZCOVZs?=
 =?utf-8?B?cFBaNUFNTDZYbEVwbHJsYTdDcVd2M3FTR1AzOVVUTEU2MHZZS21CMS8zSEph?=
 =?utf-8?B?TzRnOUdXOGxGL3k2S0RQd29tbEM1UlcrZjlwb3JOaTJSZys3RUpQVHNhc0lH?=
 =?utf-8?B?UXVmV3JvTVdYTzZDMVBOS2lYa3JzVGsxdEY5bDBzTmhxOXIxRFJpc1hDRkY3?=
 =?utf-8?B?R2psbDBHRzdDeGZmRFNwbDhPZkc1b05JTlE2d3JyQzBNTlJ3cGEwRWQxc1VT?=
 =?utf-8?B?VDFyYkV1R1Zud2IrWElmNjFsM05ZcjI3Z29xd2dYNk94UzNlWjkzOHdITEZY?=
 =?utf-8?B?K1paUkN3TThvdHhsV0VtL0d4TGQ5QXZHSWIzd2p1dU9JaFBtS3dXSXpkZHdH?=
 =?utf-8?B?WWhvSi9mczVmUmVJL05raVIyYnRkMHFhalZPQ1VnclFEV1lYcWVyNUxaK0VI?=
 =?utf-8?B?NUNZZ2hNTmtwcnd6QTYzOXhFK21kZmc2d3kzc3JpYTZPZXgwWlBsSGhOU2pB?=
 =?utf-8?B?bXdQcExhOGl6WDlETVBkdU90ZW5zNGdrUzFZeDR4ZHdJc21pWTFBMElZT2JW?=
 =?utf-8?B?RE1JM01UTS9tKzBkRUVaVllxWDZJUHZ0aThJeHZ3cCtkVS93aTZUaHZjVU5m?=
 =?utf-8?B?T0Jrcld1YThCS0pkYkJqUWVpdy9QQ2RDY1JyWHBtUnJpOXljZG5selVDclJL?=
 =?utf-8?B?ekVMSTNOMFNqV29yRW9hRml3K0dGU3hHTHRxUlE4dFVnRXhmRmRnVnkrWTlN?=
 =?utf-8?B?WGJ1Vi9yWEYvQW1oZUN0dVlnK2JBZDBDdkRMcFRCZGJJZVQ0alloN3FFMXR6?=
 =?utf-8?B?V3R5dGRWMWRMcThvTkJ4RjU3Ri9LNjFXZk5lYTlOdkxuOHc3NU9DVWZIbUYw?=
 =?utf-8?B?YzFDWDlORWpxNDRyK3RwaUhCZXJxV0p0dXl3YWl0eFlqdTZ2aGg1Y2RNbkV3?=
 =?utf-8?B?TTQ3ejdlY2J2RDROYjVVQzN4L25oU25sWVNFYXROc1ZSUE8wYVF3K0hGZ1dp?=
 =?utf-8?B?L3pjSkxWUzlESHlrVlNic3FMSlhXZ1hBSXpwZ3JhTjRSVXBYeEFCOGZUTk54?=
 =?utf-8?B?eTBPMTA5L1RsZFVqWnNNVWZqQ1hBd3ZTZHVwcEd6TXBsazNMZ0MwN3FLZlQ3?=
 =?utf-8?B?SWpVNVJKTHNlWEdML2lSSlpWcFo0K2FFQUcyU3JGRE9zR2l5UmYzY2l0RDk2?=
 =?utf-8?B?V044eHVMeVp5M3NQUk8yR0xvYS9qUCtELzV4dlNUQUlGTEJpeFRGZzZBMFY4?=
 =?utf-8?B?M3QwK3lEOUcrZm1ZV3c2RGRnUWtlSUhHaG5td0Q5UnJLOWlGalQzMDVWc29I?=
 =?utf-8?B?SXZmUFNEMm90ekVBb05MSHNmcjFZZkoydUpYak1VbTV5RlV1ZGNFYmE5ZFU4?=
 =?utf-8?B?K2VlcWZjaS85czJIYURKNSt3dkNUVmluQklaL3pLbTVNSkxxOTA4YitBMFRY?=
 =?utf-8?B?ckd0bHhaWXVHd1VQV3VWWGxURGhTZ3FDeUYzVGpDVmlCN01EL1E3cHhxdUdQ?=
 =?utf-8?B?ckp0S2tYbVVyYk91YmtYTWVmbmNLRFB4MnAvUVRuRnJwMkloc1RZMVhZRHQr?=
 =?utf-8?B?Z2F5OEhZUmtESWxlMGFOZGd0YzVIcFhPaG5NQmIvTE94dFExL0ZDRW1LSFdP?=
 =?utf-8?B?K2ViTmo2S0htU1EwbStOZDJJMVgvcHVid1NPdlhrVVFpeThkYVRFNldBTXRl?=
 =?utf-8?B?cjQySlFDTHMwbFg1VWpTVDlLYlBHanpsTWhrWktMRVljMi84VndzSHRmbnBY?=
 =?utf-8?Q?z1S7Nr2uM6+blMqvpVCzKfa2F?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec534f4c-3508-4537-9eb6-08dc5837fca9
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 01:54:26.6959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inXgUQQ2MZTrY28AWJEBFb/55FSoOO6/MXYUQkHzpIo1dDvyoyKnypk66b2UkXG7COZIsgOf5IFess5pmayH3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6788
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/9 2:34, Jaegeuk Kim wrote: > On 04/08, Sheng Yong
 wrote: >> Althrough old and new sb have the same value for now, it would
 be better >> to build new checkpoint according to new sb. > > May n [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.102 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1ru0ul-0004kw-N6
Subject: Re: [f2fs-dev] [PATCH] resize.f2fs: get value from new sb during
 rebuilding cp
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2024/4/9 2:34, Jaegeuk Kim wrote:
> On 04/08, Sheng Yong wrote:
>> Althrough old and new sb have the same value for now, it would be better
>> to build new checkpoint according to new sb.
> 
> May need to add assert, if they're different?
> 
We could add assert here, but I think it's not that necessary:
1. rebuild_checkpoint is only called by resize, and new_sb is copied directly
    from original sb without any changes of these basic attributes.
2. for now, new_sb has the same attributes/members with the original one. If
    those attributes are allowed to get changed in the future, the assert needs
    to be removed.
So how about adding a new helper to check and show the difference between the
new and original sb?

many thanks,
shengyong
>>
>> Signed-off-by: Sheng Yong <shengyong@oppo.com>
>> ---
>>   fsck/resize.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/fsck/resize.c b/fsck/resize.c
>> index 049ddd3..1b4ae85 100644
>> --- a/fsck/resize.c
>> +++ b/fsck/resize.c
>> @@ -481,7 +481,7 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
>>   		set_cp(overprov_segment_count, get_cp(rsvd_segment_count));
>>   
>>   	set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
>> -						2 * get_sb(segs_per_sec));
>> +						2 * get_newsb(segs_per_sec));
>>   
>>   	DBG(0, "Info: Overprovision ratio = %.3lf%%\n", c.new_overprovision);
>>   	DBG(0, "Info: Overprovision segments = %u (GC reserved = %u)\n",
>> @@ -551,11 +551,12 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
>>   							cpu_to_le32(crc);
>>   
>>   	/* Write a new checkpoint in the other set */
>> -	new_cp_blk_no = old_cp_blk_no = get_sb(cp_blkaddr);
>> +	old_cp_blk_no = get_sb(cp_blkaddr);
>> +	new_cp_blk_no = get_newsb(cp_blkaddr);
>>   	if (sbi->cur_cp == 2)
>>   		old_cp_blk_no += 1 << get_sb(log_blocks_per_seg);
>>   	else
>> -		new_cp_blk_no += 1 << get_sb(log_blocks_per_seg);
>> +		new_cp_blk_no += 1 << get_newsb(log_blocks_per_seg);
>>   
>>   	/* write first cp */
>>   	ret = dev_write_block(new_cp, new_cp_blk_no++);
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
