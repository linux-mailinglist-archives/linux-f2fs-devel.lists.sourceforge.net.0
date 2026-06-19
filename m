Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kvNhLKBTNWpetAYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2026 16:35:12 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FFB6A66FC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2026 16:35:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=M7zqdRsx;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=PWaJEiof;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=mxYjtbPc;
	dkim=fail ("body hash did not verify") header.d=outlook.com header.s=selector1 header.b=nrs+dY02;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=outlook.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRo33bma0A2t8NGsa80LZk4iaDbq55oJy9w6b1JVET0=; b=M7zqdRsxv6zIGegtNNlm787are
	q6/aZYAhQLUaF8ag2MJxMd6HTY7jcxiiIrEy7OOQW7M1FjSMiLhcpIYejFkUW4Hnx80V+6u6jwgU5
	FTcbO/e9oNwjdoHKCUtkPxni0V30nLrcd+pJuK/a07tH8gJ6kndRKAulfhpTZKE/kF4M=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1waaJB-0000hU-Hu;
	Fri, 19 Jun 2026 14:35:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1waaJ9-0000gm-1E for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Jun 2026 14:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EI6AQrorlsQzgxLI1QVXjpKK0FhE6GeTxZmAEueSIiI=; b=PWaJEiofG3OlgB2tlDJx5cLOH/
 +6NAgadGN8Q9ddGEiaNxQyR01h4zfLD1Ekm095aGwm0V4u0ygcsNoC9HJ+2F33zdMvIa1Yc+2oJTm
 DmKR0EJbF7gL77ByVbPPXqtv1Bo2IJoVpntKMlF0p7yAtLVOjiuBlZu7vP4AjVrMv04Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EI6AQrorlsQzgxLI1QVXjpKK0FhE6GeTxZmAEueSIiI=; b=mxYjtbPcIZBa9YyUlmOKYKiho7
 j/fRnLZBsh35H32gDcCUlBUUT/oYYuboXwFx08/C7P3WRQXCawyyxKpT5A9xEC9frns71HIbYGSyD
 YIYID7KL+Xp4Wt1shWJIGsdoA9ATEjO4kNoiic4zHuYIZK2F5c1+pGo4TaSNlTvPoYNo=;
Received: from mail-japaneastazolkn19012053.outbound.protection.outlook.com
 ([52.103.43.53] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1waaJ7-0003rs-Ib for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Jun 2026 14:34:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrmsQkBk6Eav5zFmu1OMkmVcArCIVVuXpx5ZZmOE+OGz3oHqRTRekPh61wSRznqujj7u/dX99G42nSW6mVKnqjBTjvy1bKRFKd2zaZqeIWcXpNcoXVRxfiTZ1A00AUOVrTZv8AkqVA6oSF+/medihECBrap6yLDJRRbhUPAklvetqESPKJ1sbsIXQZK9KqBh9LShJoM6xUpsQgFmgfcrzVLjjfTSSHnmnALxN5hT5dDpzPgwqzl8q0VkDYYFWKI5h8epQ2qcWhpRe8m+4CGDfcl8+i6qi78eSXfCSyU/mDklCBvyfvOT0LSAA3Dqcvo8j5LC6cxO4W8NLvGv3yWEpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EI6AQrorlsQzgxLI1QVXjpKK0FhE6GeTxZmAEueSIiI=;
 b=jymtPkqLIVfiLnWTnjLWF2AnHlonyfwDhdFYAbaVtZwJ0JIoVy/OQUNMWRee/6655BNnpJfEu8WBGTQuQXWGVp3iyJSPtPkicGCfZUCO3R2kdqOHEE2DoAVnv8UsvFe5WhrNXgHTTOD/2KFCbx4FJJ5AM9bJUNE+JHgKiqsx85ZYIG2O6mkr3shWi12/Z4CAg1o9A4mu8BiZmBp42eFMDC26wTGa1xNn+dnUaX/0IrPDOnzDEoJm5/60kEAuRcmOuW6NkPgYVuISXg7e6ZFLKDkSUIsNhicbQIwjsdBy4uYwMdTvF6bYDw+7LpqyWV3xzlH5pp+rA57svv/Ft3KEhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EI6AQrorlsQzgxLI1QVXjpKK0FhE6GeTxZmAEueSIiI=;
 b=nrs+dY02Z7Se3mTfOWIFMXB1LAdIF7pLB/DRI9HuLV1QkbyvKJ10Z9KMCJbnqKMXYgeKxdrbHR9mlUh5XHAWIHGw4lHuqsLciminSxmco1PihTtExwdz2zCICaW/hD0kXnMShO9KmkyOnbEwpDGfTvpyBuDlCWjo/mYzFDUCm/J1b5vN3q3NDvEt28zO0b2l36fg6jAP05JhSMFsBIlao6GvcFIoynrSA7NpccagTDUga+uqAAPXe0SVmBhBqRHpArXY/2Wth6q8Kirsub4E26Jqm/Ob0yTzzcgfue2qa16Dhi7lThywe5nqXw23DWl37zG4NbmOEn+sDLGKl4RoIw==
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com (2603:1096:101:4e::13)
 by SI3PR02MB9388.apcprd02.prod.outlook.com (2603:1096:4:2a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 14:34:42 +0000
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72]) by SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 14:34:42 +0000
Message-ID: <SEZPR02MB5662A85B218D3EF7B2FA8C6599E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
Date: Fri, 19 Jun 2026 22:34:33 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-3-yangyongpeng.storage@gmail.com>
 <7ffe0789-1024-4dc7-9089-2dcf856a1bd1@kernel.org>
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
In-Reply-To: <7ffe0789-1024-4dc7-9089-2dcf856a1bd1@kernel.org>
X-ClientProxiedBy: TP0P295CA0022.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::18) To SEZPR02MB5662.apcprd02.prod.outlook.com
 (2603:1096:101:4e::13)
X-Microsoft-Original-Message-ID: <8a7ad1bd-5a09-4c85-a734-f8eb8394e25e@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5662:EE_|SI3PR02MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: c73b8d70-0e40-4662-ff6e-08dece0fe6b2
X-MS-Exchange-SLBlob-MailProps: laRBL560oLSPhlJ95/U7v6W/AahuugGazLt8CwdcjzbIU5tc8bOqcSuUHMRE4Zu515mGsreMn78Fvq7dY/g2BQb8Rcum28Ef/3NzCoURcKjzHRkdDqaLYZQAwdaM32q/TICVQSTL9trv4GRc4b6MxDI79Z7OsSZXP5sAsG45xRlhv5s2xugrvK+oKt+L9pVkGEmsiCzdMd9i+dU/xi/9XZDjm3QgQCuyEEx2zFoLZ6BfvuC6gDFtXGuyvO84gvpgfPj+DW3whBfTDWbPeluclnmzATRarPXT+QH6KNu/EfvmTPj94rTNGztV08OklWKOEnA307038ajk6mqo8iafeJuOKlm7uVIpoRAaSojH2vfZNdomOUWok8McKSVcJfzrFmvQq8td49EDShtP+5RKhGHQrsSBGKlbJ7n5y0vtrAolJBLYkjAoiEqdRi6TUBV+bfjBQl1wNMUDMjNmc6AKb8Tdwv8kZM5x6hg2+NZZY86zkkKa/ZtHQBf9VQQq+HMwlltuJ6HYae88cU/fLg+OSr3+cNblnZI6w/kNVJvy8r7GRxI0CiLHnDEuZTDhhZ47xANpmaVT+F4RJPgpHr10swdOvTDm1zixQWHjtZgD9j+4z+9QJPwGnZJ/1RoopDrAAqIYOsy5eqJICl3myXhC4Irb3BXqtQljlWYcJ9IyLdOavPyKFm6voMzSksTbn8yP60IJuNQ/4uQx3aOufc0cyrt3q0Lq0RbGrk6S8hEz33oda6r5r3jy8J5xt24ceWgEPU6C9oWWgCOY60Niw1xi8Jer7jaByAcO
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|24121999003|22091999003|15080799012|5072599009|8060799015|51005399006|23021999003|7042599007|19110799012|6090799003|45011099003|25010399006|40105399003|3412199025|10035399007|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VExUTjc2Y2RQbnZHVnRnZ1FTYXVyUG9VeEo4OGZZZzByNkxjQzF1L2hQVDM3?=
 =?utf-8?B?LzRmbXdJczhPc2ZkcFJLM3ZTV2hWQWZDM2kzMWQ1RFBpTXVQVHg5KzRJOUV4?=
 =?utf-8?B?dXJiaW10M1hXMTNEMExVMzdXSDcrblR1Y2RUMVcwUnZ1TTE1dVc5Qm1rbWtI?=
 =?utf-8?B?ZXhEM3ZSL0R2Y0pTbTVCdTdQQWl1V09mMnNiTUJDd3ZHbTlHOWVHZHJrckNs?=
 =?utf-8?B?eERGQkIyc1hnbmlvVENGWmRDOVAyQmxpQ21lcDJnK0NWSHBwaEhZK0dEK1ls?=
 =?utf-8?B?QzdtWllKSDdYcmVWNTI5N1U0ZWFoYmlFbU5LUk9XUHRkZFlNa3pCdTF4MXdF?=
 =?utf-8?B?VEVBS2FVVyt5UmpxWTJBRSszaTg4RGhIMVE5YytBRjFrenpWS2wvOUNKeXJF?=
 =?utf-8?B?WkEraktBRXFVbnBHaU52NUl5eWw0VFZhVjJndlgvdURkUXNDd2F1TjhtVGFT?=
 =?utf-8?B?RDByYUhGeHo2WU9OeEpEVHBIUUxxSVl3YW00SVpHM2JyWW5TTzRPT29WUXB0?=
 =?utf-8?B?TWJHSHovTTVyV3dGQVFBY2swMDJwK1FZV3pBMko0R3NhajJnNnd4RllEd0dq?=
 =?utf-8?B?WVBCQmRMTzI0d2VyQ1JEMDdRTUhkblFaQ3N2WHpNaWN4cjhXRE15YzB1Nm1H?=
 =?utf-8?B?NGc3UytGd0N1b3NUdVR0dUx4UlVjRDVsbkRDcjhXWXZrdnpoYWx6S1RFOU5C?=
 =?utf-8?B?UTNrVmVDSXJSNjR5V0dZWTk4eVkxQVpoby8ybmZBVlZRY2RXazN0K2pLOCto?=
 =?utf-8?B?Qkd4S1RjSGtyOFpSY0liQklvaWZoUDNvVVBLb1AwdzJqaHlZV1R3RzlSQVRF?=
 =?utf-8?B?dkFUTTdXSFEveERrL0xaWU5MeUQ1eW9OUXl5M1B2aWI4MHJRNGk0OGFuc01t?=
 =?utf-8?B?THJZdFZRMDEvY2tLNndCQUhzU0NOcUFtMkJ0MzlhczdZM2Fja0lJV3NqUlFt?=
 =?utf-8?B?emt5TXpTZXNKYnpPU0JXMzFIa3c0QXhSM2t4R01GMmQ0aUMvc205MWJlOTZt?=
 =?utf-8?B?NjVaTzUvbk44SjNjbitTSWVWZ3hHQXJYdm1JTDAwWU5xclBKdktjYWZxZDN5?=
 =?utf-8?B?RFFxVGJxTjczdHQ5dWViZFZrd0pVK1VseW1iZ3llL2NhUFVzenl3MytQN3Y4?=
 =?utf-8?B?VWE3RzBqTmkyajVCUjF0ZkZaZHFZVmRoZlRmQmcxZWFlWU1CcTdKNGFaK0lF?=
 =?utf-8?B?TzZMMXk4ekxGTkZMYW9CZDJnY0Zud0FIVXBKSHZnRmdzQ1NuMy82S1JKcVdT?=
 =?utf-8?B?NTJTZGppU2hlV1pPYjZQbTA1T0E2VFp5eWVlQVhmUFlFaTQva1ZQcmp0Rno0?=
 =?utf-8?B?dm9KT013ZGxENVhDL2F4OHZhWHhnaVE2QTduOXd0RVJUK3d2QkMxU1luNlo4?=
 =?utf-8?B?V0tUYmtzbTdJVGhDMDM2TzN6c0IrN0pYa096aWpaL3hXZGhzQkVuSDl2ckNT?=
 =?utf-8?B?UWw2eDd0WEVqYmVucGFLeWpCckpuc0V1dVBabmVVSjNwd1lZaEtyMEhEcCt4?=
 =?utf-8?Q?1z7iMc=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWRJOE9tQ1lmVHhWN1UxM2RmeFpycHJ3ZVlPckUzOE5yUElMY0dZT0JRTUhH?=
 =?utf-8?B?NkZhak8rdmNhSDlGMXpoTVNvWVBRSDRvMG1DM1B0M0h0SDdEWDVqTC9XbEdU?=
 =?utf-8?B?SHNGOXErWWZDMFJDdndqMytVeXRNRmFxTGk5b0VmZGZYVHMxYjhJZG5nNEo1?=
 =?utf-8?B?aWdDYjMyT0xrLzRJQkdESG5mbUw1cExPcGV6czNTQm42OHdBcjRDaHBwUVJa?=
 =?utf-8?B?UXZTbmVoZkhReUdNdDlKYk40Zlg3SmlKSlRlMHpDRGwyQlJIUjd5engySEVt?=
 =?utf-8?B?MDhpaUtMU29wcmU0aHJDcnQwa0tPVGdHYzBCci8va25kM0NJSGMyZ0g1YW0y?=
 =?utf-8?B?Ym5NYXJURnRSYktIMFBuaTh0R1FQeDZLQnNnQUZJNkZBVVViU0h6Z2QvVGFw?=
 =?utf-8?B?S3RaSFB0QTVRV25NSW1oLzRRZ2xqeDVYZlZOT2FLNUVxR1RZeHQraWRHUmVr?=
 =?utf-8?B?dHlvczNFbGJSN0tnS0xKNG03UGRqKzJ3czl1a1V3anY2SXVwVmRPdHdrMnBK?=
 =?utf-8?B?UnNIKy9ma3pYSGwydXkvWEVXNTlGelF6bWxaM1VRekRTaGVrWXlhMTRCUnVK?=
 =?utf-8?B?SW1hOFFlQVRsdnJZdmpCanlWeGcyTTljZVV3ZDBWMW15bHUxdVZFUmdQWjVK?=
 =?utf-8?B?NDUzTi9CK1VWMjJBV2FKRlhMdm5ySElFMHEzWTZBb21sSXM5b3F5SUxRZVIr?=
 =?utf-8?B?QTlhdjZJeGZmN1NPS21waEVHOEFDSnNBYkFUUUZSZDJmMmRTSG9RUXNCTHBj?=
 =?utf-8?B?VGdJakRyQkZHU1FuVGtCdkZHcjRzVkcvWHdKaUJMRmJ1VjNwYUZTVHdtRlpZ?=
 =?utf-8?B?ZnlqdUZmSVlnUTlKbzdlSksvLzVKTzlqc1dOYkUyNjIwUExSdGZ0RUhKRklP?=
 =?utf-8?B?amRMb3J1c1ZZOG5mYW9pZHpadnFoclhwdlR6N1FwTnVybVoyWDN0bUdIMGl2?=
 =?utf-8?B?R2ltK0VRZ0c3ZlJCdEM0LzFPdDM2bHJ4V2JSMVMwRVc4R3VSMG5udFpaS2N2?=
 =?utf-8?B?ZGVqcjd2WXh0d3F6SVBKOVgvTlVFdTZZRGg4enFLRFNuYUpIWEtYQzBOVUZo?=
 =?utf-8?B?YStmdEY5WGV6ZkVHVEZid2J2ZHNNejZobnFKYno2bFQrUGtUMDJMaVBuZGwz?=
 =?utf-8?B?UXJja1hjWmRXYXFydi9NUkFnK3pyMHF4K1RmVlJHSnZ3dWxUdDVBWWtJdFFu?=
 =?utf-8?B?UU9LOGltUFFTdTZ0NENOZkJkK05yaHhOU0dPbXkwTzFOdC9TOThLS0YyaWFM?=
 =?utf-8?B?Zkxrbk5qVUh6eXRiN1pjNzF6RSt4ZitOdEtjYUlqSDR1L2VUeXFvOVROUTFW?=
 =?utf-8?B?YkpiM2wxdHhvMHRHOTVDVG9vVU9jM25TYU0rekVvbm5WdVFpZDN5SDZ6MzFz?=
 =?utf-8?B?bDNTSmxhQjVqYUZPRmVpREtWSVVPZ2FuQWtZQW5iYzEyRFdsY2s0VkJ1eGtw?=
 =?utf-8?B?S3ZubzQrU2pvbDdOWFR0aVNiS0dESmI2dTNudjV3MWk1MDM4elBEaUdpNmt2?=
 =?utf-8?B?YXF6K2FCQ0FNOWNoWndwNExqNy9VVHpEcWMwNkdUK0NWSFhyZjk3aTE5KzNQ?=
 =?utf-8?B?bE9yUTQ3U2FqQm1TdjJGZnM3ekw5cVVxcDBUVHdTMC9mNGNiV0lrMmNpOWpq?=
 =?utf-8?B?Wjk3MnIzUSt2WDJBUEtaMkh2aGdoK1YyYkNMQmp3ek9kVG1ZcDNLeDNlbGdx?=
 =?utf-8?B?TE5JMXc1Z1dmemhrN3QwVHM1UndDMldNSWk1YXBzZFRYdHQ2eld3Q3FBRFJF?=
 =?utf-8?B?Y296N0JReDE5WDlsWE5seVByc0Z2d056a0ZkZnQvUzZzWVJsV2hGb3I1eEht?=
 =?utf-8?B?U2ZybXZhSHgyZmF0Vk81TDhFUGM4eldITDdmelNOVTdxSG4yYStYZlUzZFZX?=
 =?utf-8?B?clJrSHVMeTBYQ0RyWDRqSExad1NUdDNFeFJTazN2Vlg5b0NnNGYvejNZUjBn?=
 =?utf-8?B?QVRyWlg3dExnaEJHcSs4eWhxdWUrK1o2eUFLWTVmdCtjczhPb3lmcXVvY2N2?=
 =?utf-8?B?bUMyUDNhNG5RPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c73b8d70-0e40-4662-ff6e-08dece0fe6b2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5662.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:34:42.5627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR02MB9388
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/15/26 7:55 PM, Chao Yu via Linux-f2fs-devel wrote: >
 On 6/12/26 19:58, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> The largest
 extent takes effect during both read mapping and write >> m [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)outlook.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.103.43.53 listed in wl.mailspike.net]
X-Headers-End: 1waaJ7-0003rs-Ib
Subject: Re: [f2fs-dev] [PATCH RESEND 2/5] f2fs: only initialize largest
 extent without extent_node at inode init
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[outlook.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[yangyongpeng.storage@outlook.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,outlook.com:s=selector1];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpeng.storage@outlook.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,outlook.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8FFB6A66FC


On 6/15/26 7:55 PM, Chao Yu via Linux-f2fs-devel wrote:
> On 6/12/26 19:58, Yongpeng Yang wrote:
>> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
>>
>> The largest extent takes effect during both read mapping and write
>> mapping lookups, while read mapping does not need to access the
>> extent_node. For write mapping, the case where the largest extent is
>> not in the extent tree can already be handled by the merge logic, and
>> cases that cannot be merged do not require the largest extent to
>> participate either.
>>
>> Therefore, the largest extent does not need to initialize a
>> corresponding extent_node, reducing memory footprint.
>>
>> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
>> ---
>>   fs/f2fs/extent_cache.c | 18 +-----------------
>>   1 file changed, 1 insertion(+), 17 deletions(-)
>>
>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
>> index aa368a01b035..f8d94db60dc6 100644
>> --- a/fs/f2fs/extent_cache.c
>> +++ b/fs/f2fs/extent_cache.c
>> @@ -410,10 +410,8 @@ static void __drop_largest_extent(struct extent_tree *et,
>>   void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
>>   {
>>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>> -	struct extent_tree_info *eti = &sbi->extent_tree[EX_READ];
>>   	struct f2fs_extent *i_ext = &F2FS_INODE(ifolio)->i_ext;
>>   	struct extent_tree *et;
>> -	struct extent_node *en;
>>   	struct extent_info ei = {0};
>>   
>>   	if (!__may_extent_tree(inode, EX_READ)) {
>> @@ -435,21 +433,7 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
>>   	if (atomic_read(&et->node_cnt) || !ei.len)
>>   		goto skip;
>>   
>> -	if (IS_DEVICE_ALIASING(inode)) {
>> -		et->largest = ei;
>> -		goto skip;
>> -	}
>> -
>> -	en = __attach_extent_node(sbi, et, &ei, NULL,
>> -				&et->root.rb_root.rb_node, true);
>> -	if (en) {
>> -		et->largest = en->ei;
>> -		et->cached_en = en;
>> -
>> -		spin_lock(&eti->extent_lock);
>> -		list_add_tail(&en->list, &eti->extent_list);
>> -		spin_unlock(&eti->extent_lock);
>> -	}
>> +	et->largest = ei;
> 
> Previously, we can split largest extent node to two if we punched it, now
> we can not? IIUC.

Prior to this change, the largest extent could also be shrunk, so the
set of scenarios that need handling during punch remains identical
before and after the modification.

For the largest extent, it only needs to guarantee that the mapping
information it records stays consistent with the mappings tracked in the
extent tree and multi-level indirect indices. The punch operation does
not break this consistency. Moreover, the largest extent is not required
to be the longest extent among all entries in the extent tree. It merely
needs to match the mappings stored in multi-level indirect indices and
be no smaller than the maximum extent present in the extent tree.

Thanks
Yongpeng,


> 
> Thanks,
> 
>>   skip:
>>   	/* Let's drop, if checkpoint got corrupted. */
>>   	if (f2fs_cp_error(sbi)) {
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
