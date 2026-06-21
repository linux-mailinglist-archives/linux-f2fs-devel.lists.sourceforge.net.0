Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hnQGKY0POGr/XQcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 21 Jun 2026 18:21:33 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC38C6AB40D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 21 Jun 2026 18:21:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Q5ij8nv2;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=MVakrFDq;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Hy1KIUYp;
	dkim=fail ("body hash did not verify") header.d=outlook.com header.s=selector1 header.b=NFcB+kMY;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=outlook.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SV1ltrOrU6WaJu/kcefilDH4bAmGNrtXzmWczzwGavY=; b=Q5ij8nv2Ub8noak4h/H09/WOqO
	mjd87HBOT5qC5p669W7d24JoVX645gmi2S1Nm2sjypgJewWCsGqYsvHgT8EVGqVVFr8KU4U+0f61w
	EUR01Xte2gNBDEzLMHuBRYzvGi0myW8E895SFJuO/5Y89Wba2qSrj1/Vzc5iguWLLPaI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbKvC-00058a-CO;
	Sun, 21 Jun 2026 16:21:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1wbKvB-00058T-1a for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 21 Jun 2026 16:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KHjfeWkVaBC7hOJF/rGDOgQWy5MsS1djz+XDAzVsMfE=; b=MVakrFDqvrFmNtUtlBp/FFRi85
 PrvCto9QEVnpDTEiCZoi2ZycFq3ghiNiGQlKdGXoeKTdpDp0VtRrSQbtQI6S4V9nZHRA2uGgKezJE
 qxbolBx87pEiNeIl9RK8frenW3KNCCHcIuOoyOfNehbokotNe42kNXOpOU9aVpvqXP20=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KHjfeWkVaBC7hOJF/rGDOgQWy5MsS1djz+XDAzVsMfE=; b=Hy1KIUYpi+Dt6qOt5h8Uac96UT
 m9nzOydgKINAS9SheRgqAlcP1DdGLbflTmSQIMrx4VziZI68gYEzsUaNbcyZknOQowW0DdhGe/aqk
 6yLM/JH5nE/IFe6z1leuZgGi9LVluKF/B58UXridSUlRwG/6fOmISVnPDAq7ef2vfvS8=;
Received: from mail-koreacentralazolkn19013077.outbound.protection.outlook.com
 ([52.103.74.77] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbKv9-0007nh-GQ for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 21 Jun 2026 16:21:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocY1WtiHaPOsaKcz4UsA2UTUNpukgwpajC0ynZAgyhnyK4r6aTNGt3v6g589EJBrsbiKMZJLi36FQ0Nj894HNJiVMQZZAfsL9YtXwe2GmlX20URrvD/CBCWBS3nY3nWR1m08QXWigXn0kiGTaaCTycUe8IH5LttWwkl3Np0GRlGawAqCm8I7L7se64zVvwnUn248vwHVnSyXhmuQOXdoRnug2g4G9shea0VsJf5sFiXa1v05R8dFAnZTNxdDOlgsd+Q9qTcxemql1FQ7OjertwaPB1T1zkwxqS0KbW/08jl9t3LEy4Ezhc6wJP0JhtG89MQThxhaUh1gtg3tJ4b++Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHjfeWkVaBC7hOJF/rGDOgQWy5MsS1djz+XDAzVsMfE=;
 b=HdxLmOQX7OCjccRUBb3A5ZHK81otK6UxuYLko1ianKEV9y8+7jhJY7VH3rVZ32eY3ZTqlEs9f7Cv4ogenybi4kspulJpnBoqlqnCCsezYkq0st+3IkKLNfNBo8+qn+a51EVHBqj8AgkCegnjz6HdQ4Ji9qiHt7JWIKhTC+L33e6zgcJY+OBXNpXa45c8uFvak1unetR/nbEBBo9hoHnXJ8MNqWgmd87NBNqLDTGKSs7VTKfTsJVNIj8pnRl5S2srHHQBqWl+ac5R4ewWzKF01RdRwx5+AupBa+J2MqPiN/52MwjaEyZWfQCCXoIIO85v0vtPexWk3DSsPjgyYdmTBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHjfeWkVaBC7hOJF/rGDOgQWy5MsS1djz+XDAzVsMfE=;
 b=NFcB+kMYB8I74RohRUHJVH604fazULgjBTQp8tjCH/xliQQGjqanKoW1cTLQAEeuivMM37/MVlG6nOWWV9ixq78JggONcO4TojhQ62DpC5iFKN1MkknDFXR/y+DW8EzFioxCzO3WqABRSDHXuMzTUQmOCtSKxjPAANCis4FkhsZkVdtrEqseOJk8fotm5Z1qptr4ka+AS19yxZN8AoXnYytptO0XPerl5ZnlIkIc3FH179xNi0A4LO7WB3m3d2kaHF+mQ99t0lKOzP+tLJisleS99PA2fqn66jdT1Vj0Cg2EvSJQRGqPOEWCUDbufqhiSmjQBH6HQ2nwKKZNmFeZtw==
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com (2603:1096:101:4e::13)
 by JH0PR02MB7999.apcprd02.prod.outlook.com (2603:1096:990:98::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Sun, 21 Jun
 2026 16:21:04 +0000
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72]) by SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72%6]) with mapi id 15.21.0139.018; Sun, 21 Jun 2026
 16:21:03 +0000
Message-ID: <SEZPR02MB5662D6AB72C58571F587934899E02@SEZPR02MB5662.apcprd02.prod.outlook.com>
Date: Mon, 22 Jun 2026 00:20:59 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-6-yangyongpeng.storage@gmail.com>
 <8738e84f-6fef-479d-a100-7df0e130f75a@kernel.org>
 <ajAfmEHCgHAh1E0I@google.com>
 <SEZPR02MB56627B7C417379E9209FF87799E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
 <f1be7e7e-7cd1-4ab0-ad91-9228ddda0553@kernel.org>
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
In-Reply-To: <f1be7e7e-7cd1-4ab0-ad91-9228ddda0553@kernel.org>
X-ClientProxiedBy: TPYP295CA0041.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::19) To SEZPR02MB5662.apcprd02.prod.outlook.com
 (2603:1096:101:4e::13)
X-Microsoft-Original-Message-ID: <980df92e-e715-42d1-8026-2738928ce84c@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5662:EE_|JH0PR02MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: a8028f0f-2b40-4961-b597-08decfb1171a
X-MS-Exchange-SLBlob-MailProps: vuaKsetfIZn9IFDOZRHBr3PkJ6iE+FIkxKUcROmqaucl/Etp9duqxDp5F3ypQfX8mgn1RzkMJsGbnsKz0OyBuwMyOnHGVqVvOLAmI6dajDYbUWHaniGK/xyFXyO3P0tCh+THlI948VWjvIcFKyXCpDs90oD3nGVABVSk73zXX0ZNQTxKxs2CK15kofy5bNJm+S0Jmw2PkV5M58DqIIrbwUbrcREWkyrtiWVp1964UwEinBlroKgCIAMgSctDhNL5V+8VSrjrIcOvx3udLIOUBqnSxypWZmz0P98pQ4mR34pWKxQt+tq215qJq8EjXeqDm3/7VTNjSavBwql+gTJ+SLKXPJOadTiwn+26/po9u0KbU+rktJ/EFzelkNuoT1a6QF+SCsOqvteYNj7u+6npao7zrYb7wEFzeTuJ22oFWQVx9+g0r/bDqneItSbnSaj9RpR4XRq2xRd+tZR5Q1Wt3OT29Ep4XUQpYuLZPVdwx2dGW1NRf2S3SMVFwK4uScPZ/bCrWCiTC7yEicjwrT81unP0g9s0rGo3s6DLO1C16fv2rzeV4M9W3PS6sRLumu3ABo/eIL0UnfFIOGbAaLmiy954u8w5ZFEYtQPZIK61TOy+gUxuYzTAyFBL7q2OAtdL9lUPccDJNi2IpeTJ0KFFXOdrtsOznkg27HG87Pt32bAHn3pqvRaEkpWrgIYRFbgXKsKrbLz1HBYRZ3FA89ueeZrp0bP9OM/EyAMCaggMm6iY5qJO9oqpH0GyDNecsT5Ko2SvaISXJAvfVsJEj8RK38eK2qeESNuYljt01nrJmyHRHgIfxPKra5lzip/go5DY
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|51005399006|7042599007|15080799012|24121999003|5072599009|22091999003|41001999006|12121999013|6090799003|45011099003|23021999003|8060799015|19110799012|25010399006|10035399007|3412199025|440099028|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUxDMGhmeTJoTmJlV01PdWh4dFF3K3pxS1lEM3Q0aTZlRzlLTzhWZjQ3OWZj?=
 =?utf-8?B?TVBFblgrUXJsbEpmdEVFWmFJeVc0VG56WDdSYUhKMUFYOXVPellySXZlcFFv?=
 =?utf-8?B?aUdWTjJmZlkvdHFTTld0RlJhdEVUWmdKNC83UExobDFOd0VrZndPcWUvYXhB?=
 =?utf-8?B?b0xtVUFpOURjcys0cERndXpub2JiTC9OUS9vU0IyMmhrenZBa1pWQktKK3Zz?=
 =?utf-8?B?bXFadDZBSlM3RFZ5b25Qd0l4OUlDRFl3V0tNb0Z5Z1A3RGZSZE5IWnhtbkFu?=
 =?utf-8?B?S3dobGNQOUtYSERhUEZYeXkrZ29DQi80Z3l4emlTOTZjL0IvOHJ1cmhSZDNl?=
 =?utf-8?B?azFuUU5MRWF5VkF0M3FXN1Uwb1NFRTM0azQzN2V5YkdUMXlhVEFxbjM5dTZk?=
 =?utf-8?B?SEE3ZnM2clZqRWFFYlFYeGcyMW9NK095YkZjVUJQOXF5ZTA5Zk0rTGRWb0hT?=
 =?utf-8?B?U2s4dE02ZlFhNlhpYlZaTnYwZDAycE9tVDYycnJrWTJSZzN5QTMxTzQrdC91?=
 =?utf-8?B?SENWS2YvbXVaN0RlK2VpOUx0eHo5dU9OMDlPTmFOVVNnc0IwUE92VGZHTFF6?=
 =?utf-8?B?T2syZnFyQTU1WExHQVR1blRQaythamY4VTBRVHlHOXU5YW5GNkhjaDYrOHRV?=
 =?utf-8?B?LzNYOG9oWUpiQ2dqK1dSdlJ4d3BzUVpmMzRNZjAyemRRVktXMVo5RnBhQUZ2?=
 =?utf-8?B?TDZpL2tuczdKSWJZNTZPQ09vM1UzdG5zNEQranJxdjJJQTJJZENGc2haZ1Rw?=
 =?utf-8?B?TlB0NzFRTHdLdVppS21XMm9jZk5LQ1hnUURzSjZuZHVvbzRWcFFFN0ZVQlIy?=
 =?utf-8?B?S3o2ZGs2RXhhQWQ1N0VubWdWZTZTWUY5RUR0eGdnY3dKWUZwVUhuTUdZQnl6?=
 =?utf-8?B?MnNZbk94bkx0WnpjUjRwZVB3SnFRUWRta3BaOGg2eWEwVTFJNzNTQnd4SmlE?=
 =?utf-8?B?UTFZVUNGd1B2SDNqb2ZZbjMxSlQ5dEIwSGtzN2pxTUNRa2V5aDFRbTl3VG40?=
 =?utf-8?B?S2srbHNGMXlkVVAyc3Q2ZUdLbDl0SXdxV1pWNFRLbG5jMUpIank2bTBSUkxO?=
 =?utf-8?B?TFBSRHZuczF3RmRzNURqQ25yK0h1c016M3h2bXR2MUVEMllsZkVuV0xXSEdJ?=
 =?utf-8?B?TjAwdHBLWkV4em9TUHQrc05CSTJFVlJXTHRVN2dsaXNhNnphREU2YzFLYmYv?=
 =?utf-8?B?aVJMUUxPb0ZjaEJnVmpjejVydkRUejkybXU5L0g4ZlNTR1VYVm1FOXZRajZP?=
 =?utf-8?B?RzBnZ2dmcUhaZGs0czVYTy84bW93WWpRdENWaHNwVURwelR1YytNOElCYWZH?=
 =?utf-8?B?a1lRdk9NeEtjRGsrRjQvN2FzWFY3TnNNOHFWSEd2Szg2OEFPMVkyeGVUOTlN?=
 =?utf-8?B?N3dPTUt1bWgreHB5QkdsM2FiZ1I5Mlhja2J5b0J4V1NILytPRDVGQmdDNjc1?=
 =?utf-8?B?eGR5QWIxQWk2ajRlS0paN1EwZ0U4ampNU3I2ZVlWMnhkckUrbEZIU1VwTmlN?=
 =?utf-8?B?bWJLQTdTVWRwZ1JPYTk3bHlYdUxpTGxNNC9WQ0lqQ1VKT0NCdWZQU2pMc0lX?=
 =?utf-8?Q?VzQByF0JQ1TBmhWrYltbEn4zUJLz6vVPwyBXxxPZkAS78C?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmFJSUhTWTFrVVNVTTVBOElNbkI0MlVHZ3FKYmtRcnU3YkZPWlVUbmVvUVIz?=
 =?utf-8?B?N0htdzdSNHhxTzYyaFR2MU1uQ1pDYnB0N25LcnV6U21BZThyQXR0SC83TjU5?=
 =?utf-8?B?eW53dk83cGhlWFVCb1JkTkFEVVIyMU9jYU9sYitxeElRdVBTYWtnUlRUQkto?=
 =?utf-8?B?ZjFVbFdpMmxUUVUzWlRZTXdjdDVBckk4YTQvR0pCWjgrbjJFTmQrVFFkOEFp?=
 =?utf-8?B?ajdPSDV2TTNaS3cwdlZQNkc0Q1EvTVk5SW11QldGdC84NU5qU2FaL2dWaUFy?=
 =?utf-8?B?YmhHekczcmIzWW9MdTdKYUxHdXBoeGttWEh2OWdobDB1Y3dmMHozcEZ3WTBT?=
 =?utf-8?B?TzhmTTROWUpWZEhHUWtwVlU4MTAxV1RWeHBTZGxIVkV0NzFPQmd0cjBaYURC?=
 =?utf-8?B?MUptTC83U3QrUVYwbDIxNmpZNktocHlPV1pZVGU1RzVnUDZYdXcxUGxwMDQ3?=
 =?utf-8?B?a2cvelZ1SGdUTlZiaXZpbEVCVkRiVURFbU9FSjRiRmlpUFdxR0Y1N1BrczRV?=
 =?utf-8?B?WUNGQzRPQ1ZEcFBKOVpLSVRuSTNDQjVrRlY1elRUT3d5RGNoV3B5SW1ENjlw?=
 =?utf-8?B?cE0zc0xtZGZPSlZ0MGVXR0gvM2s5aTE4ZC9rK2hsK3pmaUhHbmswZ1ZVZzI2?=
 =?utf-8?B?WC9CSkJVK2RRM282NnpZb04yWDRMd0JCK05IeWdvUjhtazAyQTNDRXRzdU5I?=
 =?utf-8?B?aVhEQitFUzNJNWFiaXd1WGo3OEZxM3ZTVGo1TGY1d2piRmVtbGlEZzZ3bUk4?=
 =?utf-8?B?S21JVG5scDhGNHAzVFZhN1Y1eXRKcGNXeDRuZ2hneHNzalEwUGFlMmpiby9x?=
 =?utf-8?B?NWZIdVRucmhSVjFDRU50V3BEL002N3UxR0dHZkQ4bXVyODZRb09hVjVSUHRV?=
 =?utf-8?B?czlncDJrK05HaS8va1JxbGlYUmhwR2Z6Y3JzSndMdTR2bmxXZndTY1dHRSsw?=
 =?utf-8?B?THhZZXpXK0haZ20yUmhMNWpBVVJmaUROc0pXazhRNXVHQk9oRXUrS3NmZjd4?=
 =?utf-8?B?SU1lTFlRcGtGYlBGaEh5VVBMYUxUcC9UWm9HRUpYZUpJa0lqTjVvY2Zqa0Vk?=
 =?utf-8?B?QkY4NnozY0JNMTl6MVVXSzg5bEU4cVVTUkh5eHQ3d1dGRU9Xc1orL1A2bzdP?=
 =?utf-8?B?N1RDamxvRFZrSTRGb3hmbjk1Y0hjbHVNUEY2alRJTExUekp5QTA4TkY0OFUw?=
 =?utf-8?B?cUM1RGFqS3Y3cDNNbFE4dU80a0tOTWlaMkxocSsvMmk5Y2ZhLzF2MWFFN2h5?=
 =?utf-8?B?STFHVjh6QzlHNHpLQmQrck80RVYwZU9kSTNQL2JPc0ZZRSt5QXJqT1JMTVRp?=
 =?utf-8?B?NzRTVkF0SGhONTF2L20vTllqS1lWekRidGpRSEZYb1EzcktVeDBZSzd6RDE1?=
 =?utf-8?B?Q0E4cW1kU2xMVmZSL1NJdU5zbHA2U0FjR1A3QjNkUGVBYldIYVR3T1ZCSTFu?=
 =?utf-8?B?Rm8rWVBYU2FHZXo1ZDcvenYxeTkySjl1NXNXRS9HMURJL0xLQmc2NUlBK3Jq?=
 =?utf-8?B?UXEzS0creGo4MFd0Z29XM1hvQVkrZGdlL2d2d3huVGxFZ2JNN3djdWE1NUFa?=
 =?utf-8?B?SlpGY044aW4rTzJOYkx1WWtmNlhFSncyanl0MnZmSDFKOHJnUTN0cHdYWGpm?=
 =?utf-8?B?MCthazNuRXYreDRyRkNxdnRSbG9lQTYzRS9ONFlBTlZNYXZwUkhzOEV3NUpK?=
 =?utf-8?B?aGZ1Z210cWhBNGJYQVRuOFZGc21lU3VxZFhHeXlDdG15N21EZ3NCQ3R4L2Fw?=
 =?utf-8?B?K3BBNnVMWFNnR3RXNFZBeTkwSXYxWEJyV1Z3RGZ6NWMzVWRsTzIzQk9Tak9w?=
 =?utf-8?B?VjlsSnRzT1RmcXVEUlYreU92am51aXF1RzdhWjdPdmhub1V3THl6ZlBVOHlI?=
 =?utf-8?B?VVNsQlh6cmU2THJpZmdjcm9iY2Zra1k5dndGaU1ZdGtaV2xYdHdBaHhsSTE1?=
 =?utf-8?B?MjB2WllGVHA3SG0xMmpZN2p6N3NtSEVxTHVPTEdURFB2WWpyTFc4ZjZ6NTMx?=
 =?utf-8?Q?51KnbOXigmAqmGW37oyqZWBe76MEos=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8028f0f-2b40-4961-b597-08decfb1171a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5662.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2026 16:21:03.8599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB7999
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/20/26 3:05 PM, Chao Yu via Linux-f2fs-devel wrote: >
 On 6/19/26 22:56, Yongpeng Yang wrote: >> >> On 6/15/26 11:51 PM, Jaegeuk
 Kim via Linux-f2fs-devel wrote: >>> On 06/15, Chao Yu via Linux-f2fs [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)outlook.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.103.74.77 listed in wl.mailspike.net]
X-Headers-End: 1wbKv9-0007nh-GQ
Subject: Re: [f2fs-dev] [PATCH RESEND 5/5] f2fs: add ioctl to export read
 extent cache to userspace for debug
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
X-Rspamd-Queue-Id: AC38C6AB40D

T24gNi8yMC8yNiAzOjA1IFBNLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+
IE9uIDYvMTkvMjYgMjI6NTYsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+Cj4+IE9uIDYvMTUvMjYg
MTE6NTEgUE0sIEphZWdldWsgS2ltIHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4gT24g
MDYvMTUsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+Pj4gT24gNi8xMi8y
NiAxOTo1OCwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4+Pj4gRnJvbTogWW9uZ3BlbmcgWWFuZyA8
eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Pj4+Cj4+Pj4+IEFkZCBGMkZTX0lPQ19HRVRfUkVB
RF9DQUNIRV9FWFRFTlRTIGlvY3RsIHRoYXQgYWxsb3dzIHVzZXJzcGFjZSB0bwo+Pj4+PiByZXRy
aWV2ZSBhbGwgY2FjaGVkIHJlYWQgZXh0ZW50cyBmb3IgYSBnaXZlbiBmaWxlLiBUaGlzIHVzZXMg
YSB0d28tIAo+Pj4+PiBjYWxsCj4+Pj4+IHBhdHRlcm4gc2ltaWxhciB0byBmaWVtYXA6IHRoZSBm
aXJzdCBjYWxsIHdpdGggZXh0X2NvdW50PTAgcXVlcmllcyB0aGUKPj4+Pj4gbm9kZV9jb3VudCwg
YW5kIHRoZSBzZWNvbmQgY2FsbCBmZXRjaGVzIHRoZSBhY3R1YWwgZXh0ZW50IGVudHJpZXMuCj4+
Pj4KPj4+PiBJdCBsb29rcyBhIGxpdHRsZSBiaXQgaGVhdnkgdG8gbWFpbnRhaW4gYSBkZWJ1ZyBw
dXJwb3NlIGlvY3RsIAo+Pj4+IGludGVyZmFjZS4KPj4+Pgo+Pj4+IE1heWJlIHNldCBpbm8gdmlh
IHN5c2ZzIGFuZCBkdW1wIGV4dGVudCBjYWNoZSB2aWEgcHJvY2ZzPyBvbmx5IGVuYWJsZWQKPj4+
PiBpZiBGMkZTX0NIRUNLX0ZTPXk/Cj4+Pj4KPj4+PiBKYWVnZXVrLCBkbyB5b3UgaGF2ZSBhbnkg
c3VnZ2VzdGlvbj8KPj4+Cj4+PiBBZ3JlZWQsIGFuZCBldmVuIG5vdCBzdXJlIHdlIG5lZWQgc3lz
ZnMgb3IgcHJvY2ZzLiBDYW4gd2UgZHVtcCB0aGUgCj4+PiBleHRlbnRzCj4+PiB2aWEgZnNjaz8K
Pj4KPj4gSXQgaXMgaW5kZWVkIHF1aXRlIGhlYXZ5LiBPdXIgcHJpbWFyeSBnb2FsIGhlcmUgaXMg
ZGVidWdnaW5nIGlub2RlCj4+IGV4dGVudCB0cmVlcywgYW5kIGZzY2sgY2Fubm90IG1lZXQgdGhp
cyByZXF1aXJlbWVudC4gSWYgd2UgcmVseSBvbgo+PiBwcm9jZnMgb3Igc3lzZnMgaW50ZXJmYWNl
cywgd2Ugd291bGQgaGF2ZSB0byBvcGVuIGRlZGljYXRlZCBmaWxlcyB3aXRoaW4KPj4gc3lzZnMu
Yywgd2hpY2ggZmVlbHMgbGlrZSBhbiBpbmFwcHJvcHJpYXRlIGFwcHJvYWNoLgo+IAo+IGNhbGwg
YWNjZXNzKCkgaW4gdXNlcnNwYWNlIGFwcGxpY2F0aW9uIG9yIHRvdWNoIGluIHNjcmlwdCB0byBs
b2FkIGlub2RlIHZpYQo+IGxvb2t1cCgpIGZpcnN0LCB0aGVuIGFjY2VzcyBzeXNmcyBhbmQgcHJv
Y2ZzIG5vZGU/CgpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLCB0aGlzIGlzIG1vcmUgbGlnaHR3
ZWlnaHQuIEknbGwgbW9kaWZ5IGl0IGluCnYyIHBhdGNoLgoKVGhhbmtzCllvbmdwZW5nLAoKPiAK
PiBUaGFua3MsCj4gCj4+Cj4+IFRoYW5rcwo+PiBZb25ncGVuZywKPj4KPj4+Cj4+Pj4KPj4+PiBU
aGFua3MsCj4+Pj4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFu
Z3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiDCoCBmcy9mMmZzL2V4dGVudF9j
YWNoZS5jwqDCoMKgIHwgNzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyAKPj4+
Pj4gKysrKysKPj4+Pj4gwqAgZnMvZjJmcy9mMmZzLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCAzICsrCj4+Pj4+IMKgIGZzL2YyZnMvZmlsZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEx
ICsrKysrKwo+Pj4+PiDCoCBpbmNsdWRlL3VhcGkvbGludXgvZjJmcy5oIHwgMjEgKysrKysrKysr
KysrCj4+Pj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwgMTA1IGluc2VydGlvbnMoKykKPj4+Pj4KPj4+
Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMgYi9mcy9mMmZzL2V4dGVudF9j
YWNoZS5jCj4+Pj4+IGluZGV4IGUxNDFmZmI2NGU1Zi4uMGMxMGQ1NjM5ZDY4IDEwMDY0NAo+Pj4+
PiAtLS0gYS9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZXh0ZW50
X2NhY2hlLmMKPj4+Pj4gQEAgLTE0LDYgKzE0LDcgQEAKPj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4
L2ZzLmg+Cj4+Pj4+IMKgICNpbmNsdWRlIDxsaW51eC9mMmZzX2ZzLmg+Cj4+Pj4+ICsjaW5jbHVk
ZSA8dWFwaS9saW51eC9mMmZzLmg+Cj4+Pj4+IMKgICNpbmNsdWRlICJmMmZzLmgiCj4+Pj4+IMKg
ICNpbmNsdWRlICJub2RlLmgiCj4+Pj4+IEBAIC0xMjY3LDYgKzEyNjgsNzUgQEAgc3RhdGljIHZv
aWQgX19pbml0X2V4dGVudF90cmVlX2luZm8oc3RydWN0IAo+Pj4+PiBleHRlbnRfdHJlZV9pbmZv
ICpldGkpCj4+Pj4+IMKgwqDCoMKgwqAgYXRvbWljX3NldCgmZXRpLT50b3RhbF9leHRfbm9kZSwg
MCk7Cj4+Pj4+IMKgIH0KPj4+Pj4gK2ludCBmMmZzX2dldF9yZWFkX2NhY2hlX2V4dGVudHMoc3Ry
dWN0IGlub2RlICppbm9kZSwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGYy
ZnNfcmVhZF9jYWNoZV9leHRlbnQgX191c2VyICp1YXJnKQo+Pj4+PiArewo+Pj4+PiArwqDCoMKg
IHN0cnVjdCBleHRlbnRfdHJlZSAqZXQgPSBGMkZTX0koaW5vZGUpLT5leHRlbnRfdHJlZVtFWF9S
RUFEXTsKPj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZjJmc19jYWNoZV9leHRlbnRfaW5mbyAqa2J1ZiA9
IE5VTEw7Cj4+Pj4+ICvCoMKgwqAgc3RydWN0IGYyZnNfY2FjaGVfZXh0ZW50X2luZm8gbGFyZ2Vz
dCA9IHt9Owo+Pj4+PiArwqDCoMKgIHN0cnVjdCByYl9ub2RlICpub2RlOwo+Pj4+PiArwqDCoMKg
IHN0cnVjdCBleHRlbnRfbm9kZSAqZW47Cj4+Pj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IGNhcGFj
aXR5LCBjb3VudCA9IDA7Cj4+Pj4+ICvCoMKgwqAgX191MzIgZmxhZ3MgPSAwOwo+Pj4+PiArwqDC
oMKgIGludCByZXQgPSAwOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgaWYgKGdldF91c2VyKGNhcGFj
aXR5LCAmdWFyZy0+ZXh0X2NvdW50KSkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUZB
VUxUOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBG
SV9OT19FWFRFTlQpKQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZmxhZ3MgfD0gRjJGU19FWFRfRkxf
Tk9fRVhURU5UOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgaWYgKCFldCB8fCAoZmxhZ3MgJiBGMkZT
X0VYVF9GTF9OT19FWFRFTlQpKSB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocHV0X3VzZXIo
MFUsICZ1YXJnLT5leHRfY291bnQpIHx8Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHB1
dF91c2VyKGZsYWdzLCAmdWFyZy0+ZmxhZ3MpIHx8Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHB1dF91c2VyKDBVLCAmdWFyZy0+bm9kZV9jb3VudCkpCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRUZBVUxUOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7
Cj4+Pj4+ICvCoMKgwqAgfQo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgaWYgKGNhcGFjaXR5KSB7Cj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBrYnVmID0gZjJmc19rdm1hbGxvYyhGMkZTX0lfU0IoaW5vZGUp
LCBjYXBhY2l0eSAqIAo+Pj4+PiBzaXplb2YoKmtidWYpLCBHRlBfS0VSTkVMKTsKPj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGlmICgha2J1ZikKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIC1FTk9NRU07Cj4+Pj4+ICvCoMKgwqAgfQo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgcmVhZF9s
b2NrKCZldC0+bG9jayk7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCBsYXJnZXN0LmZvZnMgPSBldC0+
bGFyZ2VzdC5mb2ZzOwo+Pj4+PiArwqDCoMKgIGxhcmdlc3QuYmxrID0gZXQtPmxhcmdlc3QuYmxr
Owo+Pj4+PiArwqDCoMKgIGxhcmdlc3QubGVuID0gZXQtPmxhcmdlc3QubGVuOwo+Pj4+PiArwqDC
oMKgIGxhcmdlc3QubGFzdF9hY2Nlc3NfbW9kZSA9IGV0LT5sYXJnZXN0Lmxhc3RfYWNjZXNzX21v
ZGU7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCBmb3IgKG5vZGUgPSByYl9maXJzdF9jYWNoZWQoJmV0
LT5yb290KTsgbm9kZTsgbm9kZSA9IAo+Pj4+PiByYl9uZXh0KG5vZGUpKSB7Cj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBpZiAoY291bnQgPj0gY2FwYWNpdHkpCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGJyZWFrOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZW4gPSByYl9lbnRyeShub2RlLCBz
dHJ1Y3QgZXh0ZW50X25vZGUsIHJiX25vZGUpOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBrYnVmW2NvdW50XS5mb2ZzID0gZW4tPmVpLmZvZnM7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBr
YnVmW2NvdW50XS5ibGsgPSBlbi0+ZWkuYmxrOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAga2J1Zltj
b3VudF0ubGVuID0gZW4tPmVpLmxlbjsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGtidWZbY291bnRd
Lmxhc3RfYWNjZXNzX21vZGUgPSBlbi0+ZWkubGFzdF9hY2Nlc3NfbW9kZTsKPj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGNvdW50Kys7Cj4+Pj4+ICvCoMKgwqAgfQo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAg
cmVhZF91bmxvY2soJmV0LT5sb2NrKTsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIGlmIChjb3VudCAm
JiBjb3B5X3RvX3VzZXIodWFyZy0+ZXh0ZW50cywga2J1ZiwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY291bnQgKiBzaXplb2YoKmtidWYpKSkgewo+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgcmV0ID0gLUVGQVVMVDsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gb3V0
Owo+Pj4+PiArwqDCoMKgIH0KPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIGlmIChwdXRfdXNlcihjb3Vu
dCwgJnVhcmctPmV4dF9jb3VudCkgfHwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHB1dF91c2VyKGZs
YWdzLCAmdWFyZy0+ZmxhZ3MpIHx8Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBwdXRfdXNlcigodTMy
KWF0b21pY19yZWFkKCZldC0+bm9kZV9jbnQpLCAmdWFyZy0gCj4+Pj4+ID5ub2RlX2NvdW50KSB8
fAo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgY29weV90b191c2VyKCZ1YXJnLT5sYXJnZXN0LCAmbGFy
Z2VzdCwgc2l6ZW9mKGxhcmdlc3QpKSkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IC1FRkFV
TFQ7Cj4+Pj4+ICtvdXQ6Cj4+Pj4+ICvCoMKgwqAga3ZmcmVlKGtidWYpOwo+Pj4+PiArwqDCoMKg
IHJldHVybiByZXQ7Cj4+Pj4+ICt9Cj4+Pj4+ICsKPj4+Pj4gwqAgdm9pZCBmMmZzX2luaXRfZXh0
ZW50X2NhY2hlX2luZm8oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4+PiDCoCB7Cj4+Pj4+
IMKgwqDCoMKgwqAgX19pbml0X2V4dGVudF90cmVlX2luZm8oJnNiaS0+ZXh0ZW50X3RyZWVbRVhf
UkVBRF0pOwo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMu
aAo+Pj4+PiBpbmRleCAxNTg4YjY0ZDA0YTMuLjY5NjQxZmMzMWM1MSAxMDA2NDQKPj4+Pj4gLS0t
IGEvZnMvZjJmcy9mMmZzLmgKPj4+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4+Pj4gQEAgLTI2
LDYgKzI2LDcgQEAKPj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L3BhcnRfc3RhdC5oPgo+Pj4+PiDC
oCAjaW5jbHVkZSA8bGludXgvcndfaGludC5oPgo+Pj4+PiArI2luY2x1ZGUgPHVhcGkvbGludXgv
ZjJmcy5oPgo+Pj4+PiDCoCAjaW5jbHVkZSA8bGludXgvZnNjcnlwdC5oPgo+Pj4+PiDCoCAjaW5j
bHVkZSA8bGludXgvZnN2ZXJpdHkuaD4KPj4+Pj4gQEAgLTQ1OTAsNiArNDU5MSw4IEBAIHZvaWQg
ZjJmc191cGRhdGVfcmVhZF9leHRlbnRfY2FjaGUoc3RydWN0IAo+Pj4+PiBkbm9kZV9vZl9kYXRh
ICpkbik7Cj4+Pj4+IMKgIHZvaWQgZjJmc191cGRhdGVfcmVhZF9leHRlbnRfY2FjaGVfcmFuZ2Uo
c3RydWN0IGRub2RlX29mX2RhdGEgKmRuLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHBnb2ZmX3QgZm9mcywgYmxvY2tfdCBibGthZGRyLCB1bnNpZ25lZCBpbnQgbGVu
LAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudW0gZXh0ZW50X2Fj
Y2Vzc19tb2RlIGFjY2Vzc19tb2RlKTsKPj4+Pj4gK2ludCBmMmZzX2dldF9yZWFkX2NhY2hlX2V4
dGVudHMoc3RydWN0IGlub2RlICppbm9kZSwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RydWN0IGYyZnNfcmVhZF9jYWNoZV9leHRlbnQgX191c2VyICp1YXJnKTsKPj4+Pj4gwqAgdW5z
aWduZWQgaW50IGYyZnNfc2hyaW5rX3JlYWRfZXh0ZW50X3RyZWUoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgbnJfc2hyaW5rKTsK
Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPj4+Pj4g
aW5kZXggYTNhNWQ0OTllYWRmLi42NmVjOTkyN2Q2NjcgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2Yy
ZnMvZmlsZS5jCj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4+Pj4+IEBAIC0zNjcyLDYgKzM2
NzIsMTQgQEAgc3RhdGljIGludCBmMmZzX2lvY19wcmVjYWNoZV9leHRlbnRzKHN0cnVjdCAKPj4+
Pj4gZmlsZSAqZmlscCkKPj4+Pj4gwqDCoMKgwqDCoCByZXR1cm4gZjJmc19wcmVjYWNoZV9leHRl
bnRzKGZpbGVfaW5vZGUoZmlscCkpOwo+Pj4+PiDCoCB9Cj4+Pj4+ICtzdGF0aWMgaW50IGYyZnNf
aW9jX2dldF9yZWFkX2NhY2hlX2V4dGVudHMoc3RydWN0IGZpbGUgKmZpbHAsIAo+Pj4+PiB1bnNp
Z25lZCBsb25nIGFyZykKPj4+Pj4gK3sKPj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgaW5vZGUgKmlub2Rl
ID0gZmlsZV9pbm9kZShmaWxwKTsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIHJldHVybiBmMmZzX2dl
dF9yZWFkX2NhY2hlX2V4dGVudHMoaW5vZGUsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IChzdHJ1Y3QgZjJmc19yZWFkX2NhY2hlX2V4dGVudCBfX3VzZXIgKilhcmcpOwo+Pj4+PiArfQo+
Pj4+PiArCj4+Pj4+IMKgIHN0YXRpYyBpbnQgZjJmc19pb2NfcmVzaXplX2ZzKHN0cnVjdCBmaWxl
ICpmaWxwLCB1bnNpZ25lZCBsb25nIGFyZykKPj4+Pj4gwqAgewo+Pj4+PiDCoMKgwqDCoMKgIHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfSV9TQihmaWxlX2lub2RlKGZpbHApKTsKPj4+
Pj4gQEAgLTQ3NDQsNiArNDc1Miw4IEBAIHN0YXRpYyBsb25nIF9fZjJmc19pb2N0bChzdHJ1Y3Qg
ZmlsZSAqZmlscCwgCj4+Pj4+IHVuc2lnbmVkIGludCBjbWQsIHVuc2lnbmVkIGxvbmcgYXJnKQo+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGYyZnNfaW9jX2dldF9kZXZfYWxpYXNfZmls
ZShmaWxwLCBhcmcpOwo+Pj4+PiDCoMKgwqDCoMKgIGNhc2UgRjJGU19JT0NfSU9fUFJJTzoKPj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBmMmZzX2lvY19pb19wcmlvKGZpbHAsIGFyZyk7
Cj4+Pj4+ICvCoMKgwqAgY2FzZSBGMkZTX0lPQ19HRVRfUkVBRF9DQUNIRV9FWFRFTlRTOgo+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGYyZnNfaW9jX2dldF9yZWFkX2NhY2hlX2V4dGVudHMo
ZmlscCwgYXJnKTsKPj4+Pj4gwqDCoMKgwqDCoCBkZWZhdWx0Ogo+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIC1FTk9UVFk7Cj4+Pj4+IMKgwqDCoMKgwqAgfQo+Pj4+PiBAQCAtNTUwNiw2
ICs1NTE2LDcgQEAgbG9uZyBmMmZzX2NvbXBhdF9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlsZSwgCj4+
Pj4+IHVuc2lnbmVkIGludCBjbWQsIHVuc2lnbmVkIGxvbmcgYXJnKQo+Pj4+PiDCoMKgwqDCoMKg
IGNhc2UgRjJGU19JT0NfQ09NUFJFU1NfRklMRToKPj4+Pj4gwqDCoMKgwqDCoCBjYXNlIEYyRlNf
SU9DX0dFVF9ERVZfQUxJQVNfRklMRToKPj4+Pj4gwqDCoMKgwqDCoCBjYXNlIEYyRlNfSU9DX0lP
X1BSSU86Cj4+Pj4+ICvCoMKgwqAgY2FzZSBGMkZTX0lPQ19HRVRfUkVBRF9DQUNIRV9FWFRFTlRT
Ogo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4+IMKgwqDCoMKgwqAgZGVmYXVs
dDoKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PSU9DVExDTUQ7Cj4+Pj4+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvZjJmcy5oIGIvaW5jbHVkZS91YXBpL2xpbnV4
L2YyZnMuaAo+Pj4+PiBpbmRleCA3OTVlMjYyNTgzNTUuLjZmZjkwMDNiYzAzMCAxMDA2NDQKPj4+
Pj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2YyZnMuaAo+Pj4+PiArKysgYi9pbmNsdWRlL3Vh
cGkvbGludXgvZjJmcy5oCj4+Pj4+IEBAIC00NSw2ICs0NSw4IEBACj4+Pj4+IMKgICNkZWZpbmUg
RjJGU19JT0NfU1RBUlRfQVRPTUlDX1JFUExBQ0XCoMKgwqAgX0lPKEYyRlNfSU9DVExfTUFHSUMs
IDI1KQo+Pj4+PiDCoCAjZGVmaW5lIEYyRlNfSU9DX0dFVF9ERVZfQUxJQVNfRklMRcKgwqDCoCBf
SU9SKEYyRlNfSU9DVExfTUFHSUMsIDI2LCAKPj4+Pj4gX191MzIpCj4+Pj4+IMKgICNkZWZpbmUg
RjJGU19JT0NfSU9fUFJJT8KgwqDCoMKgwqDCoMKgIF9JT1coRjJGU19JT0NUTF9NQUdJQywgMjcs
IF9fdTMyKQo+Pj4+PiArI2RlZmluZSBGMkZTX0lPQ19HRVRfUkVBRF9DQUNIRV9FWFRFTlRTwqDC
oMKgIF9JT1dSKEYyRlNfSU9DVExfTUFHSUMsIAo+Pj4+PiAyOCzCoMKgwqAgXAo+Pj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZjJmc19y
ZWFkX2NhY2hlX2V4dGVudCkKPj4+Pj4gwqAgLyoKPj4+Pj4gwqDCoCAqIHNob3VsZCBiZSBzYW1l
IGFzIFhGU19JT0NfR09JTkdET1dOLgo+Pj4+PiBAQCAtMTA0LDQgKzEwNiwyMyBAQCBzdHJ1Y3Qg
ZjJmc19jb21wX29wdGlvbiB7Cj4+Pj4+IMKgwqDCoMKgwqAgX191OCBsb2dfY2x1c3Rlcl9zaXpl
Owo+Pj4+PiDCoCB9Owo+Pj4+PiArc3RydWN0IGYyZnNfY2FjaGVfZXh0ZW50X2luZm8gewo+Pj4+
PiArwqDCoMKgIF9fdTMyIGZvZnM7wqDCoMKgwqDCoMKgwqAgLyogc3RhcnQgZmlsZSBvZmZzZXQg
aW4gYmxvY2tzICovCj4+Pj4+ICvCoMKgwqAgX191MzIgYmxrO8KgwqDCoMKgwqDCoMKgIC8qIHN0
YXJ0IGJsb2NrIGFkZHJlc3MgKi8KPj4+Pj4gK8KgwqDCoCBfX3UzMiBsZW47wqDCoMKgwqDCoMKg
wqAgLyogbGVuZ3RoIGluIGJsb2NrcyAqLwo+Pj4+PiArwqDCoMKgIF9fdTMyIGxhc3RfYWNjZXNz
X21vZGU7IC8qIGxhc3QgYWNjZXNzIG1vZGUgb2YgZXh0ZW50X25vZGUgKi8KPj4+Pj4gK307Cj4+
Pj4+ICsKPj4+Pj4gKy8qIGZsYWdzIGZvciBmMmZzX3JlYWRfY2FjaGVfZXh0ZW50ICovCj4+Pj4+
ICsjZGVmaW5lIEYyRlNfRVhUX0ZMX05PX0VYVEVOVMKgwqDCoCAweDHCoMKgwqAgLyogZXh0ZW50
IGNhY2hlIGRpc2FibGVkIAo+Pj4+PiBmb3IgdGhpcyBpbm9kZSAqLwo+Pj4+PiArCj4+Pj4+ICtz
dHJ1Y3QgZjJmc19yZWFkX2NhY2hlX2V4dGVudCB7Cj4+Pj4+ICvCoMKgwqAgX191MzIgZXh0X2Nv
dW50O8KgwqDCoCAvKiBpbjogYXJyYXkgY2FwYWNpdHk7IG91dDogbWFwcGVkIGV4dGVudCAKPj4+
Pj4gY291bnQgKi8KPj4+Pj4gK8KgwqDCoCBfX3UzMiBmbGFnczvCoMKgwqDCoMKgwqDCoCAvKiBv
dXQ6IHN0YXR1cyBmbGFncyAqLwo+Pj4+PiArwqDCoMKgIF9fdTMyIG5vZGVfY291bnQ7wqDCoMKg
IC8qIG91dDogdG90YWwgZXh0ZW50IG5vZGVzIGluIHRyZWUgKi8KPj4+Pj4gK8KgwqDCoCBfX3Uz
MiByZXNlcnZlZDsKPj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZjJmc19jYWNoZV9leHRlbnRfaW5mbyBs
YXJnZXN0O8KgwqDCoMKgwqDCoMKgIC8qIG91dDogbGFyZ2VzdCAKPj4+Pj4gZXh0ZW50ICovCj4+
Pj4+ICvCoMKgwqAgc3RydWN0IGYyZnNfY2FjaGVfZXh0ZW50X2luZm8gZXh0ZW50c1tdO8KgwqDC
oCAvKiBvdXQ6IGV4dGVudCAKPj4+Pj4gYXJyYXkgKi8KPj4+Pj4gK307Cj4+Pj4+ICsKPj4+Pj4g
wqAgI2VuZGlmIC8qIF9VQVBJX0xJTlVYX0YyRlNfSCAqLwo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4gTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldAo+Pj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwKPj4+Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
Cj4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4gaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+Pgo+
IAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
