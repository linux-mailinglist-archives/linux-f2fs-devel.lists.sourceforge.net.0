Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0594D972BF7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2024 10:18:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1snw5C-0006Fw-1Q;
	Tue, 10 Sep 2024 08:18:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1snw59-0006FR-Sn
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 08:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QUf+/LBrCKwU0sLEt49VnT6td5dlbwiYdKc+bcrekzc=; b=GnTFkS7rZMTHpoqbXDqAFq+fDR
 cRcuTcIB31o/DGkQAnWzWhSL3hdVCF2Af9nDwopxgynN/IT4hFN8k5wXeAT/H2yRbps/ZGv6fZB+/
 6q4z3YyIQG2RUkWROGooZSzAfUPDTjkN8/dCcCKVdYakNGbOqHuwGwyPoILjx7Jn7+xA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QUf+/LBrCKwU0sLEt49VnT6td5dlbwiYdKc+bcrekzc=; b=VdEuUCWEgjY5qDCYwphNL5fIMn
 Utw9o79IRnql83OXL9u/qvwTqhayFHLCWWwSiykBnzU4SRRjA6ETiW6FAClR+nQJNjeKON4SWl2be
 wDSJJ5zsrJEXX/bqKX1Wo1YaYQ583dsUp6GPnpeB7gnlVWcwDxyCOVGroiJjZhc7ohng=;
Received: from mail-eastasiaazon11010053.outbound.protection.outlook.com
 ([52.101.128.53] helo=HK2PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1snw59-0003Ng-H5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 08:18:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICdzEXtrRzEerAkJtVi6hGySsNMgzKiJUYIUCt1pb0EgWGpr2mnLd2caGX3cHm5SgvrB7TrSGblFruwDsoiuCL3aV+x71iwIzH5S3D171mgrypNnaSget+i3o2Fyqn/WXQWOwoNTIexfS0vOOBSrPuh2ZSWcYjdO5WrnfpGdFx8f/z0CqWPtLlNuSsq2Hw8i4g8rou3ySUNtOt2PXVSjxy62rkwL/SmAMIuasRQ0Z1imWZxd5SoWgf6OOj2GNNZGjvLSRxjM5BvDn/Mel02DCiJpBGWkQJwmF7qa4t9D6tBVENQLcOTdygawMibDNaRfdY2uxBtwd/T6jz1GzrMHJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUf+/LBrCKwU0sLEt49VnT6td5dlbwiYdKc+bcrekzc=;
 b=pDu66GoeYoOJgPL54nKOczbVdvn+cXS8lLPsBiH/C0KOQ2knN84wDgHXz1QhF4hupEUi3xkg3otrBSOWoueB6FU2etUlBN6Gsjln+63SoT4IS9a1hBngzbnIwmMqi2Sv6cJiTeJf+fxaxTkVcD6y82VBOrKKf+c2gFVxTU6qccoozI5i87Sy3na8S9T53AaM2hqvhB73ipIvx8uB4tBML4IEXl4DQx7Ztk0GHIeKFA0bLdKUStWVLfi/bJdRztCnhoGPYyzFxqNNCmJOi7fZotn78t5NunD+KEDnWo6NOI1I+UMT/22df7gjshq+8I+7O3o1X5h50r4eWjBabcRQPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUf+/LBrCKwU0sLEt49VnT6td5dlbwiYdKc+bcrekzc=;
 b=qhPe3KE5r2FPs4ak03ZKDqTe3INHdyJgcJv1xUbkPAXEYbq61HiAFJH8nRkTp9tcqNKBtUsGSVOo+bwOrwq+YURfeR7Z85cWvHPolLh0AaT6co2DiT6bvTfQFtlwDB7H0bakjVX61ayrb3HeyRSaKwCXRdJ9aaJpoGLiBBW35xBse6eXeVuELAGNC8yJyNjm0sYSEIR2S0A1uO0vbxLWCXXY3UdSUHWvb/rRk+thFbPN7jo7Z7lyNgB/feSRf3dxrcYwBH0w3why9As5CgxsR0pPDczRCZZ4jU9InsDDwgZXBlnQvL/4tHEbAqUYN02EMFL87o+rDo7VsCynspbqig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by SEZPR06MB6813.apcprd06.prod.outlook.com (2603:1096:101:19c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Tue, 10 Sep
 2024 08:18:23 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%4]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 08:18:22 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 10 Sep 2024 02:33:41 -0600
Message-Id: <20240910083341.283324-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZtuHv9ZbCxLmzuZp@google.com>
References: 
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|SEZPR06MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: bce3c6cb-a22b-4d99-a5fb-08dcd1712275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWRhM3dyT29Pc2gwcE90clAyb2swUDNTenIyWm0zSnhQc0l5dWxMY2k4alEv?=
 =?utf-8?B?OW1JOGc5Sll4K2hxWU5WUVJ5QjlYOUpVbmwxMlQ4UWdReUExNHlGNWFpTW1Z?=
 =?utf-8?B?em1ZaFN2MGhNZml1MjBQN0JwcEJkdDIyMllROGM3bHpGU1FWMjZ0dmJYM3p4?=
 =?utf-8?B?T3NycXdkTDg3TFdTNUNYTFRoNTc2bnJwWkg3dkpPb0phWUt1dkhRWWhmZExU?=
 =?utf-8?B?WnVLVEsvV1gySHdkeE1ZallHWThrekZackNlNjU5YkFJWXhHZytXa1p0VEtU?=
 =?utf-8?B?UDhabEFyR1pKTmVJNFlTcHVVSTBiak9Fb0VoNkk4UGJROE52V2xhQVlzWS9n?=
 =?utf-8?B?bkYzc0kzdzN4Z2RZUFpHTnV0c2RRcm51aGNmTXo3eUh0bEd3ZzRvT0d6YjY2?=
 =?utf-8?B?UnNnSnNTWnRFN1FZVzlZWTdOaHJnWUJLUWIzR1h6d0lDRXBsc2xvQldFWUZF?=
 =?utf-8?B?bE1pWDZrZXViQk1od09iUXg3TWJ5RmtmMStHWWdIU2ozdjZ0MG01NjdXTXNP?=
 =?utf-8?B?cFlLUUN4ZVlIYk1mYXk0T000cDQ5cFZSRDU1V3I3emdzOVlUR29jQXVNYkor?=
 =?utf-8?B?bW5LaS84V0JiQ1BmNHVEZFpEZFdBUHFsS3hUODdoSWYrU0VTV1RFcngzZ1A3?=
 =?utf-8?B?dlNiekJmWXppL2F5a2hPRC9PMm1jcGhzMm0zUmFwWnRHKzl2ckU2RU1GeWpm?=
 =?utf-8?B?bytBb3Q5dWkzUUNTT0RVcnFSRVc5UnVxSGpGTi9sOFAvQnQ2VXlVQldQc09X?=
 =?utf-8?B?VnBrUU9mamZOd0djRkhzZDdYNW9GTXlVRHoxVEV5VWRjQ1ozMFB2OVZyV05o?=
 =?utf-8?B?RnpOVm5wRDFjZGdWM2VqdWVRUHVwQm9IZVpZdzIrcVNDWlJzVGZwTVdmWTBi?=
 =?utf-8?B?Skhqd1NtSnF0QmUzTW1CM05iN0V0SXJhVDhzeU5QaGNQUy8wMFRxeHZQOG5L?=
 =?utf-8?B?ekV2YVM0WXZYVzlqbDZMTzJ5R3RBbWlEQlJxYzl1aUpYVmE2T1BPZmZ0dGVM?=
 =?utf-8?B?cU43YWVneGJad0tVbjJLSUN1ZDlUbmx3MXZKME9uc3I3Nmc4U1NoRWlqODNC?=
 =?utf-8?B?Nzl1YWYvWk1CK0ZpTW5jT0owODV3ZUV5QlM4R3c5L3hmd3dQdkpzRDZuUGpW?=
 =?utf-8?B?SXV4RnhJYnQzOXpXcEVJTlZ3QW92M2t3ZjUrUHhvdEc3SnVXVzlydmpVR3ZF?=
 =?utf-8?B?b1RFL0F6QnNzNnJlS1pDZzE3V3hSTFVIYWVlUG9uaGQ0UjA1OE1pdVVOTGlp?=
 =?utf-8?B?cll2U1VuQ3RwNkljNHl5ZzF1cFNFVG5sSTh6ZjMwMmMxWlZOcU5rK3NFU2tL?=
 =?utf-8?B?L0RQZExsUjFQU0h5RWVQZHkwVWYyMHZrTzJEUkRWUEJYeTRPQWljenN3ZWNk?=
 =?utf-8?B?RzRPZnh4YUQxRldTSkVCS0tmRkZQR1ZYMnRCWW1yMHg0bEpNUFhPMXJwUytl?=
 =?utf-8?B?NUFMaG03ZDFtMS9TcmhXVVZtUEdJSHZNNDRzS2E2Z3BBcmR0cVhLdE1RMDNH?=
 =?utf-8?B?bHU5QTJQbmVYQmZsbWpwSUUyQW8wZWlPNWFRUWNNMFZaUnMvdzk1NDR6dHRi?=
 =?utf-8?B?NERxZjhOcHR4czFUQThhVENITG5HRWZaQ0pxSDlyODNXVi94bU9sS2k4RTNm?=
 =?utf-8?B?RWZvdnQ4d2loMHc4SHhiZExINkNhN3ZCRE0wMXF1Y1RBSE5lTm01N1lzcTND?=
 =?utf-8?B?WjNGMTUyTDRUdjZ6a1FPU2gxY1NHVkdwb0k0TFZvenRONUVlUjA0OElqR29a?=
 =?utf-8?B?dXY4Wi8vUmZSaFBDeFc2eDkyeVdya1gwK0ExR2krRmNoZFdITlI5YnNJTlNQ?=
 =?utf-8?B?cE1pR0NJL0JEZmNqY2pFdnFGNW90QVFBVUV6a0pLVWUrQmh6ME1pckhMSG5u?=
 =?utf-8?B?VlBPMVQvRWJ3aXVHVENZRUo4eWpxR3htNUxnY2dlYTlTYkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm5URkZqMDlKbEQvTGU5Q2tXR1BvV3h3cVdTbmg5VTgwK3VSaHNUZG9tNWR1?=
 =?utf-8?B?Y3ExdXV1R0xLbEQrS2d1Z01XMG1ld1JTSE9WODVjS21RL2M2bFJ5Z0I0NkVI?=
 =?utf-8?B?ZFZxNmF0eDczZ1hiMTI5QjVJcTFaVDlzZTJwLzFwUm1XQUxPaWtpcmNaa0Rw?=
 =?utf-8?B?UDlKLzE2am5EYkszTUlyUm1adGQ5NSs1TmVqdmxkN1pZWnQrTDhhRlYyTU82?=
 =?utf-8?B?UHFPbFAya283T0RwUWVRdUxlVGFiV2pUdVRWNTJ3WlZJODdPY3FIRk9WTjlG?=
 =?utf-8?B?YkdvUFovNE1PbFFNQklIT0FGcUVFSnFTWTdpU3BoNUlDdDFXNFhXU1FreE43?=
 =?utf-8?B?WG1RTy9DU1JITmhZYkFObnNzSUZSSDBWTFV2TWF4bmpwb3BHcGJ6MWh4ajgz?=
 =?utf-8?B?NjI0YjV5eDg4QVhKUytDa2NRVXJ0ZC9XbmhHNCtTT211N01XMjdENVVLdlhG?=
 =?utf-8?B?VWk4ZSt5ejJmY1pKUkZDZzRJaGk2eDBiWTlUZjRsU0U5WUhwcDNvUWFqQmlK?=
 =?utf-8?B?M2F2TG5PT2lKUXJJdHo0RFN2cDNhSXdkY2g2aWZNZjIyWkJXOXBBbjRjQjky?=
 =?utf-8?B?Smp2T3Evcm5nZzZqRW4wa1l2ZDFsK3lkaWFhdW1HMmwxZDNTMmdyWXBQa0Zy?=
 =?utf-8?B?ejB6R1JSYk5PYWNhVkFnMlhneHhiVE05YUtQMTRMaUFsbG9jVHJtOHpFbDFG?=
 =?utf-8?B?TUpOWERaVVJ2NHJTOWNGUjVCbnk5T3ExSk5hNjRkYXZnTGgySkZTQXFETFFZ?=
 =?utf-8?B?azJkMFJQTm1BclRuVU1BbHdabzNzbkl5UHRXM0lxYVFDc1lSdVg4bzMxd20y?=
 =?utf-8?B?TnFrSWtWTThHbmVzN0p0b0V2N09BajUyRGJlU2xHL3JMK0RLblRReC9sQkJV?=
 =?utf-8?B?MXRqVDBWNnI4YVRRTVVweGdseGk5alVBdjFWaFJmQzlrSW5ybUp6Q3FTNlI1?=
 =?utf-8?B?azhJdklaZ2pGVEpiV0crTTlOenMrTjE0S0Zka0hFdkV3Wm1jd2I2bjNEWE1L?=
 =?utf-8?B?UUpTUjhkK2VKcEYvQm9heHRlZUlwNXpHQmU1ancyTU9hNDZHMWRrM1FReTV0?=
 =?utf-8?B?VHBkRDI3citCMk0yT0wxbXp4d291S3VJRiswSEp0b1J6QXd6NzhjZFErZ1lT?=
 =?utf-8?B?RndOcGtlTVU1blJFVmV3Rmg2RjNxVW0ySFVKeDlpQ2YySDBNN1djeU5YZ0dS?=
 =?utf-8?B?U0pmcEh5MU96b01NMmFkVG1pdGcvb09EOEhnSVNmVVVnMVZiMFJGamtQN3pJ?=
 =?utf-8?B?dTdTWi9aakdwTHJIOHpGdlJpb01SS3pEUDA3Rk9MbWFpbVR1b002YnhENGtK?=
 =?utf-8?B?YURmVGIzNE9aNGhNTXFBS2U0NTdlNEFpa0d6Qzd1aFZ4dWhxZEErVFZ1VmlF?=
 =?utf-8?B?Umh3WWVmNmw1cEZ4NHBzcExXdXEvTEc0U2tGSEluNmpyQzJzT3lwMDUxcFdN?=
 =?utf-8?B?ZVRZSm5ES2pTaFBIMFc0WGdjQUo1MnBSUnNaOUE4aXMrbmlDb3ZoT1dHaTFj?=
 =?utf-8?B?b1B1TFV1SDJjMi9ZMS9Sci9DMUNoZStCZWpXOVpqZTZvV2VEc3lORTlDVEFT?=
 =?utf-8?B?aWRDdWwweW44NWVaR3F3eVVKeGJFdzZLVllLcUNGODMvRitDUXM0amRReVlk?=
 =?utf-8?B?UksyUjIxaHF6ZXRXemk5SnR5dFBYNWgzK3htN0UxVmxaZEZSbTJKRkRtVXd5?=
 =?utf-8?B?Wm1pZjdkRHlINm9tbUdEZVVNZ1dtRmhjV2d1SzZtVzhBYUZKVmsvcThvaWo3?=
 =?utf-8?B?ajFYZHRKdVUxNTlzcDB0UlkwWGNCUU9ZbnptUFd2eC9mcWlQM3lrRE5vS1d6?=
 =?utf-8?B?c01tUVk2cVA2UDZhY1VkWlp3cmRhdU5yaW5PWnhMVDZCWHFacUVTRGx0bHBi?=
 =?utf-8?B?YnpnT2YwalcvdTAzQ2szcCthYW0wVlpsUUJSRHhQaEhjN2lEWTlXM0FEVjQw?=
 =?utf-8?B?ME9BMHU3amlqVEsvNHZGdGU3VktRaDREQTJLK0labWNVZ0ZON0d1cFR6eXNz?=
 =?utf-8?B?RXMyeUhCalZkOTVLVHBOSlZHYnR5SnZFZW1SdnNVbDVkSDVjelZISTE5YVNu?=
 =?utf-8?B?SlVaSXV3ZUJpRGdPSjlCRmxibDljVTlOV3VJVFREZ0tXemwvTEJHWGorTzJ5?=
 =?utf-8?Q?FgJmowMBZTHLZ2oK8e8PYhtGY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce3c6cb-a22b-4d99-a5fb-08dcd1712275
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 08:18:22.6446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AucazNOmZTxXOBgC08W94TcwwrzeqlTufU4J1oqf6xqU/EeBgwiNMyEZpmsW7Y+eVQ8o8gaI5JkjW9Vt59NkZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6813
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Sep 06, 2024 at 10:52:47PM +0000, Jaegeuk Kim via
 Linux-f2fs-devel wrote: > On 09/06, Chao Yu wrote: > > On 2024/9/6 16:31,
 Wu Bo wrote: > > > On Tue, Feb 20, 2024 at 02:50:11PM +0800, Chao Yu [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [52.101.128.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.128.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1snw59-0003Ng-H5
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: stop allocating pinned
 sections if EAGAIN happens"
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Wu Bo <bo.wu@vivo.com>,
 Wu Bo <wubo.oduw@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBTZXAgMDYsIDIwMjQgYXQgMTA6NTI6NDdQTSArMDAwMCwgSmFlZ2V1ayBLaW0gdmlh
IExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4gT24gMDkvMDYsIENoYW8gWXUgd3JvdGU6Cj4gPiBP
biAyMDI0LzkvNiAxNjozMSwgV3UgQm8gd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgRmViIDIwLCAyMDI0
IGF0IDAyOjUwOjExUE0gKzA4MDAsIENoYW8gWXUgd3JvdGU6Cj4gPiA+ID4gT24gMjAyNC8yLzgg
MTY6MTEsIFd1IEJvIHdyb3RlOgo+ID4gPiA+ID4gT24gMjAyNC8yLzUgMTE6NTQsIENoYW8gWXUg
d3JvdGU6Cj4gPiA+ID4gPiA+IEhvdyBhYm91dCBjYWxsaW5nIGYyZnNfYmFsYW5jZV9mcygpIHRv
IGRvdWJsZSBjaGVjayBhbmQgbWFrZSBzdXJlIHRoZXJlIGlzCj4gPiA+ID4gPiA+IGVub3VnaCBm
cmVlIHNwYWNlIGZvciBmb2xsb3dpbmcgYWxsb2NhdGlvbi4KPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+ICDCoMKgwqDCoMKgwqDCoCBpZiAoaGFzX25vdF9lbm91Z2hfZnJlZV9zZWNzKHNiaSwgMCwK
PiA+ID4gPiA+ID4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0VUX1NFQ19GUk9NX1NFRyhzYmks
IG92ZXJwcm92aXNpb25fc2VnbWVudHMoc2JpKSkpKSB7Cj4gPiA+ID4gPiA+ICDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGYyZnNfZG93bl93cml0ZSgmc2JpLT5nY19sb2NrKTsKPiA+ID4gPiA+ID4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdF9pbmNfZ2NfY2FsbF9jb3VudChzYmksIEZPUkVH
Uk9VTkQpOwo+ID4gPiA+ID4gPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIgPSBmMmZzX2dj
KHNiaSwgJmdjX2NvbnRyb2wpOwo+ID4gPiA+ID4gPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoZXJyID09IC1FQUdBSU4pCj4gPiA+ID4gPiA+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZjJmc19iYWxhbmNlX2ZzKHNiaSwgdHJ1ZSk7Cj4gPiA+ID4gPiA+ICDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChlcnIgJiYgZXJyICE9IC1FTk9EQVRBKQo+ID4gPiA+ID4gPiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X2VycjsKPiA+ID4gPiA+ID4gIMKg
wqDCoMKgwqDCoMKgIH0KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFRoYW5rcywKPiA+ID4gPiA+
IAo+ID4gPiA+ID4gZjJmc19iYWxhbmNlX2ZzKCkgaGVyZSB3aWxsIG5vdCBjaGFuZ2UgcHJvY2Vk
dXJlIGJyYW5jaCBhbmQgbWF5IGp1c3QgdHJpZ2dlciBhbm90aGVyIEdDLgo+ID4gPiA+ID4gCj4g
PiA+ID4gPiBJJ20gYWZyYWlkIHRoaXMgaXMgYSBiaXQgcmVkdW5kYW50Lgo+ID4gPiA+IAo+ID4g
PiA+IE9rYXkuCj4gPiA+ID4gCj4gPiA+ID4gSSBndWVzcyBtYXliZSBKYWVnZXVrIGhhcyBjb25j
ZXJuIHdoaWNoIGlzIHRoZSByZWFzb24gdG8gY29tbWl0Cj4gPiA+ID4gMmU0MmI3ZjgxN2FjICgi
ZjJmczogc3RvcCBhbGxvY2F0aW5nIHBpbm5lZCBzZWN0aW9ucyBpZiBFQUdBSU4gaGFwcGVucyIp
Lgo+ID4gPiAKPiA+ID4gSGkgSmFlZ2V1aywKPiA+ID4gCj4gPiA+IFdlIG9jY2FzaW9uYWxseSBy
ZWNlaXZlIHVzZXIgY29tcGxhaW50cyBhYm91dCBPVEEgZmFpbHVyZXMgY2F1c2VkIGJ5IHRoaXMg
aXNzdWUuCj4gPiA+IFBsZWFzZSBjb25zaWRlciBtZXJnaW5nIHRoaXMgcGF0Y2guCj4gCj4gV2hh
dCBhYm91dCBhZGRpbmcgYSByZXRyeSBsb2dpYyBoZXJlLCBhcyBpdCdzIGxpdGVyYWxseSBFQUdB
SU4/CgpJbiB0aGlzIHNjZW5hcmlvLCB0aGUgcmVtYWluaW5nIHJlY2xhaW1hYmxlIHNlY3Rpb25z
IGhhcyBhIGJsb2NrIGJlZW4gcGlubmVkLiBBcwphIHJlc3VsdCwgdGhlIHVzZXIgc2VlcyB0aGF0
IHRoZXJlIGlzIGVub3VnaCBmcmVlIHNwYWNlLCBidXQgZmFsbG9jYXRlIHN0aWxsCmZhaWxzLiBU
aGlzIGhhcHBlbnMgYmVjYXVzZSB0aGUgR0MgdHJpZ2dlcmVkIGJ5IGZhbGxvY2F0ZSBjYW5ub3Qg
cmVjeWNsZSB0aGUKc2VjdGlvbiB0aGF0IGhhcyBiZWVuIHBpbm5lZC4gTm8gbWF0dGVyIGhvdyBt
YW55IHRpbWVzIGl04oCZcyBhdHRlbXB0ZWQsIGl0IHdpbGwKY29udGludWUgdG8gZmFpbC4gSSBp
bmNsdWRlZCBzdGVwcyB0byByZXByb2R1Y2UgdGhpcyBzY2VuYXJpbyBpbiBteSBwcmV2aW91cwpw
cm9wb3NhbCBwYXRjaDoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8y
MDIzMTAzMDA5NDAyNC4yNjM3MDctMS1iby53dUB2aXZvLmNvbS90LyN1CgpIb3dldmVyLCB0aGlz
IGlzc3VlIGNhbid0IGJlIHJlcHJvZHVjZWQgb24gbGF0ZXN0IGtlcm5lbC4KU2VlbXMgdGhpcyBj
b21taXQgcHJldmVudHMgdGhlIGNyZWF0aW9uIG9mIG5vbi1zZWdtZW50IHNpemUgcGlubmVkIGZp
bGVzIGFuZAphbHNvIGF2b2lkcyB0aGlzIHNjZW5hcmlvLgozZmRkODliNDUyYzIgKGYyZnM6IHBy
ZXZlbnQgd3JpdGluZyB3aXRob3V0IGZhbGxvY2F0ZSgpIGZvciBwaW5uZWQgZmlsZXMpCgo+IAo+
ID4gCj4gPiBJJ20gZmluZSB3LyB0aGlzIHBhdGNoLCBidXQgb25lIGFub3RoZXIgcXVpY2sgZml4
IHdpbGwgYmUgdHJpZ2dlcmluZwo+ID4gYmFja2dyb3VuZCBHQyB2aWEgZjJmcyBpb2N0bCBhZnRl
ciBmYWxsb2NhdGUoKSBmYWlsdXJlLCBvbmNlCj4gPiBoYXNfbm90X2Vub3VnaF9mcmVlX3NlY3Mo
LCBvdnBfc2VncykgcmV0dXJucyBmYWxzZSwgZmFsbG9jYXRlKCkgd2lsbAo+ID4gc3VjY2VlZC4K
PiAKPiA+IAo+ID4gUmV2aWV3ZWQtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiA+IAo+
ID4gVGhhbmtzLAo+ID4gCj4gPiA+IAo+ID4gPiBUaGFua3MKPiA+ID4gCj4gPiA+ID4gCj4gPiA+
ID4gVGhhbmtzLAo+ID4gPiA+IAo+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IAo+ID4gPiA+IAo+ID4g
PiA+IAo+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gPiA+ID4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+ID4gPiBMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4gPiA+IGh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPiAKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
