Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 906D1BDF4DD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Oct 2025 17:17:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Content-ID:In-Reply-To:References:Message-ID:Date:To:
	From:Sender:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1caUca93aU2sL+0IcokTQwqUuj6lQ9xmhqvhIDxCu80=; b=lP9LtM9dU/9sFMRLPzeNBcUYqz
	/nhpK9rehw/vqx0RhN0FktlReHkEEVgPg9Xijy0qQyOiV1lc//cFrTL6llGOmT7UYuQlMuSMJ/xxG
	M5vQuZ+oP67JIN+lrHBmGIvhcglbgB0v3fuIdyELRWAafNYyNlTEi0h85NfFTQjMZ2ZM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v93Fn-0007FG-TP;
	Wed, 15 Oct 2025 15:17:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sjb7183@psu.edu>) id 1v93Fl-0007F7-Sz
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Oct 2025 15:17:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kCfWNi+QZhojbBHvFmN4sCJlS/+lZMqHq3b5tylUdmY=; b=jAPn/G6n6skP9N14EXnAFIzjl4
 VgVnY25JxdfwhbDViJM9iRltmEx07Nk3T4ACO8Z3HpPw1/io+p7wMdasbE9hTf1mCB+N+yIUBsYXs
 ktGyOtBV5mf/DSSBrhBjn+ykonq7ecHvYnB6QGneQE/uYRlxCLxwNTIlWwAkRByEd0AI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kCfWNi+QZhojbBHvFmN4sCJlS/+lZMqHq3b5tylUdmY=; b=bWnhjXY5tu2t7bv0MqP36gs+nZ
 rghnqE/5ciP9sMpfvFp/mSIfCMISI/cKkBuLnNaZKPmQUDnxuyZgFQuBDdInG3IoU7P922k/KNpHA
 41TGxqpGUJ5HNURyMbZZ2Ok1TifBxG3c46N3RkKJSK/wZ38BP7sdt8QDsswDhYI/xa2k=;
Received: from mail-westusazon11010052.outbound.protection.outlook.com
 ([52.101.85.52] helo=BYAPR05CU005.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v93Fk-0000X1-TT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Oct 2025 15:17:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9SamwRWLdIFkHpFxwL0R7ylqrlmzNizL5YdhE/dkRKoVGu4+N/88GOkjld/Bhcdk7K25FTkd9ZslhPuqpZJsL8ULSq98qfHM5MgwOMm1IOuaOO5aACVvTRzfhukYC5leaI0DrdZFpzK4AoJSp8nm+rPFXCGTLFl13oSL76kBGoEDpgaQo/HUpoXie9ggD8xaFiwzPL5EWiSEsbHCy03BX56XvMrLCJayIXK2gj4FPGRfs9ala6HkO/oRA8pllbwmhoFyRvzc9NDxSgztpAQF1hUjc79eV1s9fdplVoMjp263Ee82tVukOIl7d2NXIpdlqCDXYJyj5lt+u7RsjVYgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCfWNi+QZhojbBHvFmN4sCJlS/+lZMqHq3b5tylUdmY=;
 b=AIwWwv6FxFE9SklbdnAClGZxxyMvO7/brARaZCUVLM7Q8ManWOqUvNnKc7alE0dMRFmvrtJ+S3DVepK5a1s53YPr/sz6b+X6c9G+/jXNNcUihk21r959VPIjyXWgJbu7d6DR59IuJ5izIgccP9ozxpSI/rGox7I4sryCUBHR9lBpCzDVjIi0yqF+7uq8I1RHTpKn5vJJt3SlD/4iprL9Jk7bdKFwOPOVfpPV0P2qdHVceIbput3VNXMF3dELRywMfyySVxNNag6IC66vnHt8Cs19Ku4mdA8hksKpggwj7Fkgd9eOeUySM1RMfpErVSbdUEwaqNv6ZzwFZznK9e+T+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=psu.edu; dmarc=pass action=none header.from=psu.edu; dkim=pass
 header.d=psu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=psu.edu; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCfWNi+QZhojbBHvFmN4sCJlS/+lZMqHq3b5tylUdmY=;
 b=2nQvzjsYQztPa5o55ouHacNbTzvF6MhavAKT6jfS/ogZ2KAKYmXF/RDi1VKZq17sCYLKk2dK8EFnz8vUkO8rCIZZYgrGZnSbJ4vk9M1xmivxjbuULAG9fdHD1q4ATlB4TZbTBv7kqiHDPCKg/Po7ur+0jZrIV1LbA1UJjwC5l4tUL6iDaTG1ip0P13h//kvHox48ecTEMXcCbAF5p8yCsBqST4tbbVE5PvogrxrNgCuf959lXpsN6Op2yp+xXweMwLAKYxUeAMuhcbEiE5bFQqOBn8g0n+D5m0cH9W2kME2iUQgKp7uLNvAJf2zmSHT20u8X4pMotpM1pXs6mCYVlw==
Received: from SA0PR02MB7276.namprd02.prod.outlook.com (2603:10b6:806:e6::17)
 by SJ0PR02MB7502.namprd02.prod.outlook.com (2603:10b6:a03:2a2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 15:17:13 +0000
Received: from SA0PR02MB7276.namprd02.prod.outlook.com
 ([fe80::e6ab:3830:2755:fa66]) by SA0PR02MB7276.namprd02.prod.outlook.com
 ([fe80::e6ab:3830:2755:fa66%7]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 15:17:13 +0000
From: "Bai, Shuangpeng" <sjb7183@psu.edu>
To: Chao Yu <chao@kernel.org>
Thread-Topic: [BUG] f2fs: divide error in f2fs_all_cluster_page_ready on v6.17
Thread-Index: AQHcO9LikRAKz2pYikuAKVmnd6QgArTABcqAgABX5oCAAM9kAIAA8l2AgABZ2gCAANyTAA==
Date: Wed, 15 Oct 2025 15:17:13 +0000
Message-ID: <4B765E4F-C618-4456-9487-95659C312C68@psu.edu>
References: <44D8F7B3-68AD-425F-9915-65D27591F93F@psu.edu>
 <61a3acc4-d541-41a4-b675-67b20f125117@kernel.org>
 <6E931354-7EF6-45B3-99A9-6E632FE98D03@psu.edu>
 <13833d95-cb78-49ce-9a29-1bee30dc6a38@kernel.org>
 <442A9745-DC2E-41E3-8CD6-9B5E2B55D9F3@psu.edu>
 <741474df-149b-4a41-8487-a88509edfe5d@kernel.org>
In-Reply-To: <741474df-149b-4a41-8487-a88509edfe5d@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=psu.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA0PR02MB7276:EE_|SJ0PR02MB7502:EE_
x-ms-office365-filtering-correlation-id: 53699c48-dcee-4191-6b4f-08de0bfdeb19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ME56b3ZseldnVUQzMURELzJlQXM5UFVaS05PQkxuZUQ1VkY2Q1FpcW1ZcTZF?=
 =?utf-8?B?ZHp4NDBTQzZSc1Mydm5Xdi93d3ZISDd2UWszRTBlZERGVjMyOURSYTlKNHhJ?=
 =?utf-8?B?TjV1VHM1RVQxOWFSWXU5N09ETkIwSTB1cGJjV1kwR2NoeE9RSVkxVTV4bkc1?=
 =?utf-8?B?VWRxZ2hzNmQxd3VLN0pHTXlOZnd6b2hralZJVEVzNUM0THdrSDl4eEVRa1Mv?=
 =?utf-8?B?VUFOUExTZk1TeXd5cGRxY1lpc1JEWm10VlZaUzJoS3Q0ejUvK2I1MVFBeXE1?=
 =?utf-8?B?U3VQK2lCcnVvd01iekVUUU9Od0F4dk43ODIxYVhiWnFNNjFpaGY3UWtxWC82?=
 =?utf-8?B?QjJpVHRQelVtR3p6YXdCSkROOUdGQ2thN0dhVDNuNDZiTHEvWUZaOXVWdlNN?=
 =?utf-8?B?MUxjcDhKdlJOME1CVXNUQ05SeG00cVJNVWtjcnFGQUlXWUZNOUlVUVlrSWh4?=
 =?utf-8?B?T005RWxPZVlHTnhlTHNhcjRWZzFab2ljeS9ISjZpckhKdmFTV3hOUE1kVGdm?=
 =?utf-8?B?TWdzOURRc3BZK0xEdFBjZHVGcjVIT0dLU2FCRDNHdm5xOFg4Y1pZQ1BNZ0Iz?=
 =?utf-8?B?YzcySXdsVGRBb0lubnR2NUFrNVVNVG82allTejhDY2hjemNJVkJ6ajZXSmFP?=
 =?utf-8?B?Qmt2ZjBsTXFVTXBwTmw5OC9xK3pYckl0bS85VzZiOFFKOGxDU0dMTm45Nzg0?=
 =?utf-8?B?NVozR1M4b09ndWY5UlJOTHBtSW9EeG1RMWNkT2JyRUoyYnBXMnZIK2c5VlBv?=
 =?utf-8?B?RWJ3VFBLNjZyRVFsUjBzWVRYczk1aXY4ZmszZk5teWxkWnFHT2pjRkNmNWxa?=
 =?utf-8?B?dHhkVVhLMWlMbmM3bytJNlFTRVZybitHVjdsblhmRUZacCttelBzRVFNWGVU?=
 =?utf-8?B?VmxQU0JEbzRqWEdXTEhLRERxVkNBYUx6YXppQ1R1S1JyQlMvOXAvUHNMNTQ4?=
 =?utf-8?B?djhWVENOVUlCdG5BZFBCR3BPbkdKMlRxZThqZXlNUi9iejRmbFNyNERJWEVU?=
 =?utf-8?B?bXdyeTc5VXBKSVA4RVhHSkJBY2VJTllxclhkMjJvTkc4cEptcjB2OGFva2Zh?=
 =?utf-8?B?TE9VNEMydlBtYTRxaXRTK2hyYkxRQi9SeFRlYkZDWkxvUXJZV1BrVEVNNS9R?=
 =?utf-8?B?aTFkazN2MTV4Mm5nY0tYemhPbkdDY3BYeDRiRWtOd2Z0KzRRU1dnZUxBbFhq?=
 =?utf-8?B?d1B0MVQ1Z1EvaEY3T2U0cnNxaDN6KzJWNmJoR3o2UzljWEFRS3pFVWJ1V1V2?=
 =?utf-8?B?eDFDb3J5ZmtId1RPWUJvSzZPZldxVXpvL0RoNXJqWWlPSzdGTXhqYkFFa3VG?=
 =?utf-8?B?V3ZJWTZOcHppWDVlODZMU2ZRenpzdWlPd3ZhaTB0VTllK0EyWTZmSUxURkRU?=
 =?utf-8?B?V3hWZ2ZkZll4NWpWRDR1RUdWQUxDK2hJV2hWSkZ0djlXdjM4RlNHUFI1NHZo?=
 =?utf-8?B?MEw3b0tLUDJJSUkwUGVlQVBkNWxWa1VwNlJBb2tTbmxXUnhTSFZmYVdZM1RC?=
 =?utf-8?B?d05rNVFCWVoxRmZ5VStEWWFYbzJaN2p4S1lCSkw3VFVnbUZJZE5IbW9Gd3hi?=
 =?utf-8?B?bEtUSklqWU43Q2JhYzNHU3FQNlV4Z1JxdnpZc05yTG81VE5mYzR3NEdUQjJq?=
 =?utf-8?B?OU9IejlyTWdwbnRXaHVGaUxENEN4TFBkQkMySXh5UFkrNFhyZ3FubzBUakxD?=
 =?utf-8?B?c2xVK2dtV3BMT0YyRWQvRU9WaTZwR2hJYXMyb2hoWnRpaVgrY0ZrZHRSVzBV?=
 =?utf-8?B?VWdHRzV4MHNJTTdnUjJyQVZDUGx6TlJHdEwrdTJWbE9KMWhKSVk0TlI1UlNJ?=
 =?utf-8?B?Z1FmWUoxcWZvSjVBUXBYM3pWTTlwNW1tWFZndmhvWVpvWEF4WGZmT3lpSW5U?=
 =?utf-8?B?ODBWbWtKaFEreGg5Y0FQSGUxclZrNHRXdmhqTFBMMXovWWpUd2JBZXY0cXNC?=
 =?utf-8?B?SGxuU2VDeWNsUEc4OW8wMC9oa0tPOEx0b0NtbGJXUXJUTWJ4TkFWRVcxYW9I?=
 =?utf-8?B?ZytkbG4vcjJnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR02MB7276.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c254RXBZT1lJZ1BqMVFSTFBsYXlyaGQvMDY3V3M2VjRQQlJHRjAzZGVXRFZQ?=
 =?utf-8?B?dkMraHZLWE14b1ZpYmFpZjM1UVE5cGxwSjhmNk9aRkxLRDRzSklFcEpsMnU4?=
 =?utf-8?B?YjF4VFUwNjRwN3pNeWNhZHBDRE9MaVZmaGc2dURscEJwT1pCSVVkSng0bDVJ?=
 =?utf-8?B?YjhRNlY0amRvZEdsU1RPSFVPSHRlNDFORVFlMG9TUXB1MGhxMDhIUDNML2dR?=
 =?utf-8?B?aHFKeUx5NkRkWTF3Nnl2MWY3OWxMaUhqODBCTHp2YmtnV09jcUhObmxSenhy?=
 =?utf-8?B?Q1FKN25kVDFobk8vQ1VSZ0UwODdVRkNJdjByS1VTWndoRXZVQ1VEbGtYNm02?=
 =?utf-8?B?aTd5bmN2eDQ5Y0gvVktOdmE0UHBMOE1jUm1TbVBwcmhWNHVxRktUZzhSY2lu?=
 =?utf-8?B?MWJyV2RKL2kxeWQ3M0lUdzRJTlUvMXhtdll2eGxnalFTUWM3Mmx2U2lQYmtL?=
 =?utf-8?B?N2ZsMDd4VDVRQkpSSzFtRlYyc2ZnVzdDdEdUYnhsa3UvRCtoVzJXQjQyajE2?=
 =?utf-8?B?RWNlTmd2SXBVMW5Ld2N1TS9IR1NLKy9xNDM0ZG83enYwR2grUjVMdExNeGNn?=
 =?utf-8?B?aGVuWWtCcTRYZCs2QTRiQjFYT0xiNDNUZGtrNS90SlRUelQ2WUkvOHEwUk41?=
 =?utf-8?B?ditmY0hkVEM2MmZKYUN3NlpjdVVLb1FHVTdhcjdwblhPVnkxekduTnBhb0dP?=
 =?utf-8?B?SC9rMklKenE3TS9Pam1hM25oRm5QVFBrSlAwaHNSQ1F4Ti9xTDRCWnhvZnFJ?=
 =?utf-8?B?bWVVS1YybFhQREhIdGVYTElyc0xXOFduMUx0RkVqd2lNOUErN1lTdWFNUVYr?=
 =?utf-8?B?K0EvZU1YYzRkY0E0SnF0R2RjUFFYZk5maVdvMk16cG03WkVOd08rQXd2ckV5?=
 =?utf-8?B?VnNwSUxIRXJINW5jQ3ZLdGdDekkxaXVzbWJOZW1Ub1E3dWx6K3VVUlRUZkhH?=
 =?utf-8?B?Tnh5cG9qc1VmSXNZcFZzVTcxY1hKNEN0WlIwSTJtczJkTnFZVTM2dTQ4Ujln?=
 =?utf-8?B?OTJlNEZXTWp2NDBKNGk3Wi9WOGNYN3VlOFdQa0tRZzNGUzRLNGRrc0xWaGRZ?=
 =?utf-8?B?UjE1NU5lWThwOUNBc1dEZndlMEFnWWpjb0d2eUdpNWM3dlQ3Wk8vQ1BXeUww?=
 =?utf-8?B?T1d1c1R4M3UwZGhSbk94alZYaE42R0hzY2t4azFaeFdvSGZ0YmYrbVBEMkkz?=
 =?utf-8?B?MjRRa3ZjWE1VZ1lqODA0bThaOHJyTjRSaUFVbGJjS1RSbHpHL3lqNXEyWEJp?=
 =?utf-8?B?b0ZIaURybHk0QjU1VktvSXhiaXY4cjc5bFRnaHpFSklVZUFpaGFabFV5S3RO?=
 =?utf-8?B?OVV1SjhrcitjcThEMXZsbmJpV0o0WERTOUZ2THlITlBCT0ZvN0sxeTM1VnVp?=
 =?utf-8?B?V09UQ0JxamR1RFBqZUU2YlNSUVlCR3ZKL1ZPYThlZ1g2MXVJYk5IcjJmdGph?=
 =?utf-8?B?cFNpTU9kZnB1Y3RyNm1PdjFxaW9JSWFZcmd6MmhhY0J3dlBmU2d2eDlvQ1h5?=
 =?utf-8?B?OGY4dmwrRldaQ01UTVdSeW5ybGZuYmt5bTdPZFEydzFKSUEvRlV4UVEyVlNy?=
 =?utf-8?B?RzNiV0JNRDlGYTF3ZEdsamc5WG1Yd1NqbmZyeng5WjFzdTYzK0JOd0pRRjRs?=
 =?utf-8?B?YnJFdlhZY1pSYXNlMll4ZXVoUi9kZ0FPdTIzR0gwelFjYkxNVXNlOWJuanlz?=
 =?utf-8?B?Sm9ZcEtsWVVQRlpLQm1WekJPQTBMQUNVQmkxcGduanBVQkxVTGZoaTROV0lY?=
 =?utf-8?B?c3VBVHRJemlDVHpoTEEvZ053NndPdzVDWWNzZk1DSEFyeHBLc3llVnF1TGVJ?=
 =?utf-8?B?Uy9MZW5jVFJaVXcyREhkNHByU1JxSUJLT3NyeFA1K1lOZHUxdzYvT3lyV0tU?=
 =?utf-8?B?R0w1MjFHYlhoOXpZQzdEdkxUbVlKM2pPNFI3UG1meWNHM0RZcjk1WllUUkk4?=
 =?utf-8?B?UHM3N3FhcG92blBXdjBrZkQ2cHoxN0thZVVnLzRoWmxsc2FhMUxRTzNiTVVy?=
 =?utf-8?B?MnVyNkVwemYvQnVqUnhucEMxb1JIdEFzNjJ2MkFBS2NMMTNmVjVkTnJQUEpF?=
 =?utf-8?B?RDFvempQUjJvalNQZWVyWTV6bjRXcWpVZjI1MWJJK1ExQ3p6dzI3Q1RkdHhO?=
 =?utf-8?Q?T7bQ9R/AXRwuZZnxGQj8V3Yov?=
Content-ID: <7FEBFB367BCD0647A988D80DC84BC0F7@namprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: psu.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR02MB7276.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53699c48-dcee-4191-6b4f-08de0bfdeb19
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 15:17:13.1529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7cf48d45-3ddb-4389-a9c1-c115526eb52e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lCYGC+DFClV4qIbILjB5ma/2SmPDBp6bJGeNuSHJA1W0abq4+ACVm87qmLV0LTk9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7502
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On Oct 14, 2025, at 22:07, Chao Yu <chao@kernel.org> wrote:
 > > On 10/15/25 04:46, Bai, Shuangpeng wrote: >> >> >>> On Oct 14, 2025,
 at 02:18, Chao Yu <chao@kernel.org> wrote: >>> >>> On 10/14/25 01 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.85.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1v93Fk-0000X1-TT
Subject: Re: [f2fs-dev] [BUG] f2fs: divide error in
 f2fs_all_cluster_page_ready on v6.17
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
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "syzkaller@googlegroups.com" <syzkaller@googlegroups.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gT24gT2N0IDE0LCAyMDI1LCBhdCAyMjowNywgQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToNCj4NCj4gT24gMTAvMTUvMjUgMDQ6NDYsIEJhaSwgU2h1YW5ncGVuZyB3cm90ZToN
Cj4+DQo+Pg0KPj4+IE9uIE9jdCAxNCwgMjAyNSwgYXQgMDI6MTgsIENoYW8gWXUgPGNoYW9Aa2Vy
bmVsLm9yZz4gd3JvdGU6DQo+Pj4NCj4+PiBPbiAxMC8xNC8yNSAwMTo1NiwgQmFpLCBTaHVhbmdw
ZW5nIHdyb3RlOg0KPj4+Pg0KPj4+Pg0KPj4+Pj4gT24gT2N0IDEzLCAyMDI1LCBhdCAwODo0MSwg
Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToNCj4+Pj4+DQo+Pj4+PiBPbiAxMC8xMy8y
NSAwNzo0OSwgQmFpLCBTaHVhbmdwZW5nIHdyb3RlOg0KPj4+Pj4+IEhpIEtlcm5lbCBNYWludGFp
bmVycywNCj4+Pj4+Pg0KPj4+Pj4+IE91ciB0b29sIGZvdW5kIGEgbmV3IGtlcm5lbCBidWcgImRp
dmlkZSBlcnJvciBpbiBmMmZzX2FsbF9jbHVzdGVyX3BhZ2VfcmVhZHkiLiBQbGVhc2Ugc2VlIHRo
ZSBkZXRhaWxzIGJlbG93Lg0KPj4+Pj4+DQo+Pj4+Pj4gS2VybmVsIGNvbW1pdDogNi4xNw0KPj4+
Pj4+IEtlcm5lbCBjb25maWc6IGF0dGFjaG1lbnQNCj4+Pj4+PiBSZXByb2R1Y2VyOiBhdHRhY2ht
ZW50DQo+Pj4+Pj4NCj4+Pj4+PiBUaGUgcmVwcm9kdWNlciB0cmlnZ2VycyB0aGUgY3Jhc2ggcmVs
aWFibHkgaW4gfjUwMCBzZWNvbmRzIG9uIGEgUUVNVSB4ODZfNjQgVk0uDQo+Pj4+Pj4NCj4+Pj4+
PiBJ4oCZbSBoYXBweSB0byB0ZXN0IGRlYnVnIHBhdGNoZXMgb3IgcHJvdmlkZSBhZGRpdGlvbmFs
IGluZm9ybWF0aW9uLg0KPj4+Pj4NCj4+Pj4+IEhpIEJhaSwNCj4+Pj4+DQo+Pj4+PiBUaGFua3Mg
Zm9yIHlvdXIgcmVwb3J0IQ0KPj4+Pj4NCj4+Pj4+IENvdWxkIHlvdSBwbGVhc2Ugc2hhcmUgc2Ny
aXB0cyBhbmQgaW1hZ2VzIGZvciB0aGlzIGlzc3VlPyBhcyBJIGNhbiBub3QgcmVwcm9kdWNlDQo+
Pj4+PiB3LyByZXByby5jLg0KPj4+Pj4NCj4+Pj4NCj4+Pj4gVGhhbmtzIGZvciB5b3VyIHJlcGx5
IQ0KPj4+Pg0KPj4+PiBJIHVzZWQgY2xhbmctMTUgdG8gY29tcGlsZSB0aGUga2VybmVsIHY2LjE3
IHdpdGggdGhlIC5jb25maWcgaW4gdGhlIGF0dGFjaG1lbnQuDQo+Pj4+DQo+Pj4+IFRoZSBpbWFn
ZSBJIHVzZWQgaXMgYnVsbHNleWUuaW1nIChodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9k
LzFrckw5TWMtczA3YUE2bS0wVmp1dU83NjdTdGFjdlpRVi92aWV3P3VzcD1zaGFyZV9saW5rKS4N
Cj4+Pj4NCj4+Pj4gVGhlIGltYWdlIGlzIGNyZWF0ZWQgYnkgaHR0cHM6Ly9yYXcuZ2l0aHVidXNl
cmNvbnRlbnQuY29tL2dvb2dsZS9zeXprYWxsZXIvbWFzdGVyL3Rvb2xzL2NyZWF0ZS1pbWFnZS5z
aC4NCj4+Pj4NCj4+Pj4gSSB3aWxsIGFsc28gc2VuZCB0aGUgYm9vdCBzY3JpcHQgYXMgYXR0YWNo
bWVudHMuDQo+Pj4+DQo+Pj4+IFRoaXMgYnVnIHRha2VzIGFib3V0IDUwMCBzZWNvbmRzIHRvIHRy
aWdnZXIgdGhlIGJ1ZyBpbiBvdXIgdGVzdGluZyBlbnZpcm9ubWVudC4NCj4+Pj4NCj4+Pj4gUGxl
YXNlIGxldCBtZSBrbm93IGlmIGFueXRoaW5nIG5lZWRlZC4gVGhhbmtzIQ0KPj4+DQo+Pj4gVGhh
bmtzIGZvciBwcm92aWRpbmcgdGhlIGluZm9ybWF0aW9uLCBob3dldmVyIEkgc3RpbGwgY2FuIG5v
dCByZXByb2R1Y2UgdGhpcyBidWcgdy8NCj4+PiBhYm92ZSBpbWFnZXMgYW5kIHNjcmlwdHMuDQo+
Pj4NCj4+PiBDb3VsZCB5b3UgcGxlYXNlIHVwbG9hZCB5b3VyIGtlcm5lbCBpbWFnZSBhcyB3ZWxs
PyBsZXQgbWUgaGF2ZSBhIHRyeSB3LyB5b3VyIGltYWdlLA0KPj4+IG5vdCBzdXJlIGl0J3MgcmVs
YXRlZCB0byBjbGFuZy0xNSBvciBub3QuDQo+Pj4NCj4+DQo+PiBUaGUgdm1saW51eDogaHR0cHM6
Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xdWRqRXQ4c1NWMWRfa0lGM0U1SVptaE9UaEc5TURo
MXMvdmlldz91c3A9c2hhcmluZw0KPg0KPiBPaCwgY291bGQgeW91IHBsZWFzZSB1cGxvYWQgYnpJ
bWFnZSBhcyB3ZWxsPyBUaGFua3MgYSBsb3QuDQo+DQoNCk5vIHByb2JsZW0uIEkgaGF2ZSB1cGxv
YWRlZCB0aGUgYnpJbWFnZTogaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xVEFlUzFq
X0ozNkVBb2Njd0pHaGNMSGFnTkhoVWYxOHovdmlldz91c3A9c2hhcmVfbGluaw0KDQpUaGFua3Ms
DQoNCj4gVGhhbmtzLA0KPg0KPj4NCj4+IFBsZWFzZSBsZXQgbWUga25vdyBmb3IgYW55IGZ1cnRo
ZXIgcXVlc3Rpb25zLg0KPj4NCj4+IFRoYW5rcywNCj4+DQo+Pg0KPj4NCj4+PiBUaGFua3MsDQo+
Pj4NCj4+Pj4NCj4+Pj4NCj4+Pj4NCj4+Pj4NCj4+Pj4NCj4+Pj4NCj4+Pj4+IFRoYW5rcywNCj4+
Pj4+DQo+Pj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+IE9vcHM6IGRpdmlkZSBlcnJvcjogMDAwMCBbIzFd
IFNNUCBLQVNBTiBQVEkNCj4+Pj4+PiBDUFU6IDAgVUlEOiAwIFBJRDogMTE0NDEgQ29tbTogc3l6
LjAuNDYgTm90IHRhaW50ZWQgNi4xNy4wICMxIFBSRUVNUFQoZnVsbCkNCj4+Pj4+PiBIYXJkd2Fy
ZSBuYW1lOiBRRU1VIFN0YW5kYXJkIFBDIChpNDQwRlggKyBQSUlYLCAxOTk2KSwgQklPUyAxLjE1
LjAtMSAwNC8wMS8yMDE0DQo+Pj4+Pj4gUklQOiAwMDEwOmYyZnNfYWxsX2NsdXN0ZXJfcGFnZV9y
ZWFkeSsweDEwNi8weDU1MCBmcy9mMmZzL2NvbXByZXNzLmM6ODU3DQo+Pj4+Pj4gQ29kZTogMDAg
OGIgNGQgMDAgNDggODkgZDggNDggYzEgZTggMjAgNzQgMTkgNDggODkgZDggMzEgZDIgNDggZjcg
ZjEgNDggODkgZDUgZWIgMTQgNDggODkgNWMgMjQgMTAgZTggNDAgYTQgNmQgZmQgZWIgMmQgODkg
ZDggMzEgZDIgPGY3PiBmMSA4OSBkNSAzMSBmZiA0OCA4OSBlZSBlOCAwYyBhOSA2ZCBmZCA0OCA4
NSBlZCA3NCAwYyBlOCAyMiBhNA0KPj4+Pj4+IFJTUDogMDAxODpmZmZmYzkwMDA2NjE2ZTYwIEVG
TEFHUzogMDAwMTAyNDYNCj4+Pj4+PiBSQVg6IDAwMDAwMDAwMDAwMDAwMDMgUkJYOiAwMDAwMDAw
MDAwMDAwMDAzIFJDWDogMDAwMDAwMDAwMDAwMDAwMA0KPj4+Pj4+IFJEWDogMDAwMDAwMDAwMDAw
MDAwMCBSU0k6IDAwMDAwMDAwMDAwMDAwMDAgUkRJOiAwMDAwMDAwMDAwMDAwMDAwDQo+Pj4+Pj4g
UkJQOiBmZmZmYzkwMDA2NjE3MjcwIFIwODogZmZmZmZmZmY4NDU1MmQyNiBSMDk6IDAwMDAwMDAw
MDAwMDAwMDANCj4+Pj4+PiBSMTA6IGZmZmY4ODgxNTVhZDIwMDAgUjExOiBmZmZmZmZmZjgxZDJh
YTI2IFIxMjogMDAwMDAwMDAwMDAwMDAwMQ0KPj4+Pj4+IFIxMzogZGZmZmZjMDAwMDAwMDAwMCBS
MTQ6IDAwMDAwMDAwMDAwMDAwMTAgUjE1OiBmZmZmYzkwMDA2NjE3MjYwDQo+Pj4+Pj4gRlM6ICAw
MDAwN2Y4YmFjNWI1NjQwKDAwMDApIEdTOmZmZmY4ODgyMjBmMDIwMDAoMDAwMCkga25sR1M6MDAw
MDAwMDAwMDAwMDAwMA0KPj4+Pj4+IENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAw
MDAwMDAwODAwNTAwMzMNCj4+Pj4+PiBDUjI6IDAwMDA1NjUwOGEzMjYwMDAgQ1IzOiAwMDAwMDAw
MTE3YmVjMDAwIENSNDogMDAwMDAwMDAwMDAwMDZmMA0KPj4+Pj4+IENhbGwgVHJhY2U6DQo+Pj4+
Pj4gPFRBU0s+DQo+Pj4+Pj4gZjJmc193cml0ZV9jYWNoZV9wYWdlcyBmcy9mMmZzL2RhdGEuYzoz
MDc4IFtpbmxpbmVdDQo+Pj4+Pj4gX19mMmZzX3dyaXRlX2RhdGFfcGFnZXMgZnMvZjJmcy9kYXRh
LmM6MzI5MCBbaW5saW5lXQ0KPj4+Pj4+IGYyZnNfd3JpdGVfZGF0YV9wYWdlcysweDFjMTkvMHgz
NjAwIGZzL2YyZnMvZGF0YS5jOjMzMTcNCj4+Pj4+PiBkb193cml0ZXBhZ2VzKzB4MzhlLzB4NjQw
IG1tL3BhZ2Utd3JpdGViYWNrLmM6MjYzNA0KPj4+Pj4+IGZpbGVtYXBfZmRhdGF3cml0ZV93YmMg
bW0vZmlsZW1hcC5jOjM4NiBbaW5saW5lXQ0KPj4+Pj4+IF9fZmlsZW1hcF9mZGF0YXdyaXRlX3Jh
bmdlIG1tL2ZpbGVtYXAuYzo0MTkgW2lubGluZV0NCj4+Pj4+PiBmaWxlX3dyaXRlX2FuZF93YWl0
X3JhbmdlKzB4MmJhLzB4M2UwIG1tL2ZpbGVtYXAuYzo3OTQNCj4+Pj4+PiBmMmZzX2RvX3N5bmNf
ZmlsZSsweDZlNi8weDFiMDAgZnMvZjJmcy9maWxlLmM6Mjk0DQo+Pj4+Pj4gZ2VuZXJpY193cml0
ZV9zeW5jIGluY2x1ZGUvbGludXgvZnMuaDozMDQzIFtpbmxpbmVdDQo+Pj4+Pj4gZjJmc19maWxl
X3dyaXRlX2l0ZXIrMHg3NmUvMHgyNzAwIGZzL2YyZnMvZmlsZS5jOjUyNTkNCj4+Pj4+PiBuZXdf
c3luY193cml0ZSBmcy9yZWFkX3dyaXRlLmM6NTkzIFtpbmxpbmVdDQo+Pj4+Pj4gdmZzX3dyaXRl
KzB4N2U5LzB4ZTAwIGZzL3JlYWRfd3JpdGUuYzo2ODYNCj4+Pj4+PiBrc3lzX3dyaXRlKzB4MTlk
LzB4MmQwIGZzL3JlYWRfd3JpdGUuYzo3MzgNCj4+Pj4+PiBkb19zeXNjYWxsX3g2NCBhcmNoL3g4
Ni9lbnRyeS9zeXNjYWxsXzY0LmM6NjMgW2lubGluZV0NCj4+Pj4+PiBkb19zeXNjYWxsXzY0KzB4
ZjcvMHg0NzAgYXJjaC94ODYvZW50cnkvc3lzY2FsbF82NC5jOjk0DQo+Pj4+Pj4gZW50cnlfU1lT
Q0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NzcvMHg3Zg0KPj4+Pj4+IFJJUDogMDAzMzoweDdmOGJh
YjdhZTQ5ZA0KPj4+Pj4+IENvZGU6IDAyIGI4IGZmIGZmIGZmIGZmIGMzIDY2IDBmIDFmIDQ0IDAw
IDAwIGYzIDBmIDFlIGZhIDQ4IDg5IGY4IDQ4IDg5IGY3IDQ4IDg5IGQ2IDQ4IDg5IGNhIDRkIDg5
IGMyIDRkIDg5IGM4IDRjIDhiIDRjIDI0IDA4IDBmIDA1IDw0OD4gM2QgMDEgZjAgZmYgZmYgNzMg
MDEgYzMgNDggYzcgYzEgYTggZmYgZmYgZmYgZjcgZDggNjQgODkgMDEgNDgNCj4+Pj4+PiBSU1A6
IDAwMmI6MDAwMDdmOGJhYzViNGY5OCBFRkxBR1M6IDAwMDAwMjQ2IE9SSUdfUkFYOiAwMDAwMDAw
MDAwMDAwMDAxDQo+Pj4+Pj4gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDdmOGJhYmEy
NjE4MCBSQ1g6IDAwMDA3ZjhiYWI3YWU0OWQNCj4+Pj4+PiBSRFg6IDAwMDAwMDAwMDAwMGZmYmQg
UlNJOiAwMDAwMjAwMDAwMDAwMjQwIFJESTogMDAwMDAwMDAwMDAwMDAwNw0KPj4+Pj4+IFJCUDog
MDAwMDdmOGJhYjg0ODI2OCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5OiAwMDAwMDAwMDAwMDAw
MDAwDQo+Pj4+Pj4gUjEwOiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDI0NiBS
MTI6IDAwMDAwMDAwMDAwMDAwMDANCj4+Pj4+PiBSMTM6IDAwMDA3ZjhiYWJhMjYyMTggUjE0OiAw
MDAwN2Y4YmFiYTI2MTgwIFIxNTogMDAwMDdmOGJhYzU5NTAwMA0KPj4+Pj4+IDwvVEFTSz4NCj4+
Pj4+PiBNb2R1bGVzIGxpbmtlZCBpbjoNCj4+Pj4+PiAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAw
MDAwMDAwIF0tLS0NCj4+Pj4+PiBSSVA6IDAwMTA6ZjJmc19hbGxfY2x1c3Rlcl9wYWdlX3JlYWR5
KzB4MTA2LzB4NTUwIGZzL2YyZnMvY29tcHJlc3MuYzo4NTcNCj4+Pj4+PiBDb2RlOiAwMCA4YiA0
ZCAwMCA0OCA4OSBkOCA0OCBjMSBlOCAyMCA3NCAxOSA0OCA4OSBkOCAzMSBkMiA0OCBmNyBmMSA0
OCA4OSBkNSBlYiAxNCA0OCA4OSA1YyAyNCAxMCBlOCA0MCBhNCA2ZCBmZCBlYiAyZCA4OSBkOCAz
MSBkMiA8Zjc+IGYxIDg5IGQ1IDMxIGZmIDQ4IDg5IGVlIGU4IDBjIGE5IDZkIGZkIDQ4IDg1IGVk
IDc0IDBjIGU4IDIyIGE0DQo+Pj4+Pj4gUlNQOiAwMDE4OmZmZmZjOTAwMDY2MTZlNjAgRUZMQUdT
OiAwMDAxMDI0Ng0KPj4+Pj4+IFJBWDogMDAwMDAwMDAwMDAwMDAwMyBSQlg6IDAwMDAwMDAwMDAw
MDAwMDMgUkNYOiAwMDAwMDAwMDAwMDAwMDAwDQo+Pj4+Pj4gUkRYOiAwMDAwMDAwMDAwMDAwMDAw
IFJTSTogMDAwMDAwMDAwMDAwMDAwMCBSREk6IDAwMDAwMDAwMDAwMDAwMDANCj4+Pj4+PiBSQlA6
IGZmZmZjOTAwMDY2MTcyNzAgUjA4OiBmZmZmZmZmZjg0NTUyZDI2IFIwOTogMDAwMDAwMDAwMDAw
MDAwMA0KPj4+Pj4+IFIxMDogZmZmZjg4ODE1NWFkMjAwMCBSMTE6IGZmZmZmZmZmODFkMmFhMjYg
UjEyOiAwMDAwMDAwMDAwMDAwMDAxDQo+Pj4+Pj4gUjEzOiBkZmZmZmMwMDAwMDAwMDAwIFIxNDog
MDAwMDAwMDAwMDAwMDAxMCBSMTU6IGZmZmZjOTAwMDY2MTcyNjANCj4+Pj4+PiBGUzogIDAwMDA3
ZjhiYWM1YjU2NDAoMDAwMCkgR1M6ZmZmZjg4ODIyMGYwMjAwMCgwMDAwKSBrbmxHUzowMDAwMDAw
MDAwMDAwMDAwDQo+Pj4+Pj4gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAw
MDA4MDA1MDAzMw0KPj4+Pj4+IENSMjogMDAwMDU2NTA4YTMyNjAwMCBDUjM6IDAwMDAwMDAxMTdi
ZWMwMDAgQ1I0OiAwMDAwMDAwMDAwMDAwNmYwDQo+Pj4+Pj4gLS0tLS0tLS0tLS0tLS0tLQ0KPj4+
Pj4+IENvZGUgZGlzYXNzZW1ibHkgKGJlc3QgZ3Vlc3MpOg0KPj4+Pj4+IDA6IDAwIDhiIDRkIDAw
IDQ4IDg5ICAgICBhZGQgICAgJWNsLC0weDc2YjdmZmIzKCVyYngpDQo+Pj4+Pj4gNjogZDggNDgg
YzEgICAgICAgICAgICAgIGZtdWxzICAtMHgzZiglcmF4KQ0KPj4+Pj4+IDk6IGU4IDIwIDc0IDE5
IDQ4ICAgICAgICBjYWxsICAgMHg0ODE5NzQyZQ0KPj4+Pj4+IGU6IDg5IGQ4ICAgICAgICAgICAg
ICAgICBtb3YgICAgJWVieCwlZWF4DQo+Pj4+Pj4gMTA6IDMxIGQyICAgICAgICAgICAgICAgICB4
b3IgICAgJWVkeCwlZWR4DQo+Pj4+Pj4gMTI6IDQ4IGY3IGYxICAgICAgICAgICAgICBkaXYgICAg
JXJjeA0KPj4+Pj4+IDE1OiA0OCA4OSBkNSAgICAgICAgICAgICAgbW92ICAgICVyZHgsJXJicA0K
Pj4+Pj4+IDE4OiBlYiAxNCAgICAgICAgICAgICAgICAgam1wICAgIDB4MmUNCj4+Pj4+PiAxYTog
NDggODkgNWMgMjQgMTAgICAgICAgIG1vdiAgICAlcmJ4LDB4MTAoJXJzcCkNCj4+Pj4+PiAxZjog
ZTggNDAgYTQgNmQgZmQgICAgICAgIGNhbGwgICAweGZkNmRhNDY0DQo+Pj4+Pj4gMjQ6IGViIDJk
ICAgICAgICAgICAgICAgICBqbXAgICAgMHg1Mw0KPj4+Pj4+IDI2OiA4OSBkOCAgICAgICAgICAg
ICAgICAgbW92ICAgICVlYngsJWVheA0KPj4+Pj4+IDI4OiAzMSBkMiAgICAgICAgICAgICAgICAg
eG9yICAgICVlZHgsJWVkeA0KPj4+Pj4+ICogMmE6IGY3IGYxICAgICAgICAgICAgICAgICBkaXYg
ICAgJWVjeCA8LS0gdHJhcHBpbmcgaW5zdHJ1Y3Rpb24NCj4+Pj4+PiAyYzogODkgZDUgICAgICAg
ICAgICAgICAgIG1vdiAgICAlZWR4LCVlYnANCj4+Pj4+PiAyZTogMzEgZmYgICAgICAgICAgICAg
ICAgIHhvciAgICAlZWRpLCVlZGkNCj4+Pj4+PiAzMDogNDggODkgZWUgICAgICAgICAgICAgIG1v
diAgICAlcmJwLCVyc2kNCj4+Pj4+PiAzMzogZTggMGMgYTkgNmQgZmQgICAgICAgIGNhbGwgICAw
eGZkNmRhOTQ0DQo+Pj4+Pj4gMzg6IDQ4IDg1IGVkICAgICAgICAgICAgICB0ZXN0ICAgJXJicCwl
cmJwDQo+Pj4+Pj4gM2I6IDc0IDBjICAgICAgICAgICAgICAgICBqZSAgICAgMHg0OQ0KPj4+Pj4+
IDNkOiBlOCAgICAgICAgICAgICAgICAgICAgLmJ5dGUgMHhlOA0KPj4+Pj4+IDNlOiAyMiAgICAg
ICAgICAgICAgICAgICAgLmJ5dGUgMHgyMg0KPj4+Pj4+IDNmOiBhNCAgICAgICAgICAgICAgICAg
ICAgbW92c2IgICVkczooJXJzaSksJWVzOiglcmRpKQ0KPj4+Pj4+DQo+Pj4+Pj4gQmVzdCwNCj4+
Pj4+PiBTaHVhbmdwZW5nDQoNCg0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
