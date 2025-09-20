Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE65B8BDB0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Sep 2025 04:49:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUl/u21K7RgeGOllqXP6juyG/andqdjbyK2dLtXxVUM=; b=YyF8ImbjyZn0cHm0DzswPPV0vD
	S2LbBTmX5LOLnFcB000sw9104KKgCeqqRKw8nfMHEIzAtPqu/IIutMXcexl6l7V8TvoZXwAWBpR2T
	Wumb4nPmQOwaCbpz/PUFs2Q8saIAIhjncetvBVxVGi2jVlQHzhMn3E6XdsfUhs+CUnbA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uznfQ-0001HG-EE;
	Sat, 20 Sep 2025 02:49:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1uznfO-0001H7-GO
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Sep 2025 02:49:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:To:Subject:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B7MhZtiElejpcaEAUpqGFT8IprbrYhixPfH6+qD3ZT8=; b=MtEf8J2bB+Im5KKi0x8mKiXjxN
 BrMImzZI+NkYqsavM1fwKl5+j3SgcNFMfoX2WRhk8bwMeUtvzF+mc6MFxIqkJKalN/1s/7wAj0Ey4
 RmhEIAvfvRt3UdNDk7jSIuC6Nom+/iJW/60rrLnIHKhGNdXrnugSX7TSJVuyyzrlGFss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B7MhZtiElejpcaEAUpqGFT8IprbrYhixPfH6+qD3ZT8=; b=N+ZVYLxWQRIAa1LU2+Srhgvp1G
 z/G0hUIPimGKXPgoRuoswtAryz5vr9l1ryHttFYCuC5a+kdJriL3LhIZxHAtSXW9jMVxcOndJNNMx
 RKFLUxD87e1rUPi0XBSgYTkgjTZ/TLgbBYhZEKWGdyRZ5tFhQHvVCi7uMyIrA0CR+RfU=;
Received: from mail-japanwestazon11012059.outbound.protection.outlook.com
 ([40.107.75.59] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uznfN-0003TP-Lz for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Sep 2025 02:49:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKBNgQuD3gU6DgDsYr84F0vpJ3cAR9nXU3lXd3YOwIvzPAR9xN243wUUZfo8EPo/cc3mSkP70VcMT/tRfMfzOgxRtIHbX8Y8vN7d0S0uwBwOsr9yzVmbUJX4YFF9yAvPmk5p40HIGq+t0J56wYgANeAqAx9sAWHbCCDxdyDTYAqeinHZxTLYHqflBHgt9654JMLfDJFZCHqcl70VRmXgrNoUZA1LXRfLH5gdG1ruxkk8xqey/xVs2hCpiiCg6EvT9lgJvmg4zuRzExcAoWPbixrOGlN1lHAod4qwyPp1E40b/+utwoDwB+bHklNKJwtjnn5C/jH2Q14yhj28sW04Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7MhZtiElejpcaEAUpqGFT8IprbrYhixPfH6+qD3ZT8=;
 b=fNLDCixRLBYHxN2WuJm4FSl20hl9LLVyj7mx0q2cjD95QcdByTMptPRTiPe0YJJyMYhlUTfqjZuFWK7sPxCmwAsQtjO0r2TNKeiWzgc4bGaLVXsQYa4IVKCYx8SjaRXpu2frmmJxA0PuRFwWaRvL0Ros7DXTPjX25Uvwei4pSVe5XE9WYQC8XsZaJvVROLg5COcQcrC70qTA/l6ci6pEisvnMsAu7AEg8N+4B3zUEahsmNA3yl65GulB0Wy6c3i4Lp7wTA77JtFngK7EuRMyEAE1s/XnW5gVbQ8N7IbIrp1P9xQ9V/kigSGVe0tvMOxU6v3MsnanzH1WaF5JbODZng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7MhZtiElejpcaEAUpqGFT8IprbrYhixPfH6+qD3ZT8=;
 b=SmF9B3eD5QpvtbenufK3XR9pmMWFfCHmdgy5eVfz6kccOFwxf2M0UcKjzllbi3aJw37TxWUi6wtGQKPJemdvvk+4qvKmsPQHHGEafR052UvthfEr9QUNERsfGCMVu+1iQi0M8GQGEaeX77Yxfv+bUb6qIIX9DiLgVwT/6vtr0Xhjq0PEupHwQEYGrSFrFHZFFAF+moTLhWzM8IZUJPRt/d1Xiil97/YhRg2uEXLnG9/QtLmYgrF1sUqrwzrWh059ZDwbBG1tBfP95LLkRu90E9uo+vYORumQ43MWJDNKT6392zvvKH5VmrAKeb/dk6B3Id3Io1wqXUiEj5gwlaVGRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SE1PPFF06F8354E.apcprd06.prod.outlook.com (2603:1096:108:1::42e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 20 Sep
 2025 02:49:24 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.9137.015; Sat, 20 Sep 2025
 02:49:24 +0000
Message-ID: <c2c7fbdb-f71c-46aa-a47d-8bd4bec688d4@vivo.com>
Date: Sat, 20 Sep 2025 10:49:20 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 open list <linux-kernel@vger.kernel.org>
References: <20250909134418.502922-1-liaoyuanhong@vivo.com>
 <20250909134418.502922-3-liaoyuanhong@vivo.com>
 <b42b161d-cd5d-45dc-8e84-c2b28eb632e5@kernel.org>
 <a508b9b8-3c81-4a2c-a525-baac822563b3@vivo.com>
 <22d9f9d1-1db0-4bad-a782-212ab3da630e@kernel.org>
 <3cd3bfb5-857f-4b61-a1c1-55805bed4609@vivo.com>
 <b7b20efb-8cdc-4cf0-a057-d4d41ae66aba@kernel.org>
Content-Language: en-US
In-Reply-To: <b7b20efb-8cdc-4cf0-a057-d4d41ae66aba@kernel.org>
X-ClientProxiedBy: SG2PR01CA0132.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::36) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SE1PPFF06F8354E:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e88c36-0c5d-49b5-6e74-08ddf7f04e99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkVISERuSmpMdDdoZElVUzJCUEtZak03UGRrTCs0YUNaY1BQZTVPNmduRytG?=
 =?utf-8?B?RU1yd0tsOGM0aDZtTk5BdVNXb01za3BzZENRaXQxd0tpNXA2elFLcTFJMjl5?=
 =?utf-8?B?TFpyVTVrbzRCWWRGT3FMZW1pc0JFcWJDVHV4eHRVbGJZcnM1WmRaQUMyamR3?=
 =?utf-8?B?eFNNK2RBMEJUdXVDZXhMdm9Sd25ZY1k3ekN0cW50eEdyMFUvRm1aTkZtTnVt?=
 =?utf-8?B?YVE5VWFkcWt2YjczOVkvOVVmRGNrSmQ5a09KQWhSajZQbDJuYkZhY0tJQmlQ?=
 =?utf-8?B?blVRWDU2Sk1xV2VuMWJlYytlc3dOVzhUWHp0M0I5Y0pwRkk5UkV6SE95YkI2?=
 =?utf-8?B?MHl1bDVSeHY5M1lMekl4RUhMYnlwYldYQ29heExCd2d2NEQ0cFZMVUVTaFox?=
 =?utf-8?B?NWdZUVZYNytLMUxRMXhrTzdmZS96LzE0Y0J6Qnp6eXZXUkk2cFNIdE05TzJ4?=
 =?utf-8?B?U1ZYOEQ4SVozcWg2OFYwNFVJWDQrTjh6Qy9md3VIWDRpSXFYOWRPTjFHN05p?=
 =?utf-8?B?SmVHemZZaDJFOTJIMWw4UjJOSUwySWNseHlTc2FYc1I1aXVDMU53cjUyZW91?=
 =?utf-8?B?TlprMk5qNzNDR1l1Q2lESjkxemRFT1NseE1YZ2pQbWY5MzRKc0Q1VTNUK3dh?=
 =?utf-8?B?cGF4YUJPbGd2RmpTM29CcnVXYXhBa1VLSEhNRXN2Mnh3b2krRFpXQzQrU0RB?=
 =?utf-8?B?Uk4rVFp0UWNVN24wN1ZuMU1pd0cwSFBBdDcvbmN0ODVzZmxDbEp1NVp6bm81?=
 =?utf-8?B?azFsT2JqSVFvT1g2VFVYUVNFOUFsZDJwWE1KUUdUdlZFSzNidUVRNmNSZFhD?=
 =?utf-8?B?U1Z4MzFZQ2hmc0F2WDREQUEwOVpCRmVXYjdBVEVIMjV0UTRDODgva1RTWm03?=
 =?utf-8?B?c0o2TzNwN01ES3JSYm5QM0pmemRlSXpjaWZPczJmRmtWQ2FlWWtBOS9mdEVm?=
 =?utf-8?B?QThmQjZIY2E5T2JlS2hJdEZMTDVqekdQejBaUVZUYlh3bm5oOEk1RHNmb0Nm?=
 =?utf-8?B?WUxTbTFJYzhiSnFUejM1Q0NTcU1GUlBwS1ozaEJuSTlCUldQUlVZL2dtcTRZ?=
 =?utf-8?B?SlVaUzhjWGJnTnovMlhmQTVTUVM5bWh5QUJNZHd2R01XSUptcWtVRFZVUzNt?=
 =?utf-8?B?RDUxTGFLYnh6Y3dNOFI2TlNDODdsSVJRUXR6anE0MTgyZFdVaTB4cXNhWWIv?=
 =?utf-8?B?SGFVMlArNGdIQTA4SzNjelN6TSsxbS9oMW8xMmNJSjA3OUZtNFBScVFwV2pa?=
 =?utf-8?B?VDBjNVZ3c3g5V2s3MzhWWkVHbzZrTGVROVhXUnJ2dS9pdzFWemNuSGdCZEhJ?=
 =?utf-8?B?cVpSUmljVXhKc0hWSFczN3ZyY2VZc1U2bko5WFo2K0NIcEc2QWFSMUl0eURX?=
 =?utf-8?B?QzFITllpK3psVk5Idk5IT3gwWERoVVJIeFJ0dFN6M3NIODlJS0tRaW9VOXVm?=
 =?utf-8?B?Yjhob1NOWHZ5Z3p5eXVzZVR2UlI5a29mOGx1TnpkOWd5ZER5T1FBY3o5dkl5?=
 =?utf-8?B?V1NETEovZE9rZXpHNUpqdkh6SjlZSTQ5dzV0cHd3bWcrUG5TcmRjcXZ3TklJ?=
 =?utf-8?B?Wi9JeTJNTU83Y0FLSnY1OEdmQWpON3Y4WWNhdUVsdFRuR2JLSnlEaUVjWk1k?=
 =?utf-8?B?RGxNVkhWWE1BQitxK1U4Tm1McEhoWlY0RlBLQld5cVRXLytMSmVOb0o4cVVR?=
 =?utf-8?B?dW9aM2FFNFh4UjFVaFVXMXVSeFVXNWIrUVpNeUF2bkh1L0pLRE9KaXNKbHZq?=
 =?utf-8?B?cnI2dUlJTnBBQjdIdVFCSmxIdTZRQ3g2MmJycnVtMkcrQWg4RHUyWkdlWjcw?=
 =?utf-8?B?WHRPU1JlOEkyc2Zmd211VFgySzIwVlNkaG9odHE5QzRaRUZmTCtVVjRUUDBx?=
 =?utf-8?B?TkorRThuOGxwWEpqKzZkYlo3TStEY2ZsVGMrWXhpalpuZXRWYW1FV3p5SzdE?=
 =?utf-8?Q?1Hq3UEj3Ikg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3V5Tk54aTlrdmhhak5iU2RnQXFXZEp1N3NxTzRQQnNuVkZFcnR0RS9LSTVu?=
 =?utf-8?B?bGU0b3BjQVpROVg1czhhZGcySGViUGdDSUFhSjg1c0xzUEVNY0IvbWgzcmxr?=
 =?utf-8?B?UnNORDhRMHFLVUZWbnNoVUdaVktHeXQxT0JsVElsSTBjZ25EYnp4anZKdC9a?=
 =?utf-8?B?YnVYR3o1bW5aY3BXRjljNEFZNjNXUTZYUENlQ2Rsc01VMVRPSEZ3RWlGRXB0?=
 =?utf-8?B?WmxySU05cytmQko3eG5BTGVrcmJIV2dmR0MrS09nbXZ2ZTF4cmhtK055Yk5t?=
 =?utf-8?B?VXg4Qk5iZFQxZ0ZVRHVPTTB4Mmo5eDdZMHRsU2kwK1J0ajFKeTB1c3NaSE9Q?=
 =?utf-8?B?amdIV0lpdFVlc2xjdlR4NW5DNTFBelBhWWhlRDR5Z094RXUwWmErMmhHem1F?=
 =?utf-8?B?c1ZDWDFKNUx0am95ajB1czB3b2dFQzhLaFRwYzl6MFNaZkpxNGpLWGFTeXJS?=
 =?utf-8?B?UDlGRnhFNGhaallnYTd1cG5iaGZQcVQ5dHZxWEJxeXdaZC9HWm02RncwU0dx?=
 =?utf-8?B?NkJ1YU1lNHVzT0VzL1V6TlFGMUNqY2V5bEh1YkRtVmkwRUkrdys5cTBVbS85?=
 =?utf-8?B?WEpJTk82R0d5SFl6TzlVNTJDYkgyM3ZJcmVVM1Y2K281ZUNEblZma1o0RVU0?=
 =?utf-8?B?cGd6eXRFODRlWktSdzFMSWxMRmM1dUs4YWdwZ1d1OC9kVGFPUnVCTjM0VVZL?=
 =?utf-8?B?c255VVN2b25YZVRseG5LdlFCd3krZUl6dEc0dHhjVUFkelN4OHhWeVBNMlJo?=
 =?utf-8?B?d0JmYnJXUkpBeFRyZWJOUHRSNlRpa3NkMk9HRkpCR2NrcG91TmxlYkE4NjFh?=
 =?utf-8?B?dFFLM0NONVdjaDhMR2poZHJqdmxiaWVsRTZxTU9pdGtTYW1rOW82SXdha0c5?=
 =?utf-8?B?bVpuNGp4UHk3M2RMcFBhZnhDQ28xa1pqcUNjQ3BFZmhiaEdQZ0crMnFjbDg0?=
 =?utf-8?B?OUNiclJ5azJVYW1LMEtUN3ZhWlkvL0o3RVFBWTlxbHY3MUZvY1lFSVlraDBH?=
 =?utf-8?B?SmtncUtSNW9UZnpKckVTMHVkYnkrUHVpY1NLUjZOeTQwck5MdzZOR0I1VHVJ?=
 =?utf-8?B?VnQzdk94SE1Ub3lhM1I4eEoyaU9CQ1RoV3JmN0lGZURUK0puWTA4bUY1Q010?=
 =?utf-8?B?K3gvMkRsN0xUTFV0NUV5QnhDTGNSU2FiYnEwMVNxK1hHSlh1NVdzM29pdUdr?=
 =?utf-8?B?c0hlMDN0bWJqOGtuS3R2c3J3b0ZFMVY1WTMxV0paSHBFMVJ6S290dlJ1SXk0?=
 =?utf-8?B?WnN5b0JLSDZaaU11OUJONkROeXpXNVhVVVF3emU2diswZVp0R1hTRW5LTlN6?=
 =?utf-8?B?NHhZRlpFcCtoc0JmS3ZOZ2VkQ2g0TUEyZEpwd0ZCMWdZMnI5Vk5jM01jVW9u?=
 =?utf-8?B?Sk9neW0yWTl5a1FPa3FXaUU0VkhZNFhtUFluQ2pQY0JTMU53MFFXdGpCTWI4?=
 =?utf-8?B?NVk3ak14NTRGeDA0N256TFJ5ZkFhUkNIZXppVGlBTSsvb0Z4NUlCRHBiT0cz?=
 =?utf-8?B?QzRPTVlpTUVSYVptaW1lUjlRczZIOGZpTXhVeEFsblJRZE5ycDVDaUVjam9U?=
 =?utf-8?B?cjhtbVl2a0R4TmdJZHhKMWRNU0J2RzMyYWc5QzdhdFBTaHJwSkQrcWpwZmZ4?=
 =?utf-8?B?TFFoRi9BRTQwQlMveC9rWnFNQVM2YlM3eE5FMFU1bkJpbFF3a1h3WG9ORHFk?=
 =?utf-8?B?WWRvcjZLVXlpdlhENXkyam9DSmNwd2s2YVhhYU5PQWhYeEJaN0RGNDZ4eU5G?=
 =?utf-8?B?bE5SNlREajdYNFNnTThyeWNOcDcwU2hnSkxMaDdLQkxrdmM2OTk0NElQZWJt?=
 =?utf-8?B?KzlrSzVBeDFaU2FaQ2xZM0VwKzFGOVpqT0Y5b0EyS0d0ZGV3a0ExamtPdUsy?=
 =?utf-8?B?NVRBQnNTOHRpRjM2czNrcFVJbGprUkt1enkzRXp3V1ozU281ci9yM3ZBVkVT?=
 =?utf-8?B?cngxUXVEMHZjSC92d21CL0NTY0kxVkFIZnVmdFlPTm9FR3lPdUdVbVRFaVBN?=
 =?utf-8?B?Z2FjbTRWeXFQWFpJdnFQaFdGSHViWWMxa2xxODVYOWZicC9NSnpxYTlIN3lY?=
 =?utf-8?B?WTZXeGVxeC81YmVBYVA4OTNHSmxMMUE1WnBOQVd1VzRrS3dCSGZqSktmU2xt?=
 =?utf-8?Q?j1uH6VTeRVrh2eP+DNOF5gye3?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e88c36-0c5d-49b5-6e74-08ddf7f04e99
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 02:49:24.3770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tB+x9z7ylkb9wOPFMEn6dxENvX8KA7HJs2MdrabyTN58jK8LAIS293vzypq15aceTS4aELE2Jq7J8u4/M1/NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFF06F8354E
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/18/2025 10:16 AM, Chao Yu wrote: > On 9/17/25 16:13,
 Liao Yuanhong wrote: >> On 9/17/2025 3:57 PM, Chao Yu wrote: >>> On 9/17/25
 15:08, Liao Yuanhong wrote: >>>> On 9/15/2025 4:36 PM, Chao Yu wr [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.75.59 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
X-Headers-End: 1uznfN-0003TP-Lz
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: Enhance the subsequent logic of
 valid_thresh_ratio to prevent unnecessary background GC
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
From: Liao Yuanhong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Liao Yuanhong <liaoyuanhong@vivo.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDkvMTgvMjAyNSAxMDoxNiBBTSwgQ2hhbyBZdSB3cm90ZToKPiBPbiA5LzE3LzI1IDE2OjEz
LCBMaWFvIFl1YW5ob25nIHdyb3RlOgo+PiBPbiA5LzE3LzIwMjUgMzo1NyBQTSwgQ2hhbyBZdSB3
cm90ZToKPj4+IE9uIDkvMTcvMjUgMTU6MDgsIExpYW8gWXVhbmhvbmcgd3JvdGU6Cj4+Pj4gT24g
OS8xNS8yMDI1IDQ6MzYgUE0sIENoYW8gWXUgd3JvdGU6Cj4+Pj4+IE9uIDkvOS8yNSAyMTo0NCwg
TGlhbyBZdWFuaG9uZyB3cm90ZToKPj4+Pj4+IFdoZW4gdGhlIHByb3BvcnRpb24gb2YgZGlydHkg
c2VnbWVudHMgd2l0aGluIGEgc2VjdGlvbiBleGNlZWRzIHRoZQo+Pj4+Pj4gdmFsaWRfdGhyZXNo
X3JhdGlvLCB0aGUgZ2NfY29zdCBvZiB0aGF0IHNlY3Rpb24gaXMgc2V0IHRvIFVJTlRfTUFYLAo+
Pj4+Pj4gaW5kaWNhdGluZyB0aGF0IHRoZXNlIHNlY3Rpb25zIHNob3VsZCBub3QgYmUgcmVsZWFz
ZWQuIEhvd2V2ZXIsIGlmIGFsbAo+Pj4+Pj4gc2VjdGlvbiBjb3N0cyB3aXRoaW4gdGhlIHNjYW5u
aW5nIHJhbmdlIG9mIGdldF92aWN0aW0oKSBhcmUgVUlOVF9NQVgsCj4+Pj4+PiBiYWNrZ3JvdW5k
IEdDIHdpbGwgc3RpbGwgb2NjdXIuIEFkZCBhIGNvbmRpdGlvbiB0byBwcmV2ZW50IHRoaXMgc2l0
dWF0aW9uLgo+Pj4+PiBGb3IgdGhpcyBjYXNlLCBmMmZzX2dldF92aWN0aW0oKSB3aWxsIHJldHVy
biAwLCBhbmQgZjJmc19nYygpIHdpbGwgdXNlIHVuY2hhbmdlZAo+Pj4+PiBzZWdubyBmb3IgR0M/
Cj4+Pj4+Cj4+Pj4+IFRoYW5rcywKPj4+PiBZb3UncmUgcmlnaHQsIHNlZ25vIHdvbid0IHVwZGF0
ZSBpbiB0aGlzIHNjZW5hcmlvLCBhbmQgdGhpcyBwYXRjaCBmZWF0dXJlIGlzIHJlZHVuZGFudC4K
Pj4+IE9oLCBJIG1lYW50LCBpZiBmMmZzX2dldF92aWN0aW0oKSBmYWlscyB0byBzZWxlY3QgYSB2
YWxpZCB2aWN0aW0gZHVlIHRvIHRoZSByZWFzb24geW91Cj4+PiBkZXNjcmliZWQsIGYyZnNfZ2V0
X3ZpY3RpbSgpIHdpbGwgcmV0dXJuIDAsIGFuZCBmMmZzX2djKCkgd2lsbCBtaWdyYXRlIHNlZ21l
bnQgI05VTExfU0VHTk8/Cj4+PiBPciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPwo+Pj4KPj4+IFRo
YW5rcywKPj4gWWVzLiBJbiB0aGlzIHNjZW5hcmlvLCBzaW5jZSBpdCB3b24ndCBlbnRlciB0aGV8
cC5taW5fY29zdCA+IGNvc3R8Y29uZGl0aW9uLHxwLm1pbl9zZWdub3x3aWxsIHJldGFpbiBpdHMg
aW5pdGlhbCB2YWx1ZXx8fE5VTExfU0VHTk98LiBUaGlzIGlzIGNvbnNpc3RlbnQgd2l0aCB3aGF0
IHlvdSBkZXNjcmliZWQuCj4gRG8geW91IGhhdmUgYSBzY3JpcHQgdG8gcmVwcm9kdWNlIHRoaXMg
YnVnPwo+Cj4gVGhhbmtzLAoKSSBkaWRuJ3QgZXhwbGFpbiBpdCBjbGVhcmx5LiBXaGF0IEkgbWVh
biBpcyB0aGF0IHRoaXMgcGF0Y2ggaXMgCnJlZHVuZGFudCwgdGhlIG9yaWdpbmFsIGNvZGUgaXMg
ZmluZS4KCgpUaGFua3MsCgpMaWFvCgo+Pgo+PiBUaGFua3MsCj4+Cj4+IExpYW8KPj4KPj4+PiBU
aGFua3MsCj4+Pj4KPj4+PiBMaWFvCj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IExpYW8gWXVh
bmhvbmcgPGxpYW95dWFuaG9uZ0B2aXZvLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gIMKgwqAgZnMv
ZjJmcy9nYy5jIHwgNSArKysrKwo+Pj4+Pj4gIMKgwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2djLmMgYi9mcy9mMmZz
L2djLmMKPj4+Pj4+IGluZGV4IDRhOGMwOGY5NzBlMy4uZmZjMzE4ODQxNmY0IDEwMDY0NAo+Pj4+
Pj4gLS0tIGEvZnMvZjJmcy9nYy5jCj4+Pj4+PiArKysgYi9mcy9mMmZzL2djLmMKPj4+Pj4+IEBA
IC05MzYsNiArOTM2LDExIEBAIGludCBmMmZzX2dldF92aWN0aW0oc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLCB1bnNpZ25lZCBpbnQgKnJlc3VsdCwKPj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB9Cj4+Pj4+PiAgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+ICDCoMKgICvCoMKgwqAgaWYgKGYyZnNf
c2JfaGFzX2Jsa3pvbmVkKHNiaSkgJiYgcC5taW5fY29zdCA9PSBVSU5UX01BWCkgewo+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIHJldCA9IC1FTk9EQVRBOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGdv
dG8gb3V0Owo+Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+PiArCj4+Pj4+PiAgwqDCoMKgwqDCoMKgIC8q
IGdldCB2aWN0aW0gZm9yIEdDX0FUL0FUX1NTUiAqLwo+Pj4+Pj4gIMKgwqDCoMKgwqDCoCBpZiAo
aXNfYXRnYykgewo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvb2t1cF92aWN0aW1fYnlf
YWdlKHNiaSwgJnApOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
