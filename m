Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3BDB06C53
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jul 2025 05:35:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68mQWsciESMOPnz7Wu/ZbvoJ3cvQNmSbjYTP3+fmPVg=; b=hWoPz9IrdQw0spsmj64QbjiPyl
	aGmhaUwSr1LYQTxJGHGze8asgazQJfq3ims5uRG18F7TGW6AND1xd+5jOKl1+xHWEqlbYdd/OMnTa
	wjC+lh5x0ARkKA27RrCPJ571lFFeMGySOSi9AN9QdkJ/+Os4sFfHly1lWsCI1PtKu4bU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubsvO-0000In-H7;
	Wed, 16 Jul 2025 03:35:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hanqi@vivo.com>) id 1ubsvN-0000IZ-1F
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Jul 2025 03:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ofy+GdBubySjN0btLzh9yrbljgbutZY4qUqpKBoS44E=; b=DFxYSR3Lw1KMH4uLCKQ+mw7MOI
 12ZOOUEyZkEKOdo5oU7eRLw/Xy+FqUhO7iV73I/TBEMgUg1zDXwxZzvDpvV0npGcAlQig42B2WCfD
 E/tI0YmOfFsQOVLa8r7Amu/vMe2r2e4Zn4usEyGLnyOtbpFUTfIMUks4L/1m2jI/2YOU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ofy+GdBubySjN0btLzh9yrbljgbutZY4qUqpKBoS44E=; b=UVaQKdBKTTV2YzeY7CYkMWE2hh
 aWV7mCVy5J5D7vf9kE6y4Q8/rmdSsKl9L+evsF0WlLcSVFmAXsAAiAdEau4G6XCzu/w7+yCGAGta6
 VmSQsFPdENUQttyLXQMBQLutHx1HbqOXzj6Moy2rfaOf4GCyo9vlwGvXnOZUBx/ke5R4=;
Received: from mail-koreacentralazon11013011.outbound.protection.outlook.com
 ([40.107.44.11] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ubsvL-0004KG-MU for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Jul 2025 03:35:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIuraEjny4ELk7AL7ESEb5M/BS75cBvzUOxamGXvs7YOE4F7NxuElsWYo9vgiMp1lOzl/vh6QGa2LYlhRLj0Fh5a7Bj1dq+zzGbusqOLqU5rdUp9gAtEiaBzRu4+fySPr0dfjlrYjhvdaMC3vnSqVNI4Bz+3yVizEgf7hFTtvCtT/7R1/SbWigroV+IAYBf5PzGqzeLhic0Tk88hOCr1jiRTMFN4XyuQdE08gW51UV3TAW2G4RINN1CGWb1unNUuA0LvP8lXE+NGj7/67z5dZkMAfBs9cu0cZ8bVBQUqg5SjiI1RBDW6ZTSCHawZ2W78eRPcUwL3dN6ZU0pezceS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ofy+GdBubySjN0btLzh9yrbljgbutZY4qUqpKBoS44E=;
 b=GhBJqtSfOezG0WnSnhQvbfKYM6CziCTApVT/HLQMAFtfVKCPR/NMbEY0dsdsRiNyBQaU9gl5GaSlnYAZ+iw4nyRGXCzcwTGhy0zXFXl2opdzu/uEolVF070ly5A3fyvuk1x6N9d8jUXNL+A5as3dVbwiimdj+k7yb1E6rWQZDH4LeyC+feA+st0Q+MZ+Ze4jKxNxWk3GCflGHK28E5I0aWcaCpLYaEQU5bNcvC8ZZcR0gbnk7y/55oFHEbeoU74IHReQxbtBl10erpeecx8Z+dgX64549P6If4L11ZDN7v2Z3Yw3Sr3M4WM8NSDkVELJJtjTYdvYJauIEwtXb1TR/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ofy+GdBubySjN0btLzh9yrbljgbutZY4qUqpKBoS44E=;
 b=MV/Hp9aoNtQWr5Bcj2LdMkFoIGs5nvuqNHqZHeAWR++tYKT6vLoblntgVomVEyBc/iZvpYoCDdRV/XqsCEfKNe9OzJAJHTRWdoBZJOjgMGBtN00a32bRZiTRmFW6RbDQxnhqyPUwo2TeGr1FBvkXfu/6lmZVPdGfMqd7FNKB1G8k1moSUfzdm8J5Z/lOt+i/G2Sv23LTzAKJu5AYdSbddqH4lOHusYMqOpeeqXydoumLogVH6heA3WDKafuE1EPBSqAb3RbSnYizAhk586xTgRCbJnbQ3doZqcnbdl0/j6tREQ9VZbOncjrL5zbf+WloDAW0TmoNUrMtvt7D+dAobg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
 by JH0PR06MB7105.apcprd06.prod.outlook.com (2603:1096:990:91::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 03:34:59 +0000
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0]) by SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0%5]) with mapi id 15.20.8901.028; Wed, 16 Jul 2025
 03:34:58 +0000
Message-ID: <f7408161-eaef-47ed-8810-8c4e8f27bfc6@vivo.com>
Date: Wed, 16 Jul 2025 11:34:55 +0800
User-Agent: Mozilla Thunderbird
To: Jens Axboe <axboe@kernel.dk>, jaegeuk@kernel.org, chao@kernel.org
References: <20250715031054.14404-1-hanqi@vivo.com>
 <056e083b-8e41-45a2-9b0f-2ec47d1a9f71@kernel.dk>
In-Reply-To: <056e083b-8e41-45a2-9b0f-2ec47d1a9f71@kernel.dk>
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To SEZPR06MB7140.apcprd06.prod.outlook.com
 (2603:1096:101:228::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB7140:EE_|JH0PR06MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: e5250174-dffc-4145-9c51-08ddc419bd0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHdGQmxna21pNHZMTm5HbFQrbDZ2d0lhZ0VFZ1ZCb3VqL2piVjErSE53a0xR?=
 =?utf-8?B?cU8yVTF6MW5GNVh4RjA3bms0Yk5iMnhxMHpDV3g0dkpNSkp6MkRIb1Z2SXV1?=
 =?utf-8?B?eGVydmJNc2RrTThGV2VlRmJ1WHFOZHZQOTdBbklKVWpJNW1HQlZDZnNaUnU4?=
 =?utf-8?B?Mmd0aHVsUmIzMjlhbWh3MU9qN1pheStRb0N0OHVYMWJ0bk8zb2tReTVBbmVI?=
 =?utf-8?B?RXFKMFFydGVSWFdtVXRlK0JJZWl6VTQveW8vUUxIVTUyRGVEMzd6MTB2c3R0?=
 =?utf-8?B?SEFZWTlMS0YwTCt2ZE5YYUFpZlVMdjBHcGdJQkJjRzRhM1RrbUMvdmZrSlly?=
 =?utf-8?B?VTk4QkhTQXNWWmpsY3NpUzZqRElkejY5blh6TmZiK0xJMGp1WWgyUEtwaWVP?=
 =?utf-8?B?eWV1VGluVU9hUUExT3BVZ3k4ZUZMT0xGVEJYK3ZpbThLeVlvU05hMFV0RHcv?=
 =?utf-8?B?OHBtZU9iRlliUWRzbk9GZEwzOG0yTWl5ekd4QmJpT2FwSldnSlRRVDQ1bVhS?=
 =?utf-8?B?WkNFUDBkUVNBV0QwYzVqTGhUK0dWd3d6ak5zRWpJa3JSdVBBWXYwS0ZFclE4?=
 =?utf-8?B?YnBZWUhUL0tOZUlvb0R2dnNVZEVIalN2RVlnbjdjNlJLNjJLSVRFRFR1UDFr?=
 =?utf-8?B?REYxUnU1Zld3aTRsSWwyRW5Ebi9RKzFRUVJUeTJET2JVZm1GMnRyVmxjTGsw?=
 =?utf-8?B?cHFjTC9HeUZUYldBcW9VdmZXa3JQS216dTVxdUp4RmR0Vk5ySm1Dc3dKNTJs?=
 =?utf-8?B?NUhYTjA1R3RBVjVZZzFPajJvRTFSeW56a3JtTkJCMnpGUzdaRE5rWXVWZFZB?=
 =?utf-8?B?ZmpzUUxrWHUvMWxWeC94SUpFNHlZSGk3Zjh5cENMdTk4c3pySHBRYUcxSVJB?=
 =?utf-8?B?cGJFMmEwQXhxTGJMSjRLZ1VzTUp5NHU5a1U4WjlLL25xWU54K2duTFRDNWdP?=
 =?utf-8?B?cktMeERRd04xK1BEZlJJNUFibFJIUmhrUVl3SnpTYzJtbDF2bi9UNnYzWkJQ?=
 =?utf-8?B?eW5sREdrQ0FOakhPWlVtaWkyV1ZYM01uQWFhTUErZGV2RUozakRKS2syeTNH?=
 =?utf-8?B?UVFuaVRjVGxwUHpSdGNvcU5aVW5TVEtFSzl3eXV6WldvSXl5YTgyODd0aGRV?=
 =?utf-8?B?Y1J1SjVlNjFvWkhEdS9Ud0Q2ZzRLZnRoSE5mRGZsK09PVEROTUhTZTh3LzhE?=
 =?utf-8?B?aE9Da1VMejlvaUhXTlFIVVo5eW5RcjY1dEdJOHptUXhYQy9tQWJKTDdmNTBK?=
 =?utf-8?B?bHFjQXUwUWlhR1cydDhWYlloZlN0TFB0RDhjNStWQmV4V2RENVBOWkd3aEtE?=
 =?utf-8?B?WWMrR2N3b2ZJQXRVQnR2SmVxQzY4V1o4U2d1YUc5YUVpdlAzeEZTS2FZRXds?=
 =?utf-8?B?SlN4T3pyY1hnT3NkZVkxOWo3S003cGx3cE13My9vQVhUK1dsaUxZSHF1c0RH?=
 =?utf-8?B?RmZXVWZIRFJTZkdhbHppZHNML0k3V1hXd055OHViZXd6b29IMFA4aFVoRVdL?=
 =?utf-8?B?Y09KWUY2alkrOTR5MjB4enBZUi9Xek1UUkR0OEVmSXNNREVVR25PWU5lM3NP?=
 =?utf-8?B?NG9wNEVHME5hZXJ2ZG1MUkpBcGgvWnJqZm01VTFwV2RvN24xYk5Oem5GaStZ?=
 =?utf-8?B?QXo4aWdxRDJwaU56bXRFUm12bVpVa0hZN3JVNVR4ZFdibVZCcXF4blNUazVw?=
 =?utf-8?B?QlhOZ3hFVDVkalZ4Vy9oOWlubnU5SGs5dHdJVDI4UXhoblVROVNrMnZmOEFI?=
 =?utf-8?B?RDUvRmoycFc2M0crVmp1ODhLVG9sM2dlSDNnV04zbWRNTWh3R3RydG1KWHcw?=
 =?utf-8?B?TzF4clV1Q0hTWEJqRE0wcEhCZERXbG1XbFlzWERsMmhlczhFNGswdG94ODE5?=
 =?utf-8?B?YVpmS09iV3VjQ0VqeHRacm1UbGIvVGVOUGNOeEtYM2ovZjZxOHYvMjIrNmpk?=
 =?utf-8?Q?x1LaZY9BFhw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB7140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0JFVGE3WHFneHhlVnBSTFFza0toekcxckNrL0QveHRab3lDbit5QjVSOExr?=
 =?utf-8?B?VXN5aHViSUZvZXY0eFE3bW40dXJlVDFvVjI3SU04d0JCZ3pRMXhlcWRiZkJV?=
 =?utf-8?B?ZGdwYzIrTWF4Rk1PaS9jRHR6RHVvVVRSRmVDVDBUVU1MczVac0Jnbk8rMzFX?=
 =?utf-8?B?Z3dDZW5sWjJzQVBkVzg4VXVKZkhBaWsycVhtcUsyVmxZWE9MQlpqUlR2TGlz?=
 =?utf-8?B?OFNmcnZUM2RzUzNzVGtLNmtNUzBqRkQ5RkVzYk1IT0FqRWxWQW1PZlluVHpY?=
 =?utf-8?B?QmQyVjh3Vmlra28wMGR6MXdzK2VaRzk2elVXak1SZVRoL21lVU9RMXlQd3FH?=
 =?utf-8?B?anRNVlNxd2JvYys5Tkt4RnlhWE1FUC9IcGI2TGhvMnNVcEVJYVhhdFpTLytv?=
 =?utf-8?B?U2hLenlwbmduUkdkUFFMUGt4eDNjZW1pZDF5YVJqY1dNNXVTZWp1MWNKb2U3?=
 =?utf-8?B?eUswT1ZnVTB5K01Md053UW5SQ0RvdGlwdEU5WERWZnVFYzJXTEFRZlJNeFM3?=
 =?utf-8?B?YndWUzRsUWxFdERZNnhLRkFZOXhBUzc3MWdjeVVCUytxLzZ2Ukgva2hQdktS?=
 =?utf-8?B?TVhpMjhHejBHOWU4QTl6UGF6Z3FLb01EY3VKQmJRQTZSMlFKa1d0SEVoM3FI?=
 =?utf-8?B?VVpRSnpSTVdNOWJMQVp0MEc2UVdQazBLNmdJVXpld0JFVjNJMnZaSVp2WVN0?=
 =?utf-8?B?V0JOSGRiWjJWc0xLTGZiaWgzUmoyOVNrNHJFam1zaEhYNDlJVnVsNXBWU2xn?=
 =?utf-8?B?N1lIK1VNM1RlRDY5d2NVN0xadFNuUnMyNzYrNUE5RmV5Ukh2Q1hiR0dLQWJE?=
 =?utf-8?B?RE4zTVVYQldvVHg3ZnpJb2NXVWFOTkVmdWZvQWxNbDBDcFdEa1JOR3JOSWJ3?=
 =?utf-8?B?UnVOUzZtMFpzdWZPNnBlQVMxYlpqVVBkUWJzeEJDNFFFL0RRUEFpUUtuYmlO?=
 =?utf-8?B?a3pVZ1haR2FWMDlkcUp0RGpIb1l4OHNCcU9QOUVuelhKMW5sZmM2QmVEdTla?=
 =?utf-8?B?aG11ZFlMQThVMXBlZVl4ZmxSSm5JNGsxY1Zja2FlclpvM0VCQzFXVDlZZ0ZQ?=
 =?utf-8?B?K1JBWmJwRG16ZW1ZNVU5N2hTOWdtU0IyOUtQd2xocDUzWjVuN1c1MW0yZjh5?=
 =?utf-8?B?QmY3SFowT3hkS3h1Qm1nZTFjc2NqZFRKbTd2MDM2K0o4UVRONy9ZTmU0eXZU?=
 =?utf-8?B?VlJ4WENtZVBkQVpVQllwUWYrU0EzeGE1NFpoZWdtTHV0bFdMWWtXQUN2bEx0?=
 =?utf-8?B?NTNMK3JWTElXWU9JT25aSEV4ZjAxeklGYmE2dW1DVjFpeko5MzdicU5YVlo0?=
 =?utf-8?B?WWg0ZEhPNXc4WXdKSkRDWCt2WXd0MHdJQ2VZUjVqd0RBSkZIT2I0bEhFR3c0?=
 =?utf-8?B?cnlsZGdqdTdnK1lZbHBNeFZLMWdMZFVYWmliUEp5Z1V3QXEwNVR0RFZhN3Ns?=
 =?utf-8?B?UHZ3Zk1SampuUXRROE1PVCttVGpHNXAwcU1qaERRdDR4MlJlZ3BCWXRxWU9v?=
 =?utf-8?B?SlpqMXBnVG1JSlJtQWU3eGpkb0hlMzlqVUdPWS9XS0ovWTk5R0t6LzQzSXJr?=
 =?utf-8?B?R0U0OXYvT21vVVJnRG9Db0MrSmtRVlVYSVhHZGk3QnNtTDh4dWhHYkZONnF2?=
 =?utf-8?B?c3A1YzZUbE5OeURwbXRPcmpxUkxTRXN1V0xQaXNLcm8xVXpXM1ViWFFQa1Vs?=
 =?utf-8?B?ZE95SUhxY1JYb0FRU3Q5d1dTQ0hhT1FBNWlieG1HajJDU05XN2lFTjZiVmto?=
 =?utf-8?B?TWtPaktndUFKOGVDVkFwMmcvajc4WXlmMmtVTXNGVDE5SkhtSnRFUnZzNDNl?=
 =?utf-8?B?NlhBNzdOUVZUaENDSVNWbWI3ZXRvS1ZSTW5IclpvTktWZUZLcjFQanFJc0pB?=
 =?utf-8?B?blAveUFubkZVam1QR3dET21HWkY2bUV6V0xaTG5JZmtKcExLanorWTgzSE85?=
 =?utf-8?B?K1lyd1E1VTBtR1paTmwyNGlRbzZlNXFjM0lKUlBnSTZiYVN6NXZkYnFGM2xh?=
 =?utf-8?B?M1JEblYrdi96TjBqOThlRTFPb2NVNC9rbEJ1WDkrRFROY1dBNURGcFBUcE5O?=
 =?utf-8?B?NlZNRnFYbUwzaGFnbmVUVXhNWGV0T3ExNytMZ3RmVUNxU0E2eWd6ZnpXYUZt?=
 =?utf-8?Q?jYdp4PAcnlKfBQhkEgVnY0i0u?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5250174-dffc-4145-9c51-08ddc419bd0d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 03:34:58.5303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZfPzodoOc7i4zK9aaw1dt0BFBbOEfHf8TU19ENP4oZe2CEFxpELdt+JGS3pvf2H2v/pcflBQmoSLxiLTmkvBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7105
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/7/15 22:28, Jens Axboe 写道: > On 7/14/25 9:10
    PM, Qi Han wrote: >> Jens has already completed the development of uncached
    buffered I/O >> in git [1], and in f2fs, the feature can be enable [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 ARC_SIGNED             Message has a ARC signature
  0.0 ARC_VALID              Message has a valid ARC signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.44.11 listed in wl.mailspike.net]
X-Headers-End: 1ubsvL-0004KG-MU
Subject: Re: [f2fs-dev] [PATCH] f2fs: f2fs supports uncached buffered I/O
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
From: hanqi via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: hanqi <hanqi@vivo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyNS83LzE1IDIyOjI4LCBKZW5zIEF4Ym9lIOWGmemBkzoKPiBPbiA3LzE0LzI1IDk6
MTAgUE0sIFFpIEhhbiB3cm90ZToKPj4gSmVucyBoYXMgYWxyZWFkeSBjb21wbGV0ZWQgdGhlIGRl
dmVsb3BtZW50IG9mIHVuY2FjaGVkIGJ1ZmZlcmVkIEkvTwo+PiBpbiBnaXQgWzFdLCBhbmQgaW4g
ZjJmcywgdGhlIGZlYXR1cmUgY2FuIGJlIGVuYWJsZWQgc2ltcGx5IGJ5IHNldHRpbmcKPj4gdGhl
IEZPUF9ET05UQ0FDSEUgZmxhZyBpbiBmMmZzX2ZpbGVfb3BlcmF0aW9ucy4KPiBZb3UgbmVlZCB0
byBlbnN1cmUgdGhhdCBmb3IgYW55IERPTlRDQUNIRSBJTyB0aGF0IHRoZSBjb21wbGV0aW9uIGlz
Cj4gcm91dGVkIHZpYSBub24taXJxIGNvbnRleHQsIGlmIGFwcGxpY2FibGUuIEkgZGlkbid0IHZl
cmlmeSB0aGF0IHRoaXMgaXMKPiB0aGUgY2FzZSBmb3IgZjJmcy4gR2VuZXJhbGx5IHlvdSBjYW4g
ZGVkdWNlIHRoaXMgYXMgd2VsbCB0aHJvdWdoCj4gdGVzdGluZywgSSdkIHNheSB0aGUgZm9sbG93
aW5nIGNhc2VzIHdvdWxkIGJlIGludGVyZXN0aW5nIHRvIHRlc3Q6Cj4KPiAxKSBOb3JtYWwgRE9O
VENBQ0hFIGJ1ZmZlcmVkIHJlYWQKPiAyKSBPdmVyd3JpdGUgRE9OVENBQ0hFIGJ1ZmZlcmVkIHdy
aXRlCj4gMykgQXBwZW5kIERPTlRDQUNIRSBidWZmZXJlZCB3cml0ZQo+Cj4gVGVzdCB0aG9zZSB3
aXRoIERFQlVHX0FUT01JQ19TTEVFUCBzZXQgaW4geW91ciBjb25maWcsIGFuZCBpdCB0aGF0Cj4g
ZG9lc24ndCBjb21wbGFpbiwgdGhhdCdzIGEgZ3JlYXQgc3RhcnQuCj4KPiBGb3IgdGhlIGFib3Zl
IHRlc3QgY2FzZXMgYXMgd2VsbCwgdmVyaWZ5IHRoYXQgcGFnZSBjYWNoZSBkb2Vzbid0IGdyb3cg
YXMKPiBJTyBpcyBwZXJmb3JtZWQuIEEgYml0IGlzIGZpbmUgZm9yIHRoaW5ncyBsaWtlIG1ldGEg
ZGF0YSwgYnV0IGdlbmVyYWxseQo+IHlvdSB3YW50IHRvIHNlZSBpdCByZW1haW4gYmFzaWNhbGx5
IGZsYXQgaW4gdGVybXMgb2YgcGFnZSBjYWNoZSB1c2FnZS4KPgo+IE1heWJlIHRoaXMgaXMgYWxs
IGZpbmUsIGxpa2UgSSBzYWlkIEkgZGlkbid0IHZlcmlmeS4gSnVzdCBtZW50aW9uaW5nIGl0Cj4g
Zm9yIGNvbXBsZXRlbmVzcyBzYWtlLgoKSGksIEplbnMKVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rp
b24uIEFzIEkgbWVudGlvbmVkIGVhcmxpZXIgaW4gWzFdLCBpbiBmMmZzLAp0aGUgcmVndWxhciBi
dWZmZXJlZCB3cml0ZSBwYXRoIGludm9rZXMgZm9saW9fZW5kX3dyaXRlYmFjayBmcm9tIGEKc29m
dGlycSBjb250ZXh0LiBUaGVyZWZvcmUsIGl0IHNlZW1zIHRoYXQgZjJmcyBtYXkgbm90IGJlIHN1
aXRhYmxlCmZvciBET05UQ0FDSEUgSS9PIHdyaXRlcy4KCknigJlkIGxpa2UgdG8gYXNrIGEgcXVl
c3Rpb246IHdoeSBpcyBET05UQ0FDSEUgSS9PIHdyaXRlIHJlc3RyaWN0ZWQgdG8Kbm9uLWludGVy
cnVwdCBjb250ZXh0IG9ubHk/IElzIGl0IGJlY2F1c2UgZHJvcHBpbmcgdGhlIHBhZ2UgbWlnaHQg
YmUKdG9vIHRpbWUtY29uc3VtaW5nIHRvIGJlIGRvbmUgc2FmZWx5IGluIGludGVycnVwdCBjb250
ZXh0PyBUaGlzIG1pZ2h0CmJlIGEgbmFpdmUgcXVlc3Rpb24sIGJ1dCBJ4oCZZCByZWFsbHkgYXBw
cmVjaWF0ZSB5b3VyIGNsYXJpZmljYXRpb24uClRoYW5rcyBpbiBhZHZhbmNlLgoKWzFdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8xMzdjMGEwNy1lYTBhLTQ4ZmEtYWNjNC0zZTBlYzYzNjgx
ZjRAdml2by5jb20vCgo+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
