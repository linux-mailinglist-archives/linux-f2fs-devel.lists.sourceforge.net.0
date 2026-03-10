Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPnmBMiSr2kragIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 04:40:56 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E59244EE9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 04:40:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prAnFQeon6F2Mjm43JqEQSpPMJjwn6IGx/NotvHvka4=; b=C+Og99vx5OsiMWWHOvf9n6RaNQ
	0QRBU9GguzaUOcJpFnljd9ddGPkMQeNMF4mGHyMxyK55/PYxu7co0wMliDzlrLFvNinKwmTi9NVGT
	d8pYg6H5360WjsUTMO79RxyZAHjBGpp+QpMAev2V7yguk8906MxD8ruMxZcNfjTzANpk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vznxa-0000Gc-85;
	Tue, 10 Mar 2026 03:40:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <harry.yoo@oracle.com>) id 1vznxY-0000GT-PT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 03:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ThdFh6eMzzOsm/WCy7aJE6nZD051KYTqO54sNwK5fzA=; b=b/ZSv/q2IrW3eKMVOmAKK91QwU
 4wxt1UYT5pWWq2EUId5nUMKpLjE+q6OPDIE+cWtkwoAj6Bj1hcNin/IhCu3Q9g6JSwAO0bBZk/qKT
 qMF90OGAPsQqUKwibajr+tiyAvfurf5gGSrV5H7zVl5o3jyNQc+iCa6pX+wqD8SdfzCA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ThdFh6eMzzOsm/WCy7aJE6nZD051KYTqO54sNwK5fzA=; b=FVFoUxov7jrqhztp3Pu5RcbtsN
 9nnbvM9hi+V89GjUJxuFoLpZPqWssgDQbJSQUEcoMgJWR1hZWFBwdxV0JKB75scmbXOHVqgE+rjp0
 ITg+9/RwsSdLcqyBrP6Oq52Kl7/yGnJiarZNudZr83TLkTOty9nfUFnwY6nQsFZ5zD/w=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vznxY-0004NC-7g for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 03:40:40 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 629IN2Mi2347242; Tue, 10 Mar 2026 03:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=ThdFh6eMzzOsm/WCy7
 aJE6nZD051KYTqO54sNwK5fzA=; b=Fy5JK36Fyt6/34/HDgE6xhSt+nsTxu06iS
 cOBpZbmGFPiyD3jg4KsCzO8+UEGlBLVbfoeo/XZ97U37yuy4PNqmagLd0QzkpXvh
 sFJrYRQxzNFwvJRRF+vXADbqdDuJr4IvulrUfrXE2qPIDPLlTkcdwt35jcC7vTtI
 1S49iRKZpbu6oC0cGeX5F93nX4K5K/sNfpH70q43RqPDY5/Qrvghys5ufe6NitEm
 7eTpfmLsviQ+HqU9Nc3EZSOzBo8tpmLLCzKEJZw8AI5DOkq2njzs9IDeumICFFLn
 +X263fS0b7pLUYkPTUBaP/cdiWy/6hTl0st61Qc3lUuV0kjjXS6g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4csmmaa397-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2026 03:40:08 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 62A36fsX020417; Tue, 10 Mar 2026 03:40:07 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4crafdhhm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2026 03:40:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VsGy8DHABQhBAfg9dMM8al7A/l0eK7eLDs17oAD3b4+J5qEUjeaDYj+RH1rA/9bY9yuFBH8hWo71XnGb4xwMgNA62EW9U9oRQauzxWy5NEzJiCmM/o/FpgcBgdGqXTc3Ovh7AhEMihPiTaDYqcMG9vyQuDLMOlPMsfXgOw357fYmXMnKrF/h6KGfpMyOxktBdmHvKmeySDxUnuzD+/ddtFcyDfDbwl9WD155at/Jis1fK0/Wpwlg60oFdt3cAQCoAfzmfxD+8EonVZSwWgdUrZAWLpT0ONEHueMH+A7Bo50bBfe0HfeC5udaVs+5AqaO+gTrn5DuYww+stp5GwhV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThdFh6eMzzOsm/WCy7aJE6nZD051KYTqO54sNwK5fzA=;
 b=FEKpwnw3iYrPKrBvwRxqKGKpYmu4AcUaVtHnMo/Yc43fmtkZybdfQbzHpKhyW2VqCGsf1QV8KipzN7CwUdFYi3D2VcRR+9zLlOcUrEfrn+E8DmdurccUVDJzboT7YzZvGGQ3sfhVZ7fDMfZ2/tpW4CbJcUiB8BiOktIvgFKoFIOMb90snfsJvrAQzxE0gdeghrADBH6zmzh/5vpda7qrdmsX03rWWnE8SCDRi6iOFW4ZbXBC/uzMGr/8tSib68SDNFsRRz0hVPEMD4Qj36kHTEin0bhsMll8xsAwcdPEE7d8MqZ+prkNNhp5cD+sZeE9+Q1TQUTEXvRqvOD8tH7Yjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThdFh6eMzzOsm/WCy7aJE6nZD051KYTqO54sNwK5fzA=;
 b=RX6drdqahNDdGR1TB1JmN7bLmFfd461ND7KndjHtg8V63UelOAz+EMWSWqUgAskOW3G24mxKbkjPYDkfhiJzj7SYfLMHlFQUItpd61tuL6dU5oLwck5+IpfuqingkvbyfgmkaWN+F6aYEDRXAaq4glLjLFlkm2Wl6nfGzSF/rXY=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by DM3PR10MB7910.namprd10.prod.outlook.com (2603:10b6:0:b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.25; Tue, 10 Mar 2026 03:40:02 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9678.023; Tue, 10 Mar 2026
 03:40:02 +0000
Date: Tue, 10 Mar 2026 12:39:54 +0900
To: Catalin Marinas <catalin.marinas@arm.com>
Message-ID: <aa-SinLe2jrtO1pS@hyeyoo>
References: <698a26d3.050a0220.3b3015.007e.GAE@google.com>
 <20260302034102.3145719-1-wangqing7171@gmail.com>
 <20df8dd1-a32c-489d-8345-085d424a2f12@kernel.org>
 <aaeLT8mnMMj_kPJc@hyeyoo>
 <925a916a-6dfb-48c0-985c-0bdfb96ebd26@kernel.org>
 <aassZV5PjgFx8dSI@arm.com>
Content-Disposition: inline
In-Reply-To: <aassZV5PjgFx8dSI@arm.com>
X-ClientProxiedBy: SEWP216CA0153.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2be::12) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|DM3PR10MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f885e6d-881f-41ab-c212-08de7e56b603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: /B3F1p5wy1xc6TocxIj0aTN/7PYtykCYXtVqdK1Cy+aklg0XRa9aIMzZ1DTJVETr83y1ru+T2U2j/mmiug4oC9NogqWDALz1mAZTiz16/nYHj8nJAQpBvsA0f++8FJ/bKbpI6U2QSWa4iY7h/vHWLRnmgdMGrv+stm4IV4G14bazMzpbYKb4SxQXaAZgOUIhyeUoJh0evtZP5vq1H3GNLOAYL7YpQgmuICxGhFNNvCjgPyCll+EzG2TFL6p4lrslwra7C045wmrrFiMukznAzE/9K7N+XlBZGe4wiMqWaaGXrlHNjOl1oWE2ffN1d1oWonejouU5rGeOZwKPcbdJpidQ5qS70XBX1RJgXmhXOq/AAIr676wzddTNggXTRhtl5N3KfmXhYsueGoeZ6YBbBlMaYnfmFNH/2QRg7IMgYWgO6LxUGVFVPDsegTjKexYuZp+my3N7G9kCsRY8sT8sTZnJLAOPwlOVhPhcLFx9lVY65obMePpB2e2JuMpvFDQ5vrP1A6o21i09S0WAoIWveNQAOYek6Bf5pLXlKfIvlN/9C5mZIEhflIjDHs/UOVFt3Np9vLyZPsNbT2lGEx1+NQAK2pzQOM8LisFZ1xRWhpSS1aNIromTWViaLPkIBhZeYQNKnqy6K0XmjloAM4b4Y29JI4hjXjK9GDsXfLBxhki344jFrqtEk8r8pZL+0kDJNYbfirmK4uyHHtTFlEu0ffI2nM671sRJpPY37urgXTY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR10MB7329.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pI490vobD6Pj0A296trAliB4QEARKkhjyUYB/Fg7PJkaF+ujhyUAZqGPJNmH?=
 =?us-ascii?Q?8ziAmx/46wnshbptHUEMJTdi3/zzsizpHgugmQH7Fb0sRvGgZw/Jcf/e0VVg?=
 =?us-ascii?Q?FAiRBaDQl0KhCawZhF4gz5QErPwvPVruAHcP8AQNcBUOzizoMZoSEwlxKFyK?=
 =?us-ascii?Q?0E16nYtk6dAl75e6HnbksCKz6A4MHyA3pfudzhYc+vGawJjGksmsYuttWQpj?=
 =?us-ascii?Q?5S2hRdgLzrnGi9/rE4mVCnNEimWDY/d2Ueabgxv2pvHtQxEUaTpb5w7QG7lh?=
 =?us-ascii?Q?GjoSIKiBCsgrkEf0LG9FQb+FZJJ4ZRb8ZYUcNvqEErD9aWzw2ih9xpY+7YI+?=
 =?us-ascii?Q?mL390iz4uAHk0cCusFrsFP9VM6Qj+RWStwn3OO5x2S4D+0X1v/7+iD0+7i5L?=
 =?us-ascii?Q?VuzVgASqxYC6UrksUBQ0lRPUyAobSYVfgVJkdWdKUc6ft3o0SwTSSnII2wah?=
 =?us-ascii?Q?QYEdqcn0igZe8fy/D2wb0fp8RgKV2bXUjSI+Eazd7jykQshU6Z5KWiaoWj9h?=
 =?us-ascii?Q?XMVTyFiI4+jqQUncwr3DEmi/LH4z2h+PjbcMPHWJr8yPilCt1VCKRTf3N/Fj?=
 =?us-ascii?Q?hFPh3yyixR66vFKgdcSP1310IsmXwqXH/BA8qolXdeu5cUcbrIr0fpqrUhYD?=
 =?us-ascii?Q?/T4Lb4dcE8GhqvNSfM1+jzQwCeZThR9bL9K9cPdXUJ5qQadeMl/cVQU6/pIU?=
 =?us-ascii?Q?DjkRu2BiKIzshfyZbkWAT35+qRT8B3PzRzCbkcnSXlIet7Z4SBoZj8XaIMnH?=
 =?us-ascii?Q?dagUWqLY8zXaxossAyAIZOGuPNgNT0Y/UTd38ETIrhsHehAQl6lpYWfxBl8M?=
 =?us-ascii?Q?RJlVYlBzmDXCuv+3nlFPqHRRCe5O5Z7mf243Rj6Pow00doq3edkQUCvKwcyG?=
 =?us-ascii?Q?WPbaDUk+FB0HaDe8zgELul+6v5RrY5mZx5XlN1TdlAwDb89YUOP93P5NRJb0?=
 =?us-ascii?Q?yZvxgdVRqscoI3UekODjdHi4pRlGA0l7FwscP8F+zjI+ZIXX7mzlOYqeK1HG?=
 =?us-ascii?Q?65JdgHlA0Aeo+u4XOi4Q/jqDJeo6/PH80PkCbdAb9WIynn/zHW0Ls1gZT01W?=
 =?us-ascii?Q?J/p1vTD2s1XQZGXppzIXkVdGf7AnJUQlS6jfzTcC6234/uUpoAM8l/ZQ8f5t?=
 =?us-ascii?Q?DFJrtVLXeJU+W5mWMyfW1c1bI3L0V/7w5TmY/6/H0YI2nYaHrcxMrMlW4BxI?=
 =?us-ascii?Q?9QMFfqlVfgGHTWggPe8QbddxnTKsNVzflTsb85N1xwwQM9LlRK1BxdizA7xw?=
 =?us-ascii?Q?kw5TkVjAXYYd4fIGUK/aTROdNPO/21Qb1HOvYCO7mLZhuHqlokqaHUOrDfkT?=
 =?us-ascii?Q?JVpHAWviwdaJbczdonpsrlKcFkfZ3SfKYPFVQQ+jG6VHHTlQIwrMEtx//5L/?=
 =?us-ascii?Q?RBLBQXv5omuMaR4YJGBGdequ1w6Ld6CqSRIjJDbRs0nSq8LnyVP+cj4fRqLo?=
 =?us-ascii?Q?f1bWf8bsxoA8R699RrA580dI/B2hV8h9IckQONIQZJ/h6LUmaB81suPd7CHc?=
 =?us-ascii?Q?Suf+CE7qRYDXIACHzJre7iFrXSJVQczgnAjVQQW1MIvU9oBephza9bTumjWo?=
 =?us-ascii?Q?LCqPTBzo/W+ZqtRwkwIecfZMYh5JUlRIHYr0+RJils0AhO5jYv+qNcm61fru?=
 =?us-ascii?Q?AO73W6JHpP/DFlhQ+sxX558E5d/cQUiHfcM2L1MzmfK2kQ6WeNrO+otbUg6I?=
 =?us-ascii?Q?ca5Jlg1y7/jv9q0XBW12myYmK3s1npZltQggk6ShUsnyRud+XdMG1mNKmHWV?=
 =?us-ascii?Q?Psqjkp8k8w=3D=3D?=
X-Exchange-RoutingPolicyChecked: O5qTSthKA9QlTJwz6x0Gr2dt8WlYTvAomH1AeCU2fk0yE/mjydogs9I7L/2mUO86waXrN6+6zGX9CS9F5nUlq+b27xhdnyQcsri/cIxaH7tGc5x54UGJhf85kjIUAMIacmCeTJ46Dja+dUYqvgD0q79OgqnFZcOIMP9gDJD4IIgo6HFbJvR9RKX5kUJsV9bKPG9RXol05KnrYUIkWP0efaVDUb8HnRlzqZtUyRTDkQ/OeM8oU1rUPm2EB32CZ3NHB+M3arDCFu2ycoFqd8Utg7eJKe9Gsh0FND7Yo4eDt8Q2ed+vRvdTR4ocfdbiZl6IxFDAiTTip+Or+rTmHaDIQw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: oEmhocsO+p3oWWWhR6QViV8/qr3JkewJaWDzCLG7d/T3rzkB7K2/9VmR9Bd8Ai16K727633kLk62TAyHZt9q17ZZvnTw0vJ3s3mCtp8T3LdnDidJo/yHepPyUKPW+Av2pA4qfJiiTw5wQjFLO8k4NoSbkE+Q4/IgKHjXuf8TWhERQC5gE1RyTDGU3wCm76R45F756HVvRCkyTOrZHvpfx28Jum7yyEeJ8ODbV++EveY5LzpO/1dwPnwakQib7iyXG8t8R0ebJXGX4xE4FwaoGnSF9VTX6JOzIqFkY0ro4pQ+rKwCyEp7WbryWmCmJLJmRSk8Dd/pQMbrUtG7qQTIOrCBkuP6xm77JHtd5JWdp2ERvf9RS9kP/v7ML7zK58zQd3zbyoOdol4VYYU9jjt91435A9spGvMWnoNGWz9LYbCGHSDFfBthZIdyUturn8SL+/rEJ+4jqFk9Ydtdqd/G/q+2uCl4pVC5u56RPQNSozCC6vMjfRExfJPLqWjs7ot+fp4uZvBBAMq+Y0/3fqojBk8ytH3+9JhxVIu3tMDVBu7X02VGSvZ/GTYXjYg5InTZ9WnOvpxc+eUBKMp09T1HNf1N2U9T2dIt/2MYzyRKGXM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f885e6d-881f-41ab-c212-08de7e56b603
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 03:40:02.2528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLgTmOfjF49znn3Ba5qAOKvm9+ZK4HQxliVfSj9lWll7ODx0Vebfw1fo6mQLS//ksUgBGCy6QiVn/aqNB6HQOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7910
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603100026
X-Proofpoint-GUID: CKX-Ki1tI9IU9QRl_kWV5HX1fHuVMPKo
X-Proofpoint-ORIG-GUID: CKX-Ki1tI9IU9QRl_kWV5HX1fHuVMPKo
X-Authority-Analysis: v=2.4 cv=U5efzOru c=1 sm=1 tr=0 ts=69af9298 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117
 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22 a=9ZohUdVepsfXsivdpNoA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12272
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyNiBTYWx0ZWRfX39ZsOQLvuLdL
 1nwOhyLQyEQq9DKQArdxu7G22LpbURZzicO+Ubfbk1xpUeSLT7o86v8BCwAkAXZIUoXc6qPKock
 FLQ9J+aD4vVHXi+1uMnfwyL2y+nlW93B3SwnaYLFvxZeSBJ9CIWitxqA7XvjcWt1MD7zMSm7GOE
 dfq9eGp/RMcWF+P/uQDk/4Cglx2zS3XhdjIbKxr5oZX5tKYkZS3WPgvW5HGtQHFCYnu+k+2r5Sp
 KHBju1JjtCnMh5sg9zXbw0wmSli0dRT87iQrfZXU2i5S6uDQuwPqmDu3V5bLdX1a61X5BgBBfYT
 BMH9VIBZmGJ/WG++/mlxItsHv7tGUwX054k9rV+XeEeJbI/BbT+QEkzUprzhlndCYSw2vOuohVX
 RsIVon5H92y2CznjqqkX9HpSQVTTGbQkw2KsXEzHaZDbM6DSZsBQE5+t24i9JUWiJm3JZMGHzmc
 fVj4fredJWuBFWvB/q9oFVJbghj40pEt6AE3G+yM=
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  #syz test diff --git a/mm/slab_common.c b/mm/slab_common.c
 index d5a70a831a2a..73f4668d870d 100644 --- a/mm/slab_common.c +++
 b/mm/slab_common.c
 @@ -1954,8 +1954,14 @@ void kvfree_call_rcu(struct rcu_head *head [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.165.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vznxY-0004NC-7g
Subject: Re: [f2fs-dev] [syzbot] [mm?] [f2fs?] [exfat?] memory leak in
 __kfree_rcu_sheaf
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
From: Harry Yoo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Harry Yoo <harry.yoo@oracle.com>
Cc: Qing Wang <wangqing7171@gmail.com>,
 "Vlastimil Babka \(SUSE\)" <vbabka@kernel.org>, lorenzo.stoakes@oracle.com,
 jannh@google.com, Hao Li <hao.li@linux.dev>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, Liam.Howlett@oracle.com,
 syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com, linux-mm@kvack.org,
 sj1557.seo@samsung.com, pfalcato@suse.de, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, akpm@linux-foundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linkinjeon@kernel.org, vbabka@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 13E59244EE9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-5.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:wangqing7171@gmail.com,m:vbabka@kernel.org,m:lorenzo.stoakes@oracle.com,m:jannh@google.com,m:hao.li@linux.dev,m:syzkaller-bugs@googlegroups.com,m:linux-kernel@vger.kernel.org,m:Liam.Howlett@oracle.com,m:syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com,m:linux-mm@kvack.org,m:sj1557.seo@samsung.com,m:pfalcato@suse.de,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:akpm@linux-foundation.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linkinjeon@kernel.org,m:vbabka@suse.cz,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	SUBJECT_HAS_QUESTION(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,oracle.com,google.com,linux.dev,googlegroups.com,vger.kernel.org,syzkaller.appspotmail.com,kvack.org,samsung.com,suse.de,linux-foundation.org,lists.sourceforge.net,suse.cz];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:replyto,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,cae7809e9dc1459e4e63];
	MISSING_XM_UA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[harry.yoo@oracle.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,oracle.com:-,oracle.onmicrosoft.com:-];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

#syz test

diff --git a/mm/slab_common.c b/mm/slab_common.c
index d5a70a831a2a..73f4668d870d 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1954,8 +1954,14 @@ void kvfree_call_rcu(struct rcu_head *head, void *ptr)
 	if (!head)
 		might_sleep();

-	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && kfree_rcu_sheaf(ptr))
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && kfree_rcu_sheaf(ptr)) {
+		/*
+		 * The object is now queued for deferred freeing via an RCU
+		 * sheaf. Tell kmemleak to ignore it.
+		 */
+		kmemleak_ignore(ptr);
 		return;
+	}

 	// Queue the object but don't yet schedule the batch.
 	if (debug_rcu_head_queue(ptr)) {
diff --git a/mm/slub.c b/mm/slub.c
index 20cb4f3b636d..36f613f48bd0 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -3014,8 +3014,10 @@ static void pcs_flush_all(struct kmem_cache *s)
 		free_empty_sheaf(s, spare);
 	}

-	if (rcu_free)
+	if (rcu_free) {
+		kmemleak_ignore(rcu_free);
 		call_rcu(&rcu_free->rcu_head, rcu_free_sheaf_nobarn);
+	}

 	sheaf_flush_main(s);
 }
@@ -3035,6 +3037,7 @@ static void __pcs_flush_all_cpu(struct kmem_cache *s, unsigned int cpu)
 	}

 	if (pcs->rcu_free) {
+		kmemleak_ignore(pcs->rcu_free);
 		call_rcu(&pcs->rcu_free->rcu_head, rcu_free_sheaf_nobarn);
 		pcs->rcu_free = NULL;
 	}
@@ -4031,8 +4034,10 @@ static void flush_rcu_sheaf(struct work_struct *w)

 	local_unlock(&s->cpu_sheaves->lock);

-	if (rcu_free)
+	if (rcu_free) {
+		kmemleak_ignore(rcu_free);
 		call_rcu(&rcu_free->rcu_head, rcu_free_sheaf_nobarn);
+	}
 }


@@ -5948,8 +5953,15 @@ bool __kfree_rcu_sheaf(struct kmem_cache *s, void *obj)
 	 * we flush before local_unlock to make sure a racing
 	 * flush_all_rcu_sheaves() doesn't miss this sheaf
 	 */
-	if (rcu_sheaf)
+	if (rcu_sheaf) {
+		/*
+		 * TODO: Ideally this should be undone in rcu_free_sheaf,
+		 * when the sheaf is returned to a barn to avoid generating
+		 * false negatives.
+		 */
+		kmemleak_ignore(rcu_sheaf);
 		call_rcu(&rcu_sheaf->rcu_head, rcu_free_sheaf);
+	}

 	local_unlock(&s->cpu_sheaves->lock);

@@ -7538,6 +7550,7 @@ static void early_kmem_cache_node_alloc(int node)
 	slab->freelist = get_freepointer(kmem_cache_node, n);
 	slab->inuse = 1;
 	kmem_cache_node->node[node] = n;
+	kmemleak_alloc(n, sizeof(*n), 1, GFP_NOWAIT);
 	init_kmem_cache_node(n, NULL);
 	inc_slabs_node(kmem_cache_node, node, slab->objects);


base-commit: c23719abc3308df7ed3ad35650ad211fb2d2003d
--
2.43.0




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
