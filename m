Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0A79006DA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jun 2024 16:40:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sFale-000382-ME;
	Fri, 07 Jun 2024 14:40:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.g.garry@oracle.com>) id 1sFald-00037v-36
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IUO4SSUqyWoDjgxdbi1kypH4pkGBeTwSBuatOt9ood0=; b=dFTVlzfz+9LpA8+sk2aEbyY7d+
 PNDKi+TGOgP9MFrxr4K6lYeqz5iHRXWxADgOjX0EdAgKdPNEiZ5nl6VqVC3OA7kybgOR1ZIvt0DWu
 DiT0bCmt9x28/I9UcgRn++o5TYjGOWawQ9FJm916/nFHKQgePXPast/QRMbd2jUtJjBQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IUO4SSUqyWoDjgxdbi1kypH4pkGBeTwSBuatOt9ood0=; b=XvkzHH5N0Cg4um03najSds2afd
 UyIWppl45OC7CtLdhszh4b9UT5fCYyKo+HXRc5TA1BVTH85eZSRVELW19Z/lVOfv2aQkVm2Wpx2N6
 ZModzCJLUsSmlFMS3SCkpYpRKb0AeL6kQXqntFmNkQOA99ZXLYB7wFWVx4anZCNxz/f8=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sFald-0002xx-80 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:40:33 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 457CuhfC029475; Fri, 7 Jun 2024 14:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=IUO4SSUqyWoDjgxdbi1kypH4pkGBeTwSBuatOt9ood0=;
 b=P2VSXBS+9gDoBNmCDV/IArKcil4zpQd/RCdUzz2FxpqvGFNDiGMpwpnMluYBft7AtRGq
 DJMrTnT0dZi9uhzgIoMUfPT4cUUgnW/uBMDqcwgZ3VuFmA8LxpO8aNdqBH7v6HNR8QVi
 lMGbAA7bBLj8Mr/OKdsMLatpjSLAk8q3HXwTqHZj2l3MrMjfkLwOUdKDvx7gVSAKlmQd
 Wre1JVYwtJWzB+k8DUUCfrICGXDIdkWaa/ePUNjsUQr299RCT3+79dnHZ9s8Y4w9SAE7
 HT5BgkDiIpWeZnwFniYiNG4/1+pqPQkd9LIUjGmIaFyRoGYQqcgXQDFCTu/VyzZhK4m1 1g== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbuswshb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:40:05 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 457DL9r4025127; Fri, 7 Jun 2024 14:40:05 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ygrtd2yuq-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:40:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SS/aNk5B4lQEp+384vNX3kd4hLjN7kM+9Q6cEhzgej1It8zUWMJ5nvgHfZKO9Oznez6R1irWhpgc98KkkYDevoWCyHpY8XOunYECVOiV4c0+hMo6xgvUX3EJWncI5otJnrR+9b28xT8izua37MhMzywcW4Mov8C8zKioJwwlT5wiXeBIQ8nV5ikFuJhUZ5SHWEVz0FvTq4A8ec9QIIPeglBNzeRI3wjOrjSjh9atWaINXKn8tzgFflFkbOLa2HViFNTdTFxa1cWp1PrkMxJ/WtgSGRWHG6wCMDpX9HrNAZmaqHcIVUXv5yNmmSBMyIZ+Hr1P6kzGC5GZVe8T2VOfrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUO4SSUqyWoDjgxdbi1kypH4pkGBeTwSBuatOt9ood0=;
 b=YlUuZyNU2pc2AojUASqD1DDnl2XBZMdPCSOd5CxmE/3eGK962LJChUa/+l6hu8/+bUtJ6lmbFlErt3i4fexgcnG0R8v2pnWkiflDpPVwKEFotcZafjPhfGk2KqcypSUtnbzNOauXLK6JBF0KMw2FsdVVPlEK13LUnVVAtqoLLU3Tk/0DJJdRt5cQUNAMhTZag8RznlITA4PxIX0h//o4lJBn6unnu99EZk/g7QpglNmVhFqJFCwUvnyujpgvmvp+IifR9qCI/g4fVt8Bhq30RNsBXw5T7wXVOB8x+aGraxfzwwP0hVaAU5BNcEEc44h2iZ798tcky7pNcWCDav68Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUO4SSUqyWoDjgxdbi1kypH4pkGBeTwSBuatOt9ood0=;
 b=GqEtH2C6skxJjf+/unXNkw9JApCZm8+7q8wYMBSTRfTZN4TpQGM89WRFAMgIzSTMCtZw7+QQ+DcgO2vyfjPljkH1vYS/mh6UYHMeb0R9Wcxbi/5OAVmjWCKFBTbp75enFxSLUzfAxtHWS5olTpEMbRmaNJraBFnaMrcRgvSV94A=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by BY5PR10MB4226.namprd10.prod.outlook.com (2603:10b6:a03:210::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 14:40:01 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%6]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 14:40:01 +0000
To: axboe@kernel.dk, tytso@mit.edu, dchinner@redhat.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, djwong@kernel.org,
 jack@suse.com, chandan.babu@oracle.com, hch@lst.de
Date: Fri,  7 Jun 2024 14:38:59 +0000
Message-Id: <20240607143919.2622319-3-john.g.garry@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240607143919.2622319-1-john.g.garry@oracle.com>
References: <20240607143919.2622319-1-john.g.garry@oracle.com>
X-ClientProxiedBy: MN2PR06CA0025.namprd06.prod.outlook.com
 (2603:10b6:208:23d::30) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|BY5PR10MB4226:EE_
X-MS-Office365-Filtering-Correlation-Id: a6bf1a89-77bc-43f8-24d8-08dc86ffb637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|7416005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g9/upM+ygLm0jS3SB9r8ZTZJxD6W2W407JcP8DRnOCpPrdO6P/VZbtW+RSTR?=
 =?us-ascii?Q?kPhRpeMtXC7GVNElJx0S+PcIk+yIcPLnfcHXN7uEUYSWUbnI2zw7ycVkjne/?=
 =?us-ascii?Q?vhvbBxGZKjlfYGvEYfYEkesSHgw3x1573CzlcVJ5C2W/8to+4zctSQyW2FxW?=
 =?us-ascii?Q?Dsjd75/BuelmPkGylXrcGblLvU1YR6zGgidTU33sukPUIrxUCHY5ncRUjKVE?=
 =?us-ascii?Q?izQHkRz01YnQCyydZDhivMXNESEmpf3bQYEkDmPTpG/qWOc7bL3VfMvCvP6n?=
 =?us-ascii?Q?4nyKdOa5MtFoiWz0KN6QmGcfVrK7JvQ+/Re0afAtEZG3oEiuPFWAaaY7Xkf2?=
 =?us-ascii?Q?2X4jGT9tRan3tmS/VEJ4JXTi+fhP9qqbXCkuWQHrfpsEG4W0yIo6FUmORrDD?=
 =?us-ascii?Q?/pnZsFUizfckyM8PQ8uIOUFqvSPVMYVN5xH2S+JYAJuvHtLb2mlki4vJ5v8I?=
 =?us-ascii?Q?7mW/+kvKz5UCnh6ssGNZiDWQR8PX9s+TLPDy04CO483KUOe+DcksAdyan4ER?=
 =?us-ascii?Q?yVsfSutsl4whkJgXVQR01jLtmzfuCKB8caAFLWrkIf5FHby+B9bHHqFFmiFb?=
 =?us-ascii?Q?1tTnlkSorzLX8YOJNHRKo1JwzlF1CjK/lCJGtZlk63szpjeLszffBYguHHCk?=
 =?us-ascii?Q?sai6FmegCqlkom5BzRlAo0ZN8J+ma1Pr10a7toGSh5M3Pyb+7MNS4j+8vGh0?=
 =?us-ascii?Q?YVFplIjKnIEvJE2lTQDSVRDH6h+u4KPPDEpraScbnniLDODm8O998czZaOxs?=
 =?us-ascii?Q?e7aVYs9Pnmqh+hPx4/Jsl2aniQHuxpwW8xlSB+RLpwRCqCwPoX5Q1YC/st9c?=
 =?us-ascii?Q?ojdb0UqVFmHwUXGbbIcwlilfv+BXgnCGvGpxB3Mg9YkIdGqj04Ku8EBXSwtR?=
 =?us-ascii?Q?2CBJnN0Riz2DcSY7NHhJoTcn7Ygf5e0pBhHd4Qjmch2chx70hM9c0r32c1aj?=
 =?us-ascii?Q?MBFapH8ya2ogFsNm8bKxqajGougnGTHbQs2wPin0BskEJOlpuEqSLB5oKeeS?=
 =?us-ascii?Q?yc3+DXfLrVB3cD2sqbKUnyOV5Zw5//QPZ9ukl1sDNQYhVFNeYxnkSb+2yUTE?=
 =?us-ascii?Q?YhfTmzjpA1EC34BIdNEZvvB7HAPA+ETkGaTrqGV9jL0vQvMGwwIommFXVE2l?=
 =?us-ascii?Q?FzUDXcw6m9o18GylTKXFz6RKnpWDP7XY/ul1QaoZumNVZutCrd+cjAiLM/aN?=
 =?us-ascii?Q?w6YkiRZ+pjh4N3qLFNPv9XsmECrrdMuBDbLoMl17ZAoE2XQ6ZBF/Ym+1weo6?=
 =?us-ascii?Q?OcP+DYMfHr3wEnophylS+vXcQOMJyz7BtTN/mnz3ocjf//tbUSLyV8gPxRit?=
 =?us-ascii?Q?cTM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB4313.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(7416005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MNGjA3FnPB1T5kQvAsUaYrQSU1P/BbqxJm1SOiCXi4Mz1t76y72Be3Iu3Vs4?=
 =?us-ascii?Q?GEZqHsAGrBIZffdGq1Y3XRlA7zOzJChG9movVzVYgJiZRT6wLUw53cmHVocy?=
 =?us-ascii?Q?vlgqOjwlxWSwfjeujuTa23Cm7ffcWdhZXmL44ZMaRASOzJOGBftjTsuVmKD9?=
 =?us-ascii?Q?ySNvv1fmn42X27X4FKE128+4rKWk0OEUpsnpmlQS2bA7OItr3Pto/GBR55o5?=
 =?us-ascii?Q?hmiiGo1nu1hPeXOynSm17PQIpsQ/F4Z4Ch97gsWvY6ZvZZz8qD4e/zDqn3Z4?=
 =?us-ascii?Q?ddKa/F0tY2e8TY4fvzXq0l+hkg/Yr3cRMf4J168VRCbYQ3mjcWU3Q76pdMkt?=
 =?us-ascii?Q?IPBSyOLuBJLlkXrF/aAe62LuD+/Wsqd/dMsPMU+m0sl03TPl10NB9PBrdSmJ?=
 =?us-ascii?Q?AO1LMCmQtJOYnhwrqK11oqfIjyFpvOqNM8BL5SWAXsvWE0jRIFlPDXJfjP+d?=
 =?us-ascii?Q?tTTsMaxe5MiOxB1rssgwa9JDwtPTAnYy/z+IfES58a4Z9lNvZZAQSB8CTA1w?=
 =?us-ascii?Q?61/kLxZakLjwS03QFP5lN8D0wZIb6NR8ALFdL+ynTPXYYmz9rqGkmMWrGHwI?=
 =?us-ascii?Q?Azon0zyvaND7JiFHIm+hyC3nBdwUvK8izUfRrzH+GTPlGvaRbkLJWVvlc0HR?=
 =?us-ascii?Q?LS4d/P1PGOBETqekmSpm6t6pP/a1x6oIucpOq5M+DEygft+awl6vwj34Qpkr?=
 =?us-ascii?Q?DVaCTUo5Kj8eYJ+ZG+RqTKLZr5ziT+XN6GCAwJkCEP7i9NrDq7UIyheRP7rr?=
 =?us-ascii?Q?8ygA7Z7BP3QurBe+rUE6IL+bepTeBY/ViWjfBwh/ck/ZZK9o2mm0RkrnccJ9?=
 =?us-ascii?Q?66Qg6qqYUTaLPj9Vx6ygv5eL4sVqD1a6617RGNrIUqys1SI7GIpJTVhDZJUm?=
 =?us-ascii?Q?mzfGNfwZYddTVf/orYF5iv78ozq0jlxu49T615ok1XzGboawviILrkS2Y1/w?=
 =?us-ascii?Q?0YYt4hxCRVGQJa5R6aAT4SFWMUlG4OtKWqvE7kN/wOF2tX+juN9fjLxgmmbg?=
 =?us-ascii?Q?TDK+29HYDf6qWAOTXwt+YMK6VBRDst3HQ1a9KQYOjEnCLzjLwcxzog9jm7zI?=
 =?us-ascii?Q?9N54pTH5PdBs58ryhf3bB6hodSX+VSprFEhBceLqPgsXD09gNbr3qE5tM2Uy?=
 =?us-ascii?Q?7vAMGpmUDIEh/U8BlThmR76zKSMS/JXfvgR20CMpoB7XUgqbNSfQ7b5jRZBU?=
 =?us-ascii?Q?HTH166qzz2N/0/X40TFVUw/bkv1JHaHj4UH4ZxzIcN0Br7ujH+YmuuebfIPN?=
 =?us-ascii?Q?ugRdY6veesqAWJB0YbJ2aSXNJAOFj1Ar5wnUAkYH155O0hG9yOuIT7Evljw6?=
 =?us-ascii?Q?IodtVi6WXuIbdfScAKkP79BfhHJJZE2ueiwoLed2P36b69dZ9J3YyxYjHoCD?=
 =?us-ascii?Q?IX0LK/D0qH/9pcTtNm4h4Iso0uBjCYRJu7tI7YFce3YJcNaj+WkaAoJ5tKcv?=
 =?us-ascii?Q?l+mtOPUaSmq9MkYEedi4BWzLjkL+hMDsjyckVm2HHIXBbR4UcxxfOooqDRnM?=
 =?us-ascii?Q?m53xJbxtdC3ZSQI669wzk8ILGCAU3WAMH70y0svWoXYOYWEBtJJo6jvslotx?=
 =?us-ascii?Q?8qZ31UeTs/py+kiJz2hHWs3ZNHmGvQRijUnZxefOGsmcgSbfJcrgcEuW5i7n?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: fRyARwKNAltBaiNt9M9ZpWPKB35jvd2GHyO42XbDZT7FUjoKw19jZE3Jrg/Z9NGnjKPUToHoU3iFY0b5dLjLYVQqqTgbKdjGjwxYnl+qLQRzkbudsZgPVDtUvvSevafVAtJEdhucbhzLEPD88WoCmbY1jmIN6I/byIVdOy9oiaEetBhI9RqDoaM3jgjON/jvDKDhjbpD/rjHIs+txm6i1yC4+/6kKp8OAobT+8NlXCpyuq/MoBK91RRFDsF3nG3zNzpqudMfTOCi4a1GanLzomHqn7syZf+BUx7Rq9DDtarFOoK4LY+tQV3UZZH4dKpc3yXXROuPL4ugpCrJwO8hXGu2Jabip6YXmXmrnMOc33YIXUNKLPN0V3K3JNssAIc4BChz6ttM/LQVXRLOxRic/PIhqO18ouhu6JtkiSlvx5FiRiJpmNt0zDFx+/ZSMomuLmEZO926wzrssfMRgM8N4tw+WvkQvfXLB+mQkwte86a9oj0SefNDFCpF2FcxQMnqJIOxnn4cPE3OY5Dh0YkBK3CLJgKTlPba6UVbfcMb1C/+cvnFxv5qMaXju6m/1hy/3bQnZRSs+iYpT8fdBF62qPxGtuHyEatWSq0Xh+N/T44=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bf1a89-77bc-43f8-24d8-08dc86ffb637
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 14:40:01.3277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxMCehKMZw1gCGolE4+3u4iRKYtYZo68p0NplavfyXI+ObEON0MoNjHFKBCZxR2WsflAmPP1EqWyk6fw4hxYoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4226
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_08,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406070108
X-Proofpoint-ORIG-GUID: hG-1v195WL7x8KuHgt6a1tx81_kc99S-
X-Proofpoint-GUID: hG-1v195WL7x8KuHgt6a1tx81_kc99S-
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Allow filesystems to set the io_block_size for sub-fs block
 size zeroing, as in future we will want to extend this feature to support
 zeroing of block sizes of larger than the inode block size. The value in
 io_block_size does not have to be a power-of-2, so fix up zeroing code to
 handle that. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [205.220.177.32 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.177.32 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.177.32 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sFald-0002xx-80
Subject: [f2fs-dev] [PATCH v4 02/22] iomap: Allow filesystems set IO block
 zeroing size
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
From: John Garry via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: John Garry <john.g.garry@oracle.com>
Cc: gfs2@lists.linux.dev, catherine.hoang@oracle.com, agruenba@redhat.com,
 martin.petersen@oracle.com, ritesh.list@gmail.com, miklos@szeredi.hu,
 John Garry <john.g.garry@oracle.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 mcgrof@kernel.org, mikulas@artax.karlin.mff.cuni.cz,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Allow filesystems to set the io_block_size for sub-fs block size zeroing,
as in future we will want to extend this feature to support zeroing of
block sizes of larger than the inode block size.

The value in io_block_size does not have to be a power-of-2, so fix up
zeroing code to handle that.

Signed-off-by: John Garry <john.g.garry@oracle.com>
---
 block/fops.c          |  1 +
 fs/btrfs/inode.c      |  1 +
 fs/erofs/data.c       |  1 +
 fs/erofs/zmap.c       |  1 +
 fs/ext2/inode.c       |  1 +
 fs/ext4/extents.c     |  1 +
 fs/ext4/inode.c       |  1 +
 fs/f2fs/data.c        |  1 +
 fs/fuse/dax.c         |  1 +
 fs/gfs2/bmap.c        |  1 +
 fs/hpfs/file.c        |  1 +
 fs/iomap/direct-io.c  | 23 +++++++++++++++++++----
 fs/xfs/xfs_iomap.c    |  1 +
 fs/zonefs/file.c      |  2 ++
 include/linux/iomap.h |  2 ++
 15 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index 9d6d86ebefb9..020443078630 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -402,6 +402,7 @@ static int blkdev_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	iomap->addr = iomap->offset;
 	iomap->length = isize - iomap->offset;
 	iomap->flags |= IOMAP_F_BUFFER_HEAD; /* noop for !CONFIG_BUFFER_HEAD */
+	iomap->io_block_size = i_blocksize(inode);
 	return 0;
 }
 
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 753db965f7c0..665811b1578b 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -7740,6 +7740,7 @@ static int btrfs_dio_iomap_begin(struct inode *inode, loff_t start,
 	iomap->offset = start;
 	iomap->bdev = fs_info->fs_devices->latest_dev->bdev;
 	iomap->length = len;
+	iomap->io_block_size = i_blocksize(inode);
 	free_extent_map(em);
 
 	return 0;
diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index 8be60797ea2f..ea9d2f3eadb3 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -305,6 +305,7 @@ static int erofs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 		if (flags & IOMAP_DAX)
 			iomap->addr += mdev.m_dax_part_off;
 	}
+	iomap->io_block_size = i_blocksize(inode);
 	return 0;
 }
 
diff --git a/fs/erofs/zmap.c b/fs/erofs/zmap.c
index 9b248ee5fef2..6ee89f6a078c 100644
--- a/fs/erofs/zmap.c
+++ b/fs/erofs/zmap.c
@@ -749,6 +749,7 @@ static int z_erofs_iomap_begin_report(struct inode *inode, loff_t offset,
 		if (iomap->offset >= inode->i_size)
 			iomap->length = length + offset - map.m_la;
 	}
+	iomap->io_block_size = i_blocksize(inode);
 	iomap->flags = 0;
 	return 0;
 }
diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
index 0caa1650cee8..7a5539a52844 100644
--- a/fs/ext2/inode.c
+++ b/fs/ext2/inode.c
@@ -862,6 +862,7 @@ static int ext2_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 		iomap->length = (u64)ret << blkbits;
 		iomap->flags |= IOMAP_F_MERGED;
 	}
+	iomap->io_block_size = i_blocksize(inode);
 
 	if (new)
 		iomap->flags |= IOMAP_F_NEW;
diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
index e067f2dd0335..ce3269874fde 100644
--- a/fs/ext4/extents.c
+++ b/fs/ext4/extents.c
@@ -4933,6 +4933,7 @@ static int ext4_iomap_xattr_fiemap(struct inode *inode, struct iomap *iomap)
 	iomap->length = length;
 	iomap->type = iomap_type;
 	iomap->flags = 0;
+	iomap->io_block_size = i_blocksize(inode);
 out:
 	return error;
 }
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 4bae9ccf5fe0..3ec82e4d71c4 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3235,6 +3235,7 @@ static void ext4_set_iomap(struct inode *inode, struct iomap *iomap,
 		iomap->bdev = inode->i_sb->s_bdev;
 	iomap->offset = (u64) map->m_lblk << blkbits;
 	iomap->length = (u64) map->m_len << blkbits;
+	iomap->io_block_size = i_blocksize(inode);
 
 	if ((map->m_flags & EXT4_MAP_MAPPED) &&
 	    !ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS))
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b9b0debc6b3d..6c12641b9a7b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4233,6 +4233,7 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 		}
 		iomap->addr = IOMAP_NULL_ADDR;
 	}
+	iomap->io_block_size = i_blocksize(inode);
 
 	if (map.m_flags & F2FS_MAP_NEW)
 		iomap->flags |= IOMAP_F_NEW;
diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index 12ef91d170bb..68ddc74cb31e 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -577,6 +577,7 @@ static int fuse_iomap_begin(struct inode *inode, loff_t pos, loff_t length,
 	iomap->flags = 0;
 	iomap->bdev = NULL;
 	iomap->dax_dev = fc->dax->dev;
+	iomap->io_block_size = i_blocksize(inode);
 
 	/*
 	 * Both read/write and mmap path can race here. So we need something
diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 1795c4e8dbf6..8d2de42b1da9 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -927,6 +927,7 @@ static int __gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
 
 out:
 	iomap->bdev = inode->i_sb->s_bdev;
+	iomap->io_block_size = i_blocksize(inode);
 unlock:
 	up_read(&ip->i_rw_mutex);
 	return ret;
diff --git a/fs/hpfs/file.c b/fs/hpfs/file.c
index 1bb8d97cd9ae..5d2718faf520 100644
--- a/fs/hpfs/file.c
+++ b/fs/hpfs/file.c
@@ -149,6 +149,7 @@ static int hpfs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 		iomap->addr = IOMAP_NULL_ADDR;
 		iomap->length = 1 << blkbits;
 	}
+	iomap->io_block_size = i_blocksize(inode);
 
 	hpfs_unlock(sb);
 	return 0;
diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index f3b43d223a46..5be8d886ab4a 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -277,7 +277,7 @@ static loff_t iomap_dio_bio_iter(const struct iomap_iter *iter,
 {
 	const struct iomap *iomap = &iter->iomap;
 	struct inode *inode = iter->inode;
-	unsigned int fs_block_size = i_blocksize(inode), pad;
+	u64 io_block_size = iomap->io_block_size;
 	loff_t length = iomap_length(iter);
 	loff_t pos = iter->pos;
 	blk_opf_t bio_opf;
@@ -287,6 +287,7 @@ static loff_t iomap_dio_bio_iter(const struct iomap_iter *iter,
 	int nr_pages, ret = 0;
 	size_t copied = 0;
 	size_t orig_count;
+	unsigned int pad;
 
 	if ((pos | length) & (bdev_logical_block_size(iomap->bdev) - 1) ||
 	    !bdev_iter_is_aligned(iomap->bdev, dio->submit.iter))
@@ -355,7 +356,14 @@ static loff_t iomap_dio_bio_iter(const struct iomap_iter *iter,
 
 	if (need_zeroout) {
 		/* zero out from the start of the block to the write offset */
-		pad = pos & (fs_block_size - 1);
+		if (is_power_of_2(io_block_size)) {
+			pad = pos & (io_block_size - 1);
+		} else {
+			loff_t _pos = pos;
+
+			pad = do_div(_pos, io_block_size);
+		}
+
 		if (pad)
 			iomap_dio_zero(iter, dio, pos - pad, pad);
 	}
@@ -429,9 +437,16 @@ static loff_t iomap_dio_bio_iter(const struct iomap_iter *iter,
 	if (need_zeroout ||
 	    ((dio->flags & IOMAP_DIO_WRITE) && pos >= i_size_read(inode))) {
 		/* zero out from the end of the write to the end of the block */
-		pad = pos & (fs_block_size - 1);
+		if (is_power_of_2(io_block_size)) {
+			pad = pos & (io_block_size - 1);
+		} else {
+			loff_t _pos = pos;
+
+			pad = do_div(_pos, io_block_size);
+		}
+
 		if (pad)
-			iomap_dio_zero(iter, dio, pos, fs_block_size - pad);
+			iomap_dio_zero(iter, dio, pos, io_block_size - pad);
 	}
 out:
 	/* Undo iter limitation to current extent */
diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
index 378342673925..ecb4cae88248 100644
--- a/fs/xfs/xfs_iomap.c
+++ b/fs/xfs/xfs_iomap.c
@@ -127,6 +127,7 @@ xfs_bmbt_to_iomap(
 	}
 	iomap->offset = XFS_FSB_TO_B(mp, imap->br_startoff);
 	iomap->length = XFS_FSB_TO_B(mp, imap->br_blockcount);
+	iomap->io_block_size = i_blocksize(VFS_I(ip));
 	if (mapping_flags & IOMAP_DAX)
 		iomap->dax_dev = target->bt_daxdev;
 	else
diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
index 3b103715acc9..bf2cc4bee309 100644
--- a/fs/zonefs/file.c
+++ b/fs/zonefs/file.c
@@ -50,6 +50,7 @@ static int zonefs_read_iomap_begin(struct inode *inode, loff_t offset,
 		iomap->addr = (z->z_sector << SECTOR_SHIFT) + iomap->offset;
 		iomap->length = isize - iomap->offset;
 	}
+	iomap->io_block_size = i_blocksize(inode);
 	mutex_unlock(&zi->i_truncate_mutex);
 
 	trace_zonefs_iomap_begin(inode, iomap);
@@ -99,6 +100,7 @@ static int zonefs_write_iomap_begin(struct inode *inode, loff_t offset,
 		iomap->type = IOMAP_MAPPED;
 		iomap->length = isize - iomap->offset;
 	}
+	iomap->io_block_size = i_blocksize(inode);
 	mutex_unlock(&zi->i_truncate_mutex);
 
 	trace_zonefs_iomap_begin(inode, iomap);
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 6fc1c858013d..d63a35b77907 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -103,6 +103,8 @@ struct iomap {
 	void			*private; /* filesystem private */
 	const struct iomap_folio_ops *folio_ops;
 	u64			validity_cookie; /* used with .iomap_valid() */
+	/* io block zeroing size, not necessarily a power-of-2  */
+	u64			io_block_size;
 };
 
 static inline sector_t iomap_sector(const struct iomap *iomap, loff_t pos)
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
