Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 340C389E80D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Apr 2024 04:12:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruNRL-000702-4N;
	Wed, 10 Apr 2024 02:11:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1ruNRI-0006zw-QZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Apr 2024 02:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KmchCH+TbwKWAHROqYp86rrKfapXAyQ7F/NCu9CsW5w=; b=RkfCLWbC0o2AJbm1yPerHIlb7n
 422svtG4i3wgRN63ktydAKhXkxC4i+/DMIJK2dPDod52HWx4k2EERnfTGr6X6wUFz1m35/NPnMeuj
 vUVF8QKXbuElcBPoWzEjHjlfJhugZWwaHni8wtSlfBN07enxLx55YSliKQcLxZFYKtk4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KmchCH+TbwKWAHROqYp86rrKfapXAyQ7F/NCu9CsW5w=; b=MM9xBZ54VAoPXWh6hPTRV49sVb
 lGTBO6KBT6O9fKfuJqJQ2eNzZ9rj5SEjxt5i4+UEHGaW1i6pctUuOV73BHfO/uQsxwg2tkth5/pRh
 3mReSGJSqh+avz6Dni3CFgRsAGaKxG7YEkE2jWDFsOxV/e1hffo9chFjagevcRxeaIuU=;
Received: from mail-tyzapc01on2107.outbound.protection.outlook.com
 ([40.107.117.107] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruNR3-0002L6-W7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Apr 2024 02:11:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGBsrotIsy0hDwgeA4+wlOFK5IPMIRS6RtdqNNMsHpwI8+3YpYWyMe8GqXXxANd43q+JxekRTv3tKMK5u+eT1nJjBjFV+ICRNd+3yDwBK/9RNLNK1EPERzmK/RrFtK+mCFva+IjfvC8lWlZQFLang/1U/T3+otOXMao/byBC4T6QuMpSKVIgpkerIWuZgtP0mr5o+VO5BetFawh01rrE2/kHQl9TOzpWjsNUM/QFojCBCqM1rMyz2ZxR2vwULar8Sa1tN7YLmpYXNQbAboi2xFd+q/VU/exSCOxa5JaJXsHAq9rdnpy4rsgSuXtW68as6Q+9N2tDdHC9OtQaHx8vCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmchCH+TbwKWAHROqYp86rrKfapXAyQ7F/NCu9CsW5w=;
 b=mBJYq8bHSaWtscre4hQutQCNTIe6uM7dqho4rxsjSJwRPaBJpISa56scejsPUAUWLYhL0ddpLMhuIZhN0yRTeoylmazPY9A6ogDCkwq+j47NnKjFpvWoBzxQ24bM3HrunJo5joqnV0g8qfNauczvLdmgj1RfTDVVY3O6Lnx1Sua5LgLfQltyFHUmdW/RfcCW0quRGZE0akId+7c0b6MSc6Le5FXxzJMdEcwN7MnCS3FNKapYJKWHOKCPj1XwKpXWtohYhfWq+qzvCai4ZLvj6B8i6ss3VrOWa7ad8ldAwqt4JzpbIzKcRLXFhCTNWJ66bzno4YckiiUQYFc+t26tCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmchCH+TbwKWAHROqYp86rrKfapXAyQ7F/NCu9CsW5w=;
 b=MTpURBpjNxXbgI99FJoyCEwPgAt7KFHBjQEAHyNal3loiz59EeRGdBtIDq12GoRBMkEBuxA7Qp70mwv6vnxcDmVdAluO7SW5dPx8huTG8ROzo6NENYgky7wChdOdJsJLpoBchy/8aI+8P8R1oGHE4AMh4i0XHXLi28YsJCDl9m4=
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYSPR02MB7193.apcprd02.prod.outlook.com (2603:1096:400:46c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Wed, 10 Apr
 2024 02:11:25 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::a99e:50b1:70a6:3afc]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::a99e:50b1:70a6:3afc%4]) with mapi id 15.20.7409.042; Wed, 10 Apr 2024
 02:11:25 +0000
Message-ID: <0527ae28-706a-42b4-9f18-8d892aad81dd@oppo.com>
Date: Wed, 10 Apr 2024 10:11:20 +0800
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240408131157.4100204-1-shengyong@oppo.com>
 <ZhQ4yRwASLuwnzpm@google.com> <cd9b10d8-66a7-48a1-a764-b9424b2e1fff@oppo.com>
 <ZhXfbgxGIgaoxMP0@google.com>
Content-Language: en-US
In-Reply-To: <ZhXfbgxGIgaoxMP0@google.com>
X-ClientProxiedBy: SG2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:54::15) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYSPR02MB7193:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DfBDS572luXFzd8NTJ5nHW22Uia6ffNH8A1CJ2+MlW5WMPf7w/ezCBqcMop+00zdLRDvGYJM3KQ8qFmmwRO10K1Z8BVP4u8iArybNA66cQhK5qGH9qNISXvQ+AoScen+fRk4QGM/QIeja0nK60arF6aIpsbRr3K0on4BrFN+flMuC4I2hSpMMsDuhDUSs5M1wsqgje/VMHukCcxIRavdy6mmirYvgSoOaH689XbSpGtrFNLjgtNDG39ofd1BF5vz1e3A7CjbBChW+zCXDzfoYJFAZisqtOfXcEH4WqOZCkRkvP+YndosOmIcrQsYEJoo84djklhEh+4cgIRuTahTy5C51xAMPDrNBPED7uczJxyM4VIsvvhiHsSL8vyKRPk580TVOi3jmtJu737bxmP5MeAiWkVZcMzyMFRN5JQSfiPv7TSf35cUddJuyYQP20wvswdtiR293uk+1KrY4s8k4HNQgGGJELUiGU1f7u+DJYjCCX7fMZ3c2+jc+8pF61WSTyQ64897cIaTJA9rPTuswzqL1nIT0XWjeJrPhq2GnQ1gBKn+YZbLrFsouGC4ru7kGzRU8fbNH2QScJ+JZBx5VUSwa8YBNtmfR1Im/9YzJje5xrGDfBBbkt9dOpX8PtmVdsYDttgrSlS6duvnoqU3mbCybBUTurU6DpD09BEvtsw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFlFeEdwdExMYmpoa2tPNVA3Nk43S3VSUlFIZUc4Z3JFUDRUNENrNElXZGpV?=
 =?utf-8?B?NDQvOVlGVlFFTllVU2phQ0RQalhvallSQ0VVRzlDbFE3L241enhWOVZRbitz?=
 =?utf-8?B?Tll5QUVudng4VklmMEtSVVdtSnoxeDhHTUloUXJnS3QwcEgreUN5ZnAyb1ly?=
 =?utf-8?B?T0dtYlhON1dHSmlWUVpMRXBDLzZqRzhpVHBqYmF1bUg2SUZ5MXArVzF3WGNE?=
 =?utf-8?B?NlRralE2RWtUajQxV0hLNVJTdXYxL2d1YVJEaE5ZclAzT3JGQ2JnM3ZyODl4?=
 =?utf-8?B?Q3NEN2hYTzQ2TmpGWktjQXhDYXpJZHVoeXE0L3FrcmlwWXZxaExUQmpXT3Fx?=
 =?utf-8?B?VWU4eWU1RFZWcW1NM0N1TG5XWitQaUZQUFAyeUFYTkkydjFBeTNIbEdPQXZx?=
 =?utf-8?B?cVNqa2tsQ05UUjJIY1pTZFdRN3dmMm5LZlJ1cHF4bXNreldFcGQ4NSszMndH?=
 =?utf-8?B?R1FiODlGL2x3YXFSWVRCNTRXOEtTaXY3L1IrN1p6R0pBMHhlRFk4anBFcEVn?=
 =?utf-8?B?OU9Kc1RveGtFVVJkeExzN21TbWVYeFpHK0tJMWdEbkVJOXJCNUxrQWlhSjJV?=
 =?utf-8?B?ei9hcDdNQ0ZIbUUzblZjcHNpc1dQOURuNWZ2cUlCQkpLOXlPTGIzRzhSVUFM?=
 =?utf-8?B?VldFSVowZ0RIeHh2NnZ2L3RHbnhuaFUvUExmVERpL3Z6YUw4MkY1MXR1OFcx?=
 =?utf-8?B?MEdEZzJsZGRyNytWTUpPK0RNOXNOQXZBaWMwSDBHaUdLMExuTXlPZlhqRDM0?=
 =?utf-8?B?L09ZcHN2OGRVdkhOVi9oS2VJV2ZBeC8wM01hMWtrTFNBbHZpWGZ2cHFwL3pD?=
 =?utf-8?B?ZUsxT2YzSW9kNWM3SHh4bGRvMTFUeEtZSSt0TEFMNFZ3Mzdld0Y0ZWxDdDBa?=
 =?utf-8?B?ZzdSRzdiRTVxUGYzYStTdjdpVVQxTVJ0dFVqZGJENE91Rnc0MVorWEx3dXd4?=
 =?utf-8?B?ZCtDdllEa0V4ZFVUUHpkWUhFMGdLemRzWGZaYnZZdk1mdFp0SnBiNUxRcUNh?=
 =?utf-8?B?djAwTGttR0FZb3BOS09QZWE3T3pOdWZBQW1vK1JqWUljZExqSUpmc2YzdzRW?=
 =?utf-8?B?aE5MUGtWakVIUVFlTDhYMjgvK0Uwb0R6RU5NWFRJMTIyMVhXMmgwMmhWMXBp?=
 =?utf-8?B?REZHZGR4dEk0a0ovME0wQitnK1B0Ly92S3NvOWdTN0lERVdXbWQ2enVrc2FY?=
 =?utf-8?B?Uy9aTGRIL01zNXIxaHljcmlIbkF1SW9rQTBiWFBqOHJoSHdTMHkvVi9pVTFu?=
 =?utf-8?B?bXlNSUd0VnVNSWx6N1EwT2xrTE9OejNFTEV0aWxNRlM0WG5vV3hZR2JsYlJX?=
 =?utf-8?B?MnozcHhZY09WeUFOdkwyTVZTdVhPYk5EbzVCclRiTzg4UzUzVGxRQ2ZDMkVD?=
 =?utf-8?B?ZFVoN0l1T3o5MFBPRUMxeEJ4ME04aEJSbkMrU0JkUTIxeENTS0xxbTd4M2x0?=
 =?utf-8?B?Z1RCa09Eb0hPbm5OK01HK2RxbVIrTlE3bjJxY1d5TFVINWlLNUZMdHpNSnVi?=
 =?utf-8?B?OVNBNVorV1NWK3kzMCt3S1VkWnZCdGlkVnlHNXFnZ2FZN21NZTA5dlByTHEz?=
 =?utf-8?B?Qm5RK2t1YkdDRjJzZ3F2eWNmc1lIZWYvdEk5SVFjOTBZbDd5cEZjVkZjTXFW?=
 =?utf-8?B?QmcyK1FodnN4VENTdWt2OGdCMDBSY3pkZDA0ZjdxR0RzUVY4SkVtOC9oem5l?=
 =?utf-8?B?SDlBdGRQZ0E5c1JGOGxOMUp0aThlcFN1bEcwdWhnWGdIK3FsV1ArZis4eXdR?=
 =?utf-8?B?NERTMldSNnI1K0NJUFQ4VlNvNTRmMmFndlpvRU9WTk1zWnpuck5ac1FkcUgv?=
 =?utf-8?B?WERUNWJ5M1p6YjUrZjZ5TTU5UmJTdTJtS0w5d1R1TmwwRmNKK1FMU3BTTVZt?=
 =?utf-8?B?MWZTbFNlWGo3cVlMN1Z4ZHNrRlJqZElGQ1NrU0tTcnpBOHZrMXhUOTNwYkp0?=
 =?utf-8?B?NGo0M2ZiNjNXc01aaVA1SVQ3NVFqMXpQL1VVMkI1OVZScDVya3cwd084RUtF?=
 =?utf-8?B?TmJlU2hZbkk4dEE3dW5NU3RZUUVIZmJrdE5XY1NIY0V1WkJjdmZ5WVdLcVNE?=
 =?utf-8?B?UFhBdHVxMklYM2xocmJFTHBqRUoxdmVVRFIwcHNnb2RUUmhLUUdzanAzbm14?=
 =?utf-8?Q?t/o+7UvroxnZYE4zduuv57qq4?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2dc698-4024-47a2-ba3e-08dc5903860c
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 02:11:25.0163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ugXce/1RWXKcd7fCpTCfFipxxS8Lx0eCKazpK4W+JcwILsQVd3HvaKT1k+aMB69C8I8kYfvGumgadAi+9RspqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR02MB7193
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/10 8:38, Jaegeuk Kim wrote: > On 04/09, Sheng Yong
 wrote: >> >> >> On 2024/4/9 2:34, Jaegeuk Kim wrote: >>> On 04/08, Sheng
 Yong wrote: >>>> Althrough old and new sb have the same value for [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 0.0 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1ruNR3-0002L6-W7
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



On 2024/4/10 8:38, Jaegeuk Kim wrote:
> On 04/09, Sheng Yong wrote:
>>
>>
>> On 2024/4/9 2:34, Jaegeuk Kim wrote:
>>> On 04/08, Sheng Yong wrote:
>>>> Althrough old and new sb have the same value for now, it would be better
>>>> to build new checkpoint according to new sb.
>>>
>>> May need to add assert, if they're different?
>>>
>> We could add assert here, but I think it's not that necessary:
>> 1. rebuild_checkpoint is only called by resize, and new_sb is copied directly
>>     from original sb without any changes of these basic attributes.
>> 2. for now, new_sb has the same attributes/members with the original one. If
>>     those attributes are allowed to get changed in the future, the assert needs
>>     to be removed.
>> So how about adding a new helper to check and show the difference between the
>> new and original sb?
> 
> So, why do we need to change this?
Semantically, IMO, these fields belonging to new cp should be calculated based
on new sb, although the results are equal. That is found when I am trying to
make resize.f2fs support resizing with different attributes.

thanks,
shengyong
> 
>>
>> many thanks,
>> shengyong
>>>>
>>>> Signed-off-by: Sheng Yong <shengyong@oppo.com>
>>>> ---
>>>>    fsck/resize.c | 7 ++++---
>>>>    1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/fsck/resize.c b/fsck/resize.c
>>>> index 049ddd3..1b4ae85 100644
>>>> --- a/fsck/resize.c
>>>> +++ b/fsck/resize.c
>>>> @@ -481,7 +481,7 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
>>>>    		set_cp(overprov_segment_count, get_cp(rsvd_segment_count));
>>>>    	set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
>>>> -						2 * get_sb(segs_per_sec));
>>>> +						2 * get_newsb(segs_per_sec));
>>>>    	DBG(0, "Info: Overprovision ratio = %.3lf%%\n", c.new_overprovision);
>>>>    	DBG(0, "Info: Overprovision segments = %u (GC reserved = %u)\n",
>>>> @@ -551,11 +551,12 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
>>>>    							cpu_to_le32(crc);
>>>>    	/* Write a new checkpoint in the other set */
>>>> -	new_cp_blk_no = old_cp_blk_no = get_sb(cp_blkaddr);
>>>> +	old_cp_blk_no = get_sb(cp_blkaddr);
>>>> +	new_cp_blk_no = get_newsb(cp_blkaddr);
>>>>    	if (sbi->cur_cp == 2)
>>>>    		old_cp_blk_no += 1 << get_sb(log_blocks_per_seg);
>>>>    	else
>>>> -		new_cp_blk_no += 1 << get_sb(log_blocks_per_seg);
>>>> +		new_cp_blk_no += 1 << get_newsb(log_blocks_per_seg);
>>>>    	/* write first cp */
>>>>    	ret = dev_write_block(new_cp, new_cp_blk_no++);
>>>> -- 
>>>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
