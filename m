Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C248ACDF4B1
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Dec 2025 06:58:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjQBvUGcJpzqH1tzcacKz7ifbKKM5S6r4/u6lGNEWBQ=; b=LvZzhwVGyEVxd3ka3xcdpeetiT
	lwMOMti0XWx9tUUd1elnXy1iHgidaN5GUGYV4QvW70cNsHZmi5Wx7G37FPPyNouEpSKHJRVm61nol
	SfWWpP8tTcBtfdUXuiZF8SkjWaxhppqYBDzTCoajLgMtHHMFNum3Ix6QFr+UdqOlPHCA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZNJM-0003q0-C6;
	Sat, 27 Dec 2025 05:57:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1vZNJK-0003ps-Da for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 05:57:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MEZ+vSIMk1PnpBWcwhbHP+MgzvC8YBryybkQPYQCMts=; b=ejS38Hh2iM4rlvKdehGPhsCC9q
 TMBiKd4NybO1zYM+08HM5t21oNg0XuDhGPhCgztMGZV1mXbSeRrHnX0yHtb89NPwgmiCCVtNTC2kB
 LksvN4tkWsNorLvdoojU947Z8AvX0i+0/dh/1F0MVKAI25a0GUZl4OG2LHYtYPjL+kAs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MEZ+vSIMk1PnpBWcwhbHP+MgzvC8YBryybkQPYQCMts=; b=GDT3/1PwASvcQsJ1K3MEcuvU2V
 Y5si7Mzm26rZRCj8g0pGOsiGjg456nUG9NomsnBNtb5siA7f/jeLr69RFKW+J5GFsE4XxsdaWIJFx
 sCeGtWlb3LZqX8lO8HAP0XmMYU5mBVBU7FkTYQ0LY/qaESzZMnnGaY4zCZTktFa+NidU=;
Received: from mail-japanwestazolkn19012048.outbound.protection.outlook.com
 ([52.103.66.48] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vZNJJ-00027q-Mx for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 05:57:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Otz3l4dlY9LI1JFjIRlt97TfbB8+Yu2SBpnPHxc5zh7klZOWiF0E61jkEp+A1XWkAbKqVJYJXJgiMcJA3hh9jr1gsCsZDJihCo30Ye6vmzOLkiQL9g0rMjVgXSD85/RiZjutfck5Z7oJfANwrvB5hsaCjYUE8I8hf70X3atAFRrykCAfwXtI9r1K5NUX1Jww2tFqYZ4upiDtQovWauB7Zvi2DKgfS3p3ofQtshoCSh33iLULLSxJ4NdCecIYGsh+EL0dQuFtZfiDJ8T8sxOlXV+nYPXOOsH3VLXbxYYQwhcVBW7IQjd7iUUUK7sZmEHP2uPqckjhwMF7bsBmOcOVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEZ+vSIMk1PnpBWcwhbHP+MgzvC8YBryybkQPYQCMts=;
 b=UgOKD8ysUN2PYGD9eIgir4MEQL2Y1hEgBFmZ9Y2tpDdXJrW//G4e1QUk91LtnkxmcjnyIq9MRwklT10VgQXcUNKn7VBsH7vWQRXxrQ+NWCd7h3VDWZjOYwCRWWzSBFD+QABEgeBgwm4DCSJZmKA0J3yJ9VfjXA3kQ9AO86eFx0UKtSpD+1iKSGBz4mdXAUD/stJzn2sCuCCejwGoTIYRwgAqhGfX0canTHUDpb5Vjn7ZRXr1JK86TArXMAasyY8/Bbw/AkkX5Ohf7RDBTx6yYsF2qDKrwVk2igUF0gLj3ILe5rPURLWb/MWcajKdeZnZM0xRVRay/VdXuW3jL8/law==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEZ+vSIMk1PnpBWcwhbHP+MgzvC8YBryybkQPYQCMts=;
 b=tklVcyBmCBTzBpp5dznppDmG50uh5kZ8GxrA70MrQMeqIpt7ztqLa7aU2oXnEHHqcMSJNt02jgtEGYNTe8xTwYMW9aYE2a446rz2m/fXorLEKqIskhShzye+/zTWsN47sUwj6l9QMrbaEqqgAq9wEZfdMXP2un7FCObj7u9QV+838RQTcJcgvDr7CtlrjCZPsh2BKoVKmw82QYFfIgrp0e+T2j183KPc9zJ8YBeuKY/XJowjoDkl+kqIO0aSpJm27o3Ejmv7difm5QhH7rtTuhDmNapk/8JC7B0wcJZho5oxVx4fiE1qsDMtOXgUDFVbHs2533SWdf9O/+ETG1GJXg==
Received: from SEZPR02MB5520.apcprd02.prod.outlook.com (2603:1096:101:47::14)
 by SEZPR02MB6433.apcprd02.prod.outlook.com (2603:1096:101:10e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Sat, 27 Dec
 2025 05:57:40 +0000
Received: from SEZPR02MB5520.apcprd02.prod.outlook.com
 ([fe80::ebcf:d79b:73ca:4120]) by SEZPR02MB5520.apcprd02.prod.outlook.com
 ([fe80::ebcf:d79b:73ca:4120%4]) with mapi id 15.20.9434.001; Sat, 27 Dec 2025
 05:57:40 +0000
Message-ID: <SEZPR02MB55207C7AFE78277CA88B5CDC99B1A@SEZPR02MB5520.apcprd02.prod.outlook.com>
Date: Sat, 27 Dec 2025 13:56:45 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251224131634.3860115-2-yangyongpeng.storage@gmail.com>
 <c34d413c-755c-4248-8aab-c891577d4b21@kernel.org>
 <e67cb602-dbe5-4d5c-a148-69fdc23e43ef@gmail.com>
 <6e0d513e-b111-4693-a67c-b67a927601e6@kernel.org>
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
In-Reply-To: <6e0d513e-b111-4693-a67c-b67a927601e6@kernel.org>
X-ClientProxiedBy: SEWP216CA0062.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::16) To SEZPR02MB5520.apcprd02.prod.outlook.com
 (2603:1096:101:47::14)
X-Microsoft-Original-Message-ID: <a1ca9c81-6bbc-4693-a667-30afb1c7f1fb@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5520:EE_|SEZPR02MB6433:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f07c1fc-58b6-4a79-867e-08de450cd816
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|51005399006|461199028|5072599009|6090799003|19110799012|8060799015|41001999006|9112599006|23021999003|15080799012|10035399007|440099028|3412199025|40105399003|3420499032|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlliSTFhcTdoTXhBcFNnTzRQWm4zdUhROWdsZ205VEZsUXNnK1lINU5yd21W?=
 =?utf-8?B?Z21sSXduRURleUovc0JIYkNIdXdZK041bkw3dW1ROXFiYjZjd2dGY09UVjN6?=
 =?utf-8?B?U3FqZHd3RmI5Y040QzNQZ3FQN3pGMStwWHhJOXRzM1lra1l5SWZNNEhqTlI1?=
 =?utf-8?B?cmt4RlNQRm11SFVzdHNxVWdSR3NmTlhUaXVZWHBaSnhJNlNGczdjMjdwMkJS?=
 =?utf-8?B?bmJRVjd2eW9UcVdRNDQ4V3lFcTB0Q3g5YjlpTXBDbkhvZSt0aVlyMVBSODBQ?=
 =?utf-8?B?WHEzZk5BbEZYQVpiV1hnZ0RnSE1lTFFtZWRLM3NhMjB0emJrTlJLR25YaXBT?=
 =?utf-8?B?U1dlR0xKQTlJVFRNY0g0L25Ia0hHbUQ3OEhuUVBldEZteTJFeHY1bEIvMDgx?=
 =?utf-8?B?RUJrc24veURxU0JPd0x2NzJneDRPeFA2UWdKUGJSOWJIVGJNZHhtOVFBWHhW?=
 =?utf-8?B?MFp6SW9BbFdSUmxkNi96MWxXeUVCdE9YREd0eHVsMFgyeGVqR0dXcHB5cXI5?=
 =?utf-8?B?MDY0TTBQeC9jNXdlK3RRUU9naVRySGdQUmhwd3lMRjhVR05ibmxaMlJMWXJt?=
 =?utf-8?B?WE5QN2RNSXJRREw1bndVMlZON3NKeEVCNXJpMlcrZHJ2Q0JKNVhHWkRnNzVI?=
 =?utf-8?B?RmV1ZWd2MDR4ZWNsS1FnclgvVUpnNGVseE1kTTFPMDFqdjJhdlRmUEpVbUxC?=
 =?utf-8?B?UEl4NnhBdlJDVFgzRTAyTU96cDloQkpRY2xtWmQwRmZ4WUVXcnFkNURSV21W?=
 =?utf-8?B?S3YxOGR4aXZkdDBqYy8vdG5PN00rMzFyZFpVTGFwM3ZWU2NRcXRkN3UzOFp5?=
 =?utf-8?B?OC84bnRTZzdkdGRGSmUrOUNkZkgrMDB4RWF4QVBoMWlpcU8xNXB5bHRlVjlt?=
 =?utf-8?B?SkhlVDBzZlRYY2VTQjVYbWdqT3BVU1d3SVF3bUJ5cG82WW1DbkVPeGZNUDBl?=
 =?utf-8?B?OVNDQml0VTNJVjU5VjRmcVlLZWVhVzlmb3ZiTHBPaGZnNlVKWlphaUJadGtX?=
 =?utf-8?B?WElKbHJXcWJack8zTzl6cm1NQ0ZJeDB6S05ZNktCWHcwYnpOUXM4WC9sanFu?=
 =?utf-8?B?Z1ZMdEdOa2RqRnhDeUFDTjBxTVpaU0pTczZXcXJoSWxFZlcyYXJtWVc3MktL?=
 =?utf-8?B?ZnNaa1Vrb1dBYzV6OGx2b21hNTdKclg3MnJNcjE4MGU4MkZjR3BPZ0MvQWxu?=
 =?utf-8?B?eUlFWjQvTDQwQ001b3YxVDlyUGlrMTBKRzhGOE9XcDdXMUVZMVBXOHcxek02?=
 =?utf-8?B?RHNqWWRsbStJK0dnb3NqT0swdHR0UEFwM0t2WmpFL3gwL2hhMFZ4NU9mYTVB?=
 =?utf-8?B?RHJ0VGpSK3p0SDVuQnVGdlFhSkZKcUllNFBLU29LUlZGWG9WK1cvRWtIeERa?=
 =?utf-8?B?dGJuS04wcFBHcDNWSnQ1dEtMYmZkT0xFR0psVjlOMWpDa2laT1p4cVZKdG1D?=
 =?utf-8?B?aGI4VUZGcllLOTMxVzNrUGNzRkdtZGd2MUpCOUl5MXM0UDFHVVdNVEZhek11?=
 =?utf-8?B?Wk51K1Z5aUoyd2FyUVJOWGtpZ3VFRnlna1k5dkNIZTNyZnVnSi9raUJGbDBN?=
 =?utf-8?B?TkYxVkR3cDhtYkJPNmRsWjQrSFVQUFRFWGpZZWl2VWxXYWJCV0pZMXJSMHRQ?=
 =?utf-8?B?M3JqSVVzd2N2M3N2ci95UG9CeExXMnc0MytnTTJuMjgyVEdtZU52QkI3TWNU?=
 =?utf-8?B?QU9IbWZPY3owOHB0NlluQ2JtY2ZqdUV1cnRqVGZ4WStUQlZkNDFMTWN1Mnh4?=
 =?utf-8?B?M0RvakcrNzJ2aGRGY0Z6M2FzNUtqbkFaejlzU2tPVmhXSGtTUFJ3ZXRpblM3?=
 =?utf-8?Q?YiDPBgUw1u2NrGPe+o1mbOPza1ua0Z34z5ahQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHdyVHM2akZ3MXV4T1ZNNlJ6UHRUN0xNUWQvN0tWSEVnbXREcVVhZTB2bURR?=
 =?utf-8?B?OEdaam5EWWZwQXZDS2lQdHFwL1oxMXpFbU5iU0gzak1UaFVzTlFFQVQ5UzVk?=
 =?utf-8?B?L1JUMjlmNUgxeEs5ZDBDQW9mTmpQWDJqS0UvdGVOdFNrQ3NScm90THNyUTdl?=
 =?utf-8?B?ZnVBV2E5YlJxN0xnSk81aVYxNVllSzF0QUhKaTk0QVNZck1iTnRlWG9JcjI5?=
 =?utf-8?B?MFA3V21EMklsZ25XcWNsKzJFVHY4eUdQaU5Mc0F1alp3cHIvdkRXVEdHakR6?=
 =?utf-8?B?emY1eGMwL1Rhb2E5NWRxZEMzYlpzTHlrTk9yc1dHRklXWEI2ZFJTbk1ZV1lZ?=
 =?utf-8?B?dlVzWTVCalhzK3BkS242QXY4ZGhMbG41dmZWeDhjMnhHVlpxS1c2Q0pKbkgy?=
 =?utf-8?B?NjJyS3RxVmk2OEZSTUFKcUI0MExxYkRTUTliYzJtRXZXWmV4Ly9HdmVCMmhW?=
 =?utf-8?B?N2FEZ0xPNTB1NlkxTi85SHZnaDZFUXZwN0hoNWZVTmk0aEgvSzFWeDcwYTJ1?=
 =?utf-8?B?QW1JeXB2Z3ZaL29nQnBKS2tzYU5FekhSdXlzQzhhU1E2Tlk3Tzk0S2x6WHBG?=
 =?utf-8?B?OUNLcTJTc2Y2QWVQR1JhSlRQNU9oSUM2azB3Q2JtMGtrSk9NVkY5TmQ3VjBm?=
 =?utf-8?B?QjZQMjl1dlA1blRXVnJDb2RVTGpvbGhqanNmNlc0RWVKNDk4ME42Nk4rYlZV?=
 =?utf-8?B?Qzh6WTVKQnRqZjQ2Q1ZRNUtVdjBEOTltWm40Y2R0TCs0Mm14bWttVHdyVlBY?=
 =?utf-8?B?azhPZ3dWdWxQTFhjcFVPT3JVVWlURW5FMWhvS2paeUp4b3o4T0NSaDVaMEEz?=
 =?utf-8?B?UVlWOHJMc3FrekN3V0hkcUF2ZDNnNUI4alZ6SmJZRGZDR09hVWFtRndiNjh0?=
 =?utf-8?B?aEtqMkVzemZpY2xJZFlLS1VrMzNlN1VPZlFDSmNqUWRnNmxTeTVYM2o0akxF?=
 =?utf-8?B?UUlXMmd2ZmYyWENEYnRUSVdSZVVtT2d5T2pvd1pndlczdGZTNnJxbHQrRWUw?=
 =?utf-8?B?MkZoOFMvaHcvU0t5OGg4anBDY1dSSWo3Qm04UDhuY0xEMmw5Qy94cnJRaGp3?=
 =?utf-8?B?WDFKUHJPUzYvbFh6dERQcnFhY3VJclNoQjRxVkpSVnlqa2E2cEdMRTJORGJr?=
 =?utf-8?B?OTFCbFJVamN4VWFJSkFBMTV2QWxFdGtJSWV1ZVd4RHUzbFIvMXJTZXNOODA2?=
 =?utf-8?B?bWxPWW4yaUJQeTRlWnhOQU9lVGhaZHVmMWV2ajQrMkNHUGpYWkxFOXhKWWlo?=
 =?utf-8?B?VE13ekhwOFpoSUpFdVlqNzFNdmQyWTEwa2xvOFd3ZUpUanVIYlgveEhQeWow?=
 =?utf-8?B?cFUvZTY5OFBtOEVsYlBGcFBRRFNoczNwOS9SVWIwS3lTcmg4VzkvSThDOVV5?=
 =?utf-8?B?TWxYbTdQRFp0U0l2eVY5WWx0U3dmd2c3OU9Wand3aW9NV3l0U2JVY2JSTGxQ?=
 =?utf-8?B?M1VaT1B3YXJiN1N0UFhrV3RZZjNXbmFPWlpyQ1R0OWxreGs3dXVnbXFtSmdZ?=
 =?utf-8?B?R1diZ3hQSUFuOVUvTmk3aVd3MnIrby8yeG9SS3o0ZmhYY1I0OXF1R0FuUjJ3?=
 =?utf-8?B?ZWx5Y0RrcExibmhxOE5Ha3VuMnZjSTRTYyt3QW5aSzFSdjgwdkNyM3V3MTB3?=
 =?utf-8?B?dTdGN2ZPSWlWVTBESVZUbXczbHV2ZGw5SHdTZzloUUZpdUxOMjVzei90UUZI?=
 =?utf-8?B?MU45aEU0cHlZR0cyMmVDdHNuRjNTYmJycVNWQjladXFsaE9TTmxYanFiU3Mv?=
 =?utf-8?B?STJEanJkMFVkbWRZZkI3RW1WRnhQVWJuU3NERU9ORkg5WkJ2c2VaWTY0VEdM?=
 =?utf-8?B?QS81cWJnY2hJaDRTWERSTFR6WmFLbkFaR0JSNnRUTk4rWXpocGdmUGk1Sks1?=
 =?utf-8?B?VkV2cS9jUExjeFA0dURFZTlOT0NzUnBuUXVwd3JPVDJ6Q0hza1BVMG03MElE?=
 =?utf-8?B?Z2UrWGtyLytuQXlqV2tIWTVrWWF1ellNSUdWZnNpVWxTd0xMYjNidCtjVUZl?=
 =?utf-8?Q?5rk1Y5pvEWWfR7eG0MeDXwyud0A888=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f07c1fc-58b6-4a79-867e-08de450cd816
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5520.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 05:57:40.2162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB6433
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/27/25 9:40 AM, Chao Yu via Linux-f2fs-devel wrote: >
 On 12/26/2025 9:22 PM, Yongpeng Yang wrote: >> On 12/26/25 10:23, Chao Yu
 via Linux-f2fs-devel wrote: >>> On 12/24/2025 9:16 PM, Yongpeng Yan [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)outlook.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.103.66.48 listed in wl.mailspike.net]
X-Headers-End: 1vZNJJ-00027q-Mx
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: fix IS_CHECKPOINTED flag
 inconsistency issue caused by concurrent atomic commit and checkpoint
 writes
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
Cc: Sheng Yong <shengyong1@xiaomi.com>,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMjcvMjUgOTo0MCBBTSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToK
PiBPbiAxMi8yNi8yMDI1IDk6MjIgUE0sIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+IE9uIDEyLzI2
LzI1IDEwOjIzLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4gT24gMTIv
MjQvMjAyNSA5OjE2IFBNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4+IEZyb206IFlvbmdwZW5n
IFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4KPj4+IE5pY2UgY2F0Y2ghCj4+Pgo+
Pj4+Cj4+Pj4gRHVyaW5nIFNQTyB0ZXN0cywgd2hlbiBtb3VudGluZyBGMkZTLCBhbiAtRUlOVkFM
IGVycm9yIHdhcyByZXR1cm5lZCAKPj4+PiBmcm9tCj4+Pj4gZjJmc19yZWNvdmVyX2lub2RlX3Bh
Z2UuIFRoZSBpc3N1ZSBvY2N1cnJlZCB1bmRlciB0aGUgZm9sbG93aW5nIAo+Pj4+IHNjZW5hcmlv
Cj4+Pj4KPj4+PiBUaHJlYWQgQcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUaHJlYWQgQgo+Pj4+IGYyZnNfaW9j
X2NvbW1pdF9hdG9taWNfd3JpdGUKPj4+PiDCoMKgIC0gZjJmc19kb19zeW5jX2ZpbGUgLy8gYXRv
bWljID0gdHJ1ZQo+Pj4+IMKgwqDCoCAtIGYyZnNfZnN5bmNfbm9kZV9wYWdlcwo+Pj4+IMKgwqDC
oMKgwqAgOiBsYXN0X2ZvbGlvID0gaW5vZGUgZm9saW8KPj4+PiDCoMKgwqDCoMKgIDogc2NoZWR1
bGUgYmVmb3JlIGZvbGlvX2xvY2sobGFzdF9mb2xpbykgZjJmc193cml0ZV9jaGVja3BvaW50Cj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGJsb2NrX29wZXJhdGlv
bnMvLwo+Pj4+IHdyaXRlYmFjayBsYXN0X2ZvbGlvCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAtIHNjaGVkdWxlIGJlZm9yZQo+Pj4+IGYyZnNfZmx1c2hfbmF0X2Vu
dHJpZXMKPj4+PiDCoMKgwqDCoMKgIDogc2V0X2ZzeW5jX21hcmsobGFzdF9mb2xpbywgMSkKPj4+
PiDCoMKgwqDCoMKgIDogc2V0X2RlbnRyeV9tYXJrKGxhc3RfZm9saW8sIDEpCj4+Pj4gwqDCoMKg
wqDCoCA6IGZvbGlvX21hcmtfZGlydHkobGFzdF9mb2xpbykKPj4+PiDCoMKgwqDCoMKgIDogX193
cml0ZV9ub2RlX2ZvbGlvKGxhc3RfZm9saW8pCj4+Pgo+Pj4gV2hhdCBkbyB5b3UgdGhpbmsgb2Yg
cmVsb2NhdGluZyBzZXRfZnN5bmNfbWFyayAmIHNldF9kZW50cnlfbWFyayBsb2dpYwo+Pj4gaW50
byBfX3dyaXRlX25vZGVfZm9saW8oKSwgc28gdGhhdCB3ZSBjYW4gY292ZXIgdGhlbSB3LyAKPj4+
IGV4aXN0ZWQgLm5vZGVfd3JpdGUKPj4+IGxvY2sgaW4gX193cml0ZV9ub2RlX2ZvbGlvKCksIGl0
IGNhbiBhdm9pZCBjaGVja3BvaW50IHJhY2luZyBhcyB3ZWxsLgo+Pgo+PiBZZXMsIHRoaXMgbWFr
ZXMgbW9yZSBzZW5zZS4gSSdsbCBmaXggdGhpcyBpbiB2MiBwYXRjaC4KPj4KPj4+Cj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIAo+Pj4+IGYyZnNfZmx1c2hfbmF0
X2VudHJpZXMKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6
IHtzdHJ1Y3QgbmF0X2VudHJ5fS0KPj4+Pj4gZmxhZyB8PSBCSVQoSVNfQ0hFQ0tQT0lOVEVEKQo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNQTwo+Pj4+Cj4+Pj4gVGhy
ZWFkIEEgY2FsbHMgZjJmc19uZWVkX2RlbnRyeV9tYXJrKHNiaSwgaW5vKSwgYW5kIHRoZSBsYXN0
X2ZvbGlvIGhhcwo+Pj4+IGFscmVhZHkgYmVlbiB3cml0dGVuIG9uY2UuIEhvd2V2ZXIsIHRoZSB7
c3RydWN0IG5hdF9lbnRyeX0tPmZsYWcgZGlkIAo+Pj4+IG5vdAo+Pj4+IGhhdmUgdGhlIElTX0NI
RUNLUE9JTlRFRCBzZXQsIGNhdXNpbmcgc2V0X2RlbnRyeV9tYXJrKGxhc3RfZm9saW8sIDEpIAo+
Pj4+IGFuZAo+Pj4+IHdyaXRlIGxhc3RfZm9saW8gYWdhaW4uCj4+Pj4KPj4+PiBBZnRlciBTUE8g
YW5kIHJlYm9vdCwgaXQgd2FzIGRldGVjdGVkIHRoYXQge3N0cnVjdCBub2RlX2luZm99LT5ibGtf
YWRkcgo+Pj4+IHdhcyBub3QgTlVMTF9BRERSIGJlY2F1c2UgVGhyZWFkIEIgc3VjY2Vzc2Z1bGx5
IHdyaXRlIHRoZSBjaGVja3BvaW50Lgo+Pj4+Cj4+Pj4gVGhpcyBpc3N1ZSBvbmx5IG9jY3VycyBp
biBhdG9taWMgd3JpdGUgc2NlbmFyaW9zLCBhbmQgZG9lcyBub3QgYWZmZWN0Cj4+Pgo+Pj4gSWYg
YXRvbWljIGlzIGZhbHNlLCB3ZSB3aWxsIGVuY291bnRlciBzdWNoIGlzc3VlIGFzIHdlbGw/IG9y
IGFtIEkgCj4+PiBtaXNzaW5nCj4+PiBzb21ldGhpbmc/Cj4+Cj4+IEluIHRoZSBjYXNlIG9mIGF0
b21pYyBpcyB0cnVlLCB0aGUgZm9saW8gbXVzdCBiZSBub24tZGlydHkuCj4+IEZvciByZWd1bGFy
IGZpbGUgZnN5bmMgb3BlcmF0aW9ucywgdGhlIGZvbGlvIG11c3QgYmUgZGlydHkuIElmCj4+IGJs
b2NrX29wZXJhdGlvbnMtPmYyZnNfc3luY19ub2RlX3BhZ2VzIHN1Y2Nlc3NmdWxseSBzdWJtaXQg
dGhlIGZvbGlvCj4+IHdyaXRlLCB0aGlzIHBhdGggd2lsbCBub3QgYmUgZXhlY3V0ZWQuIE90aGVy
d2lzZSwgdGhlCj4+IGYyZnNfd3JpdGVfY2hlY2twb2ludCB3aWxsIG5lZWQgdG8gd2FpdCBmb3Ig
dGhlIGZvbGlvIHdyaXRlIHN1Ym1pc3Npb24KPj4gdG8gY29tcGxldGUsIGFzIHNiaS0+bnJfcGFn
ZXNbRjJGU19ESVJUWV9OT0RFU10gPiAwLiBUaGVyZWZvcmUsIHRoZQo+PiBzaXR1YXRpb24gd2hl
cmUgZjJmc19uZWVkX2RlbnRyeV9tYXJrIGNoZWNrcyB0aGF0IHRoZSB7c3RydWN0Cj4+IG5hdF9l
bnRyeX0tPmZsYWcgZG9lcyBub3QgaGF2ZSB0aGUgSVNfQ0hFQ0tQT0lOVEVEIGZsYWcsIGJ1dCB0
aGUgZm9saW8KPj4gd3JpdGUgaGFzIGFscmVhZHkgYmVlbiBzdWJtaXR0ZWQsIHdpbGwgbm90IG9j
Y3VyLgo+IAo+IElJVUMsIHlvdSBtZWFuIG9ubHkgYXRvbWljIHdyaXRlIHdpbGwgcmVkaXJ0eSBs
YXN0IGZvbGlvIGFmdGVyIAo+IGJsb2NrX29wZXJhdGlvbnMoKSwKPiB0aGVuLCBzZXRfZGVudHJ5
X21hcmsoKSBjYW4gcmFjZSB3LyBfX2ZsdXNoX25hdF9lbnRyeV9zZXQoKT8KPiAKPiAgwqDCoMKg
wqBpZiAoYXRvbWljICYmICFtYXJrZWQpIHsKPiAgwqDCoMKgwqDCoMKgwqAgZjJmc19kZWJ1Zyhz
YmksICJSZXRyeSB0byB3cml0ZSBmc3luYyBtYXJrOiBpbm89JXUsIGlkeD0lbHgiLAo+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlubywgbGFzdF9mb2xpby0+aW5kZXgpOwo+ICDCoMKg
wqDCoMKgwqDCoCBmb2xpb19sb2NrKGxhc3RfZm9saW8pOwo+ICDCoMKgwqDCoMKgwqDCoCBmMmZz
X2ZvbGlvX3dhaXRfd3JpdGViYWNrKGxhc3RfZm9saW8sIE5PREUsIHRydWUsIHRydWUpOwo+ICDC
oMKgwqDCoMKgwqDCoCBmb2xpb19tYXJrX2RpcnR5KGxhc3RfZm9saW8pOwo+ICDCoMKgwqDCoMKg
wqDCoCBmb2xpb191bmxvY2sobGFzdF9mb2xpbyk7Cj4gIMKgwqDCoMKgwqDCoMKgIGdvdG8gcmV0
cnk7Cj4gIMKgwqDCoMKgfQo+IAo+IElmIHRoYXQncyB3aGF0IHlvdSBtZWFuLCBwbGVhc2UgYWRk
IHRoZXNlIGRldGFpbHMgaW50byBjb21taXQgbWVzc2FnZS4KClllcywgSSB3aWxsIGFkZCB0aGVz
ZSBkZXRhaWxlZCBleHBsYW5hdGlvbnMgdG8gdGhlIGNvbW1pdCBtZXNzYWdlIGFuZApzZW5kIHRo
ZSB2MyBwYXRjaC4KClRoYW5rcwpZb25ncGVuZywKCj4gCj4gVGhhbmtzLAo+IAo+Pgo+PiBUaGFu
a3MKPj4gWW9uZ3BlbmcsCj4+Cj4+Pgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICgh
YXRvbWljIHx8IGZvbGlvID09IGxhc3RfZm9saW8pIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNldF9mc3luY19tYXJrKGZvbGlvLCAxKTsKPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHBlcmNwdV9jb3VudGVyX2luYygmc2JpLT5yZl9ub2RlX2Jsb2Nr
X2NvdW50KTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChJU19JTk9E
RShmb2xpbykpIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBGSV9ESVJUWV9JTk9ERSkp
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJm
c191cGRhdGVfaW5vZGUoaW5vZGUsIGZvbGlvKTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc2V0X2RlbnRyeV9tYXJrKGZvbGlvLAo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfbmVlZF9kZW50cnlfbWFy
ayhzYmksIGlubykpOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogbWF5IGJlIHdyaXR0ZW4gYnkgb3Ro
ZXIgdGhyZWFkICovCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWZv
bGlvX3Rlc3RfZGlydHkoZm9saW8pKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBmb2xpb19tYXJrX2RpcnR5KGZvbGlvKTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB9Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+PiByZWd1bGFyIGZpbGUgZnN5bmMgb3Bl
cmF0aW9ucy4gVGhlcmVmb3JlLCBmb3IgYXRvbWljIGZpbGUgZnN5bmMsCj4+Pj4gc2JpLT5jcF9y
d3NlbSBzaG91bGQgYmUgYWNxdWlyZWQgdG8gZW5zdXJlIHRoYXQgdGhlIElTX0NIRUNLUE9JTlRF
RCAKPj4+PiBmbGFnCj4+Pj4gY29ycmVjdGx5IGluZGljYXRlcyB0aGF0IHRoZSBjaGVja3BvaW50
IHdyaXRlIGhhcyBiZWVuIGNvbXBsZXRlZC4KPj4+Pgo+Pj4+IEZpeGVzOiA2MDg1MTRkZWJhMzgg
KCJmMmZzOiBzZXQgZnN5bmMgbWFyayBvbmx5IGZvciB0aGUgbGFzdCBkbm9kZSIpCj4+Pj4gU2ln
bmVkLW9mZi1ieTogU2hlbmcgWW9uZyA8c2hlbmd5b25nMUB4aWFvbWkuY29tPgo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4+IC0t
LQo+Pj4+IMKgwqAgZnMvZjJmcy9ub2RlLmMgfCA4ICsrKysrKystCj4+Pj4gwqDCoCAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9ub2RlLmMgYi9mcy9mMmZzL25vZGUuYwo+Pj4+IGluZGV4IDQ4MmEzNjJm
MjYyNS4uZTQ4MmEzODQ0NGYxIDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvbm9kZS5jCj4+Pj4g
KysrIGIvZnMvZjJmcy9ub2RlLmMKPj4+PiBAQCAtMTg1NCw3ICsxODU0LDcgQEAgaW50IGYyZnNf
ZnN5bmNfbm9kZV9wYWdlcyhzdHJ1Y3QgZjJmc19zYl9pbmZvCj4+Pj4gKnNiaSwgc3RydWN0IGlu
b2RlICppbm9kZSwKPj4+PiDCoMKgwqDCoMKgwqAgc3RydWN0IGZvbGlvX2JhdGNoIGZiYXRjaDsK
Pj4+PiDCoMKgwqDCoMKgwqAgaW50IHJldCA9IDA7Cj4+Pj4gwqDCoMKgwqDCoMKgIHN0cnVjdCBm
b2xpbyAqbGFzdF9mb2xpbyA9IE5VTEw7Cj4+Pj4gLcKgwqDCoCBib29sIG1hcmtlZCA9IGZhbHNl
Owo+Pj4+ICvCoMKgwqAgYm9vbCBtYXJrZWQgPSBmYWxzZSwgbG9ja2VkID0gZmFsc2U7Cj4+Pj4g
wqDCoMKgwqDCoMKgIG5pZF90IGlubyA9IGlub2RlLT5pX2lubzsKPj4+PiDCoMKgwqDCoMKgwqAg
aW50IG5yX2ZvbGlvczsKPj4+PiDCoMKgwqDCoMKgwqAgaW50IG53cml0dGVuID0gMDsKPj4+PiBA
QCAtMTg4OSw2ICsxODg5LDEwIEBAIGludCBmMmZzX2ZzeW5jX25vZGVfcGFnZXMoc3RydWN0IGYy
ZnNfc2JfaW5mbwo+Pj4+ICpzYmksIHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaW5vX29mX25vZGUoZm9saW8pICE9IGlubykKPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+Pj4gwqDCoCAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoYXRvbWljICYmIGZvbGlvID09IGxhc3RfZm9saW8p
IHsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfbG9ja19vcChzYmkp
Owo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbG9ja2VkID0gdHJ1ZTsKPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmb2xpb19sb2NrKGZvbGlvKTsKPj4+PiDCoMKgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmICh1bmxpa2VseSghaXNfbm9kZV9mb2xpbyhmb2xpbykpKSB7Cj4+Pj4gQEAgLTE5NTks
NiArMTk2Myw4IEBAIGludCBmMmZzX2ZzeW5jX25vZGVfcGFnZXMoc3RydWN0IGYyZnNfc2JfaW5m
bwo+Pj4+ICpzYmksIHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZ290byByZXRyeTsKPj4+PiDCoMKgwqDCoMKgwqAgfQo+Pj4+IMKgwqAgb3V0Ogo+Pj4+ICvC
oMKgwqAgaWYgKGxvY2tlZCkKPj4+PiArwqDCoMKgwqDCoMKgwqAgZjJmc191bmxvY2tfb3Aoc2Jp
KTsKPj4+PiDCoMKgwqDCoMKgwqAgaWYgKG53cml0dGVuKQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGYyZnNfc3VibWl0X21lcmdlZF93cml0ZV9jb25kKHNiaSwgTlVMTCwgTlVMTCwgaW5vLCBO
T0RFKTsKPj4+PiDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4+Cj4+Pgo+Pj4KPj4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdAo+Pj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKPj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwKPj4KPiAKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
