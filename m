Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5HKpJHQMOGqiXQcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 21 Jun 2026 18:08:20 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BF36AB3E5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 21 Jun 2026 18:08:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=iOpL7u8c;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=fBIe8QVU;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=NIVgBcFw;
	dkim=fail ("body hash did not verify") header.d=outlook.com header.s=selector1 header.b=TTfTyh9p;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=outlook.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1B8IQBrNgOovlTtIdIBWMSyZWNDK4fYApw+l0Djvlwk=; b=iOpL7u8cBGTk1qcHlIvCPnXiy2
	58S/TdcgNjBt5Q351LMlwNIOrhT3RuYYLKrBB26I+Yd5M5jnipC2gTA84Z3XWDCrxJMFxIynKnsT7
	/mbu6xhCPkE2CTPTWY/O9k2vZ59OXK3X+WLmL1fYBYgpsY9p4cEThazbC6Xp6jUb8dhM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbKiO-0004tY-QM;
	Sun, 21 Jun 2026 16:08:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1wbKiN-0004tR-TJ for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 21 Jun 2026 16:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F6kcB5zs+o3geJ3LjoUFGMjKE3I3CxBH/pPD3jvMT7k=; b=fBIe8QVUIqCcI686PwF+goJH3o
 yqYc5zOprkdxbbHIk5XzjQeqhz+UTKRO7xtzNblk4pecn+g8Aypxtz3nlWv4aDb6vHw6avS7Owxmy
 VorbG5qfUr5G3JGSCsYk/OMjExU1Zn5nZjdsKZ2T1DUU313x+Uih1yoR5JcDty4y2szE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F6kcB5zs+o3geJ3LjoUFGMjKE3I3CxBH/pPD3jvMT7k=; b=NIVgBcFwP1gqnUt69L4JKcskcd
 XXF13/zJSCOJjwfWMDfNx/Rw1cromqNFVacRzlfUpghW6P7k+jloGeCmoSNnzqStToiuivlQfmQVg
 kk9SbbTULud0o/WJrP/LLXjKeb90q3zaJPG4LE0NvnZmlzUTKmeE0u+LrSixGO9D8QHY=;
Received: from mail-japaneastazolkn19012057.outbound.protection.outlook.com
 ([52.103.43.57] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbKiL-00079F-Ot for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 21 Jun 2026 16:08:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTBhfrYWVeFpZlSz9wix/VhkmY6SJtvpoMqtqVJayULlwwXXCvQPIrw7s3COzmG6W/oiXbt9ULQaLmJ015TuacUdtwxEP7m5zV5LR8WQtTDWJsOiqlwFtZmHqU25sFtmgYP2dZRjdO5sqCpM5PZcIFLazcpBHQSvMyyX7MojZ2YLjrz63UT+41V52R84LfJNvXDkKd8iT9b8UpruYnDy32efohaOw+YILVyM2J8GG5iyA3CuReskU7nH5LrvdX4DaJFF0J9/juvNgoAAWCiwIdWZGuyKMqq84KkNgvsyO1Mg7THNGYpoEDQ4QF9KN6J6Tf6/5RyugxGvjfIc+/ZyKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6kcB5zs+o3geJ3LjoUFGMjKE3I3CxBH/pPD3jvMT7k=;
 b=yUq6GoIrQg4ZVzAbhcwaADcgNOh6KlyinaIZbGmZZd/fBRctzRczsL1Y0YVpUsXJaIqhZjnIdRkz+yu4ybYJ38cHhrWPNoAGwMB7YvmhvtCKAwboOOUG4Y13+Zs7wKdzJtaxyKT0hyI8digLwQQUL1JE+bekQqVJplgF0YrQJIMn0DDbttHUglU/sBbH91po0RRVC1lDEIMgYv+hmQ5Fn0xyK+fE5A1RTSikZrnsy43X2cXUzjf7yCM0FYkpjREbAyH+6R2i2A+LIXow0TpdbdAMo5HsU599pmIsePX0csnCExkQ9D80OJfhPiYdAk5KVVNpP4v0eGp2tcimrmoBvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6kcB5zs+o3geJ3LjoUFGMjKE3I3CxBH/pPD3jvMT7k=;
 b=TTfTyh9p5Qc1ewUhe9C85g2UQ3AbnlGmsK18iNwhDdiyIsnX+6gjijDNVAe/GE1GUtRK+QlKgS8QRgT8MKXjpuOW6k+bHdfLAn+A1IaYE7L2akrCSTvdtySlw70CsOG+OYJD0aI5EXLj0D9u0NuRIJCWKXub8gSBlL7h0dHeba6DLkAAnUWu3gYXSm7n0TTMQucbCHY2exl4YHG/QsIAG+d1L3FZjgiagR0QSSaZqsY+twMBvfiYZk6EFJi4AVRCb5DB6fvVY/7kYzATCjs+2h3UCkXzTvtZW30qPN++qXHh5xnSJMj1LFq7ZCnIbJDcKQNxuI2/PAv9/o6mWF9kjA==
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com (2603:1096:101:4e::13)
 by TYSPR02MB7418.apcprd02.prod.outlook.com (2603:1096:405:37::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Sun, 21 Jun
 2026 16:07:57 +0000
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72]) by SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72%6]) with mapi id 15.21.0139.018; Sun, 21 Jun 2026
 16:07:57 +0000
Message-ID: <SEZPR02MB56622CEC6B0C1B8E320262DE99E02@SEZPR02MB5662.apcprd02.prod.outlook.com>
Date: Mon, 22 Jun 2026 00:07:53 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-4-yangyongpeng.storage@gmail.com>
 <b380cd69-66db-4ef1-8d33-92ed6c34d263@kernel.org>
 <SEZPR02MB566231EECF99FCD70B8E410F99E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
 <462ef62b-d83c-463f-8f44-4843ac179c2f@kernel.org>
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
In-Reply-To: <462ef62b-d83c-463f-8f44-4843ac179c2f@kernel.org>
X-ClientProxiedBy: TPYP295CA0035.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::7)
 To SEZPR02MB5662.apcprd02.prod.outlook.com
 (2603:1096:101:4e::13)
X-Microsoft-Original-Message-ID: <558beafc-125e-472e-842b-7a0c6dde922d@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5662:EE_|TYSPR02MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ad0215-8b5f-4b0c-50de-08decfaf4210
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|7042599007|45011099003|24121999003|51005399006|19110799012|41001999006|5072599009|22091999003|23021999003|6090799003|15080799012|8060799015|25010399006|3412199025|440099028|12091999003|10035399007|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnh6N1MrWlpvMUJGVUIzVXBmdU1DR21hUDYzS2IwT1B0eDdiTFVEbldQNUFq?=
 =?utf-8?B?Y0pxQjFPajc2Sng4YkkwV0dJM1BWSk8wenRkeWtyVHgxNGhPVG5MTWpKaU95?=
 =?utf-8?B?OE40b0o3ODdJcFNjbk1zbXVsbGpNL092WEc2MFpxallqWFhyYjFWdjQ5K2py?=
 =?utf-8?B?R3JQYWFhWkNBMVdEb3B6QnZYdWVmYklUc3ZxR1cyTnRvaFJHMWlqNUR3TEVN?=
 =?utf-8?B?VTI3YUxLeGhSVVowQmtUKzhweHFKTEVIV29uOGlybnVESGk5V2hMVjV1MTR1?=
 =?utf-8?B?U25YMjhUdElBYzlGYk1QNWsyb2IvR092bWdnVnhUOXh6TkQ5RFd6VXA4VVda?=
 =?utf-8?B?cUJGOXhqVytybTJWaFZNYytPVFFIa1FVdDJmUDc4dktRSUpPZGxFZjFxMS9m?=
 =?utf-8?B?L0FwUG45RzIxYjU2cnRnNmpNeHVvMnFSelQvYk42VGhqWVN0Z3QvdEhCQ09S?=
 =?utf-8?B?d2xNdlBRZE9sTDRzYmdjMWJqZ2g2M1JpSTRnOUFqQ0xENTc1Y2FqV2RSQkpG?=
 =?utf-8?B?RTdaZmlQOG1Cb2lORzZlbGw5Qmg0T1NEdUxzZmo4WmdsMTdiczNQM0FocnNS?=
 =?utf-8?B?cWt3N1l5cmJuYTRlY1JLQTduUFFuR2thQ2F6eG5OOG42dURJbzFmaWhSWEFr?=
 =?utf-8?B?RHloZ3ViS2t5NVIvVFBBSFp1TkI5ZUVyQ2ZOUnQ1dWdYaTVTL0hwRUsxNzU5?=
 =?utf-8?B?UHljTWNrUi9oZ2E0Um4yakRtVkR3aXQzME1oRTBBZzlzM3hpYXQvc0ZEZ1M4?=
 =?utf-8?B?akNMTXBRd3NPVjdwMUlUU0U0QndQZC9McE9GWHowWWE0bXRnTUloRWNEM1RN?=
 =?utf-8?B?aEVVWStMZjdJTkQyZDRNenBSU1RsWjRoUFRDMjd2MG9Zc3RpaTVIN2t0ck8z?=
 =?utf-8?B?RE85SHY3eU9NbUdQK0R5a1hZM3U5N2Q3K2tRdyt0ZGxReFBRV2ZLbG1JVmpa?=
 =?utf-8?B?bGw3N3B1dU1nS09rRitKc0JGdHNwLzB6cmxJcjRlRk5aUWlWYllhVk9SSzJJ?=
 =?utf-8?B?R29wcllwK29Hajh4T0dQR1pEK3l5cEthRjhaWDFyWk84SlUvZTJKZlUrZFR3?=
 =?utf-8?B?ZXJJeG0wc2FBYmtiUmpWZitmYmo4d1lHaDNzeVhvN1JHWmFYbDlCS2NmMEx4?=
 =?utf-8?B?T0xZdFNMS2RYb21rSkkvemJjbUdiNW5lTzRrRWdjRk5NbXNvMkNndW5ZWU9y?=
 =?utf-8?B?dVhqNlRmSHR1azd1bDNUTFNmcDd5a1QyemxBa1V2VlEwY0ZQYy9rcnNYbXRv?=
 =?utf-8?B?dDJSd1VobTJlbmEra1M5RC82bllORHZHMTNmNWxKOG96YXQySXFSUVBIeW1E?=
 =?utf-8?B?Vk5udjJxaFJuYVdqbnlOQkpxcGw0dmlyVXdwUDMrWGxiTWVmUmJjeE9ETFZl?=
 =?utf-8?B?QmZlQjJMVUdJQjFKdFhsdlZrcjlVSWl2VUFFWEtOQ3UxeERPR0VuT3p1YSt6?=
 =?utf-8?B?b0QrRnlDWldYM2hJUmJCbjYyNDFNMWZBMU40TVJYak5CelZDdEowdzlBdlBS?=
 =?utf-8?B?Q2xHbE1KRjYxSDVLSElzN0hLdFMrWXdGUXVKWVc0WUVTYmFyMElIS2F4ZVVI?=
 =?utf-8?Q?36gkvAjtdx/Ws8GDnu4FULZ8Tly31WPRYOSIjYpr7C5M6I?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1BOM1ZIS1BCb2g2YjRVdDJWaFhldjBZdG16Ump1L1NtYmxkT284aEFZdVJr?=
 =?utf-8?B?V2RsVWo2amRFM0twSENPTFZENW40N09ZM0hWa1VnQytMUjBnR0JjdEp4Z3A4?=
 =?utf-8?B?Q0tZRytuQjZ0RUxvZXV6K3NoQ3M0Y0xDWG1zWU1pTHdjVUw5cDlUV2FMalhz?=
 =?utf-8?B?aEhsUEZ0elBLWXN4blJicXdyNTR2OE1xT0N1ckI2VWRQMFFUQjBRVDZ2emVB?=
 =?utf-8?B?UEdCRis0U0w5bVhkVkpQaHVwQVBWT3V2WkROSkk2QkZCU2pmR3BvWjUvMEtJ?=
 =?utf-8?B?aVlwWlExZVpLZjZsTmJpbGdMRnlhWnpjSTRRTjBiY0czemUrRG9iT3FKQjVW?=
 =?utf-8?B?OXFSZ2tFVFZGenE0MEV3S0lXN2lzT1lGK1BKUGFleGcycnV4dldWTTJyL3R4?=
 =?utf-8?B?L3RWY0RRNEc0QTdHTDJ2TG43Qzl5c01velV4ei9iNG05QlEvOGI3OUV0RVVN?=
 =?utf-8?B?bU5JR3NwUk1BVEp6WWZHT3k0d3ZoWE1LYjdleUcyNFZERHBWdG82YnBLVzJV?=
 =?utf-8?B?YUFOQ3lpKzJVRXRjV2ZQRHcvZ3FFV20wMVhueW1lU1lsK1NRSlBMMWtCUlVR?=
 =?utf-8?B?c1JvOWpFRzN3bmVoME9yb0JyYVN4ZjluZERXWDFoV3NGeXZhY3kyYlRRSXJK?=
 =?utf-8?B?aE9QK2tCTzd5Um9XcHJSVkxFWm1MRGNzbURzOHY0M3hsY2Y1U25QNzY1b2JF?=
 =?utf-8?B?a3QxNE1WODBwYkRndWwyUCtTM3JZQUs3S1pKNTdKeEpFczF5WWVoZk1Db1Jn?=
 =?utf-8?B?QkVrT2tEd0VpSVJuVGxPdzlEQlJTTmJWdG54YlQ5VWFkMDdkSGpheWdPalJN?=
 =?utf-8?B?bUErcnhFUnNnMlRCVHhETlB3Rk56SkY0QjZEQzlyVDRKUG85cTNtOG5uVkIy?=
 =?utf-8?B?TzRFbjRpamF1UXdqRkRGMk1idmZPMWZGc1p1cFpGa1BuVlFrYWM5Yk9DSkd6?=
 =?utf-8?B?ZWhpVklWY3poR3puQXVsRWErcmIxa3RYN1JKNEZsUjVQYzN3cU1hSVd2U1Qr?=
 =?utf-8?B?MkRnS2ROYUtseVY1TWJnaWkxQktrRjFJWE1QeFFtNlVQRG54Mm5CZ2JPNDRR?=
 =?utf-8?B?NFJtZXRUWS96cHJ5QkZLOUVLK3NTazdVaXBSY0s0NVAwQ2JCUnNLRGR6ZjRR?=
 =?utf-8?B?cVJKaitYU0Z2SUx6SnFCYUE5QTFZUHUxb3F6d2ZHcDhBRTBDMUZJcXpKWGwy?=
 =?utf-8?B?M3Bkd1V6SlVPYmZ3V1Q2UGhlR1dSUEFqV0I3QlRwdCs1czZkTXdUMWpXWUpT?=
 =?utf-8?B?enZCVWxZT3NZVkxPZHJBNlRhY24xSEtsTTAwTENNWTBRZlB6bTJtMEJCNEZX?=
 =?utf-8?B?S2IzY1lPd21RekExK09DNHozUXdLb3N6Vis4VE55cldKNjdZNU5PdzJPcVU0?=
 =?utf-8?B?OXB6ZWtHcERuT1JpMTA1V0dIUFVRYkhuSklQM2dpYnoyQUpLVG00d2FjMjZC?=
 =?utf-8?B?bG5EZDM0dmR0aXYzZ2FJK2hsLy9hOGdqSWpRcFZkWmxWU3dTTXU0MGJza0hh?=
 =?utf-8?B?eXZPTjhteElzcTNMK3V0aHpJeE00am9yYUhqZVlsekRLelhaYS93MTdranVo?=
 =?utf-8?B?NzZZc3pkT25GdFRkTjJhOFkybjBhWWN6YUxuUmYydVdCdzVlbHRiUDRwbEtU?=
 =?utf-8?B?dnF5SE9tZUl6eWVTc1lqVEhmTFd6WE5xaVhGVnhzV3RaSUhkNGFSbDFsN0VG?=
 =?utf-8?B?WUFFMVRoOHpZZHV1ZnBLbkk5Qm4ybHJXNk1vRmdPOHdETTl0ajdUU0U2Zm04?=
 =?utf-8?B?TENhT3k2VlVtRGVtWVA1clR2TC9ZdGoxOVkyN3poNm1Kb29sRkNRUTFCYTli?=
 =?utf-8?B?dGNiQ291c2ZBMEg4a2xNcnozME5hOEM0ZzZwTzU5cE5HUzJhME1ScUxId25v?=
 =?utf-8?B?QVVnNXBkTEsrM3RJbGdseVVqTWlpdkFQMWdtRVJOV2R4aTFzWVhQUjNROTlw?=
 =?utf-8?B?OHR5a054bXRvbHBBUDNEc3lLL0tCbVlTSjFsY2dMSFpYQ2RtNkdMOUNtNllq?=
 =?utf-8?Q?9xZOgVhZKc5XBDeLNZmPKKtO3+Z2xU=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ad0215-8b5f-4b0c-50de-08decfaf4210
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5662.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2026 16:07:57.2410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR02MB7418
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/20/26 2:15 PM, Chao Yu via Linux-f2fs-devel wrote: >
 On 6/19/26 22:38, Yongpeng Yang wrote: >> >> On 6/15/26 8:05 PM, Chao Yu
 via Linux-f2fs-devel wrote: >>> On 6/12/26 19:58, Yongpeng Yang wrot [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)outlook.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.103.43.57 listed in wl.mailspike.net]
X-Headers-End: 1wbKiL-00079F-Ot
Subject: Re: [f2fs-dev] [PATCH RESEND 3/5] f2fs: punch largest extent
 instead of dropping it entirely on overlap
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[outlook.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:yangyongpeng.storage@outlook.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[yangyongpeng.storage@outlook.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,outlook.com];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,outlook.com:s=selector1];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpeng.storage@outlook.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[outlook.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,outlook.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94BF36AB3E5

Ck9uIDYvMjAvMjYgMjoxNSBQTSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToK
PiBPbiA2LzE5LzI2IDIyOjM4LCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pgo+PiBPbiA2LzE1LzI2
IDg6MDUgUE0sIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+PiBPbiA2LzEy
LzI2IDE5OjU4LCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4+IEZyb206IFlvbmdwZW5nIFlhbmcg
PHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4+Cj4+Pj4gUHJldmlvdXNseSwgd2hlbiBhbiBl
eHRlbnQgYmVpbmcgaW5zZXJ0ZWQgb3ZlcmxhcHMgd2l0aCB0aGUgbGFyZ2VzdAo+Pj4+IGV4dGVu
dCwgdGhlIGxhcmdlc3QgZXh0ZW50IGlzIGRyb3BwZWQgZW50aXJlbHkuIFRoaXMgd2FzIGRvbmUg
dG8gaGFuZGxlCj4+Pgo+Pj4gUGxlYXNlIGNvcnJlY3QgbWUgaWYgSSBtaXNzZWQgYW55dGhpbmcs
IEkgcmVtZW1iZXIgdGhhdCB3ZSB3aWxsIGFkZCAKPj4+IGxhcmdlc3QKPj4+IGV4dGVudCBpbiBi
ZWxvdyBwYXRoPwo+Pj4KPj4+IC0gX191cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2UKPj4+IMKgIC0g
X19pbnNlcnRfZXh0ZW50X3RyZWUKPj4+IMKgwqAgLSBfX3RyeV91cGRhdGVfbGFyZ2VzdF9leHRl
bnQgOiB1cGRhdGUgbGFyZ2VzdCB3LyByaWdodCBleHRlbnQKPj4+IMKgIC0gX190cnlfdXBkYXRl
X2xhcmdlc3RfZXh0ZW50IDogdXBkYXRlIGxhcmdlc3Qgdy8gbGVmdCBleHRlbnQKPj4KPj4gVGhl
IGxhcmdlc3QgZXh0ZW50IG1pZ2h0IG5vdCByZXNpZGUgaW4gdGhlIGV4dGVudCB0cmVlLiBJZgo+
PiBfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZSBpbnZva2VzIF9fZHJvcF9sYXJnZXN0X2V4dGVu
dCwgdGhlIGxlbmd0aCBvZgo+IAo+IEkgbWVhbnQgX191cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2Ug
aW52b2tlcyBfX2Ryb3BfbGFyZ2VzdF9leHRlbnQgdG8gZHJvcAo+IGxhcmdlc3QgZmlyc3QsIGFu
ZCB0aGVuLCBpdCB0cmllcyB0byB1cGRhdGUgbGFyZ2VzdCBleHRlbnQgdy8gbGFyZ2VyLXNpemUK
PiBvbmUgb2Ygc2VwYXJhdGVkIHR3byBleHRlbnRzLgo+IAo+PiB0aGUgbGFyZ2VzdCBleHRlbnQg
d2lsbCBoYXZlIGJlZW4gc2V0IHRvIHplcm8uIEFzIGEgcmVzdWx0LCB0aGUgbGFyZ2VzdAo+PiBl
eHRlbnQgdXBkYXRlZCBpbnNpZGUgX190cnlfdXBkYXRlX2xhcmdlc3RfZXh0ZW50IGNhbiBlbmQg
dXAgc21hbGxlcgo+PiB0aGFuIHRoZSBsYXJnZXN0IGV4dGVudCBvYnRhaW5lZCBhZnRlciBfX3B1
bmNoX2xhcmdlc3RfZXh0ZW50IGNvbXBsZXRlcwo+PiBpdHMgcHVuY2ggb3BlcmF0aW9uLgo+IAo+
IEkgZGlkbid0IGdldCBpdCwgY2FuIHlvdSBnaXZlIGFuIGV4YW1wbGUgZm9yIHRoaXM/CgpUaGUg
b25seSBkaXN0aW5jdGlvbiBiZXR3ZWVuIHB1bmNoIGFuZCBkcm9wIGFyaXNlcyB3aGVuIHRoZSBs
YXJnZXN0CmV4dGVudCBpcyBub3QgcHJlc2VudCBpbiB0aGUgZXh0ZW50IHRyZWUuCgpCZWZvcmUg
dGhpcyBwYXRjaChleHRlbnQgZm9ybWF0IFtmb2ZzLCBsZW4sIGJsa10pCjEuIGluaXRhbCBzdGF0
ZQogICAgIGxhcmdlc3QgZXh0ZW50OiBbMCwgMTAyNCwgMTBdLCBleHRlbnQgdHJlZTogZW1wdHkK
Mi4gaW5zZXJ0IFs1MTEsIDEsIDEwMDAwXQogICAgIGxhcmdlc3QgZXh0ZW50OiBbNTExLCAxLCAx
MDAwMF0sIGV4dGVudCB0cmVlOiBbNTExLCAxLCAxMDAwMF0KCkFmdGVyIHRoaXMgcGF0Y2g6CjEu
IGluaXRhbCBzdGF0ZQogICAgIGxhcmdlc3QgZXh0ZW50OiBbMCwgMTAyNCwgMTBdLCBleHRlbnQg
dHJlZTogZW1wdHkKMi4gaW5zZXJ0IFs1MTEsIDEsIDEwMDAwXQogICAgIGxhcmdlc3QgZXh0ZW50
OiBbNTEyLCA1MTIsIDUyMl0sIGV4dGVudCB0cmVlOiBbNTExLCAxLCAxMDAwMF0KClRoYW5rcwpZ
b25ncGVuZywKCj4gCj4gVGhhbmtzLAo+IAo+Pgo+PiBUaGFua3MKPj4gWW9uZ3BlbmcsCj4+Cj4+
Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+PiB0aGUgY2FzZSB3aGVyZSB0aGUgbGFyZ2VzdCBleHRlbnQg
aXMgbm90IGluIG1lbW9yeSwgYXZvaWRpbmcKPj4+PiBpbmNvbnNpc3RlbmN5IGJldHdlZW4gdGhl
IGxhcmdlc3QgZXh0ZW50IGFuZCB0aGUgZXh0ZW50IHRyZWUuCj4+Pj4KPj4+PiBUaGlzIHBhdGNo
IGNoYW5nZXMgdGhlIHNlbWFudGljcyBvZiBfX2Ryb3BfbGFyZ2VzdF9leHRlbnQgKHJlbmFtZWQg
dG8KPj4+PiBfX3B1bmNoX2xhcmdlc3RfZXh0ZW50KTogaW5zdGVhZCBvZiBkaXNjYXJkaW5nIHRo
ZSBlbnRpcmUgbGFyZ2VzdAo+Pj4+IGV4dGVudCB3aGVuIGFueSBvdmVybGFwIGlzIGRldGVjdGVk
LCBrZWVwIHRoZSBsYXJnZXIgcmVtYWluaW5nIHBvcnRpb24KPj4+PiAobGVmdCBvciByaWdodCkg
YWZ0ZXIgdGhlIHB1bmNoLiBUaGlzIHByZXNlcnZlcyBleHRlbnQgY2FjaGUgY292ZXJhZ2UKPj4+
PiBmb3IgdHJ1bmNhdGUgYW5kIG92ZXJ3cml0ZSBvcGVyYXRpb25zIHRoYXQgb25seSBwYXJ0aWFs
bHkgb3ZlcmxhcCB0aGUKPj4+PiBsYXJnZXN0IGV4dGVudC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4+IC0tLQo+Pj4+
IMKgIGZzL2YyZnMvZXh0ZW50X2NhY2hlLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tCj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9leHRlbnRfY2FjaGUuYyBiL2Zz
L2YyZnMvZXh0ZW50X2NhY2hlLmMKPj4+PiBpbmRleCBmOGQ5NGRiNjBkYzYuLjgyZDg0YzRlOThi
MiAxMDA2NDQKPj4+PiAtLS0gYS9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4+Pj4gKysrIGIvZnMv
ZjJmcy9leHRlbnRfY2FjaGUuYwo+Pj4+IEBAIC0zOTcsMTQgKzM5NywzMSBAQCBzdGF0aWMgdW5z
aWduZWQgaW50IF9fZnJlZV9leHRlbnRfdHJlZShzdHJ1Y3QgCj4+Pj4gZjJmc19zYl9pbmZvICpz
YmksCj4+Pj4gwqDCoMKgwqDCoCByZXR1cm4gY291bnQ7Cj4+Pj4gwqAgfQo+Pj4+IC1zdGF0aWMg
dm9pZCBfX2Ryb3BfbGFyZ2VzdF9leHRlbnQoc3RydWN0IGV4dGVudF90cmVlICpldCwKPj4+PiAr
c3RhdGljIHZvaWQgX19wdW5jaF9sYXJnZXN0X2V4dGVudChzdHJ1Y3QgZXh0ZW50X3RyZWUgKmV0
LAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwZ29mZl90
IGZvZnMsIHVuc2lnbmVkIGludCBsZW4pCj4+Pj4gwqAgewo+Pj4+IC3CoMKgwqAgaWYgKGZvZnMg
PCAocGdvZmZfdClldC0+bGFyZ2VzdC5mb2ZzICsgZXQtPmxhcmdlc3QubGVuICYmCj4+Pj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9mcyArIGxlbiA+IGV0LT5sYXJnZXN0LmZvZnMpIHsKPj4+
PiAtwqDCoMKgwqDCoMKgwqAgZXQtPmxhcmdlc3QubGVuID0gMDsKPj4+PiAtwqDCoMKgwqDCoMKg
wqAgZXQtPmxhcmdlc3RfdXBkYXRlZCA9IHRydWU7Cj4+Pj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQg
bGFyZ2VzdF9lbmQsIHB1bmNoX2VuZDsKPj4+PiArwqDCoMKgIHVuc2lnbmVkIGludCBsZWZ0X2xl
biwgcmlnaHRfbGVuOwo+Pj4+ICsKPj4+PiArwqDCoMKgIGlmIChmb2ZzID49IChwZ29mZl90KWV0
LT5sYXJnZXN0LmZvZnMgKyBldC0+bGFyZ2VzdC5sZW4gfHwKPj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBmb2ZzICsgbGVuIDw9IGV0LT5sYXJnZXN0LmZvZnMpCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIHJldHVybjsKPj4+PiArCj4+Pj4gK8KgwqDCoCAvKiBQdW5jaCBbZm9mcywgZm9mcyArIGxl
bikgZnJvbSBsYXJnZXN0IGV4dGVudC4gKi8KPj4+PiArwqDCoMKgIGxhcmdlc3RfZW5kID0gZXQt
Pmxhcmdlc3QuZm9mcyArIGV0LT5sYXJnZXN0LmxlbjsKPj4+PiArwqDCoMKgIHB1bmNoX2VuZCA9
IGZvZnMgKyBsZW47Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgbGVmdF9sZW4gPSBmb2ZzID4gZXQtPmxh
cmdlc3QuZm9mcyA/IGZvZnMgLSBldC0+bGFyZ2VzdC5mb2ZzIDogMDsKPj4+PiArwqDCoMKgIHJp
Z2h0X2xlbiA9IGxhcmdlc3RfZW5kID4gcHVuY2hfZW5kID8gbGFyZ2VzdF9lbmQgLSBwdW5jaF9l
bmQgOiAwOwo+Pj4+ICsKPj4+PiArwqDCoMKgIGlmIChsZWZ0X2xlbiA+PSByaWdodF9sZW4pIHsK
Pj4+PiArwqDCoMKgwqDCoMKgwqAgZXQtPmxhcmdlc3QubGVuID0gbGVmdF9sZW47Cj4+Pj4gK8Kg
wqDCoCB9IGVsc2Ugewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBldC0+bGFyZ2VzdC5ibGsgKz0gcHVu
Y2hfZW5kIC0gZXQtPmxhcmdlc3QuZm9mczsKPj4+PiArwqDCoMKgwqDCoMKgwqAgZXQtPmxhcmdl
c3QuZm9mcyA9IHB1bmNoX2VuZDsKPj4+PiArwqDCoMKgwqDCoMKgwqAgZXQtPmxhcmdlc3QubGVu
ID0gcmlnaHRfbGVuOwo+Pj4+IMKgwqDCoMKgwqAgfQo+Pj4+ICvCoMKgwqAgZXQtPmxhcmdlc3Rf
dXBkYXRlZCA9IHRydWU7Cj4+Pj4gwqAgfQo+Pj4+IMKgIHZvaWQgZjJmc19pbml0X3JlYWRfZXh0
ZW50X3RyZWUoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZvbGlvIAo+Pj4+ICppZm9saW8p
Cj4+Pj4gQEAgLTY4MCwxMCArNjk3LDEwIEBAIHN0YXRpYyB2b2lkIF9fdXBkYXRlX2V4dGVudF90
cmVlX3JhbmdlKHN0cnVjdCAKPj4+PiBpbm9kZSAqaW5vZGUsCj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGRlaS5sZW4gPSAwOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+Pj4+IC3CoMKgwqDC
oMKgwqDCoMKgICogZHJvcCBsYXJnZXN0IGV4dGVudCBiZWZvcmUgbG9va3VwLCBpbiBjYXNlIGl0
J3MgYWxyZWFkeQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICogcHVuY2ggbGFyZ2VzdCBleHRlbnQg
YmVmb3JlIGxvb2t1cCwgaW4gY2FzZSBpdCdzIGFscmVhZHkKPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqIGJlZW4gc2hydW5rIGZyb20gZXh0ZW50IHRyZWUKPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqLwo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBfX2Ryb3BfbGFyZ2VzdF9leHRlbnQoZXQsIGZv
ZnMsIGxlbik7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIF9fcHVuY2hfbGFyZ2VzdF9leHRlbnQoZXQs
IGZvZnMsIGxlbik7Cj4+Pj4gwqDCoMKgwqDCoCB9Cj4+Pj4gwqDCoMKgwqDCoCBpZiAoZXQtPmxh
cmdlc3QubGVuICE9IDAgJiYKPj4+Cj4+Pgo+Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dAo+Pj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4+IGh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPj4K
PiAKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
