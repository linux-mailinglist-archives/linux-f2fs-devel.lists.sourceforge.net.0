Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A53FBB7E8E2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Sep 2025 14:53:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQom2V4K7kQi4BY65xYS7HEwEG8/ZSDLaXFRiVNun5k=; b=OBMKwFSjQX3dkDOwy/ojUn6Mhi
	mIHlWXT5vGatMcxya7cIM9SWmY8/n5VxVx5MPcqpWrbSzS2VjehrxwBDGzeugIfw9pL25eDYy4zIr
	8P0WPC2tcQlikfnqITibj93mWUer+PSwxLjVlFdgu7KcZYbF81t2h0cr4EPcdp6w/E5E=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uymHY-00005G-Lh;
	Wed, 17 Sep 2025 07:08:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1uymHW-000058-Vi
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Sep 2025 07:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:To:Subject:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hqtN/cjdCwOPZr9iqFtmQ5gjMOJVRHNgIwitLGFnnuQ=; b=HXp6bX8ohCnvilHiHcQNqkXzaO
 7NhNUZgPRZHk/k10IobUCkhHV9PJx+3PtrUBPueoK/eqPWhYwDtCKzlYCxqfzOk5yEoyG2ucsPRnT
 3lWjLxCT4Kr0wWqNUQeUJ1cN7Sh2GrKiCkLs62Ue2VidIS9wPIber2FyuaSv67/F+wug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hqtN/cjdCwOPZr9iqFtmQ5gjMOJVRHNgIwitLGFnnuQ=; b=Pm9rkvRMv+p2Y/WRdEbbEekPlc
 FVA0+Spp2EgJXsZaA8ol3YkjZi3fRW9fP+OtV7rxDqY+RYVX7xFP6lFB5RalnWKg9PrIdMpe9MTnt
 l0Y80d15pnnVE8ZvTfDhJp5hfTL3t0BYM+mtXuc8XWdWNEGWgY8ghy7/C1JQeVDtbd2Q=;
Received: from mail-japaneastazon11012040.outbound.protection.outlook.com
 ([52.101.126.40] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uymHW-0006Bn-DE for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Sep 2025 07:08:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKpZCmK+Oe2IgWNVwSD/iXhhDpD1rq/seDMW102jN2MYRPPtsXh7QYGxNhcWFAfrgC2CkyLmKE6M7Ccj95Hptm6RnHKlvKcr7Iqrkf0NfOD4TFQYx2kfhCu/n21bkIufMEkUaIWtagF+SwVJf9mxglhMXfJdf8JNHLyiqJeyBXdWlrdy2r3JLQXthds5WA+4tfLEavNdMpblXbUZJTlpWfbOvzPyNHYOnwdHWg1mRwE+cgmyMDykYNhcIJYu746GewweaxM34R/JPuUPFJyzYbuAR+oYgoIdGejIcCHo2TN9dXmJImGISYxMfPKiq94R/YYG5A7QAtoGV25HXMPfbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqtN/cjdCwOPZr9iqFtmQ5gjMOJVRHNgIwitLGFnnuQ=;
 b=tUsOxCnFBF4gGcwFZIjxroIQUBlN0BdpLkLFXxDcynguiaPtNIwTDVidtiEqQKPB4JxICSF4xaMwmYnEynto/Aj0p2Nj8Tmm8QkACrMdTSdxM+Qnawb3QbLKekp1rR5iBMvVT1kGaLpxFOXaKv/jniusvc7+qoAfZARqif/cmzhaRrct1XIzVMUEdVNcRIk0ZmlIltUock5SyIY1cfbUh3tgWIO8rbPqfkx38XI76OyhB0Eq+8/O6Cg6uEDMJcdUGwLkY+YP6wLoHGRCEXpiXuTXb8jyuvoSbJnyUKOqxDvboy/L5CWIscahAfEsvdEiOhmsGQwafwygL5IUucxprA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqtN/cjdCwOPZr9iqFtmQ5gjMOJVRHNgIwitLGFnnuQ=;
 b=TWd17EhAcFCvXa1PzYGbfOlpi7l50LagdgHzOQGarNlnBe5HSmW8kHxXzWOPqv/dFbwu+lP1wBpecZSzcFb0Q0NB/Go8eN4lcikf6cXIaWmIFc/VTw0g67CArlvjjNc5kXwfmQOAYsLb/kddfVpSjYLaAGNlCaOeRkmcs3dN8S7acaTKvCh+2innw5+3vWqqtyTLknzhGqGMUjsBjh9yexLAej6Y8eol8ZC05hl8rnIssqbUhWPLTrLFoOFNNEJrl/KN8xjvcb6lhN0x/GU8nvNwGjszEZBaqbiYqLcySVfvfxuid7+15xkw5TWI0i5tQyaPaYAeUF1qrJZe0aJzjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYSPR06MB6693.apcprd06.prod.outlook.com (2603:1096:400:478::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 07:08:37 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 07:08:36 +0000
Message-ID: <a508b9b8-3c81-4a2c-a525-baac822563b3@vivo.com>
Date: Wed, 17 Sep 2025 15:08:32 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 open list <linux-kernel@vger.kernel.org>
References: <20250909134418.502922-1-liaoyuanhong@vivo.com>
 <20250909134418.502922-3-liaoyuanhong@vivo.com>
 <b42b161d-cd5d-45dc-8e84-c2b28eb632e5@kernel.org>
Content-Language: en-US
In-Reply-To: <b42b161d-cd5d-45dc-8e84-c2b28eb632e5@kernel.org>
X-ClientProxiedBy: SG2P153CA0002.APCP153.PROD.OUTLOOK.COM (2603:1096::12) To
 SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYSPR06MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5920d3-280e-48e2-a48a-08ddf5b9053a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXVIeTBmbEtTZFoxOVlyUk1EbXU1V0tIWVA5YW44VEs3UGlOSDAzSTdieE5X?=
 =?utf-8?B?QkFjZ0g1cHF2OGlaejA0K1VQSXdDWTROZHVEYStNZjE0RHpZT3NMalcyTDV6?=
 =?utf-8?B?bEhpSEFrcGJ6cmdCVXEwY0tXM0syNmIyVUd5S05QUk9zMVNyTk1ZUFVJOENz?=
 =?utf-8?B?SEVmTkZzMDZwZldvK0J2MTRZK0I2RWxGN2N4VDE3VnFEdEZqUFpjRWpXaHcr?=
 =?utf-8?B?UFEzNFEvL2tNVVZDRnN4bVZkRC9KUWZJN1hOc3lYNW1CUVNNa3RkTU5PZjlI?=
 =?utf-8?B?Z0pYQXNjMEZWMXkvMzJJd3JFNUhJQXZtdFJnVmxoSUhIbEJsWTBPbmFzMkxm?=
 =?utf-8?B?VWtjWDV3T0tzWmxkZ0J1VjhOaDNMbC9ZaWlpd0E3bG94a1BaVFkvejVjam4w?=
 =?utf-8?B?TTM3b1cyemswaUFyNHR4WDZKelNRUjloM3ZnY0ExQ0c5QlI1VmRZelh5UU50?=
 =?utf-8?B?QStGRHdvZTFNOWxRTEN1YVdEckNvZmE4YytVV3M2MmV3cWdNUXBZeGZOZ2U3?=
 =?utf-8?B?VkZpRHlITnBTNFRHYytVMitNMzNKVU8vVzVKOGxuY3g5b0czQTY1OFZhbjRL?=
 =?utf-8?B?M3U5bVR5NzErR3prMnpuelpjZlFNSTVIeEhBd2JNN2h6TDI0Y2lzSEEzNXhp?=
 =?utf-8?B?Z296aWZUb21OY1UyRXJFaTM4TU1IMUx2am5JdFFqT2NtQXBPMFNLWjB5NUJr?=
 =?utf-8?B?VC8wS0JxeWoxZG5FLzVJTHljRUttSUN2dENmVkFkSzBGSWs1NmJlczRBUC92?=
 =?utf-8?B?UW1obDg1dHN1QXg3QVB0ZjlpWGlFMG83d1VORnN3bXMrN21ZVXArcHlnblFF?=
 =?utf-8?B?UHlCQUxJZStobHpxKzA0U2FldnJEeTgvYmtZT1MzdmRJMm9MNzA1MnVQeUxR?=
 =?utf-8?B?NjZrU3lDL2s3czJNd0FMSlN1T1QxMUVlMXRlQ2tPY3lWZTdnQ25NRVJueXc0?=
 =?utf-8?B?RFVYV21yOFY0TmRST2pRR2Eydit3OXY3RG1VeXNKL1RMbm9YUEZpZWZjM0dZ?=
 =?utf-8?B?RU4zbzlkQ2tNbE41V0JPcGNkOThxbWxlR1NOdjZ6WU9ucW9RNWcvVDVQQTFn?=
 =?utf-8?B?ODRVZWdFZkRVZU9waVMxYzJib2IzRlRSZjBoL3lzSUZ6aWYwWWdxN3F4U2x1?=
 =?utf-8?B?bXZOK1hRMXh5UklJY25IaUNaeEVJTVZKZEFDZ0R4UGs3SFhzb0J4Z0dKK2xH?=
 =?utf-8?B?eXJ3QU5LZThkSW9EWmFBOHV5OUVwc2UxMCsweStyR3hDWDFEcXk5K1Zia2du?=
 =?utf-8?B?bGpBalhnelBJVFZPNGtkelBzK1lkdHpzVTMrSTh0NzBQbzg2dmlGWTdYVzZv?=
 =?utf-8?B?YXBCOG5uUndHVkszMFBRbDVPTVZFNlRURjdnTDV2N3kxNzlTcjNNRnMyRlpL?=
 =?utf-8?B?NEd5OXV2d2VJQnAxY2lLT1o3QmtkcjdVM1RvaVRZVWJFVDZrMjA5QVpzWUJk?=
 =?utf-8?B?T09pSDdwaGRMSEpQSFpwNnUxbnQ5NmFIUi9lTzE3RTJLdWtITG9BU1dPbGNv?=
 =?utf-8?B?d21NVlBERHZWekxyK01VSDlPY2d6VGluMzgrdTdGemdDU1dLV0t1UXkwanlK?=
 =?utf-8?B?M1habDJTMExPSlBWZVBQeFNXTW9nTTFxUDBrV1lraklCbXR4ek55a2RDS2FJ?=
 =?utf-8?B?T2tYTDNiRWFZK0VTRHJPZkhDOWdpMHBGV0ZyZEk5U094Ym5RRXFlb05pdXU1?=
 =?utf-8?B?a0pCR2FsZENEN2xTaVU4RXhFOFpRTlpVNi82YTFPSHJ2YlFKMzhFMGJrQUZK?=
 =?utf-8?B?RW82WVpjMEFNRmxab1pPaFpVVDRTNmg3VkxtbXRoN3ZkUndPWC9GWXVlZHJ0?=
 =?utf-8?B?YVdZRnZ2ZGN3NDFZNTF2c0RmZE0rMDdObENzdmkwTjhDTkZUeEtlSDBNZ0t0?=
 =?utf-8?B?WHFtNGttZEtFOFRCVWtrSjBUQXBTVkpiRWpGc1Fva1Q1emVoSm5JN0pDdzRa?=
 =?utf-8?Q?kmyDdoKhXEs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2NzNGpoT0EvbUJ5Z0ozSWNnSnFuN3FCUjFZaUpUSGxwS2VGVGxsVXVBVExh?=
 =?utf-8?B?dXVTaXl1ODVEQmNPRUYrSXlUazZIdG1MNTVmdlo5QmJTUWl1VnVuZkY1VjJR?=
 =?utf-8?B?YlI2cVVHcGt3cmtFWUVPWEJrYnV4N0pDdUhtejJkRTlObmJhbXN2bnZFbjlk?=
 =?utf-8?B?Y1RlaWh5eVIwWDE4NW1idjJyVFdKOU5xRkxiWFZJempUdXNwcTg4dXMxR1dl?=
 =?utf-8?B?dXg0c0x6TDE4U0dKOTgyaWExV0Q1VmdrTlc1eDZwTjB5MXgzL001VUNxUFRu?=
 =?utf-8?B?MWt1eWdxaWxSZzUwMUVOQXAwMG1Hd0tuU080Uy9reWp2bTdFMzV4SldUWDRN?=
 =?utf-8?B?WDRuQjM0WlNDTm5hL3p5TTNwSGQ0R0c3V0RqcHJ6cjIzU3pMMzN6SzQ1RW5O?=
 =?utf-8?B?SGpuZVNHRHNZcTNuQTZwMHdFL3gzWU94SUlRWlN5MDBJbkdLakZkTnp3NUJK?=
 =?utf-8?B?ZEs5QWs2czNwSkNhL0xBelFJWFc4RmdMNzcwVTArdHVPb1RwM3ZvN0NOVnpV?=
 =?utf-8?B?WDlUV1NEY3NRaXkxeEVISXV6dkNxaFZweEtZUWNSQTRwMTdIV2hKM3RwZ1RB?=
 =?utf-8?B?S3lQZzV5OUtXTFZLZjBpc25wUmYvMVJrVXRZYmRBZzJudmQ5RGhFQkdBT0Ez?=
 =?utf-8?B?NWhXTzZwWkJWTitJN1hxVEhERmdtbkg1bGRZTEZxRm81VHdlUnhtMUEwZUVH?=
 =?utf-8?B?TUlXekdhbUw0OHZvU3dURTl0c01YdVVpWjhoMmgrNzFTNjJjaTdMRHlsYzQ0?=
 =?utf-8?B?SkgwcWExckxWOGo5amgrRG1xbFk2UWVzd3d6aDY4TjM2Q3F3cUtIMTROaVVz?=
 =?utf-8?B?UHlxV0l6Zzk5SUdtakxjbEZ3dGQvSnd1WlNyMU1ydnlnQm9BWHpuSGlYMEJW?=
 =?utf-8?B?RHJUM1loVnZYZ2w3RmFKVUp3blZhWnpBc3k5VncvZW4yS3FaeEMxWnhPZW9G?=
 =?utf-8?B?NVU1Znl3YzY1WUZnTFd6WnViQTFIcldhT2xyRE5pYlRFRTFGcDdUb2IxSnRx?=
 =?utf-8?B?UDRXTGdNRU1kZTBCR09GSmpTMExDc0tDTmh0OUNjcEt0QnJFVDlob0pRVE1T?=
 =?utf-8?B?TklDcHc1MjRVbVlJRVVNa2ZOcThtRFNIanpXZXlsb2Q0aVV3UVovdnE3RG9x?=
 =?utf-8?B?S3V1R2ZCeXdTbldhdjl4bnVxUVVlMlZFeGdGNDlOaVI5N0JMRmo5N3VEMWVa?=
 =?utf-8?B?dXNDbnpkQXVJWmxvelAxNnFSWE9qZWF2SURRTFN6VlMzYnVQUjFJelJiWlZo?=
 =?utf-8?B?clJ6Vmt0dkV5WW5Pdm9aZVZYZDJRcFFQblVIRTBKMGJIWXd4bHhZUmlGdXd2?=
 =?utf-8?B?TjFrbUtYSW1HVUV1V1A2SWpBcllJZDdqQnNqWkhDMEwyeUNVRklMK2tUYXEr?=
 =?utf-8?B?djF1b0d6cjVIUlN0S3NTcDZXUlNVWnZUTTNXOVJrYXNpSGV4VFZHbzNSWGsv?=
 =?utf-8?B?MDVCMzMveVdXM1JVODNUNjQ1VHBZTjcyeDllR04ydWVEc1lyUCs5aVB1Tzhj?=
 =?utf-8?B?bnAxakV2ZGoxeFJ6TkpHVFdsdGsrcEdPR3lpNURqVVd6akliU1JhWkJWVWhX?=
 =?utf-8?B?dFdIeUxOK0NHeHAzZHpMNzAwemx4ZUNEM0pySVVwZ1BISFZVOEYrdDgyelhk?=
 =?utf-8?B?UWoxL1BxNnVMbFlzeWVRUEJVdXFESjJwOFRvdFlwZjBmaWJDaWZ5aXB0NFQ3?=
 =?utf-8?B?YkNRWDRoYTFQTVlYMzVpeTMrRHhDNzQzMVdWdzNISkhFbU1aU0ozVkhJa1pX?=
 =?utf-8?B?Q3ZFa25lS081V3B1UjE1VmtQdXRIOGZSZGJLdWYwbnpDY2pBaTF3V1pSUDVn?=
 =?utf-8?B?dDltZ3p3ZUZ6SGZpc05sNnBScFkyYXZnUXpBY3JYNFJRbll2SG5odlRNblRh?=
 =?utf-8?B?aTlnVXAzbkhYZUxKUDJRQmF4d2hSVThPVkJ4SGxNNUlya1ZISEJObzNPZ2tY?=
 =?utf-8?B?MzNUNE5uVUYvT3FyZ2RWT1c5R051cjRSSTRKSWZwVHEzSHMyeDhnaUw3b3Er?=
 =?utf-8?B?R09lTDhjZWhacjFKYTFqZVUwWFFOZ1BzV0RiR1JHTzY2eVYzVVVQLzJEUjEv?=
 =?utf-8?B?Y3NSQVFQSTFxNjB6KzBReWh0NlNqbzBkWDZHYkVyKzNaZU5BdW5YRXFpMHRi?=
 =?utf-8?Q?K3BwqiMjOcZb913dwySa3joeb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5920d3-280e-48e2-a48a-08ddf5b9053a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 07:08:36.6314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZX/mXDuDTxAb6P5rzJG7JM6JufO2AtFmO8UjWokZMbWlZyrt/PVHZTSsTfzPRpNY77X/0qjWVi71AFQyquV9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6693
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/15/2025 4:36 PM, Chao Yu wrote: > On 9/9/25 21:44, Liao
 Yuanhong wrote: >> When the proportion of dirty segments within a section
 exceeds the >> valid_thresh_ratio, the gc_cost of that section i [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.126.40 listed in wl.mailspike.net]
X-Headers-End: 1uymHW-0006Bn-DE
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 9/15/2025 4:36 PM, Chao Yu wrote:
> On 9/9/25 21:44, Liao Yuanhong wrote:
>> When the proportion of dirty segments within a section exceeds the
>> valid_thresh_ratio, the gc_cost of that section is set to UINT_MAX,
>> indicating that these sections should not be released. However, if all
>> section costs within the scanning range of get_victim() are UINT_MAX,
>> background GC will still occur. Add a condition to prevent this situation.
> For this case, f2fs_get_victim() will return 0, and f2fs_gc() will use unchanged
> segno for GC?
>
> Thanks,

You're right, segno won't update in this scenario, and this patch 
feature is redundant.


Thanks,

Liao

>> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
>> ---
>>   fs/f2fs/gc.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>> index 4a8c08f970e3..ffc3188416f4 100644
>> --- a/fs/f2fs/gc.c
>> +++ b/fs/f2fs/gc.c
>> @@ -936,6 +936,11 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>>   		}
>>   	}
>>   
>> +	if (f2fs_sb_has_blkzoned(sbi) && p.min_cost == UINT_MAX) {
>> +		ret = -ENODATA;
>> +		goto out;
>> +	}
>> +
>>   	/* get victim for GC_AT/AT_SSR */
>>   	if (is_atgc) {
>>   		lookup_victim_by_age(sbi, &p);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
