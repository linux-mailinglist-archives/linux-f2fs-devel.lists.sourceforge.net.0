Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wQ5MAgNQNWrtsQYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2026 16:19:47 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 121646A65DF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2026 16:19:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=d7M7aMcX;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=QLpTrYpj;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=OqT7pb6B;
	dkim=fail ("body hash did not verify") header.d=outlook.com header.s=selector1 header.b=l6YqS229;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=outlook.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTEsDtYiwZ/jfNqVzqJRx8eioNLuB25cRxJ6Y+ySwoc=; b=d7M7aMcXD7zuGzf/g8WFUdATt0
	/kDVoqL6OkyZoZPRRt0/w7EILJkj1DN87LHpXJo1qAu80hl9g7pDtEK8h6YGHhLkQSBDECwiqPirL
	4WJ5eGCZjRxM+jNL2b+Qiw46Q9NAGs4dh5FQG1bTOMsRZ6f8fpUujN5eLqf/v5Grds04=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1waa3z-0005t9-He;
	Fri, 19 Jun 2026 14:19:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1waa3i-0005rl-Tv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Jun 2026 14:19:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=poo9m4Vd5g2ris/SHS3sT9kBL/jxcytiCSjH2BxeQ3E=; b=QLpTrYpjN5ZPxmW82OcEMGYaHF
 k00K5jt0ljeORImhMsGZmjDFrKSPpBSP36utqxOfitj6DdfJkacM7feQ9WBqAgVWpNAYNNbYNAHic
 FzZny4+TN2lNioTklVoWaDJyZoqY4C51ax/5BJMf5Nav9AUqHXv8hdQVPDAFSDGFI9VE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=poo9m4Vd5g2ris/SHS3sT9kBL/jxcytiCSjH2BxeQ3E=; b=OqT7pb6BK4Q9RUTI0ZZ3+hLql3
 C0ln7CG7M8Vuf8E0twNn+txmNSJajMGgwWqxwAlcG9al81OsNmQczE0JE3iOKsfafo5MnwCQT+WSr
 yE/FsljQVmCxyQY/UpdevsaWuPCae5Cmfw4Sl88ioGwHFGKUUcQhz3vATA6YcHUZXVS4=;
Received: from mail-japaneastazolkn19013081.outbound.protection.outlook.com
 ([52.103.43.81] helo=TYDPR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1waa3h-0000rE-0F for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Jun 2026 14:19:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+q728FtrBCZBqIBqB4uBFH+g9GcO96/85otLcUclEqFsApogxJo32UOTlDxopkE6zE8tmHnperW2b5qGIlgvsa5C/435C7NOunDkNVoKlXIwrFCPla5u25X9SkkE3KYiR4f5vDLeu8v2L/mmttMWCtNYbBCWu0e2lW+cQ4+xgaJXtAxedMNrQH1mhEz3zjRLG3enYgfBLGCEol0DDRT4/ff7IScc/NkLkcveh2dlppr8A/kxv84L0I0grQqOo+PPbPO59CufIA4djHtZUP55UOwsBMigx5pL/a5KTuv3/yPpSTf+qXK2Dwy4OMlDYopc0sqh1dEzGNwNpbTG0Werw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poo9m4Vd5g2ris/SHS3sT9kBL/jxcytiCSjH2BxeQ3E=;
 b=P9LudtUNefSyP/DK8XJnSyy/ZxkOg7vkWjLmrp6HKRv1Ljic+SzVzlGz+ZVTRamPczGlBwbgYMqsOm5yDmxXNv6Keb6r0PR5LlVIY2Gfnmp1r607m8UIt2u3hmoxj2J4BEoHxoASeMW9mi52sC1/XduNH2BDMHQrcUQXHtSsbo9DcUlM0p3DBtpIxKC38muGqHmA1YsxW/wpCtj9hYp6Bgnb+53ZFtVgpYm4PoioW6VcDj/5S+t6NCS6/qc+Tw0WCRxLhitIMOWMfJMfyMUkdj6Jw3TYcGXt837Yynkc9jvcfc3oI+aydPUFqWEllD2rbQbcZWjouaw9teXRV6CurQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poo9m4Vd5g2ris/SHS3sT9kBL/jxcytiCSjH2BxeQ3E=;
 b=l6YqS22911BSZSq1EmR/GnHCz4reLa6JSJYTuTdQ6GM9AOsr5K+C7x7v2JNatEYiKtQt29tveXxm6zSDFn81kRlAkEDWo551GGhgPNFJHv/AKpxpwHk2Lw9m2eSrCb0yhETQy/Y25LC1ZcvjAEokq5fFpJqCmsNLpWzhf7zYP91ygv1DNtp8oRXY3U2/NhnfcIcwH8gg03HMb+t8mSSDPSe29t9lEsNto5VKFPnho3U7qVzpA3KVhKXHOzhsuTPqLswC6xLtcXSUD5mm+fMbZhzM7rEKHU5Yj1bbsvTf7rV2+nTaunrG++zKRSXunsvHP+z1zRKxd6gxg+TeVuGhFQ==
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com (2603:1096:101:4e::13)
 by KL1PR02MB7167.apcprd02.prod.outlook.com (2603:1096:820:116::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 14:18:47 +0000
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72]) by SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 14:18:47 +0000
Message-ID: <SEZPR02MB5662938F64BC1B413D39A53699E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
Date: Fri, 19 Jun 2026 22:18:42 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <77c78bad-dc2c-4681-b6db-b1ad1c115b0d@kernel.org>
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
In-Reply-To: <77c78bad-dc2c-4681-b6db-b1ad1c115b0d@kernel.org>
X-ClientProxiedBy: TPYP295CA0038.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::15) To SEZPR02MB5662.apcprd02.prod.outlook.com
 (2603:1096:101:4e::13)
X-Microsoft-Original-Message-ID: <6ef84cc4-b3e9-493c-b870-7a485aa7f1f9@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5662:EE_|KL1PR02MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: 814bab3f-8660-4e5a-c1f1-08dece0dace0
X-MS-Exchange-SLBlob-MailProps: vuaKsetfIZn9IFDOZRHBr3PkJ6iE+FIkEXk6eme6iJsuQAdFtJMA+Zz0pmZsXlCa0fuej/uvx7IN6UMcyjg1hIzaYQg5wASQn3WdcoGkwu0dKTRq16VmUSiHSr+HNGkOWT933cYAKILfuoCaa8OOE4ufE4d1O+76WDSslHLq8QVtEohdsS71YfXubmweyacGrEYQJy0dYJsjRImhEdIE0IgOm5iVKiyhC+NTH9h97Sdz37Fy9yNlJkEuXoLQ3kZYXHhCZmLSfpvmSKEJoBo6gQnakL1U9M+D7Ep1HiX2dlZ2I8ywF7B2v8pWZ8wRuQZN8Mhc7Cn9sD5UFBFVqNgJDDKDx0PB188Xtj6Y/1R9S15kRfWGi36ywZzfC4E+a646/L5BaPcd2cRtuXznT2HeVFZVNXv4zcmy+O2brfWjX0qnrCBLOWE/0jnhxTR1ihXwu8bWx9uQQDQPUR43cu0BXuKmlBtcl73vkO5+fJUOIxK+yTpCKAkR6G2xjX2UTp1P3ZkMg+Pc7T97NqcQpF0YuGuOMwf4+WBkVM7/qplobBkCxbT9AKJgVV8GehYziHP7ObOBlNZUwx2G5lnpN0sTMQ7+iBn4fk71LMRli0BtOsWNuFjMxatY6eYYTK+41aMZ5svUjaZ5pWLLoRxcS48b6FZE0lRWBLdJ6n2tEKNWNGaw+3Zi+ihAxt0aZWiKbgpmnkClxA1JRB2URaoPQtB/U5eqEeFOXc3ZMoJ5D/DKVv7DDLIgjYKmzvM96d31aHxm/3rApC1PVrghFom08wb1c82jRnRU9NTxG6FSAJjlRUyRJgM7URVbKMC7Dgemutnc
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|7042599007|19110799012|25010399006|5072599009|51005399006|8060799015|24121999003|22091999003|15080799012|23021999003|6090799003|45011099003|3412199025|440099028|40105399003|10035399007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEUyOVVMbDgwWXFZWmM1ZVhadCtiTFplSnNqUzVjeU8rOXU0UHFHK0tIVkR2?=
 =?utf-8?B?MFByYjkvb2x6VE92WERWL0c0RlJTOU1JaXJBZDJqb2JBZHJIZ1ovcnVYcUk2?=
 =?utf-8?B?MHBtRVBqNnlIakVQcGpKM1krL3BOOWdMOUVsUkhiQWxxc1Znam9wcnE0S1E2?=
 =?utf-8?B?cEZqSklnRVdPT1ZERnh0VE5KMXZzNzE5ZENadVU0aGhyY3F2dndjckRvZWhD?=
 =?utf-8?B?eWNrRExHOUd5dnljY2luNW9ic1dWMDJyUnRGYktNaEprbk12Znl1WElmcnZE?=
 =?utf-8?B?bjMvUWZaQVBTN3luT0dUMU9mWEdQUHRXcHFpWDZKWHNtUHlDdXhZdk0vYSsx?=
 =?utf-8?B?VVRIVzB6WllCL05vYVZJQndNZ0JBZ2xvQ3lIWGg2WHp4ZDM1NzUza041Y09L?=
 =?utf-8?B?QmRtVEdNRlk0b3NUMW9vOURaNmNQQzZwR005Yks5YXdNNGRKczBmcWxRZGg0?=
 =?utf-8?B?NHQ5UTR1NUdsYzhxcU5JWUlGY0NHUVh2Q2lYdGNwQnQycmkyQmI5ZHJYSEpv?=
 =?utf-8?B?RE0weVF6KzNMYjZ6bzV0VnhoVSswVHBqejVwU29mYzBaKzV3bFlHMjhXVnFT?=
 =?utf-8?B?NWFhb1VqVStYUklPTjcyRURhTkJ1eDRXRysxWkIxbDJzTHlnUyt0ajVnZ3hp?=
 =?utf-8?B?ekh0c1pLd1hDTDlnQ0xHM3Z5dlRNUFpJOVRUOGJMa2hGU3FSbjFHOHJnRHZn?=
 =?utf-8?B?NjVyOGdVbDZvbjBmanA4YVczRmMwaGFFNUhwSjZYbEd6YytYRnhRVFdHYkJS?=
 =?utf-8?B?cUxncnY1MlZOa2REampsbGcyenFSOG1aZHgvam9YeVA1RVVJaDFVMDRNZyts?=
 =?utf-8?B?WWg4cUplTmJPYkFjbkJabVVCdmUzbkFZNjNzN3ZlQTFmMFplU0NMTnRGaSsv?=
 =?utf-8?B?M290enVqdHVudmRyT28xTVJDRndzQTRIdGMzcFcyc1lueG9xRHg0R2I4TVFX?=
 =?utf-8?B?OUg1bXlxRy9UNVhWWmtheWFqWGo2VUZUQzhQd3NocWFyOHVQVXRBeGRNdDF1?=
 =?utf-8?B?SGVLUEl3WE9MSmVSVzhLSGpGMGRiTno0cWxOZk93SnpFR1NrZUt0TmFuRzVF?=
 =?utf-8?B?aWFWdW1sNFRuN0VRbnhRalFMcmZBckQ1MDBScmovZzVmbEV3SVRLOWVtZmJr?=
 =?utf-8?B?MThoMnF2dU9rbVo5WFVhdnJnNzU5VldUYTgrZjZFcjRObEZyS0lsNzd5RjRC?=
 =?utf-8?B?b2VQcGRsTWhlNUF3NlFzd1JkZ2svRHJWeldQakNBVUFWcnlBNkFVQmtwbVND?=
 =?utf-8?B?VHVCL2hkSHZMSENYZnVRVTdOTUszenZzYS9qYkIrM0g4OVF6NG9jeFRpWGhr?=
 =?utf-8?B?R3Y1Sm13MFRsbkNqOTBFMFF6R0ZXMjZmUDgzNFlKY1Rkcll5L21majlrWVdX?=
 =?utf-8?B?T00wWjBVN2lNeExaUjVtOFBWUW9hWXVTdGtUMzRCcFJ3aVBaRXlNN2ZSTjVq?=
 =?utf-8?B?UEtCdWxNVUlFbUFQMzhTTFZScFFFYVFmRHJkOWN3PT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3hLZTFlTDU3MlZQZEVyVjRYRHNmMDd1Y2VNMXVOUHFpNDkxSUtuRXlsaUpm?=
 =?utf-8?B?VGc5alczM3hqZG5JTk1paVRZS1pQTXVJRXh5VHpZaWNUbjd3bUpSb2dHVkZZ?=
 =?utf-8?B?aDNpZHA3bTVKenlqMGlDYlhVU1A2WXQ1VTVBRTdOejFEUDRVQU1aazZoRTNY?=
 =?utf-8?B?WmZ1V0M0c2xGVnFxUEJ6ejh0Z3NCSjM0YktGRGl3czh3VnF0VkNnUW5zVUdz?=
 =?utf-8?B?SU5sZ2dnSW5zSnRIamFScU9CVVVrYWRMc3p5WG5lbTVCS1crSmp4ZzhxU0Vl?=
 =?utf-8?B?N3NJc1RwQ1hDQkdncWx2TnViaGpWdkxXeTBvdVVybTF2TUZjWWp5NlVNNDBn?=
 =?utf-8?B?M1NZRFB1eWgwOUg2VXN6MlJJTDBCeGo0S2NLOXE5VmVrRzJOTWhRQXZJRXZj?=
 =?utf-8?B?MnhIY0F5c09DTGhpNkM5eVpjY1lwNnlDV3dwalRLTEZtd1pkYW45S3J2Z1B4?=
 =?utf-8?B?MjJqaXozUXZMVTRMeC91c1hOQ0R5RlFEL0RBbGdJMXljS0Fmb0Z6ZmhydmND?=
 =?utf-8?B?NHE2SzZ6OVl6bXl2VU1oODA1NjRBeXNhbTBIdzM5QjBWamQvWTRGQ2xEazRC?=
 =?utf-8?B?d2xFV0huM1pMYVkzL1BhUjZxRC9jL0NndGUwQy93TFVjRFhzYnd3U3dQWnhl?=
 =?utf-8?B?N1pLeUZLRTdGS2tmRmhaam9TODhCWk1qcVh0OVRuU3RXT3dQN1NxMEl2aGtQ?=
 =?utf-8?B?ZUM4ZlpGSm9IbGZ4c3htMkxHS1BJWUxNTDhJOFdNTzgwWFAxTDlzWTY4SGgy?=
 =?utf-8?B?Z2hUU0RRM1B4aVZFbjJUV3YyU0pyNzhTdDkxcXlNR2tjSU1LNFBmQk13aFdK?=
 =?utf-8?B?ZFpxa3dadVV5dTVYTHVTTlJHQURYaFZlbGQrTSsrWG5lZnlEZklUWG5vaHM1?=
 =?utf-8?B?UmNRWmlnK0NDeFdXQzhqMlA3QndhUjRQK0paL2hyaHFySjdNMks3OXZaVmFY?=
 =?utf-8?B?ME9hNGtOS0RkREZBajQ4SFdNbjFPTWp4eVF4bkxmUjlTTU9GM3B4dzZORGRu?=
 =?utf-8?B?UEVwemFyVG1yVkFPOW43UU81ZVZVRFh1RHNuV3lNc3E4UDFHdmVocWxmQWtj?=
 =?utf-8?B?SGNBcExVRGw3dW51dFpyY2toRW5MRVdkSy8xQ0wySFhidWV3LytjTm9DYTdJ?=
 =?utf-8?B?WXJWTDF4U1pzbm00NXNCNmpoTE5Yci9nZDdCbGFvYkdBSG1WSGZnRkQ3TzJ6?=
 =?utf-8?B?Qk1EdmdXOW1nTzJRS2U0b3FVQ2lId2lMTGdveDByYnJ0dHBlejlSNVNRc2NZ?=
 =?utf-8?B?MG14MTFSSWplcjhwckRwU1BTK3djU2FiWktYQ0hXYlMvc2psYk1TRmlzMVpw?=
 =?utf-8?B?b0RPWlN2SThBTzFhM2t5L1c5ejVxQjN2UFJ6emwrL3VkYW1LL3JjRW9meE8y?=
 =?utf-8?B?SGkvRDB4a1NEdTlrV0xsRUFycDI2eU1YR1dXY2N0VStvQlZxRm9NK2haNjYr?=
 =?utf-8?B?YXk3K3owcThrYzRPT2JkZGx6QThTVU1QQW92SXlyQWcxaU5sQkFmUS82TTV3?=
 =?utf-8?B?VGphZ09ENW1uQ1QxN0hMejUxSkpiZnd4djVWSXZiZ0ZaOXhsc0JXZnNBbEdQ?=
 =?utf-8?B?cHZDT21tQk1XdzFvMHZGQWFnanROU1N1WDRFQ3NZQzFwRGVKcDJVbEptelhj?=
 =?utf-8?B?WTlPdUdxUE8zU0dSWkNMYWNDaVlxZHhKdkxtNTFZNGxvR0hvcTJ1U2NiM0Nn?=
 =?utf-8?B?Vi9pYWpYQ3VhdzRxQTFET3J2d1ZGelZDLzBGanJCNFh3NEV5MlhRdTJQVmU2?=
 =?utf-8?B?NTg2UHo2akMwYjlmK0VQV3V3TVR2a3Q5a0tnS052NXdMTzh1dS9zS2pxcTBI?=
 =?utf-8?B?dUErMlhlVGlXdCszNTN2VUpYUFhKQ2tac3FZbnVOVzRxM3c3bEd0bHU3b2NL?=
 =?utf-8?B?cTJqSklLZWFOU2d4VUVMSytES1VyQnAxeDg4ZFM3Z0p5TkZ4VkNNeWxYTk5F?=
 =?utf-8?B?TkR1NFl2dFZhM1pUVXRzWHgvVEE2eU5Bd2FPVzdxQm1hTlNNTkZFYUlaZk5V?=
 =?utf-8?B?MUNab0ZCOUxBPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 814bab3f-8660-4e5a-c1f1-08dece0dace0
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5662.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:18:46.7252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB7167
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/15/26 7:26 PM, Chao Yu via Linux-f2fs-devel wrote: >
 On 6/12/26 19:58,
 Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> The following
 scenario can cause fiemap to report incorrect extents: >> [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)outlook.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.103.43.81 listed in wl.mailspike.net]
X-Headers-End: 1waa3h-0000rE-0F
Subject: Re: [f2fs-dev] [PATCH RESEND 1/5] f2fs: fix extent merge failure
 when largest extent is not in rb-tree
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:from_mime,xiaomi.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 121646A65DF

On 6/15/26 7:26 PM, Chao Yu via Linux-f2fs-devel wrote:
> On 6/12/26 19:58, Yongpeng Yang wrote:
>> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
>>
>> The following scenario can cause fiemap to report incorrect extents:
>>
>> $ mkfs.f2fs /dev/vdb -f
>> $ mount -o mode=lfs /dev/vdb /mnt/f2fs/
>> $ dd if=/dev/urandom of=data bs=4K count=874 conv=notrunc
>> $ f2fs_io fiemap 0 1000000 data 1
>> $ shrink all extent
>> $ dd if=/dev/urandom of=data bs=4K count=150 seek=874 conv=notrunc
>> $ f2fs_io fiemap 0 1000000 data 1
>> Fiemap: offset = 0 len = 1000000
>>          logical addr.    physical addr.   length           flags
>> 0       0000000000000000 00000002868d4000 000000000036a000 00001000
>> 1       000000000036a000 0000000286c3e000 0000000000096000 00001001
>>
>> The root cause is that when the largest extent is not in the extent
>> tree, mergeable extents are not merged, causing f2fs_map_blocks to
>> misjudge and output an incorrect extent list.
>>
>> Fix this by allowing the extent being inserted to merge with the largest
>> extent. When updating the extent tree range, if the new extent can be
>> front-merged or back-merged with the largest extent and the largest
>> extent is not in the rb-tree, merge them before the normal lookup.
>>
>> Fixes: 429511cdf8b3 ("f2fs: add core functions for rb-tree extent cache")
>> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
>> ---
>>   fs/f2fs/extent_cache.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
>> index 61f6b9714366..aa368a01b035 100644
>> --- a/fs/f2fs/extent_cache.c
>> +++ b/fs/f2fs/extent_cache.c
>> @@ -702,6 +702,27 @@ static void __update_extent_tree_range(struct inode *inode,
>>   		__drop_largest_extent(et, fofs, len);
>>   	}
>>   
> 
> This can only be used for EX_READ?

Yes, we only handle the case where the newly inserted mapping of EX_READ
can be merged with the largest extent.

> 
>> +	if (et->largest.len != 0 &&
>> +			(__is_front_mergeable(tei, &et->largest, type) ||
>> +			 __is_back_mergeable(tei, &et->largest, type))) {
>> +		/* 0. try to merge with largest extent. */
>> +		en = __lookup_extent_node_ret(&et->root,
>> +				et->cached_en, et->largest.fofs,
>> +				&prev_en, &next_en,
>> +				&insert_p, &insert_parent,
>> +				&leftmost);
>> +		if (!en) {
>> +			if (__is_back_mergeable(tei, &et->largest, type)) {
> 
> Can we reuse result of previous __is_back_mergeable()?

OK, I'll change it in v2 patch.

Thanks
Yongpeng,

> 
> Thanks,
> 
>> +				tei->fofs = et->largest.fofs;
>> +				tei->blk = et->largest.blk;
>> +				fofs = tei->fofs;
>> +			}
>> +			tei->len += et->largest.len;
>> +			len = tei->len;
>> +			end = fofs + len;
>> +		}
>> +	}
>> +
>>   	/* 1. lookup first extent node in range [fofs, fofs + len - 1] */
>>   	en = __lookup_extent_node_ret(&et->root,
>>   					et->cached_en, fofs,
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
